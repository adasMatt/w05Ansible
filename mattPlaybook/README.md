# Ansible Playbook Assignment

Don't forget the "-b" ;)

Run playbook with this command after ensuring you are using the correct IP addresses for you nodes:

`ansible-playbook -b play.yml -i inventory.ini`

## Other Notes/Oddities
### From play.yml
I had to recreate the directory manually just once with the server I was working in with this. See play2.yml for another related comment.  
```
- name: Creates directory  
    file:  
    path: /var/www/html  
    state: directory
```

### From play2.yml
I originally put path: /var/www/html/ in the delete html file task, I believe that destroyed the entire directory but not entirely certain. Also not entirely sure why installing Apache in play.yml doesn't recreate /var/www/html.
    - name: delete html file
      file:
        state: absent
        path: /var/www/html/*