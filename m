Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40696208B9
	for <oe-kbuild-all@lists.linux.dev>; Mon, 19 Feb 2024 07:17:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708327056; cv=none; b=f+ECFT5qg7et5Rg+AsXu0+ukFZXop2hF28rNtwIFHWasJ0jkMl+87fObvdN//ISSOBmfc2lUkwusO+/bssPynfZ58dsqtZLkM1TnOeG4s/8sGWMjwTeZB1wgkkUUWl8OMTzrww2H4gOi/WMioo41HDYPOsVxaTtfc095F68R034=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708327056; c=relaxed/simple;
	bh=XCy8+R7NYH5nQ28XQDAUNDwMQV/w8QPUTHO0qJOO5oM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=KL7CaxEGX89ie6CUiyi1OjsH74zGtb7r+GdSVxCdDdmFDKy1+6a2Kw+qGCZ5tPJ7tQ8GlpGLumXZeWh5IFk3fAsSJ8grMyi2DA3q2jxP63SucQhb4LFwjIZLYA/5MllxRp6BFCR0q9SYb57PVVXMzjnROPiXOKq/a4wNjh2jvIQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SSmxu7+3; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SSmxu7+3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1708327052; x=1739863052;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=XCy8+R7NYH5nQ28XQDAUNDwMQV/w8QPUTHO0qJOO5oM=;
  b=SSmxu7+3shwwNWRlil8/R9WEbubA8BD/cK2rsqulxJ0myYVg+HZlcRNx
   WKWQoytFHUJuocY+SbNVzEyaxkgihBghpCJAHagEPa37G8RLpvLKXgl+i
   6NFoP4lkP2N8TEnNYPBYnK2XoASPEH5uXVj/r0EH28gjuVXrmIa0ImCiJ
   jPkr9lhUEafZA865b+N7qi42lMaSxnpYBBuTjU03kJrg+HdPBpWiayvYr
   xExg62jyc7Nu45MS65qUC8ne0PIS4n+97oC3robS5oYwFMosdh0d9twfS
   XPFHgufDg9DMD/aCALXWFg4dMj6mk3SNb57uk0fhxNyJFPugE2gFLayCs
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10988"; a="19820374"
X-IronPort-AV: E=Sophos;i="6.06,170,1705392000"; 
   d="scan'208";a="19820374"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Feb 2024 23:17:31 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,170,1705392000"; 
   d="scan'208";a="9020164"
Received: from lkp-server02.sh.intel.com (HELO 3c78fa4d504c) ([10.239.97.151])
  by fmviesa005.fm.intel.com with ESMTP; 18 Feb 2024 23:17:29 -0800
Received: from kbuild by 3c78fa4d504c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rbxtz-0003bc-1z;
	Mon, 19 Feb 2024 07:17:24 +0000
Date: Mon, 19 Feb 2024 15:16:51 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Yang Yingliang <yangyingliang@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 17814/21628] drivers/edac/skx_common.o:
 warning: objtool: missing symbol for section .init.text
Message-ID: <202402191532.Uvy12NoM-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   94f199d2ce0118d64c47192cef7247cf30560eba
commit: e34047f6dc606c123911c6db8fa424bb4a035262 [17814/21628] EDAC, skx_edac: Delete duplicated code
config: x86_64-buildonly-randconfig-005-20240218 (https://download.01.org/0day-ci/archive/20240219/202402191532.Uvy12NoM-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240219/202402191532.Uvy12NoM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402191532.Uvy12NoM-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/edac/skx_common.c: In function 'skx_mce_output_error':
   drivers/edac/skx_common.c:470:15: warning: variable 'type' set but not used [-Wunused-but-set-variable]
     470 |         char *type, *optype;
         |               ^~~~
   drivers/edac/skx_common.c: In function 'skx_get_dimm_info':
   drivers/edac/skx_common.c:309:79: warning: '_DIMM#' directive output may be truncated writing 6 bytes into a region of size between 0 and 9 [-Wformat-truncation=]
     309 |         snprintf(dimm->label, sizeof(dimm->label), "CPU_SrcID#%u_MC#%u_Chan#%u_DIMM#%u",
         |                                                                               ^~~~~~
   drivers/edac/skx_common.c:309:52: note: using the range [0, 4294967295] for directive argument
     309 |         snprintf(dimm->label, sizeof(dimm->label), "CPU_SrcID#%u_MC#%u_Chan#%u_DIMM#%u",
         |                                                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/edac/skx_common.c:309:9: note: 'snprintf' output between 31 and 53 bytes into a destination of size 32
     309 |         snprintf(dimm->label, sizeof(dimm->label), "CPU_SrcID#%u_MC#%u_Chan#%u_DIMM#%u",
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     310 |                  imc->src_id, imc->lmc, chan, dimmno);
         |                  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/edac/skx_common.c: In function 'skx_get_nvdimm_info':
   drivers/edac/skx_common.c:357:79: warning: '_DIMM#' directive output may be truncated writing 6 bytes into a region of size between 0 and 9 [-Wformat-truncation=]
     357 |         snprintf(dimm->label, sizeof(dimm->label), "CPU_SrcID#%u_MC#%u_Chan#%u_DIMM#%u",
         |                                                                               ^~~~~~
   drivers/edac/skx_common.c:357:52: note: using the range [0, 4294967295] for directive argument
     357 |         snprintf(dimm->label, sizeof(dimm->label), "CPU_SrcID#%u_MC#%u_Chan#%u_DIMM#%u",
         |                                                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/edac/skx_common.c:357:9: note: 'snprintf' output between 31 and 53 bytes into a destination of size 32
     357 |         snprintf(dimm->label, sizeof(dimm->label), "CPU_SrcID#%u_MC#%u_Chan#%u_DIMM#%u",
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     358 |                  imc->src_id, imc->lmc, chan, dimmno);
         |                  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/edac/skx_common.o: warning: objtool: missing symbol for section .init.text

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
