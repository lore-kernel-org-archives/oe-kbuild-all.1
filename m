Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0946B2931C4
	for <oe-kbuild-all@lists.linux.dev>; Wed,  2 Sep 2026 04:03:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788321785; cv=none; b=pCBPzLYUeFbWu1fpxuShzX38jA0BOKv5qBn1D1/dCb9rqRja2vuZVY8IMdTzuDI8pbOo4/415APtXrR/752St/cLMKm85pfq84QnXpvnvIMAA1/7a25nl2/suYUlALX5eJ+8VtIeq/oftDfxskpg5jW8T2fchzRsv3WASZqb2JU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788321785; c=relaxed/simple;
	bh=rMc3ogunKEXuZdZ2MAw9RBiiyAp/rbYqIx5idEYtqEk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=tlfwCB/tOhYyP1H3ZCqJlIvXS76jy5cpUCk97M2C/o379o7JU72yACarD0Vmxmlj7gAt6SBwxmMJd11sk5WDG/krZDpWkoQh7akviVdk4XKLFqeBYMHUf2bCZuu+8xYp1unm9O/IM+66IbBQ7fbXr1+JbeUyV+JPOIBF7DcnJDo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GRGuFa5X; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GRGuFa5X"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788321784; x=1819857784;
  h=date:from:to:cc:subject:message-id;
  bh=rMc3ogunKEXuZdZ2MAw9RBiiyAp/rbYqIx5idEYtqEk=;
  b=GRGuFa5X176uMjUP34HYNtarf+8jmX2Mb/+TLvG+Bx9+pQtqeSK26OtI
   piD29A3xCF2VP0LxCa4IdG1aor9Gk/5qdVqEID4ALm1rbwMxPx+2OlXmy
   aPyE5xA4SJFKUlzNmm6yQ2qnr1K/niLkSGwinPhpkZbCF5BuZtNShxJWR
   NisTvLoija+zlR4Uy6J+Kjz8tfYDqegHKKy6yZR0MNLWTE3C7Jlk//Nxd
   0CLjJKk+FgxjiGcU4yRfZf9wo5xrk2oTQbQM7G/09Ir7swLdc++bbeK7p
   VqOWiqncI3eg5MsxqMUMqIU/ypYwoN9IWo2nA9QsLgA5TmHKrvFWe3ZOj
   g==;
X-CSE-ConnectionGUID: yNJTpbwzToGpUkxZ9gFOaQ==
X-CSE-MsgGUID: jPMCnyW9RF6ujRWou7/ddA==
X-IronPort-AV: E=McAfee;i="6800,10657,11893"; a="88646770"
X-IronPort-AV: E=Sophos;i="6.25,257,1779174000"; 
   d="scan'208";a="88646770"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Sep 2026 21:03:03 -0700
X-CSE-ConnectionGUID: //6mtXukSnSa4NWFJVM5Ig==
X-CSE-MsgGUID: guwNDY2ASpC+0+EJ4Wwr5g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,257,1779174000"; 
   d="scan'208";a="273477781"
Received: from lkp-server01.sh.intel.com (HELO bfac249b2189) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 01 Sep 2026 21:03:02 -0700
Received: from kbuild by bfac249b2189 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x1cBf-000000001v3-33i3;
	Wed, 02 Sep 2026 04:02:59 +0000
Date: Wed, 02 Sep 2026 12:02:46 +0800
From: kernel test robot <lkp@intel.com>
To: Neo Chang <YLCHANG2@nuvoton.com>
Cc: oe-kbuild-all@lists.linux.dev, Mark Brown <broonie@kernel.org>
Subject: [broonie-sound:for-next 20/61]
 sound/soc/codecs/nau8360-dsp.c:23:22: sparse: sparse: symbol
 'nau8360_dsp_addr' was not declared. Should it be static?
Message-ID: <202609021121.a4mHPAyZ-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next
head:   27a50351cbc82e9f0811df417c5e7d2a72f60ef5
commit: be88847a8bb1a14194cf50116f8909d127861318 [20/61] ASoC: codecs: nau8360: Add support for NAU83G60 amplifier
config: microblaze-randconfig-r133-20260902 (https://download.01.org/0day-ci/archive/20260902/202609021121.a4mHPAyZ-lkp@intel.com/config)
compiler: microblaze-linux-gcc (GCC) 16.1.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260902/202609021121.a4mHPAyZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609021121.a4mHPAyZ-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> sound/soc/codecs/nau8360-dsp.c:23:22: sparse: sparse: symbol 'nau8360_dsp_addr' was not declared. Should it be static?
--
>> sound/soc/codecs/nau8360.c:436:28: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned short [usertype] @@     got restricted __be16 [usertype] @@
   sound/soc/codecs/nau8360.c:436:28: sparse:     expected unsigned short [usertype]
   sound/soc/codecs/nau8360.c:436:28: sparse:     got restricted __be16 [usertype]

vim +/nau8360_dsp_addr +23 sound/soc/codecs/nau8360-dsp.c

    21	
    22	#define NAU8360_DSP_IDLE_RETRY 10
  > 23	const unsigned short nau8360_dsp_addr[NAU8360_DSP_FW_NUM] = {
    24		NAU8360_RF000_DSP_COMM, NAU8360_RF002_DSP_COMM };
    25	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
