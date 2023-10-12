Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBF2062F
	for <oe-kbuild-all@lists.linux.dev>; Thu, 12 Oct 2023 01:16:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TOdpqeM4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697073418; x=1728609418;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=/D7M6qigE7BuW+ny2OBMZfCWgUKqA2z5eUzLIuV2sXc=;
  b=TOdpqeM4MtkprliF7wl1IiG4DLWXgvBLt7Ya9jYq2L9z4Mt9cMJfio+p
   PfQp/aYjjzypojvIwf7kvzvJiuNrVTF4z97U7UUPY2T857k4EnN+0XS1Z
   oIYOW+0INrlHUmx5dyt4g+8+uaDpEG+RTx/ZDOp9AmlxiuNq2HtEJMjK+
   143xbxrm2UIYpD33AQ7FCaIYLgC1r5xsDyKH+eiQG65Q9IezvOQDkLmy0
   xrnU/1iK2uxwxm1dn3X9omrzODrL68QZt/b+G3PdSoUks00uc7WjLxrP5
   aXZ37RobT0tMMAlFZW7IWrmnHZj3IMZbwzvh/Ed9CJ6oVjM/roEGwWbr0
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10860"; a="382051273"
X-IronPort-AV: E=Sophos;i="6.03,217,1694761200"; 
   d="scan'208";a="382051273"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Oct 2023 18:16:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10860"; a="1001348401"
X-IronPort-AV: E=Sophos;i="6.03,217,1694761200"; 
   d="scan'208";a="1001348401"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by fmsmga006.fm.intel.com with ESMTP; 11 Oct 2023 18:16:55 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qqkJp-0002wz-2F;
	Thu, 12 Oct 2023 01:16:53 +0000
Date: Thu, 12 Oct 2023 09:15:57 +0800
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
Message-ID: <202310120938.yY6jJXJE-lkp@intel.com>
References: <20231011121703.363652-5-amadeuszx.slawinski@linux.intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
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
config: x86_64-randconfig-002-20231011 (https://download.01.org/0day-ci/archive/20231012/202310120938.yY6jJXJE-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231012/202310120938.yY6jJXJE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310120938.yY6jJXJE-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: sound/soc/intel/avs/boards/i2s_test.o: in function `avs_mach_singular_ssp':
>> sound/soc/intel/avs/boards/../utils.h:16: multiple definition of `avs_mach_singular_ssp'; sound/soc/intel/avs/topology.o:sound/soc/intel/avs/utils.h:16: first defined here
   ld: sound/soc/intel/avs/boards/i2s_test.o: in function `avs_mach_ssp_port':
>> sound/soc/intel/avs/boards/../utils.h:21: multiple definition of `avs_mach_ssp_port'; sound/soc/intel/avs/topology.o:sound/soc/intel/avs/utils.h:21: first defined here
   ld: sound/soc/intel/avs/boards/i2s_test.o: in function `avs_mach_singular_tdm':
>> sound/soc/intel/avs/boards/../utils.h:26: multiple definition of `avs_mach_singular_tdm'; sound/soc/intel/avs/topology.o:sound/soc/intel/avs/utils.h:26: first defined here
   ld: sound/soc/intel/avs/boards/i2s_test.o: in function `avs_mach_ssp_tdm':
>> sound/soc/intel/avs/boards/../utils.h:33: multiple definition of `avs_mach_ssp_tdm'; sound/soc/intel/avs/topology.o:sound/soc/intel/avs/utils.h:33: first defined here
   ld: sound/soc/intel/avs/boards/i2s_test.o: in function `avs_mach_get_ssp_tdm':
>> sound/soc/intel/avs/boards/../utils.h:40: multiple definition of `avs_mach_get_ssp_tdm'; sound/soc/intel/avs/topology.o:sound/soc/intel/avs/utils.h:40: first defined here


vim +16 sound/soc/intel/avs/boards/../utils.h

4251ca5fe7340a Amadeusz Sławiński 2023-10-11  13  
4251ca5fe7340a Amadeusz Sławiński 2023-10-11  14  inline bool avs_mach_singular_ssp(struct snd_soc_acpi_mach *mach)
4251ca5fe7340a Amadeusz Sławiński 2023-10-11  15  {
4251ca5fe7340a Amadeusz Sławiński 2023-10-11 @16  	return hweight_long(mach->mach_params.i2s_link_mask) == 1;
4251ca5fe7340a Amadeusz Sławiński 2023-10-11  17  }
4251ca5fe7340a Amadeusz Sławiński 2023-10-11  18  
4251ca5fe7340a Amadeusz Sławiński 2023-10-11  19  inline u32 avs_mach_ssp_port(struct snd_soc_acpi_mach *mach)
4251ca5fe7340a Amadeusz Sławiński 2023-10-11  20  {
4251ca5fe7340a Amadeusz Sławiński 2023-10-11 @21  	return __ffs(mach->mach_params.i2s_link_mask);
4251ca5fe7340a Amadeusz Sławiński 2023-10-11  22  }
4251ca5fe7340a Amadeusz Sławiński 2023-10-11  23  
4251ca5fe7340a Amadeusz Sławiński 2023-10-11  24  inline bool avs_mach_singular_tdm(struct snd_soc_acpi_mach *mach, u32 port)
4251ca5fe7340a Amadeusz Sławiński 2023-10-11  25  {
4251ca5fe7340a Amadeusz Sławiński 2023-10-11 @26  	unsigned long *tdms = mach->pdata;
4251ca5fe7340a Amadeusz Sławiński 2023-10-11  27  
4251ca5fe7340a Amadeusz Sławiński 2023-10-11  28  	return !tdms || (hweight_long(tdms[port]) == 1);
4251ca5fe7340a Amadeusz Sławiński 2023-10-11  29  }
4251ca5fe7340a Amadeusz Sławiński 2023-10-11  30  
4251ca5fe7340a Amadeusz Sławiński 2023-10-11  31  inline u32 avs_mach_ssp_tdm(struct snd_soc_acpi_mach *mach, u32 port)
4251ca5fe7340a Amadeusz Sławiński 2023-10-11  32  {
4251ca5fe7340a Amadeusz Sławiński 2023-10-11 @33  	unsigned long *tdms = mach->pdata;
4251ca5fe7340a Amadeusz Sławiński 2023-10-11  34  
4251ca5fe7340a Amadeusz Sławiński 2023-10-11  35  	return tdms ? __ffs(tdms[port]) : 0;
4251ca5fe7340a Amadeusz Sławiński 2023-10-11  36  }
4251ca5fe7340a Amadeusz Sławiński 2023-10-11  37  
4251ca5fe7340a Amadeusz Sławiński 2023-10-11  38  inline int avs_mach_get_ssp_tdm(struct device *dev, struct snd_soc_acpi_mach *mach,
4251ca5fe7340a Amadeusz Sławiński 2023-10-11  39  				int *ssp_port, int *tdm_slot)
4251ca5fe7340a Amadeusz Sławiński 2023-10-11 @40  {
4251ca5fe7340a Amadeusz Sławiński 2023-10-11  41  	int port;
4251ca5fe7340a Amadeusz Sławiński 2023-10-11  42  
4251ca5fe7340a Amadeusz Sławiński 2023-10-11  43  	if (!avs_mach_singular_ssp(mach)) {
4251ca5fe7340a Amadeusz Sławiński 2023-10-11  44  		dev_err(dev, "Invalid SSP configuration\n");
4251ca5fe7340a Amadeusz Sławiński 2023-10-11  45  		return -EINVAL;
4251ca5fe7340a Amadeusz Sławiński 2023-10-11  46  	}
4251ca5fe7340a Amadeusz Sławiński 2023-10-11  47  	port = avs_mach_ssp_port(mach);
4251ca5fe7340a Amadeusz Sławiński 2023-10-11  48  
4251ca5fe7340a Amadeusz Sławiński 2023-10-11  49  	if (!avs_mach_singular_tdm(mach, port)) {
4251ca5fe7340a Amadeusz Sławiński 2023-10-11  50  		dev_err(dev, "Invalid TDM configuration\n");
4251ca5fe7340a Amadeusz Sławiński 2023-10-11  51  		return -EINVAL;
4251ca5fe7340a Amadeusz Sławiński 2023-10-11  52  	}
4251ca5fe7340a Amadeusz Sławiński 2023-10-11  53  	*ssp_port = port;
4251ca5fe7340a Amadeusz Sławiński 2023-10-11  54  	*tdm_slot = avs_mach_ssp_tdm(mach, *ssp_port);
4251ca5fe7340a Amadeusz Sławiński 2023-10-11  55  
4251ca5fe7340a Amadeusz Sławiński 2023-10-11  56  	return 0;
4251ca5fe7340a Amadeusz Sławiński 2023-10-11  57  }
4251ca5fe7340a Amadeusz Sławiński 2023-10-11  58  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
