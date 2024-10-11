Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 034042F26
	for <oe-kbuild-all@lists.linux.dev>; Fri, 11 Oct 2024 05:41:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728625320; cv=none; b=uJHSa+n1+jeF2VWVAoUDLHV02rkGYConzdWwE8T2o6JSkyh0Z2W6ulwoF85VCHhxlIY2Q6ElQ6w35G/JebhIUgJazYYAVif4lwDckHhREpLn1DeKQTbgmhgp/IHLfs1ZYIC1AgTocJ9kP65jMv/jj3jy+GNx0cX4JyOrW/p4Q1k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728625320; c=relaxed/simple;
	bh=WaNH5s3n/RUXMXmyIXTN5BlCJQgT5q/bSSVcOAvud2A=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=SMUW8xkhl1NupftO1yKHtuSkjTRnQczLQgotvJ4K+a2ZR3ZvkWs0hQNJSkRzCKghKekFVy7T34WeP7BK9C/W05cDfITofcRGEtF7pdXrw9UQW9YSoGEnYowCbl82p6Jbaf4O9NZjVnATEnlhgjNwGEtc7bdFd+lyiCTVccZ5BNo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IhtL2+w5; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IhtL2+w5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728625319; x=1760161319;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=WaNH5s3n/RUXMXmyIXTN5BlCJQgT5q/bSSVcOAvud2A=;
  b=IhtL2+w5pApR8MpDc4dKtzEruV8+Gb/qvfiOFXs5LXN8bjOtA5jg76z3
   vSKKTyZdFc68xid1S7TKALPWyi457lHKFyG6D2OKyDI+65dTJyEDwwEmw
   y5abtgyyi57+cA/k0yeXjpYY8f5uNs5wCPzChv8+Jye0lCEQg6N8E4M46
   oWZcNIiYGFmEUfZBcOsd+jhvO5t/E54RxA1HF1AQI5BXhQFCe708t5DW1
   +KpPFHyzezenzr26XaenQrJKC/Au6LgSh0Sw8P0FjhLNvMqjaJLPdqD3I
   gSd3gFf6y4u7zixpMwWefTrOp6Z0Jebx9eC+3j7XirjlQj65ixc0CELvM
   A==;
X-CSE-ConnectionGUID: EjWpiDDBQE6yNdro95nuPg==
X-CSE-MsgGUID: tcrQeEsLShm6+aUeDaDVjg==
X-IronPort-AV: E=McAfee;i="6700,10204,11221"; a="27483140"
X-IronPort-AV: E=Sophos;i="6.11,195,1725346800"; 
   d="scan'208";a="27483140"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Oct 2024 22:41:58 -0700
X-CSE-ConnectionGUID: CO+xCfvlT1a5ilJ09KkZnw==
X-CSE-MsgGUID: Ix2/YyxEQ9SG2xIheNoxfg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,195,1725346800"; 
   d="scan'208";a="107544878"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 10 Oct 2024 22:41:57 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sz8PT-000BsD-0o;
	Fri, 11 Oct 2024 05:41:55 +0000
Date: Fri, 11 Oct 2024 13:41:00 +0800
From: kernel test robot <lkp@intel.com>
To: Christoph Hellwig <hch@lst.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [hch-misc:kfifo-include 1/1] drivers/mailbox/omap-mailbox.c:96:16:
 error: implicit declaration of function '__raw_readl'; did you mean
 '__tsan_read1'?
Message-ID: <202410111307.5FaZFium-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.infradead.org/users/hch/misc.git kfifo-include
head:   5a122872045100223f0e44256a62ed2b1f85d985
commit: 5a122872045100223f0e44256a62ed2b1f85d985 [1/1] kfifo: don't include dma-mapping.h in kfifo.h
config: x86_64-buildonly-randconfig-001-20241011 (https://download.01.org/0day-ci/archive/20241011/202410111307.5FaZFium-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241011/202410111307.5FaZFium-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410111307.5FaZFium-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/mailbox/omap-mailbox.c: In function 'mbox_read_reg':
>> drivers/mailbox/omap-mailbox.c:96:16: error: implicit declaration of function '__raw_readl'; did you mean '__tsan_read1'? [-Werror=implicit-function-declaration]
      96 |         return __raw_readl(mdev->mbox_base + ofs);
         |                ^~~~~~~~~~~
         |                __tsan_read1
   drivers/mailbox/omap-mailbox.c: In function 'mbox_write_reg':
>> drivers/mailbox/omap-mailbox.c:102:9: error: implicit declaration of function '__raw_writel'; did you mean '__tsan_write1'? [-Werror=implicit-function-declaration]
     102 |         __raw_writel(val, mdev->mbox_base + ofs);
         |         ^~~~~~~~~~~~
         |         __tsan_write1
   cc1: some warnings being treated as errors


vim +96 drivers/mailbox/omap-mailbox.c

5040f534385a300 Suman Anna 2014-06-24   92  
72c1c8179cdc5ba Suman Anna 2014-06-24   93  static inline
72c1c8179cdc5ba Suman Anna 2014-06-24   94  unsigned int mbox_read_reg(struct omap_mbox_device *mdev, size_t ofs)
5040f534385a300 Suman Anna 2014-06-24   95  {
72c1c8179cdc5ba Suman Anna 2014-06-24  @96  	return __raw_readl(mdev->mbox_base + ofs);
5040f534385a300 Suman Anna 2014-06-24   97  }
5040f534385a300 Suman Anna 2014-06-24   98  
72c1c8179cdc5ba Suman Anna 2014-06-24   99  static inline
72c1c8179cdc5ba Suman Anna 2014-06-24  100  void mbox_write_reg(struct omap_mbox_device *mdev, u32 val, size_t ofs)
5040f534385a300 Suman Anna 2014-06-24  101  {
72c1c8179cdc5ba Suman Anna 2014-06-24 @102  	__raw_writel(val, mdev->mbox_base + ofs);
5040f534385a300 Suman Anna 2014-06-24  103  }
5040f534385a300 Suman Anna 2014-06-24  104  

:::::: The code at line 96 was first introduced by commit
:::::: 72c1c8179cdc5ba7208d375bd3f104659fc50ad0 mailbox/omap: add a parent structure for every IP instance

:::::: TO: Suman Anna <s-anna@ti.com>
:::::: CC: Tony Lindgren <tony@atomide.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
