Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6ECE27FB2F
	for <oe-kbuild-all@lists.linux.dev>; Tue, 21 Oct 2025 07:34:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761032074; cv=none; b=Yt2UKZIbKoEJKmX9C1XCRHhmfYhO17wj+94yQXemLaqaY6XvqlQ9ENfU2zR494Fn49+vfnjJEvfr5hYAjhJxoRDZYjIayG5ujX+QDZGG/xL1mlt8Eu9bGvkyDeXd00JicK4EGPzT52koYJDfa8W7eP1In6VYh6J+fwd270lFmS4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761032074; c=relaxed/simple;
	bh=/HDEvYsn6PFwg9fMZBVycqF/MtRkI8SL28B/hoNha/Q=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=sJtcXPqKf10N2JaKEO46PL0UopzszL5d0mx2qIqVWfiA+zAGXsu2KsQHenCGwQqMhyBRZjNoXRivXyH2AD8TRgXnrExwnbkFOfTaIk1RaYWvi8ICm/M1CChu8XqMWohCn6XDFqIp0/MGyYOz/pGvWGeOgTwAx0GayZ2IHT8p0QI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=U0GzgWTA; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="U0GzgWTA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761032072; x=1792568072;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/HDEvYsn6PFwg9fMZBVycqF/MtRkI8SL28B/hoNha/Q=;
  b=U0GzgWTACFNrs2EvT6Cb4wzCznOAN94K3LagzlYq5wL7dy91ueZw7AnE
   ITohHrZvoxRmrNlDKvf3BwT2hyiIeb27W2sp6k89vXBgwNAoYxcqDkPWt
   XNzOyajjrnQNKLAKXHQVIXqF9kzmORdsbli9k/MDHCbRDhCm9un7Zu62T
   NIFXh6KCQahDrlUBpvIfrkp42egfdNu0b3J3tA+kDzurJIxb2QNXDoyJa
   EliiIrjHjbDcOLfrw0pgmiWo3SXURo2GvSWzPSEGL15363SfmloWIW8Vl
   46mAzSPzFViiXx0X3bOBOQjO08o6L9cV+1AAF6wQOOt4EOdPAFF4lqm4C
   A==;
X-CSE-ConnectionGUID: 381oWaMxTmquZTa5b9rtXg==
X-CSE-MsgGUID: A3GoqbqrQn+Fni4w26Pycw==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="50726797"
X-IronPort-AV: E=Sophos;i="6.19,244,1754982000"; 
   d="scan'208";a="50726797"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Oct 2025 00:34:31 -0700
X-CSE-ConnectionGUID: omcpCC7qRaydDQJlFZnE3A==
X-CSE-MsgGUID: U5tHFXzNRhOeJ3AYoAKrzg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,244,1754982000"; 
   d="scan'208";a="184300681"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa010.fm.intel.com with ESMTP; 21 Oct 2025 00:34:30 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vB6t1-000AcL-1U;
	Tue, 21 Oct 2025 07:34:27 +0000
Date: Tue, 21 Oct 2025 15:34:13 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Layton <jlayton@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jlayton:kdevops 19/19] fs/fcntl.c:555:9: error: implicit
 declaration of function 'fcntl_getdeleg'; did you mean 'fcntl_getlease'?
Message-ID: <202510211507.G3hJdDH7-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jlayton/linux.git kdevops
head:   1fe66e11bc8440fdda126ec2e814e899eeb18554
commit: 1fe66e11bc8440fdda126ec2e814e899eeb18554 [19/19] vfs: add F_SET/GETDELEG fcntl() commands
config: nios2-randconfig-002-20251021 (https://download.01.org/0day-ci/archive/20251021/202510211507.G3hJdDH7-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251021/202510211507.G3hJdDH7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510211507.G3hJdDH7-lkp@intel.com/

All errors (new ones prefixed by >>):

   fs/fcntl.c: In function 'do_fcntl':
>> fs/fcntl.c:555:9: error: implicit declaration of function 'fcntl_getdeleg'; did you mean 'fcntl_getlease'? [-Werror=implicit-function-declaration]
      err = fcntl_getdeleg(filp);
            ^~~~~~~~~~~~~~
            fcntl_getlease
>> fs/fcntl.c:560:9: error: implicit declaration of function 'fcntl_setdeleg'; did you mean 'fcntl_setlease'? [-Werror=implicit-function-declaration]
      err = fcntl_setdeleg(fd, filp, &deleg);
            ^~~~~~~~~~~~~~
            fcntl_setlease
   cc1: some warnings being treated as errors


vim +555 fs/fcntl.c

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
 > 555			err = fcntl_getdeleg(filp);
   556			break;
   557		case F_SETDELEG:
   558			if (copy_from_user(&deleg, argp, sizeof(deleg)))
   559				return -EFAULT;
 > 560			err = fcntl_setdeleg(fd, filp, &deleg);
   561			break;
   562		default:
   563			break;
   564		}
   565		return err;
   566	}
   567	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
