Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8AC31A76AE
	for <oe-kbuild-all@lists.linux.dev>; Thu,  3 Oct 2024 17:45:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727977553; cv=none; b=ZZk6CN0nLRNPPSfigU9jQ5colC+JJrtuFsDcgEWG65rYOmxY7tKx6HWMSPxWoWGAt7TvIUH2pJlopMIyH/v3anQ3Er5ff8c8/JGoIEsW7nEDR/+sgwavYO2x+Hi7WqCaTyDVKDKq0kiPsxI0MWpKqr3ZVxbNOyjGCEDrrfRGaNk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727977553; c=relaxed/simple;
	bh=p8F141LuBv34wRXN9DP+Q8mqoDdP/MHjaLfcIzfvr7g=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=W1QRcfdj5ef2eTdJuKgHvalVS5zSuAox0Ba/k4+/sMumZK746DiyUPE+OAcf27Sk09QXqJ9paktf6Omkdwq+PSolyzXmJ3ziHD+LC2AekRwWzL84EBZWNsMQGGmbLC+0DLWLmHo6ldu07zrsvSGkG4nr/cU1FNtEgptrB1ASEZk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aSh9qC+2; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aSh9qC+2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727977549; x=1759513549;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=p8F141LuBv34wRXN9DP+Q8mqoDdP/MHjaLfcIzfvr7g=;
  b=aSh9qC+23AtSgFZ2R+f2j/1pVsPfGLLwIv1tzmWYW2XR2U7YGoO6qVLl
   UzOi1I6RF9+MObdRNg6yteJqgPJHUNFFPADHOP4ix4iCdr/kvMgF7dNQ9
   OHSsGs7ARM+vnIjCj1KxT3mgj2crkdVjxm3A5cSweZ/cKEAep4xoYhNDL
   JTdY6LHqF7jXNzSfsKYHo47SCdiPNDNUDuecBMTKsGgn0cRHuXNYJ4rSY
   UHS0mBCs9AgQMVwdeTEm47tVfyIyIkDUBPwPChFvUWHeZaP6VVU669Skg
   w/eO827+lRB4LVTff3MIukaCCg6fptVmQfC2lakHe582VPZ558LnQT49k
   g==;
X-CSE-ConnectionGUID: UqlkCHVhTyCCymNE2RXSwA==
X-CSE-MsgGUID: D/q6+nZZTpmyKKtlfBBQVA==
X-IronPort-AV: E=McAfee;i="6700,10204,11214"; a="37749096"
X-IronPort-AV: E=Sophos;i="6.11,175,1725346800"; 
   d="scan'208";a="37749096"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Oct 2024 10:45:45 -0700
X-CSE-ConnectionGUID: QXdr6Nn4TDSVSPw4HTqPgw==
X-CSE-MsgGUID: CJpPPexbTACSBQPV3XrYSg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,175,1725346800"; 
   d="scan'208";a="74009901"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 03 Oct 2024 10:45:44 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1swPtW-0000jd-0u;
	Thu, 03 Oct 2024 17:45:42 +0000
Date: Fri, 4 Oct 2024 01:44:58 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Yang Yingliang <yangyingliang@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 14777/23811]
 drivers/scsi/huawei/hifc/hifc_queue.c:1965:12: sparse: sparse: cast removes
 address space '<asn:2>' of expression
Message-ID: <202410040129.X3kkQqhf-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   5c63bd0fa5e86474d30ecd06d67f2393de081434
commit: 7fc993d55d1b54ae40e29dfac825a18d04d644c6 [14777/23811] scsi/hifc: add hifc driver FC service module
config: x86_64-randconfig-122-20241003 (https://download.01.org/0day-ci/archive/20241004/202410040129.X3kkQqhf-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241004/202410040129.X3kkQqhf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410040129.X3kkQqhf-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   drivers/scsi/huawei/hifc/hifc_queue.c:386:18: sparse: sparse: cast to restricted __be16
   drivers/scsi/huawei/hifc/hifc_queue.c:386:18: sparse: sparse: cast to restricted __be16
   drivers/scsi/huawei/hifc/hifc_queue.c:386:18: sparse: sparse: cast to restricted __be16
   drivers/scsi/huawei/hifc/hifc_queue.c:386:18: sparse: sparse: cast to restricted __be16
   drivers/scsi/huawei/hifc/hifc_queue.c:376:13: sparse: sparse: symbol 'hifc_root_sq_irq' was not declared. Should it be static?
   drivers/scsi/huawei/hifc/hifc_queue.c:1140:13: sparse: sparse: symbol 'hifc_root_rq_irq' was not declared. Should it be static?
   drivers/scsi/huawei/hifc/hifc_queue.c:1697:39: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned short @@     got restricted __be16 [usertype] @@
   drivers/scsi/huawei/hifc/hifc_queue.c:1697:39: sparse:     expected unsigned short
   drivers/scsi/huawei/hifc/hifc_queue.c:1697:39: sparse:     got restricted __be16 [usertype]
   drivers/scsi/huawei/hifc/hifc_queue.c:1962:16: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [addressable] [assigned] [usertype] dw0 @@     got restricted __be32 [usertype] @@
   drivers/scsi/huawei/hifc/hifc_queue.c:1962:16: sparse:     expected unsigned int [addressable] [assigned] [usertype] dw0
   drivers/scsi/huawei/hifc/hifc_queue.c:1962:16: sparse:     got restricted __be32 [usertype]
>> drivers/scsi/huawei/hifc/hifc_queue.c:1965:12: sparse: sparse: cast removes address space '<asn:2>' of expression
   drivers/scsi/huawei/hifc/hifc_queue.c:1980:18: sparse: sparse: cast to restricted __be16
   drivers/scsi/huawei/hifc/hifc_queue.c:1980:18: sparse: sparse: cast to restricted __be16
   drivers/scsi/huawei/hifc/hifc_queue.c:1980:18: sparse: sparse: cast to restricted __be16
   drivers/scsi/huawei/hifc/hifc_queue.c:1980:18: sparse: sparse: cast to restricted __be16
   drivers/scsi/huawei/hifc/hifc_queue.c:1999:18: sparse: sparse: cast to restricted __be16
   drivers/scsi/huawei/hifc/hifc_queue.c:1999:18: sparse: sparse: cast to restricted __be16
   drivers/scsi/huawei/hifc/hifc_queue.c:1999:18: sparse: sparse: cast to restricted __be16
   drivers/scsi/huawei/hifc/hifc_queue.c:1999:18: sparse: sparse: cast to restricted __be16
   drivers/scsi/huawei/hifc/hifc_queue.c:2159:41: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned short @@     got restricted __be16 [usertype] @@
   drivers/scsi/huawei/hifc/hifc_queue.c:2159:41: sparse:     expected unsigned short
   drivers/scsi/huawei/hifc/hifc_queue.c:2159:41: sparse:     got restricted __be16 [usertype]
   drivers/scsi/huawei/hifc/hifc_queue.c:2128:6: sparse: sparse: symbol 'hifc_update_root_rq_info' was not declared. Should it be static?
   drivers/scsi/huawei/hifc/hifc_queue.c:2163:6: sparse: sparse: symbol 'hifc_root_rqe_analysis' was not declared. Should it be static?
   drivers/scsi/huawei/hifc/hifc_queue.c:2386:6: sparse: sparse: symbol 'hifc_set_scq_irq_cfg' was not declared. Should it be static?
   drivers/scsi/huawei/hifc/hifc_queue.c:2419:13: sparse: sparse: symbol 'hifc_scq_irq' was not declared. Should it be static?
   drivers/scsi/huawei/hifc/hifc_queue.c:2902:35: sparse: sparse: cast to restricted __be32
   drivers/scsi/huawei/hifc/hifc_queue.c:2902:35: sparse: sparse: cast to restricted __be32
   drivers/scsi/huawei/hifc/hifc_queue.c:2902:35: sparse: sparse: cast to restricted __be32
   drivers/scsi/huawei/hifc/hifc_queue.c:2902:35: sparse: sparse: cast to restricted __be32
   drivers/scsi/huawei/hifc/hifc_queue.c:2902:35: sparse: sparse: cast to restricted __be32
   drivers/scsi/huawei/hifc/hifc_queue.c:2902:35: sparse: sparse: cast to restricted __be32
   drivers/scsi/huawei/hifc/hifc_queue.c:2904:42: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] ctrl_ch_val @@     got restricted __be32 [usertype] @@
   drivers/scsi/huawei/hifc/hifc_queue.c:2904:42: sparse:     expected unsigned int [usertype] ctrl_ch_val
   drivers/scsi/huawei/hifc/hifc_queue.c:2904:42: sparse:     got restricted __be32 [usertype]
   drivers/scsi/huawei/hifc/hifc_queue.c:2916:28: sparse: sparse: cast to restricted __be32
   drivers/scsi/huawei/hifc/hifc_queue.c:2916:28: sparse: sparse: cast to restricted __be32
   drivers/scsi/huawei/hifc/hifc_queue.c:2916:28: sparse: sparse: cast to restricted __be32
   drivers/scsi/huawei/hifc/hifc_queue.c:2916:28: sparse: sparse: cast to restricted __be32
   drivers/scsi/huawei/hifc/hifc_queue.c:2916:28: sparse: sparse: cast to restricted __be32
   drivers/scsi/huawei/hifc/hifc_queue.c:2916:28: sparse: sparse: cast to restricted __be32
   drivers/scsi/huawei/hifc/hifc_queue.c:2919:29: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int val_wd1 @@     got restricted __be32 [usertype] @@
   drivers/scsi/huawei/hifc/hifc_queue.c:2919:29: sparse:     expected unsigned int val_wd1
   drivers/scsi/huawei/hifc/hifc_queue.c:2919:29: sparse:     got restricted __be32 [usertype]
   drivers/scsi/huawei/hifc/hifc_queue.c:2921:28: sparse: sparse: cast to restricted __be32
   drivers/scsi/huawei/hifc/hifc_queue.c:2921:28: sparse: sparse: cast to restricted __be32
   drivers/scsi/huawei/hifc/hifc_queue.c:2921:28: sparse: sparse: cast to restricted __be32
   drivers/scsi/huawei/hifc/hifc_queue.c:2921:28: sparse: sparse: cast to restricted __be32
   drivers/scsi/huawei/hifc/hifc_queue.c:2921:28: sparse: sparse: cast to restricted __be32
   drivers/scsi/huawei/hifc/hifc_queue.c:2921:28: sparse: sparse: cast to restricted __be32
   drivers/scsi/huawei/hifc/hifc_queue.c:2923:29: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] val_wd0 @@     got restricted __be32 [usertype] @@
   drivers/scsi/huawei/hifc/hifc_queue.c:2923:29: sparse:     expected unsigned int [usertype] val_wd0
   drivers/scsi/huawei/hifc/hifc_queue.c:2923:29: sparse:     got restricted __be32 [usertype]
   drivers/scsi/huawei/hifc/hifc_queue.c:3646:6: sparse: sparse: symbol 'hifc_invalid_parent_sq' was not declared. Should it be static?
   drivers/scsi/huawei/hifc/hifc_queue.c:4023:14: sparse: sparse: symbol 'hifc_alloc_parent_sq' was not declared. Should it be static?
   drivers/scsi/huawei/hifc/hifc_queue.c:4389:49: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned long long @@     got restricted __be64 [usertype] @@
   drivers/scsi/huawei/hifc/hifc_queue.c:4389:49: sparse:     expected unsigned long long
   drivers/scsi/huawei/hifc/hifc_queue.c:4389:49: sparse:     got restricted __be64 [usertype]
   drivers/scsi/huawei/hifc/hifc_queue.c:4394:72: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned long long @@     got restricted __be64 [usertype] @@
   drivers/scsi/huawei/hifc/hifc_queue.c:4394:72: sparse:     expected unsigned long long
   drivers/scsi/huawei/hifc/hifc_queue.c:4394:72: sparse:     got restricted __be64 [usertype]
   drivers/scsi/huawei/hifc/hifc_queue.c:4408:52: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned long long @@     got restricted __be64 [usertype] @@
   drivers/scsi/huawei/hifc/hifc_queue.c:4408:52: sparse:     expected unsigned long long
   drivers/scsi/huawei/hifc/hifc_queue.c:4408:52: sparse:     got restricted __be64 [usertype]
   drivers/scsi/huawei/hifc/hifc_queue.c:4416:42: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned short [usertype] oqid_rd @@     got restricted __be16 [usertype] @@
   drivers/scsi/huawei/hifc/hifc_queue.c:4416:42: sparse:     expected unsigned short [usertype] oqid_rd
   drivers/scsi/huawei/hifc/hifc_queue.c:4416:42: sparse:     got restricted __be16 [usertype]
   drivers/scsi/huawei/hifc/hifc_queue.c:4418:42: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned short [usertype] oqid_wr @@     got restricted __be16 [usertype] @@
   drivers/scsi/huawei/hifc/hifc_queue.c:4418:42: sparse:     expected unsigned short [usertype] oqid_wr
   drivers/scsi/huawei/hifc/hifc_queue.c:4418:42: sparse:     got restricted __be16 [usertype]
   drivers/scsi/huawei/hifc/hifc_queue.c:4450:29: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned short [usertype] conn_id @@     got restricted __be16 [usertype] @@
   drivers/scsi/huawei/hifc/hifc_queue.c:4450:29: sparse:     expected unsigned short [usertype] conn_id
   drivers/scsi/huawei/hifc/hifc_queue.c:4450:29: sparse:     got restricted __be16 [usertype]
   drivers/scsi/huawei/hifc/hifc_queue.c:4456:37: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] scq_num_rcv_cmd @@     got restricted __be32 [usertype] @@
   drivers/scsi/huawei/hifc/hifc_queue.c:4456:37: sparse:     expected unsigned int [usertype] scq_num_rcv_cmd
   drivers/scsi/huawei/hifc/hifc_queue.c:4456:37: sparse:     got restricted __be32 [usertype]
   drivers/scsi/huawei/hifc/hifc_queue.c:4473:40: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] per_xmit_data_size @@     got restricted __be32 [usertype] @@
   drivers/scsi/huawei/hifc/hifc_queue.c:4473:40: sparse:     expected unsigned int [usertype] per_xmit_data_size
   drivers/scsi/huawei/hifc/hifc_queue.c:4473:40: sparse:     got restricted __be32 [usertype]
   drivers/scsi/huawei/hifc/hifc_queue.c:4511:6: sparse: sparse: symbol 'hifc_init_parent_ctx' was not declared. Should it be static?
   drivers/scsi/huawei/hifc/hifc_queue.c:4559:6: sparse: sparse: symbol 'hifc_map_shared_queue_qid' was not declared. Should it be static?
   drivers/scsi/huawei/hifc/hifc_queue.c:5242:45: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned long long doorbell_record @@     got restricted __be64 [usertype] @@
   drivers/scsi/huawei/hifc/hifc_queue.c:5242:45: sparse:     expected unsigned long long doorbell_record
   drivers/scsi/huawei/hifc/hifc_queue.c:5242:45: sparse:     got restricted __be64 [usertype]
   drivers/scsi/huawei/hifc/hifc_queue.c:5331:17: sparse: sparse: cast to restricted __be64
   drivers/scsi/huawei/hifc/hifc_queue.c:5331:17: sparse: sparse: cast to restricted __be64
   drivers/scsi/huawei/hifc/hifc_queue.c:5331:17: sparse: sparse: cast to restricted __be64
   drivers/scsi/huawei/hifc/hifc_queue.c:5331:17: sparse: sparse: cast to restricted __be64
   drivers/scsi/huawei/hifc/hifc_queue.c:5331:17: sparse: sparse: cast to restricted __be64
   drivers/scsi/huawei/hifc/hifc_queue.c:5331:17: sparse: sparse: cast to restricted __be64
   drivers/scsi/huawei/hifc/hifc_queue.c:5331:17: sparse: sparse: cast to restricted __be64
   drivers/scsi/huawei/hifc/hifc_queue.c:5331:17: sparse: sparse: cast to restricted __be64
   drivers/scsi/huawei/hifc/hifc_queue.c:5331:17: sparse: sparse: cast to restricted __be64
   drivers/scsi/huawei/hifc/hifc_queue.c:5331:17: sparse: sparse: cast to restricted __be64
   drivers/scsi/huawei/hifc/hifc_queue.c:5331:17: sparse: sparse: cast to restricted __be64
   drivers/scsi/huawei/hifc/hifc_queue.c:5331:17: sparse: sparse: cast to restricted __be64
   drivers/scsi/huawei/hifc/hifc_queue.c:5331:17: sparse: sparse: cast to restricted __be64
   drivers/scsi/huawei/hifc/hifc_queue.c:5331:17: sparse: sparse: cast to restricted __be64
   drivers/scsi/huawei/hifc/hifc_queue.c:5331:17: sparse: sparse: cast to restricted __be64
   drivers/scsi/huawei/hifc/hifc_queue.c:5331:17: sparse: sparse: cast to restricted __be64
   drivers/scsi/huawei/hifc/hifc_queue.c:5331:17: sparse: sparse: cast to restricted __be64
   drivers/scsi/huawei/hifc/hifc_queue.c:5331:17: sparse: sparse: cast to restricted __be64
   drivers/scsi/huawei/hifc/hifc_queue.c:5331:17: sparse: sparse: cast to restricted __be64
   drivers/scsi/huawei/hifc/hifc_queue.c:5331:17: sparse: sparse: cast to restricted __be64
   drivers/scsi/huawei/hifc/hifc_queue.c:5331:17: sparse: sparse: cast to restricted __be64
   drivers/scsi/huawei/hifc/hifc_queue.c:5331:17: sparse: sparse: cast to restricted __be64
   drivers/scsi/huawei/hifc/hifc_queue.c:5331:17: sparse: sparse: cast to restricted __be64
   drivers/scsi/huawei/hifc/hifc_queue.c:5331:17: sparse: sparse: cast to restricted __be64
   drivers/scsi/huawei/hifc/hifc_queue.c:5331:17: sparse: sparse: cast to restricted __be64
   drivers/scsi/huawei/hifc/hifc_queue.c:5331:17: sparse: sparse: cast to restricted __be64
   drivers/scsi/huawei/hifc/hifc_queue.c:5331:17: sparse: sparse: cast to restricted __be64
--
   drivers/scsi/huawei/hifc/hifc_lld.c:67:22: sparse: sparse: symbol 'g_lld_lock' was not declared. Should it be static?
   drivers/scsi/huawei/hifc/hifc_lld.c:291:29: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] manufacture_id @@     got restricted __be32 [usertype] @@
   drivers/scsi/huawei/hifc/hifc_lld.c:291:29: sparse:     expected unsigned int [usertype] manufacture_id
   drivers/scsi/huawei/hifc/hifc_lld.c:291:29: sparse:     got restricted __be32 [usertype]
   drivers/scsi/huawei/hifc/hifc_lld.c:292:24: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned short [usertype] resp_code @@     got restricted __be16 [usertype] @@
   drivers/scsi/huawei/hifc/hifc_lld.c:292:24: sparse:     expected unsigned short [usertype] resp_code
   drivers/scsi/huawei/hifc/hifc_lld.c:292:24: sparse:     got restricted __be16 [usertype]
   drivers/scsi/huawei/hifc/hifc_lld.c:293:26: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned short [usertype] reason_code @@     got restricted __be16 [usertype] @@
   drivers/scsi/huawei/hifc/hifc_lld.c:293:26: sparse:     expected unsigned short [usertype] reason_code
   drivers/scsi/huawei/hifc/hifc_lld.c:293:26: sparse:     got restricted __be16 [usertype]
   drivers/scsi/huawei/hifc/hifc_lld.c:333:6: sparse: sparse: symbol 'hifc_get_ppf_hwdev_by_pdev' was not declared. Should it be static?
   drivers/scsi/huawei/hifc/hifc_lld.c:362:6: sparse: sparse: symbol 'hifc_event_process' was not declared. Should it be static?
>> drivers/scsi/huawei/hifc/hifc_lld.c:645:32: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected void *[assigned] cfg_reg_base @@     got void [noderef] <asn:2> *cfg_reg_base @@
   drivers/scsi/huawei/hifc/hifc_lld.c:645:32: sparse:     expected void *[assigned] cfg_reg_base
   drivers/scsi/huawei/hifc/hifc_lld.c:645:32: sparse:     got void [noderef] <asn:2> *cfg_reg_base
>> drivers/scsi/huawei/hifc/hifc_lld.c:646:33: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected void *[assigned] intr_reg_base @@     got void [noderef] <asn:2> *intr_reg_base @@
   drivers/scsi/huawei/hifc/hifc_lld.c:646:33: sparse:     expected void *[assigned] intr_reg_base
   drivers/scsi/huawei/hifc/hifc_lld.c:646:33: sparse:     got void [noderef] <asn:2> *intr_reg_base
>> drivers/scsi/huawei/hifc/hifc_lld.c:647:27: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected void *[assigned] db_base @@     got void [noderef] <asn:2> *db_base @@
   drivers/scsi/huawei/hifc/hifc_lld.c:647:27: sparse:     expected void *[assigned] db_base
   drivers/scsi/huawei/hifc/hifc_lld.c:647:27: sparse:     got void [noderef] <asn:2> *db_base
   drivers/scsi/huawei/hifc/hifc_lld.c:333:7: warning: no previous prototype for 'hifc_get_ppf_hwdev_by_pdev' [-Wmissing-prototypes]
     333 | void *hifc_get_ppf_hwdev_by_pdev(struct pci_dev *pdev)
         |       ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/scsi/huawei/hifc/hifc_lld.c:362:6: warning: no previous prototype for 'hifc_event_process' [-Wmissing-prototypes]
     362 | void hifc_event_process(void *adapter, struct hifc_event_info *event)
         |      ^~~~~~~~~~~~~~~~~~
--
>> drivers/scsi/huawei/hifc/hifc_tool.c:90:43: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void const [noderef] <asn:1> *from @@     got void *in_buff @@
   drivers/scsi/huawei/hifc/hifc_tool.c:90:43: sparse:     expected void const [noderef] <asn:1> *from
   drivers/scsi/huawei/hifc/hifc_tool.c:90:43: sparse:     got void *in_buff
>> drivers/scsi/huawei/hifc/hifc_tool.c:157:32: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void [noderef] <asn:1> *to @@     got void *out_buf @@
   drivers/scsi/huawei/hifc/hifc_tool.c:157:32: sparse:     expected void [noderef] <asn:1> *to
   drivers/scsi/huawei/hifc/hifc_tool.c:157:32: sparse:     got void *out_buf
   drivers/scsi/huawei/hifc/hifc_tool.c:256:32: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void [noderef] <asn:1> *to @@     got void *out_buf @@
   drivers/scsi/huawei/hifc/hifc_tool.c:256:32: sparse:     expected void [noderef] <asn:1> *to
   drivers/scsi/huawei/hifc/hifc_tool.c:256:32: sparse:     got void *out_buf
   drivers/scsi/huawei/hifc/hifc_tool.c:386:32: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void [noderef] <asn:1> *to @@     got void *out_buf @@
   drivers/scsi/huawei/hifc/hifc_tool.c:386:32: sparse:     expected void [noderef] <asn:1> *to
   drivers/scsi/huawei/hifc/hifc_tool.c:386:32: sparse:     got void *out_buf
   drivers/scsi/huawei/hifc/hifc_tool.c:459:32: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void [noderef] <asn:1> *to @@     got void *out_buf @@
   drivers/scsi/huawei/hifc/hifc_tool.c:459:32: sparse:     expected void [noderef] <asn:1> *to
   drivers/scsi/huawei/hifc/hifc_tool.c:459:32: sparse:     got void *out_buf
   drivers/scsi/huawei/hifc/hifc_tool.c:465:5: sparse: sparse: symbol 'send_to_service_driver' was not declared. Should it be static?
>> drivers/scsi/huawei/hifc/hifc_tool.c:599:38: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void const [noderef] <asn:1> *from @@     got void * @@
   drivers/scsi/huawei/hifc/hifc_tool.c:599:38: sparse:     expected void const [noderef] <asn:1> *from
   drivers/scsi/huawei/hifc/hifc_tool.c:599:38: sparse:     got void *
   drivers/scsi/huawei/hifc/hifc_tool.c:664:5: sparse: sparse: symbol 'if_nictool_exist' was not declared. Should it be static?
   drivers/scsi/huawei/hifc/hifc_tool.c:465:5: warning: no previous prototype for 'send_to_service_driver' [-Wmissing-prototypes]
     465 | int send_to_service_driver(struct msg_module *nt_msg, void *buf_in,
         |     ^~~~~~~~~~~~~~~~~~~~~~
   drivers/scsi/huawei/hifc/hifc_tool.c:664:5: warning: no previous prototype for 'if_nictool_exist' [-Wmissing-prototypes]
     664 | int if_nictool_exist(void)
         |     ^~~~~~~~~~~~~~~~
--
   drivers/scsi/huawei/hifc/hifc_tool_hw.c:36:4: sparse: sparse: symbol 'hifc_physical_port_id' was not declared. Should it be static?
   drivers/scsi/huawei/hifc/hifc_tool_hw.c:47:5: sparse: sparse: symbol 'hifc_clp_to_mgmt' was not declared. Should it be static?
   drivers/scsi/huawei/hifc/hifc_tool_hw.c:236:6: sparse: sparse: symbol 'hifc_is_in_host' was not declared. Should it be static?
   drivers/scsi/huawei/hifc/hifc_tool_hw.c:401:25: sparse: sparse: symbol 'sm_module_cmd_handle' was not declared. Should it be static?
>> drivers/scsi/huawei/hifc/hifc_tool_hw.c:482:35: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void const [noderef] <asn:1> *from @@     got void * @@
   drivers/scsi/huawei/hifc/hifc_tool_hw.c:482:35: sparse:     expected void const [noderef] <asn:1> *from
   drivers/scsi/huawei/hifc/hifc_tool_hw.c:482:35: sparse:     got void *
   drivers/scsi/huawei/hifc/hifc_tool_hw.c:36:4: warning: no previous prototype for 'hifc_physical_port_id' [-Wmissing-prototypes]
      36 | u8 hifc_physical_port_id(void *hwdev)
         |    ^~~~~~~~~~~~~~~~~~~~~
   drivers/scsi/huawei/hifc/hifc_tool_hw.c:47:5: warning: no previous prototype for 'hifc_clp_to_mgmt' [-Wmissing-prototypes]
      47 | int hifc_clp_to_mgmt(void *hwdev, enum hifc_mod_type mod, u8 cmd,
         |     ^~~~~~~~~~~~~~~~
   drivers/scsi/huawei/hifc/hifc_tool_hw.c:236:6: warning: no previous prototype for 'hifc_is_in_host' [-Wmissing-prototypes]
     236 | bool hifc_is_in_host(void)
         |      ^~~~~~~~~~~~~~~
--
   drivers/scsi/huawei/hifc/hifc_dbgtool_knl.c:62:7: sparse: sparse: symbol 'dbgtool_dev_id' was not declared. Should it be static?
   drivers/scsi/huawei/hifc/hifc_dbgtool_knl.c:63:13: sparse: sparse: symbol 'dbgtool_chr_dev' was not declared. Should it be static?
   drivers/scsi/huawei/hifc/hifc_dbgtool_knl.c:66:14: sparse: sparse: symbol 'dbgtool_d_class' was not declared. Should it be static?
   drivers/scsi/huawei/hifc/hifc_dbgtool_knl.c:69:5: sparse: sparse: symbol 'g_dbgtool_init_flag' was not declared. Should it be static?
   drivers/scsi/huawei/hifc/hifc_dbgtool_knl.c:70:5: sparse: sparse: symbol 'g_dbgtool_ref_cnt' was not declared. Should it be static?
>> drivers/scsi/huawei/hifc/hifc_dbgtool_knl.c:202:51: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void const [noderef] <asn:1> *from @@     got unsigned char [usertype] *cmd @@
   drivers/scsi/huawei/hifc/hifc_dbgtool_knl.c:202:51: sparse:     expected void const [noderef] <asn:1> *from
   drivers/scsi/huawei/hifc/hifc_dbgtool_knl.c:202:51: sparse:     got unsigned char [usertype] *cmd
>> drivers/scsi/huawei/hifc/hifc_dbgtool_knl.c:216:44: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void [noderef] <asn:1> *to @@     got void *ack @@
   drivers/scsi/huawei/hifc/hifc_dbgtool_knl.c:216:44: sparse:     expected void [noderef] <asn:1> *to
   drivers/scsi/huawei/hifc/hifc_dbgtool_knl.c:216:44: sparse:     got void *ack
   drivers/scsi/huawei/hifc/hifc_dbgtool_knl.c:150:6: sparse: sparse: symbol 'dbgtool_knl_api_cmd_read' was not declared. Should it be static?
   drivers/scsi/huawei/hifc/hifc_dbgtool_knl.c:269:51: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void const [noderef] <asn:1> *from @@     got unsigned char [usertype] *cmd @@
   drivers/scsi/huawei/hifc/hifc_dbgtool_knl.c:269:51: sparse:     expected void const [noderef] <asn:1> *from
   drivers/scsi/huawei/hifc/hifc_dbgtool_knl.c:269:51: sparse:     got unsigned char [usertype] *cmd
   drivers/scsi/huawei/hifc/hifc_dbgtool_knl.c:234:6: sparse: sparse: symbol 'dbgtool_knl_api_cmd_write' was not declared. Should it be static?
>> drivers/scsi/huawei/hifc/hifc_dbgtool_knl.c:374:37: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void [noderef] <asn:1> *to @@     got struct pf_dev_info *dev_info @@
   drivers/scsi/huawei/hifc/hifc_dbgtool_knl.c:374:37: sparse:     expected void [noderef] <asn:1> *to
   drivers/scsi/huawei/hifc/hifc_dbgtool_knl.c:374:37: sparse:     got struct pf_dev_info *dev_info
   drivers/scsi/huawei/hifc/hifc_dbgtool_knl.c:331:6: sparse: sparse: symbol 'dbgtool_knl_pf_dev_info_get' was not declared. Should it be static?
>> drivers/scsi/huawei/hifc/hifc_dbgtool_knl.c:393:37: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void [noderef] <asn:1> *to @@     got struct ffm_record_info *ffm_rd @@
   drivers/scsi/huawei/hifc/hifc_dbgtool_knl.c:393:37: sparse:     expected void [noderef] <asn:1> *to
   drivers/scsi/huawei/hifc/hifc_dbgtool_knl.c:393:37: sparse:     got struct ffm_record_info *ffm_rd
   drivers/scsi/huawei/hifc/hifc_dbgtool_knl.c:389:6: sparse: sparse: symbol 'dbgtool_knl_ffm_info_rd' was not declared. Should it be static?
   drivers/scsi/huawei/hifc/hifc_dbgtool_knl.c:407:6: sparse: sparse: symbol 'dbgtool_knl_ffm_info_clr' was not declared. Should it be static?
>> drivers/scsi/huawei/hifc/hifc_dbgtool_knl.c:461:54: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void const [noderef] <asn:1> *from @@     got void *buf_in @@
   drivers/scsi/huawei/hifc/hifc_dbgtool_knl.c:461:54: sparse:     expected void const [noderef] <asn:1> *from
   drivers/scsi/huawei/hifc/hifc_dbgtool_knl.c:461:54: sparse:     got void *buf_in
>> drivers/scsi/huawei/hifc/hifc_dbgtool_knl.c:482:44: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void [noderef] <asn:1> *to @@     got unsigned short [usertype] *out_size @@
   drivers/scsi/huawei/hifc/hifc_dbgtool_knl.c:482:44: sparse:     expected void [noderef] <asn:1> *to
   drivers/scsi/huawei/hifc/hifc_dbgtool_knl.c:482:44: sparse:     got unsigned short [usertype] *out_size
>> drivers/scsi/huawei/hifc/hifc_dbgtool_knl.c:489:44: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void [noderef] <asn:1> *to @@     got void *buf_out @@
   drivers/scsi/huawei/hifc/hifc_dbgtool_knl.c:489:44: sparse:     expected void [noderef] <asn:1> *to
   drivers/scsi/huawei/hifc/hifc_dbgtool_knl.c:489:44: sparse:     got void *buf_out
   drivers/scsi/huawei/hifc/hifc_dbgtool_knl.c:419:6: sparse: sparse: symbol 'dbgtool_knl_msg_to_up' was not declared. Should it be static?
>> drivers/scsi/huawei/hifc/hifc_dbgtool_knl.c:621:37: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void const [noderef] <asn:1> *from @@     got void * @@
   drivers/scsi/huawei/hifc/hifc_dbgtool_knl.c:621:37: sparse:     expected void const [noderef] <asn:1> *from
   drivers/scsi/huawei/hifc/hifc_dbgtool_knl.c:621:37: sparse:     got void *
   drivers/scsi/huawei/hifc/hifc_dbgtool_knl.c:612:6: sparse: sparse: symbol 'dbgtool_knl_unlocked_ioctl' was not declared. Should it be static?
   drivers/scsi/huawei/hifc/hifc_dbgtool_knl.c:672:6: sparse: sparse: symbol 'ffm_intr_msg_record' was not declared. Should it be static?
   drivers/scsi/huawei/hifc/hifc_dbgtool_knl.c:150:6: warning: no previous prototype for 'dbgtool_knl_api_cmd_read' [-Wmissing-prototypes]
     150 | long dbgtool_knl_api_cmd_read(struct dbgtool_param *para,
         |      ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/scsi/huawei/hifc/hifc_dbgtool_knl.c:234:6: warning: no previous prototype for 'dbgtool_knl_api_cmd_write' [-Wmissing-prototypes]
     234 | long dbgtool_knl_api_cmd_write(struct dbgtool_param *para,
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/scsi/huawei/hifc/hifc_dbgtool_knl.c:331:6: warning: no previous prototype for 'dbgtool_knl_pf_dev_info_get' [-Wmissing-prototypes]
     331 | long dbgtool_knl_pf_dev_info_get(struct dbgtool_param *para,
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/scsi/huawei/hifc/hifc_dbgtool_knl.c:389:6: warning: no previous prototype for 'dbgtool_knl_ffm_info_rd' [-Wmissing-prototypes]
     389 | long dbgtool_knl_ffm_info_rd(struct dbgtool_param *para,
         |      ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/scsi/huawei/hifc/hifc_dbgtool_knl.c:407:6: warning: no previous prototype for 'dbgtool_knl_ffm_info_clr' [-Wmissing-prototypes]
     407 | void dbgtool_knl_ffm_info_clr(struct dbgtool_param *para,
         |      ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/scsi/huawei/hifc/hifc_dbgtool_knl.c:419:6: warning: no previous prototype for 'dbgtool_knl_msg_to_up' [-Wmissing-prototypes]
     419 | long dbgtool_knl_msg_to_up(struct dbgtool_param *para,
         |      ^~~~~~~~~~~~~~~~~~~~~
   drivers/scsi/huawei/hifc/hifc_dbgtool_knl.c:612:6: warning: no previous prototype for 'dbgtool_knl_unlocked_ioctl' [-Wmissing-prototypes]
     612 | long dbgtool_knl_unlocked_ioctl(struct file *pfile,
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/scsi/huawei/hifc/hifc_dbgtool_knl.c:672:6: warning: no previous prototype for 'ffm_intr_msg_record' [-Wmissing-prototypes]
     672 | void ffm_intr_msg_record(void *handle, void *buf_in, u16 in_size,
         |      ^~~~~~~~~~~~~~~~~~~
   drivers/scsi/huawei/hifc/hifc_dbgtool_knl.c:802: warning: Function parameter or member 'vhwdev' not described in 'dbgtool_knl_init'
   drivers/scsi/huawei/hifc/hifc_dbgtool_knl.c:802: warning: Excess function parameter 'hwdev' description in 'dbgtool_knl_init'
   drivers/scsi/huawei/hifc/hifc_dbgtool_knl.c:897: warning: Function parameter or member 'vhwdev' not described in 'dbgtool_knl_deinit'
   drivers/scsi/huawei/hifc/hifc_dbgtool_knl.c:897: warning: Excess function parameter 'hwdev' description in 'dbgtool_knl_deinit'
--
   drivers/scsi/huawei/hifc/hifc_hwif.c:27:16: sparse: sparse: cast to restricted __be32
   drivers/scsi/huawei/hifc/hifc_hwif.c:27:16: sparse: sparse: cast to restricted __be32
   drivers/scsi/huawei/hifc/hifc_hwif.c:27:16: sparse: sparse: cast to restricted __be32
   drivers/scsi/huawei/hifc/hifc_hwif.c:27:16: sparse: sparse: cast to restricted __be32
   drivers/scsi/huawei/hifc/hifc_hwif.c:27:16: sparse: sparse: cast to restricted __be32
   drivers/scsi/huawei/hifc/hifc_hwif.c:27:16: sparse: sparse: cast to restricted __be32
>> drivers/scsi/huawei/hifc/hifc_hwif.c:32:16: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int val @@     got restricted __be32 [usertype] @@
   drivers/scsi/huawei/hifc/hifc_hwif.c:32:16: sparse:     expected unsigned int val
   drivers/scsi/huawei/hifc/hifc_hwif.c:32:16: sparse:     got restricted __be32 [usertype]
>> drivers/scsi/huawei/hifc/hifc_hwif.c:453:29: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected unsigned char [noderef] [usertype] <asn:2> *cfg_regs_base @@     got void *cfg_reg_base @@
   drivers/scsi/huawei/hifc/hifc_hwif.c:453:29: sparse:     expected unsigned char [noderef] [usertype] <asn:2> *cfg_regs_base
   drivers/scsi/huawei/hifc/hifc_hwif.c:453:29: sparse:     got void *cfg_reg_base
>> drivers/scsi/huawei/hifc/hifc_hwif.c:454:30: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected unsigned char [noderef] [usertype] <asn:2> *intr_regs_base @@     got void *intr_reg_base @@
   drivers/scsi/huawei/hifc/hifc_hwif.c:454:30: sparse:     expected unsigned char [noderef] [usertype] <asn:2> *intr_regs_base
   drivers/scsi/huawei/hifc/hifc_hwif.c:454:30: sparse:     got void *intr_reg_base
>> drivers/scsi/huawei/hifc/hifc_hwif.c:457:23: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected unsigned char [noderef] [usertype] <asn:2> *db_base @@     got void *db_base @@
   drivers/scsi/huawei/hifc/hifc_hwif.c:457:23: sparse:     expected unsigned char [noderef] [usertype] <asn:2> *db_base
   drivers/scsi/huawei/hifc/hifc_hwif.c:457:23: sparse:     got void *db_base
>> drivers/scsi/huawei/hifc/hifc_hwif.c:517:65: sparse: sparse: incorrect type in argument 4 (different base types) @@     expected restricted gfp_t [usertype] flag @@     got unsigned int flag @@
   drivers/scsi/huawei/hifc/hifc_hwif.c:517:65: sparse:     expected restricted gfp_t [usertype] flag
   drivers/scsi/huawei/hifc/hifc_hwif.c:517:65: sparse:     got unsigned int flag
   drivers/scsi/huawei/hifc/hifc_hwif.c:532:65: sparse: sparse: incorrect type in argument 4 (different base types) @@     expected restricted gfp_t [usertype] flag @@     got unsigned int flag @@
   drivers/scsi/huawei/hifc/hifc_hwif.c:532:65: sparse:     expected restricted gfp_t [usertype] flag
   drivers/scsi/huawei/hifc/hifc_hwif.c:532:65: sparse:     got unsigned int flag
   drivers/scsi/huawei/hifc/hifc_hwif.c:442: warning: Function parameter or member 'intr_reg_base' not described in 'hifc_init_hwif'
   drivers/scsi/huawei/hifc/hifc_hwif.c:442: warning: Function parameter or member 'db_base_phy' not described in 'hifc_init_hwif'
   drivers/scsi/huawei/hifc/hifc_hwif.c:442: warning: Function parameter or member 'db_base' not described in 'hifc_init_hwif'
   drivers/scsi/huawei/hifc/hifc_hwif.c:442: warning: Function parameter or member 'dwqe_mapping' not described in 'hifc_init_hwif'
--
   drivers/scsi/huawei/hifc/hifc_cmdq.c:345:20: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [addressable] [usertype] db_info @@     got restricted __be32 [usertype] @@
   drivers/scsi/huawei/hifc/hifc_cmdq.c:345:20: sparse:     expected unsigned int [addressable] [usertype] db_info
   drivers/scsi/huawei/hifc/hifc_cmdq.c:345:20: sparse:     got restricted __be32 [usertype]
>> drivers/scsi/huawei/hifc/hifc_cmdq.c:348:28: sparse: sparse: cast removes address space '<asn:2>' of expression
>> drivers/scsi/huawei/hifc/hifc_cmdq.c:348:28: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] <asn:2> *addr @@     got unsigned char [usertype] * @@
   drivers/scsi/huawei/hifc/hifc_cmdq.c:348:28: sparse:     expected void volatile [noderef] <asn:2> *addr
   drivers/scsi/huawei/hifc/hifc_cmdq.c:348:28: sparse:     got unsigned char [usertype] *
   drivers/scsi/huawei/hifc/hifc_cmdq.c:489:31: sparse: sparse: cast to restricted __be32
   drivers/scsi/huawei/hifc/hifc_cmdq.c:489:31: sparse: sparse: cast to restricted __be32
   drivers/scsi/huawei/hifc/hifc_cmdq.c:489:31: sparse: sparse: cast to restricted __be32
   drivers/scsi/huawei/hifc/hifc_cmdq.c:489:31: sparse: sparse: cast to restricted __be32
   drivers/scsi/huawei/hifc/hifc_cmdq.c:489:31: sparse: sparse: cast to restricted __be32
   drivers/scsi/huawei/hifc/hifc_cmdq.c:489:31: sparse: sparse: cast to restricted __be32
   drivers/scsi/huawei/hifc/hifc_cmdq.c:495:40: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned long long [usertype] @@     got restricted __be64 [usertype] @@
   drivers/scsi/huawei/hifc/hifc_cmdq.c:495:40: sparse:     expected unsigned long long [usertype]
   drivers/scsi/huawei/hifc/hifc_cmdq.c:495:40: sparse:     got restricted __be64 [usertype]
   drivers/scsi/huawei/hifc/hifc_cmdq.c:509:21: sparse: sparse: cast to restricted __be32
   drivers/scsi/huawei/hifc/hifc_cmdq.c:509:21: sparse: sparse: cast to restricted __be32
   drivers/scsi/huawei/hifc/hifc_cmdq.c:509:21: sparse: sparse: cast to restricted __be32
   drivers/scsi/huawei/hifc/hifc_cmdq.c:509:21: sparse: sparse: cast to restricted __be32
   drivers/scsi/huawei/hifc/hifc_cmdq.c:509:21: sparse: sparse: cast to restricted __be32
   drivers/scsi/huawei/hifc/hifc_cmdq.c:509:21: sparse: sparse: cast to restricted __be32
   drivers/scsi/huawei/hifc/hifc_cmdq.c:1060:27: sparse: sparse: cast to restricted __be32
   drivers/scsi/huawei/hifc/hifc_cmdq.c:1060:27: sparse: sparse: cast to restricted __be32
   drivers/scsi/huawei/hifc/hifc_cmdq.c:1060:27: sparse: sparse: cast to restricted __be32
   drivers/scsi/huawei/hifc/hifc_cmdq.c:1060:27: sparse: sparse: cast to restricted __be32
   drivers/scsi/huawei/hifc/hifc_cmdq.c:1060:27: sparse: sparse: cast to restricted __be32
   drivers/scsi/huawei/hifc/hifc_cmdq.c:1060:27: sparse: sparse: cast to restricted __be32
   drivers/scsi/huawei/hifc/hifc_cmdq.c:1132:25: sparse: sparse: cast to restricted __be32
   drivers/scsi/huawei/hifc/hifc_cmdq.c:1132:25: sparse: sparse: cast to restricted __be32
   drivers/scsi/huawei/hifc/hifc_cmdq.c:1132:25: sparse: sparse: cast to restricted __be32
   drivers/scsi/huawei/hifc/hifc_cmdq.c:1132:25: sparse: sparse: cast to restricted __be32
   drivers/scsi/huawei/hifc/hifc_cmdq.c:1132:25: sparse: sparse: cast to restricted __be32
   drivers/scsi/huawei/hifc/hifc_cmdq.c:1132:25: sparse: sparse: cast to restricted __be32
   drivers/scsi/huawei/hifc/hifc_cmdq.c:1219:37: sparse: sparse: cast to restricted __be32
   drivers/scsi/huawei/hifc/hifc_cmdq.c:1219:37: sparse: sparse: cast to restricted __be32
   drivers/scsi/huawei/hifc/hifc_cmdq.c:1219:37: sparse: sparse: cast to restricted __be32
   drivers/scsi/huawei/hifc/hifc_cmdq.c:1219:37: sparse: sparse: cast to restricted __be32
   drivers/scsi/huawei/hifc/hifc_cmdq.c:1219:37: sparse: sparse: cast to restricted __be32
   drivers/scsi/huawei/hifc/hifc_cmdq.c:1219:37: sparse: sparse: cast to restricted __be32
   drivers/scsi/huawei/hifc/hifc_cmdq.c:1250:31: sparse: sparse: cast to restricted __be64
   drivers/scsi/huawei/hifc/hifc_cmdq.c:1250:31: sparse: sparse: cast to restricted __be64
   drivers/scsi/huawei/hifc/hifc_cmdq.c:1250:31: sparse: sparse: cast to restricted __be64
   drivers/scsi/huawei/hifc/hifc_cmdq.c:1250:31: sparse: sparse: cast to restricted __be64
   drivers/scsi/huawei/hifc/hifc_cmdq.c:1250:31: sparse: sparse: cast to restricted __be64
   drivers/scsi/huawei/hifc/hifc_cmdq.c:1250:31: sparse: sparse: cast to restricted __be64
   drivers/scsi/huawei/hifc/hifc_cmdq.c:1250:31: sparse: sparse: cast to restricted __be64
   drivers/scsi/huawei/hifc/hifc_cmdq.c:1250:31: sparse: sparse: cast to restricted __be64
   drivers/scsi/huawei/hifc/hifc_cmdq.c:1250:31: sparse: sparse: cast to restricted __be64
   drivers/scsi/huawei/hifc/hifc_cmdq.c:1250:31: sparse: sparse: cast to restricted __be64
   drivers/scsi/huawei/hifc/hifc_cmdq.c:1299:26: sparse: sparse: cast removes address space '<asn:2>' of expression
>> drivers/scsi/huawei/hifc/hifc_cmdq.c:1299:23: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected unsigned char [noderef] [usertype] <asn:2> *db_base @@     got unsigned char [usertype] * @@
   drivers/scsi/huawei/hifc/hifc_cmdq.c:1299:23: sparse:     expected unsigned char [noderef] [usertype] <asn:2> *db_base
   drivers/scsi/huawei/hifc/hifc_cmdq.c:1299:23: sparse:     got unsigned char [usertype] *
   drivers/scsi/huawei/hifc/hifc_cmdq.c:1316:5: sparse: sparse: symbol 'hifc_set_cmdq_ctxts' was not declared. Should it be static?
   drivers/scsi/huawei/hifc/hifc_cmdq.c:1316:5: warning: no previous prototype for 'hifc_set_cmdq_ctxts' [-Wmissing-prototypes]
    1316 | int hifc_set_cmdq_ctxts(struct hifc_hwdev *hwdev)
         |     ^~~~~~~~~~~~~~~~~~~
--
   drivers/scsi/huawei/hifc/hifc_cqm_main.c:46:6: sparse: sparse: symbol 'cqm_test_mode_init' was not declared. Should it be static?
   drivers/scsi/huawei/hifc/hifc_cqm_main.c:95:5: sparse: sparse: symbol 'cqm_service_capability_init' was not declared. Should it be static?
   drivers/scsi/huawei/hifc/hifc_cqm_main.c:114:5: sparse: sparse: symbol 'cqm_capability_init' was not declared. Should it be static?
   drivers/scsi/huawei/hifc/hifc_cqm_main.c:431:5: sparse: sparse: symbol 'cqm_db_addr_alloc' was not declared. Should it be static?
   drivers/scsi/huawei/hifc/hifc_cqm_main.c:476:6: sparse: sparse: symbol 'cqm_db_addr_free' was not declared. Should it be static?
>> drivers/scsi/huawei/hifc/hifc_cqm_main.c:691:12: sparse: sparse: cast removes address space '<asn:2>' of expression
   drivers/scsi/huawei/hifc/hifc_cqm_main.c:46:6: warning: no previous prototype for 'cqm_test_mode_init' [-Wmissing-prototypes]
      46 | void cqm_test_mode_init(struct cqm_handle_s *cqm_handle,
         |      ^~~~~~~~~~~~~~~~~~
   drivers/scsi/huawei/hifc/hifc_cqm_main.c:95:5: warning: no previous prototype for 'cqm_service_capability_init' [-Wmissing-prototypes]
      95 | s32 cqm_service_capability_init(struct cqm_handle_s *cqm_handle,
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/scsi/huawei/hifc/hifc_cqm_main.c:114:5: warning: no previous prototype for 'cqm_capability_init' [-Wmissing-prototypes]
     114 | s32 cqm_capability_init(void *ex_handle)
         |     ^~~~~~~~~~~~~~~~~~~
   drivers/scsi/huawei/hifc/hifc_cqm_main.c:431:5: warning: no previous prototype for 'cqm_db_addr_alloc' [-Wmissing-prototypes]
     431 | s32 cqm_db_addr_alloc(void *ex_handle, void __iomem **db_addr,
         |     ^~~~~~~~~~~~~~~~~
   drivers/scsi/huawei/hifc/hifc_cqm_main.c:476:6: warning: no previous prototype for 'cqm_db_addr_free' [-Wmissing-prototypes]
     476 | void cqm_db_addr_free(void *ex_handle, void __iomem *db_addr,
         |      ^~~~~~~~~~~~~~~~
   drivers/scsi/huawei/hifc/hifc_cqm_main.c:592: warning: Excess function parameter 'service_type' description in 'cqm_service_unregister'

vim +1965 drivers/scsi/huawei/hifc/hifc_queue.c

31015b9ad992c4 Chenguangli 2020-11-16  1947  
31015b9ad992c4 Chenguangli 2020-11-16  1948  static void hifc_ring_root_sq_db(struct hifc_hba_s *v_hba,
31015b9ad992c4 Chenguangli 2020-11-16  1949  				 struct hifc_root_sq_info_s *v_sq_info)
31015b9ad992c4 Chenguangli 2020-11-16  1950  {
31015b9ad992c4 Chenguangli 2020-11-16  1951  	struct nic_tx_doorbell db;
31015b9ad992c4 Chenguangli 2020-11-16  1952  
31015b9ad992c4 Chenguangli 2020-11-16  1953  	UNF_CHECK_VALID(INVALID_VALUE32, UNF_TRUE, NULL != v_sq_info, return);
31015b9ad992c4 Chenguangli 2020-11-16  1954  
31015b9ad992c4 Chenguangli 2020-11-16  1955  	memset(&db, 0, sizeof(struct nic_tx_doorbell));
31015b9ad992c4 Chenguangli 2020-11-16  1956  
31015b9ad992c4 Chenguangli 2020-11-16  1957  	db.bs0.srv_type = HIFC_DOORBELL_SQ_TYPE;
31015b9ad992c4 Chenguangli 2020-11-16  1958  	db.bs0.queue_id = v_sq_info->qid;
31015b9ad992c4 Chenguangli 2020-11-16  1959  	db.bs0.pi_high = v_sq_info->pi >> HIFC_DOORBELL_SQ_PI_HIGH_BITS_SHIFT;
31015b9ad992c4 Chenguangli 2020-11-16  1960  	db.bs0.cos = 0;
31015b9ad992c4 Chenguangli 2020-11-16  1961  
31015b9ad992c4 Chenguangli 2020-11-16  1962  	db.dw0 = cpu_to_be32(db.dw0);
31015b9ad992c4 Chenguangli 2020-11-16  1963  	wmb();
31015b9ad992c4 Chenguangli 2020-11-16  1964  
31015b9ad992c4 Chenguangli 2020-11-16 @1965  	*((unsigned long long *)(v_sq_info->normal_db.virt_map_addr)
31015b9ad992c4 Chenguangli 2020-11-16  1966  	  + (v_sq_info->pi & HIFC_DOORBELL_SQ_PI_LOW_BITS_MASK)) =
31015b9ad992c4 Chenguangli 2020-11-16  1967  						*(unsigned long long *)&db;
31015b9ad992c4 Chenguangli 2020-11-16  1968  }
31015b9ad992c4 Chenguangli 2020-11-16  1969  

:::::: The code at line 1965 was first introduced by commit
:::::: 31015b9ad992c40fc0db81055932bbabe74f2533 scsi/hifc: add hifc driver port resource module

:::::: TO: Chenguangli <chenguangli2@huawei.com>
:::::: CC: Yang Yingliang <yangyingliang@huawei.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
