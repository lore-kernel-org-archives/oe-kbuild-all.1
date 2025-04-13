Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECEF463CB
	for <oe-kbuild-all@lists.linux.dev>; Sun, 13 Apr 2025 08:46:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744533975; cv=none; b=A46G81LhzIagMctv38KEwqdoklIbGDEz9CCwTvneH9HAuR2rQXfPpt8A9G5ON4ZGZuZWeg9bqm6DHh/GDMBNyfQ5pu5HEXCbqlYu10lhFkCV5pwohHCcsFc3CuffbwaWvjDIa73HdPMP4E8qP6VLggNNX0JgXk0yv9Gf8MNxPvA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744533975; c=relaxed/simple;
	bh=/1qQ29Xvf11FhTEIYoZg9Y2KxFbM1Orx6UOrhgroQBI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=cI4TIwBDKcv5XcyYldNMpY4KQ5e4V5w5YMVCKqECh+JFr6Qgp9LgYdtKJMA7A95o41brjAwns8RIYwQgbLNyi1QdOvmHXcGx+umzxUykrIQXt4DH0sHbLXD1Wj8trz+crmkK//9WRsiKHMGb4WNTCy5KpRWKaBRwEFIiTQHEAl4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jEqVKJNc; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jEqVKJNc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744533973; x=1776069973;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/1qQ29Xvf11FhTEIYoZg9Y2KxFbM1Orx6UOrhgroQBI=;
  b=jEqVKJNct3hvSKse525qXKmlUh0++/Qav1QZAS33ioV1Fx12fjzqV8tK
   wP1ueEYEoRAU3X8F3QfTkYzdCN//e6s5HEXGKweCnMpD1c7E1CaoBntNw
   gzPOAKHmOBNtD2ZczJtuPUVoJPnyp/hVhEB66QmP/aAh8TSXrGCnv7R93
   DL7dGSYjQk/Sr43WiIMvX66oZJQiLdhas+98IpHIuoufLKL+mD7wrr2J3
   K9XgoPwqr19K1P180YWMKmD7vzb4yQknpRANG5apNtS1VblOnOPwE5GVL
   kfmUWhObWuGrBCz8HVo9YnTnq6AXfG5f9ekDPPZi310TK+P40J6T4SZ6q
   w==;
X-CSE-ConnectionGUID: iP4iSXE4Tb2XW9YLOwdc7w==
X-CSE-MsgGUID: HdSjDbCmQsSzYZ2bqfG3LA==
X-IronPort-AV: E=McAfee;i="6700,10204,11402"; a="46190656"
X-IronPort-AV: E=Sophos;i="6.15,209,1739865600"; 
   d="scan'208";a="46190656"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Apr 2025 01:46:12 -0700
X-CSE-ConnectionGUID: dy0TIT7SRzO5fDqGmwn3mQ==
X-CSE-MsgGUID: KXLReZi1Ste+Bvm7mIFM+A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,209,1739865600"; 
   d="scan'208";a="129415768"
Received: from lkp-server01.sh.intel.com (HELO b207828170a5) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 13 Apr 2025 01:46:12 -0700
Received: from kbuild by b207828170a5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u3sye-000CVY-2v;
	Sun, 13 Apr 2025 08:46:08 +0000
Date: Sun, 13 Apr 2025 16:45:43 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-6.6 55/55]
 drivers/gpu/drm/mediatek/mtk_dp_v2.c:6214:2-9: line 6214 is redundant
 because platform_get_irq() already prints an error
Message-ID: <202504131627.BiD1Vzn7-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-6.6
head:   18963e1b53e58a093c9b0d116e5d71f1d556cb05
commit: cbdfa10647ec4d4ec24d4c110f1472083871d8be [55/55] CHROMIUM: drm/mediatek: Change log format
config: arm64-randconfig-r054-20250411 (https://download.01.org/0day-ci/archive/20250413/202504131627.BiD1Vzn7-lkp@intel.com/config)
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504131627.BiD1Vzn7-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/gpu/drm/mediatek/mtk_dp_v2.c:6214:2-9: line 6214 is redundant because platform_get_irq() already prints an error

vim +6214 drivers/gpu/drm/mediatek/mtk_dp_v2.c

  6183	
  6184	static int mtk_drm_dp_probe_v2(struct platform_device *pdev)
  6185	{
  6186		struct mtk_dp *mtk_dp;
  6187		struct device *dev = &pdev->dev;
  6188		int ret;
  6189		struct mtk_drm_private *mtk_priv = dev_get_drvdata(dev);
  6190		int irq_num = 0;
  6191	
  6192		mtk_dp = devm_kzalloc(dev, sizeof(*mtk_dp), GFP_KERNEL);
  6193		if (!mtk_dp)
  6194			return -ENOMEM;
  6195	
  6196		memset(mtk_dp, 0, sizeof(struct mtk_dp));
  6197		mtk_dp->id = 0x0;
  6198		mtk_dp->dev = dev;
  6199		mtk_dp->priv = mtk_priv;
  6200		mtk_dp->disp_state = DP_DISP_STATE_NONE;
  6201	
  6202		mtk_dp->data = (struct mtk_dp_data *)of_device_get_match_data(dev);
  6203	
  6204		ret = mtk_dp_pm_init_v2(mtk_dp, pdev);
  6205		if (ret)
  6206			return ret;
  6207	
  6208		pm_runtime_enable(mtk_dp->dev);
  6209		drm_dbg_kms(mtk_dp->drm_dev, "[DPTX] pm_runtime_get_sync\n");
  6210		pm_runtime_get_sync(mtk_dp->dev);
  6211	
  6212		irq_num = platform_get_irq(pdev, 0);
  6213		if (irq_num < 0) {
> 6214			dev_err(mtk_dp->dev, "[DPTX] failed to request dp irq resource\n");
  6215			return -EPROBE_DEFER;
  6216		}
  6217	
  6218		ret = mtk_dp_dt_parse_pdata_v2(mtk_dp, pdev);
  6219		if (ret)
  6220			return ret;
  6221	
  6222		mtk_dp_aux_init_v2(mtk_dp);
  6223	
  6224		platform_set_drvdata(pdev, mtk_dp);
  6225	
  6226		if (mtk_dp->data->audio_supported) {
  6227			mutex_init(&mtk_dp->update_plugged_status_lock);
  6228	
  6229			ret = mtk_dp_register_audio_driver_v2(dev);
  6230			if (ret) {
  6231				dev_err(mtk_dp->dev, "[DPTX] Failed to register audio driver: %d\n", ret);
  6232				return ret;
  6233			}
  6234		}
  6235	
  6236		dev_dbg(mtk_dp->dev, "irq:%d\n", irq_num);
  6237		spin_lock_init(&mtk_dp->irq_thread_lock);
  6238	
  6239		irq_set_status_flags(irq_num, IRQ_TYPE_LEVEL_HIGH);
  6240		ret = devm_request_threaded_irq(&pdev->dev, irq_num, mtk_dp_hpd_event_v2,
  6241						mtk_dp_hpd_event_thread_v2,
  6242						IRQ_TYPE_LEVEL_HIGH, dev_name(&pdev->dev),
  6243						mtk_dp);
  6244		if (ret) {
  6245			dev_err(mtk_dp->dev, "[DPTX] failed to request mediatek dp irq\n");
  6246			return -EPROBE_DEFER;
  6247		}
  6248	
  6249		mtk_dp->bridge.funcs = &mtk_dp_bridge_funcs;
  6250		mtk_dp->bridge.of_node = dev->of_node;
  6251		mtk_dp->bridge.type = mtk_dp->data->bridge_type;
  6252		ret = devm_drm_bridge_add(dev, &mtk_dp->bridge);
  6253		if (ret)
  6254			return ret;
  6255	
  6256		mutex_init(&mtk_dp->hdcp_mutex);
  6257		init_waitqueue_head(&mtk_dp->hdcp_info.hdcp2_info.cp_irq_queue);
  6258		INIT_WORK(&mtk_dp->hdcp_enable_work, mtk_dp_hdcp_enable_handle);
  6259		INIT_WORK(&mtk_dp->hdcp_disable_work, mtk_dp_hdcp_disable_handle);
  6260		INIT_WORK(&mtk_dp->prop_work, mtk_dp_hdcp_prop_work);
  6261		INIT_DELAYED_WORK(&mtk_dp->check_work, mtk_dp_hdcp_check_work);
  6262		mtk_dp->hdcp_workqueue = create_workqueue("mtk_dp_hdcp_work");
  6263		if (!mtk_dp->hdcp_workqueue) {
  6264			dev_err(mtk_dp->dev, "[DPTX] failed to create hdcp work queue");
  6265			return -ENOMEM;
  6266		}
  6267	
  6268		mtk_dp_enable_mac_power_v2(mtk_dp);
  6269	
  6270		mtk_dp->pclk = devm_clk_get(mtk_dp->dev, "mux_dp");
  6271		if (IS_ERR(mtk_dp->pclk))
  6272			return dev_err_probe(dev, PTR_ERR(mtk_dp->pclk),
  6273					     "[DPTX] Failed to get pixel clock\n");
  6274		mtk_dp->pclk_src = devm_clk_get(mtk_dp->dev, "ck_26m");
  6275		if (IS_ERR(mtk_dp->pclk_src))
  6276			return dev_err_probe(dev, PTR_ERR(mtk_dp->pclk_src),
  6277					     "[DPTX] Failed to get pixel source clock\n");
  6278	
  6279		ret = clk_prepare_enable(mtk_dp->pclk);
  6280		if (ret < 0)
  6281			dev_err(mtk_dp->dev, "[DPTX] Failed to enable pclk:%d\n", ret);
  6282	
  6283		ret = clk_set_parent(mtk_dp->pclk, mtk_dp->pclk_src);
  6284		if (ret < 0)
  6285			dev_err(mtk_dp->dev, "[DPTX] Failed to clk_set_parent:%d\n", ret);
  6286	
  6287		dev_dbg(mtk_dp->dev, "pclk:%ld\n", clk_get_rate(mtk_dp->pclk));
  6288	
  6289		mtk_dp->notifier.notifier_call = mtk_drm_dp_notifier_v2;
  6290		ret = register_pm_notifier(&mtk_dp->notifier);
  6291		if (ret)
  6292			dev_err(mtk_dp->dev, "[DPTX] register pm notifier failed %d", ret);
  6293	
  6294		return ret;
  6295	}
  6296	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
