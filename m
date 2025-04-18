Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE90F26B2CC
	for <oe-kbuild-all@lists.linux.dev>; Fri, 18 Apr 2025 08:13:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744963986; cv=none; b=plCVHm2KcD0tRY6ghhKOMmc9QGfUEnDKlE8blM1DhWed5BdDIq6AUhSL+8LDWwtVt+4UoWg5RNgD04nHBjTrghscoHe2OynKVMDeKZFcbgFys5UThpSNr2KhZHFhbJKv4GYC4LoTTjSqbcqy5rDygkAQZSnCOnJnRcpPpbznuhE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744963986; c=relaxed/simple;
	bh=VEZuIR+gvRrWitpGsrb+t5PS+yvvpcPEocMJZ/5fbpU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=NHzDam3sHSqIgsWyUpVrigVE27Th6jsu5n0cayhCrxCcNVLGkRy05Akr5JKx94eODvG17HWbMDBcAZ5BOt1F1PdLpI9a6jEcM+KXhTTYPYGdE6bfvq8ZDIhSFinaPHhLcm0+0HomaqNlMXz/Bf9tmwnh6E1baM4MdHNthHJTx1I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZSetkHNb; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZSetkHNb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744963984; x=1776499984;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=VEZuIR+gvRrWitpGsrb+t5PS+yvvpcPEocMJZ/5fbpU=;
  b=ZSetkHNbiQkxdc4LNJNklUArJ0nhljPipKd7247/Sw03nr/PTHgfllAy
   XLK8gDLnIm2gOiYbTf6e3J0KThUn8qkIGRGpoBydWfo1jOYLjkdXrTd+l
   LugfrMkYRQlnIqbvanWEbIztchKlBgY6wkVNPvIukHKpFAb0DMQrG/uBC
   /k9innjtjVXeOtuJYkwkid+UYOhK5uSVxFiJEAyaq64UC7UosmvPNoYEG
   Cs5QSlXeUpmgfLdJAlyWQid72z0tyNQLB9M+ra5YomZKFUitzR1rV3rDb
   +HjHzSe7GDUII/dvrUi+XflF8KeO/OACY7Accruanc/FKt1h1Wyv3qR+p
   g==;
X-CSE-ConnectionGUID: uZFNkHYpRNCpx5oEjiplVw==
X-CSE-MsgGUID: kVU0OXWRToeLRYWIGQ5v3Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11406"; a="57963165"
X-IronPort-AV: E=Sophos;i="6.15,221,1739865600"; 
   d="scan'208";a="57963165"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Apr 2025 01:13:03 -0700
X-CSE-ConnectionGUID: ciVxJWCvTRGvWnJcQ3mM2A==
X-CSE-MsgGUID: nLYx7cQWQn+q0fcMXViwgw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,221,1739865600"; 
   d="scan'208";a="131592581"
Received: from lkp-server01.sh.intel.com (HELO 61e10e65ea0f) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 18 Apr 2025 01:13:01 -0700
Received: from kbuild by 61e10e65ea0f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u5gqJ-0002et-1L;
	Fri, 18 Apr 2025 08:12:59 +0000
Date: Fri, 18 Apr 2025 16:12:35 +0800
From: kernel test robot <lkp@intel.com>
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Mark Brown <broonie@kernel.org>
Subject: drivers/memory/emif.c:70: warning: Function parameter or struct
 member 'lpmode' not described in 'emif_data'
Message-ID: <202504181651.S4uHs8tg-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Sergei,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   fc96b232f8e7c0a6c282f47726b2ff6a5fb341d2
commit: ca7d8b980b67f133317525c4273e144116ee1ae5 memory: add Renesas RPC-IF driver
date:   4 years, 10 months ago
config: csky-randconfig-r053-20231127 (https://download.01.org/0day-ci/archive/20250418/202504181651.S4uHs8tg-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 12.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250418/202504181651.S4uHs8tg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504181651.S4uHs8tg-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/memory/emif.c:70: warning: Function parameter or struct member 'lpmode' not described in 'emif_data'
   drivers/memory/emif.c:70: warning: Function parameter or struct member 'irq_state' not described in 'emif_data'
   drivers/memory/emif.c:70: warning: Function parameter or struct member 'addressing' not described in 'emif_data'


vim +70 drivers/memory/emif.c

7ec944538dde3d Aneesh V 2012-04-27  30  
7ec944538dde3d Aneesh V 2012-04-27  31  /**
7ec944538dde3d Aneesh V 2012-04-27  32   * struct emif_data - Per device static data for driver's use
7ec944538dde3d Aneesh V 2012-04-27  33   * @duplicate:			Whether the DDR devices attached to this EMIF
7ec944538dde3d Aneesh V 2012-04-27  34   *				instance are exactly same as that on EMIF1. In
7ec944538dde3d Aneesh V 2012-04-27  35   *				this case we can save some memory and processing
7ec944538dde3d Aneesh V 2012-04-27  36   * @temperature_level:		Maximum temperature of LPDDR2 devices attached
7ec944538dde3d Aneesh V 2012-04-27  37   *				to this EMIF - read from MR4 register. If there
7ec944538dde3d Aneesh V 2012-04-27  38   *				are two devices attached to this EMIF, this
7ec944538dde3d Aneesh V 2012-04-27  39   *				value is the maximum of the two temperature
7ec944538dde3d Aneesh V 2012-04-27  40   *				levels.
7ec944538dde3d Aneesh V 2012-04-27  41   * @node:			node in the device list
7ec944538dde3d Aneesh V 2012-04-27  42   * @base:			base address of memory-mapped IO registers.
7ec944538dde3d Aneesh V 2012-04-27  43   * @dev:			device pointer.
a93de288aad3b0 Aneesh V 2012-04-27  44   * @addressing			table with addressing information from the spec
a93de288aad3b0 Aneesh V 2012-04-27  45   * @regs_cache:			An array of 'struct emif_regs' that stores
a93de288aad3b0 Aneesh V 2012-04-27  46   *				calculated register values for different
a93de288aad3b0 Aneesh V 2012-04-27  47   *				frequencies, to avoid re-calculating them on
a93de288aad3b0 Aneesh V 2012-04-27  48   *				each DVFS transition.
a93de288aad3b0 Aneesh V 2012-04-27  49   * @curr_regs:			The set of register values used in the last
a93de288aad3b0 Aneesh V 2012-04-27  50   *				frequency change (i.e. corresponding to the
a93de288aad3b0 Aneesh V 2012-04-27  51   *				frequency in effect at the moment)
7ec944538dde3d Aneesh V 2012-04-27  52   * @plat_data:			Pointer to saved platform data.
aac10aaa8cc65a Aneesh V 2012-04-27  53   * @debugfs_root:		dentry to the root folder for EMIF in debugfs
e6b42eb6a66c18 Aneesh V 2012-08-17  54   * @np_ddr:			Pointer to ddr device tree node
7ec944538dde3d Aneesh V 2012-04-27  55   */
7ec944538dde3d Aneesh V 2012-04-27  56  struct emif_data {
7ec944538dde3d Aneesh V 2012-04-27  57  	u8				duplicate;
7ec944538dde3d Aneesh V 2012-04-27  58  	u8				temperature_level;
a93de288aad3b0 Aneesh V 2012-04-27  59  	u8				lpmode;
7ec944538dde3d Aneesh V 2012-04-27  60  	struct list_head		node;
a93de288aad3b0 Aneesh V 2012-04-27  61  	unsigned long			irq_state;
7ec944538dde3d Aneesh V 2012-04-27  62  	void __iomem			*base;
7ec944538dde3d Aneesh V 2012-04-27  63  	struct device			*dev;
a93de288aad3b0 Aneesh V 2012-04-27  64  	const struct lpddr2_addressing	*addressing;
a93de288aad3b0 Aneesh V 2012-04-27  65  	struct emif_regs		*regs_cache[EMIF_MAX_NUM_FREQUENCIES];
a93de288aad3b0 Aneesh V 2012-04-27  66  	struct emif_regs		*curr_regs;
7ec944538dde3d Aneesh V 2012-04-27  67  	struct emif_platform_data	*plat_data;
aac10aaa8cc65a Aneesh V 2012-04-27  68  	struct dentry			*debugfs_root;
e6b42eb6a66c18 Aneesh V 2012-08-17  69  	struct device_node		*np_ddr;
7ec944538dde3d Aneesh V 2012-04-27 @70  };
7ec944538dde3d Aneesh V 2012-04-27  71  

:::::: The code at line 70 was first introduced by commit
:::::: 7ec944538dde3d7f490bd4d2619051789db5c3c3 memory: emif: add basic infrastructure for EMIF driver

:::::: TO: Aneesh V <aneesh@ti.com>
:::::: CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
