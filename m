Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.13
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794970035;
	b=1bnpUCE0D45x5xUAa+clbRfR77SfZd0nlHsX32glg2o78kwRCrfr7ldcVnp/bHK9g8Eb
	 RXVRdJErM3j7j6eQJOttGcQ535/qFGtqMu7CIDcBV6OBPDKyvU4rcNv4M75w+hI3GS6SC
	 Phnn2Ee6h4Gs9I+7EviILaTGmSUHRaRYDyO3zSZ52vEi6cl7tcm3HVRtZdqHirWysbhPk
	 59+N9ClPmZwmkLUWxQf2ami6Qieg0PRE5ki1tCyKCjNC9NkysKFgFwEAdxNxK3RTqXg6u
	 RSSaYdkLfGFhHtMtdsFjgtF0Ny1Nv5vdOgRwaNjX8RhmkMNkZv0FVv2BkAVxdHMeoBA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794970035;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=UeoDPoEUiCk3ZfbvHj7TK+CmAIbTDwO73lZ5hpUkjlQ=;
	b=Gd2Xi8jHiRdVG8Zm4sgsIdZQcx0DaXHvPcfEM31QQo8sAZCifHzUgmFnQu5megbL/3mQ
	 jKVMcVyXX+TYx2wUvKnk6U6hRPnhysT4vC+ZbDPLPFPezCFArdQfg4FX45Y8sTJkhO1pA
	 HDPA5Lm0RiTOhRQQASqVfyi84UTUP9ibpy4fVXhX4qYz8fmAxwP9cnEcCv203TP7yRSun
	 gMBFxI8uZue++vzDERIvijO6e92azMZzt7NTh+dLdO3eO5k8Q7na11asKG7iDrg8EsWLD
	 d9TXkUOyWz74Mroh2tk8vYn9JCk9JoC+lD9btlsWNgPTSgTiK2VNMQVgHksq6IWbauA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=XrYKxD5s;
	arc=none smtp.remote-ip=198.175.65.13
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A7D5606A32A
	for <oe-kbuild-all@lists.linux.dev>; Wed, 18 Nov 2026 02:47:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5A7D5606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=XrYKxD5s
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794970035; x=1826506035;
  h=date:from:to:cc:subject:message-id;
  bh=GdJOdEaOVAJpoIkP+7W2ptMRa40g/9AGeAGv5C+/WZU=;
  b=XrYKxD5sRWA8GRTTeIYAa2oOzzjCtr+4a3E9lyQpk8ybGzaFbl/2p9cQ
   x/JOq0uIGaDNe8g31Cihn7ql6Bbimnoced3QKAMyp6AA4w3+SriHoGO2D
   81M+cjY3k7NvMz81uJvnCks/2W9XocXGnpm2oEJU4QGXOBlIY2kvL8fN8
   KowFuO5kLVRtUq1nTjWJvMb4GFrp6a7xt6FFFFCg0kQHsRUFYZUwklgue
   vDWvhlyytHcHe0CaHDdm/eE/lVwfMQJdaTO2dr4vdjUqxvS/UMHw4/SYG
   IvvKfqQhV+qtwb5Zzdzx/2le8hQtLzKVqDG2C4IK1WLWd51EuezasCJ+x
   w==;
X-CSE-ConnectionGUID: jg27WvioQ1S5guY3OcNHOA==
X-CSE-MsgGUID: rN28pdmhSym9DjnPUpcSuw==
X-IronPort-AV: E=McAfee;i="6800,10657,11969"; a="3649261"
X-IronPort-AV: E=Sophos;i="6.27,219,1787036400"; 
   d="scan'208";a="3649261"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Nov 2026 18:47:14 -0800
X-CSE-ConnectionGUID: ydjY00hVTeCZ4oxMVwEFFw==
X-CSE-MsgGUID: dDZyYY8zStqILFKjZuFwdA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,219,1787036400"; 
   d="scan'208";a="10345922"
Received: from igk-lkp-server01.igk.intel.com (HELO 1073a420ae3a) ([10.211.93.152])
  by fmviesa009.fm.intel.com with ESMTP; 17 Nov 2026 18:47:12 -0800
Received: from kbuild by 1073a420ae3a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xTVhU-000000003Iy-0r5u;
	Wed, 18 Nov 2026 02:47:08 +0000
Date: Wed, 18 Nov 2026 03:46:23 +0100
From: kernel test robot <lkp@intel.com>
To: Peter Wang <peter.wang@mediatek.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 Bart Van Assche <bvanassche@acm.org>
Subject: drivers/ufs/host/ufs-mediatek.c:1351:32-33: WARNING: Use
 ARRAY_SIZE
Message-ID: <20261118034428.45oknqbt-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   63fdb511c27afcebce797e3db580b3534ddfa639
commit: 1fd05367d5b1a5edd3d14c966a5f510e5b8a0c5e scsi: ufs: host: mediatek: Adjust sync length for FASTAUTO mode
date:   1 year, 1 month ago
config: arm64-randconfig-r2107-20261115 (https://download.01.org/0day-ci/archive/20261118/20261118034428.45oknqbt-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project c0693becb96c1610aeb87445a50df00d58a823cd)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 1fd05367d5b1 ("scsi: ufs: host: mediatek: Adjust sync length for FASTAUTO mode")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/20261118034428.45oknqbt-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/ufs/host/ufs-mediatek.c:1351:32-33: WARNING: Use ARRAY_SIZE

vim +1351 drivers/ufs/host/ufs-mediatek.c

  1334	
  1335	static void ufs_mtk_adjust_sync_length(struct ufs_hba *hba)
  1336	{
  1337		int i;
  1338		u32 value;
  1339		u32 cnt, att, min;
  1340		struct attr_min {
  1341			u32 attr;
  1342			u32 min_value;
  1343		} pa_min_sync_length[] = {
  1344			{PA_TXHSG1SYNCLENGTH, 0x48},
  1345			{PA_TXHSG2SYNCLENGTH, 0x48},
  1346			{PA_TXHSG3SYNCLENGTH, 0x48},
  1347			{PA_TXHSG4SYNCLENGTH, 0x48},
  1348			{PA_TXHSG5SYNCLENGTH, 0x48}
  1349		};
  1350	
> 1351		cnt = sizeof(pa_min_sync_length) / sizeof(struct attr_min);
  1352		for (i = 0; i < cnt; i++) {
  1353			att = pa_min_sync_length[i].attr;
  1354			min = pa_min_sync_length[i].min_value;
  1355			ufshcd_dme_get(hba, UIC_ARG_MIB(att), &value);
  1356			if (value < min)
  1357				ufshcd_dme_set(hba, UIC_ARG_MIB(att), min);
  1358	
  1359			ufshcd_dme_peer_get(hba, UIC_ARG_MIB(att), &value);
  1360			if (value < min)
  1361				ufshcd_dme_peer_set(hba, UIC_ARG_MIB(att), min);
  1362		}
  1363	}
  1364	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
