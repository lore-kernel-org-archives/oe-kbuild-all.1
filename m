Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 588B716DC28
	for <oe-kbuild-all@lists.linux.dev>; Sun,  5 Jul 2026 00:35:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783211719; cv=none; b=BlpZeulPmXEpVSqZ6EeAQBxEOcjOK6BWl0eZznUOOmVeOG5wMAvz38VxLc3iuBnV8+Wh0qX+Zip53HceNBRX8WXAW2ZRaEPadaaIFcsnhQ27Q1Y7m3IaYX7tfnzglNMVAZlbGtJ4nsgl3be15n3Z5GwWBpkDdy5G7OaEHWz9W3o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783211719; c=relaxed/simple;
	bh=jg0LM1sgMfczFU3joHbLmR4QES2Gw27ZosGMHurt+mY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=JSrvDprhJu/cIMn5XVJexnBbJLxEqOQSCg23PZFUtloSNkZRBpCeg8dW2X1YZL3ipjNgSlhgRSQJgFRiNX2RJdLxfyHqt6Ke4tv20hc1tbYrR5uY5xLFHNlO/gcUrJkRHjnOwBRFqv3Jled3SKaNo7p9F3uKFNMjqYvX07ewOTE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QUadpLEo; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QUadpLEo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783211716; x=1814747716;
  h=date:from:to:cc:subject:message-id;
  bh=jg0LM1sgMfczFU3joHbLmR4QES2Gw27ZosGMHurt+mY=;
  b=QUadpLEoG6+SgH2SAV3qIP1eNJskzhfupvo6zR1CEHSZK5rYqZadMpUo
   tK1aCHOpr1CD2fnWh0OA9393bPJcNG0KzwrtY3P8e6IvDITNep8ZvPhBs
   i/lR/q7gVMe8VoQkRA1SaH3t3Pry4w7sWoljVf4BTbHHBeaySDgdLqDjb
   gn8vQh4+iWCAlBKJy2heDuz3bM59tC3J5br/nuG5GZhHQwQoyPleHd0/m
   13kmfA/2BfoECcNi7w1gi4jZBIK7JSSwwGBx50SY5SRjdgZBcWk03+/gu
   nQhah1IJ4F+rxMIox1oxU6WX4ZcASbpQQcp17DT5bsrMD+xHqIug/tIRr
   Q==;
X-CSE-ConnectionGUID: lJMtY9K4QwW/GQrHhJFJBg==
X-CSE-MsgGUID: W6nghNaIRAup74LVPfkbgw==
X-IronPort-AV: E=McAfee;i="6800,10657,11837"; a="83001928"
X-IronPort-AV: E=Sophos;i="6.25,148,1779174000"; 
   d="scan'208";a="83001928"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jul 2026 17:35:15 -0700
X-CSE-ConnectionGUID: mEBIJYiOSvm0kZcgXVMABw==
X-CSE-MsgGUID: yFOWut4HToO+erOqUOxgdg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,148,1779174000"; 
   d="scan'208";a="252322324"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa010.jf.intel.com with ESMTP; 04 Jul 2026 17:35:15 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wgApD-00000000DNn-3KHp;
	Sun, 05 Jul 2026 00:35:11 +0000
Date: Sun, 05 Jul 2026 08:34:27 +0800
From: kernel test robot <lkp@intel.com>
To: "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: 
 [bod:qcom-laptops-v6.18-rc4-camss-icp-bps-ipe-icp-boots+stats-b4 96/121]
 drivers/media/platform/qcom/camss/camss-csiphy.c:798:29: warning: unused
 variable 'np'
Message-ID: <202607050850.EEDhuMeG-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/bod/linux.git qcom-laptops-v6.18-rc4-camss-icp-bps-ipe-icp-boots+stats-b4
head:   ebd1e440443121d18f730ab2aeea5586a754f36f
commit: 2fcf15956bf417c391c1946d3fd091d926185ece [96/121] media: qcom: camss: Add support for PHY API devices
config: nios2-allmodconfig (https://download.01.org/0day-ci/archive/20260705/202607050850.EEDhuMeG-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260705/202607050850.EEDhuMeG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607050850.EEDhuMeG-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/media/platform/qcom/camss/camss-csiphy.c: In function 'msm_csiphy_subdev_init':
>> drivers/media/platform/qcom/camss/camss-csiphy.c:798:29: warning: unused variable 'np' [-Wunused-variable]
     798 |         struct device_node *np;
         |                             ^~


vim +/np +798 drivers/media/platform/qcom/camss/camss-csiphy.c

   784	
   785	/*
   786	 * msm_csiphy_subdev_init - Initialize CSIPHY device structure and resources
   787	 * @csiphy: CSIPHY device
   788	 * @res: CSIPHY module resources table
   789	 * @id: CSIPHY module id
   790	 *
   791	 * Return 0 on success or a negative error code otherwise
   792	 */
   793	int msm_csiphy_subdev_init(struct camss *camss,
   794				   struct csiphy_device *csiphy,
   795				   const struct camss_subdev_resources *res, u8 id)
   796	{
   797		struct device *dev = camss->dev;
 > 798		struct device_node *np;
   799		struct of_phandle_args args;
   800		u8 combo_mode;
   801		int idx;
   802		int ret;
   803	
   804		snprintf(csiphy->name, ARRAY_SIZE(csiphy->name), "csiphy%d", id);
   805	
   806		idx = of_property_match_string(dev->of_node, "phy-names", csiphy->name);
   807		if (idx < 0) {
   808			dev_err(dev, "%s not found\n", csiphy->name);
   809			return idx;
   810		}
   811	
   812		ret = of_parse_phandle_with_args(dev->of_node, "phys", "#phy-cells", idx, &args);
   813		if (ret < 0) {
   814			dev_err(dev, "unable to parase phys args %s\n", csiphy->name);
   815			return ret;
   816		}
   817	
   818		if (!of_device_is_available(args.np))
   819			goto put_np;
   820	
   821		combo_mode = args.args[0];
   822		if (combo_mode != PHY_TYPE_DPHY) {
   823			dev_err(dev, "%s mode %d not supported\n", csiphy->name, combo_mode);
   824			ret = -ENOTSUPP;
   825			goto put_np;
   826		}
   827	
   828		csiphy->phy = devm_phy_get(dev, csiphy->name);
   829		if (IS_ERR(csiphy->phy)) {
   830			ret = PTR_ERR(csiphy->phy);
   831			goto put_np;
   832		}
   833	
   834		csiphy->camss = camss;
   835		csiphy->id = id;
   836		csiphy->cfg.combo_mode = combo_mode;
   837		csiphy->res = &res->csiphy;
   838	
   839		ret = phy_init(csiphy->phy);
   840		if (ret)
   841			dev_err(dev, "phy %s init fail %d\n", csiphy->name, ret);
   842	
   843	put_np:
   844		of_node_put(args.np);
   845	
   846		return ret;
   847	}
   848	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
