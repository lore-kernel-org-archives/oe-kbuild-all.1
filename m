Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 195FF62A
	for <oe-kbuild-all@lists.linux.dev>; Thu, 12 Oct 2023 00:36:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fKzKhceu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697071009; x=1728607009;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=RdfDVk4Tn/AgFKhnuaA2gNy0l6cyNbUefJRkhBP6c/w=;
  b=fKzKhceupGj5lEmX7Wj5OmeyCkSOtVYdcXiS/aZlVU/IngRBIcHJkrNt
   Q+/Ynb9N0pKOmIKw1bu583EKQPRIwtjTI+e/KttXT98MuGN/MWXME0/f1
   gIFqmrXG46MJCE5xJ9P2OCxV2pXXHYs7Q8+R/I33t7z6iV79HiW/0KGMC
   wbke+yRqsXOPj6pACR9lZXfTciXd8uMFPc4HYWpW4pEgB/SdKyDFmrKT1
   kVKOynG+rt4Xm3Tc6C3tMZK2oTroXN0eWb0D1n4YpIHx9ee7T4GJaHBnz
   lbgSCM7z3j+cZkLZyvsL03zyhIPvU7GDjIAsb6w+bLnrWJR8DHlansdV1
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10860"; a="384657056"
X-IronPort-AV: E=Sophos;i="6.03,217,1694761200"; 
   d="scan'208";a="384657056"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Oct 2023 17:36:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10860"; a="897869939"
X-IronPort-AV: E=Sophos;i="6.03,217,1694761200"; 
   d="scan'208";a="897869939"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by fmsmga001.fm.intel.com with ESMTP; 11 Oct 2023 17:34:59 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qqjgy-0002uH-0P;
	Thu, 12 Oct 2023 00:36:44 +0000
Date: Thu, 12 Oct 2023 08:35:45 +0800
From: kernel test robot <lkp@intel.com>
To: Amadeusz =?utf-8?B?U8WCYXdpxYRza2k=?= <amadeuszx.slawinski@linux.intel.com>,
	Mark Brown <broonie@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Cezary Rojewski <cezary.rojewski@intel.com>,
	Takashi Iwai <tiwai@suse.com>, Jaroslav Kysela <perex@perex.cz>,
	alsa-devel@alsa-project.org,
	Amadeusz =?utf-8?B?U8WCYXdpxYRza2k=?= <amadeuszx.slawinski@linux.intel.com>
Subject: Re: [PATCH 04/16] ASoC: Intel: avs: i2s_test: Validate machine board
 configuration
Message-ID: <202310120853.cfVtZkHx-lkp@intel.com>
References: <20231011121703.363652-5-amadeuszx.slawinski@linux.intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231011121703.363652-5-amadeuszx.slawinski@linux.intel.com>

Hi Amadeusz,

kernel test robot noticed the following build errors:

[auto build test ERROR on broonie-sound/for-next]
[also build test ERROR on next-20231011]
[cannot apply to tiwai-sound/for-next tiwai-sound/for-linus linus/master v6.6-rc5]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Amadeusz-S-awi-ski/ASoC-Intel-avs-Only-create-SSP-d-snd_soc_dai_driver-when-requested/20231011-202503
base:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next
patch link:    https://lore.kernel.org/r/20231011121703.363652-5-amadeuszx.slawinski%40linux.intel.com
patch subject: [PATCH 04/16] ASoC: Intel: avs: i2s_test: Validate machine board configuration
config: powerpc-randconfig-003-20231012 (https://download.01.org/0day-ci/archive/20231012/202310120853.cfVtZkHx-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231012/202310120853.cfVtZkHx-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310120853.cfVtZkHx-lkp@intel.com/

All errors (new ones prefixed by >>):

   powerpc-linux-ld: sound/soc/intel/avs/boards/i2s_test.o: in function `avs_mach_singular_ssp':
>> i2s_test.c:(.text+0x0): multiple definition of `avs_mach_singular_ssp'; sound/soc/intel/avs/topology.o:topology.c:(.text+0x1e80): first defined here
   powerpc-linux-ld: sound/soc/intel/avs/boards/i2s_test.o: in function `avs_mach_ssp_port':
>> i2s_test.c:(.text+0x44): multiple definition of `avs_mach_ssp_port'; sound/soc/intel/avs/topology.o:topology.c:(.text+0x1ec4): first defined here
   powerpc-linux-ld: sound/soc/intel/avs/boards/i2s_test.o: in function `avs_mach_singular_tdm':
>> i2s_test.c:(.text+0x88): multiple definition of `avs_mach_singular_tdm'; sound/soc/intel/avs/topology.o:topology.c:(.text+0x1f08): first defined here
   powerpc-linux-ld: sound/soc/intel/avs/boards/i2s_test.o: in function `avs_mach_ssp_tdm':
>> i2s_test.c:(.text+0x8c8): multiple definition of `avs_mach_ssp_tdm'; sound/soc/intel/avs/topology.o:topology.c:(.text+0x3214): first defined here
   powerpc-linux-ld: sound/soc/intel/avs/boards/i2s_test.o: in function `avs_mach_get_ssp_tdm':
>> i2s_test.c:(.text+0x938): multiple definition of `avs_mach_get_ssp_tdm'; sound/soc/intel/avs/topology.o:topology.c:(.text+0x3284): first defined here

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
