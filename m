Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D50B243964
	for <oe-kbuild-all@lists.linux.dev>; Mon, 17 Mar 2025 15:40:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742226027; cv=none; b=OOA+zsJu2u3YjcWSI3AnBLpIdwzKn2bpIAVcPq1gJSgAzeooPLoncoEwDnWhV3fO/WE/4Kd/3HLuO8sHarVbnRk6dNP7B+7dHt8mggzu43pIXRVzSLMa+hUo1x6uBnagvs3ePPxTaTn1ryyhlijsq6cTuws5kau26wdz1eMvEwc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742226027; c=relaxed/simple;
	bh=k7YDdPknJVIxaj+W6uQFSFo8m2qvJKNldrvEbZHFXQ8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=DprJAG5moemlOCrC8ydtSm2dhWz03IO3p7BJY1v87CFr6hpVFjofMEWLOePt2Tl4KdUq4A4u7Hs+IzSkYlDJDVt3Sb7kawqwGilcDMJxtp3JLjmPNDGxTLeuW7zGu5fvA0tUuxb8c2CkomQjvvwm50hcERtwJfANxY/KIkH1+iQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=P2acDx6O; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="P2acDx6O"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1742226025; x=1773762025;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=k7YDdPknJVIxaj+W6uQFSFo8m2qvJKNldrvEbZHFXQ8=;
  b=P2acDx6OxhxvuDOi+LouWvr/uxCTkbJJ74zDzTnYN1okOWEUldtC8VvW
   tdGwDm+vayQuQQhHjBCT+E//dVBX3Hglc+dyV36c4cV+eaiIYxDmnfAQe
   J1ei851y3HuHPht27v8SiJHiNynbyKlnznQokC2MnbZz0QPnf0qEeCI/H
   XeeA8Dfi93sTGJ2PF5Ws3HNGp/qwoPJXXx41e8V9mrRSHUgRzDlDNDbAM
   JOuCEmJ2WAIER74cx4EJTUlHSpE/erR8afZguGrYOkuhKfxM9cOTf643W
   IoGagnWH3hsL8Xpaxq3IrXb0uM3TIg0MQqpUE+p9W+WyrRYBwAASxgECu
   g==;
X-CSE-ConnectionGUID: WIe4pYk+TcyhaaTO38hi+g==
X-CSE-MsgGUID: kF88qWROQvumdzeRvFLkiA==
X-IronPort-AV: E=McAfee;i="6700,10204,11376"; a="43236663"
X-IronPort-AV: E=Sophos;i="6.14,254,1736841600"; 
   d="scan'208";a="43236663"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Mar 2025 08:40:25 -0700
X-CSE-ConnectionGUID: 2RICaab1SS667mFRljVKhA==
X-CSE-MsgGUID: Cs1jvKgERqaE3dsuVFbgRA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,254,1736841600"; 
   d="scan'208";a="121929156"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by orviesa010.jf.intel.com with ESMTP; 17 Mar 2025 08:40:23 -0700
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tuCZh-000Csw-0P;
	Mon, 17 Mar 2025 15:40:21 +0000
Date: Mon, 17 Mar 2025 23:39:26 +0800
From: kernel test robot <lkp@intel.com>
To: Takashi Iwai <tiwai@suse.de>
Cc: oe-kbuild-all@lists.linux.dev, Mark Brown <broonie@kernel.org>,
	Charles Keepax <ckeepax@opensource.cirrus.com>
Subject: [broonie-ci:20250313_tiwai_asoc_convert_to_modern_pm_macros 184/194]
 sound/soc/sof/snd-sof-pci.mod.c:15:32: error: expected ')' before
 'SND_SOC_SOF_PCI_DEV'
Message-ID: <202503172322.iDRz1rjG-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/ci.git 20250313_tiwai_asoc_convert_to_modern_pm_macros
head:   9a2c84a9570fadf5fa15f3e6ca13a7ca23a6fb4c
commit: aa8272da87158b3e168a84b638766d964880a546 [184/194] ASoC: SOF: pci: Convert to EXPORT_NS_DEV_PM_OPS()
config: sparc-allmodconfig (https://download.01.org/0day-ci/archive/20250317/202503172322.iDRz1rjG-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250317/202503172322.iDRz1rjG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503172322.iDRz1rjG-lkp@intel.com/

All error/warnings (new ones prefixed by >>, old ones prefixed by <<):

WARNING: modpost: module snd-sof-acpi-intel-byt uses symbol sof_acpi_pm from namespace "SND_SOC_SOF_ACPI_DEV", but does not import it.
WARNING: modpost: module snd-sof-acpi-intel-bdw uses symbol sof_acpi_pm from namespace "SND_SOC_SOF_ACPI_DEV", but does not import it.
>> WARNING: modpost: module snd-sof-pci-intel-tng uses symbol sof_pci_pm from namespace "SND_SOC_SOF_PCI_DEV", but does not import it.
>> WARNING: modpost: module snd-sof-pci-intel-skl uses symbol sof_pci_pm from namespace "SND_SOC_SOF_PCI_DEV", but does not import it.
>> WARNING: modpost: module snd-sof-pci-intel-apl uses symbol sof_pci_pm from namespace "SND_SOC_SOF_PCI_DEV", but does not import it.
>> WARNING: modpost: module snd-sof-pci-intel-cnl uses symbol sof_pci_pm from namespace "SND_SOC_SOF_PCI_DEV", but does not import it.
>> WARNING: modpost: module snd-sof-pci-intel-icl uses symbol sof_pci_pm from namespace "SND_SOC_SOF_PCI_DEV", but does not import it.
>> WARNING: modpost: module snd-sof-pci-intel-tgl uses symbol sof_pci_pm from namespace "SND_SOC_SOF_PCI_DEV", but does not import it.
>> WARNING: modpost: module snd-sof-pci-intel-mtl uses symbol sof_pci_pm from namespace "SND_SOC_SOF_PCI_DEV", but does not import it.
>> WARNING: modpost: module snd-sof-pci-intel-lnl uses symbol sof_pci_pm from namespace "SND_SOC_SOF_PCI_DEV", but does not import it.
>> WARNING: modpost: module snd-sof-pci-intel-ptl uses symbol sof_pci_pm from namespace "SND_SOC_SOF_PCI_DEV", but does not import it.
--
In file included from sound/soc/sof/snd-sof-pci.mod.c:2:
>> sound/soc/sof/snd-sof-pci.mod.c:15:32: error: expected ')' before 'SND_SOC_SOF_PCI_DEV'
15 | KSYMTAB_DATA(sof_pci_pm, "", ""SND_SOC_SOF_PCI_DEV"");
|                                ^~~~~~~~~~~~~~~~~~~
include/linux/export-internal.h:45:28: note: in definition of macro '__KSYMTAB'
45 |             "   .asciz "" ns """                                      "n"             |                            ^~
sound/soc/sof/snd-sof-pci.mod.c:15:1: note: in expansion of macro 'KSYMTAB_DATA'
15 | KSYMTAB_DATA(sof_pci_pm, "", ""SND_SOC_SOF_PCI_DEV"");
| ^~~~~~~~~~~~
include/linux/export-internal.h:41:12: note: to match this '('
41 |         asm("   .section "__ksymtab_strings","aMS",%progbits,1"     "n"             |            ^
include/linux/export-internal.h:63:41: note: in expansion of macro '__KSYMTAB'
63 | #define KSYMTAB_DATA(name, sec, ns)     __KSYMTAB(name, name, sec, ns)
|                                         ^~~~~~~~~
sound/soc/sof/snd-sof-pci.mod.c:15:1: note: in expansion of macro 'KSYMTAB_DATA'
15 | KSYMTAB_DATA(sof_pci_pm, "", ""SND_SOC_SOF_PCI_DEV"");
| ^~~~~~~~~~~~

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
