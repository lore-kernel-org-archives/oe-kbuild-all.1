Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A179146D5E
	for <oe-kbuild-all@lists.linux.dev>; Sun, 31 Mar 2024 19:00:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711911651; cv=none; b=IpaJMD3rWi4Og6qE5VcZmPG7eydwLG8Cd58VphrgpE4+DEEXk/nz7CxBE5VCQMqC65UClm8kxyO6Gv2R4JUiNyzrUaw0uo1gz9r/fo0z3Qy61boNahKiY01BeREO87uSQCCi1/TYuLjlkeaM/HTU2iaJajw9xmlUNRnzFT/5oqY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711911651; c=relaxed/simple;
	bh=VQ83QUrX0UNJ57QI805j8clAI5VIjFbcKEvDUctCMis=;
	h=Date:From:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ATfNSSP73mvekBwWyixRF52hzZ3UmMtLra4kgMtfp4l4PNSSL2Mi+nhzHRG9G73hnykeYX1N6T1LhkawOYGCskgx1hgUMLl1DdEce9L2LCRVxaTLbADqzsF9pWXKZt8I/FLyZn7ZZQ29Mxr+7Mg9fTBqtv94/XSrmSQX+MRV6ww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gwoVJChe; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gwoVJChe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711911639; x=1743447639;
  h=date:from:cc:subject:message-id:mime-version;
  bh=VQ83QUrX0UNJ57QI805j8clAI5VIjFbcKEvDUctCMis=;
  b=gwoVJCheGvxQNH5L5sL/JeNnAdo4qIPRaSRCNCG1rsuNWD7nCqmrnvko
   oHGWbmxYG4UjBXg27wGiXh8kuG3t9eqt0b/+ddVxUo+gboI7uWnBZ9dcV
   +pU/dZolWonzMh6smISVCkWUw5OQMFVKbMplx/fJsDGYGLXHga01+54fa
   E1OpgsMP7m7ht9hrhtAfSap0m6p9Pb5j99vgc1fp7AkRB8w3OaRuYIxUs
   Yt0X0iQCj+aQXCb75iYOh8J6oCmU/CAqkSReYhV0SAbrAXLNcIpEFnDAb
   hbTShetPaFp8wo1hxv+H0pM15KFUmqhbF2SwXIHDf6fi1QTww6pXOkWH1
   w==;
X-CSE-ConnectionGUID: kb3bgxsVRsytT1enIR6RXA==
X-CSE-MsgGUID: sAv77SKYSwOLwJJd6I1TyA==
X-IronPort-AV: E=McAfee;i="6600,9927,11030"; a="7227747"
X-IronPort-AV: E=Sophos;i="6.07,170,1708416000"; 
   d="scan'208";a="7227747"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Mar 2024 12:00:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,170,1708416000"; 
   d="scan'208";a="22247888"
Received: from lkp-server01.sh.intel.com (HELO 3d808bfd2502) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 31 Mar 2024 12:00:37 -0700
Received: from kbuild by 3d808bfd2502 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rr0Pz-0001MS-0I;
	Sun, 31 Mar 2024 19:00:35 +0000
Date: Mon, 1 Apr 2024 03:00:03 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, vigneshr@ti.com, nm@ti.com
Subject: [ti:linux-4.19.y 32/184] arch/alpha/kernel/osf_sys.c:1274:44:
 sparse: sparse: incorrect type in argument 2 (different base types)
Message-ID: <202404010237.BuvUaa3S-lkp@intel.com>
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
config: alpha-randconfig-r111-20240331 (https://download.01.org/0day-ci/archive/20240401/202404010237.BuvUaa3S-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20240401/202404010237.BuvUaa3S-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404010237.BuvUaa3S-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   arch/alpha/kernel/osf_sys.c:992:55: sparse: sparse: dereference of noderef expression
   arch/alpha/kernel/osf_sys.c:993:56: sparse: sparse: dereference of noderef expression
   arch/alpha/kernel/osf_sys.c:994:52: sparse: sparse: dereference of noderef expression
   arch/alpha/kernel/osf_sys.c:995:53: sparse: sparse: dereference of noderef expression
   arch/alpha/kernel/osf_sys.c:992:55: sparse: sparse: dereference of noderef expression
   arch/alpha/kernel/osf_sys.c:993:56: sparse: sparse: dereference of noderef expression
   arch/alpha/kernel/osf_sys.c:994:52: sparse: sparse: dereference of noderef expression
   arch/alpha/kernel/osf_sys.c:995:53: sparse: sparse: dereference of noderef expression
   arch/alpha/kernel/osf_sys.c:992:55: sparse: sparse: dereference of noderef expression
   arch/alpha/kernel/osf_sys.c:993:56: sparse: sparse: dereference of noderef expression
   arch/alpha/kernel/osf_sys.c:994:52: sparse: sparse: dereference of noderef expression
   arch/alpha/kernel/osf_sys.c:995:53: sparse: sparse: dereference of noderef expression
   arch/alpha/kernel/osf_sys.c:992:55: sparse: sparse: dereference of noderef expression
   arch/alpha/kernel/osf_sys.c:993:56: sparse: sparse: dereference of noderef expression
   arch/alpha/kernel/osf_sys.c:994:52: sparse: sparse: dereference of noderef expression
   arch/alpha/kernel/osf_sys.c:995:53: sparse: sparse: dereference of noderef expression
>> arch/alpha/kernel/osf_sys.c:1274:44: sparse: sparse: incorrect type in argument 2 (different base types) @@     expected struct __kernel_old_timeval *i @@     got struct timeval * @@
   arch/alpha/kernel/osf_sys.c:1274:44: sparse:     expected struct __kernel_old_timeval *i
   arch/alpha/kernel/osf_sys.c:1274:44: sparse:     got struct timeval *
   arch/alpha/kernel/osf_sys.c: In function '__do_sys_osf_utsname':
   arch/alpha/kernel/osf_sys.c:532:13: warning: unused variable 'error' [-Wunused-variable]
     532 |         int error;
         |             ^~~~~
   arch/alpha/kernel/osf_sys.c: In function '__do_sys_osf_getdomainname':
   arch/alpha/kernel/osf_sys.c:563:18: warning: unused variable 'err' [-Wunused-variable]
     563 |         int len, err = 0;
         |                  ^~~
   arch/alpha/kernel/osf_sys.c: In function '__do_sys_old_adjtimex':
   arch/alpha/kernel/osf_sys.c:1274:43: error: passing argument 2 of 'put_tv_to_tv32' from incompatible pointer type [-Werror=incompatible-pointer-types]
    1274 |             (put_tv_to_tv32(&txc_p->time, &txc.time)))
         |                                           ^~~~~~~~~
         |                                           |
         |                                           struct timeval *
   arch/alpha/kernel/osf_sys.c:967:73: note: expected 'struct __kernel_old_timeval *' but argument is of type 'struct timeval *'
     967 | put_tv_to_tv32(struct timeval32 __user *o, struct __kernel_old_timeval *i)
         |                                            ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^
   cc1: some warnings being treated as errors

vim +1274 arch/alpha/kernel/osf_sys.c

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
