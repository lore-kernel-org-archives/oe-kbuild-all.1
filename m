Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37ACD54763
	for <oe-kbuild-all@lists.linux.dev>; Fri,  9 Jan 2026 00:47:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767919639; cv=none; b=mJI7+5aB5E40UYZJymhL5G/MMDgZZ36/cX4RtWV28AH5M14UdeEw+cdFYupU1FTe5t8lwg3/vLCMUeqn8gr0/hBkMEFUDBOxsfAb2QlaWyHJjl8OQgJrz9jzDy9CdtPr+AVroVv7E72yqnuAHbfW/4JgkuUDuTQotEdNIybk1wE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767919639; c=relaxed/simple;
	bh=uqUGBghIHhqzaGdbK4PHSAtMSM9NUH9rWW0msQG3xuk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=jGqQ7oRNYMpFilBiwfgAYvalL7+Zlz2332PgK6TRDBLR5Q42AhSAuWl/CPLHcxjkNvABVGigJGaglADjIGhVkP8At0Dm4Bvh/geb03bPC2WZhJoZbMh//J/ZZSFRubZvMgqrhnU5hyOG/tlW6DF8qXuXPxY5pNCxZiJrDEhLRSE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LCiNnvIB; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LCiNnvIB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767919637; x=1799455637;
  h=date:from:to:cc:subject:message-id;
  bh=uqUGBghIHhqzaGdbK4PHSAtMSM9NUH9rWW0msQG3xuk=;
  b=LCiNnvIB5AsQHbhnuLD/DMBH3FGWBtP5g9+3ugDm3/g/joGNdvxJEErK
   4U1GOr9aCUxbJED3tLRO+FRFFl2h3dZqWY+tUi5MJ5k3OlpP2v2Gz9NVg
   IV3ryYJImAzRkLn+bo3Wdab8cgRFVLejI5h3Qn1kYJUnhvf30S/gVOxiJ
   Z7q8XhI5TQ7vG66tIXOmrXF/iPN2vXUfHgwW3QsUhSLqawFEFS3qSz105
   1KZzJt5NPfnfCGBeaL/L03GRDQNW8KeHMSErKDRixWPkO3g4RwYEyQMRH
   XbuiGTK1j9yxJMYSkMaAco5D/g2AqFNq+W3F8TyRI7ezFeSgjGWYY6vcI
   w==;
X-CSE-ConnectionGUID: L7zl1tCzS/mbYcN7Sbx3tQ==
X-CSE-MsgGUID: n+GtZvAnRZKbv/rCOOnbZg==
X-IronPort-AV: E=McAfee;i="6800,10657,11665"; a="69379670"
X-IronPort-AV: E=Sophos;i="6.21,211,1763452800"; 
   d="scan'208";a="69379670"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jan 2026 16:47:17 -0800
X-CSE-ConnectionGUID: /VHU8f65RMO9KGYtZHXJ7A==
X-CSE-MsgGUID: XHaMAtH7Tuazvf7T22NZ6Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,211,1763452800"; 
   d="scan'208";a="203370798"
Received: from igk-lkp-server01.igk.intel.com (HELO 92b2e8bd97aa) ([10.211.93.152])
  by orviesa007.jf.intel.com with ESMTP; 08 Jan 2026 16:47:15 -0800
Received: from kbuild by 92b2e8bd97aa with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1ve0em-000000001u0-3HwO;
	Fri, 09 Jan 2026 00:47:12 +0000
Date: Fri, 09 Jan 2026 01:46:20 +0100
From: kernel test robot <lkp@intel.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [morimoto:sound-cleanup-2026-01-07 5/47]
 sound/soc/intel/boards/sof_ti_common.c:45:41: error: passing argument 1 of
 'snd_soc_dapm_new_controls' from incompatible pointer type
Message-ID: <202601090103.oPphL34g-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/morimoto/linux sound-cleanup-2026-01-07
head:   fe6b9a73807b5ac65643101c473a796bef5ac5ea
commit: 36f0af37bee6a0a0bf54dc55a4a01bb39992209b [5/47] ASoC: soc-dapm: add snd_soc_dapm_alloc()
config: x86_64-rhel-9.4-ltp (https://download.01.org/0day-ci/archive/20260109/202601090103.oPphL34g-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260109/202601090103.oPphL34g-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601090103.oPphL34g-lkp@intel.com/

All errors (new ones prefixed by >>):

   sound/soc/intel/boards/sof_ti_common.c: In function 'tas2563_init':
>> sound/soc/intel/boards/sof_ti_common.c:45:41: error: passing argument 1 of 'snd_soc_dapm_new_controls' from incompatible pointer type [-Wincompatible-pointer-types]
      45 |         ret = snd_soc_dapm_new_controls(&card->dapm, tas2563_spk_dapm_widgets,
         |                                         ^~~~~~~~~~~
         |                                         |
         |                                         struct snd_soc_dapm_context **
   In file included from include/sound/soc.h:421,
                    from sound/soc/intel/boards/sof_ti_common.c:8:
   include/sound/soc-dapm.h:648:60: note: expected 'struct snd_soc_dapm_context *' but argument is of type 'struct snd_soc_dapm_context **'
     648 | int snd_soc_dapm_new_controls(struct snd_soc_dapm_context *dapm,
         |                               ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~
>> sound/soc/intel/boards/sof_ti_common.c:59:39: error: passing argument 1 of 'snd_soc_dapm_add_routes' from incompatible pointer type [-Wincompatible-pointer-types]
      59 |         ret = snd_soc_dapm_add_routes(&card->dapm, tas2563_spk_dapm_routes,
         |                                       ^~~~~~~~~~~
         |                                       |
         |                                       struct snd_soc_dapm_context **
   include/sound/soc-dapm.h:674:58: note: expected 'struct snd_soc_dapm_context *' but argument is of type 'struct snd_soc_dapm_context **'
     674 | int snd_soc_dapm_add_routes(struct snd_soc_dapm_context *dapm,
         |                             ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~


vim +/snd_soc_dapm_new_controls +45 sound/soc/intel/boards/sof_ti_common.c

331786db1b464f David Lin 2025-12-17  @8  #include <sound/soc.h>
331786db1b464f David Lin 2025-12-17   9  #include <sound/soc-acpi.h>
331786db1b464f David Lin 2025-12-17  10  #include <sound/soc-dai.h>
331786db1b464f David Lin 2025-12-17  11  #include <sound/soc-dapm.h>
331786db1b464f David Lin 2025-12-17  12  #include <sound/sof.h>
331786db1b464f David Lin 2025-12-17  13  #include <uapi/sound/asound.h>
331786db1b464f David Lin 2025-12-17  14  #include "../common/soc-intel-quirks.h"
331786db1b464f David Lin 2025-12-17  15  #include "sof_ti_common.h"
331786db1b464f David Lin 2025-12-17  16  
331786db1b464f David Lin 2025-12-17  17  /*
331786db1b464f David Lin 2025-12-17  18   * Texas Instruments TAS2563 just mount one device to manage multiple devices,
331786db1b464f David Lin 2025-12-17  19   * so the kcontrols, widgets and routes just keep one item, respectively.
331786db1b464f David Lin 2025-12-17  20   */
331786db1b464f David Lin 2025-12-17  21  static const struct snd_kcontrol_new tas2563_spk_kcontrols[] = {
331786db1b464f David Lin 2025-12-17  22  	SOC_DAPM_PIN_SWITCH("Spk"),
331786db1b464f David Lin 2025-12-17  23  };
331786db1b464f David Lin 2025-12-17  24  
331786db1b464f David Lin 2025-12-17  25  static const struct snd_soc_dapm_widget tas2563_spk_dapm_widgets[] = {
331786db1b464f David Lin 2025-12-17  26  	SND_SOC_DAPM_SPK("Spk", NULL),
331786db1b464f David Lin 2025-12-17  27  };
331786db1b464f David Lin 2025-12-17  28  
331786db1b464f David Lin 2025-12-17  29  static const struct snd_soc_dapm_route tas2563_spk_dapm_routes[] = {
331786db1b464f David Lin 2025-12-17  30  	{ "Spk", NULL, "OUT" },
331786db1b464f David Lin 2025-12-17  31  };
331786db1b464f David Lin 2025-12-17  32  
331786db1b464f David Lin 2025-12-17  33  static struct snd_soc_dai_link_component tas2563_dai_link_components[] = {
331786db1b464f David Lin 2025-12-17  34  	{
331786db1b464f David Lin 2025-12-17  35  		.name = TAS2563_DEV0_NAME,
331786db1b464f David Lin 2025-12-17  36  		.dai_name = TAS2563_CODEC_DAI,
331786db1b464f David Lin 2025-12-17  37  	},
331786db1b464f David Lin 2025-12-17  38  };
331786db1b464f David Lin 2025-12-17  39  
331786db1b464f David Lin 2025-12-17  40  static int tas2563_init(struct snd_soc_pcm_runtime *rtd)
331786db1b464f David Lin 2025-12-17  41  {
331786db1b464f David Lin 2025-12-17  42  	struct snd_soc_card *card = rtd->card;
331786db1b464f David Lin 2025-12-17  43  	int ret;
331786db1b464f David Lin 2025-12-17  44  
331786db1b464f David Lin 2025-12-17 @45  	ret = snd_soc_dapm_new_controls(&card->dapm, tas2563_spk_dapm_widgets,
331786db1b464f David Lin 2025-12-17  46  					ARRAY_SIZE(tas2563_spk_dapm_widgets));
331786db1b464f David Lin 2025-12-17  47  	if (ret) {
331786db1b464f David Lin 2025-12-17  48  		dev_err(rtd->dev, "unable to add dapm widgets, ret %d\n", ret);
331786db1b464f David Lin 2025-12-17  49  		return ret;
331786db1b464f David Lin 2025-12-17  50  	}
331786db1b464f David Lin 2025-12-17  51  
331786db1b464f David Lin 2025-12-17  52  	ret = snd_soc_add_card_controls(card, tas2563_spk_kcontrols,
331786db1b464f David Lin 2025-12-17  53  					ARRAY_SIZE(tas2563_spk_kcontrols));
331786db1b464f David Lin 2025-12-17  54  	if (ret) {
331786db1b464f David Lin 2025-12-17  55  		dev_err(rtd->dev, "unable to add controls, ret %d\n", ret);
331786db1b464f David Lin 2025-12-17  56  		return ret;
331786db1b464f David Lin 2025-12-17  57  	}
331786db1b464f David Lin 2025-12-17  58  
331786db1b464f David Lin 2025-12-17 @59  	ret = snd_soc_dapm_add_routes(&card->dapm, tas2563_spk_dapm_routes,
331786db1b464f David Lin 2025-12-17  60  				      ARRAY_SIZE(tas2563_spk_dapm_routes));
331786db1b464f David Lin 2025-12-17  61  	if (ret)
331786db1b464f David Lin 2025-12-17  62  		dev_err(rtd->dev, "unable to add dapm routes, ret %d\n", ret);
331786db1b464f David Lin 2025-12-17  63  
331786db1b464f David Lin 2025-12-17  64  	return ret;
331786db1b464f David Lin 2025-12-17  65  }
331786db1b464f David Lin 2025-12-17  66  

:::::: The code at line 45 was first introduced by commit
:::::: 331786db1b464fae42c36f53d6901d1d54975e04 ASoC: Intel: ti-common: support tas2563 amplifier

:::::: TO: David Lin <david.lin@intel.com>
:::::: CC: Mark Brown <broonie@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
