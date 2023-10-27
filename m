Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 597068BEB
	for <oe-kbuild-all@lists.linux.dev>; Fri, 27 Oct 2023 05:12:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LiM5hKD/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698383538; x=1729919538;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=K3ZDZLgQ8G7OiYoVpGFv+zomiaCvB7SDsj3e5Gy6KfA=;
  b=LiM5hKD/zUUAefhSYjC5d6+Z6ntIqjEFsWQXNPS1O6KOE6tSc7AkREB4
   qS2bL6REOnLU9BfxOVCKXa7PubfGHVPiVc9VBRnjiVQyDPkiWcVM6dQdr
   qjGizLpEVeCWvB0gVqtQy1F+6lsrXvgeWPZax5I4MYBKKcUwmMLNBNTH5
   o0tOXsaN+LOfyeupO9aHfPGVFf3dtu/GrX3V6r0tuU4BZ8/7Uv1ovRYpH
   49Z5znr18Z44Ccxob09DnCkXyw+/HF1tccI+yFQdJUX1x0KOc8LfLIRDF
   S1To1Nqx1Sx/ojdw6VjDFx+yPiam8my7/cCOQSmax5woqXtpy9SVAWD1j
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10875"; a="367054553"
X-IronPort-AV: E=Sophos;i="6.03,255,1694761200"; 
   d="scan'208";a="367054553"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Oct 2023 22:12:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10875"; a="794471850"
X-IronPort-AV: E=Sophos;i="6.03,255,1694761200"; 
   d="scan'208";a="794471850"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 26 Oct 2023 22:12:07 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qwF8f-000AV4-1p;
	Fri, 27 Oct 2023 05:12:05 +0000
Date: Fri, 27 Oct 2023 13:11:50 +0800
From: kernel test robot <lkp@intel.com>
To: Syed Saba Kareem <Syed.SabaKareem@amd.com>
Cc: oe-kbuild-all@lists.linux.dev, Mark Brown <broonie@kernel.org>
Subject: [broonie-sound:for-next 45/75]
 sound/soc/amd/acp/acp-legacy-common.c:392:17: warning: assignment to 'struct
 acpi_device *' from 'int' makes pointer from integer without a cast
Message-ID: <202310271326.7xKHbFDH-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next
head:   00236a89602f7b67016bd1d9bc63079f2c0f0a8d
commit: 3a94c8ad0aae2b14a55059869871ea2d199af489 [45/75] ASoC: amd: acp: add code for scanning acp pdm controller
config: i386-buildonly-randconfig-001-20231027 (https://download.01.org/0day-ci/archive/20231027/202310271326.7xKHbFDH-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231027/202310271326.7xKHbFDH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310271326.7xKHbFDH-lkp@intel.com/

All warnings (new ones prefixed by >>):

   sound/soc/amd/acp/acp-legacy-common.c: In function 'check_acp_pdm':
   sound/soc/amd/acp/acp-legacy-common.c:392:19: error: implicit declaration of function 'acpi_find_child_device'; did you mean 'acpi_match_device'? [-Werror=implicit-function-declaration]
     392 |         pdm_dev = acpi_find_child_device(ACPI_COMPANION(&pci->dev), pdm_addr, 0);
         |                   ^~~~~~~~~~~~~~~~~~~~~~
         |                   acpi_match_device
>> sound/soc/amd/acp/acp-legacy-common.c:392:17: warning: assignment to 'struct acpi_device *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     392 |         pdm_dev = acpi_find_child_device(ACPI_COMPANION(&pci->dev), pdm_addr, 0);
         |                 ^
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
