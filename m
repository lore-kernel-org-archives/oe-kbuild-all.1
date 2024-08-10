Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD54F45C14
	for <oe-kbuild-all@lists.linux.dev>; Sat, 10 Aug 2024 19:35:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723318535; cv=none; b=JKLcs8oVCn45d1ez9Lu9C7pMMzk7unfLQ0aqtSryCKZ03x7CE/dqA1QaH1SVGcjdFdOm9dOi7fjioHAisLku+tO2GCDCVFtPMIf5rGwkE/i5TdeHKcmgKECILcgfiU05Su8htwPk1IEJRhIJ6iFDCusye4JPyysPFx4Q9gvoijg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723318535; c=relaxed/simple;
	bh=fmMxhi+z6NFHOIB4h0MwZ2Ve9LUiK/yOWltAGZz8rT4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EK7ubcmhf0x8JtrFoE+NW0Ke1MfzAfxkmvrPbQEGQtGjyu2VSnd8qP8inn5d3KHcPXRyjcQYjAsfTix4/AMAcMhfSwEp1ncQi9lyrwZgyzpXyvDv3mflicbgpYLPxEZYLUozGDsJap7rKI3ng7ChEfSkSEhlxNNMpErIrzw3IVA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ScFWhqU4; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ScFWhqU4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723318533; x=1754854533;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=fmMxhi+z6NFHOIB4h0MwZ2Ve9LUiK/yOWltAGZz8rT4=;
  b=ScFWhqU4/Ie32wBsxzR+J1EFBK/kyo+KX35ShnzM3rcqEWdxPbrONnMj
   PoBbxkSylmegMwMVtOobGoJbKRZJn7oQGMAJXKUFdEpBGY+ftNYdA2V2K
   3TqD4k08gfTM+Jv8ekX9owiRC8zai4P1939JhZI1T/oDUfTyGYg7zCe0h
   AV1iPfNAiSiEMVssqWJhNYG1kHMwkaBXvGhnGw38+4a1LwEcIdhnqGYNy
   chjwvEztD9lr6Na3vHoWfsg61lGGBqKwSe64SoI6vPxy/kGKbtF+PDfjA
   S2FqpD+CGWS2nf1sMw5A3rOrgjETLPDTcJu/BF5EAsdfWoigGH3MXENLW
   A==;
X-CSE-ConnectionGUID: lH3j8kI/SpiXAcsNBXqi0A==
X-CSE-MsgGUID: Tw3QQSPGSUeMbFlbFr1qBQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11160"; a="38980274"
X-IronPort-AV: E=Sophos;i="6.09,279,1716274800"; 
   d="scan'208";a="38980274"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Aug 2024 12:35:33 -0700
X-CSE-ConnectionGUID: q4SieW/JSlK1h+VMBK2AkA==
X-CSE-MsgGUID: RfvKKc1TQJ2Gp/chTcHlsA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,279,1716274800"; 
   d="scan'208";a="62708524"
Received: from unknown (HELO b6bf6c95bbab) ([10.239.97.151])
  by orviesa005.jf.intel.com with ESMTP; 10 Aug 2024 12:35:30 -0700
Received: from kbuild by b6bf6c95bbab with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1scrs7-000AEV-2K;
	Sat, 10 Aug 2024 19:35:27 +0000
Date: Sun, 11 Aug 2024 03:35:18 +0800
From: kernel test robot <lkp@intel.com>
To: Lorenzo Bianconi <lorenzo@kernel.org>, linux-pwm@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, ukleinek@kernel.org,
	lorenzo.bianconi83@gmail.com, krzk+dt@kernel.org, robh@kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	upstream@airoha.com, angelogioacchino.delregno@collabora.com,
	benjamin.larsson@genexis.eu, conor+dt@kernel.org,
	ansuelsmth@gmail.com
Subject: Re: [PATCH 2/2] pwm: airoha: Add support for EN7581 SoC
Message-ID: <202408110329.6YGwCzoM-lkp@intel.com>
References: <a03f5ea9291e39eab303696eb03fdd44cf04e8d9.1723264979.git.lorenzo@kernel.org>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a03f5ea9291e39eab303696eb03fdd44cf04e8d9.1723264979.git.lorenzo@kernel.org>

Hi Lorenzo,

kernel test robot noticed the following build errors:

[auto build test ERROR on robh/for-next]
[also build test ERROR on linus/master v6.11-rc2 next-20240809]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Lorenzo-Bianconi/dt-bindings-pwm-Document-Airoha-EN7581-PWM/20240810-143716
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/a03f5ea9291e39eab303696eb03fdd44cf04e8d9.1723264979.git.lorenzo%40kernel.org
patch subject: [PATCH 2/2] pwm: airoha: Add support for EN7581 SoC
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20240811/202408110329.6YGwCzoM-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 13.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240811/202408110329.6YGwCzoM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408110329.6YGwCzoM-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/pwm/pwm-airoha.c: In function 'airoha_pwm_config_waveform':
>> drivers/pwm/pwm-airoha.c:239:26: error: implicit declaration of function '__bf_shf' [-Werror=implicit-function-declaration]
     239 |         val = (period << __bf_shf(mask)) & mask;
         |                          ^~~~~~~~
   cc1: some warnings being treated as errors


vim +/__bf_shf +239 drivers/pwm/pwm-airoha.c

   231	
   232	static void airoha_pwm_config_waveform(struct airoha_pwm *pc, int index,
   233					       u32 duty, u32 period)
   234	{
   235		u32 mask, val;
   236	
   237		/* Configure frequency divisor */
   238		mask = WAVE_GEN_CYCLE_MASK(index % 4);
 > 239		val = (period << __bf_shf(mask)) & mask;
   240		airoha_pwm_cycle_rmw(pc, REG_CYCLE_CFG_VALUE(index / 4), mask, val);
   241	
   242		/* Configure duty cycle */
   243		duty = ((DUTY_FULL - duty) << 8) | duty;
   244		mask = GPIO_FLASH_PRD_MASK(index % 2);
   245		val = (duty << __bf_shf(mask)) & mask;
   246		airoha_pwm_flash_rmw(pc, REG_GPIO_FLASH_PRD_SET(index / 2), mask, val);
   247	}
   248	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
