Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 582602ED858
	for <oe-kbuild-all@lists.linux.dev>; Sat, 20 Dec 2025 19:38:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766259527; cv=none; b=eM3p6Fn/fuzvbhQGVZoT0VstcMxNXdsi9c2Z23GiYYwWvkXIt/SHkxqD8zQnrgRP8PT3kPkyeW3XWY75K/Scw932g+G494Bm922Otwo+fwCq38udYUimVUnfGvVgrPAgirlkY5/ffeDbK3S4V4WkafOhZH9PxJFQnaWdZF8b9Zk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766259527; c=relaxed/simple;
	bh=3+CxPD0+GroQYewWYNN6hpR8gomILlvibU0Irm1BXbQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=hmWWyEMSyWflxyizpPlj00Qd9H8TAEJavNVH2uYMkeKm0cCbeYg4a3p62t7YOqbeaYeHGOKzwsaRV1vZi2V9hi91/rH0iPeXvfQLQC9ov7iVOJ8hUWziNVIGubittlOSB+50Ob3M9wzSZRO63paijlmJlqbq7KaBGRhr/klHaZs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mvcbPRtB; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mvcbPRtB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766259526; x=1797795526;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=3+CxPD0+GroQYewWYNN6hpR8gomILlvibU0Irm1BXbQ=;
  b=mvcbPRtBS1y5yXN6Bj6X39XU4LwEOBK7mRZmwpWWtOWibaL6hIg+HLpJ
   PJg9HgB+WorGnrEUnn9OPA665GpmXtPysNfsATWfd0i598Rh5mYGAfS3v
   CruWCAq4hczQibVieW9EMIKTSl5MoqUfStDdruVNoQ7IysX2qeIs/nrOH
   tmryW/gzF8zhm3fY0SABKX57YhxlQCElfJAfGMOzOjnIDhNy3d+umYcY8
   Yoim10TO6KOuiaWaKhjYh9HX5i692suTEgNS/3GFLdN0sJ97vBjXlwF6U
   BfkEI/tOe/pXZV8gwEKNZkECpcUycQoIP13JP38tscqaI71XOWFB48gAI
   g==;
X-CSE-ConnectionGUID: WX5basb9Qyete/Mumuai3w==
X-CSE-MsgGUID: NuvPL9CISr6fqgFCEPUpqg==
X-IronPort-AV: E=McAfee;i="6800,10657,11648"; a="78502026"
X-IronPort-AV: E=Sophos;i="6.21,164,1763452800"; 
   d="scan'208";a="78502026"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Dec 2025 11:38:43 -0800
X-CSE-ConnectionGUID: fhGWidOKRqKxSTeKiNwa4A==
X-CSE-MsgGUID: MWQ+ZTiAQ/CjwBDU9PFzNA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,164,1763452800"; 
   d="scan'208";a="200030287"
Received: from lkp-server01.sh.intel.com (HELO 0d09efa1b85f) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 20 Dec 2025 11:38:41 -0800
Received: from kbuild by 0d09efa1b85f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vX2ml-0000000054v-2NMl;
	Sat, 20 Dec 2025 19:38:39 +0000
Date: Sun, 21 Dec 2025 03:38:25 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, s00851154 <shijing34@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 3547/3547]
 drivers/net/ethernet/huawei/hinic3/hinic3_tx.c:395:5: warning: no previous
 prototype for 'hinic3_tx_offload'
Message-ID: <202512210308.eEv9d6co-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi zhuyikai,

FYI, the error/warning still remains.

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   04473ee9ed912a16fff0d8846ad565bbf3d63c77
commit: 74e3846262704452212a3245dccb10c2cd185ac3 [3547/3547] net/hinic3: Support new TX feature
config: arm64-randconfig-003-20251216 (https://download.01.org/0day-ci/archive/20251221/202512210308.eEv9d6co-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 10.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251221/202512210308.eEv9d6co-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512210308.eEv9d6co-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/net/ethernet/huawei/hinic3/hinic3_tx.c:395:5: warning: no previous prototype for 'hinic3_tx_offload' [-Wmissing-prototypes]
     395 | u32 hinic3_tx_offload(struct sk_buff *skb, struct hinic3_offload_info *offload_info,
         |     ^~~~~~~~~~~~~~~~~


vim +/hinic3_tx_offload +395 drivers/net/ethernet/huawei/hinic3/hinic3_tx.c

   394	
 > 395	u32 hinic3_tx_offload(struct sk_buff *skb, struct hinic3_offload_info *offload_info,
   396			      struct hinic3_queue_info *queue_info, struct hinic3_txq *txq)
   397	{
   398		u32 offload = 0;
   399		int tso_cs_en;
   400	
   401		tso_cs_en = hinic3_tso(offload_info, queue_info, skb);
   402		if (tso_cs_en < 0) {
   403			offload = TX_OFFLOAD_INVALID;
   404			return offload;
   405		} else if (tso_cs_en) {
   406			offload |= TX_OFFLOAD_TSO;
   407		} else {
   408			tso_cs_en = hinic3_tx_csum(txq, skb, offload_info, queue_info);
   409			if (tso_cs_en)
   410				offload |= TX_OFFLOAD_CSUM;
   411		}
   412	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
