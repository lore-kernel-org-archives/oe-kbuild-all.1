Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31EA91E7C18
	for <oe-kbuild-all@lists.linux.dev>; Fri, 18 Sep 2026 00:08:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789690090; cv=none; b=DdtsapJnZdXwnVgs8M/OHqWX3zz+tDw17wa4k/QO/K+u1idQxwHzMyQQIOMLMYo3en9+8SvcQILlsxQ3D/XGFMZM0ArhtiAKnzrhO+3PcQNKCoWzCRc9yv6UrEHUEaqfg2q4xuKZ/VfTo7xts2CFHw0qI3i8uRHi5ga8fC1iB44=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789690090; c=relaxed/simple;
	bh=9cTmBbQi79bUMqVlswKYULGfTGkVMRwUrT/vU2uSWI0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=cpXKHXCmfv5dfP7L8BT69l1yHm5PLA60TCkjFAo5/4hy+L1VZyIq04XKGKYqQbuyy5LmHblt/rHE3/e3LbIh6kCh45s3wMynrb0U7vFDKohSzUG7D102QXIWusMMQ0xKCCSkSlq0NmBhYQcLnTXp54Ipg2A8jV428c4uS7SRZ0w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Bv7xvDIQ; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Bv7xvDIQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789690087; x=1821226087;
  h=date:from:to:cc:subject:message-id;
  bh=9cTmBbQi79bUMqVlswKYULGfTGkVMRwUrT/vU2uSWI0=;
  b=Bv7xvDIQ/8wCec+gjPE12mUPpnEHc9H2fEN1BHQgtgwMDiTLOCHYFgGU
   jJmk5OJuIH5r+nxtkQIfZ01Hg2KPXkyKp9f7+Ghnx2VqEy+/iYa3iHiKP
   aWVkMU+tkL2qGyqP00rDpbRkgcP2FAChVYy806eWMkxWK8cVWEr0zMH9p
   DOVlNPuyHbD1PPs6Z4qfOpMASrI15Hzd7wpY2L+l/zgCsoF2aplf8CtCm
   f6HwksvlBeCAmLgyT1f1u4MGN16TkrM7MQvCsQNc5OfVRcZ76i8URR9jy
   0L7LyMABuHTVV2YeneKl3O1NsO96+/VDld9EDBICpw/k94PripGdgEVAp
   g==;
X-CSE-ConnectionGUID: VpaWXOPET827QydEtp0RVQ==
X-CSE-MsgGUID: +WaCTWSaTGOUT7weajxyqw==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="92674221"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="92674221"
Received: from fmviesa012.fm.intel.com ([10.60.135.152])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Sep 2026 17:08:07 -0700
X-CSE-ConnectionGUID: cyQ5qIzFSEO6Nqray6Jl6Q==
X-CSE-MsgGUID: x/eodvKvSvK31Zh43oXPzw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="2296966"
Received: from lkp-server01.sh.intel.com (HELO 462990a40a85) ([10.239.97.150])
  by fmviesa012.fm.intel.com with ESMTP; 17 Sep 2026 17:08:05 -0700
Received: from kbuild by 462990a40a85 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x7M94-000000008oh-353M;
	Fri, 18 Sep 2026 00:08:02 +0000
Date: Fri, 18 Sep 2026 08:07:36 +0800
From: kernel test robot <lkp@intel.com>
To: Simon Richter <Simon.Richter@hogyros.de>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: drivers/nfc/microread/microread.c:489:26: sparse: sparse:
 cast to restricted __be16
Message-ID: <202609180724.WqXUgoWn-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   9b87fdc9af2fbfcdb5c24a64139685ef80f6573f
commit: 25f9b0d351552f63ac3f72e6c655bc8f9994f7d2 misc/mei: Allow building Intel ME interface on non-x86
date:   8 months ago
config: powerpc-randconfig-r1308-20260917 (https://download.01.org/0day-ci/archive/20260918/202609180724.WqXUgoWn-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 148ee2b266b73a49f1f31d0bd17d4818b91bee9f)
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260918/202609180724.WqXUgoWn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 25f9b0d35155 ("misc/mei: Allow building Intel ME interface on non-x86")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609180724.WqXUgoWn-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/nfc/microread/microread.c:489:26: sparse: sparse: cast to restricted __be16
   drivers/nfc/microread/microread.c:503:26: sparse: sparse: cast to restricted __be16
   drivers/nfc/microread/microread.c:521:25: sparse: sparse: cast to restricted __le16

vim +489 drivers/nfc/microread/microread.c

cfad1ba87150e19 Eric Lapuyade 2012-12-18  467  
cfad1ba87150e19 Eric Lapuyade 2012-12-18  468  static void microread_target_discovered(struct nfc_hci_dev *hdev, u8 gate,
cfad1ba87150e19 Eric Lapuyade 2012-12-18  469  					struct sk_buff *skb)
cfad1ba87150e19 Eric Lapuyade 2012-12-18  470  {
cfad1ba87150e19 Eric Lapuyade 2012-12-18  471  	struct nfc_target *targets;
cfad1ba87150e19 Eric Lapuyade 2012-12-18  472  	int r = 0;
cfad1ba87150e19 Eric Lapuyade 2012-12-18  473  
cfad1ba87150e19 Eric Lapuyade 2012-12-18  474  	pr_info("target discovered to gate 0x%x\n", gate);
cfad1ba87150e19 Eric Lapuyade 2012-12-18  475  
cfad1ba87150e19 Eric Lapuyade 2012-12-18  476  	targets = kzalloc(sizeof(struct nfc_target), GFP_KERNEL);
cfad1ba87150e19 Eric Lapuyade 2012-12-18  477  	if (targets == NULL) {
cfad1ba87150e19 Eric Lapuyade 2012-12-18  478  		r = -ENOMEM;
cfad1ba87150e19 Eric Lapuyade 2012-12-18  479  		goto exit;
cfad1ba87150e19 Eric Lapuyade 2012-12-18  480  	}
cfad1ba87150e19 Eric Lapuyade 2012-12-18  481  
cfad1ba87150e19 Eric Lapuyade 2012-12-18  482  	targets->hci_reader_gate = gate;
cfad1ba87150e19 Eric Lapuyade 2012-12-18  483  
cfad1ba87150e19 Eric Lapuyade 2012-12-18  484  	switch (gate) {
cfad1ba87150e19 Eric Lapuyade 2012-12-18  485  	case MICROREAD_GATE_ID_MREAD_ISO_A:
cfad1ba87150e19 Eric Lapuyade 2012-12-18  486  		targets->supported_protocols =
cfad1ba87150e19 Eric Lapuyade 2012-12-18  487  		      nfc_hci_sak_to_protocol(skb->data[MICROREAD_EMCF_A_SAK]);
cfad1ba87150e19 Eric Lapuyade 2012-12-18  488  		targets->sens_res =
cfad1ba87150e19 Eric Lapuyade 2012-12-18 @489  			 be16_to_cpu(*(u16 *)&skb->data[MICROREAD_EMCF_A_ATQA]);
cfad1ba87150e19 Eric Lapuyade 2012-12-18  490  		targets->sel_res = skb->data[MICROREAD_EMCF_A_SAK];
cfad1ba87150e19 Eric Lapuyade 2012-12-18  491  		targets->nfcid1_len = skb->data[MICROREAD_EMCF_A_LEN];
d07f1e8600ccb88 Dan Carpenter 2014-09-01  492  		if (targets->nfcid1_len > sizeof(targets->nfcid1)) {
d07f1e8600ccb88 Dan Carpenter 2014-09-01  493  			r = -EINVAL;
d07f1e8600ccb88 Dan Carpenter 2014-09-01  494  			goto exit_free;
d07f1e8600ccb88 Dan Carpenter 2014-09-01  495  		}
d07f1e8600ccb88 Dan Carpenter 2014-09-01  496  		memcpy(targets->nfcid1, &skb->data[MICROREAD_EMCF_A_UID],
d07f1e8600ccb88 Dan Carpenter 2014-09-01  497  		       targets->nfcid1_len);
cfad1ba87150e19 Eric Lapuyade 2012-12-18  498  		break;
cfad1ba87150e19 Eric Lapuyade 2012-12-18  499  	case MICROREAD_GATE_ID_MREAD_ISO_A_3:
cfad1ba87150e19 Eric Lapuyade 2012-12-18  500  		targets->supported_protocols =
cfad1ba87150e19 Eric Lapuyade 2012-12-18  501  		      nfc_hci_sak_to_protocol(skb->data[MICROREAD_EMCF_A3_SAK]);
cfad1ba87150e19 Eric Lapuyade 2012-12-18  502  		targets->sens_res =
cfad1ba87150e19 Eric Lapuyade 2012-12-18  503  			 be16_to_cpu(*(u16 *)&skb->data[MICROREAD_EMCF_A3_ATQA]);
cfad1ba87150e19 Eric Lapuyade 2012-12-18  504  		targets->sel_res = skb->data[MICROREAD_EMCF_A3_SAK];
cfad1ba87150e19 Eric Lapuyade 2012-12-18  505  		targets->nfcid1_len = skb->data[MICROREAD_EMCF_A3_LEN];
d07f1e8600ccb88 Dan Carpenter 2014-09-01  506  		if (targets->nfcid1_len > sizeof(targets->nfcid1)) {
d07f1e8600ccb88 Dan Carpenter 2014-09-01  507  			r = -EINVAL;
d07f1e8600ccb88 Dan Carpenter 2014-09-01  508  			goto exit_free;
d07f1e8600ccb88 Dan Carpenter 2014-09-01  509  		}
d07f1e8600ccb88 Dan Carpenter 2014-09-01  510  		memcpy(targets->nfcid1, &skb->data[MICROREAD_EMCF_A3_UID],
d07f1e8600ccb88 Dan Carpenter 2014-09-01  511  		       targets->nfcid1_len);
cfad1ba87150e19 Eric Lapuyade 2012-12-18  512  		break;
cfad1ba87150e19 Eric Lapuyade 2012-12-18  513  	case MICROREAD_GATE_ID_MREAD_ISO_B:
cfad1ba87150e19 Eric Lapuyade 2012-12-18  514  		targets->supported_protocols = NFC_PROTO_ISO14443_B_MASK;
cfad1ba87150e19 Eric Lapuyade 2012-12-18  515  		memcpy(targets->nfcid1, &skb->data[MICROREAD_EMCF_B_UID], 4);
cfad1ba87150e19 Eric Lapuyade 2012-12-18  516  		targets->nfcid1_len = 4;
cfad1ba87150e19 Eric Lapuyade 2012-12-18  517  		break;
cfad1ba87150e19 Eric Lapuyade 2012-12-18  518  	case MICROREAD_GATE_ID_MREAD_NFC_T1:
cfad1ba87150e19 Eric Lapuyade 2012-12-18  519  		targets->supported_protocols = NFC_PROTO_JEWEL_MASK;
cfad1ba87150e19 Eric Lapuyade 2012-12-18  520  		targets->sens_res =
cfad1ba87150e19 Eric Lapuyade 2012-12-18  521  			le16_to_cpu(*(u16 *)&skb->data[MICROREAD_EMCF_T1_ATQA]);
cfad1ba87150e19 Eric Lapuyade 2012-12-18  522  		memcpy(targets->nfcid1, &skb->data[MICROREAD_EMCF_T1_UID], 4);
cfad1ba87150e19 Eric Lapuyade 2012-12-18  523  		targets->nfcid1_len = 4;
cfad1ba87150e19 Eric Lapuyade 2012-12-18  524  		break;
cfad1ba87150e19 Eric Lapuyade 2012-12-18  525  	case MICROREAD_GATE_ID_MREAD_NFC_T3:
cfad1ba87150e19 Eric Lapuyade 2012-12-18  526  		targets->supported_protocols = NFC_PROTO_FELICA_MASK;
cfad1ba87150e19 Eric Lapuyade 2012-12-18  527  		memcpy(targets->nfcid1, &skb->data[MICROREAD_EMCF_T3_UID], 8);
cfad1ba87150e19 Eric Lapuyade 2012-12-18  528  		targets->nfcid1_len = 8;
cfad1ba87150e19 Eric Lapuyade 2012-12-18  529  		break;
cfad1ba87150e19 Eric Lapuyade 2012-12-18  530  	default:
cfad1ba87150e19 Eric Lapuyade 2012-12-18  531  		pr_info("discard target discovered to gate 0x%x\n", gate);
cfad1ba87150e19 Eric Lapuyade 2012-12-18  532  		goto exit_free;
cfad1ba87150e19 Eric Lapuyade 2012-12-18  533  	}
cfad1ba87150e19 Eric Lapuyade 2012-12-18  534  
cfad1ba87150e19 Eric Lapuyade 2012-12-18  535  	r = nfc_targets_found(hdev->ndev, targets, 1);
cfad1ba87150e19 Eric Lapuyade 2012-12-18  536  
cfad1ba87150e19 Eric Lapuyade 2012-12-18  537  exit_free:
cfad1ba87150e19 Eric Lapuyade 2012-12-18  538  	kfree(targets);
cfad1ba87150e19 Eric Lapuyade 2012-12-18  539  
cfad1ba87150e19 Eric Lapuyade 2012-12-18  540  exit:
cfad1ba87150e19 Eric Lapuyade 2012-12-18  541  	kfree_skb(skb);
cfad1ba87150e19 Eric Lapuyade 2012-12-18  542  
cfad1ba87150e19 Eric Lapuyade 2012-12-18  543  	if (r)
17936b43f0fdede Joe Perches   2013-04-05  544  		pr_err("Failed to handle discovered target err=%d\n", r);
cfad1ba87150e19 Eric Lapuyade 2012-12-18  545  }
cfad1ba87150e19 Eric Lapuyade 2012-12-18  546  

:::::: The code at line 489 was first introduced by commit
:::::: cfad1ba87150e198be9ea32367a24e500e59de2c NFC: Initial support for Inside Secure microread

:::::: TO: Eric Lapuyade <eric.lapuyade@linux.intel.com>
:::::: CC: Samuel Ortiz <sameo@linux.intel.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
