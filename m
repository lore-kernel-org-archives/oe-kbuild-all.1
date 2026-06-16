Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 685EB472798
	for <oe-kbuild-all@lists.linux.dev>; Tue, 16 Jun 2026 18:27:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781634425; cv=none; b=DaoarHbd2pYdLmDKBXJGVL5M407dUlGPrFpIA3SoFL2Or36xKAJ3tDwRaaiwlRcYRuzLe+wRmzmWdNdYHo/atNRo66cM/e2UemWD0COYaKJRksqJgA2R5RLaCmCGBq6xrJqIU4o6I6oUvJf+y67EitYreLnIpH6/KewTQoZqzQA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781634425; c=relaxed/simple;
	bh=uPuX9KN9fuxB0wiQDkVbaiUOIb5HdlPcOhMZUcM8FzQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=lcyUb2dU4aqEfhBkwarLWFMZfQEEtKwIRx1d8BvRTA6rTJlFnb6Y9Ms0/E0+wGywgWFkALQ0yn+8Zj2gyNgII/cBmhlRM/g5jzygmNEM9RaK6HFrS8/bPO37wusMW9OLPl6VziXatIx2ipG3BajHuZD4CuFHW5qEwixGSBqjXdI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=W0nq3UcB; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="W0nq3UcB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781634423; x=1813170423;
  h=date:from:to:cc:subject:message-id;
  bh=uPuX9KN9fuxB0wiQDkVbaiUOIb5HdlPcOhMZUcM8FzQ=;
  b=W0nq3UcB08y8vJ62RcZMVVNXvWJBsmhagssKu54NT3ywi4V6gGF9qv3M
   dstlnXRgD9TeR02UUvwER3PpoG2DX94eFN+qdhp5HNPCPMH7Fep+q1pjc
   5dH4aKzrn7/aor+EKBCWQ3K8lhupNBhynFfRwjpqjZeASW2cVbJG7umb/
   fMXo5ARnaaOYlektHvApXm4a1r2KQJ+5wIcNw+ITVttcQ6++KOfxg9pVQ
   miIp3wsM7JO99amQ3ECuFPQmtW/tdMNUMlUXPMxKx1xLLsj6YpPlzOyBB
   bXHLELuB6CWPkRrzprB8d2RYHUJRugA8zOutqh+oltl63st3q/LkvIB1K
   w==;
X-CSE-ConnectionGUID: FDEbyRihTASAkwWH8Gy6Jg==
X-CSE-MsgGUID: iw8PLcJ2SSWlbIW8qbObWg==
X-IronPort-AV: E=McAfee;i="6800,10657,11819"; a="82425024"
X-IronPort-AV: E=Sophos;i="6.24,208,1774335600"; 
   d="scan'208";a="82425024"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jun 2026 11:27:03 -0700
X-CSE-ConnectionGUID: pJ1UO0bESmKopfqCMplsJw==
X-CSE-MsgGUID: HEWI16d8Qwu09d3KrDHM4g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,208,1774335600"; 
   d="scan'208";a="252810655"
Received: from igk-lkp-server01.igk.intel.com (HELO 892db79562d4) ([10.211.93.152])
  by orviesa005.jf.intel.com with ESMTP; 16 Jun 2026 11:27:02 -0700
Received: from kbuild by 892db79562d4 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wZYV1-000000005AL-2NfG;
	Tue, 16 Jun 2026 18:26:59 +0000
Date: Tue, 16 Jun 2026 20:25:59 +0200
From: kernel test robot <lkp@intel.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [morimoto:sound-cleanup-2026-06-16 325/326]
 sound/soc/codecs/cs35l56-test.c:84:9: error: implicit declaration of function
 'snd_soc_card_set_pci_ssid'; did you mean 'snd_soc_card_driver_set_pci_ssid'?
Message-ID: <202606162000.12RPwBad-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/morimoto/linux sound-cleanup-2026-06-16
head:   5ce50ac7d0a59c6fb15e1baa7e6824ac096fe092
commit: bcca3afbe4030eb595d239674303afc5fd051920 [325/326] ASoC: soc-card.h: remove compatible definition
config: x86_64-rhel-9.4-kunit (https://download.01.org/0day-ci/archive/20260616/202606162000.12RPwBad-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260616/202606162000.12RPwBad-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606162000.12RPwBad-lkp@intel.com/

All errors (new ones prefixed by >>):

   sound/soc/codecs/cs35l56-test.c: In function 'cs35l56_test_system_name_from_ssid':
>> sound/soc/codecs/cs35l56-test.c:84:9: error: implicit declaration of function 'snd_soc_card_set_pci_ssid'; did you mean 'snd_soc_card_driver_set_pci_ssid'? [-Wimplicit-function-declaration]
      84 |         snd_soc_card_set_pci_ssid(card, 0x12b4, 0xa7c8);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~
         |         snd_soc_card_driver_set_pci_ssid
   sound/soc/codecs/cs35l56-test.c: In function 'cs35l56_test_case_init_common':
   sound/soc/codecs/cs35l56-test.c:558:30: error: implicit declaration of function 'snd_soc_component_alloc'; did you mean 'snd_soc_component_close'? [-Wimplicit-function-declaration]
     558 |         cs35l56->component = snd_soc_component_alloc(cs35l56->base.dev, &component_driver,
         |                              ^~~~~~~~~~~~~~~~~~~~~~~
         |                              snd_soc_component_close
   sound/soc/codecs/cs35l56-test.c:558:28: error: assignment to 'struct snd_soc_component *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     558 |         cs35l56->component = snd_soc_component_alloc(cs35l56->base.dev, &component_driver,
         |                            ^


vim +84 sound/soc/codecs/cs35l56-test.c

d0ab89951197f0 Richard Fitzgerald 2026-01-21  76  
bae6668c526018 Richard Fitzgerald 2026-03-04  77  static void cs35l56_test_system_name_from_ssid(struct kunit *test)
bae6668c526018 Richard Fitzgerald 2026-03-04  78  {
bae6668c526018 Richard Fitzgerald 2026-03-04  79  	struct cs35l56_test_priv *priv = test->priv;
bae6668c526018 Richard Fitzgerald 2026-03-04  80  	struct cs35l56_private *cs35l56 = priv->cs35l56_priv;
4bbdf4f7c93787 Kuninori Morimoto  2026-06-11  81  	struct snd_soc_card *card = cs35l56->card;
bae6668c526018 Richard Fitzgerald 2026-03-04  82  
bae6668c526018 Richard Fitzgerald 2026-03-04  83  	cs35l56->speaker_id = -1;
4bbdf4f7c93787 Kuninori Morimoto  2026-06-11 @84  	snd_soc_card_set_pci_ssid(card, 0x12b4, 0xa7c8);
bae6668c526018 Richard Fitzgerald 2026-03-04  85  
bae6668c526018 Richard Fitzgerald 2026-03-04  86  	KUNIT_EXPECT_EQ(test, cs35l56_get_firmware_uid(cs35l56), 0);
bae6668c526018 Richard Fitzgerald 2026-03-04  87  	KUNIT_EXPECT_EQ(test, cs35l56_set_fw_name(cs35l56->component), 0);
bae6668c526018 Richard Fitzgerald 2026-03-04  88  	KUNIT_EXPECT_STREQ(test, cs35l56->dsp.system_name, "12b4a7c8");
bae6668c526018 Richard Fitzgerald 2026-03-04  89  }
bae6668c526018 Richard Fitzgerald 2026-03-04  90  

:::::: The code at line 84 was first introduced by commit
:::::: 4bbdf4f7c937878b634b01d362515e2a79053b52 dai

:::::: TO: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
:::::: CC: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
