Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8C1F1990A7
	for <oe-kbuild-all@lists.linux.dev>; Tue,  7 Jan 2025 17:51:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736272323; cv=none; b=hLz9k9jDmiqTIETlDY1DA9t1D5ZRUgA8wQheTYyy/F+3GR5CxU4kqt3/65pF6EytFKBjSktq5j1s2M2d8VKOzsfUIrvxRAwr3w8J5Fw7RZY9Ap9uydFgKTRdNqsF77Bj/TEbPTOa3ID3dilSONb2TfLKOT9SnLm+5PthLBL9tOY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736272323; c=relaxed/simple;
	bh=f8zGCdUTndO1D+jp+4LNGRrGIt36ohok31OytZSPIhg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=dgIoxKx0UKk82tr0wA7UxEpjhoqUElxYfE5WwS2Jh51eMIItjXfbz8ybwBUepvvqbiLdBYTuzJvz9g7o/WCkbJrdT0R1GfcPk6+Z+VCeZHQIwt4OjawdTA7CgDshA6BJCjWyC7pNi+WxWpb1zssQfL/pjcd8XD5P+FfbR/NYf40=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ar5pOt7n; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ar5pOt7n"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736272319; x=1767808319;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=f8zGCdUTndO1D+jp+4LNGRrGIt36ohok31OytZSPIhg=;
  b=ar5pOt7nmKE8QhrN+eZcPEwSq10ZSlhts/sL/H6KJud6pQ+cE04OWGK7
   63h9+MWDj8MjfEWp4+v5KxVDwNhCa7RRtj7z+I8/R7WN0B7S13BzVc8/Y
   zsWgnaLMrBXsg/aevbZV0W9BF+nfqcBg9YGWgRp/NWWR4bsBQeJY2q6R3
   7YQQlMEX0dXB/WvYqVGe+ZTb2lEpkSEOVroIhXuD8ST9Ywr6S7J9eSUUg
   QPW6fIbI6NP6+hmfmz5wU4SNj/SUjU8FG7xNdxplxGweB4B2Xdl7+DSDW
   ZG6a2TK4wF2GboPwj9Q3O8j0WLxyr115WrRO1zRFdf9B6JEr4rdIZ3Zm8
   Q==;
X-CSE-ConnectionGUID: WkHZ7MQIQk6UcYDhBXbqjw==
X-CSE-MsgGUID: H2ez9rPySB2BI6PLP/DOMQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11308"; a="36164615"
X-IronPort-AV: E=Sophos;i="6.12,296,1728975600"; 
   d="scan'208";a="36164615"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jan 2025 09:51:59 -0800
X-CSE-ConnectionGUID: cCuhUonYQwSUHkL8HjJLqA==
X-CSE-MsgGUID: 59IosrIWTgeezWx0uNGcJA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,296,1728975600"; 
   d="scan'208";a="102658672"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 07 Jan 2025 09:51:57 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tVDkA-000F3b-2Q;
	Tue, 07 Jan 2025 17:51:54 +0000
Date: Wed, 8 Jan 2025 01:51:06 +0800
From: kernel test robot <lkp@intel.com>
To: Johannes Berg <johannes.berg@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Richard Weinberger <richard@nod.at>
Subject: drivers/devfreq/tegra30-devfreq.c:100: warning: Function parameter
 or struct member 'irq_mask' not described in 'tegra_devfreq_device_config'
Message-ID: <202501080138.dfiCX1Nc-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Johannes,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   fbfd64d25c7af3b8695201ebc85efe90be28c5a3
commit: 68f5d3f3b6543266b29e047cfaf9842333019b4c um: add PCI over virtio emulation driver
date:   3 years, 7 months ago
config: um-randconfig-r092-20230628 (https://download.01.org/0day-ci/archive/20250108/202501080138.dfiCX1Nc-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250108/202501080138.dfiCX1Nc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501080138.dfiCX1Nc-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/video/fbdev/sis/init301.c: In function 'SiS_SetCRT2ModeRegs':
>> drivers/video/fbdev/sis/init301.c:2688:24: warning: variable 'modeflag' set but not used [-Wunused-but-set-variable]
    2688 |   unsigned short i, j, modeflag, tempah=0;
         |                        ^~~~~~~~
   drivers/video/fbdev/sis/init301.c: In function 'SiS_SetGroup1':
>> drivers/video/fbdev/sis/init301.c:6234:52: warning: variable 'resinfo' set but not used [-Wunused-but-set-variable]
    6234 |   unsigned short  pushbx=0, CRT1Index=0, modeflag, resinfo=0;
         |                                                    ^~~~~~~
   drivers/video/fbdev/sis/init301.c: At top level:
   drivers/video/fbdev/sis/init301.c:239:28: warning: 'SiS_Part2CLVX_6' defined but not used [-Wunused-const-variable=]
     239 | static const unsigned char SiS_Part2CLVX_6[] = {   /* 1080i */
         |                            ^~~~~~~~~~~~~~~
   drivers/video/fbdev/sis/init301.c:230:28: warning: 'SiS_Part2CLVX_5' defined but not used [-Wunused-const-variable=]
     230 | static const unsigned char SiS_Part2CLVX_5[] = {   /* 750p */
         |                            ^~~~~~~~~~~~~~~
   drivers/video/fbdev/sis/init301.c:211:28: warning: 'SiS_Part2CLVX_4' defined but not used [-Wunused-const-variable=]
     211 | static const unsigned char SiS_Part2CLVX_4[] = {   /* PAL */
         |                            ^~~~~~~~~~~~~~~
   drivers/video/fbdev/sis/init301.c:192:28: warning: 'SiS_Part2CLVX_3' defined but not used [-Wunused-const-variable=]
     192 | static const unsigned char SiS_Part2CLVX_3[] = {  /* NTSC, 525i, 525p */
         |                            ^~~~~~~~~~~~~~~
   drivers/video/fbdev/sis/init301.c:184:28: warning: 'SiS_Part2CLVX_2' defined but not used [-Wunused-const-variable=]
     184 | static const unsigned char SiS_Part2CLVX_2[] = {
         |                            ^~~~~~~~~~~~~~~
   drivers/video/fbdev/sis/init301.c:176:28: warning: 'SiS_Part2CLVX_1' defined but not used [-Wunused-const-variable=]
     176 | static const unsigned char SiS_Part2CLVX_1[] = {
         |                            ^~~~~~~~~~~~~~~
--
   drivers/message/fusion/mptsas.c: In function 'mptsas_reprobe_lun':
   drivers/message/fusion/mptsas.c:4229:13: warning: variable 'rc' set but not used [-Wunused-but-set-variable]
    4229 |         int rc;
         |             ^~
   drivers/message/fusion/mptsas.c: In function 'mptsas_issue_tm':
>> drivers/message/fusion/mptsas.c:4787:26: warning: variable 'timeleft' set but not used [-Wunused-but-set-variable]
    4787 |         unsigned long    timeleft;
         |                          ^~~~~~~~
--
>> drivers/usb/host/xhci.c:1425: warning: Function parameter or struct member 'desc' not described in 'xhci_get_endpoint_index'
--
   drivers/usb/gadget/udc/pch_udc.c:297: warning: Excess struct member 'desc' description in 'pch_udc_ep'
>> drivers/usb/gadget/udc/pch_udc.c:361: warning: Excess struct member 'stall' description in 'pch_udc_dev'
>> drivers/usb/gadget/udc/pch_udc.c:361: warning: Excess struct member 'prot_stall' description in 'pch_udc_dev'
>> drivers/usb/gadget/udc/pch_udc.c:361: warning: Excess struct member 'registered' description in 'pch_udc_dev'
>> drivers/usb/gadget/udc/pch_udc.c:361: warning: Excess struct member 'suspended' description in 'pch_udc_dev'
>> drivers/usb/gadget/udc/pch_udc.c:361: warning: Excess struct member 'connected' description in 'pch_udc_dev'
>> drivers/usb/gadget/udc/pch_udc.c:361: warning: Excess struct member 'vbus_session' description in 'pch_udc_dev'
>> drivers/usb/gadget/udc/pch_udc.c:361: warning: Excess struct member 'set_cfg_not_acked' description in 'pch_udc_dev'
>> drivers/usb/gadget/udc/pch_udc.c:361: warning: Excess struct member 'waiting_zlp_ack' description in 'pch_udc_dev'
--
>> drivers/devfreq/tegra30-devfreq.c:100: warning: Function parameter or struct member 'offset' not described in 'tegra_devfreq_device_config'
>> drivers/devfreq/tegra30-devfreq.c:100: warning: Function parameter or struct member 'irq_mask' not described in 'tegra_devfreq_device_config'
>> drivers/devfreq/tegra30-devfreq.c:100: warning: Function parameter or struct member 'boost_up_coeff' not described in 'tegra_devfreq_device_config'
>> drivers/devfreq/tegra30-devfreq.c:100: warning: Function parameter or struct member 'boost_down_coeff' not described in 'tegra_devfreq_device_config'
>> drivers/devfreq/tegra30-devfreq.c:100: warning: Function parameter or struct member 'boost_up_threshold' not described in 'tegra_devfreq_device_config'
>> drivers/devfreq/tegra30-devfreq.c:100: warning: Function parameter or struct member 'boost_down_threshold' not described in 'tegra_devfreq_device_config'
>> drivers/devfreq/tegra30-devfreq.c:100: warning: Function parameter or struct member 'avg_dependency_threshold' not described in 'tegra_devfreq_device_config'
>> drivers/devfreq/tegra30-devfreq.c:171: warning: Function parameter or struct member 'config' not described in 'tegra_devfreq_device'
>> drivers/devfreq/tegra30-devfreq.c:171: warning: Function parameter or struct member 'regs' not described in 'tegra_devfreq_device'
>> drivers/devfreq/tegra30-devfreq.c:171: warning: Function parameter or struct member 'avg_count' not described in 'tegra_devfreq_device'
>> drivers/devfreq/tegra30-devfreq.c:171: warning: Function parameter or struct member 'boost_freq' not described in 'tegra_devfreq_device'
>> drivers/devfreq/tegra30-devfreq.c:171: warning: Function parameter or struct member 'target_freq' not described in 'tegra_devfreq_device'
--
>> drivers/hwtracing/intel_th/core.c:849: warning: Function parameter or struct member 'drvdata' not described in 'intel_th_alloc'
>> drivers/hwtracing/intel_th/core.c:849: warning: Function parameter or struct member 'ndevres' not described in 'intel_th_alloc'
>> drivers/hwtracing/intel_th/core.c:849: warning: Excess function parameter 'irq' description in 'intel_th_alloc'
--
   drivers/hwtracing/intel_th/msu.c:77: warning: Function parameter or struct member 'msc' not described in 'msc_window'
   drivers/hwtracing/intel_th/msu.c:122: warning: bad line: 
>> drivers/hwtracing/intel_th/msu.c:168: warning: Function parameter or struct member 'msu_base' not described in 'msc'
>> drivers/hwtracing/intel_th/msu.c:168: warning: Function parameter or struct member 'mbuf_priv' not described in 'msc'
>> drivers/hwtracing/intel_th/msu.c:168: warning: Function parameter or struct member 'work' not described in 'msc'
>> drivers/hwtracing/intel_th/msu.c:168: warning: Function parameter or struct member 'switch_on_unlock' not described in 'msc'
>> drivers/hwtracing/intel_th/msu.c:168: warning: Function parameter or struct member 'orig_addr' not described in 'msc'
>> drivers/hwtracing/intel_th/msu.c:168: warning: Function parameter or struct member 'orig_sz' not described in 'msc'
>> drivers/hwtracing/intel_th/msu.c:168: warning: Function parameter or struct member 'iter_list' not described in 'msc'
>> drivers/hwtracing/intel_th/msu.c:168: warning: Function parameter or struct member 'stop_on_full' not described in 'msc'
>> drivers/hwtracing/intel_th/msu.c:168: warning: Function parameter or struct member 'do_irq' not described in 'msc'
>> drivers/hwtracing/intel_th/msu.c:168: warning: Function parameter or struct member 'multi_is_broken' not described in 'msc'
   drivers/hwtracing/intel_th/msu.c:1287: warning: Function parameter or struct member 'nr_pages' not described in 'msc_buffer_alloc'
   drivers/hwtracing/intel_th/msu.c:1287: warning: Function parameter or struct member 'nr_wins' not described in 'msc_buffer_alloc'
   drivers/hwtracing/intel_th/msu.c:1287: warning: Excess function parameter 'size' description in 'msc_buffer_alloc'
--
>> drivers/ntb/msi.c:33: warning: Function parameter or struct member 'desc_changed' not described in 'ntb_msi_init'
   drivers/ntb/msi.c:283: warning: Function parameter or struct member 'name' not described in 'ntbm_msi_request_threaded_irq'
   drivers/ntb/msi.c:283: warning: Function parameter or struct member 'msi_desc' not described in 'ntbm_msi_request_threaded_irq'
   drivers/ntb/msi.c:283: warning: Excess function parameter 'devname' description in 'ntbm_msi_request_threaded_irq'

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for LOCKDEP
   Depends on [n]: DEBUG_KERNEL [=y] && LOCK_DEBUGGING_SUPPORT [=y] && (FRAME_POINTER [=n] || MIPS || PPC || S390 || MICROBLAZE || ARM || ARC || X86)
   Selected by [y]:
   - PROVE_LOCKING [=y] && DEBUG_KERNEL [=y] && LOCK_DEBUGGING_SUPPORT [=y]
   - DEBUG_LOCK_ALLOC [=y] && DEBUG_KERNEL [=y] && LOCK_DEBUGGING_SUPPORT [=y]


vim +100 drivers/devfreq/tegra30-devfreq.c

6234f38016ad56 drivers/devfreq/tegra-devfreq.c   Tomeu Vizoso    2014-11-24   74  
6234f38016ad56 drivers/devfreq/tegra-devfreq.c   Tomeu Vizoso    2014-11-24   75  /**
6234f38016ad56 drivers/devfreq/tegra-devfreq.c   Tomeu Vizoso    2014-11-24   76   * struct tegra_devfreq_device_config - configuration specific to an ACTMON
6234f38016ad56 drivers/devfreq/tegra-devfreq.c   Tomeu Vizoso    2014-11-24   77   * device
6234f38016ad56 drivers/devfreq/tegra-devfreq.c   Tomeu Vizoso    2014-11-24   78   *
11573e9132ae40 drivers/devfreq/tegra-devfreq.c   Tomeu Vizoso    2015-03-17   79   * Coefficients and thresholds are percentages unless otherwise noted
6234f38016ad56 drivers/devfreq/tegra-devfreq.c   Tomeu Vizoso    2014-11-24   80   */
6234f38016ad56 drivers/devfreq/tegra-devfreq.c   Tomeu Vizoso    2014-11-24   81  struct tegra_devfreq_device_config {
6234f38016ad56 drivers/devfreq/tegra-devfreq.c   Tomeu Vizoso    2014-11-24   82  	u32		offset;
6234f38016ad56 drivers/devfreq/tegra-devfreq.c   Tomeu Vizoso    2014-11-24   83  	u32		irq_mask;
6234f38016ad56 drivers/devfreq/tegra-devfreq.c   Tomeu Vizoso    2014-11-24   84  
11573e9132ae40 drivers/devfreq/tegra-devfreq.c   Tomeu Vizoso    2015-03-17   85  	/* Factors applied to boost_freq every consecutive watermark breach */
6234f38016ad56 drivers/devfreq/tegra-devfreq.c   Tomeu Vizoso    2014-11-24   86  	unsigned int	boost_up_coeff;
6234f38016ad56 drivers/devfreq/tegra-devfreq.c   Tomeu Vizoso    2014-11-24   87  	unsigned int	boost_down_coeff;
11573e9132ae40 drivers/devfreq/tegra-devfreq.c   Tomeu Vizoso    2015-03-17   88  
11573e9132ae40 drivers/devfreq/tegra-devfreq.c   Tomeu Vizoso    2015-03-17   89  	/* Define the watermark bounds when applied to the current avg */
6234f38016ad56 drivers/devfreq/tegra-devfreq.c   Tomeu Vizoso    2014-11-24   90  	unsigned int	boost_up_threshold;
6234f38016ad56 drivers/devfreq/tegra-devfreq.c   Tomeu Vizoso    2014-11-24   91  	unsigned int	boost_down_threshold;
11573e9132ae40 drivers/devfreq/tegra-devfreq.c   Tomeu Vizoso    2015-03-17   92  
11573e9132ae40 drivers/devfreq/tegra-devfreq.c   Tomeu Vizoso    2015-03-17   93  	/*
28615e37be9687 drivers/devfreq/tegra30-devfreq.c Dmitry Osipenko 2019-11-05   94  	 * Threshold of activity (cycles translated to kHz) below which the
28615e37be9687 drivers/devfreq/tegra30-devfreq.c Dmitry Osipenko 2019-11-05   95  	 * CPU frequency isn't to be taken into account. This is to avoid
28615e37be9687 drivers/devfreq/tegra30-devfreq.c Dmitry Osipenko 2019-11-05   96  	 * increasing the EMC frequency when the CPU is very busy but not
28615e37be9687 drivers/devfreq/tegra30-devfreq.c Dmitry Osipenko 2019-11-05   97  	 * accessing the bus often.
11573e9132ae40 drivers/devfreq/tegra-devfreq.c   Tomeu Vizoso    2015-03-17   98  	 */
6234f38016ad56 drivers/devfreq/tegra-devfreq.c   Tomeu Vizoso    2014-11-24   99  	u32		avg_dependency_threshold;
6234f38016ad56 drivers/devfreq/tegra-devfreq.c   Tomeu Vizoso    2014-11-24 @100  };
6234f38016ad56 drivers/devfreq/tegra-devfreq.c   Tomeu Vizoso    2014-11-24  101  
6234f38016ad56 drivers/devfreq/tegra-devfreq.c   Tomeu Vizoso    2014-11-24  102  enum tegra_actmon_device {
6234f38016ad56 drivers/devfreq/tegra-devfreq.c   Tomeu Vizoso    2014-11-24  103  	MCALL = 0,
6234f38016ad56 drivers/devfreq/tegra-devfreq.c   Tomeu Vizoso    2014-11-24  104  	MCCPU,
6234f38016ad56 drivers/devfreq/tegra-devfreq.c   Tomeu Vizoso    2014-11-24  105  };
6234f38016ad56 drivers/devfreq/tegra-devfreq.c   Tomeu Vizoso    2014-11-24  106  
6a575e84f11e15 drivers/devfreq/tegra30-devfreq.c Dmitry Osipenko 2020-12-03  107  static const struct tegra_devfreq_device_config tegra124_device_configs[] = {
6234f38016ad56 drivers/devfreq/tegra-devfreq.c   Tomeu Vizoso    2014-11-24  108  	{
11573e9132ae40 drivers/devfreq/tegra-devfreq.c   Tomeu Vizoso    2015-03-17  109  		/* MCALL: All memory accesses (including from the CPUs) */
6234f38016ad56 drivers/devfreq/tegra-devfreq.c   Tomeu Vizoso    2014-11-24  110  		.offset = 0x1c0,
6234f38016ad56 drivers/devfreq/tegra-devfreq.c   Tomeu Vizoso    2014-11-24  111  		.irq_mask = 1 << 26,
6234f38016ad56 drivers/devfreq/tegra-devfreq.c   Tomeu Vizoso    2014-11-24  112  		.boost_up_coeff = 200,
6234f38016ad56 drivers/devfreq/tegra-devfreq.c   Tomeu Vizoso    2014-11-24  113  		.boost_down_coeff = 50,
6234f38016ad56 drivers/devfreq/tegra-devfreq.c   Tomeu Vizoso    2014-11-24  114  		.boost_up_threshold = 60,
6234f38016ad56 drivers/devfreq/tegra-devfreq.c   Tomeu Vizoso    2014-11-24  115  		.boost_down_threshold = 40,
6234f38016ad56 drivers/devfreq/tegra-devfreq.c   Tomeu Vizoso    2014-11-24  116  	},
6234f38016ad56 drivers/devfreq/tegra-devfreq.c   Tomeu Vizoso    2014-11-24  117  	{
11573e9132ae40 drivers/devfreq/tegra-devfreq.c   Tomeu Vizoso    2015-03-17  118  		/* MCCPU: memory accesses from the CPUs */
6234f38016ad56 drivers/devfreq/tegra-devfreq.c   Tomeu Vizoso    2014-11-24  119  		.offset = 0x200,
6234f38016ad56 drivers/devfreq/tegra-devfreq.c   Tomeu Vizoso    2014-11-24  120  		.irq_mask = 1 << 25,
6234f38016ad56 drivers/devfreq/tegra-devfreq.c   Tomeu Vizoso    2014-11-24  121  		.boost_up_coeff = 800,
fee22854c02735 drivers/devfreq/tegra30-devfreq.c Dmitry Osipenko 2019-11-05  122  		.boost_down_coeff = 40,
6234f38016ad56 drivers/devfreq/tegra-devfreq.c   Tomeu Vizoso    2014-11-24  123  		.boost_up_threshold = 27,
6234f38016ad56 drivers/devfreq/tegra-devfreq.c   Tomeu Vizoso    2014-11-24  124  		.boost_down_threshold = 10,
28615e37be9687 drivers/devfreq/tegra30-devfreq.c Dmitry Osipenko 2019-11-05  125  		.avg_dependency_threshold = 16000, /* 16MHz in kHz units */
6234f38016ad56 drivers/devfreq/tegra-devfreq.c   Tomeu Vizoso    2014-11-24  126  	},
6234f38016ad56 drivers/devfreq/tegra-devfreq.c   Tomeu Vizoso    2014-11-24  127  };
6234f38016ad56 drivers/devfreq/tegra-devfreq.c   Tomeu Vizoso    2014-11-24  128  
6a575e84f11e15 drivers/devfreq/tegra30-devfreq.c Dmitry Osipenko 2020-12-03  129  static const struct tegra_devfreq_device_config tegra30_device_configs[] = {
6a575e84f11e15 drivers/devfreq/tegra30-devfreq.c Dmitry Osipenko 2020-12-03  130  	{
6a575e84f11e15 drivers/devfreq/tegra30-devfreq.c Dmitry Osipenko 2020-12-03  131  		/* MCALL: All memory accesses (including from the CPUs) */
6a575e84f11e15 drivers/devfreq/tegra30-devfreq.c Dmitry Osipenko 2020-12-03  132  		.offset = 0x1c0,
6a575e84f11e15 drivers/devfreq/tegra30-devfreq.c Dmitry Osipenko 2020-12-03  133  		.irq_mask = 1 << 26,
6a575e84f11e15 drivers/devfreq/tegra30-devfreq.c Dmitry Osipenko 2020-12-03  134  		.boost_up_coeff = 200,
6a575e84f11e15 drivers/devfreq/tegra30-devfreq.c Dmitry Osipenko 2020-12-03  135  		.boost_down_coeff = 50,
6a575e84f11e15 drivers/devfreq/tegra30-devfreq.c Dmitry Osipenko 2020-12-03  136  		.boost_up_threshold = 20,
6a575e84f11e15 drivers/devfreq/tegra30-devfreq.c Dmitry Osipenko 2020-12-03  137  		.boost_down_threshold = 10,
6a575e84f11e15 drivers/devfreq/tegra30-devfreq.c Dmitry Osipenko 2020-12-03  138  	},
6a575e84f11e15 drivers/devfreq/tegra30-devfreq.c Dmitry Osipenko 2020-12-03  139  	{
6a575e84f11e15 drivers/devfreq/tegra30-devfreq.c Dmitry Osipenko 2020-12-03  140  		/* MCCPU: memory accesses from the CPUs */
6a575e84f11e15 drivers/devfreq/tegra30-devfreq.c Dmitry Osipenko 2020-12-03  141  		.offset = 0x200,
6a575e84f11e15 drivers/devfreq/tegra30-devfreq.c Dmitry Osipenko 2020-12-03  142  		.irq_mask = 1 << 25,
6a575e84f11e15 drivers/devfreq/tegra30-devfreq.c Dmitry Osipenko 2020-12-03  143  		.boost_up_coeff = 800,
6a575e84f11e15 drivers/devfreq/tegra30-devfreq.c Dmitry Osipenko 2020-12-03  144  		.boost_down_coeff = 40,
6a575e84f11e15 drivers/devfreq/tegra30-devfreq.c Dmitry Osipenko 2020-12-03  145  		.boost_up_threshold = 27,
6a575e84f11e15 drivers/devfreq/tegra30-devfreq.c Dmitry Osipenko 2020-12-03  146  		.boost_down_threshold = 10,
6a575e84f11e15 drivers/devfreq/tegra30-devfreq.c Dmitry Osipenko 2020-12-03  147  		.avg_dependency_threshold = 16000, /* 16MHz in kHz units */
6a575e84f11e15 drivers/devfreq/tegra30-devfreq.c Dmitry Osipenko 2020-12-03  148  	},
6a575e84f11e15 drivers/devfreq/tegra30-devfreq.c Dmitry Osipenko 2020-12-03  149  };
6a575e84f11e15 drivers/devfreq/tegra30-devfreq.c Dmitry Osipenko 2020-12-03  150  
6234f38016ad56 drivers/devfreq/tegra-devfreq.c   Tomeu Vizoso    2014-11-24  151  /**
6234f38016ad56 drivers/devfreq/tegra-devfreq.c   Tomeu Vizoso    2014-11-24  152   * struct tegra_devfreq_device - state specific to an ACTMON device
6234f38016ad56 drivers/devfreq/tegra-devfreq.c   Tomeu Vizoso    2014-11-24  153   *
6234f38016ad56 drivers/devfreq/tegra-devfreq.c   Tomeu Vizoso    2014-11-24  154   * Frequencies are in kHz.
6234f38016ad56 drivers/devfreq/tegra-devfreq.c   Tomeu Vizoso    2014-11-24  155   */
6234f38016ad56 drivers/devfreq/tegra-devfreq.c   Tomeu Vizoso    2014-11-24  156  struct tegra_devfreq_device {
6234f38016ad56 drivers/devfreq/tegra-devfreq.c   Tomeu Vizoso    2014-11-24  157  	const struct tegra_devfreq_device_config *config;
6234f38016ad56 drivers/devfreq/tegra-devfreq.c   Tomeu Vizoso    2014-11-24  158  	void __iomem *regs;
11573e9132ae40 drivers/devfreq/tegra-devfreq.c   Tomeu Vizoso    2015-03-17  159  
11573e9132ae40 drivers/devfreq/tegra-devfreq.c   Tomeu Vizoso    2015-03-17  160  	/* Average event count sampled in the last interrupt */
6234f38016ad56 drivers/devfreq/tegra-devfreq.c   Tomeu Vizoso    2014-11-24  161  	u32 avg_count;
6234f38016ad56 drivers/devfreq/tegra-devfreq.c   Tomeu Vizoso    2014-11-24  162  
11573e9132ae40 drivers/devfreq/tegra-devfreq.c   Tomeu Vizoso    2015-03-17  163  	/*
11573e9132ae40 drivers/devfreq/tegra-devfreq.c   Tomeu Vizoso    2015-03-17  164  	 * Extra frequency to increase the target by due to consecutive
11573e9132ae40 drivers/devfreq/tegra-devfreq.c   Tomeu Vizoso    2015-03-17  165  	 * watermark breaches.
11573e9132ae40 drivers/devfreq/tegra-devfreq.c   Tomeu Vizoso    2015-03-17  166  	 */
6234f38016ad56 drivers/devfreq/tegra-devfreq.c   Tomeu Vizoso    2014-11-24  167  	unsigned long boost_freq;
11573e9132ae40 drivers/devfreq/tegra-devfreq.c   Tomeu Vizoso    2015-03-17  168  
11573e9132ae40 drivers/devfreq/tegra-devfreq.c   Tomeu Vizoso    2015-03-17  169  	/* Optimal frequency calculated from the stats for this device */
11573e9132ae40 drivers/devfreq/tegra-devfreq.c   Tomeu Vizoso    2015-03-17  170  	unsigned long target_freq;
6234f38016ad56 drivers/devfreq/tegra-devfreq.c   Tomeu Vizoso    2014-11-24 @171  };
6234f38016ad56 drivers/devfreq/tegra-devfreq.c   Tomeu Vizoso    2014-11-24  172  

:::::: The code at line 100 was first introduced by commit
:::::: 6234f38016ad56321ad0e4bfb57a10a3d940380a PM / devfreq: tegra: add devfreq driver for Tegra Activity Monitor

:::::: TO: Tomeu Vizoso <tomeu.vizoso@collabora.com>
:::::: CC: MyungJoo Ham <myungjoo.ham@samsung.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
