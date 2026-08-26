Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B793C388878
	for <oe-kbuild-all@lists.linux.dev>; Wed, 26 Aug 2026 10:20:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787739633; cv=none; b=vFb514saREfiB6IzHNtz72Ul1vCT5HKLT6+udMwSiiBo7uDs0Mja6wMD4ywNqC8w8eZOaYjfl2+3GnSP7CTI5cKxGQPrHdsslO/ZfSwOKxudLW8rc8NGTWiqnxDWRsn0DmyLUN+MeVjXGzh7+tN0WLuQ583DXvJVZgKmtzGt5Ic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787739633; c=relaxed/simple;
	bh=jWOooM6ZXkTBlxk4xSlzt/S+HrHyfeLr6LplsSBUfDE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=QTcO1WXpgtYXXBf3mZKObUvckxyn2r4ckCnlfopfIaCSJiOsY9q1AHpUNneG5yDhcvKBMTX6L0W53e5aPzWM4/broi/UlgZSUgrCp4LbYSZVLQJ3V+LB78AsGvyP8E3pW1xb5LDwbyoswwCxU08LsWgH8f36N4rPvbVmioCDaEU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DqwsQ8I5; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DqwsQ8I5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787739632; x=1819275632;
  h=date:from:to:cc:subject:message-id;
  bh=jWOooM6ZXkTBlxk4xSlzt/S+HrHyfeLr6LplsSBUfDE=;
  b=DqwsQ8I5el9MIZlbNUNhSECBUYeuAXI79Lmz+otJoOrH+FeCSHjXf7or
   z7b/8medakgQFNmKx0G+dqqRVr9DMKka3QtTqv6KOymBzYPChV0IlRpq7
   EMmd1lrW1K7Az3F9xZLvjWHbzzt4yr/9JIzQSvH1OH3VbDyERGtIGG1q1
   BkQcxTZMMJv5hP4CGJNImLl4FFyDQ7GfXo9JByCKNuMUbd9vLAWdeRlWO
   0DTfdA5aiZiV7FDTTsODLHjZ4PCiqnb393Z1x/ZITEPUZsGllQn85N3xE
   znbPY95iBKUErHnKRNfVcPeNGnrdMOXaBBxN3WHJBwgZOVy5xwX5iPkJA
   A==;
X-CSE-ConnectionGUID: M5NuJOvrTdOkCM7KAiNLtQ==
X-CSE-MsgGUID: tSydGaFbRl6/KLXz2IkT1w==
X-IronPort-AV: E=McAfee;i="6800,10657,11886"; a="88137948"
X-IronPort-AV: E=Sophos;i="6.25,244,1779174000"; 
   d="scan'208";a="88137948"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Aug 2026 03:20:32 -0700
X-CSE-ConnectionGUID: 3aTUcLbMQ6aa9azD28Wokg==
X-CSE-MsgGUID: jiDzIgRCSGmTBa4jYMg20A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,244,1779174000"; 
   d="scan'208";a="266963520"
Received: from lkp-server01.sh.intel.com (HELO 3532383e6126) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 26 Aug 2026 03:20:30 -0700
Received: from kbuild by 3532383e6126 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wzAk7-000000007HI-0vGJ;
	Wed, 26 Aug 2026 10:20:27 +0000
Date: Wed, 26 Aug 2026 18:20:05 +0800
From: kernel test robot <lkp@intel.com>
To: Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Mark Brown <broonie@kernel.org>,
 "Pierre-Louis Bossart" <pierre-louis.bossart@linux.dev>
Subject: sound/soc/codecs/rt766-sdca.c:198:undefined reference to
 `hid_destroy_device'
Message-ID: <202608261835.9g4HFbr8-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   66498c75b4f8017f62d720d9b59675bdf3abce91
commit: c03f0b9a7d9966b1846f561e4f49ed481c524a0a ASoC: SDCA: Move HID registration to IRQ time
date:   3 weeks ago
config: x86_64-buildonly-randconfig-004-20260825 (https://download.01.org/0day-ci/archive/20260826/202608261835.9g4HFbr8-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260826/202608261835.9g4HFbr8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: c03f0b9a7d99 ("ASoC: SDCA: Move HID registration to IRQ time")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608261835.9g4HFbr8-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: vmlinux.o: in function `rt766_sdca_destroy_hid_device':
>> sound/soc/codecs/rt766-sdca.c:198:(.text+0x1b37dcf): undefined reference to `hid_destroy_device'
   ld: vmlinux.o: in function `rt766_sdca_btn_detect':
   sound/soc/codecs/rt766-sdca.c:89:(.text+0x1b39eba): undefined reference to `hid_input_report'
   ld: vmlinux.o: in function `sdwhid_parse':
   sound/soc/sdca/sdca_hid.c:38:(.text+0x1ccf68d): undefined reference to `hid_parse_report'
   ld: vmlinux.o: in function `sdca_add_hid_device':
   sound/soc/sdca/sdca_hid.c:97:(.text+0x1ccf6ff): undefined reference to `hid_allocate_device'
   ld: sound/soc/sdca/sdca_hid.c:113:(.text+0x1ccf813): undefined reference to `hid_add_device'
   ld: sound/soc/sdca/sdca_hid.c:116:(.text+0x1ccf844): undefined reference to `hid_destroy_device'
   ld: vmlinux.o: in function `sdca_hid_process_report':
   sound/soc/sdca/sdca_hid.c:159:(.text+0x1ccfa52): undefined reference to `hid_input_report'

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for SND_SOC_SDCA_HID
   Depends on [n]: SOUND [=y] && SND [=y] && SND_SOC [=y] && SND_SOC_SDCA [=y] && (HID [=n]=y [=y] || HID [=n]=SND_SOC_SDCA [=y])
   Selected by [y]:
   - SND_SOC_RT766_SDCA_SDW [=y] && SOUND [=y] && SND [=y] && SND_SOC [=y] && SOUNDWIRE [=y] && SND_SOC_SDCA [=y]


vim +198 sound/soc/codecs/rt766-sdca.c

   193	
   194	static void rt766_sdca_destroy_hid_device(struct sdca_interrupt *interrupt)
   195	{
   196		struct rt766_sdca_priv *rt766 = interrupt->priv;
   197	
 > 198		hid_destroy_device(rt766->hid);
   199	}
   200	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
