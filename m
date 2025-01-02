Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4223C610D
	for <oe-kbuild-all@lists.linux.dev>; Thu,  2 Jan 2025 17:32:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735839162; cv=none; b=ZEbi/nZCMTE/8qHfcmsAmBGOyuJVuYEiQCefR0v/yIlx4Ws2erNEWTbkOqoGIZUtUe1Lu+eo91IKDQBv9kiqEXMBKe0gJNhs+62cCP5RwYVVvdzG8YDzX2ejSjNSexiHUJ7ptC2UKpHRsQo0Qr9u7xvr5Iwp7LlVgg8p3OUbMuo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735839162; c=relaxed/simple;
	bh=i8RYQ7UfbXh/QzEXAks8aof03m/eBbuJib6ucqR5n0s=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ZMH8rFsJlWTlRyWcl0wYwMrScYMCzG7yGUiqR2YUaHWuYJiXnN7zxVVohruJG6JelPjT1vVRlQgC91zp50XqF9hhL5XlWUmBNZSo2GxLUOxY3cfAerddJquf+rtyXbejFbwI9YELX+oBjHhrzSGg98byBAaiiXkY87ATn7aD9F4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kjS1jpV6; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kjS1jpV6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735839161; x=1767375161;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=i8RYQ7UfbXh/QzEXAks8aof03m/eBbuJib6ucqR5n0s=;
  b=kjS1jpV6Pvoo6Mex7q6RKq6WtZQgQ9oTH29RU2oEUlblWTo/35+5DnY0
   C/yKwQPfan/1iAxorow65U8ovDVuWvBcZCV4LAlJOZ6sqDzVBHul/70jz
   SyY5GfqOkwJ5g4zdCOaImwtsEiw353RsrDzkJgYZv0O4aBPZR/29o4+Qu
   zwUFxZ3bFu/toJ1WdCSCJfUazTOFGEBzsOz7GCE1SIog+b+mnowaUiWwT
   VnQlVH/2joebLMm7uHRcIVllx9DYSMbPRnX1SSPbkFHRECw64lbDOOSEJ
   SArPBcct1ZHK1FXZDhW4Q8WQR2wsoB3DTM/tWgtM1OOl3heuPaffAggbh
   A==;
X-CSE-ConnectionGUID: OpVkxdVnSa2O0E+Zg9AvAA==
X-CSE-MsgGUID: 2rZCj2eBTsSHAnrymfO7Ug==
X-IronPort-AV: E=McAfee;i="6700,10204,11303"; a="35329528"
X-IronPort-AV: E=Sophos;i="6.12,286,1728975600"; 
   d="scan'208";a="35329528"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jan 2025 09:29:00 -0800
X-CSE-ConnectionGUID: G3CfDMf4TZ+x+9V0SgwUfg==
X-CSE-MsgGUID: dtW6IBPaSsCNiREmwrluLA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,286,1728975600"; 
   d="scan'208";a="132414247"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 02 Jan 2025 09:28:57 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tTP0B-0008hG-1J;
	Thu, 02 Jan 2025 17:28:55 +0000
Date: Fri, 3 Jan 2025 01:28:39 +0800
From: kernel test robot <lkp@intel.com>
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Mark Brown <broonie@kernel.org>
Subject: drivers/memory/emif.c:70: warning: Function parameter or struct
 member 'lpmode' not described in 'emif_data'
Message-ID: <202501030119.Oa3oiMvL-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   56e6a3499e14716b9a28a307bb6d18c10e95301e
commit: ca7d8b980b67f133317525c4273e144116ee1ae5 memory: add Renesas RPC-IF driver
date:   4 years, 6 months ago
config: csky-buildonly-randconfig-r004-20230503 (https://download.01.org/0day-ci/archive/20250103/202501030119.Oa3oiMvL-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 12.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250103/202501030119.Oa3oiMvL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501030119.Oa3oiMvL-lkp@intel.com/

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
