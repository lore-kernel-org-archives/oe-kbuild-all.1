Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02E0530DEC8
	for <oe-kbuild-all@lists.linux.dev>; Thu, 20 Nov 2025 09:24:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763630694; cv=none; b=f5E7eJ/CGyTjz9Kcy6C3LGAqTAvd7uum1wHim4sLY/BRrh6YuqNqlEJGMzYp79iCHJ77GfrPrp89ujAj9xTEOPylLa0yAXciw0lsfAUPpY3YWp+TuwYHnCj9BwEqqPNpbiuuQ/Oxva3qQKQ/qekt1mXWzfMONzzqfSBnGicukcc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763630694; c=relaxed/simple;
	bh=lo0yqzuBQp6mRBjaAtOwSi7mrpunq1zsgwjmQEjm6Jc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=gDjtKZSB+LsEIpzxRG2UEUbOg5fwQI8nFUoUlSSPVlEEvPnrR3oajsNbhth3fNsr2ZSaytn5bibX+Q2bEWl9o0V/gZfXLuEtIbn6cdWhec/3F4uh41EHJn9dMKcACDm43rOY3MUWbDWLePjmHvHxTrQiZ8AIPzoZZhrvtpByUpo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Dj866q4Q; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Dj866q4Q"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763630692; x=1795166692;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=lo0yqzuBQp6mRBjaAtOwSi7mrpunq1zsgwjmQEjm6Jc=;
  b=Dj866q4QSiXyDbuDU2qRFOaoibMIE/QoZH6v+xj0tnifm+SXy+H7CPdg
   9Hsr9MWgOfFc4OiN3vmrQd/T1DD/qMZcWzGBmBEw+AI+3gnVrIaCK14HE
   XVlMTrmopfLeVZIuz85tWzIMryv+ARDo/Y9UnQsAEqP/1eelUVPhEP4rH
   b7eJltfHuP0terlPSZ/6RDfYLsjqEJQVm2o1eaxR64igiG/nBo5ku2q2k
   G224DIt0ILNG7+XSOGmGkW0y4lire2YXaVhoPz30+UeFXu509GJmvDSMF
   xAmG1RlaCznMFZd9jSMoTaKb30xTYhBvrv5URD9Zov6GdlCbaSCGmdicq
   g==;
X-CSE-ConnectionGUID: 2b4CJVezR1iVWnQ2jPSgBg==
X-CSE-MsgGUID: EADF9ZCBR8eIXJ4jGy6S0w==
X-IronPort-AV: E=McAfee;i="6800,10657,11618"; a="65572009"
X-IronPort-AV: E=Sophos;i="6.19,317,1754982000"; 
   d="scan'208";a="65572009"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Nov 2025 01:24:50 -0800
X-CSE-ConnectionGUID: r4c6alSQSdOHTHmMZ2LTkw==
X-CSE-MsgGUID: xRrPnGhtRBmWynImsZmfEA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,317,1754982000"; 
   d="scan'208";a="221957869"
Received: from lkp-server01.sh.intel.com (HELO adf6d29aa8d9) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 20 Nov 2025 01:24:49 -0800
Received: from kbuild by adf6d29aa8d9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vM0uE-0003oP-01;
	Thu, 20 Nov 2025 09:24:46 +0000
Date: Thu, 20 Nov 2025 17:24:05 +0800
From: kernel test robot <lkp@intel.com>
To: Amir Goldstein <amir73il@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [amir73il:vfs-6.19.ovl 43/57] include/linux/cleanup.h:228:38:
 warning: cast to pointer from integer of different size
Message-ID: <202511201700.AqyZbPhS-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

tree:   https://github.com/amir73il/linux vfs-6.19.ovl
head:   dd93300969b6b87e330947921579bb32d6b02cc1
commit: ff652575590b634a780d46e6500e88f4e162f7db [43/57] ovl: add ovl_override_creator_creds cred guard
config: sparc64-randconfig-6002-20251120 (https://download.01.org/0day-ci/archive/20251120/202511201700.AqyZbPhS-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 13.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251120/202511201700.AqyZbPhS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511201700.AqyZbPhS-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/preempt.h:11,
                    from include/linux/spinlock.h:56,
                    from include/linux/wait.h:9,
                    from include/linux/wait_bit.h:8,
                    from include/linux/fs.h:7,
                    from fs/overlayfs/dir.c:7:
   include/linux/cleanup.h:283:9: error: unknown type name 'class_override_creds_t'
     283 | typedef class_##_name##_t class_##_name##ext##_t;                       \
         |         ^~~~~~
   fs/overlayfs/overlayfs.h:459:1: note: in expansion of macro 'EXTEND_CLASS'
     459 | EXTEND_CLASS(override_creds, _ovl, ovl_override_creds(sb), struct super_block *sb)
         | ^~~~~~~~~~~~
   include/linux/cleanup.h:284:52: error: unknown type name 'class_override_creds_t'; did you mean 'class_override_creds_ovl_t'?
     284 | static inline void class_##_name##ext##_destructor(class_##_name##_t *p)\
         |                                                    ^~~~~~
   fs/overlayfs/overlayfs.h:459:1: note: in expansion of macro 'EXTEND_CLASS'
     459 | EXTEND_CLASS(override_creds, _ovl, ovl_override_creds(sb), struct super_block *sb)
         | ^~~~~~~~~~~~
   include/linux/cleanup.h:286:15: error: unknown type name 'class_override_creds_t'
     286 | static inline class_##_name##_t class_##_name##ext##_constructor(_init_args) \
         |               ^~~~~~
   fs/overlayfs/overlayfs.h:459:1: note: in expansion of macro 'EXTEND_CLASS'
     459 | EXTEND_CLASS(override_creds, _ovl, ovl_override_creds(sb), struct super_block *sb)
         | ^~~~~~~~~~~~
   fs/overlayfs/overlayfs.h: In function 'class_override_creds_ovl_constructor':
   include/linux/cleanup.h:287:3: error: unknown type name 'class_override_creds_t'; did you mean 'class_override_creds_ovl_t'?
     287 | { class_##_name##_t t = _init; return t; }
         |   ^~~~~~
   fs/overlayfs/overlayfs.h:459:1: note: in expansion of macro 'EXTEND_CLASS'
     459 | EXTEND_CLASS(override_creds, _ovl, ovl_override_creds(sb), struct super_block *sb)
         | ^~~~~~~~~~~~
   fs/overlayfs/overlayfs.h:459:36: warning: initialization of 'int' from 'const struct cred *' makes integer from pointer without a cast [-Wint-conversion]
     459 | EXTEND_CLASS(override_creds, _ovl, ovl_override_creds(sb), struct super_block *sb)
         |                                    ^~~~~~~~~~~~~~~~~~
   include/linux/cleanup.h:287:25: note: in definition of macro 'EXTEND_CLASS'
     287 | { class_##_name##_t t = _init; return t; }
         |                         ^~~~~
   fs/overlayfs/dir.c: In function 'ovl_override_creator_creds':
   include/linux/cleanup.h:290:9: error: unknown type name 'class_prepare_creds_t'
     290 |         class_##_name##_t var __cleanup(class_##_name##_destructor) =   \
         |         ^~~~~~
   fs/overlayfs/dir.c:591:9: note: in expansion of macro 'CLASS'
     591 |         CLASS(prepare_creds, override_cred)();
         |         ^~~~~
   fs/overlayfs/dir.c:591:9: error: cleanup argument not a function
   include/linux/cleanup.h:291:17: error: implicit declaration of function 'class_prepare_creds_constructor'; did you mean 'class_percpu_read_constructor'? [-Werror=implicit-function-declaration]
     291 |                 class_##_name##_constructor
         |                 ^~~~~~
   fs/overlayfs/dir.c:591:9: note: in expansion of macro 'CLASS'
     591 |         CLASS(prepare_creds, override_cred)();
         |         ^~~~~
   fs/overlayfs/dir.c:595:22: error: invalid type argument of '->' (have 'int')
     595 |         override_cred->fsuid = inode->i_uid;
         |                      ^~
   fs/overlayfs/dir.c:596:22: error: invalid type argument of '->' (have 'int')
     596 |         override_cred->fsgid = inode->i_gid;
         |                      ^~
   fs/overlayfs/dir.c:599:62: warning: passing argument 5 of 'security_dentry_create_files_as' makes pointer from integer without a cast [-Wint-conversion]
     599 |                                               current->cred, override_cred);
         |                                                              ^~~~~~~~~~~~~
         |                                                              |
         |                                                              int
   In file included from fs/overlayfs/dir.c:10:
   include/linux/security.h:877:64: note: expected 'struct cred *' but argument is of type 'int'
     877 |                                                   struct cred *new)
         |                                                   ~~~~~~~~~~~~~^~~
   include/linux/cleanup.h:219:24: warning: assignment to 'int' from 'void *' makes integer from pointer without a cast [-Wint-conversion]
     219 |                 *__ptr = nullvalue;         \
         |                        ^
   include/linux/cleanup.h:228:69: note: in expansion of macro '__get_and_null'
     228 |         ((typeof(p)) __must_check_fn((__force const volatile void *)__get_and_null(p, NULL)))
         |                                                                     ^~~~~~~~~~~~~~
   fs/overlayfs/dir.c:603:31: note: in expansion of macro 'no_free_ptr'
     603 |         return override_creds(no_free_ptr(override_cred));
         |                               ^~~~~~~~~~~
>> include/linux/cleanup.h:228:38: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
     228 |         ((typeof(p)) __must_check_fn((__force const volatile void *)__get_and_null(p, NULL)))
         |                                      ^
   fs/overlayfs/dir.c:603:31: note: in expansion of macro 'no_free_ptr'
     603 |         return override_creds(no_free_ptr(override_cred));
         |                               ^~~~~~~~~~~
>> include/linux/cleanup.h:228:10: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
     228 |         ((typeof(p)) __must_check_fn((__force const volatile void *)__get_and_null(p, NULL)))
         |          ^
   fs/overlayfs/dir.c:603:31: note: in expansion of macro 'no_free_ptr'
     603 |         return override_creds(no_free_ptr(override_cred));
         |                               ^~~~~~~~~~~
   include/linux/cleanup.h:228:10: warning: passing argument 1 of 'override_creds' makes pointer from integer without a cast [-Wint-conversion]
     228 |         ((typeof(p)) __must_check_fn((__force const volatile void *)__get_and_null(p, NULL)))
         |         ~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |          |
         |          int
   fs/overlayfs/dir.c:603:31: note: in expansion of macro 'no_free_ptr'
     603 |         return override_creds(no_free_ptr(override_cred));
         |                               ^~~~~~~~~~~
   In file included from include/linux/sched/signal.h:10,
                    from include/linux/rcuwait.h:6,
                    from include/linux/percpu-rwsem.h:7,
                    from include/linux/fs.h:34:
   include/linux/cred.h:173:68: note: expected 'const struct cred *' but argument is of type 'int'
     173 | static inline const struct cred *override_creds(const struct cred *override_cred)
         |                                                 ~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~
   fs/overlayfs/dir.c: In function 'ovl_create_or_link':
   fs/overlayfs/dir.c:660:9: error: cleanup argument not a function
     660 |         scoped_class(override_creds_ovl, old_cred, dentry->d_sb) {
         |         ^~~~~~~~~~~~
   include/linux/cleanup.h:403:28: error: implicit declaration of function 'class_override_creds_ovl_lock_ptr'; did you mean 'class_override_creds_ovl_constructor'? [-Werror=implicit-function-declaration]
     403 | #define __guard_ptr(_name) class_##_name##_lock_ptr
         |                            ^~~~~~
   include/linux/cleanup.h:295:14: note: in expansion of macro '__guard_ptr'
     295 |              __guard_ptr(_name)(&var) || !__is_cond_ptr(_name); \
         |              ^~~~~~~~~~~
   fs/overlayfs/dir.c:660:9: note: in expansion of macro 'scoped_class'
     660 |         scoped_class(override_creds_ovl, old_cred, dentry->d_sb) {
         |         ^~~~~~~~~~~~
   include/linux/cleanup.h:405:30: error: 'class_override_creds_ovl_is_conditional' undeclared (first use in this function); did you mean 'class_override_creds_ovl_constructor'?
     405 | #define __is_cond_ptr(_name) class_##_name##_is_conditional
         |                              ^~~~~~
   include/linux/cleanup.h:295:43: note: in expansion of macro '__is_cond_ptr'
     295 |              __guard_ptr(_name)(&var) || !__is_cond_ptr(_name); \
         |                                           ^~~~~~~~~~~~~
   fs/overlayfs/dir.c:660:9: note: in expansion of macro 'scoped_class'
     660 |         scoped_class(override_creds_ovl, old_cred, dentry->d_sb) {
         |         ^~~~~~~~~~~~
   include/linux/cleanup.h:405:30: note: each undeclared identifier is reported only once for each function it appears in
     405 | #define __is_cond_ptr(_name) class_##_name##_is_conditional
         |                              ^~~~~~
   include/linux/cleanup.h:295:43: note: in expansion of macro '__is_cond_ptr'
     295 |              __guard_ptr(_name)(&var) || !__is_cond_ptr(_name); \
         |                                           ^~~~~~~~~~~~~
   fs/overlayfs/dir.c:660:9: note: in expansion of macro 'scoped_class'
     660 |         scoped_class(override_creds_ovl, old_cred, dentry->d_sb) {
         |         ^~~~~~~~~~~~
   fs/overlayfs/dir.c:685:89: warning: passing argument 4 of 'ovl_setup_cred_for_create' makes pointer from integer without a cast [-Wint-conversion]
     685 |                         new_cred = ovl_setup_cred_for_create(dentry, inode, attr->mode, old_cred);
         |                                                                                         ^~~~~~~~
         |                                                                                         |
         |                                                                                         class_override_creds_ovl_t {aka int}
   fs/overlayfs/dir.c:623:72: note: expected 'const struct cred *' but argument is of type 'class_override_creds_ovl_t' {aka 'int'}
     623 |                                                     const struct cred *old_cred)
         |                                                     ~~~~~~~~~~~~~~~~~~~^~~~~~~~
   fs/overlayfs/dir.c: In function 'ovl_set_link_redirect':
   fs/overlayfs/dir.c:770:9: error: cleanup argument not a function
     770 |         with_ovl_creds(dentry->d_sb)
         |         ^~~~~~~~~~~~~~
   include/linux/cleanup.h:405:30: error: 'class_override_creds_ovl_is_conditional' undeclared (first use in this function); did you mean 'class_override_creds_ovl_constructor'?
     405 | #define __is_cond_ptr(_name) class_##_name##_is_conditional
         |                              ^~~~~~
   include/linux/cleanup.h:295:43: note: in expansion of macro '__is_cond_ptr'
     295 |              __guard_ptr(_name)(&var) || !__is_cond_ptr(_name); \
         |                                           ^~~~~~~~~~~~~
   fs/overlayfs/overlayfs.h:462:9: note: in expansion of macro 'scoped_class'
     462 |         scoped_class(override_creds_ovl, __UNIQUE_ID(label), sb)
         |         ^~~~~~~~~~~~
   fs/overlayfs/dir.c:770:9: note: in expansion of macro 'with_ovl_creds'
     770 |         with_ovl_creds(dentry->d_sb)
         |         ^~~~~~~~~~~~~~
   fs/overlayfs/dir.c: In function 'ovl_do_remove':
   fs/overlayfs/dir.c:964:9: error: cleanup argument not a function
     964 |         with_ovl_creds(dentry->d_sb) {
         |         ^~~~~~~~~~~~~~
   include/linux/cleanup.h:405:30: error: 'class_override_creds_ovl_is_conditional' undeclared (first use in this function); did you mean 'class_override_creds_ovl_constructor'?
     405 | #define __is_cond_ptr(_name) class_##_name##_is_conditional
         |                              ^~~~~~
   include/linux/cleanup.h:295:43: note: in expansion of macro '__is_cond_ptr'
     295 |              __guard_ptr(_name)(&var) || !__is_cond_ptr(_name); \
         |                                           ^~~~~~~~~~~~~
   fs/overlayfs/overlayfs.h:462:9: note: in expansion of macro 'scoped_class'
     462 |         scoped_class(override_creds_ovl, __UNIQUE_ID(label), sb)
         |         ^~~~~~~~~~~~
   fs/overlayfs/dir.c:964:9: note: in expansion of macro 'with_ovl_creds'
     964 |         with_ovl_creds(dentry->d_sb) {
         |         ^~~~~~~~~~~~~~
   fs/overlayfs/dir.c: In function 'ovl_rename':
   fs/overlayfs/dir.c:1371:17: error: cleanup argument not a function
    1371 |                 with_ovl_creds(old->d_sb)
         |                 ^~~~~~~~~~~~~~
   include/linux/cleanup.h:405:30: error: 'class_override_creds_ovl_is_conditional' undeclared (first use in this function); did you mean 'class_override_creds_ovl_constructor'?
     405 | #define __is_cond_ptr(_name) class_##_name##_is_conditional
         |                              ^~~~~~
   include/linux/cleanup.h:295:43: note: in expansion of macro '__is_cond_ptr'
     295 |              __guard_ptr(_name)(&var) || !__is_cond_ptr(_name); \
--
   In file included from include/linux/preempt.h:11,
                    from include/linux/spinlock.h:56,
                    from include/linux/wait.h:9,
                    from include/linux/wait_bit.h:8,
                    from include/linux/fs.h:7,
                    from dir.c:7:
   include/linux/cleanup.h:283:9: error: unknown type name 'class_override_creds_t'
     283 | typedef class_##_name##_t class_##_name##ext##_t;                       \
         |         ^~~~~~
   overlayfs.h:459:1: note: in expansion of macro 'EXTEND_CLASS'
     459 | EXTEND_CLASS(override_creds, _ovl, ovl_override_creds(sb), struct super_block *sb)
         | ^~~~~~~~~~~~
   include/linux/cleanup.h:284:52: error: unknown type name 'class_override_creds_t'; did you mean 'class_override_creds_ovl_t'?
     284 | static inline void class_##_name##ext##_destructor(class_##_name##_t *p)\
         |                                                    ^~~~~~
   overlayfs.h:459:1: note: in expansion of macro 'EXTEND_CLASS'
     459 | EXTEND_CLASS(override_creds, _ovl, ovl_override_creds(sb), struct super_block *sb)
         | ^~~~~~~~~~~~
   include/linux/cleanup.h:286:15: error: unknown type name 'class_override_creds_t'
     286 | static inline class_##_name##_t class_##_name##ext##_constructor(_init_args) \
         |               ^~~~~~
   overlayfs.h:459:1: note: in expansion of macro 'EXTEND_CLASS'
     459 | EXTEND_CLASS(override_creds, _ovl, ovl_override_creds(sb), struct super_block *sb)
         | ^~~~~~~~~~~~
   overlayfs.h: In function 'class_override_creds_ovl_constructor':
   include/linux/cleanup.h:287:3: error: unknown type name 'class_override_creds_t'; did you mean 'class_override_creds_ovl_t'?
     287 | { class_##_name##_t t = _init; return t; }
         |   ^~~~~~
   overlayfs.h:459:1: note: in expansion of macro 'EXTEND_CLASS'
     459 | EXTEND_CLASS(override_creds, _ovl, ovl_override_creds(sb), struct super_block *sb)
         | ^~~~~~~~~~~~
   overlayfs.h:459:36: warning: initialization of 'int' from 'const struct cred *' makes integer from pointer without a cast [-Wint-conversion]
     459 | EXTEND_CLASS(override_creds, _ovl, ovl_override_creds(sb), struct super_block *sb)
         |                                    ^~~~~~~~~~~~~~~~~~
   include/linux/cleanup.h:287:25: note: in definition of macro 'EXTEND_CLASS'
     287 | { class_##_name##_t t = _init; return t; }
         |                         ^~~~~
   dir.c: In function 'ovl_override_creator_creds':
   include/linux/cleanup.h:290:9: error: unknown type name 'class_prepare_creds_t'
     290 |         class_##_name##_t var __cleanup(class_##_name##_destructor) =   \
         |         ^~~~~~
   dir.c:591:9: note: in expansion of macro 'CLASS'
     591 |         CLASS(prepare_creds, override_cred)();
         |         ^~~~~
   dir.c:591:9: error: cleanup argument not a function
   include/linux/cleanup.h:291:17: error: implicit declaration of function 'class_prepare_creds_constructor'; did you mean 'class_percpu_read_constructor'? [-Werror=implicit-function-declaration]
     291 |                 class_##_name##_constructor
         |                 ^~~~~~
   dir.c:591:9: note: in expansion of macro 'CLASS'
     591 |         CLASS(prepare_creds, override_cred)();
         |         ^~~~~
   dir.c:595:22: error: invalid type argument of '->' (have 'int')
     595 |         override_cred->fsuid = inode->i_uid;
         |                      ^~
   dir.c:596:22: error: invalid type argument of '->' (have 'int')
     596 |         override_cred->fsgid = inode->i_gid;
         |                      ^~
   dir.c:599:62: warning: passing argument 5 of 'security_dentry_create_files_as' makes pointer from integer without a cast [-Wint-conversion]
     599 |                                               current->cred, override_cred);
         |                                                              ^~~~~~~~~~~~~
         |                                                              |
         |                                                              int
   In file included from dir.c:10:
   include/linux/security.h:877:64: note: expected 'struct cred *' but argument is of type 'int'
     877 |                                                   struct cred *new)
         |                                                   ~~~~~~~~~~~~~^~~
   include/linux/cleanup.h:219:24: warning: assignment to 'int' from 'void *' makes integer from pointer without a cast [-Wint-conversion]
     219 |                 *__ptr = nullvalue;         \
         |                        ^
   include/linux/cleanup.h:228:69: note: in expansion of macro '__get_and_null'
     228 |         ((typeof(p)) __must_check_fn((__force const volatile void *)__get_and_null(p, NULL)))
         |                                                                     ^~~~~~~~~~~~~~
   dir.c:603:31: note: in expansion of macro 'no_free_ptr'
     603 |         return override_creds(no_free_ptr(override_cred));
         |                               ^~~~~~~~~~~
>> include/linux/cleanup.h:228:38: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
     228 |         ((typeof(p)) __must_check_fn((__force const volatile void *)__get_and_null(p, NULL)))
         |                                      ^
   dir.c:603:31: note: in expansion of macro 'no_free_ptr'
     603 |         return override_creds(no_free_ptr(override_cred));
         |                               ^~~~~~~~~~~
>> include/linux/cleanup.h:228:10: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
     228 |         ((typeof(p)) __must_check_fn((__force const volatile void *)__get_and_null(p, NULL)))
         |          ^
   dir.c:603:31: note: in expansion of macro 'no_free_ptr'
     603 |         return override_creds(no_free_ptr(override_cred));
         |                               ^~~~~~~~~~~
   include/linux/cleanup.h:228:10: warning: passing argument 1 of 'override_creds' makes pointer from integer without a cast [-Wint-conversion]
     228 |         ((typeof(p)) __must_check_fn((__force const volatile void *)__get_and_null(p, NULL)))
         |         ~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |          |
         |          int
   dir.c:603:31: note: in expansion of macro 'no_free_ptr'
     603 |         return override_creds(no_free_ptr(override_cred));
         |                               ^~~~~~~~~~~
   In file included from include/linux/sched/signal.h:10,
                    from include/linux/rcuwait.h:6,
                    from include/linux/percpu-rwsem.h:7,
                    from include/linux/fs.h:34:
   include/linux/cred.h:173:68: note: expected 'const struct cred *' but argument is of type 'int'
     173 | static inline const struct cred *override_creds(const struct cred *override_cred)
         |                                                 ~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~
   dir.c: In function 'ovl_create_or_link':
   dir.c:660:9: error: cleanup argument not a function
     660 |         scoped_class(override_creds_ovl, old_cred, dentry->d_sb) {
         |         ^~~~~~~~~~~~
   include/linux/cleanup.h:403:28: error: implicit declaration of function 'class_override_creds_ovl_lock_ptr'; did you mean 'class_override_creds_ovl_constructor'? [-Werror=implicit-function-declaration]
     403 | #define __guard_ptr(_name) class_##_name##_lock_ptr
         |                            ^~~~~~
   include/linux/cleanup.h:295:14: note: in expansion of macro '__guard_ptr'
     295 |              __guard_ptr(_name)(&var) || !__is_cond_ptr(_name); \
         |              ^~~~~~~~~~~
   dir.c:660:9: note: in expansion of macro 'scoped_class'
     660 |         scoped_class(override_creds_ovl, old_cred, dentry->d_sb) {
         |         ^~~~~~~~~~~~
   include/linux/cleanup.h:405:30: error: 'class_override_creds_ovl_is_conditional' undeclared (first use in this function); did you mean 'class_override_creds_ovl_constructor'?
     405 | #define __is_cond_ptr(_name) class_##_name##_is_conditional
         |                              ^~~~~~
   include/linux/cleanup.h:295:43: note: in expansion of macro '__is_cond_ptr'
     295 |              __guard_ptr(_name)(&var) || !__is_cond_ptr(_name); \
         |                                           ^~~~~~~~~~~~~
   dir.c:660:9: note: in expansion of macro 'scoped_class'
     660 |         scoped_class(override_creds_ovl, old_cred, dentry->d_sb) {
         |         ^~~~~~~~~~~~
   include/linux/cleanup.h:405:30: note: each undeclared identifier is reported only once for each function it appears in
     405 | #define __is_cond_ptr(_name) class_##_name##_is_conditional
         |                              ^~~~~~
   include/linux/cleanup.h:295:43: note: in expansion of macro '__is_cond_ptr'
     295 |              __guard_ptr(_name)(&var) || !__is_cond_ptr(_name); \
         |                                           ^~~~~~~~~~~~~
   dir.c:660:9: note: in expansion of macro 'scoped_class'
     660 |         scoped_class(override_creds_ovl, old_cred, dentry->d_sb) {
         |         ^~~~~~~~~~~~
   dir.c:685:89: warning: passing argument 4 of 'ovl_setup_cred_for_create' makes pointer from integer without a cast [-Wint-conversion]
     685 |                         new_cred = ovl_setup_cred_for_create(dentry, inode, attr->mode, old_cred);
         |                                                                                         ^~~~~~~~
         |                                                                                         |
         |                                                                                         class_override_creds_ovl_t {aka int}
   dir.c:623:72: note: expected 'const struct cred *' but argument is of type 'class_override_creds_ovl_t' {aka 'int'}
     623 |                                                     const struct cred *old_cred)
         |                                                     ~~~~~~~~~~~~~~~~~~~^~~~~~~~
   dir.c: In function 'ovl_set_link_redirect':
   dir.c:770:9: error: cleanup argument not a function
     770 |         with_ovl_creds(dentry->d_sb)
         |         ^~~~~~~~~~~~~~
   include/linux/cleanup.h:405:30: error: 'class_override_creds_ovl_is_conditional' undeclared (first use in this function); did you mean 'class_override_creds_ovl_constructor'?
     405 | #define __is_cond_ptr(_name) class_##_name##_is_conditional
         |                              ^~~~~~
   include/linux/cleanup.h:295:43: note: in expansion of macro '__is_cond_ptr'
     295 |              __guard_ptr(_name)(&var) || !__is_cond_ptr(_name); \
         |                                           ^~~~~~~~~~~~~
   overlayfs.h:462:9: note: in expansion of macro 'scoped_class'
     462 |         scoped_class(override_creds_ovl, __UNIQUE_ID(label), sb)
         |         ^~~~~~~~~~~~
   dir.c:770:9: note: in expansion of macro 'with_ovl_creds'
     770 |         with_ovl_creds(dentry->d_sb)
         |         ^~~~~~~~~~~~~~
   dir.c: In function 'ovl_do_remove':
   dir.c:964:9: error: cleanup argument not a function
     964 |         with_ovl_creds(dentry->d_sb) {
         |         ^~~~~~~~~~~~~~
   include/linux/cleanup.h:405:30: error: 'class_override_creds_ovl_is_conditional' undeclared (first use in this function); did you mean 'class_override_creds_ovl_constructor'?
     405 | #define __is_cond_ptr(_name) class_##_name##_is_conditional
         |                              ^~~~~~
   include/linux/cleanup.h:295:43: note: in expansion of macro '__is_cond_ptr'
     295 |              __guard_ptr(_name)(&var) || !__is_cond_ptr(_name); \
         |                                           ^~~~~~~~~~~~~
   overlayfs.h:462:9: note: in expansion of macro 'scoped_class'
     462 |         scoped_class(override_creds_ovl, __UNIQUE_ID(label), sb)
         |         ^~~~~~~~~~~~
   dir.c:964:9: note: in expansion of macro 'with_ovl_creds'
     964 |         with_ovl_creds(dentry->d_sb) {
         |         ^~~~~~~~~~~~~~
   dir.c: In function 'ovl_rename':
   dir.c:1371:17: error: cleanup argument not a function
    1371 |                 with_ovl_creds(old->d_sb)
         |                 ^~~~~~~~~~~~~~
   include/linux/cleanup.h:405:30: error: 'class_override_creds_ovl_is_conditional' undeclared (first use in this function); did you mean 'class_override_creds_ovl_constructor'?
     405 | #define __is_cond_ptr(_name) class_##_name##_is_conditional
         |                              ^~~~~~
   include/linux/cleanup.h:295:43: note: in expansion of macro '__is_cond_ptr'
     295 |              __guard_ptr(_name)(&var) || !__is_cond_ptr(_name); \


vim +228 include/linux/cleanup.h

54da6a0924311c Peter Zijlstra    2023-05-26  214  
c6269149cbf705 Christian Brauner 2024-06-27  215  #define __get_and_null(p, nullvalue)   \
c6269149cbf705 Christian Brauner 2024-06-27  216  	({                                  \
c6269149cbf705 Christian Brauner 2024-06-27  217  		__auto_type __ptr = &(p);   \
85be6d84244706 Peter Zijlstra    2023-08-15  218  		__auto_type __val = *__ptr; \
c6269149cbf705 Christian Brauner 2024-06-27 @219  		*__ptr = nullvalue;         \
c6269149cbf705 Christian Brauner 2024-06-27  220  		__val;                      \
c6269149cbf705 Christian Brauner 2024-06-27  221  	})
85be6d84244706 Peter Zijlstra    2023-08-15  222  
85be6d84244706 Peter Zijlstra    2023-08-15  223  static inline __must_check
85be6d84244706 Peter Zijlstra    2023-08-15  224  const volatile void * __must_check_fn(const volatile void *val)
85be6d84244706 Peter Zijlstra    2023-08-15  225  { return val; }
85be6d84244706 Peter Zijlstra    2023-08-15  226  
54da6a0924311c Peter Zijlstra    2023-05-26  227  #define no_free_ptr(p) \
366fef794bd2b7 Ilpo Järvinen     2025-03-10 @228  	((typeof(p)) __must_check_fn((__force const volatile void *)__get_and_null(p, NULL)))
54da6a0924311c Peter Zijlstra    2023-05-26  229  

:::::: The code at line 228 was first introduced by commit
:::::: 366fef794bd2b7c2e9df933f6828dd9739bfba84 <linux/cleanup.h>: Allow the passing of both iomem and non-iomem pointers to no_free_ptr()

:::::: TO: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
:::::: CC: Ingo Molnar <mingo@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
