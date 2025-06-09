Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D70913D544
	for <oe-kbuild-all@lists.linux.dev>; Mon,  9 Jun 2025 16:13:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749485630; cv=none; b=JPzMMskKlUm1Fjdmz6a3/1UCAF2VRia0iTA/u8BSnJ3lGfgVaxsBo8SPy0dt4d13tphVNG0D6KZRNOw9RGmYrXTKTYULhXqQX/cnJIQxFBkteOb6LcmkAQ2EWbMse02g6n2fOkdZJGG0zioWp91LMDn72tCi2q77qRwye/KwbKg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749485630; c=relaxed/simple;
	bh=sajTCtoRUjFyHEHhaSjGl5vAsvXrCyHCEF/bA8WuMc4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DFUWH+I1nGF6byqOyw1XuBXmPLa71e3S/JJeUp777wB9T3BRnA3gR+nJ6zTTIahlvHRQVHORplapSed/kL4rC384xa18J65P4I13kofN6XeP1Re322zR1UTMfeWtoL0UzeyeZdSmOUtGxHXCpyCgPAi4dPXir/SjHf4cZvfXlNM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OhJmyVcl; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OhJmyVcl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749485629; x=1781021629;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=sajTCtoRUjFyHEHhaSjGl5vAsvXrCyHCEF/bA8WuMc4=;
  b=OhJmyVclL0bC9PbauCbc/kRPcK3SZMI8/T9IV2baWwlmU0DChHYeCp68
   AAKVnTwkHZhSOUybWqL4f7j2XMEGPPFiqP6Wz/FPiAFmcIZix/Sr0G8+E
   l5x4LYdEY8RhORVyegZuAPsWL08LwPmM0F83bRcSeDfQjs3SkXagPWVIq
   WzyfekXvev91cmZmI0rf1Clfq5S3wAgJ0lIRynRxafmrgHFJxjxTzaDLu
   UPtsT18ziJ9AUpt4Ayy7wRg3xQzmeTJyO4RfLC4nHRfC/evRnDmF2Sl5O
   zaBpmyv1JBlOls/8dEMpkw4byrfX485o4Tr9kdYUz4cUL/QWbNEozPZ4N
   w==;
X-CSE-ConnectionGUID: nurQUpXBQe+jhDi479r3rw==
X-CSE-MsgGUID: p4wWty3ORkad+5gq1O1mYA==
X-IronPort-AV: E=McAfee;i="6800,10657,11459"; a="69016318"
X-IronPort-AV: E=Sophos;i="6.16,222,1744095600"; 
   d="scan'208";a="69016318"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jun 2025 09:13:19 -0700
X-CSE-ConnectionGUID: dwNAzUeOSqiQIhc8Gnfqag==
X-CSE-MsgGUID: Rg9V7msMTnelEI6h66ju5g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,222,1744095600"; 
   d="scan'208";a="147519128"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 09 Jun 2025 09:13:18 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uOf7b-0007BF-2Z;
	Mon, 09 Jun 2025 16:13:15 +0000
Date: Tue, 10 Jun 2025 00:13:07 +0800
From: kernel test robot <lkp@intel.com>
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: Paul Gazzillo <paul@pgazz.com>,
	Necip Fazil Yildiran <fazilyildiran@gmail.com>,
	oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH 2/2] regulator: rpi-panel-v2: Add regulator for 7"
 Raspberry Pi 720x1280
Message-ID: <202506092341.enbNKMOR-lkp@intel.com>
References: <20250609000748.1665219-2-marek.vasut+renesas@mailbox.org>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250609000748.1665219-2-marek.vasut+renesas@mailbox.org>

Hi Marek,

kernel test robot noticed the following build warnings:

[auto build test WARNING on broonie-regulator/for-next]
[also build test WARNING on soc/for-next krzk-dt/for-next linus/master v6.16-rc1 next-20250606]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Marek-Vasut/regulator-rpi-panel-v2-Add-regulator-for-7-Raspberry-Pi-720x1280/20250609-081005
base:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git for-next
patch link:    https://lore.kernel.org/r/20250609000748.1665219-2-marek.vasut%2Brenesas%40mailbox.org
patch subject: [PATCH 2/2] regulator: rpi-panel-v2: Add regulator for 7" Raspberry Pi 720x1280
config: arc-kismet-CONFIG_GPIO_REGMAP-CONFIG_REGULATOR_RASPBERRYPI_TOUCHSCREEN_V2-0-0 (https://download.01.org/0day-ci/archive/20250609/202506092341.enbNKMOR-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20250609/202506092341.enbNKMOR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506092341.enbNKMOR-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for GPIO_REGMAP when selected by REGULATOR_RASPBERRYPI_TOUCHSCREEN_V2
   WARNING: unmet direct dependencies detected for GPIO_REGMAP
     Depends on [n]: GPIOLIB [=n]
     Selected by [y]:
     - REGULATOR_RASPBERRYPI_TOUCHSCREEN_V2 [=y] && REGULATOR [=y] && I2C [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
