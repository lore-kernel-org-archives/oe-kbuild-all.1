Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795117444;
	b=cY9O/o/nubDBv0r7mTVjcDCIRzgAIFiCj3bqeJJ/8tk0wrh90VpVKwFLQdQ5M0C4Wk8t
	 ecp7A/Oe+sE5XRNyme6BkKrq+fyuUMnWT/5lxSs7DKn4lkFE+ewrAyTL+WbT5ztl34NAA
	 fQrQ0FPPkIm6KkffsY7OOYinUbWzwb8jvybEKWJYdNCFGsID8VgVGRv2ibNokQCOtxVNR
	 pjXQQkh5A6R1g5q5+J7nGJ2Qhs29DfziPDSixs1UmpNO0C2Sda2a6UU2gyfLP3n5BCPwX
	 VQV8yLkNP5BuOYzkSpl47/dZo6gtfT2bpw+/f4HXiQukQSA/NEHfJwzN1NKjZQqM93A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795117444;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=XGfTS76e4OVw7YvpQab4UmebLRY3/zhmbeq2IGtPEXg=;
	b=wvUmijKzYuxEMJO8Mj+FICNE1PYTuhHp9z8YzevsahWNDsL9NlKH+7C970LkEqIMUOO9
	 cuyXTIa6eIBtpPoGxhBQhgcM56B0Ew16X1F5iXYiwkcyZTbwHyypwUvFjzsJJ1g1aRrls
	 PHqxjnG/ZQj7g7gaEv4EyduscdldS4eUFwMAW9LZpfl3yTAfX8pdFuxCzZ8/hJdni0ywu
	 FCOOwcabDnaTk/aqTUK4we46gL7w/0GMvpryjH6Hs6wQOpAtUCkhuBa6eU/78FVpwUsCM
	 IqTVoTjM+tvfvuBv028EqI0UtWRDnK2g9D/p0ig2zDeclXyuLDcIPIa0qczouYbRHwg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=nLgRL7jS;
	arc=none smtp.remote-ip=198.175.65.18
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C13E1606A326
	for <oe-kbuild-all@lists.linux.dev>; Thu, 19 Nov 2026 19:44:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C13E1606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=nLgRL7jS
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795117444; x=1826653444;
  h=date:from:to:cc:subject:message-id;
  bh=t2kcyMRQqxTUoiuLWRxios/i7NLIMOSZvEBbrSXYmDk=;
  b=nLgRL7jS5h/0WablWp84bFXSbKBW4Xk53CFy3UL3BQWMqgR7Zbd+B++L
   bEf5BLvmsBDrE6oypP3WjLyTFN3UkmPlLNgsPmcAEehBWEvSJDmiQB4DO
   HI+tJNntZZqKrE+qBx/BQ71SyFLYVUA8LrT+re60YGQOvgcrEyxAxMbPl
   HR4SWQrOuWfTuIF3cWdpk0HEbRdMbGVav6Sc7j14hglw+dVK+EC8SwC13
   eA0yri57wth9UUCLhma+H9H/gQLzFFlC2wKMJCScZ+Aj5tCnKvot/TCnA
   yKJU8Pik65PSjQEAi6zfDZ8CinjWGJ/b1+FhfzfYRgrXIePer9vYvv8WZ
   A==;
X-CSE-ConnectionGUID: /3N1lGUhSlq0eBw0n3jhTQ==
X-CSE-MsgGUID: 7zDH2DL9RtCC0OXggVfBwA==
X-IronPort-AV: E=McAfee;i="6800,10657,11971"; a="4002086"
X-IronPort-AV: E=Sophos;i="6.27,221,1787036400"; 
   d="scan'208";a="4002086"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2026 11:41:58 -0800
X-CSE-ConnectionGUID: dNugRaFSShGJtFiMc45Ojg==
X-CSE-MsgGUID: 3rr82W8HTh+xfAINJsJgFA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,221,1787036400"; 
   d="scan'208";a="10852417"
Received: from igk-lkp-server01.igk.intel.com (HELO 1073a420ae3a) ([10.211.93.152])
  by fmviesa006.fm.intel.com with ESMTP; 19 Nov 2026 11:41:56 -0800
Received: from kbuild by 1073a420ae3a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xU814-000000003pt-0jOq;
	Thu, 19 Nov 2026 19:41:54 +0000
Date: Thu, 19 Nov 2026 20:41:17 +0100
From: kernel test robot <lkp@intel.com>
To: Peter Wang <peter.wang@mediatek.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 Bart Van Assche <bvanassche@acm.org>
Subject: drivers/ufs/host/ufs-mediatek.c:1351:32-33: WARNING: Use
 ARRAY_SIZE
Message-ID: <20261119203207.ZZFIVGcA-lkp@intel.com>
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
head:   8dac6df92a2e66e2098bbc69061964cfe7e8375b
commit: 1fd05367d5b1a5edd3d14c966a5f510e5b8a0c5e scsi: ufs: host: mediatek: Adjust sync length for FASTAUTO mode
date:   1 year, 1 month ago
config: arm64-randconfig-r2107-20261115 (https://download.01.org/0day-ci/archive/20261119/20261119203207.ZZFIVGcA-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project c0693becb96c1610aeb87445a50df00d58a823cd)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 1fd05367d5b1 ("scsi: ufs: host: mediatek: Adjust sync length for FASTAUTO mode")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/20261119203207.ZZFIVGcA-lkp@intel.com/

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
