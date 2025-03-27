Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F6B076035
	for <oe-kbuild-all@lists.linux.dev>; Thu, 27 Mar 2025 19:46:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743104802; cv=none; b=qHTrpgWXTdFNbX+o++dMZTb/ifodjgin9zoUzNCcST/zKllvJes7ezOo/+3ucW+F8iLWbwbcVMpZegbdQhop1ZbZB/GUpYtdpYDHDyA8R86UD/k8NY0FF7zUF/aRgEwaTz/QkbfPyFwJb4Fx2kWK1sl7ODg4v5HnNCjDIrOXtoQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743104802; c=relaxed/simple;
	bh=rmVmBFEf84ohkjBVeOKUzfEWmhr4Nt1ldFrf/o7pL5c=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=O+W+AiueTwbLfs9d3gQuV7nGnSi9qqEsiYYRs7cm4wy+taqcDyL6ILneMxzC1BOWWYgVFZdvAM2M/D9d24eWp6en7NIpKBdU9zeJSZXKP8HobFNWo+b2sPQFP73nVzq1642dok6oTszwHII2EdUlsp4AoUqu9162FZNOl1cNDB0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Da1tGO4t; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Da1tGO4t"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743104801; x=1774640801;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=rmVmBFEf84ohkjBVeOKUzfEWmhr4Nt1ldFrf/o7pL5c=;
  b=Da1tGO4t5G6EtZB9OGruh0w4LP+tSgNeJgqMPYtIII2pyP9hzzDiotcM
   Nz3YgcuNyTTckaofBrWuupODJO9NZJmwJXxPkQrZEzO/Tgt3qHd69Ozkb
   PNOzjXmkEVNxm/MdEAqD7daDp6bBmCLUo+QGCkcXIygUPvawJputdxw7x
   2VUKiL8g2TEQbLhPMYYL4f2Vc8vxdmfKGEykFzWwf2qmyXf6Wv8YIgAl4
   eVvhe4mtOzeO8+Y7BzAOC1AiXDO3a8ZMpRLgQU5MU2iMNJJep5zrja8RD
   qhuOuE4KpH+50nGFa3Nu9hbVq/T7MCbKLfeSDc2ASRfq0EuM59C70Hlaq
   g==;
X-CSE-ConnectionGUID: 2OnA5iRFQlecYB51zPQaAg==
X-CSE-MsgGUID: +2pj/EW0SrmGzD3xSL8CIQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11385"; a="48332293"
X-IronPort-AV: E=Sophos;i="6.14,281,1736841600"; 
   d="scan'208";a="48332293"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Mar 2025 12:46:40 -0700
X-CSE-ConnectionGUID: SPILvOW3TAKhFI365pRuHQ==
X-CSE-MsgGUID: r+K/EC27Qce8Jtf66IWqUg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,281,1736841600"; 
   d="scan'208";a="124998464"
Received: from lkp-server02.sh.intel.com (HELO e98e3655d6d2) ([10.239.97.151])
  by orviesa009.jf.intel.com with ESMTP; 27 Mar 2025 12:46:38 -0700
Received: from kbuild by e98e3655d6d2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1txtBU-0006vV-0t;
	Thu, 27 Mar 2025 19:46:36 +0000
Date: Fri, 28 Mar 2025 03:46:33 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:incoming-android15-6.6-desktop-chromeos 498/498]
 drivers/soc/mediatek/apusys/power/platform/mt8196_aputop.c:77:10: warning:
 returning 'int' from a function with return type 'struct regmap *' makes
 pointer from integer without a cast
Message-ID: <202503280338.q2MgyqN4-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common incoming-android15-6.6-desktop-chromeos
head:   971c23c737d79895eb40ddbbed5817f6ee6ea162
commit: ba7569b7dd6ba80e82bbc3c442071fe3c83beac3 [498/498] CHROMIUM: remoteproc: mediatek: Add APU config and timesync
config: arm-randconfig-004-20250328 (https://download.01.org/0day-ci/archive/20250328/202503280338.q2MgyqN4-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250328/202503280338.q2MgyqN4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503280338.q2MgyqN4-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/soc/mediatek/apusys/power/platform/mt8196_aputop.c: In function 'get_mbox_regmap':
>> drivers/soc/mediatek/apusys/power/platform/mt8196_aputop.c:77:10: warning: returning 'int' from a function with return type 'struct regmap *' makes pointer from integer without a cast [-Wint-conversion]
      return dev_err_probe(dev, -EPROBE_DEFER,
             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
             "failed to add device link between power and mailbox\n");
             ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +77 drivers/soc/mediatek/apusys/power/platform/mt8196_aputop.c

739035073d3d3a Karl Li 2024-09-27  53  
739035073d3d3a Karl Li 2024-09-27  54  static struct regmap *get_mbox_regmap(struct device *dev)
739035073d3d3a Karl Li 2024-09-27  55  {
739035073d3d3a Karl Li 2024-09-27  56  	struct device_node *mbox_node;
739035073d3d3a Karl Li 2024-09-27  57  	struct platform_device *mbox_pdev;
739035073d3d3a Karl Li 2024-09-27  58  	struct regmap *regmap = NULL;
739035073d3d3a Karl Li 2024-09-27  59  	struct device_link *link;
739035073d3d3a Karl Li 2024-09-27  60  
739035073d3d3a Karl Li 2024-09-27  61  	mbox_node = of_parse_phandle(dev->of_node, "mediatek,mbox-spare-reg", 0);
739035073d3d3a Karl Li 2024-09-27  62  	if (!mbox_node)
739035073d3d3a Karl Li 2024-09-27  63  		return ERR_PTR(-ENODEV);
739035073d3d3a Karl Li 2024-09-27  64  
739035073d3d3a Karl Li 2024-09-27  65  	mbox_pdev = of_find_device_by_node(mbox_node);
739035073d3d3a Karl Li 2024-09-27  66  	if (!mbox_pdev) {
739035073d3d3a Karl Li 2024-09-27  67  		regmap = ERR_PTR(-EPROBE_DEFER);
739035073d3d3a Karl Li 2024-09-27  68  		goto out_put_node;
739035073d3d3a Karl Li 2024-09-27  69  	}
739035073d3d3a Karl Li 2024-09-27  70  
739035073d3d3a Karl Li 2024-09-27  71  	regmap = dev_get_regmap(&mbox_pdev->dev, NULL);
739035073d3d3a Karl Li 2024-09-27  72  	if (!regmap)
739035073d3d3a Karl Li 2024-09-27  73  		regmap = ERR_PTR(-EINVAL);
739035073d3d3a Karl Li 2024-09-27  74  
739035073d3d3a Karl Li 2024-09-27  75  	link = device_link_add(dev, &mbox_pdev->dev, DL_FLAG_PM_RUNTIME);
739035073d3d3a Karl Li 2024-09-27  76  	if (!link)
739035073d3d3a Karl Li 2024-09-27 @77  		return dev_err_probe(dev, -EPROBE_DEFER,
739035073d3d3a Karl Li 2024-09-27  78  				     "failed to add device link between power and mailbox\n");
739035073d3d3a Karl Li 2024-09-27  79  
739035073d3d3a Karl Li 2024-09-27  80  	platform_device_put(mbox_pdev);
739035073d3d3a Karl Li 2024-09-27  81  
739035073d3d3a Karl Li 2024-09-27  82  out_put_node:
739035073d3d3a Karl Li 2024-09-27  83  	of_node_put(mbox_node);
739035073d3d3a Karl Li 2024-09-27  84  	return regmap;
739035073d3d3a Karl Li 2024-09-27  85  }
739035073d3d3a Karl Li 2024-09-27  86  

:::::: The code at line 77 was first introduced by commit
:::::: 739035073d3d3a1a1ea61c5f83a2d01ff070a92c CHROMIUM: soc: mediatek: apu: Add mt8196 apu power driver

:::::: TO: Karl Li <karl.li@mediatek.corp-partner.google.com>
:::::: CC: Hubert Mazur <hmazur@google.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
