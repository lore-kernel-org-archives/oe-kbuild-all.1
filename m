Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9335A1BDF4
	for <oe-kbuild-all@lists.linux.dev>; Tue, 31 Oct 2023 15:09:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="INbD3x4H"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698764971; x=1730300971;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=i8jvXxuzNCps8v3hjwdzmk8Li/oJB5ByT7DtyBrOyUk=;
  b=INbD3x4H7D96bPgEwVD0foTqHOIUwU3HKOFvMOpO6SRnyDUS4NYQ+drr
   IabKCKLGhnm3kt7kuaLgq8WiQQenTiQu65HuHLkhBfclrSiJzNKbTbXQs
   1cG+1EAE1EhA05r/Lr4ptE6RlR6rW2Ps6l1V+X89htINK8tNnS0DzwN4i
   LGfN/8Mp0PGsr0+pT0Q9XhzRGw57mS0LVqVjbaacsnXJOyhR8cKu5JmbC
   GRajy4U+MzvbZdcIYh6E3F/OJrteuXgev+WZPwGzmrs9emHIIN4CLm1jq
   RvNkLnda0WbwAlBUYJPKeC6Bq9ijQOt4L+o+00x7fVrIvt673S3FRBaHR
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10880"; a="454768893"
X-IronPort-AV: E=Sophos;i="6.03,265,1694761200"; 
   d="scan'208";a="454768893"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Oct 2023 08:09:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10880"; a="760640168"
X-IronPort-AV: E=Sophos;i="6.03,265,1694761200"; 
   d="scan'208";a="760640168"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 31 Oct 2023 08:09:28 -0700
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qxqMw-0000ER-0I;
	Tue, 31 Oct 2023 15:09:26 +0000
Date: Tue, 31 Oct 2023 23:09:25 +0800
From: kernel test robot <lkp@intel.com>
To: Syed Saba Kareem <Syed.SabaKareem@amd.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Mark Brown <broonie@kernel.org>
Subject: [linux-next:master 14482/15964]
 sound/soc/amd/acp/acp-legacy-common.c:392:19: error: implicit declaration of
 function 'acpi_find_child_device'; did you mean 'acpi_match_device'?
Message-ID: <202310312340.o6CthxSp-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   9c2d379d63450ae464eeab45462e0cb573cd97d0
commit: 3a94c8ad0aae2b14a55059869871ea2d199af489 [14482/15964] ASoC: amd: acp: add code for scanning acp pdm controller
config: x86_64-buildonly-randconfig-001-20231031 (https://download.01.org/0day-ci/archive/20231031/202310312340.o6CthxSp-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231031/202310312340.o6CthxSp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310312340.o6CthxSp-lkp@intel.com/

Note: the linux-next/master HEAD 9c2d379d63450ae464eeab45462e0cb573cd97d0 builds fine.
      It may have been fixed somewhere.

All errors (new ones prefixed by >>):

   sound/soc/amd/acp/acp-legacy-common.c: In function 'check_acp_pdm':
>> sound/soc/amd/acp/acp-legacy-common.c:392:19: error: implicit declaration of function 'acpi_find_child_device'; did you mean 'acpi_match_device'? [-Werror=implicit-function-declaration]
     392 |         pdm_dev = acpi_find_child_device(ACPI_COMPANION(&pci->dev), pdm_addr, 0);
         |                   ^~~~~~~~~~~~~~~~~~~~~~
         |                   acpi_match_device
   sound/soc/amd/acp/acp-legacy-common.c:392:17: warning: assignment to 'struct acpi_device *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
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
