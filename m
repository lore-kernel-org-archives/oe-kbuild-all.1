Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37A02847C
	for <oe-kbuild-all@lists.linux.dev>; Thu, 28 Mar 2024 13:15:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711631714; cv=none; b=JNOKggG+xWnNYBeWcAIvaq3g8YhENFMj0m+VDTzdgWGEG2IHas7dbfn8Wh/cfOt6idnI4Tgtt+Hg40Tt3/vf1bLExLK2/pYT4m5bnIdI6noLJuZn2G02LUOjE2CT9vY/j1u01YVr0IAAtVglnRgsPaX6FZt9xziWuXFXuf/m6Jg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711631714; c=relaxed/simple;
	bh=22hq8yR/Lil8jOr6Jz7H3tVcsgi093s+pXOQHd1W9XU=;
	h=Date:From:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=QcPAOWU9gTHMvsyRZvUZZ682ootTfGc3RdmUJUu7Pqd62m1/o8/h6f59yWsgibfGqMUCfTIhWhQP3oTzNUo2ddFXsPeWuFjkDu/doy4zxWl4T2IRA5xpFm6uLKMCvr49XbyErTXPEaGKUaLBoqsB2Qlam2rR06pwe0JjIZVBhrA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KmGJagjg; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KmGJagjg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711631712; x=1743167712;
  h=date:from:cc:subject:message-id:mime-version;
  bh=22hq8yR/Lil8jOr6Jz7H3tVcsgi093s+pXOQHd1W9XU=;
  b=KmGJagjggafn8rjpXun2vl8hyH1tWvIicr8CehayO+sDVKoxHceCVBqv
   lVi+uWV4FCsebFqj4o40q3A1ndn3BubjEiyrSI8kDOYyRZPFXWRzEwm/X
   B/Iik/W+gHVK3XFsL2D3+HfzHSW9dnTiK8p28kWL5XCWtc/xZ4oeRD4eY
   AKOPLyxw6mevj7j2LmeleeoLIExNELnE0V8qRL/A1X10KY1z4H78sjyLL
   W3ZQlxWsdDKzaSC20/CN2mARi58fN4wNdF8m6Vec8/2OKlXj7OdbNqS6W
   9n0U1uKYNBP3Op0dfH3vkwPnEMhHqvb1Vr71tQ3gE+fWpraIhLQb+Is20
   A==;
X-CSE-ConnectionGUID: b4dY6wv/QXSmGtmANxPhqw==
X-CSE-MsgGUID: IEqxw15dRUuRjTTu16e5VA==
X-IronPort-AV: E=McAfee;i="6600,9927,11026"; a="6638876"
X-IronPort-AV: E=Sophos;i="6.07,161,1708416000"; 
   d="scan'208";a="6638876"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Mar 2024 06:15:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,161,1708416000"; 
   d="scan'208";a="47827969"
Received: from lkp-server01.sh.intel.com (HELO be39aa325d23) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 28 Mar 2024 06:15:08 -0700
Received: from kbuild by be39aa325d23 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rppb0-0002A8-0C;
	Thu, 28 Mar 2024 13:15:06 +0000
Date: Thu, 28 Mar 2024 21:15:00 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, vigneshr@ti.com, nm@ti.com
Subject: [ti:linux-4.19.y 32/184] arch/alpha/kernel/osf_sys.c:1274:43: error:
 passing argument 2 of 'put_tv_to_tv32' from incompatible pointer type
Message-ID: <202403282051.aBWYYsaT-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Arnd,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git linux-4.19.y
head:   33caadfa4b279da780b99fb774337c870080b894
commit: d5e38d6b84d6d21a4f8a4f555a0908b6d9ffe224 [32/184] y2038: rusage: use __kernel_old_timeval
config: alpha-allnoconfig (https://download.01.org/0day-ci/archive/20240328/202403282051.aBWYYsaT-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240328/202403282051.aBWYYsaT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403282051.aBWYYsaT-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/alpha/kernel/osf_sys.c: In function '__do_sys_osf_utsname':
   arch/alpha/kernel/osf_sys.c:532:13: warning: unused variable 'error' [-Wunused-variable]
     532 |         int error;
         |             ^~~~~
   arch/alpha/kernel/osf_sys.c: In function '__do_sys_osf_getdomainname':
   arch/alpha/kernel/osf_sys.c:563:18: warning: unused variable 'err' [-Wunused-variable]
     563 |         int len, err = 0;
         |                  ^~~
   arch/alpha/kernel/osf_sys.c: In function '__do_sys_old_adjtimex':
>> arch/alpha/kernel/osf_sys.c:1274:43: error: passing argument 2 of 'put_tv_to_tv32' from incompatible pointer type [-Werror=incompatible-pointer-types]
    1274 |             (put_tv_to_tv32(&txc_p->time, &txc.time)))
         |                                           ^~~~~~~~~
         |                                           |
         |                                           struct timeval *
   arch/alpha/kernel/osf_sys.c:967:73: note: expected 'struct __kernel_old_timeval *' but argument is of type 'struct timeval *'
     967 | put_tv_to_tv32(struct timeval32 __user *o, struct __kernel_old_timeval *i)
         |                                            ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^
   cc1: some warnings being treated as errors


vim +/put_tv_to_tv32 +1274 arch/alpha/kernel/osf_sys.c

^1da177e4c3f41 Linus Torvalds  2005-04-16  1254  
e5d9a90c36e05d Ivan Kokshaysky 2009-01-29  1255  SYSCALL_DEFINE1(old_adjtimex, struct timex32 __user *, txc_p)
^1da177e4c3f41 Linus Torvalds  2005-04-16  1256  {
^1da177e4c3f41 Linus Torvalds  2005-04-16  1257          struct timex txc;
^1da177e4c3f41 Linus Torvalds  2005-04-16  1258  	int ret;
^1da177e4c3f41 Linus Torvalds  2005-04-16  1259  
^1da177e4c3f41 Linus Torvalds  2005-04-16  1260  	/* copy relevant bits of struct timex. */
^1da177e4c3f41 Linus Torvalds  2005-04-16  1261  	if (copy_from_user(&txc, txc_p, offsetof(struct timex32, time)) ||
^1da177e4c3f41 Linus Torvalds  2005-04-16  1262  	    copy_from_user(&txc.tick, &txc_p->tick, sizeof(struct timex32) - 
2b5efc089769cd Al Viro         2017-03-25  1263  			   offsetof(struct timex32, tick)))
^1da177e4c3f41 Linus Torvalds  2005-04-16  1264  	  return -EFAULT;
^1da177e4c3f41 Linus Torvalds  2005-04-16  1265  
^1da177e4c3f41 Linus Torvalds  2005-04-16  1266  	ret = do_adjtimex(&txc);	
^1da177e4c3f41 Linus Torvalds  2005-04-16  1267  	if (ret < 0)
^1da177e4c3f41 Linus Torvalds  2005-04-16  1268  	  return ret;
^1da177e4c3f41 Linus Torvalds  2005-04-16  1269  	
^1da177e4c3f41 Linus Torvalds  2005-04-16  1270  	/* copy back to timex32 */
^1da177e4c3f41 Linus Torvalds  2005-04-16  1271  	if (copy_to_user(txc_p, &txc, offsetof(struct timex32, time)) ||
^1da177e4c3f41 Linus Torvalds  2005-04-16  1272  	    (copy_to_user(&txc_p->tick, &txc.tick, sizeof(struct timex32) - 
^1da177e4c3f41 Linus Torvalds  2005-04-16  1273  			  offsetof(struct timex32, tick))) ||
ce4c253573ad18 Arnd Bergmann   2017-11-08 @1274  	    (put_tv_to_tv32(&txc_p->time, &txc.time)))
^1da177e4c3f41 Linus Torvalds  2005-04-16  1275  	  return -EFAULT;
^1da177e4c3f41 Linus Torvalds  2005-04-16  1276  
^1da177e4c3f41 Linus Torvalds  2005-04-16  1277  	return ret;
^1da177e4c3f41 Linus Torvalds  2005-04-16  1278  }
^1da177e4c3f41 Linus Torvalds  2005-04-16  1279  

:::::: The code at line 1274 was first introduced by commit
:::::: ce4c253573ad184603e0fa77876ba155b0cde46d alpha: osf_sys.c: use timespec64 where appropriate

:::::: TO: Arnd Bergmann <arnd@arndb.de>
:::::: CC: Al Viro <viro@zeniv.linux.org.uk>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
