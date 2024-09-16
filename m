Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1ABE8522A
	for <oe-kbuild-all@lists.linux.dev>; Mon, 16 Sep 2024 06:34:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726468454; cv=none; b=gvvmmHit3nQSUprV43CwU2OGY5LmN9k1gNKo6HcCKNIJCS6CEfJkp0NN7ISXEwi2U3z2n5GeKb88ag6qGYn3xoidTxKXuRDoAIDpJZRKT12aaB3I1bIRouZuRgjVPlZiPQTZr/rIKrqm+TLHujAJbNYiftCRPZQpcDxRlxa/rz4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726468454; c=relaxed/simple;
	bh=oJGyEqfk742S668md7CHq9bwcQIG0XvEbMXbFfsJh7w=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Z3Q4eL+jU/fYX9/Hmu67mTM0Vmgc5ZSFz2doplhix+SCP0nPir04qj2PqUfhG3EwxIq3TT4I3NvytEJEivfLtgzRNqgjPN3vFCgyP7pz0njquvtpZ6SpxCJf8pWfXwuuBbEmi1HJpTcO6indRn1DweykqpbJI87hjBghbAQvzmk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=J2mSo3Zy; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="J2mSo3Zy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726468452; x=1758004452;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=oJGyEqfk742S668md7CHq9bwcQIG0XvEbMXbFfsJh7w=;
  b=J2mSo3Zy92znIbn/OUvInpLJfadSjQsDQah6laYsM/HfwO+pCblfJaWs
   thowWyGZ7U523uind/n0AFSyLV3OZWYuijl57WDDQANvjxmaEuLyhSm+W
   cUFKhRg+TuX1RtEURplqDrVW46ZgFHDOjPfo/p1G05UEVx3BK6CMLcHbA
   PUD40bgSN/iVFOzeyVArxLqY3Vw3x9hUKKNIMy24Luh+vo22cyQ76B4LI
   ufEKI7NINKL5SaShOSxAU6L/mgW8pmfsYPH5xOONUwmvNzMHb+F/51ngD
   LJzAjIIrpd1QB9MU1JG9Hm9C2aVCVUgCk56PtlIUE5pCT771AL9U01Zqu
   w==;
X-CSE-ConnectionGUID: vCVUnR0cTKKD3Ps3+eEsZg==
X-CSE-MsgGUID: dHphPQ/2S+CjyUF9z7tQLA==
X-IronPort-AV: E=McAfee;i="6700,10204,11196"; a="25220686"
X-IronPort-AV: E=Sophos;i="6.10,232,1719903600"; 
   d="scan'208";a="25220686"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Sep 2024 23:33:56 -0700
X-CSE-ConnectionGUID: u3BXSWxlTiSLZbc2VaVCJQ==
X-CSE-MsgGUID: g+K68sEZTTGSBwamzM0J6w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,232,1719903600"; 
   d="scan'208";a="68479641"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 15 Sep 2024 23:33:55 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sq5J3-0009Se-0S;
	Mon, 16 Sep 2024 06:33:53 +0000
Date: Mon, 16 Sep 2024 14:33:08 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Yang Yingliang <yangyingliang@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 17815/23714] drivers/edac/skx_common.o:
 warning: objtool: missing symbol for section .init.text
Message-ID: <202409161418.IlepWryM-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   37aeb7e817053fbf532b214aa02858b3c23af0b1
commit: 3b7ad71a0a415eb51fb41ddc01ef538a7e163de4 [17815/23714] Intel: EDAC, i10nm: Add a driver for Intel 10nm server processors
config: x86_64-buildonly-randconfig-001-20240915 (https://download.01.org/0day-ci/archive/20240916/202409161418.IlepWryM-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240916/202409161418.IlepWryM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409161418.IlepWryM-lkp@intel.com/

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
