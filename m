Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17B12376F6
	for <oe-kbuild-all@lists.linux.dev>; Sun, 21 Jan 2024 16:07:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705853241; cv=none; b=MkcnBBsAuv5aFMb0NLCOVTVPAC+rGZX8oMU2YiCycSc+wZwTJSGPO2FHgi+SNx+1GCxmEfbMvChA51LLeb+T3iSmYzzrC46z77dN42xMPDkUaqosAKMBCZZgZG/Pm/l+gB0DIn6V7bfAqtsTTHoQQQGZb8w6CUn0vlUH2N6Cqes=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705853241; c=relaxed/simple;
	bh=kIqKkzh+h4rrdl+pMzWzMbtq/0iasfhY+nEGkHnmBmg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eLvJiRqs4vvmnWMcRcNGnZGIlW4e5SaBTXz5pr6jGQSRYkiwo3UknGACsb7UjXA7AYeo3DJB578zLpVphOiVj5obf8fA5yM+pDxvoAutfGlyGRL/8o2AfWOl7YxidrWXupDBYUUrMeqSvLZ3yHjaCNe0sFk3teNmSPmSzRFdvzE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Q/vGLPDg; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Q/vGLPDg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1705853237; x=1737389237;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=kIqKkzh+h4rrdl+pMzWzMbtq/0iasfhY+nEGkHnmBmg=;
  b=Q/vGLPDgrH4oihC2W/zplDLaRlbJ4+hfRvk/ZTAfZ3V8ptu3Gzhjt637
   H8maymHsrUAas5X2vt6U0nyC6h9Sct2SYcHSH0Ju6HQjW4bgR7SsdZDgh
   1kNJ2XXgUBWyBbgj6FBhxDSbOpojlKz0eNt50dDZxdVnBymFCdySwLA33
   r1eSpUcrpWfmCX+s5vo+pJ7eyP71TLqmP5QySlaD6dLFXeZdvATRS8VtP
   rQI+vzn3IXQlUU8wHzFIdUJ3Xi2sUXQJq0bZSDMikLDy9hfWwjnem7sAw
   xr1gnbVDWddW4A83qAfts2Zaxs3xYALneaa4hBNTrRYUDHQF9xb8RKJkG
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10960"; a="8418899"
X-IronPort-AV: E=Sophos;i="6.05,210,1701158400"; 
   d="scan'208";a="8418899"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jan 2024 08:07:16 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10960"; a="778387593"
X-IronPort-AV: E=Sophos;i="6.05,210,1701158400"; 
   d="scan'208";a="778387593"
Received: from lkp-server01.sh.intel.com (HELO 961aaaa5b03c) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 21 Jan 2024 08:07:15 -0800
Received: from kbuild by 961aaaa5b03c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rRaLo-00061m-2J;
	Sun, 21 Jan 2024 16:07:12 +0000
Date: Mon, 22 Jan 2024 00:06:34 +0800
From: kernel test robot <lkp@intel.com>
To: Joe Damato <jdamato@fastly.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC 1/1] eventpoll: support busy poll per epoll instance
Message-ID: <202401212307.5cz428Nn-lkp@intel.com>
References: <20240120004247.42036-2-jdamato@fastly.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240120004247.42036-2-jdamato@fastly.com>

Hi Joe,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on perf-tools-next/perf-tools-next]
[also build test ERROR on tip/perf/core perf-tools/perf-tools linus/master horms-ipvs/master acme/perf/core v6.7 next-20240119]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Joe-Damato/eventpoll-support-busy-poll-per-epoll-instance/20240120-084514
base:   https://git.kernel.org/pub/scm/linux/kernel/git/perf/perf-tools-next.git perf-tools-next
patch link:    https://lore.kernel.org/r/20240120004247.42036-2-jdamato%40fastly.com
patch subject: [RFC 1/1] eventpoll: support busy poll per epoll instance
config: i386-buildonly-randconfig-006-20240121 (https://download.01.org/0day-ci/archive/20240121/202401212307.5cz428Nn-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240121/202401212307.5cz428Nn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401212307.5cz428Nn-lkp@intel.com/

All errors (new ones prefixed by >>):

   fs/fcntl.c: In function 'do_fcntl':
>> fs/fcntl.c:425:9: error: implicit declaration of function 'eventpoll_fcntl'; did you mean 'eventpoll_release'? [-Werror=implicit-function-declaration]
      err = eventpoll_fcntl(filp, cmd, arg);
            ^~~~~~~~~~~~~~~
            eventpoll_release
   cc1: some warnings being treated as errors


vim +425 fs/fcntl.c

   316	
   317	static long do_fcntl(int fd, unsigned int cmd, unsigned long arg,
   318			struct file *filp)
   319	{
   320		void __user *argp = (void __user *)arg;
   321		int argi = (int)arg;
   322		struct flock flock;
   323		long err = -EINVAL;
   324	
   325		switch (cmd) {
   326		case F_DUPFD:
   327			err = f_dupfd(argi, filp, 0);
   328			break;
   329		case F_DUPFD_CLOEXEC:
   330			err = f_dupfd(argi, filp, O_CLOEXEC);
   331			break;
   332		case F_GETFD:
   333			err = get_close_on_exec(fd) ? FD_CLOEXEC : 0;
   334			break;
   335		case F_SETFD:
   336			err = 0;
   337			set_close_on_exec(fd, argi & FD_CLOEXEC);
   338			break;
   339		case F_GETFL:
   340			err = filp->f_flags;
   341			break;
   342		case F_SETFL:
   343			err = setfl(fd, filp, argi);
   344			break;
   345	#if BITS_PER_LONG != 32
   346		/* 32-bit arches must use fcntl64() */
   347		case F_OFD_GETLK:
   348	#endif
   349		case F_GETLK:
   350			if (copy_from_user(&flock, argp, sizeof(flock)))
   351				return -EFAULT;
   352			err = fcntl_getlk(filp, cmd, &flock);
   353			if (!err && copy_to_user(argp, &flock, sizeof(flock)))
   354				return -EFAULT;
   355			break;
   356	#if BITS_PER_LONG != 32
   357		/* 32-bit arches must use fcntl64() */
   358		case F_OFD_SETLK:
   359		case F_OFD_SETLKW:
   360			fallthrough;
   361	#endif
   362		case F_SETLK:
   363		case F_SETLKW:
   364			if (copy_from_user(&flock, argp, sizeof(flock)))
   365				return -EFAULT;
   366			err = fcntl_setlk(fd, filp, cmd, &flock);
   367			break;
   368		case F_GETOWN:
   369			/*
   370			 * XXX If f_owner is a process group, the
   371			 * negative return value will get converted
   372			 * into an error.  Oops.  If we keep the
   373			 * current syscall conventions, the only way
   374			 * to fix this will be in libc.
   375			 */
   376			err = f_getown(filp);
   377			force_successful_syscall_return();
   378			break;
   379		case F_SETOWN:
   380			err = f_setown(filp, argi, 1);
   381			break;
   382		case F_GETOWN_EX:
   383			err = f_getown_ex(filp, arg);
   384			break;
   385		case F_SETOWN_EX:
   386			err = f_setown_ex(filp, arg);
   387			break;
   388		case F_GETOWNER_UIDS:
   389			err = f_getowner_uids(filp, arg);
   390			break;
   391		case F_GETSIG:
   392			err = filp->f_owner.signum;
   393			break;
   394		case F_SETSIG:
   395			/* arg == 0 restores default behaviour. */
   396			if (!valid_signal(argi)) {
   397				break;
   398			}
   399			err = 0;
   400			filp->f_owner.signum = argi;
   401			break;
   402		case F_GETLEASE:
   403			err = fcntl_getlease(filp);
   404			break;
   405		case F_SETLEASE:
   406			err = fcntl_setlease(fd, filp, argi);
   407			break;
   408		case F_NOTIFY:
   409			err = fcntl_dirnotify(fd, filp, argi);
   410			break;
   411		case F_SETPIPE_SZ:
   412		case F_GETPIPE_SZ:
   413			err = pipe_fcntl(filp, cmd, argi);
   414			break;
   415		case F_ADD_SEALS:
   416		case F_GET_SEALS:
   417			err = memfd_fcntl(filp, cmd, argi);
   418			break;
   419		case F_GET_RW_HINT:
   420		case F_SET_RW_HINT:
   421			err = fcntl_rw_hint(filp, cmd, arg);
   422			break;
   423		case F_EPOLL_GET_BUSY_POLL_USECS:
   424		case F_EPOLL_SET_BUSY_POLL_USECS:
 > 425			err = eventpoll_fcntl(filp, cmd, arg);
   426			break;
   427		default:
   428			break;
   429		}
   430		return err;
   431	}
   432	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
