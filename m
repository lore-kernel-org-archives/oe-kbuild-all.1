Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1763E2797AC
	for <oe-kbuild-all@lists.linux.dev>; Thu,  2 Jul 2026 01:22:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782955336; cv=none; b=C8hRthtUG9kulFScmtI6Jk/UQ6W3ug87cIJf6mbSvRhd9AGxBmOCpYYuISpactj/XQa0PNhbNFe+fyjJl15lIaTYHDHl4ZxvlySoEI5raMqNlr1UJIF2Z6ZZdS257iA0xtNkxE2AO5qOgRBsFttgDBsZAmbR/UZPTDuPktUfhkw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782955336; c=relaxed/simple;
	bh=3+vA2fTbAVk8odt/rEZMUeyqdhzItRgLkVDSvLygL4A=;
	h=Date:From:To:Cc:Subject:Message-ID; b=QtLwxlzNtdEbCIwi5FMI2mgGtVyBrfRZHDkUa9tMJb88hccZariUyrBdPJijAxy41RZ/EDXTVn10M0i3uQMBd14WBuD7VQTOvKBu/5UDMkr9Z96msSkc13AlXPH9btDizb8eE3FeVwVchev99uZQITUAyXwcd1mYR49qq+zOrX4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LCMMl36U; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LCMMl36U"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782955335; x=1814491335;
  h=date:from:to:cc:subject:message-id;
  bh=3+vA2fTbAVk8odt/rEZMUeyqdhzItRgLkVDSvLygL4A=;
  b=LCMMl36Ue9myXcehJPcEMs6LLies5Cu4u8wsbOxHVuRHcXpYtVUF3AKA
   7q1+URrxhZHhcv7TsbsUhaQK2aHvRrQ3xLzqAssElaUyZmmyx5ysYh0/M
   DUBaV5LZK86eipzsAYuN4gSvau5Wv0ceCudFRRyiNLtFNsGLqX1gdJsIE
   3dbvLAc8htLjdl6H0GxKISvYnGSCbNCI8iei1Gneu4UY3UePcZ1wYphMq
   7ZqnSowljpTUevlGuND+zNZT6y/uukT3RrPMBiKxE1VRqt0mu2CSLNV/q
   MniX3PAaWbCUIqLe86+pBGCmmzCd+HOfgdZGTMnDyM4XzHgaoiZ0Jdl91
   A==;
X-CSE-ConnectionGUID: OMx9NyxhTiCDyFzrZzTNWQ==
X-CSE-MsgGUID: Sv4nC0mbS6udGUZsUMdD5g==
X-IronPort-AV: E=McAfee;i="6800,10657,11834"; a="82688350"
X-IronPort-AV: E=Sophos;i="6.25,142,1779174000"; 
   d="scan'208";a="82688350"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jul 2026 18:22:13 -0700
X-CSE-ConnectionGUID: IcHp/slhS6GdR7w0g0Ffzg==
X-CSE-MsgGUID: xHqskboeQwquy6ALxcCsTQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,142,1779174000"; 
   d="scan'208";a="257603882"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa005.fm.intel.com with ESMTP; 01 Jul 2026 18:22:11 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wf680-000000009pB-4C2x;
	Thu, 02 Jul 2026 01:22:09 +0000
Date: Thu, 02 Jul 2026 09:21:25 +0800
From: kernel test robot <lkp@intel.com>
To: Sudeep Holla <sudeep.holla@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [sudeep-holla:b4/scmi_core_fixes 9/15]
 drivers/firmware/arm_scmi/transports/mailbox.c:252:1: warning: label
 'err_free_chan_receiver' defined but not used
Message-ID: <202607020915.xItPnwTl-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/sudeep.holla/linux.git b4/scmi_core_fixes
head:   d1cbcdff08d74ddfae0e7cac9e460094f6cee869
commit: 18377118e55e62b1645c2dad3caa8584582de785 [9/15] firmware: arm_scmi: Unwind P2A receiver mailbox setup failure
config: arc-randconfig-002-20260702 (https://download.01.org/0day-ci/archive/20260702/202607020915.xItPnwTl-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 13.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260702/202607020915.xItPnwTl-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607020915.xItPnwTl-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/firmware/arm_scmi/transports/mailbox.c: In function 'mailbox_chan_setup':
>> drivers/firmware/arm_scmi/transports/mailbox.c:252:1: warning: label 'err_free_chan_receiver' defined but not used [-Wunused-label]
     252 | err_free_chan_receiver:
         | ^~~~~~~~~~~~~~~~~~~~~~


vim +/err_free_chan_receiver +252 drivers/firmware/arm_scmi/transports/mailbox.c

   181	
   182	static int mailbox_chan_setup(struct scmi_chan_info *cinfo, struct device *dev,
   183				      bool tx)
   184	{
   185		const char *desc = tx ? "Tx" : "Rx";
   186		struct device *cdev = cinfo->dev;
   187		struct scmi_mailbox *smbox;
   188		int ret, a2p_rx_chan, p2a_chan, p2a_rx_chan;
   189		struct mbox_client *cl;
   190	
   191		ret = mailbox_chan_validate(cdev, &a2p_rx_chan, &p2a_chan, &p2a_rx_chan);
   192		if (ret)
   193			return ret;
   194	
   195		if (!tx && !p2a_chan)
   196			return -ENODEV;
   197	
   198		smbox = devm_kzalloc(dev, sizeof(*smbox), GFP_KERNEL);
   199		if (!smbox)
   200			return -ENOMEM;
   201	
   202		smbox->shmem = core->shmem->setup_iomap(cinfo, dev, tx, NULL,
   203							&smbox->io_ops);
   204		if (IS_ERR(smbox->shmem))
   205			return PTR_ERR(smbox->shmem);
   206	
   207		cl = &smbox->cl;
   208		cl->dev = cdev;
   209		cl->tx_prepare = tx ? tx_prepare : NULL;
   210		cl->rx_callback = rx_callback;
   211		cl->tx_block = false;
   212		cl->knows_txdone = tx;
   213	
   214		smbox->chan = mbox_request_channel(cl, tx ? 0 : p2a_chan);
   215		if (IS_ERR(smbox->chan)) {
   216			ret = PTR_ERR(smbox->chan);
   217			if (ret != -EPROBE_DEFER)
   218				dev_err(cdev,
   219					"failed to request SCMI %s mailbox\n", desc);
   220			return ret;
   221		}
   222	
   223		/* Additional unidirectional channel for TX if needed */
   224		if (tx && a2p_rx_chan) {
   225			smbox->chan_receiver = mbox_request_channel(cl, a2p_rx_chan);
   226			if (IS_ERR(smbox->chan_receiver)) {
   227				ret = PTR_ERR(smbox->chan_receiver);
   228				smbox->chan_receiver = NULL;
   229				if (ret != -EPROBE_DEFER)
   230					dev_err(cdev, "failed to request SCMI Tx Receiver mailbox\n");
   231				goto err_free_chan;
   232			}
   233		}
   234	
   235		if (!tx && p2a_rx_chan) {
   236			smbox->chan_platform_receiver = mbox_request_channel(cl, p2a_rx_chan);
   237			if (IS_ERR(smbox->chan_platform_receiver)) {
   238				ret = PTR_ERR(smbox->chan_platform_receiver);
   239				smbox->chan_platform_receiver = NULL;
   240				if (ret != -EPROBE_DEFER)
   241					dev_err(cdev, "failed to request SCMI P2A Receiver mailbox\n");
   242				goto err_free_chan;
   243			}
   244		}
   245	
   246		cinfo->transport_info = smbox;
   247		smbox->cinfo = cinfo;
   248		mutex_init(&smbox->chan_lock);
   249	
   250		return 0;
   251	
 > 252	err_free_chan_receiver:
   253		mbox_free_channel(smbox->chan_receiver);
   254	err_free_chan:
   255		mbox_free_channel(smbox->chan);
   256		return ret;
   257	}
   258	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
