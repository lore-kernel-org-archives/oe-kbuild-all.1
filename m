Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DD24136E09
	for <oe-kbuild-all@lists.linux.dev>; Mon, 15 Jul 2024 20:52:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721076747; cv=none; b=pQKM599JeTdDSha358hqi3ZmW0XXJHXASqJUDHNJiH1WLZ52DamhZ6mbbiYxJmSKdwz9EObkQHVKkUjApE1WljBoGF5rk5ja3b7cSrPA9MNNopulpGD4L2GPLeSpyJgBOkElKMx8L6DaG2gOV1BVtxHFiZ45VDokLSEqRkCAz+I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721076747; c=relaxed/simple;
	bh=7E0pBFoIIUfoJiRa5VTcGeeBLPX3e5b2bj5VorAB4IE=;
	h=Date:From:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=TVai12RmQ3UNR1WEDimEiceIcmy6SBotctLHswDtB7CjRB5hXax9Ppm/Ze7kD2JpYgYp3w+PsYk6ZpW8nLt/2ePqpt9ZXNwXh43ZXxDD2kUsjKYyjEpbyu5xIovWI7cEx0bzxfaZx8pP8xHg7+MktCA3GPOVIe4RkLs7XLLXBTs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mlSR3Twd; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mlSR3Twd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1721076745; x=1752612745;
  h=date:from:cc:subject:message-id:mime-version;
  bh=7E0pBFoIIUfoJiRa5VTcGeeBLPX3e5b2bj5VorAB4IE=;
  b=mlSR3TwdFEr84Wu8TSDxN0U9YiHTes7mcVXh/GTqN/Pok8eJdNy8tp8F
   ha+JicPNa47uHZ5kTBpA7Opm691DP6Fus4vs0jDr42XQz5MO4A6Z62S7O
   dqXADHQHmIwx9b2lLuBINNj+d2Rgbx0hJTQ6tgjuo1NNrShA++UbLK4R6
   siS7qqcBUJ9mO6+ScHKbrh+rnVGJlULxTjRlWM6/C0NBqbD0FVIyFIbw+
   OA1brnt2l6+67lPOzJlBEUAdnVj6dRqpfqFyoOhZWgi4cJP8o597r5+xq
   i85cxRHJJnnJ5yN3Wkcf70PsnF2nJO/q9aXYFUx2Txfb4nuTssOxJ9BIO
   A==;
X-CSE-ConnectionGUID: tvbikCPQTh2P/SUL75Uw0Q==
X-CSE-MsgGUID: B1SVFu9vQZat4zmO0nEhDA==
X-IronPort-AV: E=McAfee;i="6700,10204,11134"; a="22347325"
X-IronPort-AV: E=Sophos;i="6.09,211,1716274800"; 
   d="scan'208";a="22347325"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jul 2024 13:52:24 -0700
X-CSE-ConnectionGUID: Eh12fqKkSg2g/o+8O881uA==
X-CSE-MsgGUID: JsgFsHLSQ4iHExKFzAWB/g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,211,1716274800"; 
   d="scan'208";a="54578750"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 15 Jul 2024 13:52:23 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sTSgH-000eZm-0W;
	Mon, 15 Jul 2024 20:52:21 +0000
Date: Tue, 16 Jul 2024 04:52:17 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [plbossart-sound:sof/fix-structures 32/45]
 sound/soc/amd/acp/acp-sdw-sof-mach.c:644:6: warning: variable 'amp_num' set
 but not used
Message-ID: <202407160447.9KCzYnRz-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/plbossart/sound sof/fix-structures
head:   236a32f1dcca780f7f55867cba54eae7ca87bbb2
commit: 8245a1411fef45a208f182c176660107b7f582aa [32/45] ASoC: amd/sdw_utils: add sof based soundwire generic machine driver
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20240716/202407160447.9KCzYnRz-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240716/202407160447.9KCzYnRz-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407160447.9KCzYnRz-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> sound/soc/amd/acp/acp-sdw-sof-mach.c:644:6: warning: variable 'amp_num' set but not used [-Wunused-but-set-variable]
     644 |         int amp_num = 0, i;
         |             ^
   1 warning generated.


vim +/amp_num +644 sound/soc/amd/acp/acp-sdw-sof-mach.c

   637	
   638	static int mc_probe(struct platform_device *pdev)
   639	{
   640		struct snd_soc_acpi_mach *mach = dev_get_platdata(&pdev->dev);
   641		struct snd_soc_card *card;
   642		struct amd_mc_ctx *amd_ctx;
   643		struct asoc_sdw_mc_private *ctx;
 > 644		int amp_num = 0, i;
   645		int ret;
   646	
   647		amd_ctx = devm_kzalloc(&pdev->dev, sizeof(*amd_ctx), GFP_KERNEL);
   648		if (!amd_ctx)
   649			return -ENOMEM;
   650	
   651		amd_ctx->acp_rev = mach->mach_params.subsystem_rev;
   652		amd_ctx->max_sdw_links = ACP63_SDW_MAX_LINKS;
   653		ctx = devm_kzalloc(&pdev->dev, sizeof(*ctx), GFP_KERNEL);
   654		if (!ctx)
   655			return -ENOMEM;
   656		ctx->codec_info_list_count = asoc_sdw_get_codec_info_list_count();
   657		ctx->private = amd_ctx;
   658		card = &ctx->card;
   659		card->dev = &pdev->dev;
   660		card->name = "amd-soundwire",
   661		card->owner = THIS_MODULE,
   662		card->late_probe = asoc_sdw_card_late_probe,
   663	
   664		snd_soc_card_set_drvdata(card, ctx);
   665	
   666		dmi_check_system(sof_sdw_quirk_table);
   667	
   668		if (quirk_override != -1) {
   669			dev_info(card->dev, "Overriding quirk 0x%lx => 0x%x\n",
   670				 sof_sdw_quirk, quirk_override);
   671			sof_sdw_quirk = quirk_override;
   672		}
   673	
   674		log_quirks(card->dev);
   675	
   676		ctx->mc_quirk = sof_sdw_quirk;
   677		/* reset amp_num to ensure amp_num++ starts from 0 in each probe */
   678		for (i = 0; i < ctx->codec_info_list_count; i++)
   679			codec_info_list[i].amp_num = 0;
   680	
   681		ret = sof_card_dai_links_create(card);
   682		if (ret < 0)
   683			return ret;
   684	
   685		/*
   686		 * the default amp_num is zero for each codec and
   687		 * amp_num will only be increased for active amp
   688		 * codecs on used platform
   689		 */
   690		for (i = 0; i < ctx->codec_info_list_count; i++)
   691			amp_num += codec_info_list[i].amp_num;
   692	
   693		card->long_name = sdw_card_long_name;
   694	
   695		/* Register the card */
   696		ret = devm_snd_soc_register_card(card->dev, card);
   697		if (ret) {
   698			dev_err_probe(card->dev, ret, "snd_soc_register_card failed %d\n", ret);
   699			asoc_sdw_mc_dailink_exit_loop(card);
   700			return ret;
   701		}
   702	
   703		platform_set_drvdata(pdev, card);
   704	
   705		return ret;
   706	}
   707	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
