Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 175C514535A
	for <oe-kbuild-all@lists.linux.dev>; Fri, 26 Apr 2024 17:22:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714152125; cv=none; b=acuTpfiUoi4YeApQvBLlMu/nLFhTD2RwyIuwFJcfU8z6/JRqZ9TSFpeQAehl9e1NHJOzHJOLPb8N7ZCyq+LD5XGMAk4m1HWunnvHGrjcjAvGf1ALQ9Xv1jg0GGuTSpecMSrJwU2wLrr1bZcDlaJcsEm9O8Qz7FLMcJ/DWQ11NS0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714152125; c=relaxed/simple;
	bh=fyoktN6KqEt7ftr53DivUHO3EKF04qnlJO+UG7POtbo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=LPrYZPk/3akynKZQA8pzuskP4gFa/iyymEi9PBidqzyLmlSHUBycUgt3Sfum6Kjpq2q4O0O2982Or/xkP+w2zWnE2VENOJa3mbvScuGqkdFhO6gSMxzSZISnm/LAAW2WYwN9iNRcX9fmJNX/8x0F3aECWSDJV7YsIVovnMIFDps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ToMAoQs1; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ToMAoQs1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714152123; x=1745688123;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=fyoktN6KqEt7ftr53DivUHO3EKF04qnlJO+UG7POtbo=;
  b=ToMAoQs1ErV3af3KWVZ9xBP9yzaSqiLZMmnzvGLJaYU8qmxk5oBBSWvP
   8RikqNLLh1gNFSVi/oZI79I83JOJDHo244D5eGatPfizV6GG3lumIwAg+
   +YvHP6Qu9rFbGN+3MpDB3FyxUln+A+wKppfjixZtL+KvnLh7AIm7k0x69
   ClCUdTfoVxRssH7ikQQWRPR60XTID9prpeK1wnN3L0fmdmkoGeAKnl/uG
   wh1AklU/pSlmO0d/gwdcpxDqhUskU79/aBbII1drs4q1hxDoNoEuKopD5
   +lugTuqgic68Nt9/6e5Af1c30LM1NO6rWCRgBEmIH3Gog/WdbPWKoikmB
   g==;
X-CSE-ConnectionGUID: bhWKoyYOSYm1GW2raRkdHw==
X-CSE-MsgGUID: Z6L7ceGVTWmDHMHQ6CahGQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11056"; a="9758960"
X-IronPort-AV: E=Sophos;i="6.07,233,1708416000"; 
   d="scan'208";a="9758960"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Apr 2024 10:22:02 -0700
X-CSE-ConnectionGUID: Cu5HZw5MRp2JlojxpSkmFw==
X-CSE-MsgGUID: WpRYIaXSRtK8aqqkde4zxQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,233,1708416000"; 
   d="scan'208";a="25443202"
Received: from lkp-server01.sh.intel.com (HELO e434dd42e5a1) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 26 Apr 2024 10:22:01 -0700
Received: from kbuild by e434dd42e5a1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s0PGo-00040Q-1q;
	Fri, 26 Apr 2024 17:21:58 +0000
Date: Sat, 27 Apr 2024 01:21:41 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:5.15-2.2.x-imx 28551/29910]
 drivers/clk/imx/clk-imx8mp.c:413:27: warning: 'imx8mp_media_disp2_pix_sels'
 defined but not used
Message-ID: <202404270116.MsJ2RN1C-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Freescale/linux-fslc 5.15-2.2.x-imx
head:   ebcdbe7ec49f9c3405ee4b89e7ec279e313026f3
commit: 2e381d381b97b3bd1b65e173d165d3347707cd4c [28551/29910] clk: imx8mp: Add DISP2 pixel clock
config: arm64-defconfig (https://download.01.org/0day-ci/archive/20240427/202404270116.MsJ2RN1C-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240427/202404270116.MsJ2RN1C-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404270116.MsJ2RN1C-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/clk/imx/clk-imx8mp.c: In function 'imx8mp_clocks_probe':
   drivers/clk/imx/clk-imx8mp.c:972:13: error: 'IMX8MP_CLK_USB_SUSP' undeclared (first use in this function); did you mean 'IMX8MP_CLK_USB_ROOT'?
     972 |         hws[IMX8MP_CLK_USB_SUSP] = imx_clk_hw_gate2_shared2("usb_suspend_clk", "osc_32k", ccm_base + 0x44d0, 0, &share_count_usb);
         |             ^~~~~~~~~~~~~~~~~~~
         |             IMX8MP_CLK_USB_ROOT
   drivers/clk/imx/clk-imx8mp.c:972:13: note: each undeclared identifier is reported only once for each function it appears in
   drivers/clk/imx/clk-imx8mp.c: At top level:
>> drivers/clk/imx/clk-imx8mp.c:413:27: warning: 'imx8mp_media_disp2_pix_sels' defined but not used [-Wunused-const-variable=]
     413 | static const char * const imx8mp_media_disp2_pix_sels[] = {"osc_24m", "video_pll1_out", "audio_pll2_out",
         |                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/imx8mp_media_disp2_pix_sels +413 drivers/clk/imx/clk-imx8mp.c

7ab227210110a4 Peng Fan    2020-02-19  320  
9c140d9926761b Anson Huang 2020-01-08  321  static const char * const imx8mp_m7_sels[] = {"osc_24m", "sys_pll2_200m", "sys_pll2_250m",
9c140d9926761b Anson Huang 2020-01-08  322  					      "vpu_pll_out", "sys_pll1_800m", "audio_pll1_out",
9c140d9926761b Anson Huang 2020-01-08  323  					      "video_pll1_out", "sys_pll3_out", };
9c140d9926761b Anson Huang 2020-01-08  324  
9c140d9926761b Anson Huang 2020-01-08  325  static const char * const imx8mp_ml_sels[] = {"osc_24m", "gpu_pll_out", "sys_pll1_800m",
9c140d9926761b Anson Huang 2020-01-08  326  					      "sys_pll3_out", "sys_pll2_1000m", "audio_pll1_out",
9c140d9926761b Anson Huang 2020-01-08  327  					      "video_pll1_out", "audio_pll2_out", };
9c140d9926761b Anson Huang 2020-01-08  328  
9c140d9926761b Anson Huang 2020-01-08  329  static const char * const imx8mp_gpu3d_core_sels[] = {"osc_24m", "gpu_pll_out", "sys_pll1_800m",
9c140d9926761b Anson Huang 2020-01-08  330  						      "sys_pll3_out", "sys_pll2_1000m", "audio_pll1_out",
9c140d9926761b Anson Huang 2020-01-08  331  						      "video_pll1_out", "audio_pll2_out", };
9c140d9926761b Anson Huang 2020-01-08  332  
9c140d9926761b Anson Huang 2020-01-08  333  static const char * const imx8mp_gpu3d_shader_sels[] = {"osc_24m", "gpu_pll_out", "sys_pll1_800m",
9c140d9926761b Anson Huang 2020-01-08  334  							"sys_pll3_out", "sys_pll2_1000m", "audio_pll1_out",
9c140d9926761b Anson Huang 2020-01-08  335  							"video_pll1_out", "audio_pll2_out", };
9c140d9926761b Anson Huang 2020-01-08  336  
9c140d9926761b Anson Huang 2020-01-08  337  static const char * const imx8mp_gpu2d_sels[] = {"osc_24m", "gpu_pll_out", "sys_pll1_800m",
9c140d9926761b Anson Huang 2020-01-08  338  						 "sys_pll3_out", "sys_pll2_1000m", "audio_pll1_out",
9c140d9926761b Anson Huang 2020-01-08  339  						 "video_pll1_out", "audio_pll2_out", };
9c140d9926761b Anson Huang 2020-01-08  340  
9c140d9926761b Anson Huang 2020-01-08  341  static const char * const imx8mp_audio_axi_sels[] = {"osc_24m", "gpu_pll_out", "sys_pll1_800m",
9c140d9926761b Anson Huang 2020-01-08  342  						     "sys_pll3_out", "sys_pll2_1000m", "audio_pll1_out",
9c140d9926761b Anson Huang 2020-01-08  343  						     "video_pll1_out", "audio_pll2_out", };
9c140d9926761b Anson Huang 2020-01-08  344  
9c140d9926761b Anson Huang 2020-01-08  345  static const char * const imx8mp_hsio_axi_sels[] = {"osc_24m", "sys_pll2_500m", "sys_pll1_800m",
9c140d9926761b Anson Huang 2020-01-08  346  						    "sys_pll2_100m", "sys_pll2_200m", "clk_ext2",
9c140d9926761b Anson Huang 2020-01-08  347  						    "clk_ext4", "audio_pll2_out", };
9c140d9926761b Anson Huang 2020-01-08  348  
9c140d9926761b Anson Huang 2020-01-08  349  static const char * const imx8mp_media_isp_sels[] = {"osc_24m", "sys_pll2_1000m", "sys_pll1_800m",
9c140d9926761b Anson Huang 2020-01-08  350  						     "sys_pll3_out", "sys_pll1_400m", "audio_pll2_out",
9c140d9926761b Anson Huang 2020-01-08  351  						     "clk_ext1", "sys_pll2_500m", };
9c140d9926761b Anson Huang 2020-01-08  352  
9c140d9926761b Anson Huang 2020-01-08  353  static const char * const imx8mp_main_axi_sels[] = {"osc_24m", "sys_pll2_333m", "sys_pll1_800m",
9c140d9926761b Anson Huang 2020-01-08  354  						    "sys_pll2_250m", "sys_pll2_1000m", "audio_pll1_out",
9c140d9926761b Anson Huang 2020-01-08  355  						    "video_pll1_out", "sys_pll1_100m",};
9c140d9926761b Anson Huang 2020-01-08  356  
9c140d9926761b Anson Huang 2020-01-08  357  static const char * const imx8mp_enet_axi_sels[] = {"osc_24m", "sys_pll1_266m", "sys_pll1_800m",
9c140d9926761b Anson Huang 2020-01-08  358  						    "sys_pll2_250m", "sys_pll2_200m", "audio_pll1_out",
9c140d9926761b Anson Huang 2020-01-08  359  						    "video_pll1_out", "sys_pll3_out", };
9c140d9926761b Anson Huang 2020-01-08  360  
9c140d9926761b Anson Huang 2020-01-08  361  static const char * const imx8mp_nand_usdhc_sels[] = {"osc_24m", "sys_pll1_266m", "sys_pll1_800m",
9c140d9926761b Anson Huang 2020-01-08  362  						      "sys_pll2_200m", "sys_pll1_133m", "sys_pll3_out",
9c140d9926761b Anson Huang 2020-01-08  363  						      "sys_pll2_250m", "audio_pll1_out", };
9c140d9926761b Anson Huang 2020-01-08  364  
9c140d9926761b Anson Huang 2020-01-08  365  static const char * const imx8mp_vpu_bus_sels[] = {"osc_24m", "sys_pll1_800m", "vpu_pll_out",
9c140d9926761b Anson Huang 2020-01-08  366  						   "audio_pll2_out", "sys_pll3_out", "sys_pll2_1000m",
9c140d9926761b Anson Huang 2020-01-08  367  						   "sys_pll2_200m", "sys_pll1_100m", };
9c140d9926761b Anson Huang 2020-01-08  368  
9c140d9926761b Anson Huang 2020-01-08  369  static const char * const imx8mp_media_axi_sels[] = {"osc_24m", "sys_pll2_1000m", "sys_pll1_800m",
9c140d9926761b Anson Huang 2020-01-08  370  						     "sys_pll3_out", "sys_pll1_40m", "audio_pll2_out",
9c140d9926761b Anson Huang 2020-01-08  371  						     "clk_ext1", "sys_pll2_500m", };
9c140d9926761b Anson Huang 2020-01-08  372  
9c140d9926761b Anson Huang 2020-01-08  373  static const char * const imx8mp_media_apb_sels[] = {"osc_24m", "sys_pll2_125m", "sys_pll1_800m",
9c140d9926761b Anson Huang 2020-01-08  374  						     "sys_pll3_out", "sys_pll1_40m", "audio_pll2_out",
9c140d9926761b Anson Huang 2020-01-08  375  						     "clk_ext1", "sys_pll1_133m", };
9c140d9926761b Anson Huang 2020-01-08  376  
9c140d9926761b Anson Huang 2020-01-08  377  static const char * const imx8mp_gpu_axi_sels[] = {"osc_24m", "sys_pll1_800m", "gpu_pll_out",
9c140d9926761b Anson Huang 2020-01-08  378  						   "sys_pll3_out", "sys_pll2_1000m", "audio_pll1_out",
9c140d9926761b Anson Huang 2020-01-08  379  						   "video_pll1_out", "audio_pll2_out", };
9c140d9926761b Anson Huang 2020-01-08  380  
9c140d9926761b Anson Huang 2020-01-08  381  static const char * const imx8mp_gpu_ahb_sels[] = {"osc_24m", "sys_pll1_800m", "gpu_pll_out",
9c140d9926761b Anson Huang 2020-01-08  382  						   "sys_pll3_out", "sys_pll2_1000m", "audio_pll1_out",
9c140d9926761b Anson Huang 2020-01-08  383  						   "video_pll1_out", "audio_pll2_out", };
9c140d9926761b Anson Huang 2020-01-08  384  
9c140d9926761b Anson Huang 2020-01-08  385  static const char * const imx8mp_noc_sels[] = {"osc_24m", "sys_pll1_800m", "sys_pll3_out",
9c140d9926761b Anson Huang 2020-01-08  386  					       "sys_pll2_1000m", "sys_pll2_500m", "audio_pll1_out",
9c140d9926761b Anson Huang 2020-01-08  387  					       "video_pll1_out", "audio_pll2_out", };
9c140d9926761b Anson Huang 2020-01-08  388  
9c140d9926761b Anson Huang 2020-01-08  389  static const char * const imx8mp_noc_io_sels[] = {"osc_24m", "sys_pll1_800m", "sys_pll3_out",
9c140d9926761b Anson Huang 2020-01-08  390  						  "sys_pll2_1000m", "sys_pll2_500m", "audio_pll1_out",
9c140d9926761b Anson Huang 2020-01-08  391  						  "video_pll1_out", "audio_pll2_out", };
9c140d9926761b Anson Huang 2020-01-08  392  
9c140d9926761b Anson Huang 2020-01-08  393  static const char * const imx8mp_ml_axi_sels[] = {"osc_24m", "sys_pll1_800m", "gpu_pll_out",
9c140d9926761b Anson Huang 2020-01-08  394  						  "sys_pll3_out", "sys_pll2_1000m", "audio_pll1_out",
9c140d9926761b Anson Huang 2020-01-08  395  						  "video_pll1_out", "audio_pll2_out", };
9c140d9926761b Anson Huang 2020-01-08  396  
9c140d9926761b Anson Huang 2020-01-08  397  static const char * const imx8mp_ml_ahb_sels[] = {"osc_24m", "sys_pll1_800m", "gpu_pll_out",
9c140d9926761b Anson Huang 2020-01-08  398  						  "sys_pll3_out", "sys_pll2_1000m", "audio_pll1_out",
9c140d9926761b Anson Huang 2020-01-08  399  						  "video_pll1_out", "audio_pll2_out", };
9c140d9926761b Anson Huang 2020-01-08  400  
9c140d9926761b Anson Huang 2020-01-08  401  static const char * const imx8mp_ahb_sels[] = {"osc_24m", "sys_pll1_133m", "sys_pll1_800m",
9c140d9926761b Anson Huang 2020-01-08  402  					       "sys_pll1_400m", "sys_pll2_125m", "sys_pll3_out",
9c140d9926761b Anson Huang 2020-01-08  403  					       "audio_pll1_out", "video_pll1_out", };
9c140d9926761b Anson Huang 2020-01-08  404  
9c140d9926761b Anson Huang 2020-01-08  405  static const char * const imx8mp_audio_ahb_sels[] = {"osc_24m", "sys_pll2_500m", "sys_pll1_800m",
9c140d9926761b Anson Huang 2020-01-08  406  						     "sys_pll2_1000m", "sys_pll2_166m", "sys_pll3_out",
9c140d9926761b Anson Huang 2020-01-08  407  						     "audio_pll1_out", "video_pll1_out", };
9c140d9926761b Anson Huang 2020-01-08  408  
9c140d9926761b Anson Huang 2020-01-08  409  static const char * const imx8mp_mipi_dsi_esc_rx_sels[] = {"osc_24m", "sys_pll2_100m", "sys_pll1_80m",
9c140d9926761b Anson Huang 2020-01-08  410  							   "sys_pll1_800m", "sys_pll2_1000m",
9c140d9926761b Anson Huang 2020-01-08  411  							   "sys_pll3_out", "clk_ext3", "audio_pll2_out", };
9c140d9926761b Anson Huang 2020-01-08  412  
1cd6b5552d3f67 Liu Ying    2019-10-16 @413  static const char * const imx8mp_media_disp2_pix_sels[] = {"osc_24m", "video_pll1_out", "audio_pll2_out",
1cd6b5552d3f67 Liu Ying    2019-10-16  414  							   "audio_pll1_out", "sys_pll1_800m", "sys_pll2_1000m",
1cd6b5552d3f67 Liu Ying    2019-10-16  415  							   "sys_pll3_out", "clk_ext4", };
1cd6b5552d3f67 Liu Ying    2019-10-16  416  

:::::: The code at line 413 was first introduced by commit
:::::: 1cd6b5552d3f6706ed84289fb8a3d527c18b5bab MLK-23252-1 clk: imx8mp: Add DISP2 pixel clock

:::::: TO: Liu Ying <victor.liu@nxp.com>
:::::: CC: Dong Aisheng <aisheng.dong@nxp.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
