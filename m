Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D01DE29994A
	for <oe-kbuild-all@lists.linux.dev>; Tue, 12 Aug 2025 17:15:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755018909; cv=none; b=YUrKYzb5+09YV0RD3fZkOoSQgegx64odqfysjBIu6/8FyDYDDD4lh/yn2ZtXziXWogNUf5V2ZaR+r+QFFWP25wyh7U2S/1tg+u62LlBCyZ/C8dzD9qsDW3r8Ui0VnvsJ6Ff3htyPLiOqJZBdyutEXR0A41eLISCYTird2+6RlbE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755018909; c=relaxed/simple;
	bh=7Av1z2JV5kfcMHeAXrOd8mLBNVXly/1ZppdERQggGfE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=hxqmgwvqqBuAGdU3HeXklLjF7EB8cS0hFO0fVM10Uc8ppBPflQ17uy5VM+LkYeaIvozr4RPkUEsl7i74I5Xyw351I94GLQNGXhzt1sL0qJa5Mb8kZ9ywRt9Es5zV3ueb7cHGj9GxuT7PSxydDr5xx4Qr2OLiTA+ENT69tBIheKI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NX5Zrsr4; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NX5Zrsr4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755018907; x=1786554907;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=7Av1z2JV5kfcMHeAXrOd8mLBNVXly/1ZppdERQggGfE=;
  b=NX5Zrsr4qiOihX/lE+TQsDhII7QAsgn3AA2Z7hkr5JabdY58NeWkOaec
   vc5QbBdV37QluybZ92cr9CbjpvdL5fC957V+ez0A8Pkvf9HDJJQmv6e5a
   6WSTJbFHIwjVwszEFB2V5WJGZnNkylj6svQfPAdOudS/Cny+4IGjPaLWB
   UFR4CDCiBDlywG3Aj6SBtcySy0HNp4MQSpZTEaewt+YYu1sxpQYnPrwp2
   DZ765GGuhTwVpcvPv43LyUFT6P07AfmbZ/+qqTf1GPmb0vZtI/835nmsi
   CCgvaRKAANaABXeepCO1dSDnhBcqM3qOJeev6EDkhpBgVyVDqh8zA9ryS
   g==;
X-CSE-ConnectionGUID: /wzyqzHKSji4LSsTpV652g==
X-CSE-MsgGUID: /NzUWQXkQUqmeCgNey+H3A==
X-IronPort-AV: E=McAfee;i="6800,10657,11520"; a="56512498"
X-IronPort-AV: E=Sophos;i="6.17,284,1747724400"; 
   d="scan'208";a="56512498"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Aug 2025 10:15:07 -0700
X-CSE-ConnectionGUID: Ymd+waQXS0S0mqUcOj9nmw==
X-CSE-MsgGUID: Zsq8EwidTeacXklgWh3K+g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,284,1747724400"; 
   d="scan'208";a="189949818"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by fmviesa002.fm.intel.com with ESMTP; 12 Aug 2025 10:15:05 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ulsaV-00073m-1m;
	Tue, 12 Aug 2025 17:15:03 +0000
Date: Wed, 13 Aug 2025 01:14:29 +0800
From: kernel test robot <lkp@intel.com>
To: Jonathan Cavitt <jonathan.cavitt@intel.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Lucas De Marchi <lucas.demarchi@intel.com>,
	John Harrison <John.C.Harrison@intel.com>
Subject: [linux-next:master 924/1649]
 drivers/gpu/drm/xe/xe_guc_ads.c:358:41-42: WARNING: Use ARRAY_SIZE
Message-ID: <202508130158.eogeBZQT-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   2674d1eadaa2fd3a918dfcdb6d0bb49efe8a8bb9
commit: 7c9de25efa7677acd4feae905165571be05b6f29 [924/1649] drm/xe/xe_guc_ads: Consolidate guc_waklv_enable functions
config: riscv-randconfig-r063-20250812 (https://download.01.org/0day-ci/archive/20250813/202508130158.eogeBZQT-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 3769ce013be2879bf0b329c14a16f5cb766f26ce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508130158.eogeBZQT-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/gpu/drm/xe/xe_guc_ads.c:358:41-42: WARNING: Use ARRAY_SIZE

vim +358 drivers/gpu/drm/xe/xe_guc_ads.c

   310	
   311	static void guc_waklv_init(struct xe_guc_ads *ads)
   312	{
   313		struct xe_gt *gt = ads_to_gt(ads);
   314		u64 addr_ggtt;
   315		u32 offset, remain, size;
   316	
   317		offset = guc_ads_waklv_offset(ads);
   318		remain = guc_ads_waklv_size(ads);
   319	
   320		if (XE_WA(gt, 14019882105) || XE_WA(gt, 16021333562))
   321			guc_waklv_enable(ads, NULL, 0, &offset, &remain,
   322					 GUC_WORKAROUND_KLV_BLOCK_INTERRUPTS_WHEN_MGSR_BLOCKED);
   323		if (XE_WA(gt, 18024947630))
   324			guc_waklv_enable(ads, NULL, 0, &offset, &remain,
   325					 GUC_WORKAROUND_KLV_ID_GAM_PFQ_SHADOW_TAIL_POLLING);
   326		if (XE_WA(gt, 16022287689))
   327			guc_waklv_enable(ads, NULL, 0, &offset, &remain,
   328					 GUC_WORKAROUND_KLV_ID_DISABLE_MTP_DURING_ASYNC_COMPUTE);
   329	
   330		if (XE_WA(gt, 14022866841))
   331			guc_waklv_enable(ads, NULL, 0, &offset, &remain,
   332					 GUC_WA_KLV_WAKE_POWER_DOMAINS_FOR_OUTBOUND_MMIO);
   333	
   334		/*
   335		 * On RC6 exit, GuC will write register 0xB04 with the default value provided. As of now,
   336		 * the default value for this register is determined to be 0xC40. This could change in the
   337		 * future, so GuC depends on KMD to send it the correct value.
   338		 */
   339		if (XE_WA(gt, 13011645652)) {
   340			u32 data = 0xC40;
   341	
   342			guc_waklv_enable(ads, &data, sizeof(data) / sizeof(u32), &offset, &remain,
   343					 GUC_WA_KLV_NP_RD_WRITE_TO_CLEAR_RCSM_AT_CGP_LATE_RESTORE);
   344		}
   345	
   346		if (XE_WA(gt, 14022293748) || XE_WA(gt, 22019794406))
   347			guc_waklv_enable(ads, NULL, 0, &offset, &remain,
   348					 GUC_WORKAROUND_KLV_ID_BACK_TO_BACK_RCS_ENGINE_RESET);
   349	
   350		if (GUC_FIRMWARE_VER(&gt->uc.guc) >= MAKE_GUC_VER(70, 44, 0) && XE_WA(gt, 16026508708))
   351			guc_waklv_enable(ads, NULL, 0, &offset, &remain,
   352					 GUC_WA_KLV_RESET_BB_STACK_PTR_ON_VF_SWITCH);
   353		if (GUC_FIRMWARE_VER(&gt->uc.guc) >= MAKE_GUC_VER(70, 47, 0) && XE_WA(gt, 16026007364)) {
   354			u32 data[] = {
   355				0x0,
   356				0xF,
   357			};
 > 358			guc_waklv_enable(ads, data, sizeof(data) / sizeof(u32), &offset, &remain,
   359					 GUC_WA_KLV_RESTORE_UNSAVED_MEDIA_CONTROL_REG);
   360		}
   361	
   362		size = guc_ads_waklv_size(ads) - remain;
   363		if (!size)
   364			return;
   365	
   366		offset = guc_ads_waklv_offset(ads);
   367		addr_ggtt = xe_bo_ggtt_addr(ads->bo) + offset;
   368	
   369		ads_blob_write(ads, ads.wa_klv_addr_lo, lower_32_bits(addr_ggtt));
   370		ads_blob_write(ads, ads.wa_klv_addr_hi, upper_32_bits(addr_ggtt));
   371		ads_blob_write(ads, ads.wa_klv_size, size);
   372	}
   373	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
