Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A3A93914E4
	for <oe-kbuild-all@lists.linux.dev>; Thu,  2 Jul 2026 07:31:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782977518; cv=none; b=Spyr/edsULskj137rD1ggZS9ZEfh7OQgI8Fy7/uRToooho3IYTmqXBtDStyXOA6RY20Ij/vabbngUbLQWpq9ptd4dIGgsHRwcauoN+mQf2/n4CG5vRw9DIetn3J7tA1O38XhyvMWuOWLM79mvjJO/YwfMdRa2JRbcgOZTuhCf60=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782977518; c=relaxed/simple;
	bh=9vX3IBGMTvQclq76dbD42SojDULLrq0YssHZLMIl+6k=;
	h=Date:From:To:Cc:Subject:Message-ID; b=pqcDjU1bUdvMvTEURwrbNMjdIUpbPp1U1fAucoTc7+hP7VfpcQCvLeXIHUJhvIMSos4D5P0RUMG/lrGKgaPey18Eo8McV7sRWDYQSQ7D+D8Zq12e5izNHjmxqLc+BSPKuh5LhdAVVQ+J8mhD2S8jA4W/gO2KijpyU5ssKkpRZ9w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ETVl7yr1; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ETVl7yr1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782977515; x=1814513515;
  h=date:from:to:cc:subject:message-id;
  bh=9vX3IBGMTvQclq76dbD42SojDULLrq0YssHZLMIl+6k=;
  b=ETVl7yr1dNUrRbBsyz1GTb4zjpbDU1rha++h+HGtxBQMFPHJd+kgQzuJ
   PS/KCkQQiK2DSEHBUvDicG0nDuiyAesp8t7NTJjPJnMsg+hzzHgICjFUQ
   6ZRQypfhrMlELYiueDHtjYz4CrK41GvNnXu1uN8x78duHbcRH2vY5Jv4d
   ofrPDijE9kuLzCAFk8MsEb8syPQEQ5z7U6MzmTkTtskFWl1pt/s5bYlnr
   sQcCg+7c1kHvhvfD78fgTWRWpR+adenlssLkHJUk4ZtrvzpZeDG9on5b0
   ZN9+aoob3ZKqy+Jn2c3rZVarvPTmvwQutH+OKb5CUC8sUVWqZpZptOy+e
   g==;
X-CSE-ConnectionGUID: vk/lAgb0RMGw5oFX+zDxjg==
X-CSE-MsgGUID: aF/WqpC5T2iMR+OUUYduBQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11834"; a="94076204"
X-IronPort-AV: E=Sophos;i="6.25,143,1779174000"; 
   d="scan'208";a="94076204"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jul 2026 00:31:54 -0700
X-CSE-ConnectionGUID: U3IqyvteSmS9tF35dS3IWg==
X-CSE-MsgGUID: lFJHSGc3SIufAcpEsc9m6Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,143,1779174000"; 
   d="scan'208";a="248328885"
Received: from igk-lkp-server01.igk.intel.com (HELO e5a8ed462067) ([10.211.93.152])
  by fmviesa006.fm.intel.com with ESMTP; 02 Jul 2026 00:31:53 -0700
Received: from kbuild by e5a8ed462067 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wfBtm-0000000019l-2mUh;
	Thu, 02 Jul 2026 07:31:50 +0000
Date: Thu, 02 Jul 2026 09:31:32 +0200
From: kernel test robot <lkp@intel.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [morimoto:sound-cleanup-extra-2026-07-02 3/9] Warning:
 sound/soc/soc-devres.c:33 function parameter 'name' not described in
 'devm_snd_soc_register_component_with_name6'
Message-ID: <202607020945.Vx9D1kkP-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/morimoto/linux sound-cleanup-extra-2026-07-02
head:   1c9d94cfc97661b6296c22730145ae0113d72ca2
commit: 0e0a684747d1eff369dafac687ca1be79d782827 [3/9] ASoC: soc-component: add .priv
config: x86_64-rhel-9.4 (https://download.01.org/0day-ci/archive/20260702/202607020945.Vx9D1kkP-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260702/202607020945.Vx9D1kkP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607020945.Vx9D1kkP-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: sound/soc/soc-devres.c:33 function parameter 'name' not described in 'devm_snd_soc_register_component_with_name6'
>> Warning: sound/soc/soc-devres.c:33 function parameter 'name' not described in 'devm_snd_soc_register_component_with_name6'

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
