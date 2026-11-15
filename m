Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.16
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794719779;
	b=TL/wMLEM2UgqS7KHwQERJYI1HuBy7CPcGtvajfq+lEl0fMubsJFplPvUEPvgNtD4Cj/P
	 CfWa7ITwCHsFjWJ6C8JXSGCQTv8Xe5HYotnfFgAUhlp2C3p08CV1wXHoAO4A6LyHiT+ub
	 1sNpmf5wNbQ7RxICFNXVHZNIWAYoNoq/dcWZqWnLoivsO5HtS04EJxmdqRKJfIGMaO//F
	 zvTv2SzEQ1C3PR27xND4xjVC8PTAmnMRewikotOh3cJfKOv2//TOyiQ8ejuU7mufRy/GI
	 xTaJp7493Eul55GVGrMNw685ng7ZIa8BA7dRBkHhiNv4503MhVNIg//1+DMsZi6hWdA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794719779;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=YgEtYr0kwmlzIsd4EzeOGIyx6yd2WTOswOOiG/eLtcQ=;
	b=S+f5IK0mWl2+GmQm6pFlVfumtYQJHW4aRLyQcGzPzGKPd3ROuKwHBc99Q5DQItsHE2DR
	 4c8OK6I9aqXaAsp/uBO7RLo5kZqd3Cfmd4k2L7XzMAhcFppy+g3RAh0yd7fboQ9aTe5qJ
	 RkMbheDiRP6Im0xvtiNdsVL3TWV5mdvEq3tQ5n0/sKOMdSIf8oV+DdSvgGzWFZQ48OvG3
	 IJJ+dRV9KCt/sWyaM5x5NFSAXyf91ErzwPbcfxNNYlGp9phZwkJoJNnXBLgS1sPMRZab2
	 FC8wJWcd05p98FRD3FMYmtYPfjruzVrH02n+iQq/v5qLwW7yG5QWUS8zwk5nBTvDMHA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=DUChfVoQ;
	arc=none smtp.remote-ip=198.175.65.16
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DD38606A323
	for <oe-kbuild-all@lists.linux.dev>; Sun, 15 Nov 2026 05:16:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2DD38606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=DUChfVoQ
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794719779; x=1826255779;
  h=date:from:to:cc:subject:message-id;
  bh=A6Dk7+GX8fmvIIbMFLeGW0t+bP/+v+1JlwiKdMEPK3M=;
  b=DUChfVoQbf/rikzHaRpmVEx7kukbJvWEQJUS+vRioPMatd3CcqMrXgtS
   MtbVd9K3fVViLMcn5OdMpP1OlnzH4GfnKGRsMYjBduqld2f9b0tUHXKOI
   dZkfpuwYv3nszSOtP+Gx/blbRAI6yisgV89sOfRgkgTciPjBb/TIk2rmQ
   SEZtChBMMZvekzj9lXaJEMBNoBFRjs2sSUgvb3Zh/D01SCK3Ddp9RklaA
   S+el2vbzX2pnn8e2ZZGlMIPTOGgdnXFWqaqKhKlvlw6aZ3B8FUiFC2qlb
   OytrvUnKphuGHXY3TiFYKrKDI0aUMjPWrzQAK0G7k6dFb5QdQBFRLOQtN
   Q==;
X-CSE-ConnectionGUID: 0ygsO17PR3OJU99mbn7tgQ==
X-CSE-MsgGUID: tSYkP/7GRW2mfSC4SVJ3ew==
X-IronPort-AV: E=McAfee;i="6800,10657,11966"; a="3469939"
X-IronPort-AV: E=Sophos;i="6.27,214,1787036400"; 
   d="scan'208";a="3469939"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Nov 2026 21:16:18 -0800
X-CSE-ConnectionGUID: FD9Ev/aBS0C0WVGtFoYyHg==
X-CSE-MsgGUID: 33maX6SNQZa7IWOq7FjL3g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,214,1787036400"; 
   d="scan'208";a="9592035"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 14 Nov 2026 21:16:17 -0800
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xSSb8-000000016Pi-1VTN;
	Sun, 15 Nov 2026 05:16:14 +0000
Date: Sun, 15 Nov 2026 13:16:10 +0800
From: kernel test robot <lkp@intel.com>
To: Jiri Pirko <jiri@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jpirko-mlxsw:wip_attestation_all_2 61/68]
 drivers/attestation/providers/sim.c:411:1: warning: the frame size of 1568
 bytes is larger than 1280 bytes
Message-ID: <202611151353.uDCWa94i-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

tree:   https://github.com/jpirko/linux_mlxsw wip_attestation_all_2
head:   7ff5e548abbc2312431d4eea9ad283347963a6e2
commit: 8c87940832749279ae0ee5b91b280fff1d951737 [61/68] attestation: Add the simulation family implementation
config: arc-allmodconfig (https://download.01.org/0day-ci/archive/20261115/202611151353.uDCWa94i-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 16.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261115/202611151353.uDCWa94i-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611151353.uDCWa94i-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/attestation/providers/sim.c: In function 'attestation_sim_mr_extend':
>> drivers/attestation/providers/sim.c:411:1: warning: the frame size of 1568 bytes is larger than 1280 bytes [-Wframe-larger-than=]
     411 | }
         | ^


vim +411 drivers/attestation/providers/sim.c

   367	
   368	static int attestation_sim_mr_extend(struct attestation_dev *att,
   369					     unsigned int mr_id,
   370					     const struct ctlv_cursor *mr_options,
   371					     const struct attestation_digest_set *values)
   372	{
   373		struct attestation_digest changed[HASH_ALGO__LAST];
   374		struct attestation_sim *sim = attestation_sim_from_att(att);
   375		DECLARE_BITMAP(extended, HASH_ALGO__LAST) = {};
   376		struct attestation_sim_mr *mr;
   377		unsigned long bank;
   378		size_t index;
   379		int ret;
   380	
   381		ret = attestation_sim_callback_enter(sim, ATTESTATION_SIM_CB_MR_EXTEND);
   382		if (ret)
   383			return ret;
   384		guard(mutex)(&sim->hardware_lock);
   385		if (sim->notification_pending)
   386			return -EAGAIN;
   387		mr = attestation_sim_mr_lookup(sim, mr_id);
   388		if (!mr)
   389			return -ENOENT;
   390		for (index = 0; index < values->values_count; index++) {
   391			const struct attestation_digest *value = &values->values[index];
   392			size_t length = hash_digest_size[value->algorithm];
   393	
   394			for (bank = 0; bank < mr->props.algorithms_count; bank++)
   395				if (mr->values[bank].algorithm == value->algorithm)
   396					break;
   397			if (bank == mr->props.algorithms_count ||
   398			    __test_and_set_bit(bank, extended))
   399				return -EINVAL;
   400			changed[bank].algorithm = value->algorithm;
   401			ret = attestation_sim_digest(value->algorithm,
   402						     mr->values[bank].data, length,
   403						     value->data, length,
   404						     changed[bank].data);
   405			if (ret)
   406				return ret;
   407		}
   408		for_each_set_bit(bank, extended, HASH_ALGO__LAST)
   409			mr->values[bank] = changed[bank];
   410		return 0;
 > 411	}
   412	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
