Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0A1C293C45
	for <oe-kbuild-all@lists.linux.dev>; Fri, 18 Jul 2025 08:30:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752827443; cv=none; b=BtRF36du0t8iLqEU1pvyLG0GfQx2aQrwItb65IBFaYr0RuKD+LhNpeX5nA5l8pvcqCJUf4XjgmxRkzjh1+ze8VkdIi7mxt9yV2jOqMqSUuU5BQsolSm2vJ+sRNFiP9hYdmkLJCdSKo95gKl0oKiGRurJR2NnM+wHyLpQDaZjREg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752827443; c=relaxed/simple;
	bh=6PNg2ATfrRxkqG8lzPKuLvJqKM7xuGN/mquRw/GTfS8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=cHXbQwiJe6Reh6bpI3pJDEFZAsG17wHKgV5D+jGobsZWTYrHm763VmDyW7eBS+PXJDUd6zROBaMSb2ggSUDIuk5kTlDLGOU9vWyZJhX9M1/0HNtJ8S+t4fTDVYoywYkqSXj4rvUGeod9jIWOhbP59IegXaQ9G8Ovg4Yplsux92A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TgX2OiZk; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TgX2OiZk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752827442; x=1784363442;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=6PNg2ATfrRxkqG8lzPKuLvJqKM7xuGN/mquRw/GTfS8=;
  b=TgX2OiZkOnHhvrzUIEdKaStNN4O+9hZSQ4AAdObFBy1lq6A+US+iNAhu
   E4/UpyLRchcGZ6rnZaIUJ3T8lrGVet/nP/FSBEK+5uD+DjuMQ48TVXAF+
   LFNM7GGIISbBiC2D6LyIW+MCoDmQ7h0ODcrGznicD6yHKowfeMcnt/q37
   ZM4WoVAB3MK45uvh69KfCEtL+yWWY4cIce3GYgT2NfgieZuDES0M1F+6n
   ejk6cimKyPF18wG2f4e4gT/4TQBreLdkBcTGSbDWWrxkzY4yScVPlZP3a
   M5pwJaTP/3vp0EZo/X5u6OQ/UMtBzj5WjHdxyhrStXU0S8vXWCx+8npXO
   Q==;
X-CSE-ConnectionGUID: 74+7w7oqR3uVbNcT8dnX5g==
X-CSE-MsgGUID: /apGTCKuQ6qHbKDjeB5tgA==
X-IronPort-AV: E=McAfee;i="6800,10657,11495"; a="66566022"
X-IronPort-AV: E=Sophos;i="6.16,321,1744095600"; 
   d="scan'208";a="66566022"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jul 2025 01:30:39 -0700
X-CSE-ConnectionGUID: 2inKL5F6RBaVghhqn+6e6A==
X-CSE-MsgGUID: ae9NI1C9TEy2S0QXDJagrw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,321,1744095600"; 
   d="scan'208";a="158573134"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 18 Jul 2025 01:30:38 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ucgUG-000ERj-1I;
	Fri, 18 Jul 2025 08:30:36 +0000
Date: Fri, 18 Jul 2025 16:29:44 +0800
From: kernel test robot <lkp@intel.com>
To: Balamurugan C <balamurugan.c@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, Mark Brown <broonie@kernel.org>,
	Bard Liao <yung-chuan.liao@linux.intel.com>
Subject: [broonie-ci:fileDmPD4i 13/15]
 sound/soc/intel/common/soc-acpi-intel-ptl-match.c:29:32: error:
 'ptl_lt6911_hdmi' undeclared here (not in a function)
Message-ID: <202507181635.cwgks3dN-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/ci.git fileDmPD4i
head:   8b8cb3bb144176d37f19bc8fe4a4f26a8e4337fe
commit: 850abb8a75285bf03edf682814df7ab03b8ea619 [13/15] ASoC: Intel: sof_rt5682: Add HDMI-In capture with rt5682 support for PTL.
config: x86_64-randconfig-002-20250718 (https://download.01.org/0day-ci/archive/20250718/202507181635.cwgks3dN-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14+deb12u1) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250718/202507181635.cwgks3dN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507181635.cwgks3dN-lkp@intel.com/

All errors (new ones prefixed by >>):

>> sound/soc/intel/common/soc-acpi-intel-ptl-match.c:29:32: error: 'ptl_lt6911_hdmi' undeclared here (not in a function)
      29 |                 .quirk_data = &ptl_lt6911_hdmi,
         |                                ^~~~~~~~~~~~~~~


vim +/ptl_lt6911_hdmi +29 sound/soc/intel/common/soc-acpi-intel-ptl-match.c

    23	
    24	struct snd_soc_acpi_mach snd_soc_acpi_intel_ptl_machines[] = {
    25		{
    26			.comp_ids = &ptl_rt5682_rt5682s_hp,
    27			.drv_name = "ptl_rt5682_c1_h02",
    28			.machine_quirk = snd_soc_acpi_codec_list,
  > 29			.quirk_data = &ptl_lt6911_hdmi,
    30			.sof_tplg_filename = "sof-ptl-rt5682-ssp1-hdmi-ssp02.tplg",
    31		},
    32		{
    33			.comp_ids = &ptl_rt5682_rt5682s_hp,
    34			.drv_name = "ptl_rt5682_def",
    35			.sof_tplg_filename = "sof-ptl", /* the tplg suffix is added at run time */
    36			.tplg_quirk_mask = SND_SOC_ACPI_TPLG_INTEL_AMP_NAME |
    37						SND_SOC_ACPI_TPLG_INTEL_CODEC_NAME,
    38		},
    39		{},
    40	};
    41	EXPORT_SYMBOL_GPL(snd_soc_acpi_intel_ptl_machines);
    42	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
