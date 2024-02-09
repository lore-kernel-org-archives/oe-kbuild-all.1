Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE1A01849
	for <oe-kbuild-all@lists.linux.dev>; Fri,  9 Feb 2024 02:25:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707445514; cv=none; b=MFYw2Z15VxK9oGLPrOri0QrgL9sdwkN9pDGg3F3O7O9WAsmBDAOXj6fd8i6AjXWX/nF+OT4xlM9SUKnMrIiAWOhMdM2YOc1fJiZm6kHbwFKDBN51MY6r1lKozUwkGYv/Abkp1JmvSFwKQ2x46W8E/yS/Cn+RMmA/Fb87W4YvsgM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707445514; c=relaxed/simple;
	bh=35cf7HbIbzh50d3rgFHElxVmQQNw0qO7GAroM7J11n4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=OZ/7jFy6Er/adaPIn+g7z5D7gi7fVRFYRZ9ciSg8aUO5yixNA4Vhe8v+8Q2slQyr1PcesybiP7Tuvs2wobaSo+r+O4Ot95qzyEH7Udt9sTLvu6+7i9Atg56voOSNxSUmjrfyXUPHbMNSH6DVtoIcUYHF+BVc9NMnuqtfB9dXKRc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VJIwmjg1; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VJIwmjg1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707445513; x=1738981513;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=35cf7HbIbzh50d3rgFHElxVmQQNw0qO7GAroM7J11n4=;
  b=VJIwmjg1k76RzatLVapnUkkGe6k7m4CAsTOjDeGQ9wRte2XyPVmf4rOb
   oC8+RJBgXXXTbCeCKj3coq5gWjxKEmL/eMdyS5vlhd/tp+av2FJ752GAx
   z/2q6Xpm99YDW3NJWBcBU+LfBvx1bbGJ5fchNBU6EIN+4Kd/gkQ3PwKkL
   X0a0RigHhkH1A+ZcYwnj7N75W0HWUkEkCC3hb5HgZQsclIXdaC1yra2fj
   D0r9kFjj6kEGEUIGmIF+Xcfqhh5XBNhVpAwSfOKGyrqn7H5Ned7mmmj3M
   8YxwaGS0x6g4UPYyalLysss+uWU9ZdQjbavJ+F7YbQ+CfYhh8Fhrpnhk8
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10978"; a="1246825"
X-IronPort-AV: E=Sophos;i="6.05,255,1701158400"; 
   d="scan'208";a="1246825"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Feb 2024 18:25:12 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,255,1701158400"; 
   d="scan'208";a="2128604"
Received: from lkp-server01.sh.intel.com (HELO 01f0647817ea) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 08 Feb 2024 18:25:11 -0800
Received: from kbuild by 01f0647817ea with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rYGZg-0004Jk-0s;
	Fri, 09 Feb 2024 02:25:08 +0000
Date: Fri, 9 Feb 2024 10:25:00 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:6.1-2.2.x-imx 12557/17898]
 drivers/staging/media/imx/imx8-isi-cap.c:1873:12: warning:
 'mxc_isi_cap_runtime_resume' defined but not used
Message-ID: <202402091020.c1GNOhM3-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Freescale/linux-fslc 6.1-2.2.x-imx
head:   4e3fc5471376a15279ee5c99e791a7c7b065cbc1
commit: c3a00b880b47226aa0d7334aa3d16c481f73f30b [12557/17898] LF-9127-3: media: isi: support suspend/resume when camera is running
config: m68k-allyesconfig (https://download.01.org/0day-ci/archive/20240209/202402091020.c1GNOhM3-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240209/202402091020.c1GNOhM3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402091020.c1GNOhM3-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/staging/media/imx/imx8-isi-cap.c:60:21: warning: no previous prototype for 'mxc_isi_get_format' [-Wmissing-prototypes]
      60 | struct mxc_isi_fmt *mxc_isi_get_format(unsigned int index)
         |                     ^~~~~~~~~~~~~~~~~~
   drivers/staging/media/imx/imx8-isi-cap.c:68:21: warning: no previous prototype for 'mxc_isi_find_format' [-Wmissing-prototypes]
      68 | struct mxc_isi_fmt *mxc_isi_find_format(const u32 *pixelformat,
         |                     ^~~~~~~~~~~~~~~~~~~
   drivers/staging/media/imx/imx8-isi-cap.c:91:21: warning: no previous prototype for 'mxc_isi_get_src_fmt' [-Wmissing-prototypes]
      91 | struct mxc_isi_fmt *mxc_isi_get_src_fmt(struct v4l2_subdev_format *sd_fmt)
         |                     ^~~~~~~~~~~~~~~~~~~
   drivers/staging/media/imx/imx8-isi-cap.c:554:5: warning: no previous prototype for 'mxc_isi_ctrls_create' [-Wmissing-prototypes]
     554 | int mxc_isi_ctrls_create(struct mxc_isi_cap_dev *isi_cap)
         |     ^~~~~~~~~~~~~~~~~~~~
   drivers/staging/media/imx/imx8-isi-cap.c:578:6: warning: no previous prototype for 'mxc_isi_ctrls_delete' [-Wmissing-prototypes]
     578 | void mxc_isi_ctrls_delete(struct mxc_isi_cap_dev *isi_cap)
         |      ^~~~~~~~~~~~~~~~~~~~
>> drivers/staging/media/imx/imx8-isi-cap.c:1873:12: warning: 'mxc_isi_cap_runtime_resume' defined but not used [-Wunused-function]
    1873 | static int mxc_isi_cap_runtime_resume(struct device *dev)
         |            ^~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/staging/media/imx/imx8-isi-cap.c:1856:12: warning: 'mxc_isi_cap_runtime_suspend' defined but not used [-Wunused-function]
    1856 | static int mxc_isi_cap_runtime_suspend(struct device *dev)
         |            ^~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/mxc_isi_cap_runtime_resume +1873 drivers/staging/media/imx/imx8-isi-cap.c

  1855	
> 1856	static int mxc_isi_cap_runtime_suspend(struct device *dev)
  1857	{
  1858		struct mxc_isi_cap_dev *isi_cap = dev_get_drvdata(dev);
  1859		struct mxc_isi_dev *mxc_isi = mxc_isi_get_hostdata(isi_cap->pdev);
  1860	
  1861		if (isi_cap->runtime_suspend) {
  1862			if (isi_cap->is_streaming[isi_cap->id]) {
  1863				disp_mix_clks_enable(mxc_isi, false);
  1864				mxc_isi_channel_disable(mxc_isi);
  1865			}
  1866		}
  1867	
  1868		mxc_isi_clk_disable(mxc_isi);
  1869	
  1870		return 0;
  1871	}
  1872	
> 1873	static int mxc_isi_cap_runtime_resume(struct device *dev)
  1874	{
  1875		struct mxc_isi_cap_dev *isi_cap = dev_get_drvdata(dev);
  1876		struct mxc_isi_dev *mxc_isi = mxc_isi_get_hostdata(isi_cap->pdev);
  1877		int ret;
  1878	
  1879		ret = mxc_isi_clk_enable(mxc_isi);
  1880		if (ret) {
  1881			dev_err(dev, "%s clk enable fail\n", __func__);
  1882			return ret;
  1883		}
  1884	
  1885		if (isi_cap->runtime_suspend) {
  1886			if (isi_cap->is_streaming[isi_cap->id]) {
  1887				disp_mix_sft_rstn(mxc_isi, false);
  1888				disp_mix_clks_enable(mxc_isi, true);
  1889				mxc_isi_clean_registers(mxc_isi);
  1890				mxc_isi_config_parm(mxc_isi->isi_cap);
  1891				mxc_isi_channel_enable(mxc_isi, mxc_isi->m2m_enabled);
  1892			}
  1893		}
  1894	
  1895		return 0;
  1896	}
  1897	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
