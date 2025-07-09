Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA0A21E5B78
	for <oe-kbuild-all@lists.linux.dev>; Wed,  9 Jul 2025 16:06:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752077210; cv=none; b=lkRuI5iAlqUsp0148SPCqORk3jK1GyKdp1ar4zxIGrysAUMpwDSFX0weBX6MZBk9TyP2mjyUF3CB2hGGKEd5a+4Mhnml/eELQlvkxL89emkvWJQYIC647Ct+Gm647kSYRB+CqgfglVEtMmoB433Kvq+KCRdkFVR8TwWn88l7eMU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752077210; c=relaxed/simple;
	bh=Iw01SdOK6NsdAVs1WwArRVUiGOjinnWmxDjn9hhqfos=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=SRSu9IjCRXpMSWulQQ1RuDEhzxDE93Kf+DiwadOBiFKUyAcAk6fGiZetQwauQc+B7kSUwRZkabY5HTaIHNO4m0J5buDXXugxMPqZzdxOsthMCDtySb33TV0EUrcepfCvQ2bUUgIXL0Dl7xQI9JKmM4IzPiyXu1SNOQsi5C7J29U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Fly90wGt; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Fly90wGt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752077209; x=1783613209;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Iw01SdOK6NsdAVs1WwArRVUiGOjinnWmxDjn9hhqfos=;
  b=Fly90wGtLq5RF/NZxrMWzF3NX7lhgG5Rh9ZrLnmP9rkqsaOPrQTM3pp9
   9ibfuFvkDcDDtdXQrJ+xtPNEyAOaLfpYyd9PwoLH89OzUJqUTuBCXsjbA
   HhqT70CRhcx6J0oMh2A90UB6aBZhpvQokJZnNngJbiQAcwNT6LaDFGmR4
   nOu7oIsmsOOMfemrnPX3lzGJ+hseWisELfvTDFRZSOJaJ9TVeoauwMbyF
   D3peq6Mvo7gc/i/GqP+GIgFwYRklfvMC3ONEbJM7nyBVxcaVcZ98r/7M1
   xfB6VPpUe/zavq5bm4r9Q2SCRFsVhbMB8neQ2NLX1o+JuN+ptlfPXHlRe
   w==;
X-CSE-ConnectionGUID: B3JhBTs5ShSwkJ+yTMeTCw==
X-CSE-MsgGUID: ubu7VIbUQviS+qILVgIMCw==
X-IronPort-AV: E=McAfee;i="6800,10657,11489"; a="54473672"
X-IronPort-AV: E=Sophos;i="6.16,298,1744095600"; 
   d="scan'208";a="54473672"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jul 2025 09:06:48 -0700
X-CSE-ConnectionGUID: HhoO8YZaSlOYJa57Qpan9Q==
X-CSE-MsgGUID: SzcXI6SHSJyc6hRRCLvi3w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,298,1744095600"; 
   d="scan'208";a="160350116"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 09 Jul 2025 09:06:48 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uZXJl-0003iv-0C;
	Wed, 09 Jul 2025 16:06:45 +0000
Date: Thu, 10 Jul 2025 00:06:25 +0800
From: kernel test robot <lkp@intel.com>
To: Brian Masney <bmasney@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [masneyb:clk-remove-round-rate 19/195]
 drivers/clk/at91/clk-peripheral.c:335:12: error: redefinition of
 'clk_sam9x5_peripheral_determine_rate'
Message-ID: <202507100052.fogoKeEo-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/masneyb/linux clk-remove-round-rate
head:   87183237516af3a54bb2ce1f72e261ddaa776bee
commit: 3fb9f70c4af0259c167d5e0613400052cfc55096 [19/195] clk: at91: peripheral: convert from round_rate() to determine_rate()
config: arm-randconfig-001-20250709 (https://download.01.org/0day-ci/archive/20250710/202507100052.fogoKeEo-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250710/202507100052.fogoKeEo-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507100052.fogoKeEo-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

>> drivers/clk/at91/clk-peripheral.c:335:12: error: redefinition of 'clk_sam9x5_peripheral_determine_rate'
     335 | static int clk_sam9x5_peripheral_determine_rate(struct clk_hw *hw,
         |            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/clk/at91/clk-peripheral.c:271:12: note: previous definition of 'clk_sam9x5_peripheral_determine_rate' with type 'int(struct clk_hw *, struct clk_rate_request *)'
     271 | static int clk_sam9x5_peripheral_determine_rate(struct clk_hw *hw,
         |            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/clk/at91/clk-peripheral.c:271:12: warning: 'clk_sam9x5_peripheral_determine_rate' defined but not used [-Wunused-function]


vim +/clk_sam9x5_peripheral_determine_rate +335 drivers/clk/at91/clk-peripheral.c

   270	
 > 271	static int clk_sam9x5_peripheral_determine_rate(struct clk_hw *hw,
   272							struct clk_rate_request *req)
   273	{
   274		struct clk_sam9x5_peripheral *periph = to_clk_sam9x5_peripheral(hw);
   275		struct clk_hw *parent = clk_hw_get_parent(hw);
   276		unsigned long parent_rate = clk_hw_get_rate(parent);
   277		unsigned long tmp_rate;
   278		long best_rate = LONG_MIN;
   279		long best_diff = LONG_MIN;
   280		u32 shift;
   281	
   282		if (periph->id < PERIPHERAL_ID_MIN || !periph->range.max)
   283			return parent_rate;
   284	
   285		/* Fist step: check the available dividers. */
   286		for (shift = 0; shift <= PERIPHERAL_MAX_SHIFT; shift++) {
   287			tmp_rate = parent_rate >> shift;
   288	
   289			if (periph->range.max && tmp_rate > periph->range.max)
   290				continue;
   291	
   292			clk_sam9x5_peripheral_best_diff(req, parent, parent_rate,
   293							shift, &best_diff, &best_rate);
   294	
   295			if (!best_diff || best_rate <= req->rate)
   296				break;
   297		}
   298	
   299		if (periph->chg_pid < 0)
   300			goto end;
   301	
   302		/* Step two: try to request rate from parent. */
   303		parent = clk_hw_get_parent_by_index(hw, periph->chg_pid);
   304		if (!parent)
   305			goto end;
   306	
   307		for (shift = 0; shift <= PERIPHERAL_MAX_SHIFT; shift++) {
   308			struct clk_rate_request req_parent;
   309	
   310			clk_hw_forward_rate_request(hw, req, parent, &req_parent, req->rate << shift);
   311			if (__clk_determine_rate(parent, &req_parent))
   312				continue;
   313	
   314			clk_sam9x5_peripheral_best_diff(req, parent, req_parent.rate,
   315							shift, &best_diff, &best_rate);
   316	
   317			if (!best_diff)
   318				break;
   319		}
   320	end:
   321		if (best_rate < 0 ||
   322		    (periph->range.max && best_rate > periph->range.max))
   323			return -EINVAL;
   324	
   325		pr_debug("PCK: %s, best_rate = %ld, parent clk: %s @ %ld\n",
   326			 __func__, best_rate,
   327			 __clk_get_name((req->best_parent_hw)->clk),
   328			 req->best_parent_rate);
   329	
   330		req->rate = best_rate;
   331	
   332		return 0;
   333	}
   334	
 > 335	static int clk_sam9x5_peripheral_determine_rate(struct clk_hw *hw,
   336							struct clk_rate_request *req)
   337	{
   338		int shift = 0;
   339		unsigned long best_rate;
   340		unsigned long best_diff;
   341		unsigned long cur_rate = req->best_parent_rate;
   342		unsigned long cur_diff;
   343		struct clk_sam9x5_peripheral *periph = to_clk_sam9x5_peripheral(hw);
   344	
   345		if (periph->id < PERIPHERAL_ID_MIN || !periph->range.max) {
   346			req->rate = req->best_parent_rate;
   347	
   348			return 0;
   349		}
   350	
   351		if (periph->range.max) {
   352			for (; shift <= PERIPHERAL_MAX_SHIFT; shift++) {
   353				cur_rate = req->best_parent_rate >> shift;
   354				if (cur_rate <= periph->range.max)
   355					break;
   356			}
   357		}
   358	
   359		if (req->rate >= cur_rate) {
   360			req->rate = cur_rate;
   361	
   362			return 0;
   363		}
   364	
   365		best_diff = cur_rate - req->rate;
   366		best_rate = cur_rate;
   367		for (; shift <= PERIPHERAL_MAX_SHIFT; shift++) {
   368			cur_rate = req->best_parent_rate >> shift;
   369			if (cur_rate < req->rate)
   370				cur_diff = req->rate - cur_rate;
   371			else
   372				cur_diff = cur_rate - req->rate;
   373	
   374			if (cur_diff < best_diff) {
   375				best_diff = cur_diff;
   376				best_rate = cur_rate;
   377			}
   378	
   379			if (!best_diff || cur_rate < req->rate)
   380				break;
   381		}
   382	
   383		req->rate = best_rate;
   384	
   385		return 0;
   386	}
   387	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
