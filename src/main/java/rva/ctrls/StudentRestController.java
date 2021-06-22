package rva.ctrls;

import java.util.Collection;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.web.bind.annotation.CrossOrigin;
/*import org.springframework.transaction.annotation.Transactional;*/
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import rva.jpa.Departman;
import rva.jpa.Student;
import rva.repository.DepartmanRepository;
import rva.repository.StudentRepository;

@CrossOrigin
@RestController
@Api(tags = {"Klijent CRUD operacije"})
public class StudentRestController {
	@Autowired
	private JdbcTemplate jdbcTemplate;
	@Autowired
	private StudentRepository studentRepository;
    @Autowired
	private DepartmanRepository departmanRepository;
    
    @GetMapping("student")
	@ApiOperation(value = "Vraca kolekciju svih studenta iz baze podataka")
	public Collection<Student> getStudenti(){
		return studentRepository.findAll();
    }
    
    @GetMapping("student/{id}")
    @ApiOperation(value = "Vraca studenta iz baze podataka ciji je id vrednost prosledjena kao path varijabla")
    public Student getStudent(@PathVariable("id") Integer id){
	    return studentRepository.getOne(id);
    }
    
    @GetMapping("studentiZaDepartmanId/{id}")
	@ApiOperation(value = "Vraca kolekciju svih studenata za departman iz baze podataka koji imaju id vrednost kao prosledjena path varijabla")
    public Collection<Student> studentiPoDepartmanuId(@PathVariable("id") Integer id){
	Departman d=departmanRepository.getOne(id);
	return studentRepository.findByDepartman(d);
    }
    
    @GetMapping("studentBrojIndeksa/{brojIndeksa}")
	@ApiOperation(value = "Vraca studenta iz baze podataka cija je indeks vrednost prosledjena kao path varijabla")

	 public Collection<Student> getStudentByBrojIndeksa(@PathVariable("brojIndeksa") String brojIndeksa)
	 {
		return studentRepository.findByBrojIndeksaContainingIgnoreCase(brojIndeksa);
	 }
    
    @PostMapping("student")
	@ApiOperation(value = "Upisuje studenta u bazu podataka")

	public ResponseEntity<Student> insertStudent(@RequestBody Student student) {
		if(!studentRepository.existsById(student.getId())) {
			studentRepository.save(student);
			return new ResponseEntity<Student>(HttpStatus.OK);
		}
		return new ResponseEntity<Student>(HttpStatus.CONFLICT);
	}
    
    @PutMapping("student")
	@ApiOperation(value = "Modifikuje postojeceg studenta u bazi podataka")
    public ResponseEntity<Student> updateStudent(@RequestBody Student student){
	if(!studentRepository.existsById(student.getId())){
		return new ResponseEntity<Student>(HttpStatus.NO_CONTENT);
	}
	studentRepository.save(student);	
		return new ResponseEntity<Student>(HttpStatus.OK);
     }
    
    /*@Transactional*/
	@DeleteMapping("student/{id}")
	@ApiOperation(value = "Brisanjestudenta iz baze podataka cija je id vrednost prosledjena kao path varijabla")
    public  ResponseEntity<Student> deleteStudent(@PathVariable("id") Integer id){
	if(!studentRepository.existsById(id)){
		return new ResponseEntity<Student>(HttpStatus.NO_CONTENT);
	}
	studentRepository.deleteById(id);
	if(id==-100){
		jdbcTemplate.execute(
			"INSERT INTO \"student\"(\"id\", \"ime\", \"prezime\", \"broj_indeksa\", \"status\", \"departman\")"
			+ "VALUES (-100, 'T', 'T', 'ii', 1, 1)"
		);
	}
	return new ResponseEntity<Student>(HttpStatus.OK);
}
}
