Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D25EC10A1E
	for <oe-kbuild-all@lists.linux.dev>; Tue, 27 May 2025 02:48:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748314101; cv=none; b=Z4oenUjmw9qaINuMNM7/JGhzRPweFkumVpPJiD57sfr76nzc9ehMN4hemr5rj0brvIdpUiSgNzbjcw32QFB++MwK2NkSGe0kpRet237d2chNFsTTSFTLQOm41rWRDFsQJEuq+If+YF3Lih2ho05bYYNbLbnW/Z7hYPcrgHigMGo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748314101; c=relaxed/simple;
	bh=1iLyBDTxWfdkzrza7QpHfKJOumW2QDRoXnSGD7bTtDM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=QNipJAQv2tyqGZ388nLovyJPHfyT3YidkM3z3+kSWo+2102yy3EbRvjiSVW3QKZvoMdRiSfld3OPZD02YGI1gTX978dSMIFRoAWza4F8dqI//bYcpZ26rCRHxM2K9Z4QL5LeDsdbgCV99545ET1PWQZm3j/6CfEUWPzFws8+yHo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jpsGteaN; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jpsGteaN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748314100; x=1779850100;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=1iLyBDTxWfdkzrza7QpHfKJOumW2QDRoXnSGD7bTtDM=;
  b=jpsGteaND+fy6njIUyFNCV+nS0BMyOrNHT0xOFXuEtM9MNwjRb87QlWX
   EmZuf/lM6xgJ0Nf5FF1SZz8azqGfxgV9K4RjKWZr6tc8GHNHEyjS49/V1
   Ejk28ABcTB5lUo5zab5iL7poIDxW5HRrRSMlYBjDSzSv3CBEKEc7UcTby
   L0w+j8pkIP88TDP1C3rTH2BEfa2LLb/gdVl9FDFvL0VT9xR+IlifV9cf6
   ic94CE3TsX3YCxG9sKCeM0CjZkxYzlb6HhHaf3/MGexJpDZhMYChynmea
   G+y00B6iiDNSoME2PAceXHPgRSa57Dt2wZimBJl9KhsAO7o6WLuiDPHNP
   Q==;
X-CSE-ConnectionGUID: HffGEWgnSPqs42Bmdr1k4Q==
X-CSE-MsgGUID: KTZqMBHOSLK+hgZve/M+ZQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11445"; a="49988255"
X-IronPort-AV: E=Sophos;i="6.15,317,1739865600"; 
   d="scan'208";a="49988255"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 May 2025 19:48:17 -0700
X-CSE-ConnectionGUID: UvT82AKqSnazt+o0DOdgBA==
X-CSE-MsgGUID: whFmM9LeThGDhSKiM5iAXw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,317,1739865600"; 
   d="scan'208";a="142577739"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 26 May 2025 19:48:14 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uJkMO-000Spx-1r;
	Tue, 27 May 2025 02:48:12 +0000
Date: Tue, 27 May 2025 10:47:23 +0800
From: kernel test robot <lkp@intel.com>
To: Jason-JH Lin <jason-jh.lin@mediatek.com>
Cc: oe-kbuild-all@lists.linux.dev, Jassi Brar <jassisinghbrar@gmail.com>
Subject: [jassibrar-mailbox:for-next 15/18]
 drivers/media/platform/mediatek/mdp3/mtk-mdp3-core.c:316:27: error: implicit
 declaration of function 'cmdq_get_shift_pa'; did you mean
 'cmdq_pkt_write_s'?
Message-ID: <202505271039.iba4MDqV-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jassibrar/mailbox.git for-next
head:   e87e3f289417d6669154b1f84a58cc1aaec7576a
commit: 1f808916c0a6266379ac532d307d1f4334eeef02 [15/18] mailbox: mtk-cmdq: Remove unsued cmdq_get_shift_pa()
config: arm64-randconfig-001-20250527 (https://download.01.org/0day-ci/archive/20250527/202505271039.iba4MDqV-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250527/202505271039.iba4MDqV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505271039.iba4MDqV-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/media/platform/mediatek/mdp3/mtk-mdp3-core.c: In function 'mdp_probe':
>> drivers/media/platform/mediatek/mdp3/mtk-mdp3-core.c:316:27: error: implicit declaration of function 'cmdq_get_shift_pa'; did you mean 'cmdq_pkt_write_s'? [-Werror=implicit-function-declaration]
      mdp->cmdq_shift_pa[i] = cmdq_get_shift_pa(mdp->cmdq_clt[i]->chan);
                              ^~~~~~~~~~~~~~~~~
                              cmdq_pkt_write_s
   cc1: some warnings being treated as errors


vim +316 drivers/media/platform/mediatek/mdp3/mtk-mdp3-core.c

e280d1a0eb93354 Moudy Ho                   2023-12-20  221  
61890ccaefaff89 Moudy Ho                   2022-08-23  222  static int mdp_probe(struct platform_device *pdev)
61890ccaefaff89 Moudy Ho                   2022-08-23  223  {
61890ccaefaff89 Moudy Ho                   2022-08-23  224  	struct device *dev = &pdev->dev;
61890ccaefaff89 Moudy Ho                   2022-08-23  225  	struct mdp_dev *mdp;
61890ccaefaff89 Moudy Ho                   2022-08-23  226  	struct platform_device *mm_pdev;
4294b9d6c8c4050 Moudy Ho                   2023-12-20  227  	struct resource *res;
50709e6343e325c Moudy Ho                   2023-03-27  228  	int ret, i, mutex_id;
61890ccaefaff89 Moudy Ho                   2022-08-23  229  
61890ccaefaff89 Moudy Ho                   2022-08-23  230  	mdp = kzalloc(sizeof(*mdp), GFP_KERNEL);
61890ccaefaff89 Moudy Ho                   2022-08-23  231  	if (!mdp) {
61890ccaefaff89 Moudy Ho                   2022-08-23  232  		ret = -ENOMEM;
61890ccaefaff89 Moudy Ho                   2022-08-23  233  		goto err_return;
61890ccaefaff89 Moudy Ho                   2022-08-23  234  	}
61890ccaefaff89 Moudy Ho                   2022-08-23  235  
61890ccaefaff89 Moudy Ho                   2022-08-23  236  	mdp->pdev = pdev;
61890ccaefaff89 Moudy Ho                   2022-08-23  237  	mdp->mdp_data = of_device_get_match_data(&pdev->dev);
61890ccaefaff89 Moudy Ho                   2022-08-23  238  
4294b9d6c8c4050 Moudy Ho                   2023-12-20  239  	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
4294b9d6c8c4050 Moudy Ho                   2023-12-20  240  	if (res->start != mdp->mdp_data->mdp_con_res) {
4294b9d6c8c4050 Moudy Ho                   2023-12-20  241  		platform_set_drvdata(pdev, mdp);
4294b9d6c8c4050 Moudy Ho                   2023-12-20  242  		goto success_return;
4294b9d6c8c4050 Moudy Ho                   2023-12-20  243  	}
4294b9d6c8c4050 Moudy Ho                   2023-12-20  244  
e280d1a0eb93354 Moudy Ho                   2023-12-20  245  	ret = mdp_mm_subsys_deploy(mdp, MDP_INFRA_MMSYS);
e280d1a0eb93354 Moudy Ho                   2023-12-20  246  	if (ret)
82b7d4b5d393d66 Moudy Ho                   2022-10-20  247  		goto err_destroy_device;
61890ccaefaff89 Moudy Ho                   2022-08-23  248  
ee0d0dbb80f6bd8 Moudy Ho                   2023-12-20  249  	ret = mdp_mm_subsys_deploy(mdp, MDP_INFRA_MUTEX);
ee0d0dbb80f6bd8 Moudy Ho                   2023-12-20  250  	if (ret)
82b7d4b5d393d66 Moudy Ho                   2022-10-20  251  		goto err_destroy_device;
ee0d0dbb80f6bd8 Moudy Ho                   2023-12-20  252  
50709e6343e325c Moudy Ho                   2023-03-27  253  	for (i = 0; i < mdp->mdp_data->pipe_info_len; i++) {
ee0d0dbb80f6bd8 Moudy Ho                   2023-12-20  254  		enum mdp_mm_subsys_id idx;
ee0d0dbb80f6bd8 Moudy Ho                   2023-12-20  255  		struct mtk_mutex **m;
ee0d0dbb80f6bd8 Moudy Ho                   2023-12-20  256  
ee0d0dbb80f6bd8 Moudy Ho                   2023-12-20  257  		idx = mdp->mdp_data->pipe_info[i].sub_id;
50709e6343e325c Moudy Ho                   2023-03-27  258  		mutex_id = mdp->mdp_data->pipe_info[i].mutex_id;
ee0d0dbb80f6bd8 Moudy Ho                   2023-12-20  259  		m = &mdp->mm_subsys[idx].mdp_mutex[mutex_id];
ee0d0dbb80f6bd8 Moudy Ho                   2023-12-20  260  
ee0d0dbb80f6bd8 Moudy Ho                   2023-12-20  261  		if (!IS_ERR_OR_NULL(*m))
50709e6343e325c Moudy Ho                   2023-03-27  262  			continue;
ee0d0dbb80f6bd8 Moudy Ho                   2023-12-20  263  
ee0d0dbb80f6bd8 Moudy Ho                   2023-12-20  264  		*m = mtk_mutex_get(mdp->mm_subsys[idx].mutex);
ee0d0dbb80f6bd8 Moudy Ho                   2023-12-20  265  		if (IS_ERR(*m)) {
ee0d0dbb80f6bd8 Moudy Ho                   2023-12-20  266  			ret = PTR_ERR(*m);
82b7d4b5d393d66 Moudy Ho                   2022-10-20  267  			goto err_free_mutex;
61890ccaefaff89 Moudy Ho                   2022-08-23  268  		}
61890ccaefaff89 Moudy Ho                   2022-08-23  269  	}
61890ccaefaff89 Moudy Ho                   2022-08-23  270  
61890ccaefaff89 Moudy Ho                   2022-08-23  271  	ret = mdp_comp_config(mdp);
61890ccaefaff89 Moudy Ho                   2022-08-23  272  	if (ret) {
61890ccaefaff89 Moudy Ho                   2022-08-23  273  		dev_err(dev, "Failed to config mdp components\n");
82b7d4b5d393d66 Moudy Ho                   2022-10-20  274  		goto err_free_mutex;
61890ccaefaff89 Moudy Ho                   2022-08-23  275  	}
61890ccaefaff89 Moudy Ho                   2022-08-23  276  
61890ccaefaff89 Moudy Ho                   2022-08-23  277  	mdp->job_wq = alloc_workqueue(MDP_MODULE_NAME, WQ_FREEZABLE, 0);
61890ccaefaff89 Moudy Ho                   2022-08-23  278  	if (!mdp->job_wq) {
61890ccaefaff89 Moudy Ho                   2022-08-23  279  		dev_err(dev, "Unable to create job workqueue\n");
61890ccaefaff89 Moudy Ho                   2022-08-23  280  		ret = -ENOMEM;
61890ccaefaff89 Moudy Ho                   2022-08-23  281  		goto err_deinit_comp;
61890ccaefaff89 Moudy Ho                   2022-08-23  282  	}
61890ccaefaff89 Moudy Ho                   2022-08-23  283  
61890ccaefaff89 Moudy Ho                   2022-08-23  284  	mdp->clock_wq = alloc_workqueue(MDP_MODULE_NAME "-clock", WQ_FREEZABLE,
61890ccaefaff89 Moudy Ho                   2022-08-23  285  					0);
61890ccaefaff89 Moudy Ho                   2022-08-23  286  	if (!mdp->clock_wq) {
61890ccaefaff89 Moudy Ho                   2022-08-23  287  		dev_err(dev, "Unable to create clock workqueue\n");
61890ccaefaff89 Moudy Ho                   2022-08-23  288  		ret = -ENOMEM;
61890ccaefaff89 Moudy Ho                   2022-08-23  289  		goto err_destroy_job_wq;
61890ccaefaff89 Moudy Ho                   2022-08-23  290  	}
61890ccaefaff89 Moudy Ho                   2022-08-23  291  
52e1fc9aa8282d7 AngeloGioacchino Del Regno 2023-10-05  292  	mdp->scp = scp_get(pdev);
52e1fc9aa8282d7 AngeloGioacchino Del Regno 2023-10-05  293  	if (!mdp->scp) {
e280d1a0eb93354 Moudy Ho                   2023-12-20  294  		mm_pdev = __get_pdev_by_id(pdev, NULL, MDP_INFRA_SCP);
61890ccaefaff89 Moudy Ho                   2022-08-23  295  		if (WARN_ON(!mm_pdev)) {
61890ccaefaff89 Moudy Ho                   2022-08-23  296  			dev_err(&pdev->dev, "Could not get scp device\n");
61890ccaefaff89 Moudy Ho                   2022-08-23  297  			ret = -ENODEV;
61890ccaefaff89 Moudy Ho                   2022-08-23  298  			goto err_destroy_clock_wq;
61890ccaefaff89 Moudy Ho                   2022-08-23  299  		}
61890ccaefaff89 Moudy Ho                   2022-08-23  300  		mdp->scp = platform_get_drvdata(mm_pdev);
52e1fc9aa8282d7 AngeloGioacchino Del Regno 2023-10-05  301  	}
52e1fc9aa8282d7 AngeloGioacchino Del Regno 2023-10-05  302  
61890ccaefaff89 Moudy Ho                   2022-08-23  303  	mdp->rproc_handle = scp_get_rproc(mdp->scp);
61890ccaefaff89 Moudy Ho                   2022-08-23  304  	dev_dbg(&pdev->dev, "MDP rproc_handle: %pK", mdp->rproc_handle);
61890ccaefaff89 Moudy Ho                   2022-08-23  305  
61890ccaefaff89 Moudy Ho                   2022-08-23  306  	mutex_init(&mdp->vpu_lock);
61890ccaefaff89 Moudy Ho                   2022-08-23  307  	mutex_init(&mdp->m2m_lock);
61890ccaefaff89 Moudy Ho                   2022-08-23  308  
9288eae430cbc4d Moudy Ho                   2023-12-20  309  	for (i = 0; i < mdp->mdp_data->pp_used; i++) {
9288eae430cbc4d Moudy Ho                   2023-12-20  310  		mdp->cmdq_clt[i] = cmdq_mbox_create(dev, i);
9288eae430cbc4d Moudy Ho                   2023-12-20  311  		if (IS_ERR(mdp->cmdq_clt[i])) {
9288eae430cbc4d Moudy Ho                   2023-12-20  312  			ret = PTR_ERR(mdp->cmdq_clt[i]);
9288eae430cbc4d Moudy Ho                   2023-12-20  313  			goto err_mbox_destroy;
9288eae430cbc4d Moudy Ho                   2023-12-20  314  		}
50ab69f21e96445 Chun-Kuang Hu              2024-09-01  315  
50ab69f21e96445 Chun-Kuang Hu              2024-09-01 @316  		mdp->cmdq_shift_pa[i] = cmdq_get_shift_pa(mdp->cmdq_clt[i]->chan);
61890ccaefaff89 Moudy Ho                   2022-08-23  317  	}
61890ccaefaff89 Moudy Ho                   2022-08-23  318  
61890ccaefaff89 Moudy Ho                   2022-08-23  319  	init_waitqueue_head(&mdp->callback_wq);
61890ccaefaff89 Moudy Ho                   2022-08-23  320  	ida_init(&mdp->mdp_ida);
61890ccaefaff89 Moudy Ho                   2022-08-23  321  	platform_set_drvdata(pdev, mdp);
61890ccaefaff89 Moudy Ho                   2022-08-23  322  
61890ccaefaff89 Moudy Ho                   2022-08-23  323  	vb2_dma_contig_set_max_seg_size(&pdev->dev, DMA_BIT_MASK(32));
61890ccaefaff89 Moudy Ho                   2022-08-23  324  
61890ccaefaff89 Moudy Ho                   2022-08-23  325  	ret = v4l2_device_register(dev, &mdp->v4l2_dev);
61890ccaefaff89 Moudy Ho                   2022-08-23  326  	if (ret) {
61890ccaefaff89 Moudy Ho                   2022-08-23  327  		dev_err(dev, "Failed to register v4l2 device\n");
61890ccaefaff89 Moudy Ho                   2022-08-23  328  		ret = -EINVAL;
61890ccaefaff89 Moudy Ho                   2022-08-23  329  		goto err_mbox_destroy;
61890ccaefaff89 Moudy Ho                   2022-08-23  330  	}
61890ccaefaff89 Moudy Ho                   2022-08-23  331  
61890ccaefaff89 Moudy Ho                   2022-08-23  332  	ret = mdp_m2m_device_register(mdp);
61890ccaefaff89 Moudy Ho                   2022-08-23  333  	if (ret) {
61890ccaefaff89 Moudy Ho                   2022-08-23  334  		v4l2_err(&mdp->v4l2_dev, "Failed to register m2m device\n");
61890ccaefaff89 Moudy Ho                   2022-08-23  335  		goto err_unregister_device;
61890ccaefaff89 Moudy Ho                   2022-08-23  336  	}
61890ccaefaff89 Moudy Ho                   2022-08-23  337  
4294b9d6c8c4050 Moudy Ho                   2023-12-20  338  success_return:
61890ccaefaff89 Moudy Ho                   2022-08-23  339  	dev_dbg(dev, "mdp-%d registered successfully\n", pdev->id);
61890ccaefaff89 Moudy Ho                   2022-08-23  340  	return 0;
61890ccaefaff89 Moudy Ho                   2022-08-23  341  
61890ccaefaff89 Moudy Ho                   2022-08-23  342  err_unregister_device:
61890ccaefaff89 Moudy Ho                   2022-08-23  343  	v4l2_device_unregister(&mdp->v4l2_dev);
61890ccaefaff89 Moudy Ho                   2022-08-23  344  err_mbox_destroy:
9288eae430cbc4d Moudy Ho                   2023-12-20  345  	while (--i >= 0)
9288eae430cbc4d Moudy Ho                   2023-12-20  346  		cmdq_mbox_destroy(mdp->cmdq_clt[i]);
61890ccaefaff89 Moudy Ho                   2022-08-23  347  	scp_put(mdp->scp);
61890ccaefaff89 Moudy Ho                   2022-08-23  348  err_destroy_clock_wq:
61890ccaefaff89 Moudy Ho                   2022-08-23  349  	destroy_workqueue(mdp->clock_wq);
61890ccaefaff89 Moudy Ho                   2022-08-23  350  err_destroy_job_wq:
61890ccaefaff89 Moudy Ho                   2022-08-23  351  	destroy_workqueue(mdp->job_wq);
61890ccaefaff89 Moudy Ho                   2022-08-23  352  err_deinit_comp:
61890ccaefaff89 Moudy Ho                   2022-08-23  353  	mdp_comp_destroy(mdp);
82b7d4b5d393d66 Moudy Ho                   2022-10-20  354  err_free_mutex:
ee0d0dbb80f6bd8 Moudy Ho                   2023-12-20  355  	for (i = 0; i < mdp->mdp_data->pipe_info_len; i++) {
ee0d0dbb80f6bd8 Moudy Ho                   2023-12-20  356  		enum mdp_mm_subsys_id idx;
ee0d0dbb80f6bd8 Moudy Ho                   2023-12-20  357  		struct mtk_mutex *m;
ee0d0dbb80f6bd8 Moudy Ho                   2023-12-20  358  
ee0d0dbb80f6bd8 Moudy Ho                   2023-12-20  359  		idx = mdp->mdp_data->pipe_info[i].sub_id;
ee0d0dbb80f6bd8 Moudy Ho                   2023-12-20  360  		mutex_id = mdp->mdp_data->pipe_info[i].mutex_id;
ee0d0dbb80f6bd8 Moudy Ho                   2023-12-20  361  		m = mdp->mm_subsys[idx].mdp_mutex[mutex_id];
ee0d0dbb80f6bd8 Moudy Ho                   2023-12-20  362  		if (!IS_ERR_OR_NULL(m))
ee0d0dbb80f6bd8 Moudy Ho                   2023-12-20  363  			mtk_mutex_put(m);
ee0d0dbb80f6bd8 Moudy Ho                   2023-12-20  364  	}
82b7d4b5d393d66 Moudy Ho                   2022-10-20  365  err_destroy_device:
61890ccaefaff89 Moudy Ho                   2022-08-23  366  	kfree(mdp);
82b7d4b5d393d66 Moudy Ho                   2022-10-20  367  err_return:
61890ccaefaff89 Moudy Ho                   2022-08-23  368  	dev_dbg(dev, "Errno %d\n", ret);
61890ccaefaff89 Moudy Ho                   2022-08-23  369  	return ret;
61890ccaefaff89 Moudy Ho                   2022-08-23  370  }
61890ccaefaff89 Moudy Ho                   2022-08-23  371  

:::::: The code at line 316 was first introduced by commit
:::::: 50ab69f21e964455b4382df7a805cc147c7c2c44 media: platform: mtk-mdp3: Get fine-grain control of cmdq_pkt_finalize()

:::::: TO: Chun-Kuang Hu <chunkuang.hu@kernel.org>
:::::: CC: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
