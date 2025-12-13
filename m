Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7821624DCE5
	for <oe-kbuild-all@lists.linux.dev>; Sat, 13 Dec 2025 04:42:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765600923; cv=none; b=oHaejfNgHZFPzLIqWwKf1fMjVgBZ3nhXxtNIv9vXzAG3RPWyKs4MTiBgAaL1NWCf1trfh9PmbDLD/HglEzEByrXnnYup1iIS/BfMDDUMUZU2vo+5lCBwPUk7HNZvU6mLIcBODsG4NVI37x36fwTChHZI5mhfnIhx7AUSjWNvhOk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765600923; c=relaxed/simple;
	bh=D+00F5Y/JJc32P+Cz5XV8+ZaiGpRjjmaGlOYTiw81Oc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=BC2wnI6ns6wQiLuXKkkA7LLcm8okxcapyBBmzxKnrRX0ocDpbsyFp8CTTjr1DWwOb5rDwnKX6QjrIFCgeB0E0403f68CkfoA50o97KAGUqAx+KXSl6Efy9giYauoqHmybtrAndtU9p8XOOVqLctwL6P4xABjdydM+HxJ8+1tT6A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=C4YOuERc; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="C4YOuERc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765600921; x=1797136921;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=D+00F5Y/JJc32P+Cz5XV8+ZaiGpRjjmaGlOYTiw81Oc=;
  b=C4YOuERcly00+qn1T5U/To5mR6nuoQIUp6KXcqs15b0Wj0Oz1oF64lVs
   hx8Tw4/B/QYSmFttofXtL+LIud9yZGjsz90lzbfEXJBHhVDutdhr2lZTl
   9yCJnLYbNmjSRw+azq5aHILO2lpFnZbw0j7VXThucKYntuRq8mG+nUjti
   MEeqrKpOQCbpthuYvsVdf4u0fQj8p/FtQaY/62yRXCq3SAcdDKzxatKVs
   z9njVKjQI3BRJ1Dob30+PEhx+eYSi048i6rPMrLiaUWbglav44O7QhRxJ
   uqWHzQsX2glidvE88vzj5maukGpad4DWr5O56GkgVsy+ESiwYX71gTtUA
   Q==;
X-CSE-ConnectionGUID: J/SptQmCTzuba97ErJS95A==
X-CSE-MsgGUID: wWhd8i2pT2uj/xtVpGAMmQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11640"; a="67638920"
X-IronPort-AV: E=Sophos;i="6.21,145,1763452800"; 
   d="scan'208";a="67638920"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Dec 2025 20:42:00 -0800
X-CSE-ConnectionGUID: u1yfJI7SSuiSQw6+GSd6uA==
X-CSE-MsgGUID: EobfPFa8SKGfvjIgWGdH7w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,145,1763452800"; 
   d="scan'208";a="201741039"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 12 Dec 2025 20:41:59 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vUHS9-0000000073e-0KPu;
	Sat, 13 Dec 2025 04:41:57 +0000
Date: Sat, 13 Dec 2025 12:41:49 +0800
From: kernel test robot <lkp@intel.com>
To: Steev Klimaszewski <steev@kali.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [steev:lenovo-x13s-linux-6.18.y 20/136]
 drivers/media/platform/qcom/camss/camss-csiphy.c:821:59: warning: variable
 'ret' is uninitialized when used here
Message-ID: <202512131256.pD7MTLNS-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/steev/linux lenovo-x13s-linux-6.18.y
head:   1ad3742bc4665f533944e0edc0a9e25aac26b275
commit: 4a4263c68fe3b527ca81e4458d5214f6ecb10b72 [20/136] media: qcom: camss: Add support for PHY API devices
config: x86_64-allmodconfig (https://download.01.org/0day-ci/archive/20251213/202512131256.pD7MTLNS-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251213/202512131256.pD7MTLNS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512131256.pD7MTLNS-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/media/platform/qcom/camss/camss-csiphy.c:821:59: warning: variable 'ret' is uninitialized when used here [-Wuninitialized]
     821 |                 dev_err(dev, "failed to get phy %s %d\n", csiphy->name, ret);
         |                                                                         ^~~
   include/linux/dev_printk.h:154:65: note: expanded from macro 'dev_err'
     154 |         dev_printk_index_wrap(_dev_err, KERN_ERR, dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                                                                        ^~~~~~~~~~~
   include/linux/dev_printk.h:110:23: note: expanded from macro 'dev_printk_index_wrap'
     110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
         |                                     ^~~~~~~~~~~
   drivers/media/platform/qcom/camss/camss-csiphy.c:808:9: note: initialize the variable 'ret' to silence this warning
     808 |         int ret;
         |                ^
         |                 = 0
   1 warning generated.


vim +/ret +821 drivers/media/platform/qcom/camss/camss-csiphy.c

   794	
   795	/*
   796	 * msm_csiphy_subdev_init - Initialize CSIPHY device structure and resources
   797	 * @csiphy: CSIPHY device
   798	 * @res: CSIPHY module resources table
   799	 * @id: CSIPHY module id
   800	 *
   801	 * Return 0 on success or a negative error code otherwise
   802	 */
   803	int msm_csiphy_subdev_init(struct camss *camss,
   804				   struct csiphy_device *csiphy,
   805				   const struct camss_subdev_resources *res, u8 id)
   806	{
   807		struct device *dev = camss->dev;
   808		int ret;
   809	
   810		csiphy->camss = camss;
   811		csiphy->id = id;
   812		csiphy->cfg.combo_mode = 0;
   813		csiphy->res = &res->csiphy;
   814	
   815		snprintf(csiphy->name, ARRAY_SIZE(csiphy->name), "csiphy%d",
   816			 csiphy->id);
   817	
   818		csiphy->phy = devm_phy_get(dev, csiphy->name);
   819	
   820		if (IS_ERR(csiphy->phy)) {
 > 821			dev_err(dev, "failed to get phy %s %d\n", csiphy->name, ret);
   822			return PTR_ERR(csiphy->phy);
   823		}
   824	
   825		ret = phy_init(csiphy->phy);
   826		if (ret)
   827			dev_err(dev, "phy %s init fail %d\n", csiphy->name, ret);
   828	
   829		return ret;
   830	}
   831	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
