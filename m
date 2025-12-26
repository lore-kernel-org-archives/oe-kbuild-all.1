Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2ADA4A3C
	for <oe-kbuild-all@lists.linux.dev>; Fri, 26 Dec 2025 04:07:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766722050; cv=none; b=jRne5gYdF5IbOzB2I2ZFfe+nBUHWsPFeCE/lc+Sqrljv7dSpFMmSIS8n9E8JcjXX8xDxG/8pYQKs0IqE+rm8QRBYiyn8Hk8kgP8aIfH8dC1Odz1/RFUWtxyABEcadIPfXK0nNPVYDd30cQTDxRqh8bL7qFqClVaTqxyDa51SvWY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766722050; c=relaxed/simple;
	bh=DvoVcoyPgW5hc+UBhn2s0B1ATlGO9v3KrXUU+nZz/C8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=SYtzPRIzgKaHbDNvZwZnD10bwxtpGN+p4vuRknmH8oMXk/aTN+3np3Fs97XAzsyf+WrFpBGRq9z59Hdh8ifgqoche3LWkipjkh+4/ONys1KwDawFQX9gaLV3wQNmw/FHvoK5+82+A7zgycCN7/lglfQcue/nzdJdgCknXvCoSCw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bMWPJmJ3; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bMWPJmJ3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766722049; x=1798258049;
  h=date:from:to:cc:subject:message-id;
  bh=DvoVcoyPgW5hc+UBhn2s0B1ATlGO9v3KrXUU+nZz/C8=;
  b=bMWPJmJ3NJ5Q3o4B1nye2LwwRRjpUC/XNXbJD1t1nYWmLXAXsMEsaKMB
   rK3h3dyKVS1e5gs7vhjpx+6DYkYjdGFpo8vRDSR6h/8sTbuhMhosuKKhC
   +iyjx67QZBEn6c2NogUP8ItyN9iMwNjtcTOxm1o0xOpArE76NsgnnAJmu
   4bxsQkvBGa/o2X8qQVawl5H5HzodZjlitG+IoGyEwProWIGw8dFyPFkdl
   6UgKo3ug9uzV1fWGAWPq1uJb/uiAfXQ5RpoC1StViSOv0ANSYKPv7ur0l
   /kX7eZy3/kyxkDKt9JBzTJ9ZRNZDBqwhX29PSG57lWTPMV54G+654Kce3
   A==;
X-CSE-ConnectionGUID: VE5iq/tgRQiblI9ob5Y/3A==
X-CSE-MsgGUID: lqNK3lD9QvGlaMMxJwKtIA==
X-IronPort-AV: E=McAfee;i="6800,10657,11652"; a="71074659"
X-IronPort-AV: E=Sophos;i="6.21,177,1763452800"; 
   d="scan'208";a="71074659"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Dec 2025 20:07:28 -0800
X-CSE-ConnectionGUID: hA9cUoHETQqKi/UHGtRIaQ==
X-CSE-MsgGUID: rvM7mzoUQFSiQIKXODT8tQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,177,1763452800"; 
   d="scan'208";a="204816370"
Received: from lkp-server02.sh.intel.com (HELO dd3453e2b682) ([10.239.97.151])
  by fmviesa005.fm.intel.com with ESMTP; 25 Dec 2025 20:07:26 -0800
Received: from kbuild by dd3453e2b682 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vYz6p-000000004h3-0aYm;
	Fri, 26 Dec 2025 04:07:23 +0000
Date: Fri, 26 Dec 2025 12:06:25 +0800
From: kernel test robot <lkp@intel.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [morimoto:sound-cleanup-2025-12-16 13/18]
 sound/soc/sti/uniperif_reader.c:422:44: error: 'uni_selectable_formats'
 undeclared here (not in a function); did you mean 'ui_selectable_formats'?
Message-ID: <202512261245.itpP3b6X-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/morimoto/linux sound-cleanup-2025-12-16
head:   32531f002d5d3c578d98a699c3f79c082ea4296e
commit: 44a13cc7bec06a431483d34ac991314ce6656561 [13/18] hoge
config: parisc-allyesconfig (https://download.01.org/0day-ci/archive/20251226/202512261245.itpP3b6X-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251226/202512261245.itpP3b6X-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512261245.itpP3b6X-lkp@intel.com/

All errors (new ones prefixed by >>):

>> sound/soc/sti/uniperif_reader.c:422:44: error: 'uni_selectable_formats' undeclared here (not in a function); did you mean 'ui_selectable_formats'?
     422 |         .auto_selectable_formats        = &uni_selectable_formats,
         |                                            ^~~~~~~~~~~~~~~~~~~~~~
         |                                            ui_selectable_formats
   sound/soc/sti/uniperif_reader.c:404:18: warning: 'ui_selectable_formats' defined but not used [-Wunused-const-variable=]
     404 | static const u64 ui_selectable_formats =
         |                  ^~~~~~~~~~~~~~~~~~~~~


vim +422 sound/soc/sti/uniperif_reader.c

   399	
   400	/*
   401	 * Select below from Sound Card, not Auto
   402	 *	SND_SOC_DAIFMT_CBx_CFx
   403	 */
   404	static const u64 ui_selectable_formats =
   405		SND_SOC_POSSIBLE_DAIFMT_I2S	|
   406		SND_SOC_POSSIBLE_DAIFMT_RIGHT_J	|
   407		SND_SOC_POSSIBLE_DAIFMT_LEFT_J	|
   408		SND_SOC_POSSIBLE_DAIFMT_NB_NF	|
   409		SND_SOC_POSSIBLE_DAIFMT_NB_IF	|
   410		SND_SOC_POSSIBLE_DAIFMT_IB_NF	|
   411		SND_SOC_POSSIBLE_DAIFMT_IB_IF;
   412	
   413	static const struct snd_soc_dai_ops uni_reader_dai_ops = {
   414		.startup			= uni_reader_startup,
   415		.shutdown			= uni_reader_shutdown,
   416		.prepare			= uni_reader_prepare,
   417		.probe				= sti_uniperiph_dai_probe,
   418		.trigger			= uni_reader_trigger,
   419		.hw_params			= sti_uniperiph_dai_hw_params,
   420		.set_fmt			= sti_uniperiph_dai_set_fmt,
   421		.set_tdm_slot			= sti_uniperiph_set_tdm_slot,
 > 422		.auto_selectable_formats	= &uni_selectable_formats,
   423		.num_auto_selectable_formats	= 1,
   424	};
   425	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
