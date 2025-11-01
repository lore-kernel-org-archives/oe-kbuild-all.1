Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EAA954763
	for <oe-kbuild-all@lists.linux.dev>; Sat,  1 Nov 2025 12:42:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762000979; cv=none; b=pXA8ALOHt4e8od+BDyaFzQuT/OBHtuG9yibZlJ3QP/F13YXTUtmb5O7KUIfxMWW41n8uY/OiWPQwjI5Ic8REQk7ZgH2kSGxbXybQttCWlBIkJddbG9SesiZN3zgOqqQLGubiscaZ22UcUxcXUCEKIGTJdX4GrZq9ucwCBQfwRg4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762000979; c=relaxed/simple;
	bh=Vi+DKW+isO2IMZzZcShozBCJKZC+gN8rbVYx9AAban4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=AKINsOpPKs/FjmZQnUcz7hHHzfNFwgnlMwRoZgZSht0zjZBVmLU4+vlDBpGSxD971n/6Wy1axBUjqIfTIUk4KGCQ8BpL3olfR5QWG0J0SanlFoO0KOqVr/FdPpTVlwSVxPenJ2S3+bmlVO0JWDpbqTH3WqBubFrvKAbFJ1GwBaQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Sk5eKwEa; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Sk5eKwEa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762000977; x=1793536977;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Vi+DKW+isO2IMZzZcShozBCJKZC+gN8rbVYx9AAban4=;
  b=Sk5eKwEa0e0x3NKPg2Ausero8SuJwzM7JEsZAR4+BXgwBGzn2wEyIPkh
   H43cWvA4TXzACrhltTrDO3L46SXKAS9RUhkC5AeZIghcX4xUMyMvGUdmg
   puoLdHTHFF0u8IVqS6UTLg17znRpQi6XsxdpEqjxD5GA0H2MJ3UuTvGLC
   ZoIrSuxhcdUM+MOpwWCKO+WST4II3+j0vhb5CInaRlmaYcLIVPppJmcbS
   +OUCYY3auULGVP9pk8z6bqHrPhdbiBKxmKkK17cpPGtePqOeHt1oKvplX
   hKZe6iSlWpdAfd6iR2pKs1wqqgfVEMu/VgvNCU7i3NYMMW14JO0vo207x
   g==;
X-CSE-ConnectionGUID: 7F8gS6H4SjWuGS0oigqkZQ==
X-CSE-MsgGUID: VSytL/MKQBeTWgRq2qXLnA==
X-IronPort-AV: E=McAfee;i="6800,10657,11599"; a="51715732"
X-IronPort-AV: E=Sophos;i="6.19,272,1754982000"; 
   d="scan'208";a="51715732"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Nov 2025 05:42:57 -0700
X-CSE-ConnectionGUID: LuQp78BWR0+7oj3jvM322g==
X-CSE-MsgGUID: K0wTXBbtTrm6XZOiRLb0eg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,272,1754982000"; 
   d="scan'208";a="190800046"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa005.fm.intel.com with ESMTP; 01 Nov 2025 05:42:55 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vFAwX-000OG6-2g;
	Sat, 01 Nov 2025 12:42:53 +0000
Date: Sat, 1 Nov 2025 20:42:03 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Layton <jlayton@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jlayton:dir-deleg-ro 18/18] fs/fcntl.c:557:17: error: too many
 arguments to function 'fcntl_getdeleg'; expected 1, have 2
Message-ID: <202511012024.jYTdt22p-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jlayton/linux.git dir-deleg-ro
head:   11745d0a0c6d135c474313a710719825fbe81aed
commit: 11745d0a0c6d135c474313a710719825fbe81aed [18/18] vfs: expose delegation support to userland
config: sh-randconfig-002-20251101 (https://download.01.org/0day-ci/archive/20251101/202511012024.jYTdt22p-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251101/202511012024.jYTdt22p-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511012024.jYTdt22p-lkp@intel.com/

All errors (new ones prefixed by >>):

   fs/fcntl.c: In function 'do_fcntl':
>> fs/fcntl.c:557:17: error: too many arguments to function 'fcntl_getdeleg'; expected 1, have 2
     557 |                 fcntl_getdeleg(filp, &deleg);
         |                 ^~~~~~~~~~~~~~       ~~~~~~
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
   560			break;
   561		case F_SETDELEG:
   562			if (copy_from_user(&deleg, argp, sizeof(deleg)))
   563				return -EFAULT;
   564			err = fcntl_setdeleg(fd, filp, &deleg);
   565			break;
   566		default:
   567			break;
   568		}
   569		return err;
   570	}
   571	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
