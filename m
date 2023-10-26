Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10BD3C154
	for <oe-kbuild-all@lists.linux.dev>; Thu, 26 Oct 2023 11:21:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XgUWqnlN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698319279; x=1729855279;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ltgJQo3IM9BGgWG0gkp24A4R2tMuRS7NGjjpSTDkf7c=;
  b=XgUWqnlNg21aG2dOgzRTQ1Di61jgKD0+NBQmOunEbcTpR/WG0jZo8OCa
   YjLs9hP4tn+0jML+2LGcOGHkl533Z1G2eQR3nhsCl8CaIPpQ4yshTO1C3
   T2p3ee+atiMz9+U217sBqg3ou2LcX/naWnID4L8lG8/DCTnYbv2MR/+G+
   fjIpyV/RCuwFGSFzSu7Mq5ezUcTmuf+eOVY9oiMKLUZxAaIucdfP7UvSE
   QPy94JcU2f72AoR8Ki0EUUCUnSGTZM6/q8AWBfyta007tf4jPMjU4zgVy
   iIrY5uGX2tO4e2zOzdZGW7lCdOb2hmo2EhBie3txregEFhjSjfwl8IDLc
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10874"; a="328691"
X-IronPort-AV: E=Sophos;i="6.03,253,1694761200"; 
   d="scan'208";a="328691"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Oct 2023 04:21:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10874"; a="752681827"
X-IronPort-AV: E=Sophos;i="6.03,253,1694761200"; 
   d="scan'208";a="752681827"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 26 Oct 2023 04:21:17 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qvyQM-0009jP-38;
	Thu, 26 Oct 2023 11:21:14 +0000
Date: Thu, 26 Oct 2023 19:20:22 +0800
From: kernel test robot <lkp@intel.com>
To: Syed Saba Kareem <Syed.SabaKareem@amd.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH 06/13] ASoC: amd: acp: add code for scanning acp pdm
 controller
Message-ID: <202310261956.bqMH442p-lkp@intel.com>
References: <20231021145110.478744-6-Syed.SabaKareem@amd.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231021145110.478744-6-Syed.SabaKareem@amd.com>

Hi Syed,

kernel test robot noticed the following build errors:

[auto build test ERROR on broonie-sound/for-next]
[also build test ERROR on linus/master v6.6-rc7 next-20231026]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Syed-Saba-Kareem/ASoC-amd-acp-refactor-acp-i2s-clock-generation-code/20231021-225635
base:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next
patch link:    https://lore.kernel.org/r/20231021145110.478744-6-Syed.SabaKareem%40amd.com
patch subject: [PATCH 06/13] ASoC: amd: acp: add code for scanning acp pdm controller
config: i386-buildonly-randconfig-002-20231026 (https://download.01.org/0day-ci/archive/20231026/202310261956.bqMH442p-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231026/202310261956.bqMH442p-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310261956.bqMH442p-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   sound/soc/amd/acp/acp-legacy-common.c: In function 'check_acp_pdm':
>> sound/soc/amd/acp/acp-legacy-common.c:392:12: error: implicit declaration of function 'acpi_find_child_device'; did you mean 'acpi_match_device'? [-Werror=implicit-function-declaration]
     pdm_dev = acpi_find_child_device(ACPI_COMPANION(&pci->dev), pdm_addr, 0);
               ^~~~~~~~~~~~~~~~~~~~~~
               acpi_match_device
>> sound/soc/amd/acp/acp-legacy-common.c:392:10: warning: assignment makes pointer from integer without a cast [-Wint-conversion]
     pdm_dev = acpi_find_child_device(ACPI_COMPANION(&pci->dev), pdm_addr, 0);
             ^
   cc1: some warnings being treated as errors


vim +392 sound/soc/amd/acp/acp-legacy-common.c

   354	
   355	int check_acp_pdm(struct pci_dev *pci, struct acp_chip_info *chip)
   356	{
   357		struct acpi_device *pdm_dev;
   358		const union acpi_object *obj;
   359		u32 pdm_addr, val;
   360	
   361		val = readl(chip->base + ACP_PIN_CONFIG);
   362		switch (val) {
   363		case ACP_CONFIG_4:
   364		case ACP_CONFIG_5:
   365		case ACP_CONFIG_6:
   366		case ACP_CONFIG_7:
   367		case ACP_CONFIG_8:
   368		case ACP_CONFIG_10:
   369		case ACP_CONFIG_11:
   370		case ACP_CONFIG_12:
   371		case ACP_CONFIG_13:
   372		case ACP_CONFIG_14:
   373			break;
   374		default:
   375			return -EINVAL;
   376		}
   377	
   378		switch (chip->acp_rev) {
   379		case ACP3X_DEV:
   380			pdm_addr = ACP_RENOIR_PDM_ADDR;
   381			break;
   382		case ACP6X_DEV:
   383			pdm_addr = ACP_REMBRANDT_PDM_ADDR;
   384			break;
   385		case ACP63_DEV:
   386			pdm_addr = ACP63_PDM_ADDR;
   387			break;
   388		default:
   389			return -EINVAL;
   390		}
   391	
 > 392		pdm_dev = acpi_find_child_device(ACPI_COMPANION(&pci->dev), pdm_addr, 0);
   393		if (pdm_dev) {
   394			if (!acpi_dev_get_property(pdm_dev, "acp-audio-device-type",
   395						   ACPI_TYPE_INTEGER, &obj) &&
   396						   obj->integer.value == pdm_addr)
   397				return 0;
   398		}
   399		return -ENODEV;
   400	}
   401	EXPORT_SYMBOL_NS_GPL(check_acp_pdm, SND_SOC_ACP_COMMON);
   402	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
