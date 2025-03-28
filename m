Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FE08158535
	for <oe-kbuild-all@lists.linux.dev>; Fri, 28 Mar 2025 00:57:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743123435; cv=none; b=C5SfCzvr5iXuPADKdRTpSYNJeeu4UVofuDznSJW38azudABbnEiCd11LI1C8FffGTGr2fdUdf3rEkbL2A5gu+/+vWvGHBd6h2NAX6OjMIx9V6zTteaTcxUpUR1uz5atQ8b5WLXWfwkemAApoYouEZlBpZC7Golw0SQ+QWD6UhII=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743123435; c=relaxed/simple;
	bh=7x/q/rv83rVCkDwmCGg7VoBHVoaDzQJx8aCXQKCndkw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=XpTxq5nhv2kVR/Hs5HY/4apbl/JDGostwM7FAO9dbC3pcbnVSMsSp/NdsD/fJjhSMvzw3YpV0ImVV13MK/nkxDgutSGOq5C0fiQqAp9tvtxP8VuXO8yE7HeK+/HTNPuO24r1mKE9axZPONGCY/8Bu/CiJboCJqWmPsK2kSGs6v4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Cc58NfvL; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Cc58NfvL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743123434; x=1774659434;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=7x/q/rv83rVCkDwmCGg7VoBHVoaDzQJx8aCXQKCndkw=;
  b=Cc58NfvLlhsvyXK4qWDQWnMaSlw+f8VNQpb8flnVIywCU2tb1FiycA9B
   lPMntK/DoT2HJLbtoNt/m0xZOEUyKNbMRQosJn+pyWC9iwj9KSaSkxZSE
   JROsXO4NepfT0h5NB554dcV353LLT5kl31GKd46vINaiTvmfEKarDqZMA
   M6uwS8ZZ5AM6XPU9mCpyIp8/xXVlvySKZJRRPohEeYYU473Pp2ucrJbSG
   6L4KnLM2LSJ51IKxIXQVGSpCmbiVNt4DnSHysfuICCVoIKowTsz6893zQ
   wriQYBU8SYqhf+3T9Q6qMjNmLBuD+kt4te6MvCUoEtvLAJ9pk9IYuopJX
   A==;
X-CSE-ConnectionGUID: 0JNXCDbJQ8yTvi1vbdhMfA==
X-CSE-MsgGUID: L5bNsg8nTzugaG31okisMA==
X-IronPort-AV: E=McAfee;i="6700,10204,11385"; a="69842953"
X-IronPort-AV: E=Sophos;i="6.14,281,1736841600"; 
   d="scan'208";a="69842953"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Mar 2025 17:57:13 -0700
X-CSE-ConnectionGUID: Z0q15JWfQT+EBeTA1JbHkQ==
X-CSE-MsgGUID: avHq4QztR42mTxphEvxsYw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,281,1736841600"; 
   d="scan'208";a="156289947"
Received: from lkp-server02.sh.intel.com (HELO e98e3655d6d2) ([10.239.97.151])
  by fmviesa001.fm.intel.com with ESMTP; 27 Mar 2025 17:57:12 -0700
Received: from kbuild by e98e3655d6d2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1txy22-00072o-1A;
	Fri, 28 Mar 2025 00:57:10 +0000
Date: Fri, 28 Mar 2025 08:56:16 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:incoming-android15-6.6-desktop-chromeos 498/498]
 drivers/remoteproc/mediatek_apusys/mtk_apu_hw_logger.c:310:10: warning:
 returning 'int' from a function with return type 'struct mtk_apu_hw_logger
 *' makes pointer from integer without a cast
Message-ID: <202503280822.VoMCynL1-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Karl,

First bad commit (maybe != root cause):

tree:   https://android.googlesource.com/kernel/common incoming-android15-6.6-desktop-chromeos
head:   971c23c737d79895eb40ddbbed5817f6ee6ea162
commit: 6861d60ceacc0798de74530b42a39ef0c801434e [498/498] CHROMIUM: remoteproc: mediatek: Enable APU rproc building
config: arm-randconfig-004-20250328 (https://download.01.org/0day-ci/archive/20250328/202503280822.VoMCynL1-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250328/202503280822.VoMCynL1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503280822.VoMCynL1-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/remoteproc/mediatek_apusys/mtk_apu_config.c: In function 'mtk_apu_config_setup':
>> drivers/remoteproc/mediatek_apusys/mtk_apu_config.c:120:19: warning: assignment to 'uint64_t' {aka 'long long unsigned int'} from 'void *' makes integer from pointer without a cast [-Wint-conversion]
     mdla_rv_mem->buf = mdla_buf;
                      ^
--
   In file included from drivers/remoteproc/mediatek_apusys/mtk_apu_hw_logger.c:11:
   drivers/remoteproc/mediatek_apusys/mtk_apu_hw_logger.c: In function 'ioread32_atf':
   drivers/remoteproc/mediatek_apusys/mtk_apu_hw_logger.c:132:45: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
       dev_err(dev, "Not support addr: 0x%llx", (unsigned long long)addr[i]);
                                                ^
   include/linux/dev_printk.h:110:23: note: in definition of macro 'dev_printk_index_wrap'
      _p_func(dev, fmt, ##__VA_ARGS__);   \
                          ^~~~~~~~~~~
   drivers/remoteproc/mediatek_apusys/mtk_apu_hw_logger.c:132:4: note: in expansion of macro 'dev_err'
       dev_err(dev, "Not support addr: 0x%llx", (unsigned long long)addr[i]);
       ^~~~~~~
   drivers/remoteproc/mediatek_apusys/mtk_apu_hw_logger.c: In function 'get_mtk_apu_hw_logger_device':
>> drivers/remoteproc/mediatek_apusys/mtk_apu_hw_logger.c:310:10: warning: returning 'int' from a function with return type 'struct mtk_apu_hw_logger *' makes pointer from integer without a cast [-Wint-conversion]
      return -EPROBE_DEFER;
             ^
   drivers/remoteproc/mediatek_apusys/mtk_apu_hw_logger.c:313:10: warning: returning 'int' from a function with return type 'struct mtk_apu_hw_logger *' makes pointer from integer without a cast [-Wint-conversion]
      return -EINVAL;
             ^


vim +310 drivers/remoteproc/mediatek_apusys/mtk_apu_hw_logger.c

1516d6dc338235 Karl Li 2025-01-02  295  
1516d6dc338235 Karl Li 2025-01-02  296  static struct platform_driver hw_logger_driver;
1516d6dc338235 Karl Li 2025-01-02  297  struct mtk_apu_hw_logger *get_mtk_apu_hw_logger_device(struct device_node *hw_logger_np)
1516d6dc338235 Karl Li 2025-01-02  298  {
1516d6dc338235 Karl Li 2025-01-02  299  	struct platform_device *pdev;
1516d6dc338235 Karl Li 2025-01-02  300  	struct device *dev;
1516d6dc338235 Karl Li 2025-01-02  301  	struct mtk_apu_hw_logger *hw_logger_data;
1516d6dc338235 Karl Li 2025-01-02  302  
1516d6dc338235 Karl Li 2025-01-02  303  	pdev = of_find_device_by_node(hw_logger_np);
1516d6dc338235 Karl Li 2025-01-02  304  	if (!pdev)
1516d6dc338235 Karl Li 2025-01-02  305  		return ERR_PTR(-ENODEV);
1516d6dc338235 Karl Li 2025-01-02  306  
1516d6dc338235 Karl Li 2025-01-02  307  	dev = &pdev->dev;
1516d6dc338235 Karl Li 2025-01-02  308  
1516d6dc338235 Karl Li 2025-01-02  309  	if (!dev->driver)
1516d6dc338235 Karl Li 2025-01-02 @310  		return -EPROBE_DEFER;
1516d6dc338235 Karl Li 2025-01-02  311  
1516d6dc338235 Karl Li 2025-01-02  312  	if (dev->driver != &hw_logger_driver.driver)
1516d6dc338235 Karl Li 2025-01-02  313  		return -EINVAL;
1516d6dc338235 Karl Li 2025-01-02  314  
1516d6dc338235 Karl Li 2025-01-02  315  	hw_logger_data = dev_get_drvdata(dev);
1516d6dc338235 Karl Li 2025-01-02  316  	put_device(dev);
1516d6dc338235 Karl Li 2025-01-02  317  
1516d6dc338235 Karl Li 2025-01-02  318  	return hw_logger_data;
1516d6dc338235 Karl Li 2025-01-02  319  }
1516d6dc338235 Karl Li 2025-01-02  320  

:::::: The code at line 310 was first introduced by commit
:::::: 1516d6dc33823500488342fce50de7ad8c838abf CHROMIUM: remoteproc: mediatek: Add APU hw_logger

:::::: TO: Karl Li <karl.li@mediatek.corp-partner.google.com>
:::::: CC: Hubert Mazur <hmazur@google.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
