Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5E25B666
	for <oe-kbuild-all@lists.linux.dev>; Tue, 22 Apr 2025 19:16:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745349363; cv=none; b=YWHyFEU01AYdpYTDGNNIjZMO/HnD6jLy5EDtPv/dQtGCaryiUaTn9NdKNByHlvpIQv8CNVY3vtem8FQE4nJ/k3b899F9JDuAHCii8Ruz9PlonwTWkV4kXJNn0q0emNjWSEzij37gMpXBq5fJhzdcF2RW3+lMOL69WnaJ4ZsPxW4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745349363; c=relaxed/simple;
	bh=qXmlkAtLGpmJo5+z+2j3R/vKn/8AlduyVn+veZAlvGE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=JYH92ETWtl1m6sNHmvi/p50jy7BrluteylN6tLKR9cIcFSPxUKkh3eP/3QUAXXQFPp6rHiyiUZA+WqKyPYbkqR7QWaYg7qMZx0K20+C0072xS9rIExoL4We6hlTUNi6CoxvIm63hvyWsWgCCRAt/R/lLcn1NbB4oz3+vtn1PMys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=i+ateuTT; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="i+ateuTT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745349362; x=1776885362;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=qXmlkAtLGpmJo5+z+2j3R/vKn/8AlduyVn+veZAlvGE=;
  b=i+ateuTTyqLKkh/yqNe/GmEAd70EafYa/HnOSw6nDlRcgtXydN6AUfNG
   MOiAMMKZ/Oe2gANk6STST5iQDPVL3xUo1Ig7GPyWChYEOkGZxjCPWVful
   VIa2K+Ug8dpLuQpTKkKk9JVT346PCE/x2ImdxGghLSVBd3KtFpsqXGV0A
   diF8WUNBWhRCysXtrEq39a3C+3cjhV2tKicOkR9tEU9/ER5F3hD/sNh9P
   qHklDzYxOAnQ87dei/C5TQsGQSwq+Cpj0e/ZLHh4airRZDJRtIMTRa/OQ
   Odt6x+7xH+oqWU+hbvNAnk3fNyiqJgM+ahQ29Amxi2Gp44hbADNipIL25
   A==;
X-CSE-ConnectionGUID: wTRSArpBRRGkhGNZhSfwhw==
X-CSE-MsgGUID: y9hBaeJKS2eT55BMK6vQaA==
X-IronPort-AV: E=McAfee;i="6700,10204,11411"; a="72309437"
X-IronPort-AV: E=Sophos;i="6.15,231,1739865600"; 
   d="scan'208";a="72309437"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Apr 2025 12:16:01 -0700
X-CSE-ConnectionGUID: pRXmd3tRRsuR9KJuskbAKA==
X-CSE-MsgGUID: DcutHqIOT9+8ZTVa6qm1MQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,231,1739865600"; 
   d="scan'208";a="136887587"
Received: from lkp-server01.sh.intel.com (HELO 050dd05385d1) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 22 Apr 2025 12:16:00 -0700
Received: from kbuild by 050dd05385d1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u7J66-0001H5-0J;
	Tue, 22 Apr 2025 19:15:58 +0000
Date: Wed, 23 Apr 2025 03:15:34 +0800
From: kernel test robot <lkp@intel.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [morimoto:sound-cleanup-2025-04-22 78/103]
 sound/soc/soc-dapm.c:4786:52: error: 'struct snd_soc_card' has no member
 named 'debugfs_card_root'
Message-ID: <202504230215.K6x6OM7w-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/morimoto/linux sound-cleanup-2025-04-22
head:   f743db58ae26ad957c2beb5f627c328ec8473d30
commit: 0828953f9f1bc958235f3f82f81147e4a4344c84 [78/103] ASoC: soc-dapm: init/free dapm debugfs in soc-dapm
config: arc-randconfig-001-20250423 (https://download.01.org/0day-ci/archive/20250423/202504230215.K6x6OM7w-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250423/202504230215.K6x6OM7w-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504230215.K6x6OM7w-lkp@intel.com/

All errors (new ones prefixed by >>):

   sound/soc/soc-dapm.c: In function 'snd_soc_dapm_init':
>> sound/soc/soc-dapm.c:4786:52: error: 'struct snd_soc_card' has no member named 'debugfs_card_root'
    4786 |                 dapm_debugfs_init(&card->dapm, card->debugfs_card_root);
         |                                                    ^~


vim +4786 sound/soc/soc-dapm.c

  4770	
  4771	void snd_soc_dapm_init(struct snd_soc_dapm_context *dapm,
  4772			       struct snd_soc_card *card,
  4773			       struct snd_soc_component *component)
  4774	{
  4775		dapm->card		= card;
  4776		dapm->component		= component;
  4777		dapm->bias_level	= SND_SOC_BIAS_OFF;
  4778	
  4779		if (component) {
  4780			dapm->dev		= component->dev;
  4781			dapm->idle_bias_off	= !component->driver->idle_bias_on;
  4782			dapm->suspend_bias_off	= component->driver->suspend_bias_off;
  4783			dapm_debugfs_init(&component->dapm, component->debugfs_root);
  4784		} else {
  4785			dapm->dev		= card->dev;
> 4786			dapm_debugfs_init(&card->dapm, card->debugfs_card_root);
  4787		}
  4788	
  4789		INIT_LIST_HEAD(&dapm->list);
  4790		/* see for_each_card_dapms */
  4791		list_add(&dapm->list, &card->dapm_list);
  4792	}
  4793	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
