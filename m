Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.16
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795055403;
	b=YU8kixd3VyLYJV2sZVphXhRKcloyILsdOOvPTbjXuqRV6SZtuawV7tebZVuPLkWG7ijC
	 04VXLWMHOSS8LQgDNIUHDOkjnp4fn7eZK0x693uyY6koC9b+Y13/B+iXQ7eI873lMYO0I
	 dw/+BFVkeZyQvHRb81dYoK9v/PLnmVfE1QcYtnTkyjMTRyOPqrDvOL3S8dsm9Lq+in8FI
	 G5x0pq0FR9yOKZbbxtkh0ftBLZGPSZ4Lkb0DKrNkG4UkC1YtwyUvNmLJ4Ihd26WmOUodF
	 KABUYXbXUBUVxrkLtyfMK1XciyjjlACAh1GpesNuP/0EZgQ9X9/J6tmfqhfxBNH1x3A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795055403;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=teG0iBbDYT4e1Y0k66pxozwJD/q8U23GQUoomAaw+qE=;
	b=Tl6Cig5TiHnUwhBvB1HnCBAGBc8HU6uRKnVsn61H7cW085qpb1SRUfdhinbmAGWEQamY
	 6sOXFao1O5jbTHfGe4eaOXGDvwWyNxnaAmMwuROUfhmd++mCmRtQTU7SWOrEdszOjH2vJ
	 Cc0/wrGr3wEiOssVqIbuVVnP8pnIVwyvEvL6Qg0jJtzCgYdPSkQiKV872hgxZ3s9jZPOD
	 Zm4Q4tltNNw0BKE9FiIRXk0F/oXUFfhnOpuwh9VTkowH+WeGTrT4ri2Kqwp/GF0aFOruu
	 Mlkwbu9tZGTclqqZsFViErZ4BEy8ntINP/rx0m+ztssmyDl5O+Hs/NdPqQ3jEvksx6w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=faFxwjNk;
	arc=none smtp.remote-ip=192.198.163.16
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4214E606A32A
	for <oe-kbuild-all@lists.linux.dev>; Thu, 19 Nov 2026 02:30:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4214E606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=faFxwjNk
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795055403; x=1826591403;
  h=date:from:to:cc:subject:message-id;
  bh=8g9nd7Tk9a/RAApEkgKSGj44wDrhmMcxT+zd9C++Vio=;
  b=faFxwjNkQHawsOGsInxUrhnvY4sts1DTbNyAGolJQvfR9qfEVsJjq4FI
   STk0wHA5wAEpX69E5yh8U3Y9j7BDkoCq+wdNe2izZcxufiRGEOk7ZC+HT
   R6MGI7Qo4v/TpJPPDyc3EuiehwNV4da1nOjrMT66ChvdOHCNpWsHSbUeb
   s7N6SzHzmSpGBdr/BWikGbOSutykYoEoWd81eal3ALGVONMjiYXsRpWH2
   VZjFNN4Ov6hfJVRxIYWNcDrTXpxek93FQESUBdkbg/UrPXyqmQfoFcUDU
   GYUnIxIQe2GWw6h9GN4M8dsl+sCBIVJOxosVcwDS3lYxsY/NRWHWV88KS
   g==;
X-CSE-ConnectionGUID: MgJSNaCKTOaU/uyhPUe7zA==
X-CSE-MsgGUID: ChQFQcaCT2CdT4kR1tLRUw==
X-IronPort-AV: E=McAfee;i="6800,10657,11970"; a="3920178"
X-IronPort-AV: E=Sophos;i="6.27,220,1787036400"; 
   d="scan'208";a="3920178"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2026 18:30:01 -0800
X-CSE-ConnectionGUID: eztrgNBLTdiaOqYRQ8bFAA==
X-CSE-MsgGUID: GsRg/qMOTmuv+2KEGskUIg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,220,1787036400"; 
   d="scan'208";a="10402816"
Received: from igk-lkp-server01.igk.intel.com (HELO 1073a420ae3a) ([10.211.93.152])
  by orviesa001.jf.intel.com with ESMTP; 18 Nov 2026 18:30:00 -0800
Received: from kbuild by 1073a420ae3a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xTruP-000000003bB-45NN;
	Thu, 19 Nov 2026 02:29:57 +0000
Date: Thu, 19 Nov 2026 03:29:34 +0100
From: kernel test robot <lkp@intel.com>
To: Dave Jiang <dave.jiang@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [djiang:type2-revoke 2/13] drivers/cxl/mem.c:239:27: error:
 called object type 'void *' is not a function or function pointer
Message-ID: <20261119032008.STPYTJ9x-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/djiang/linux.git type2-revoke
head:   73f29beb504173aa2e12857fddba3a039f6922d9
commit: b081168db6af34744459599b374441b4b2be5a63 [2/13] cxl: Notify Type2 drivers before their region is torn down
config: loongarch-randconfig-2200-20261119 (https://download.01.org/0day-ci/archive/20261119/20261119032008.STPYTJ9x-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 51d7f08b16b68285b1a400f413215b69f07a65e3)
smatch: v0.5.0-9187-g5189e3fb
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261119/20261119032008.STPYTJ9x-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/20261119032008.STPYTJ9x-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/cxl/mem.c:239:27: error: called object type 'void *' is not a function or function pointer
     239 |                 cxl_memdev_attach_disarm(attach->cxlmd);
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~^
   1 error generated.


vim +239 drivers/cxl/mem.c

   221	
   222	static int cxl_attach_unbind_notify(struct notifier_block *nb,
   223					    unsigned long action, void *data)
   224	{
   225		struct cxl_attach_region *attach =
   226			container_of(nb, struct cxl_attach_region, unbind_nb);
   227	
   228		if (data != attach->host)
   229			return NOTIFY_DONE;
   230		if (action != BUS_NOTIFY_UNBIND_DRIVER &&
   231		    action != BUS_NOTIFY_DRIVER_NOT_BOUND)
   232			return NOTIFY_DONE;
   233	
   234		/*
   235		 * Sent before remove(), or before devres unwind on probe failure:
   236		 * wait out an in-flight revoke, block new ones.
   237		 */
   238		if (attach->cxlmd)
 > 239			cxl_memdev_attach_disarm(attach->cxlmd);
   240		return NOTIFY_OK;
   241	}
   242	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
