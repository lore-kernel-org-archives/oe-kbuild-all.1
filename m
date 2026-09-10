Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F5C04AEBE5
	for <oe-kbuild-all@lists.linux.dev>; Thu, 10 Sep 2026 15:39:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789054785; cv=none; b=dk01TlDJ/U+n1Bb/ztXKtEdwEDY30B/sVA41XqXERlS/ql7NtxQSjsurxNzS8NlltOOGWrBAvKGtlixFEXfaM353qWMSN+Z3lZXHsHkLhI5q/ts4fpdxPVyIGnThB5ULXZsdzRxOR+uz5eD4jO1P9vuwlQkBn+74JTqlv+yoUbM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789054785; c=relaxed/simple;
	bh=pXQxsMpV9qdepdTsBjCA3A3vMi8l03N0TSwKCCmNddQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=RzrlyrOQj/Nr0VFjBxGyslckJ27mWW5r6rjo15fmXvnvPvU8ClAehLodhrdb9hl8YWz7HmnL96KJ2w6ZJeMLjGy0HvPm7lndNDqgyb5GL/O+JZ2p81JWHZSdnPWCEwLdPM+HKM07wxkPeAhOHsqWh3U39+aXfzR30ORsI1wwlj4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fLehsK2k; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fLehsK2k"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789054783; x=1820590783;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=pXQxsMpV9qdepdTsBjCA3A3vMi8l03N0TSwKCCmNddQ=;
  b=fLehsK2kLv8fm2xi2c6Atemf9TxN9oMNE+aHRJjbS20YgJ/QQRMgHFn2
   8t4JOCcOuW1GngkQfO9hBDnrtrzwdWQ3Q0U2id9jPdogrnMxtcXb+USGa
   YCKvMFqvzUkjLsu8xHmQDFVNDb/6TpGPDdaX3SlUPFnAjdurj2PP99pqu
   qokHm9c1FD8C4WCUkcuvg7dpdMX7LHsuGVFiOKIH9pU2yGisWsMRuQ+wu
   dZnZRLPwTgOSAg1K3HzmAT+C3k85Bzu53V4SLdDkdNR/wRODzpxvfi8HF
   jj6w7StR8lxB6CToZ+r8RyPJUpWdjSlYrG00yzj98k6KhvaZjGhTSMbkD
   w==;
X-CSE-ConnectionGUID: Omdzw863RDCDNbKkDT0CAQ==
X-CSE-MsgGUID: yo7yGqR1TTmTZcMtreUL4A==
X-IronPort-AV: E=McAfee;i="6800,10657,11901"; a="89271603"
X-IronPort-AV: E=Sophos;i="6.27,95,1787036400"; 
   d="scan'208";a="89271603"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Sep 2026 08:39:32 -0700
X-CSE-ConnectionGUID: 7A9RsdJDSk61ecuGK2WnSw==
X-CSE-MsgGUID: 0z6w0096QqOIjZgp7a8K/Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,95,1787036400"; 
   d="scan'208";a="267395205"
Received: from igk-lkp-server01.igk.intel.com (HELO 2232cf45ba3c) ([10.211.93.152])
  by fmviesa006.fm.intel.com with ESMTP; 10 Sep 2026 08:39:31 -0700
Received: from kbuild by 2232cf45ba3c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x4gs4-000000000QA-4BqB;
	Thu, 10 Sep 2026 15:39:29 +0000
Date: Thu, 10 Sep 2026 17:39:12 +0200
From: kernel test robot <lkp@intel.com>
To: "Stefan =?utf-8?Q?D=C3=B6singer"?= <stefandoesinger@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [stefandoesinger-zx297520:dlink 132/132]
 drivers/misc/cardreader/infineon_usim.c:696:36: warning: format '%x' expects
 argument of type 'unsigned int', but argument 4 has type 'long unsigned int'
Message-ID: <202609091648.Dcmvkire-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

tree:   https://gitlab.com/stefandoesinger/zx297520-kernel dlink
head:   ac919b52585145716ddb9d8154ca104ff2ea271b
commit: ac919b52585145716ddb9d8154ca104ff2ea271b [132/132] Sloppy APDU
config: sparc-allyesconfig (https://download.01.org/0day-ci/archive/20260909/202609091648.Dcmvkire-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260909/202609091648.Dcmvkire-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609091648.Dcmvkire-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/misc/cardreader/infineon_usim.c: In function 'usim_read_atr':
   drivers/misc/cardreader/infineon_usim.c:190:21: warning: unused variable 'i' [-Wunused-variable]
     190 |         size_t len, i;
         |                     ^
   In file included from include/linux/device.h:15,
                    from include/linux/miscdevice.h:7,
                    from drivers/misc/cardreader/infineon_usim.c:39:
   drivers/misc/cardreader/infineon_usim.c: In function 'usim_ioctl':
>> drivers/misc/cardreader/infineon_usim.c:696:36: warning: format '%x' expects argument of type 'unsigned int', but argument 4 has type 'long unsigned int' [-Wformat=]
     696 |                 dev_err(usim->dev, "ioctl 0x%08x, powerup %x\n", command, INFINEON_USIM_IOC_POWER_UP);
         |                                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:110:30: note: in definition of macro 'dev_printk_index_wrap'
     110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
         |                              ^~~
   include/linux/dev_printk.h:154:56: note: in expansion of macro 'dev_fmt'
     154 |         dev_printk_index_wrap(_dev_err, KERN_ERR, dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                                                        ^~~~~~~
   drivers/misc/cardreader/infineon_usim.c:696:17: note: in expansion of macro 'dev_err'
     696 |                 dev_err(usim->dev, "ioctl 0x%08x, powerup %x\n", command, INFINEON_USIM_IOC_POWER_UP);
         |                 ^~~~~~~
   drivers/misc/cardreader/infineon_usim.c:696:60: note: format string is defined here
     696 |                 dev_err(usim->dev, "ioctl 0x%08x, powerup %x\n", command, INFINEON_USIM_IOC_POWER_UP);
         |                                                           ~^
         |                                                            |
         |                                                            unsigned int
         |                                                           %lx
   drivers/misc/cardreader/infineon_usim.c: At top level:
   drivers/misc/cardreader/infineon_usim.c:715:20: error: initialization of 'int (*)(struct inode *, struct file *)' from incompatible pointer type 'ssize_t (*)(struct inode *, struct file *)' {aka 'long int (*)(struct inode *, struct file *)'} [-Wincompatible-pointer-types]
     715 |         .release = usim_release,
         |                    ^~~~~~~~~~~~
   drivers/misc/cardreader/infineon_usim.c:715:20: note: (near initialization for 'usim_fops.release')
   drivers/misc/cardreader/infineon_usim.c:646:16: note: 'usim_release' declared here
     646 | static ssize_t usim_release(struct inode *inode, struct file *file)
         |                ^~~~~~~~~~~~


vim +696 drivers/misc/cardreader/infineon_usim.c

   668	
   669	static long usim_ioctl(struct file *file, unsigned int command, unsigned long argument)
   670	{
   671		struct usim_drv *usim = file->private_data;
   672		void __user *argp = (void __user *)argument;
   673		long ret;
   674	
   675		dev_dbg(usim->dev, "USIM IOCTL 0x%x\n", command);
   676		mutex_lock(&usim->lock);
   677	
   678		switch (command) {
   679		case INFINEON_USIM_IOC_POWER_UP:
   680			ret = usim_power_up(usim, argp);
   681			break;
   682	
   683		case INFINEON_USIM_IOC_POWER_DOWN:
   684			ret = usim_power_down(usim);
   685			break;
   686	
   687		case INFINEON_USIM_IOC_RESET:
   688			ret = usim_reset(usim, argp);
   689			break;
   690	
   691		case INFINEON_USIM_IOC_TRANSMIT:
   692			ret = usim_transmit(usim, argp);
   693			break;
   694	
   695		default:
 > 696			dev_err(usim->dev, "ioctl 0x%08x, powerup %x\n", command, INFINEON_USIM_IOC_POWER_UP);
   697			ret = -ENOTTY;
   698			break;
   699		}
   700	
   701		mutex_unlock(&usim->lock);
   702		dev_dbg(usim->dev, "ioctl 0x%x ret %ld\n", command, ret);
   703	
   704		return ret;
   705	}
   706	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
