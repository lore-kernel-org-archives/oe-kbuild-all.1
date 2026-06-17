Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F95E26059D
	for <oe-kbuild-all@lists.linux.dev>; Wed, 17 Jun 2026 07:39:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781681948; cv=none; b=tXF97L+L6N+yogMRz/Rt28CuLxh7BNdYrE4KgCD/eM39yy8HEFnV4oOScXreEp1x89EfXyxJlCnd4C9j6LqeVEteOIAAkZYb2eTyKfP6jzYhkyhfl1yWqrEXR4y0oNtd9akesImxPXHotrkGagMNscqRpfUp1pmVAzuB7Eiumwg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781681948; c=relaxed/simple;
	bh=prkeh8UcvxtRvKeC741GhXLFIYYqoUbHjxgqtMBYGNY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=IWtZifvePDCsEn+CZBdUQTESZUX7HEeQ9GpLINkYRGDtSLHVL3VDHGFbRdWN+026FpWOampwbjZnNIyVhU5tTCIiPvdO8tNGsBpquuT/b9AeNrY7r9Kyf8/IkzAvgaH349EQBOaYH/AqZuDI2BbAl2VrY1M4v1gjcIaHFkIT8YA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Tv8AyxdW; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Tv8AyxdW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781681947; x=1813217947;
  h=date:from:to:cc:subject:message-id;
  bh=prkeh8UcvxtRvKeC741GhXLFIYYqoUbHjxgqtMBYGNY=;
  b=Tv8AyxdWmH5jEPwWyriimCi3cEEsFyY3Fa7VtksWJSLp59tuqSWNkrwn
   DkigW8pYm/QAAaHpeemafM3sTfpLxYjnLahQfv2K+348+K0G+hf1L/Axw
   DdkOl5zZODtcoRy2EDPvMvndP+WyRn9agi2OM1VmkAbBUoFoGeGtnXlY7
   E8qgqGGBjxGeYpNkMNYV2cUvQTzqLfTZZckkDwTZnRb5MAXH+FNBZJB7R
   AGQsw4asgCYoINV6aN/oBhMfdtRqe7fBK25AOrqhNMEV/oeZ0eqlHQ/Mi
   O01p0W+NvPxvvIXe8Mz2AentradQrzpDy32D4f3YkNdI9+o09TWyX9oBj
   g==;
X-CSE-ConnectionGUID: yxaEh8Q6QFKly+e20caBlw==
X-CSE-MsgGUID: KXSGpDgQQ5urB18lLVaqlA==
X-IronPort-AV: E=McAfee;i="6800,10657,11819"; a="100031238"
X-IronPort-AV: E=Sophos;i="6.24,209,1774335600"; 
   d="scan'208";a="100031238"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jun 2026 00:39:06 -0700
X-CSE-ConnectionGUID: pdCF1T55QTeGqMT2CfFrjw==
X-CSE-MsgGUID: X/6GRHV2S5GXutPzl3YnyQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,209,1774335600"; 
   d="scan'208";a="243620205"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 17 Jun 2026 00:39:04 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wZkrW-00000000UF2-0X5V;
	Wed, 17 Jun 2026 07:39:02 +0000
Date: Wed, 17 Jun 2026 15:38:54 +0800
From: kernel test robot <lkp@intel.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [morimoto:sound-cleanup-2026-06-16 326/326]
 sound/soc/soc-card.c:1268:6: warning: no previous prototype for
 'snd_soc_card_set_pci_ssid'
Message-ID: <202606171540.9HTfMSDP-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/morimoto/linux sound-cleanup-2026-06-16
head:   5ce50ac7d0a59c6fb15e1baa7e6824ac096fe092
commit: bcca3afbe4030eb595d239674303afc5fd051920 [326/326] ASoC: soc-card.h: remove compatible definition
config: parisc-allyesconfig (https://download.01.org/0day-ci/archive/20260617/202606171540.9HTfMSDP-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260617/202606171540.9HTfMSDP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606171540.9HTfMSDP-lkp@intel.com/

All warnings (new ones prefixed by >>):

   sound/soc/soc-card.c:42:6: warning: no previous prototype for 'snd_soc_card_attach_priv' [-Wmissing-prototypes]
      42 | void snd_soc_card_attach_priv(struct snd_soc_card *card, void *data)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/soc-card.c: In function 'snd_soc_card_remove':
   sound/soc/soc-card.c:886:27: error: 'struct snd_soc_card_driver' has no member named 'probed'; did you mean 'probe'?
     886 |         if (card->driver->probed &&
         |                           ^~~~~~
         |                           probe
   sound/soc/soc-card.c: At top level:
>> sound/soc/soc-card.c:1268:6: warning: no previous prototype for 'snd_soc_card_set_pci_ssid' [-Wmissing-prototypes]
    1268 | void snd_soc_card_set_pci_ssid(struct snd_soc_card *card,
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/soc-card.c: In function 'snd_soc_card_set_pci_ssid':
   sound/soc/soc-card.c:1272:13: error: 'struct snd_soc_card' has no member named 'pci_subsystem_vendor'
    1272 |         card->pci_subsystem_vendor = vendor;
         |             ^~
   sound/soc/soc-card.c:1273:13: error: 'struct snd_soc_card' has no member named 'pci_subsystem_device'
    1273 |         card->pci_subsystem_device = device;
         |             ^~
   sound/soc/soc-card.c:1274:13: error: 'struct snd_soc_card' has no member named 'pci_subsystem_set'
    1274 |         card->pci_subsystem_set = true;
         |             ^~
   sound/soc/soc-card.c: At top level:
>> sound/soc/soc-card.c:1293:5: warning: no previous prototype for 'snd_soc_card_get_pci_ssid' [-Wmissing-prototypes]
    1293 | int snd_soc_card_get_pci_ssid(struct snd_soc_card *card,
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/soc-card.c: In function 'snd_soc_card_get_pci_ssid':
   sound/soc/soc-card.c:1297:18: error: 'struct snd_soc_card' has no member named 'pci_subsystem_set'
    1297 |         if (!card->pci_subsystem_set)
         |                  ^~
   sound/soc/soc-card.c:1300:23: error: 'struct snd_soc_card' has no member named 'pci_subsystem_vendor'
    1300 |         *vendor = card->pci_subsystem_vendor;
         |                       ^~
   sound/soc/soc-card.c:1301:23: error: 'struct snd_soc_card' has no member named 'pci_subsystem_device'
    1301 |         *device = card->pci_subsystem_device;
         |                       ^~
   sound/soc/soc-card.c: In function 'snd_soc_card_register3':
   sound/soc/soc-card.c:1337:14: error: 'card_driver' undeclared (first use in this function); did you mean 'parisc_driver'?
    1337 |         if (!card_driver->name)
         |              ^~~~~~~~~~~
         |              parisc_driver
   sound/soc/soc-card.c:1337:14: note: each undeclared identifier is reported only once for each function it appears in
   sound/soc/soc-card.c:1351:24: error: returning 'int' from a function with return type 'struct snd_soc_card *' makes pointer from integer without a cast [-Wint-conversion]
    1351 |                 return -ENOMEM;
         |                        ^


vim +/snd_soc_card_set_pci_ssid +1268 sound/soc/soc-card.c

9666422c9fc116 Kuninori Morimoto 2026-06-10  1266  
9666422c9fc116 Kuninori Morimoto 2026-06-10  1267  /* REMOVE ME */
789d6dc80311d8 Kuninori Morimoto 2026-03-26 @1268  void snd_soc_card_set_pci_ssid(struct snd_soc_card *card,
789d6dc80311d8 Kuninori Morimoto 2026-03-26  1269  			       unsigned short vendor,
789d6dc80311d8 Kuninori Morimoto 2026-03-26  1270  			       unsigned short device)
789d6dc80311d8 Kuninori Morimoto 2026-03-26  1271  {
789d6dc80311d8 Kuninori Morimoto 2026-03-26  1272  	card->pci_subsystem_vendor = vendor;
789d6dc80311d8 Kuninori Morimoto 2026-03-26 @1273  	card->pci_subsystem_device = device;
789d6dc80311d8 Kuninori Morimoto 2026-03-26  1274  	card->pci_subsystem_set = true;
789d6dc80311d8 Kuninori Morimoto 2026-03-26  1275  }
789d6dc80311d8 Kuninori Morimoto 2026-03-26  1276  EXPORT_SYMBOL_GPL(snd_soc_card_set_pci_ssid);
789d6dc80311d8 Kuninori Morimoto 2026-03-26  1277  
9666422c9fc116 Kuninori Morimoto 2026-06-10  1278  int snd_soc_card_driver_get_pci_ssid(struct snd_soc_card_driver *card_driver,
9666422c9fc116 Kuninori Morimoto 2026-06-10  1279  				     unsigned short *vendor,
9666422c9fc116 Kuninori Morimoto 2026-06-10  1280  				     unsigned short *device)
9666422c9fc116 Kuninori Morimoto 2026-06-10  1281  {
9666422c9fc116 Kuninori Morimoto 2026-06-10  1282  	if (!card_driver->pci_subsystem_set)
9666422c9fc116 Kuninori Morimoto 2026-06-10  1283  		return -ENOENT;
9666422c9fc116 Kuninori Morimoto 2026-06-10  1284  
9666422c9fc116 Kuninori Morimoto 2026-06-10  1285  	*vendor = card_driver->pci_subsystem_vendor;
9666422c9fc116 Kuninori Morimoto 2026-06-10  1286  	*device = card_driver->pci_subsystem_device;
9666422c9fc116 Kuninori Morimoto 2026-06-10  1287  
9666422c9fc116 Kuninori Morimoto 2026-06-10  1288  	return 0;
9666422c9fc116 Kuninori Morimoto 2026-06-10  1289  }
9666422c9fc116 Kuninori Morimoto 2026-06-10  1290  EXPORT_SYMBOL_GPL(snd_soc_card_driver_get_pci_ssid);
9666422c9fc116 Kuninori Morimoto 2026-06-10  1291  
9666422c9fc116 Kuninori Morimoto 2026-06-10  1292  /* REMOVE ME */
789d6dc80311d8 Kuninori Morimoto 2026-03-26 @1293  int snd_soc_card_get_pci_ssid(struct snd_soc_card *card,
789d6dc80311d8 Kuninori Morimoto 2026-03-26  1294  			      unsigned short *vendor,
789d6dc80311d8 Kuninori Morimoto 2026-03-26  1295  			      unsigned short *device)
789d6dc80311d8 Kuninori Morimoto 2026-03-26  1296  {
789d6dc80311d8 Kuninori Morimoto 2026-03-26  1297  	if (!card->pci_subsystem_set)
789d6dc80311d8 Kuninori Morimoto 2026-03-26  1298  		return -ENOENT;
789d6dc80311d8 Kuninori Morimoto 2026-03-26  1299  
789d6dc80311d8 Kuninori Morimoto 2026-03-26  1300  	*vendor = card->pci_subsystem_vendor;
789d6dc80311d8 Kuninori Morimoto 2026-03-26  1301  	*device = card->pci_subsystem_device;
789d6dc80311d8 Kuninori Morimoto 2026-03-26  1302  
789d6dc80311d8 Kuninori Morimoto 2026-03-26  1303  	return 0;
789d6dc80311d8 Kuninori Morimoto 2026-03-26  1304  }
789d6dc80311d8 Kuninori Morimoto 2026-03-26  1305  EXPORT_SYMBOL_GPL(snd_soc_card_get_pci_ssid);
789d6dc80311d8 Kuninori Morimoto 2026-03-26  1306  #endif /* CONFIG_PCI */
7928193d4258eb Kuninori Morimoto 2026-03-30  1307  

:::::: The code at line 1268 was first introduced by commit
:::::: 789d6dc80311d84d93dd24b965cdd0319108562c ASoC: soc-card: move snd_soc_card_{set/get}_pci_ssid() to soc-card.c

:::::: TO: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
:::::: CC: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
