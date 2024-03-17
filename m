Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5795364
	for <oe-kbuild-all@lists.linux.dev>; Sun, 17 Mar 2024 00:29:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710635349; cv=none; b=sA+VilE37sO6Ec08s/XAgBfDf+uWVcxnoNg72t8tpIapBUqkw4haotXzDl+T6G/Pm/K6N1O+X+bNqiJCuXWlUzeAwIPalLvC9XjG19RZaTvhxL8mhDttjpDx86TV/m3Y3T9hloyd0xddVWSLELgUi/ETPNxSY7f1bcAAPI/Qqu0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710635349; c=relaxed/simple;
	bh=C97YzQLMPKeA7wMa5y86l97e6qLuc9i9q3Hwf8KzDpI=;
	h=Date:From:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=up8tl4P+d2IF2jDT2NWEDUS0MDmHQMyKuORLKFRGawOtKDekk61+Av0SH6HhnbWoEbyyCFC4aiaE8pqm+K5MlOqSsinusRfRoUMowPNjreaI2MkJ/+2u64qp7WeD/Ku+b4KjDVIGL+mrcpIibaEWqLvwK1MbKDZ2GjsHPKZD2RU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=e0JrlBCv; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="e0JrlBCv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1710635347; x=1742171347;
  h=date:from:cc:subject:message-id:mime-version;
  bh=C97YzQLMPKeA7wMa5y86l97e6qLuc9i9q3Hwf8KzDpI=;
  b=e0JrlBCvYlhyczNAuvUj58gN/LctXlNBios2qv3eS8RYZzKLljpm1/zn
   2wXEb6BcXRNvsBzEFF0purDFnCP2mRdt0SUneIXbBkEyl0iyyzYLd3Vvr
   8zMG3cZrMdyVgno+5GGUL9Sm/t1qh1JesPKYkK/uEfkPPZtx1QyLQJCIK
   l2juDzwzWJ4sEL7zsrLFmRAlfNSCre2RuZesXixfB4F/icrrj11q19jHs
   iNlU+kYgzG9vl0Df+l01iy2b8dwEdPg5bET53KiaruKk8TAHtwm2ETR+a
   hxGrr0GUFQiXPP74fdrppF+rOXwFN32aBZ7snfXLbuvFK64w5+7FUq6ju
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11015"; a="16028688"
X-IronPort-AV: E=Sophos;i="6.07,131,1708416000"; 
   d="scan'208";a="16028688"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Mar 2024 17:29:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,131,1708416000"; 
   d="scan'208";a="43984676"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 16 Mar 2024 17:29:05 -0700
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rleOc-000Ft3-22;
	Sun, 17 Mar 2024 00:29:02 +0000
Date: Sun, 17 Mar 2024 08:28:40 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, vigneshr@ti.com, nm@ti.com
Subject: [ti:linux-4.19.y 32/39] arch/alpha/kernel/osf_sys.c:1274:43: error:
 passing argument 2 of 'put_tv_to_tv32' from incompatible pointer type
Message-ID: <202403170833.K8OLMdk9-lkp@intel.com>
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
head:   e25760f461eebe5d8b363810d5558b9ee694466a
commit: d5e38d6b84d6d21a4f8a4f555a0908b6d9ffe224 [32/39] y2038: rusage: use __kernel_old_timeval
config: alpha-allnoconfig (https://download.01.org/0day-ci/archive/20240317/202403170833.K8OLMdk9-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240317/202403170833.K8OLMdk9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403170833.K8OLMdk9-lkp@intel.com/

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
