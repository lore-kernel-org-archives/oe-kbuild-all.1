Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A338317BA3
	for <oe-kbuild-all@lists.linux.dev>; Mon, 18 Nov 2024 01:33:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731893617; cv=none; b=LK5A9xhgTUugJ1CDLArdgll1T4EeLUIeveBqkj2hqg80HQ66R34sDDYZlfU4AiCnlCcf8kS2QOQYxophcFxkv/670TFjH6sGQ1WEY7DYqzgqb+bzHQ9/bvraQkWmwEtgHnVdW6SfmiFGsrpXH6c64GX6384tSVAwZGK30oZaegM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731893617; c=relaxed/simple;
	bh=Q9AVIvUOt6Szv5lao0AmFZcHNTTCe+h+pbblr1bfMX0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Ajlo/8SS2A5Z1g+W0qhvPcGGxzI4U4sHuc4WMkSYYu6yzVWJgIleCS6lvCrTAZ5lnpyDjHRn1Ikil3z+wY6iQIqTMf1cfVVro9BNZEnRfigIUtQIpNn3YhMLdocaqwNdBbhSEE050LtxdSCBx6ecortkeJMqzf+HHQP684tG6TU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kwEmZTXd; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kwEmZTXd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731893616; x=1763429616;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Q9AVIvUOt6Szv5lao0AmFZcHNTTCe+h+pbblr1bfMX0=;
  b=kwEmZTXduhAbUMf2KFrLkgdLyHT4xIAFCBrDVn2sLRf0I+9kxAaHSbIs
   aqWmz96BlRC+EQid2w97P38F+gj5ZgL9uND3EEh8XFfg2twSryJZpLvyz
   kPDm/4QFi3BcGkWdCWoAnlupdCesLpWs06R/QbBCCbHBJGFT75YIK4X55
   OaFGtGCSHk3QZKI4uxaslJg7XEsHyB5+ppS/xOtAKXUb6v9+icnWyr09t
   +3m2W435zaudvQeEGNuPR90U8LmE5RIgq1z5K9qh36Tahz1XFEcQSLSI5
   qD5eo5f01IDn2WIxSxjpUoAUzWR3tcE+2ps4wD1r62dW7WRo/Nb4dufTH
   A==;
X-CSE-ConnectionGUID: jAsDvMxWQomM65urH9Jvgw==
X-CSE-MsgGUID: h+AuV9TiQgWe1aO8JycHlg==
X-IronPort-AV: E=McAfee;i="6700,10204,11259"; a="42903315"
X-IronPort-AV: E=Sophos;i="6.12,163,1728975600"; 
   d="scan'208";a="42903315"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Nov 2024 17:33:35 -0800
X-CSE-ConnectionGUID: 5XhgQtVURaumnbHy9kERLQ==
X-CSE-MsgGUID: ArGVScgwTry8KxArq1lOsA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,163,1728975600"; 
   d="scan'208";a="89491873"
Received: from lkp-server01.sh.intel.com (HELO 1e3cc1889ffb) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 17 Nov 2024 17:33:35 -0800
Received: from kbuild by 1e3cc1889ffb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tCqdv-0002BZ-1v;
	Mon, 18 Nov 2024 01:33:31 +0000
Date: Mon, 18 Nov 2024 09:32:32 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas =?unknown-8bit?Q?Wei=C3=9Fschuh?= <linux@weissschuh.net>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [thomas-weissschuh:b4/b4-sysfs-const-bin_attr-cb 111/120]
 include/linux/sysfs.h:376:22: warning: 'bin_attr_trace' defined but not used
Message-ID: <202411180936.v8U1ijej-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/thomas.weissschuh/linux.git b4/b4-sysfs-const-bin_attr-cb
head:   7a315c5c3a11f198244918c63efbc9205fc501a1
commit: e8fed0bb67c88ef43f708e0bfb819f69f5c9a1c2 [111/120] scsi/ipr macro
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20241118/202411180936.v8U1ijej-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241118/202411180936.v8U1ijej-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411180936.v8U1ijej-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/kobject.h:20,
                    from include/linux/pci.h:35,
                    from drivers/scsi/ipr.c:52:
>> include/linux/sysfs.h:376:22: warning: 'bin_attr_trace' defined but not used [-Wunused-variable]
     376 | struct bin_attribute bin_attr_##_name = __BIN_ATTR_RO(_name, _size)
         |                      ^~~~~~~~~
   drivers/scsi/ipr.c:3386:8: note: in expansion of macro 'BIN_ATTR_RO'
    3386 | static BIN_ATTR_RO(trace, 0);
         |        ^~~~~~~~~~~


vim +/bin_attr_trace +376 include/linux/sysfs.h

3493f69f4c4e87 Oliver Schinagl 2013-07-14  370  
3493f69f4c4e87 Oliver Schinagl 2013-07-14  371  #define BIN_ATTR(_name, _mode, _read, _write, _size)			\
3493f69f4c4e87 Oliver Schinagl 2013-07-14  372  struct bin_attribute bin_attr_##_name = __BIN_ATTR(_name, _mode, _read,	\
3493f69f4c4e87 Oliver Schinagl 2013-07-14  373  					_write, _size)
3493f69f4c4e87 Oliver Schinagl 2013-07-14  374  
3493f69f4c4e87 Oliver Schinagl 2013-07-14  375  #define BIN_ATTR_RO(_name, _size)					\
3493f69f4c4e87 Oliver Schinagl 2013-07-14 @376  struct bin_attribute bin_attr_##_name = __BIN_ATTR_RO(_name, _size)
3493f69f4c4e87 Oliver Schinagl 2013-07-14  377  

:::::: The code at line 376 was first introduced by commit
:::::: 3493f69f4c4e8703961919a9a56c2d2e6a25b46f sysfs: add more helper macro's for (bin_)attribute(_groups)

:::::: TO: Oliver Schinagl <oliver@schinagl.nl>
:::::: CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
