Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08C1F8460
	for <oe-kbuild-all@lists.linux.dev>; Sun,  2 Nov 2025 02:39:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762051143; cv=none; b=MQBKCTC7nI4Rb+U3AekI3Tcyup20krW7pLWh1+/pj77tl3ygaqrFvv3oyCUiCRRB2M5kApDGMrEHm1VMyirutpaka7+ZFYaeuc5yiYPTyHO1uHBSqjrtmU5FIDV5ivpQlAuf9aNxz9/XZOlDIJNAbk7TYtLqqAdltd+zHLZT3LA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762051143; c=relaxed/simple;
	bh=VPsF4RUjfcRDvis+eJ2cKseMOrXNmvvWMgzEzpMwCLY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=TGW3q8k1UxzKNxEy5RXdIAdftg6iVIY9IEH5ChiHboHIVB4hy+QteR9p9Y3ioRvJshN+R7gi+OMsto9//NyOL8XyKJhfgdyWWHpbFPAEIxEBO2ooI1eULBawgFgho2pCwT3h6ibtksn8dLP6aIiAN8QMQ49YKKja0LG5EeZWHNg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OArc52Y0; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OArc52Y0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762051143; x=1793587143;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=VPsF4RUjfcRDvis+eJ2cKseMOrXNmvvWMgzEzpMwCLY=;
  b=OArc52Y0MyaIi4ldzehU1XUTrpDSYRb3Um1uxLCrwx8C2dPm0QJzKvrY
   bRWd2iDK+SW4RYh/Zy5OiolSytc0dhO6F59UAuWi+KVc0c8xOcFtzRZmJ
   t7o7l/xdjBu0UiHO+pBGlcAVqZruncebtM+FRPv7B/6zM8aheQKCG81jI
   8uFnQYFesS4rL8OosXm4oYFURGhxeC4OFKZUXAJeZr+9Fn1e6vQ0iHA6R
   4Tb1BXU3FUN68zfHDM+MdvdZYiFrkdbmWh3xy1sZFSJKp3o3lgTP4Kppt
   pIQTXynTgSY03LdvkkQnMtZVSGtNYNE3Wuk0ketD1erEg3Sm7w2OIXWmm
   Q==;
X-CSE-ConnectionGUID: t1OBJnoeRdKK2vKGaIzCbA==
X-CSE-MsgGUID: uKwdc9gBRZWCDnQh+UFDFA==
X-IronPort-AV: E=McAfee;i="6800,10657,11600"; a="86793694"
X-IronPort-AV: E=Sophos;i="6.19,273,1754982000"; 
   d="scan'208";a="86793694"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Nov 2025 19:39:02 -0700
X-CSE-ConnectionGUID: Cbe0VzCbSpiuEL52iD/aWQ==
X-CSE-MsgGUID: qZmlId7nRjinpD5QQ93hng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,273,1754982000"; 
   d="scan'208";a="191706094"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa005.jf.intel.com with ESMTP; 01 Nov 2025 19:39:01 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vFNze-000OvS-1R;
	Sun, 02 Nov 2025 02:38:58 +0000
Date: Sun, 2 Nov 2025 10:38:23 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Layton <jlayton@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jlayton:kdevops 18/18] fs/fcntl.c:557:3: error: too many arguments
 to function 'fcntl_getdeleg'
Message-ID: <202511021005.JtkVfCS5-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jlayton/linux.git kdevops
head:   9e5f70681a5f212d01e4e4177a1271b28fcdaf60
commit: 9e5f70681a5f212d01e4e4177a1271b28fcdaf60 [18/18] vfs: expose delegation support to userland
config: nios2-randconfig-r072-20251102 (https://download.01.org/0day-ci/archive/20251102/202511021005.JtkVfCS5-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 9.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251102/202511021005.JtkVfCS5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511021005.JtkVfCS5-lkp@intel.com/

All errors (new ones prefixed by >>):

   fs/fcntl.c: In function 'do_fcntl':
>> fs/fcntl.c:557:3: error: too many arguments to function 'fcntl_getdeleg'
     557 |   fcntl_getdeleg(filp, &deleg);
         |   ^~~~~~~~~~~~~~
   In file included from fs/fcntl.c:13:
   include/linux/filelock.h:288:19: note: declared here
     288 | static inline int fcntl_getdeleg(struct file *filp)
         |                   ^~~~~~~~~~~~~~


vim +/fcntl_getdeleg +557 fs/fcntl.c

   443	
   444	static long do_fcntl(int fd, unsigned int cmd, unsigned long arg,
   445			struct file *filp)
   446	{
   447		void __user *argp = (void __user *)arg;
   448		struct delegation deleg;
   449		int argi = (int)arg;
   450		struct flock flock;
   451		long err = -EINVAL;
   452	
   453		switch (cmd) {
   454		case F_CREATED_QUERY:
   455			err = f_created_query(filp);
   456			break;
   457		case F_DUPFD:
   458			err = f_dupfd(argi, filp, 0);
   459			break;
   460		case F_DUPFD_CLOEXEC:
   461			err = f_dupfd(argi, filp, O_CLOEXEC);
   462			break;
   463		case F_DUPFD_QUERY:
   464			err = f_dupfd_query(argi, filp);
   465			break;
   466		case F_GETFD:
   467			err = get_close_on_exec(fd) ? FD_CLOEXEC : 0;
   468			break;
   469		case F_SETFD:
   470			err = 0;
   471			set_close_on_exec(fd, argi & FD_CLOEXEC);
   472			break;
   473		case F_GETFL:
   474			err = filp->f_flags;
   475			break;
   476		case F_SETFL:
   477			err = setfl(fd, filp, argi);
   478			break;
   479	#if BITS_PER_LONG != 32
   480		/* 32-bit arches must use fcntl64() */
   481		case F_OFD_GETLK:
   482	#endif
   483		case F_GETLK:
   484			if (copy_from_user(&flock, argp, sizeof(flock)))
   485				return -EFAULT;
   486			err = fcntl_getlk(filp, cmd, &flock);
   487			if (!err && copy_to_user(argp, &flock, sizeof(flock)))
   488				return -EFAULT;
   489			break;
   490	#if BITS_PER_LONG != 32
   491		/* 32-bit arches must use fcntl64() */
   492		case F_OFD_SETLK:
   493		case F_OFD_SETLKW:
   494			fallthrough;
   495	#endif
   496		case F_SETLK:
   497		case F_SETLKW:
   498			if (copy_from_user(&flock, argp, sizeof(flock)))
   499				return -EFAULT;
   500			err = fcntl_setlk(fd, filp, cmd, &flock);
   501			break;
   502		case F_GETOWN:
   503			/*
   504			 * XXX If f_owner is a process group, the
   505			 * negative return value will get converted
   506			 * into an error.  Oops.  If we keep the
   507			 * current syscall conventions, the only way
   508			 * to fix this will be in libc.
   509			 */
   510			err = f_getown(filp);
   511			force_successful_syscall_return();
   512			break;
   513		case F_SETOWN:
   514			err = f_setown(filp, argi, 1);
   515			break;
   516		case F_GETOWN_EX:
   517			err = f_getown_ex(filp, arg);
   518			break;
   519		case F_SETOWN_EX:
   520			err = f_setown_ex(filp, arg);
   521			break;
   522		case F_GETOWNER_UIDS:
   523			err = f_getowner_uids(filp, arg);
   524			break;
   525		case F_GETSIG:
   526			err = f_owner_sig(filp, 0, false);
   527			break;
   528		case F_SETSIG:
   529			err = f_owner_sig(filp, argi, true);
   530			break;
   531		case F_GETLEASE:
   532			err = fcntl_getlease(filp);
   533			break;
   534		case F_SETLEASE:
   535			err = fcntl_setlease(fd, filp, argi);
   536			break;
   537		case F_NOTIFY:
   538			err = fcntl_dirnotify(fd, filp, argi);
   539			break;
   540		case F_SETPIPE_SZ:
   541		case F_GETPIPE_SZ:
   542			err = pipe_fcntl(filp, cmd, argi);
   543			break;
   544		case F_ADD_SEALS:
   545		case F_GET_SEALS:
   546			err = memfd_fcntl(filp, cmd, argi);
   547			break;
   548		case F_GET_RW_HINT:
   549			err = fcntl_get_rw_hint(filp, arg);
   550			break;
   551		case F_SET_RW_HINT:
   552			err = fcntl_set_rw_hint(filp, arg);
   553			break;
   554		case F_GETDELEG:
   555			if (copy_from_user(&deleg, argp, sizeof(deleg)))
   556				return -EFAULT;
 > 557			fcntl_getdeleg(filp, &deleg);
   558			if (copy_to_user(argp, &deleg, sizeof(deleg)))
   559				return -EFAULT;
   560			err = 0;
   561			break;
   562		case F_SETDELEG:
   563			if (copy_from_user(&deleg, argp, sizeof(deleg)))
   564				return -EFAULT;
   565			err = fcntl_setdeleg(fd, filp, &deleg);
   566			break;
   567		default:
   568			break;
   569		}
   570		return err;
   571	}
   572	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
