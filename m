Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABCA9156253
	for <oe-kbuild-all@lists.linux.dev>; Wed,  3 Apr 2024 22:57:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712185039; cv=none; b=kuKjL0O/JCe/bT7tki1+cQW0nzyobio4L93f+TPQv4bCjw4ZtI5nviXzR51AHA5qd2dG0mGeLU3d7xTW8Lh1i5DjksYLiPvYFu3Jd4vzeVV1pWSvHY7OjiTRw3d025wgXIjceYnOxb+J5UE3GEG1gcyWtUawTmblIqLq1JeY3fs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712185039; c=relaxed/simple;
	bh=IXHjiPI/uEfDaj26jgCtiRv8+OQbxJYsZiHrFCdXWMs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Dx+tPNpmozp6h5iNgxUnbuEq0eRQuxqy3JMzXBeLfrSzUVrTIuHpjs5jfea8HzfnjsZ49e3ZEACwnZ47s+85M5vUk+hu9fzoc+hDv0zfoXQl9ud0Pdw56n4KtyF1Xfk1j5JQm/Ky4wxX0KNtoRddfrGIHzvaCv2k9TTdMgk5E3I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=J0bajvBi; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="J0bajvBi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712185038; x=1743721038;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=IXHjiPI/uEfDaj26jgCtiRv8+OQbxJYsZiHrFCdXWMs=;
  b=J0bajvBi/a0f019oIhb+pfCf7xQxolcHl2eHAl2yU6tB/ubSdeebUKkY
   nuPm0uOnwPOCsKFptekWOACAZ5G9xmuzEEzpByrpUwezgjCasy2E0d7IG
   7erZ5xCR0ZGK5ecb/IrK/smCMm58DUnTRICa8vGFXLaw6h2q5Yv+ptvwq
   Fuw/FRhoCn5lkswMycWbWdKmf2AsOqC5zzzJQyYB+Lpn/QhCk4BqQvKLO
   cfEf74YWIXR4PTXEd3Tfsxhimj5HdmcoK3Aa1n/4Hkv2UDmgZtaEsShUP
   ltxSGCFBiWktXb2/3VqyzFCXGJI+0BIGdFzS3oIIURqteVcNe19vD6GHm
   w==;
X-CSE-ConnectionGUID: Mjq2O4jnRTC1U2AO9k2bOQ==
X-CSE-MsgGUID: Lw4jeU3eT1WD2e1OB12Cjg==
X-IronPort-AV: E=McAfee;i="6600,9927,11033"; a="24905428"
X-IronPort-AV: E=Sophos;i="6.07,178,1708416000"; 
   d="scan'208";a="24905428"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Apr 2024 15:57:17 -0700
X-CSE-ConnectionGUID: 6t+HZ48uS6mapWpepGq2Rg==
X-CSE-MsgGUID: LUzlT39oRMuY0eRJXQQICA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,178,1708416000"; 
   d="scan'208";a="49537007"
Received: from lkp-server01.sh.intel.com (HELO e61807b1d151) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 03 Apr 2024 15:57:16 -0700
Received: from kbuild by e61807b1d151 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rs9Xd-0000Ko-1x;
	Wed, 03 Apr 2024 22:57:13 +0000
Date: Thu, 4 Apr 2024 06:56:54 +0800
From: kernel test robot <lkp@intel.com>
To: Joel Granados <j.granados@samsung.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [joel-granados:jag/sysctl_remset_net 5/5] net/ax25/ax25_dev.c:81:19:
 error: use of undeclared identifier 'AX25_VALUES_DS_TIMEOUT'
Message-ID: <202404040605.nvywgMtO-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/joel.granados/linux.git jag/sysctl_remset_net
head:   3b6720e41a3ccc4b0ddea1721cea468dc17fb5d7
commit: 3b6720e41a3ccc4b0ddea1721cea468dc17fb5d7 [5/5] ax.25: Remove the now superfluous sentinel elements from ctl_table array
config: i386-randconfig-054-20240404 (https://download.01.org/0day-ci/archive/20240404/202404040605.nvywgMtO-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240404/202404040605.nvywgMtO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404040605.nvywgMtO-lkp@intel.com/

All errors (new ones prefixed by >>):

>> net/ax25/ax25_dev.c:81:19: error: use of undeclared identifier 'AX25_VALUES_DS_TIMEOUT'
      81 |         ax25_dev->values[AX25_VALUES_DS_TIMEOUT]= AX25_DEF_DS_TIMEOUT;
         |                          ^
   1 error generated.


vim +/AX25_VALUES_DS_TIMEOUT +81 net/ax25/ax25_dev.c

^1da177e4c3f41 Linus Torvalds   2005-04-16  46  
^1da177e4c3f41 Linus Torvalds   2005-04-16  47  /*
^1da177e4c3f41 Linus Torvalds   2005-04-16  48   *	This is called when an interface is brought up. These are
^1da177e4c3f41 Linus Torvalds   2005-04-16  49   *	reasonable defaults.
^1da177e4c3f41 Linus Torvalds   2005-04-16  50   */
^1da177e4c3f41 Linus Torvalds   2005-04-16  51  void ax25_dev_device_up(struct net_device *dev)
^1da177e4c3f41 Linus Torvalds   2005-04-16  52  {
^1da177e4c3f41 Linus Torvalds   2005-04-16  53  	ax25_dev *ax25_dev;
^1da177e4c3f41 Linus Torvalds   2005-04-16  54  
f0623340fd2cab Peter Lafreniere 2022-06-16  55  	ax25_dev = kzalloc(sizeof(*ax25_dev), GFP_KERNEL);
f0623340fd2cab Peter Lafreniere 2022-06-16  56  	if (!ax25_dev) {
^1da177e4c3f41 Linus Torvalds   2005-04-16  57  		printk(KERN_ERR "AX.25: ax25_dev_device_up - out of memory\n");
^1da177e4c3f41 Linus Torvalds   2005-04-16  58  		return;
^1da177e4c3f41 Linus Torvalds   2005-04-16  59  	}
^1da177e4c3f41 Linus Torvalds   2005-04-16  60  
d01ffb9eee4af1 Duoming Zhou     2022-01-28  61  	refcount_set(&ax25_dev->refcount, 1);
^1da177e4c3f41 Linus Torvalds   2005-04-16  62  	dev->ax25_ptr     = ax25_dev;
^1da177e4c3f41 Linus Torvalds   2005-04-16  63  	ax25_dev->dev     = dev;
f0623340fd2cab Peter Lafreniere 2022-06-16  64  	netdev_hold(dev, &ax25_dev->dev_tracker, GFP_KERNEL);
^1da177e4c3f41 Linus Torvalds   2005-04-16  65  	ax25_dev->forward = NULL;
7d8a3a477b3e25 Duoming Zhou     2022-05-30  66  	ax25_dev->device_up = true;
^1da177e4c3f41 Linus Torvalds   2005-04-16  67  
^1da177e4c3f41 Linus Torvalds   2005-04-16  68  	ax25_dev->values[AX25_VALUES_IPDEFMODE] = AX25_DEF_IPDEFMODE;
^1da177e4c3f41 Linus Torvalds   2005-04-16  69  	ax25_dev->values[AX25_VALUES_AXDEFMODE] = AX25_DEF_AXDEFMODE;
^1da177e4c3f41 Linus Torvalds   2005-04-16  70  	ax25_dev->values[AX25_VALUES_BACKOFF]   = AX25_DEF_BACKOFF;
^1da177e4c3f41 Linus Torvalds   2005-04-16  71  	ax25_dev->values[AX25_VALUES_CONMODE]   = AX25_DEF_CONMODE;
^1da177e4c3f41 Linus Torvalds   2005-04-16  72  	ax25_dev->values[AX25_VALUES_WINDOW]    = AX25_DEF_WINDOW;
^1da177e4c3f41 Linus Torvalds   2005-04-16  73  	ax25_dev->values[AX25_VALUES_EWINDOW]   = AX25_DEF_EWINDOW;
^1da177e4c3f41 Linus Torvalds   2005-04-16  74  	ax25_dev->values[AX25_VALUES_T1]        = AX25_DEF_T1;
^1da177e4c3f41 Linus Torvalds   2005-04-16  75  	ax25_dev->values[AX25_VALUES_T2]        = AX25_DEF_T2;
^1da177e4c3f41 Linus Torvalds   2005-04-16  76  	ax25_dev->values[AX25_VALUES_T3]        = AX25_DEF_T3;
^1da177e4c3f41 Linus Torvalds   2005-04-16  77  	ax25_dev->values[AX25_VALUES_IDLE]	= AX25_DEF_IDLE;
^1da177e4c3f41 Linus Torvalds   2005-04-16  78  	ax25_dev->values[AX25_VALUES_N2]        = AX25_DEF_N2;
^1da177e4c3f41 Linus Torvalds   2005-04-16  79  	ax25_dev->values[AX25_VALUES_PACLEN]	= AX25_DEF_PACLEN;
^1da177e4c3f41 Linus Torvalds   2005-04-16  80  	ax25_dev->values[AX25_VALUES_PROTOCOL]  = AX25_DEF_PROTOCOL;
^1da177e4c3f41 Linus Torvalds   2005-04-16 @81  	ax25_dev->values[AX25_VALUES_DS_TIMEOUT]= AX25_DEF_DS_TIMEOUT;
^1da177e4c3f41 Linus Torvalds   2005-04-16  82  

:::::: The code at line 81 was first introduced by commit
:::::: 1da177e4c3f41524e886b7f1b8a0c1fc7321cac2 Linux-2.6.12-rc2

:::::: TO: Linus Torvalds <torvalds@ppc970.osdl.org>
:::::: CC: Linus Torvalds <torvalds@ppc970.osdl.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
