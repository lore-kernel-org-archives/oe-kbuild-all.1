Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3B45157A55
	for <oe-kbuild-all@lists.linux.dev>; Sat, 10 Aug 2024 14:18:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723299508; cv=none; b=KJM4thCJsuIlT6OhhIq3GTcpz4Phn0RBqhI6kOGJT3OCSg0RZLDgCaqitmJta+K9hMBE5AjhmOSjWribcEv5Dva9NsNK+v9KtCWZ8eOHpnAB4iZNspTXf4emcN3mwrSD3gEerkrbLJnwS+E1F5vJkm9gKZ+98htbct5OGYlZuQg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723299508; c=relaxed/simple;
	bh=mnqJSa61RLD0RE36tTtg0kWzR+kp7Gi484K8CiclVZg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=IGoMSYDMm1CDWHGDgfaZHBTBRNVpVKT7T+IGyi+0zeSg0rfBkPEwyOMu3TfOsd2tE2g0aw0A9S5R/w41sm2xIon8TIBnGYFCBnTV0vmIjbLnrtwYZjpQG0yo40YTOSyTigJX41l/coAp6YogTui2m6IkFZeYY+jeOubK9ZXBcVc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lIyxOg4O; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lIyxOg4O"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723299507; x=1754835507;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=mnqJSa61RLD0RE36tTtg0kWzR+kp7Gi484K8CiclVZg=;
  b=lIyxOg4OzFZPXm22l9Xu+cpYDsTMu8SbeDTh7nrX0h1U394dbkw9f4gK
   tK/RMypJhAuKIzIYKkVNDUBCRkTgKTMxqGk/7XpMO/kMNeElwz2Qo8KB+
   Xs23xmGH1XhEohM2E6iWubStX23LuWhlhVBpmoc1huSz6hkrijcQ2CgJG
   dk+At4B5n4db7FIFOneCHXaycU9pM5AFzt7Z1fHbrUfjw77I1fVTJnoLP
   903mD0n5PKxwV+i/nUyu+41EkWxvyoiJQPFXy8yo+dNcD8jHv6+zl7QdQ
   BPhlwiYNQgtMJT9h7gh3v5+W1x3G9BVJ9u17iVBGPNRLAxdaOI7yAhihq
   w==;
X-CSE-ConnectionGUID: Pp/CyiphS+OqLntkXgRB9g==
X-CSE-MsgGUID: u7YfUpzORVacQPZ6YHmbAg==
X-IronPort-AV: E=McAfee;i="6700,10204,11160"; a="38970883"
X-IronPort-AV: E=Sophos;i="6.09,279,1716274800"; 
   d="scan'208";a="38970883"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Aug 2024 07:18:25 -0700
X-CSE-ConnectionGUID: Bos9gpV2RH63M8zVe05Shw==
X-CSE-MsgGUID: JRDocl7kRe+F6zg6t0RPvA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,279,1716274800"; 
   d="scan'208";a="95355829"
Received: from unknown (HELO b6bf6c95bbab) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 10 Aug 2024 07:18:23 -0700
Received: from kbuild by b6bf6c95bbab with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1scmvE-000A0H-34;
	Sat, 10 Aug 2024 14:18:20 +0000
Date: Sat, 10 Aug 2024 22:17:48 +0800
From: kernel test robot <lkp@intel.com>
To: Al Viro <viro@zeniv.linux.org.uk>
Cc: oe-kbuild-all@lists.linux.dev, linux-fsdevel@vger.kernel.org,
	Christian Brauner <brauner@kernel.org>
Subject: [viro-vfs:work.fd 3/39] fs/open.c:1654:1: error: expected
 declaration or statement at end of input
Message-ID: <202408102227.Zok7P1xp-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/viro/vfs.git work.fd
head:   9d58a36411c167b4126de90e5fe844270b858082
commit: f3270beef0d85432783be702bb9509879415e747 [3/39] struct fd: representation change
config: openrisc-allnoconfig (https://download.01.org/0day-ci/archive/20240810/202408102227.Zok7P1xp-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240810/202408102227.Zok7P1xp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408102227.Zok7P1xp-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from fs/open.c:10:
   include/linux/file.h: In function 'fdput':
   include/linux/file.h:60:34: error: expected ')' before ';' token
      60 |                 fput(fd_file(fd));
         |                     ~            ^
         |                                  )
   include/linux/file.h:60:35: error: expected ';' before '}' token
      60 |                 fput(fd_file(fd));
         |                                   ^
         |                                   ;
      61 | }
         | ~                                  
   include/linux/file.h: In function 'fdput_pos':
   include/linux/file.h:94:43: error: expected ')' before ';' token
      94 |                 __f_unlock_pos(fd_file(f));
         |                               ~           ^
         |                                           )
   include/linux/file.h:95:18: error: expected ';' before '}' token
      95 |         fdput(f);
         |                  ^
         |                  ;
      96 | }
         | ~                 
   fs/open.c: In function 'do_sys_ftruncate':
   fs/open.c:196:25: error: expected ')' before 'return'
     196 |         if (!fd_file(f))
         |            ~            ^
         |                         )
     197 |                 return -EBADF;
         |                 ~~~~~~   
   fs/open.c:196:9: note: '-Wmisleading-indentation' is disabled from this point onwards, since column-tracking was disabled due to the size of the code/headers
     196 |         if (!fd_file(f))
         |         ^~
   fs/open.c:196:9: note: adding '-flarge-source-files' will allow for more column-tracking support, at the expense of compilation time and memory
>> fs/open.c:1654:1: error: expected declaration or statement at end of input
    1654 | EXPORT_SYMBOL(stream_open);
         | ^~~~~~~~~~~~~
   fs/open.c:191:13: warning: unused variable 'error' [-Wunused-variable]
     191 |         int error;
         |             ^~~~~
   fs/open.c:1655: warning: control reaches end of non-void function [-Wreturn-type]
--
   In file included from fs/read_write.c:12:
   include/linux/file.h: In function 'fdput':
   include/linux/file.h:60:34: error: expected ')' before ';' token
      60 |                 fput(fd_file(fd));
         |                     ~            ^
         |                                  )
   include/linux/file.h:60:35: error: expected ';' before '}' token
      60 |                 fput(fd_file(fd));
         |                                   ^
         |                                   ;
      61 | }
         | ~                                  
   include/linux/file.h: In function 'fdput_pos':
   include/linux/file.h:94:43: error: expected ')' before ';' token
      94 |                 __f_unlock_pos(fd_file(f));
         |                               ~           ^
         |                                           )
   include/linux/file.h:95:18: error: expected ';' before '}' token
      95 |         fdput(f);
         |                  ^
         |                  ;
      96 | }
         | ~                 
   fs/read_write.c: In function 'ksys_lseek':
   fs/read_write.c:297:25: error: expected ')' before 'return'
     297 |         if (!fd_file(f))
         |            ~            ^
         |                         )
     298 |                 return -EBADF;
         |                 ~~~~~~   
   fs/read_write.c:297:9: note: '-Wmisleading-indentation' is disabled from this point onwards, since column-tracking was disabled due to the size of the code/headers
     297 |         if (!fd_file(f))
         |         ^~
   fs/read_write.c:297:9: note: adding '-flarge-source-files' will allow for more column-tracking support, at the expense of compilation time and memory
>> fs/read_write.c:1754:1: error: expected declaration or statement at end of input
    1754 | }
         | ^
   fs/read_write.c:295:15: warning: unused variable 'retval' [-Wunused-variable]
     295 |         off_t retval;
         |               ^~~~~~
   fs/read_write.c:1754:1: warning: no return statement in function returning non-void [-Wreturn-type]
    1754 | }
         | ^
   fs/read_write.c: At top level:
   fs/read_write.c:293:14: warning: 'ksys_lseek' defined but not used [-Wunused-function]
     293 | static off_t ksys_lseek(unsigned int fd, off_t offset, unsigned int whence)
         |              ^~~~~~~~~~
--
   In file included from include/linux/blkdev.h:27,
                    from fs/stat.c:8:
   include/linux/file.h: In function 'fdput':
   include/linux/file.h:60:34: error: expected ')' before ';' token
      60 |                 fput(fd_file(fd));
         |                     ~            ^
         |                                  )
   include/linux/file.h:60:35: error: expected ';' before '}' token
      60 |                 fput(fd_file(fd));
         |                                   ^
         |                                   ;
      61 | }
         | ~                                  
   include/linux/file.h: In function 'fdput_pos':
   include/linux/file.h:94:43: error: expected ')' before ';' token
      94 |                 __f_unlock_pos(fd_file(f));
         |                               ~           ^
         |                                           )
   include/linux/file.h:95:18: error: expected ';' before '}' token
      95 |         fdput(f);
         |                  ^
         |                  ;
      96 | }
         | ~                 
   fs/stat.c: In function 'vfs_fstat':
   fs/stat.c:227:25: error: expected ')' before 'return'
     227 |         if (!fd_file(f))
         |            ~            ^
         |                         )
     228 |                 return -EBADF;
         |                 ~~~~~~   
   fs/stat.c:227:9: note: '-Wmisleading-indentation' is disabled from this point onwards, since column-tracking was disabled due to the size of the code/headers
     227 |         if (!fd_file(f))
         |         ^~
   fs/stat.c:227:9: note: adding '-flarge-source-files' will allow for more column-tracking support, at the expense of compilation time and memory
>> fs/stat.c:952:1: error: expected declaration or statement at end of input
     952 | EXPORT_SYMBOL(inode_set_bytes);
         | ^~~~~~~~~~~~~
   fs/stat.c:224:13: warning: unused variable 'error' [-Wunused-variable]
     224 |         int error;
         |             ^~~~~
   fs/stat.c:953: warning: control reaches end of non-void function [-Wreturn-type]
--
   In file included from include/linux/kernel_read_file.h:5,
                    from include/linux/security.h:26,
                    from fs/namei.c:29:
   include/linux/file.h: In function 'fdput':
   include/linux/file.h:60:34: error: expected ')' before ';' token
      60 |                 fput(fd_file(fd));
         |                     ~            ^
         |                                  )
   include/linux/file.h:60:35: error: expected ';' before '}' token
      60 |                 fput(fd_file(fd));
         |                                   ^
         |                                   ;
      61 | }
         | ~                                  
   include/linux/file.h: In function 'fdput_pos':
   include/linux/file.h:94:43: error: expected ')' before ';' token
      94 |                 __f_unlock_pos(fd_file(f));
         |                               ~           ^
         |                                           )
   include/linux/file.h:95:18: error: expected ';' before '}' token
      95 |         fdput(f);
         |                  ^
         |                  ;
      96 | }
         | ~                 
   fs/namei.c: In function 'path_init':
   fs/namei.c:2495:33: error: expected ')' before 'return'
    2495 |                 if (!fd_file(f))
         |                    ~            ^
         |                                 )
    2496 |                         return ERR_PTR(-EBADF);
         |                         ~~~~~~   
   fs/namei.c:2495:17: note: '-Wmisleading-indentation' is disabled from this point onwards, since column-tracking was disabled due to the size of the code/headers
    2495 |                 if (!fd_file(f))
         |                 ^~
   fs/namei.c:2495:17: note: adding '-flarge-source-files' will allow for more column-tracking support, at the expense of compilation time and memory
>> fs/namei.c:5340:1: error: expected declaration or statement at end of input
    5340 | EXPORT_SYMBOL(page_symlink_inode_operations);
         | ^~~~~~~~~~~~~
   fs/namei.c:2493:32: warning: unused variable 'dentry' [-Wunused-variable]
    2493 |                 struct dentry *dentry;
         |                                ^~~~~~
>> fs/namei.c:5340:1: error: expected declaration or statement at end of input
    5340 | EXPORT_SYMBOL(page_symlink_inode_operations);
         | ^~~~~~~~~~~~~
   fs/namei.c: At top level:
   fs/namei.c:2425:20: warning: 'path_init' defined but not used [-Wunused-function]
    2425 | static const char *path_init(struct nameidata *nd, unsigned flags)
         |                    ^~~~~~~~~
   fs/namei.c:2329:12: warning: 'link_path_walk' defined but not used [-Wunused-function]
    2329 | static int link_path_walk(const char *name, struct nameidata *nd)
         |            ^~~~~~~~~~~~~~
   fs/namei.c:1243:12: warning: 'may_create_in_sticky' defined but not used [-Wunused-function]
    1243 | static int may_create_in_sticky(struct mnt_idmap *idmap, struct nameidata *nd,
         |            ^~~~~~~~~~~~~~~~~~~~
   fs/namei.c:883:12: warning: 'complete_walk' defined but not used [-Wunused-function]
     883 | static int complete_walk(struct nameidata *nd)
         |            ^~~~~~~~~~~~~
   fs/namei.c:687:13: warning: 'terminate_walk' defined but not used [-Wunused-function]
     687 | static void terminate_walk(struct nameidata *nd)
         |             ^~~~~~~~~~~~~~
   fs/namei.c:627:13: warning: 'restore_nameidata' defined but not used [-Wunused-function]
     627 | static void restore_nameidata(void)
         |             ^~~~~~~~~~~~~~~~~
--
   In file included from include/linux/kernel_read_file.h:5,
                    from include/linux/security.h:26,
                    from include/linux/perf_event.h:62,
                    from include/linux/trace_events.h:10,
                    from include/trace/syscall.h:7,
                    from include/linux/syscalls.h:93,
                    from fs/fcntl.c:8:
   include/linux/file.h: In function 'fdput':
   include/linux/file.h:60:34: error: expected ')' before ';' token
      60 |                 fput(fd_file(fd));
         |                     ~            ^
         |                                  )
   include/linux/file.h:60:35: error: expected ';' before '}' token
      60 |                 fput(fd_file(fd));
         |                                   ^
         |                                   ;
      61 | }
         | ~                                  
   include/linux/file.h: In function 'fdput_pos':
   include/linux/file.h:94:43: error: expected ')' before ';' token
      94 |                 __f_unlock_pos(fd_file(f));
         |                               ~           ^
         |                                           )
   include/linux/file.h:95:18: error: expected ';' before '}' token
      95 |         fdput(f);
         |                  ^
         |                  ;
      96 | }
         | ~                 
   fs/fcntl.c: In function 'f_dupfd_query':
   fs/fcntl.c:343:34: error: expected ')' before ';' token
     343 |         return fd_file(f) == filp;
         |                                  ^
         |                                  )
   include/linux/file.h:49:20: note: to match this '('
      49 | #define fd_file(f) ((struct file *)((f).word & ~(FDPUT_FPUT|FDPUT_POS_UNLOCK))
         |                    ^
   fs/fcntl.c:343:16: note: in expansion of macro 'fd_file'
     343 |         return fd_file(f) == filp;
         |                ^~~~~~~
   fs/fcntl.c:343:35: error: expected ';' before '}' token
     343 |         return fd_file(f) == filp;
         |                                   ^
         |                                   ;
     344 | }
         | ~                                  
   fs/fcntl.c: In function '__do_sys_fcntl':
   fs/fcntl.c:482:25: error: expected ')' before 'goto'
     482 |         if (!fd_file(f))
         |            ~            ^
         |                         )
     483 |                 goto out;
         |                 ~~~~     
   fs/fcntl.c:482:9: note: '-Wmisleading-indentation' is disabled from this point onwards, since column-tracking was disabled due to the size of the code/headers
     482 |         if (!fd_file(f))
         |         ^~
   fs/fcntl.c:482:9: note: adding '-flarge-source-files' will allow for more column-tracking support, at the expense of compilation time and memory
>> fs/fcntl.c:1073:1: error: expected declaration or statement at end of input
    1073 | module_init(fcntl_init)
         | ^~~~~~~~~~~
   fs/fcntl.c:480:14: warning: unused variable 'err' [-Wunused-variable]
     480 |         long err = -EBADF;
         |              ^~~
   fs/fcntl.c:1073:1: warning: no return statement in function returning non-void [-Wreturn-type]
    1073 | module_init(fcntl_init)
         | ^~~~~~~~~~~
   fs/fcntl.c: At top level:
   fs/fcntl.c:463:12: warning: 'check_fcntl_cmd' defined but not used [-Wunused-function]
     463 | static int check_fcntl_cmd(unsigned cmd)
         |            ^~~~~~~~~~~~~~~
   fs/fcntl.c:346:13: warning: 'do_fcntl' defined but not used [-Wunused-function]
     346 | static long do_fcntl(int fd, unsigned int cmd, unsigned long arg,
         |             ^~~~~~~~
--
   In file included from include/linux/kernel_read_file.h:5,
                    from include/linux/security.h:26,
                    from include/linux/perf_event.h:62,
                    from include/linux/trace_events.h:10,
                    from include/trace/syscall.h:7,
                    from include/linux/syscalls.h:93,
                    from fs/ioctl.c:8:
   include/linux/file.h: In function 'fdput':
   include/linux/file.h:60:34: error: expected ')' before ';' token
      60 |                 fput(fd_file(fd));
         |                     ~            ^
         |                                  )
   include/linux/file.h:60:35: error: expected ';' before '}' token
      60 |                 fput(fd_file(fd));
         |                                   ^
         |                                   ;
      61 | }
         | ~                                  
   include/linux/file.h: In function 'fdput_pos':
   include/linux/file.h:94:43: error: expected ')' before ';' token
      94 |                 __f_unlock_pos(fd_file(f));
         |                               ~           ^
         |                                           )
   include/linux/file.h:95:18: error: expected ';' before '}' token
      95 |         fdput(f);
         |                  ^
         |                  ;
      96 | }
         | ~                 
   fs/ioctl.c: In function 'ioctl_file_clone':
   fs/ioctl.c:238:32: error: expected ')' before 'return'
     238 |         if (!fd_file(src_file))
         |            ~                   ^
         |                                )
     239 |                 return -EBADF;
         |                 ~~~~~~          
   fs/ioctl.c:238:9: note: '-Wmisleading-indentation' is disabled from this point onwards, since column-tracking was disabled due to the size of the code/headers
     238 |         if (!fd_file(src_file))
         |         ^~
   fs/ioctl.c:238:9: note: adding '-flarge-source-files' will allow for more column-tracking support, at the expense of compilation time and memory
>> fs/ioctl.c:912:1: error: expected declaration or statement at end of input
     912 | }
         | ^
   fs/ioctl.c:236:13: warning: unused variable 'ret' [-Wunused-variable]
     236 |         int ret;
         |             ^~~
   fs/ioctl.c:235:16: warning: unused variable 'cloned' [-Wunused-variable]
     235 |         loff_t cloned;
         |                ^~~~~~
   fs/ioctl.c:912:1: warning: no return statement in function returning non-void [-Wreturn-type]
     912 | }
         | ^
   fs/ioctl.c: At top level:
   fs/ioctl.c:231:13: warning: 'ioctl_file_clone' defined but not used [-Wunused-function]
     231 | static long ioctl_file_clone(struct file *dst_file, unsigned long srcfd,
         |             ^~~~~~~~~~~~~~~~
   fs/ioctl.c:200:12: warning: 'ioctl_fiemap' defined but not used [-Wunused-function]
     200 | static int ioctl_fiemap(struct file *filp, struct fiemap __user *ufiemap)
         |            ^~~~~~~~~~~~
   fs/ioctl.c:59:12: warning: 'ioctl_fibmap' defined but not used [-Wunused-function]
      59 | static int ioctl_fibmap(struct file *filp, int __user *p)
         |            ^~~~~~~~~~~~
..


vim +1654 fs/open.c

10dce8af34226d Kirill Smelkov 2019-03-26  1653  
10dce8af34226d Kirill Smelkov 2019-03-26 @1654  EXPORT_SYMBOL(stream_open);

:::::: The code at line 1654 was first introduced by commit
:::::: 10dce8af34226d90fa56746a934f8da5dcdba3df fs: stream_open - opener for stream-like files so that read and write can run simultaneously without deadlock

:::::: TO: Kirill Smelkov <kirr@nexedi.com>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
