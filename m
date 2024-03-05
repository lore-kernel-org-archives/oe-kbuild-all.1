Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20A0BFBE9
	for <oe-kbuild-all@lists.linux.dev>; Tue,  5 Mar 2024 00:54:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709600077; cv=none; b=U89jrZdWUIsK91RSjWPsfXdyCdcMeo3KlkDiwCxKD37gpyFCj0dzJ6yNHCJU7aszc3gZd2hkGaDQ7HMleB/vj3kZK5dpnQRE5AEdUBiTXrTHlVxX9hyzv9fuhaJTkOGuAl6mX5SFYPEbvZ6senMzehs8jHwnU1mJV2zVNi4IZyg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709600077; c=relaxed/simple;
	bh=25GVKfnX0kW7hb3fEXIuO0c45J0Knv2+UEiRuDxBRfY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=mH9VsbhyLkU0hgcmttqF8XbO1MJCUlIjz+t75SU8feUQQ1KGoWCV6/m3IYW/HVtTJdhooSpUdOL254DczsfnBKRLGpUamLeXboRmy75O30u/UzjsPK5pIq87PSyEIS9N74bywvY+lwh8K5eLMYF9aSoeuEEg5BFjT/gpg+QGnqw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XtYBCzOR; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XtYBCzOR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709600076; x=1741136076;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=25GVKfnX0kW7hb3fEXIuO0c45J0Knv2+UEiRuDxBRfY=;
  b=XtYBCzORQfJ2XmcNsHXWlolkzf5NVTIr495l5JOx77Hf6EBnzYLwFPRp
   eQXXvkGEBrjkRjNgCosu8H6PkhCYsOdWJI7P2LzAh3Ym4hfd4PxmPiY72
   atQK6GLy9wUBCSwv75PT7JpJ/5XXDOLyPuHQp4AYktiI0qwF9CSefghYd
   aLRD7wyYCePbvNsBh1nBQmDtCn96K56PqBqOIzBmB0TQ50ZAq+UB+tZV7
   HpCs9Niy97qwl9c5tMSDtdqGNEwhm3qmfx/+EGtkTJwPAUFPFvErNTWem
   WqTnmpr/cRkAu7KPncTj1Gf/6d4+xdh20fy3Ul08+H1Mfl/pXz+/Mnp3O
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11003"; a="15529858"
X-IronPort-AV: E=Sophos;i="6.06,204,1705392000"; 
   d="scan'208";a="15529858"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Mar 2024 16:54:34 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,204,1705392000"; 
   d="scan'208";a="9137177"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 04 Mar 2024 16:54:26 -0800
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rhJ4Z-0002rx-1Z;
	Tue, 05 Mar 2024 00:54:23 +0000
Date: Tue, 5 Mar 2024 08:54:11 +0800
From: kernel test robot <lkp@intel.com>
To: jasperwang@tencent.com, kaixuxia@tencent.com, frankjpliu@tencent.com,
	kasong@tencent.com, sagazchen@tencent.com, kernelxing@tencent.com,
	aurelianliu@tencent.com, jason.zeng@intel.com, wu.zheng@intel.com,
	yingbao.jia@intel.com, pei.p.jia@intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: drivers/iommu/mtk_iommu.c:402:64: error: 'struct iommu_fwspec' has
 no member named 'iommu_priv'
Message-ID: <202403050833.0VNwIByR-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/OpenCloudOS/OpenCloudOS-Kernel.git linux-5.4/lts/5.4.119-20.0009.spr
head:   e116ff64db9be38b70fd5b050f5900435d428547
commit: 4a9714aa8fd6f64bfb6f213bf613d012ca810daa iommu: Move fwspec->iommu_priv to struct dev_iommu
date:   9 months ago
config: arm64-randconfig-001-20240305 (https://download.01.org/0day-ci/archive/20240305/202403050833.0VNwIByR-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240305/202403050833.0VNwIByR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403050833.0VNwIByR-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/iommu/mtk_iommu.c: In function 'mtk_iommu_attach_device':
>> drivers/iommu/mtk_iommu.c:402:64: error: 'struct iommu_fwspec' has no member named 'iommu_priv'
     402 |         struct mtk_iommu_data *data = dev_iommu_fwspec_get(dev)->iommu_priv;
         |                                                                ^~
   drivers/iommu/mtk_iommu.c: In function 'mtk_iommu_detach_device':
   drivers/iommu/mtk_iommu.c:421:64: error: 'struct iommu_fwspec' has no member named 'iommu_priv'
     421 |         struct mtk_iommu_data *data = dev_iommu_fwspec_get(dev)->iommu_priv;
         |                                                                ^~
   drivers/iommu/mtk_iommu.c: In function 'mtk_iommu_add_device':
   drivers/iommu/mtk_iommu.c:506:22: error: 'struct iommu_fwspec' has no member named 'iommu_priv'
     506 |         data = fwspec->iommu_priv;
         |                      ^~
   drivers/iommu/mtk_iommu.c: In function 'mtk_iommu_remove_device':
   drivers/iommu/mtk_iommu.c:525:22: error: 'struct iommu_fwspec' has no member named 'iommu_priv'
     525 |         data = fwspec->iommu_priv;
         |                      ^~
   drivers/iommu/mtk_iommu.c: In function 'mtk_iommu_of_xlate':
   drivers/iommu/mtk_iommu.c:561:20: error: 'struct iommu_fwspec' has no member named 'iommu_priv'
     561 |         if (!fwspec->iommu_priv) {
         |                    ^~
   drivers/iommu/mtk_iommu.c:567:23: error: 'struct iommu_fwspec' has no member named 'iommu_priv'
     567 |                 fwspec->iommu_priv = platform_get_drvdata(m4updev);
         |                       ^~
   drivers/iommu/mtk_iommu.c: At top level:
   drivers/iommu/mtk_iommu.c:578:27: error: initialization of 'int (*)(struct iommu_domain *, long unsigned int,  phys_addr_t,  size_t,  int,  gfp_t)' {aka 'int (*)(struct iommu_domain *, long unsigned int,  long long unsigned int,  long unsigned int,  int,  unsigned int)'} from incompatible pointer type 'int (*)(struct iommu_domain *, long unsigned int,  phys_addr_t,  size_t,  int)' {aka 'int (*)(struct iommu_domain *, long unsigned int,  long long unsigned int,  long unsigned int,  int)'} [-Werror=incompatible-pointer-types]
     578 |         .map            = mtk_iommu_map,
         |                           ^~~~~~~~~~~~~
   drivers/iommu/mtk_iommu.c:578:27: note: (near initialization for 'mtk_iommu_ops.map')
   cc1: some warnings being treated as errors


vim +402 drivers/iommu/mtk_iommu.c

^590eaf1fec755 Kaixu Xia 2021-03-16  397  
^590eaf1fec755 Kaixu Xia 2021-03-16  398  static int mtk_iommu_attach_device(struct iommu_domain *domain,
^590eaf1fec755 Kaixu Xia 2021-03-16  399  				   struct device *dev)
^590eaf1fec755 Kaixu Xia 2021-03-16  400  {
^590eaf1fec755 Kaixu Xia 2021-03-16  401  	struct mtk_iommu_domain *dom = to_mtk_domain(domain);
^590eaf1fec755 Kaixu Xia 2021-03-16 @402  	struct mtk_iommu_data *data = dev_iommu_fwspec_get(dev)->iommu_priv;
^590eaf1fec755 Kaixu Xia 2021-03-16  403  
^590eaf1fec755 Kaixu Xia 2021-03-16  404  	if (!data)
^590eaf1fec755 Kaixu Xia 2021-03-16  405  		return -ENODEV;
^590eaf1fec755 Kaixu Xia 2021-03-16  406  
^590eaf1fec755 Kaixu Xia 2021-03-16  407  	/* Update the pgtable base address register of the M4U HW */
^590eaf1fec755 Kaixu Xia 2021-03-16  408  	if (!data->m4u_dom) {
^590eaf1fec755 Kaixu Xia 2021-03-16  409  		data->m4u_dom = dom;
^590eaf1fec755 Kaixu Xia 2021-03-16  410  		writel(dom->cfg.arm_v7s_cfg.ttbr[0] & MMU_PT_ADDR_MASK,
^590eaf1fec755 Kaixu Xia 2021-03-16  411  		       data->base + REG_MMU_PT_BASE_ADDR);
^590eaf1fec755 Kaixu Xia 2021-03-16  412  	}
^590eaf1fec755 Kaixu Xia 2021-03-16  413  
^590eaf1fec755 Kaixu Xia 2021-03-16  414  	mtk_iommu_config(data, dev, true);
^590eaf1fec755 Kaixu Xia 2021-03-16  415  	return 0;
^590eaf1fec755 Kaixu Xia 2021-03-16  416  }
^590eaf1fec755 Kaixu Xia 2021-03-16  417  

:::::: The code at line 402 was first introduced by commit
:::::: 590eaf1fec755215547690e787cc7d83f58ea948 Init Repo base on linux 5.4.32 long term, and add base tlinux kernel interfaces.

:::::: TO: Kaixu Xia <kaixuxia@tencent.com>
:::::: CC: Kaixu Xia <kaixuxia@tencent.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
