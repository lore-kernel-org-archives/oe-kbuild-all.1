Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 567842907
	for <oe-kbuild-all@lists.linux.dev>; Sat, 15 Jun 2024 02:49:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718419779; cv=none; b=fSa+vUAT29KNbnkg+zQf6sduP8HDKGPfnqwEpzcj2Cw5VSl4JMqdHOQxrHeU4kmDzqRYmZE3vO5MRszUxiEXCKJ0KSKFPHVPUD51Opcut28XBoC1wdIZ8cwu5Ib6LpR/k52vhFVZbd0cxW0GuOmKRVn+qeWWQNixeSgaUA1eqto=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718419779; c=relaxed/simple;
	bh=5A2aSfJr1dck7ZP7SOEEUgE1fCCPVYd38whDoyyDbV4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=BPkAw4t247KaMC2pQYkLygaALAgeiXMFm8OGf1dMGJNBfk30my0Ijb7X50a8QvLwoOqgvOgiqd9BL+iiK30HzGoq+Jm6ymLxLz2SiLG4lWQfPrwIxyeq5ymWZa10HsJf7KQuaS/J0FHF3uAOcrqgqnrs/3wadfUaYuenKyb1qzw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=D51SjTTr; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="D51SjTTr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718419777; x=1749955777;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=5A2aSfJr1dck7ZP7SOEEUgE1fCCPVYd38whDoyyDbV4=;
  b=D51SjTTreoNmU5uTalM1euCOZsJUPIkyC9wUURUb9FJhHE64NG3tSsua
   tD8cCLpmgfk5w9pURvohCQn31kcgKO7jeY43GOM1msgBvApqKhh3UmTY+
   jnhdd+klRGgU1hkQllJJJjHcfhE/NPCUO/Q+Z/gNAWyfeLDsR0qHSRmXe
   NUYEZTvwvmdS+V4kuakNkfsh2qqSJtWJOFtz3ykchtwHav9A+z6w4kFIe
   /qE0ws3QwCO7tPOzMnH6RqyaOpK4I7XXJcKZMtbwaxdIHYAxX3tKhrU3d
   WuAF6OOhKvENSSfnlXbjGjBlrfengU6JeLQ6o5bf73sLikOTf/GVqjtHq
   Q==;
X-CSE-ConnectionGUID: 56czdkM1Tg2JsGBS5QzX3g==
X-CSE-MsgGUID: ni5MxNF5Tk2XFOs3B/EJGA==
X-IronPort-AV: E=McAfee;i="6700,10204,11103"; a="26749185"
X-IronPort-AV: E=Sophos;i="6.08,239,1712646000"; 
   d="scan'208";a="26749185"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jun 2024 19:49:36 -0700
X-CSE-ConnectionGUID: YJSGLH7oTlmZDOg20HdX8g==
X-CSE-MsgGUID: CfDzKM4wTwq3tblJM5kHsA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,239,1712646000"; 
   d="scan'208";a="45058073"
Received: from lkp-server01.sh.intel.com (HELO 9e3ee4e9e062) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 14 Jun 2024 19:49:35 -0700
Received: from kbuild by 9e3ee4e9e062 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sIJTx-00023s-1Q;
	Sat, 15 Jun 2024 02:49:33 +0000
Date: Sat, 15 Jun 2024 10:49:21 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Yang Yingliang <yangyingliang@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 17817/22937] drivers/edac/skx_common.o:
 warning: objtool: missing symbol for section .text
Message-ID: <202406151050.cbAafgsa-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   745a3c567e1c329d131a8896642475f3916d020a
commit: 0cfc819665b6124290e8d9ff7a52b8e0147eaa55 [17817/22937] Intel: EDAC, skx, i10nm: Make skx_common.c a pure library
config: x86_64-buildonly-randconfig-001-20240615 (https://download.01.org/0day-ci/archive/20240615/202406151050.cbAafgsa-lkp@intel.com/config)
compiler: gcc-9 (Ubuntu 9.5.0-4ubuntu2) 9.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240615/202406151050.cbAafgsa-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406151050.cbAafgsa-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/edac/skx_common.c: In function 'skx_mce_output_error':
   drivers/edac/skx_common.c:478:8: warning: variable 'type' set but not used [-Wunused-but-set-variable]
     478 |  char *type, *optype;
         |        ^~~~
   drivers/edac/skx_common.c: In function 'skx_get_dimm_info':
   drivers/edac/skx_common.c:317:72: warning: '_DIMM#' directive output may be truncated writing 6 bytes into a region of size between 0 and 9 [-Wformat-truncation=]
     317 |  snprintf(dimm->label, sizeof(dimm->label), "CPU_SrcID#%u_MC#%u_Chan#%u_DIMM#%u",
         |                                                                        ^~~~~~
   drivers/edac/skx_common.c:317:45: note: using the range [0, 4294967295] for directive argument
     317 |  snprintf(dimm->label, sizeof(dimm->label), "CPU_SrcID#%u_MC#%u_Chan#%u_DIMM#%u",
         |                                             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/edac/skx_common.c:317:2: note: 'snprintf' output between 31 and 53 bytes into a destination of size 32
     317 |  snprintf(dimm->label, sizeof(dimm->label), "CPU_SrcID#%u_MC#%u_Chan#%u_DIMM#%u",
         |  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     318 |    imc->src_id, imc->lmc, chan, dimmno);
         |    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/edac/skx_common.c: In function 'skx_get_nvdimm_info':
   drivers/edac/skx_common.c:365:72: warning: '_DIMM#' directive output may be truncated writing 6 bytes into a region of size between 0 and 9 [-Wformat-truncation=]
     365 |  snprintf(dimm->label, sizeof(dimm->label), "CPU_SrcID#%u_MC#%u_Chan#%u_DIMM#%u",
         |                                                                        ^~~~~~
   drivers/edac/skx_common.c:365:45: note: using the range [0, 4294967295] for directive argument
     365 |  snprintf(dimm->label, sizeof(dimm->label), "CPU_SrcID#%u_MC#%u_Chan#%u_DIMM#%u",
         |                                             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/edac/skx_common.c:365:2: note: 'snprintf' output between 31 and 53 bytes into a destination of size 32
     365 |  snprintf(dimm->label, sizeof(dimm->label), "CPU_SrcID#%u_MC#%u_Chan#%u_DIMM#%u",
         |  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     366 |    imc->src_id, imc->lmc, chan, dimmno);
         |    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/edac/skx_common.o: warning: objtool: missing symbol for section .text

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
