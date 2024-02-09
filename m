Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C011B74E2B
	for <oe-kbuild-all@lists.linux.dev>; Fri,  9 Feb 2024 16:05:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707494736; cv=none; b=VHKXhmx/TOlhWuGO15pSaZBWnf6uOQTsp4zg0a0v1S2hea59uKQLZL6MPx3dU0YG8up1ij1FIEh7vIJjMBaOVZFjOYoWAVl7YBJ606aHoe7jIl6NVEEjVt8B9atHIc5jgOLYJsRJrVbWVAYnX9ZXTqQufv+cdNo18n8opjUOm9s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707494736; c=relaxed/simple;
	bh=kWSzt50lWyjR9G2Fli3yJOkdmcK3GcPsxYJKGtFcgTk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=PjL8gOthqvqqhC3mdkSaaVrfGBoj+qf787SG2UFGXJtcKtvLsti/zMRR21uwuVrJelRwITmCpMu3FNdjZGZkHb7ksZsKKEnST5tjgLeXyryIPpftjeTOr6oyIbchxAmxk1JsAPIH6B0/M3zUTGhxedXCMs9/jWjKwP05viOHVAg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=S8GstiDm; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="S8GstiDm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707494735; x=1739030735;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=kWSzt50lWyjR9G2Fli3yJOkdmcK3GcPsxYJKGtFcgTk=;
  b=S8GstiDm+I/E9i/XWmBeiJRwpdRwlfi4EHQMogYVl9IhFo9RlQX86eKl
   IwsSTmU6vzDjMMwtTeR4XFovkrCeWs2QJfHz8wSkU+zDGbGtyo1ep7Mmn
   Ta56m2MBVEaj85YJK53w5vtUsRfr8vDjQEn0Vh+romJr4HuIuArZNjuGA
   ZX7YF1wya6D7YDc+RFjf8nuzhfI0LfFh7w9+ApJCdCk/SN2HkuQVT6op2
   r2U6LduKzB6muaFsC1uQfMUaoMpwdCvyIV7CFTPUXSCVQ93ksH2XSKryZ
   n4JgNyx1bocOqf8gYMvPIhZ+VizwqP8PnRPJCLgsOwxEpEqLTL9KLXpVi
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10979"; a="5302684"
X-IronPort-AV: E=Sophos;i="6.05,257,1701158400"; 
   d="scan'208";a="5302684"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Feb 2024 08:05:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10979"; a="825174900"
X-IronPort-AV: E=Sophos;i="6.05,257,1701158400"; 
   d="scan'208";a="825174900"
Received: from lkp-server01.sh.intel.com (HELO 01f0647817ea) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 09 Feb 2024 08:05:31 -0800
Received: from kbuild by 01f0647817ea with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rYTNY-0004s6-2W;
	Fri, 09 Feb 2024 16:05:28 +0000
Date: Sat, 10 Feb 2024 00:05:06 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:6.1-2.2.x-imx 13613/17898]
 drivers/staging/media/imx/imx8-isi-m2m.c:1431:12: warning:
 'mxc_isi_m2m_runtime_suspend' defined but not used
Message-ID: <202402092317.nSysOX8Y-lkp@intel.com>
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
commit: 7e94f63be7a1e193e6426befc4e8760cc2e2acda [13613/17898] LF-9638 media: isi: Fix the isi-m2m play hang if convert format
config: m68k-allyesconfig (https://download.01.org/0day-ci/archive/20240209/202402092317.nSysOX8Y-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240209/202402092317.nSysOX8Y-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402092317.nSysOX8Y-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/staging/media/imx/imx8-isi-m2m.c: In function 'mxc_isi_m2m_frame_write_done':
   drivers/staging/media/imx/imx8-isi-m2m.c:95:32: warning: variable 'src_buf' set but not used [-Wunused-but-set-variable]
      95 |         struct mxc_isi_buffer *src_buf, *dst_buf;
         |                                ^~~~~~~
   drivers/staging/media/imx/imx8-isi-m2m.c: At top level:
   drivers/staging/media/imx/imx8-isi-m2m.c:1272:6: warning: no previous prototype for 'mxc_isi_m2m_ctrls_delete' [-Wmissing-prototypes]
    1272 | void mxc_isi_m2m_ctrls_delete(struct mxc_isi_m2m_dev *isi_m2m)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/staging/media/imx/imx8-isi-m2m.c:1431:12: warning: 'mxc_isi_m2m_runtime_suspend' defined but not used [-Wunused-function]
    1431 | static int mxc_isi_m2m_runtime_suspend(struct device *dev)
         |            ^~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/staging/media/imx/imx8-isi-m2m.c:1414:12: warning: 'mxc_isi_m2m_runtime_resume' defined but not used [-Wunused-function]
    1414 | static int mxc_isi_m2m_runtime_resume(struct device *dev)
         |            ^~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/mxc_isi_m2m_runtime_suspend +1431 drivers/staging/media/imx/imx8-isi-m2m.c

  1413	
> 1414	static int mxc_isi_m2m_runtime_resume(struct device *dev)
  1415	{
  1416		struct mxc_isi_m2m_dev *isi_m2m = dev_get_drvdata(dev);
  1417		struct mxc_isi_dev *mxc_isi = mxc_isi_get_hostdata(isi_m2m->pdev);
  1418		int ret;
  1419	
  1420		ret = mxc_isi_clk_enable(mxc_isi);
  1421		if (ret) {
  1422			dev_err(dev, "%s clk enable fail\n", __func__);
  1423			return ret;
  1424		}
  1425		disp_mix_sft_rstn(mxc_isi, false);
  1426		disp_mix_clks_enable(mxc_isi, true);
  1427	
  1428		return 0;
  1429	}
  1430	
> 1431	static int mxc_isi_m2m_runtime_suspend(struct device *dev)
  1432	{
  1433		struct mxc_isi_m2m_dev *isi_m2m = dev_get_drvdata(dev);
  1434		struct mxc_isi_dev *mxc_isi = mxc_isi_get_hostdata(isi_m2m->pdev);
  1435	
  1436		disp_mix_clks_enable(mxc_isi, false);
  1437		mxc_isi_clk_disable(mxc_isi);
  1438	
  1439		return 0;
  1440	}
  1441	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
