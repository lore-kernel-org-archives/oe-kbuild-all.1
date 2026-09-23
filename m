Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BA5F22370A
	for <oe-kbuild-all@lists.linux.dev>; Wed, 23 Sep 2026 03:11:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790133118; cv=none; b=nyHSeUiPs0bGwEu+GHaWse1BkZAZDywpCeCC8jptPt5LmvC2KJbigqTJsnUUx/S77iOOFMQTU53PmRIM9DcYydP6gj7tAjpuXhjWgseWuhGDQpFUlJd1l/6GAmRW9MtoK55KVdLNVHy978mmS5EjfLbgEnK7owzH/ummESNnjTE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790133118; c=relaxed/simple;
	bh=QizKu3dTU9whC0UQWc5066hDXz0ocoiY12v+aS9XAhY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=ugLYuQh+mwj/dsDf438uIFn68PGs0bx25St2tSaaaPYom4Jr9YKkMkZ3kapRkhJ2J2qfpmYMzt5wFYwzv9oHhweRnRK+RcA+G4CsEcsnrYcUOoS0xFAq7Q4KlD1vexpC2hjZGY93i5AluX6JKiUS1ayS4xA66/vFwInEQUbueLA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CBPYag9h; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CBPYag9h"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790133115; x=1821669115;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=QizKu3dTU9whC0UQWc5066hDXz0ocoiY12v+aS9XAhY=;
  b=CBPYag9hB/YEXM9yhhA6Q6sBy3wmNwD36JCDlzg4CCzsLvQlDB6Wr7vD
   ZxTWcXEyblwoF4Ovpd38dxEaB3xhEdZfcvXKHSzGXTxaRwhM+hcEfGPYT
   +r3Kk5cDaVomEz9W43ks37vJgioLhMR+0m/vBDiEFlD8c20H9I5Aap8MM
   c/pHeY6bjpCtDYISWT3fRVWeuuzwN/PXKX9jAf4MmHKufM1b/0wUQdlWB
   Rw/LfY77P544Rbw5ZBo/OzKUYcafYJjTIJ1rcmJTLeQaGONdW08CAi8oC
   0POKNHFfBwTwcitDQjqXaSy+ovR54IYCmc67/DCVG5vEIftTYVTxfnKIK
   Q==;
X-CSE-ConnectionGUID: hm8Eh2yhS7u11xpGuIF4sA==
X-CSE-MsgGUID: 3wjCbYXhQGaQ6XHfgtN+LA==
X-IronPort-AV: E=McAfee;i="6800,10657,11913"; a="90904052"
X-IronPort-AV: E=Sophos;i="6.27,117,1787036400"; 
   d="scan'208";a="90904052"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Sep 2026 20:11:55 -0700
X-CSE-ConnectionGUID: Kp7Nw+pGRaW1Xj68lbvVgQ==
X-CSE-MsgGUID: hidPIaQjRhO7wK1ZshVKVQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,117,1787036400"; 
   d="scan'208";a="271997917"
Received: from lkp-server01.sh.intel.com (HELO 462990a40a85) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 22 Sep 2026 20:11:52 -0700
Received: from kbuild by 462990a40a85 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x9DOe-00000000GRe-2iSt;
	Wed, 23 Sep 2026 03:11:48 +0000
Date: Wed, 23 Sep 2026 11:10:48 +0800
From: kernel test robot <lkp@intel.com>
To: "Thomas =?utf-8?Q?Wei=C3=9Fschuh"?= <linux@weissschuh.net>
Cc: oe-kbuild-all@lists.linux.dev, Michal Simek <monstr@monstr.eu>,
 David Gow <david@davidgow.net>
Subject: [linux-next:master 5037/8910]
 drivers/scsi/megaraid.c:3523:29: sparse: sparse: Using plain integer as NULL
 pointer
Message-ID: <202609231106.jUL3t8MA-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   a8c591ed6b672915e0be57843f943a2a723aff40
commit: 54c35131e628e1a18f02365495a24a73a1fb515e [5037/8910] microblaze: uaccess: Zero out destination on failed get_user()
config: microblaze-randconfig-r1302-20260923 (https://download.01.org/0day-ci/archive/20260923/202609231106.jUL3t8MA-lkp@intel.com/config)
compiler: microblaze-linux-gcc (GCC) 13.4.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260923/202609231106.jUL3t8MA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609231106.jUL3t8MA-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/scsi/megaraid.c:3523:29: sparse: sparse: Using plain integer as NULL pointer
   drivers/scsi/megaraid.c:3540:29: sparse: sparse: Using plain integer as NULL pointer
   drivers/scsi/megaraid.c:4464:26: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/scsi/megaraid.c:4464:26: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/scsi/megaraid.c:4464:26: sparse:     got void *
   drivers/scsi/megaraid.c:4523:26: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/scsi/megaraid.c:4523:26: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/scsi/megaraid.c:4523:26: sparse:     got void *

vim +3523 drivers/scsi/megaraid.c

^1da177e4c3f415 Linus Torvalds 2005-04-16  3488  
^1da177e4c3f415 Linus Torvalds 2005-04-16  3489  /*
^1da177e4c3f415 Linus Torvalds 2005-04-16  3490   * mega_n_to_m()
2b46e5c14218c73 Damien Le Moal 2020-07-06  3491   * @arg: user address
2b46e5c14218c73 Damien Le Moal 2020-07-06  3492   * @mc: mailbox command
^1da177e4c3f415 Linus Torvalds 2005-04-16  3493   *
^1da177e4c3f415 Linus Torvalds 2005-04-16  3494   * Updates the status information to the application, depending on application
^1da177e4c3f415 Linus Torvalds 2005-04-16  3495   * conforms to older mimd ioctl interface or newer NIT ioctl interface
^1da177e4c3f415 Linus Torvalds 2005-04-16  3496   */
^1da177e4c3f415 Linus Torvalds 2005-04-16  3497  static int
^1da177e4c3f415 Linus Torvalds 2005-04-16  3498  mega_n_to_m(void __user *arg, megacmd_t *mc)
^1da177e4c3f415 Linus Torvalds 2005-04-16  3499  {
^1da177e4c3f415 Linus Torvalds 2005-04-16  3500  	nitioctl_t	__user *uiocp;
^1da177e4c3f415 Linus Torvalds 2005-04-16  3501  	megacmd_t	__user *umc;
^1da177e4c3f415 Linus Torvalds 2005-04-16  3502  	mega_passthru	__user *upthru;
^1da177e4c3f415 Linus Torvalds 2005-04-16  3503  	struct uioctl_t	__user *uioc_mimd;
^1da177e4c3f415 Linus Torvalds 2005-04-16  3504  	char	signature[8] = {0};
^1da177e4c3f415 Linus Torvalds 2005-04-16  3505  
^1da177e4c3f415 Linus Torvalds 2005-04-16  3506  	/*
^1da177e4c3f415 Linus Torvalds 2005-04-16  3507  	 * check is the application conforms to NIT.
^1da177e4c3f415 Linus Torvalds 2005-04-16  3508  	 */
^1da177e4c3f415 Linus Torvalds 2005-04-16  3509  	if( copy_from_user(signature, arg, 7) )
^1da177e4c3f415 Linus Torvalds 2005-04-16  3510  		return -EFAULT;
^1da177e4c3f415 Linus Torvalds 2005-04-16  3511  
^1da177e4c3f415 Linus Torvalds 2005-04-16  3512  	if( memcmp(signature, "MEGANIT", 7) == 0 ) {
^1da177e4c3f415 Linus Torvalds 2005-04-16  3513  
^1da177e4c3f415 Linus Torvalds 2005-04-16  3514  		uiocp = arg;
^1da177e4c3f415 Linus Torvalds 2005-04-16  3515  
^1da177e4c3f415 Linus Torvalds 2005-04-16  3516  		if( put_user(mc->status, (u8 __user *)&MBOX_P(uiocp)->status) )
^1da177e4c3f415 Linus Torvalds 2005-04-16  3517  			return (-EFAULT);
^1da177e4c3f415 Linus Torvalds 2005-04-16  3518  
^1da177e4c3f415 Linus Torvalds 2005-04-16  3519  		if( mc->cmd == MEGA_MBOXCMD_PASSTHRU ) {
^1da177e4c3f415 Linus Torvalds 2005-04-16  3520  
^1da177e4c3f415 Linus Torvalds 2005-04-16  3521  			umc = MBOX_P(uiocp);
^1da177e4c3f415 Linus Torvalds 2005-04-16  3522  
^1da177e4c3f415 Linus Torvalds 2005-04-16 @3523  			if (get_user(upthru, (mega_passthru __user * __user *)&umc->xferaddr))
^1da177e4c3f415 Linus Torvalds 2005-04-16  3524  				return -EFAULT;
^1da177e4c3f415 Linus Torvalds 2005-04-16  3525  
^1da177e4c3f415 Linus Torvalds 2005-04-16  3526  			if( put_user(mc->status, (u8 __user *)&upthru->scsistatus))
^1da177e4c3f415 Linus Torvalds 2005-04-16  3527  				return (-EFAULT);
^1da177e4c3f415 Linus Torvalds 2005-04-16  3528  		}
^1da177e4c3f415 Linus Torvalds 2005-04-16  3529  	}
^1da177e4c3f415 Linus Torvalds 2005-04-16  3530  	else {
^1da177e4c3f415 Linus Torvalds 2005-04-16  3531  		uioc_mimd = arg;
^1da177e4c3f415 Linus Torvalds 2005-04-16  3532  
^1da177e4c3f415 Linus Torvalds 2005-04-16  3533  		if( put_user(mc->status, (u8 __user *)&uioc_mimd->mbox[17]) )
^1da177e4c3f415 Linus Torvalds 2005-04-16  3534  			return (-EFAULT);
^1da177e4c3f415 Linus Torvalds 2005-04-16  3535  
^1da177e4c3f415 Linus Torvalds 2005-04-16  3536  		if( mc->cmd == MEGA_MBOXCMD_PASSTHRU ) {
^1da177e4c3f415 Linus Torvalds 2005-04-16  3537  
^1da177e4c3f415 Linus Torvalds 2005-04-16  3538  			umc = (megacmd_t __user *)uioc_mimd->mbox;
^1da177e4c3f415 Linus Torvalds 2005-04-16  3539  
^1da177e4c3f415 Linus Torvalds 2005-04-16  3540  			if (get_user(upthru, (mega_passthru __user * __user *)&umc->xferaddr))
^1da177e4c3f415 Linus Torvalds 2005-04-16  3541  				return (-EFAULT);
^1da177e4c3f415 Linus Torvalds 2005-04-16  3542  
^1da177e4c3f415 Linus Torvalds 2005-04-16  3543  			if( put_user(mc->status, (u8 __user *)&upthru->scsistatus) )
^1da177e4c3f415 Linus Torvalds 2005-04-16  3544  				return (-EFAULT);
^1da177e4c3f415 Linus Torvalds 2005-04-16  3545  		}
^1da177e4c3f415 Linus Torvalds 2005-04-16  3546  	}
^1da177e4c3f415 Linus Torvalds 2005-04-16  3547  
^1da177e4c3f415 Linus Torvalds 2005-04-16  3548  	return 0;
^1da177e4c3f415 Linus Torvalds 2005-04-16  3549  }
^1da177e4c3f415 Linus Torvalds 2005-04-16  3550  

:::::: The code at line 3523 was first introduced by commit
:::::: 1da177e4c3f41524e886b7f1b8a0c1fc7321cac2 Linux-2.6.12-rc2

:::::: TO: Linus Torvalds <torvalds@ppc970.osdl.org>
:::::: CC: Linus Torvalds <torvalds@ppc970.osdl.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
