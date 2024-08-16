Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75CAD78C76
	for <oe-kbuild-all@lists.linux.dev>; Fri, 16 Aug 2024 04:14:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723781683; cv=none; b=bdxBMitKtodnMPowZJBoif8FsT/1Guxfmdi8VegTiCB9LFfqZArBy1wHc2yzOxvxQB3HAWD0321XsEwpQbG4+IsocJwwTAFHD/7Z5oMdjEhZD8wwBoxmTEd4bOODxrY89Ksgu0NdpBufy747Yalm0XKrJQbB+2JhSwU1kJEdNWU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723781683; c=relaxed/simple;
	bh=FQ4W94WvtJ8bkRsKSNHu9GQIiMXyTazOmVOWct5gzlQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=TUUx91/U3qh56++4av/5206cAj2r0D/W08lqlrFpgkriUVzCSJTt+Y2BmOO7fzvZJFQwq8Pk5Owkki2z0zBQ1y/uVqdpnxTsMJhi1QQ43ZE4GzKvxVZKRE1I3iK8/Tjy0qTELKZXS5o14DmXIaOnRBZUsth4ydadVuKMb18tD+8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eHcQIGwL; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eHcQIGwL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723781682; x=1755317682;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=FQ4W94WvtJ8bkRsKSNHu9GQIiMXyTazOmVOWct5gzlQ=;
  b=eHcQIGwLW0LFI5x1AufRtCmx4aqbP5XjIqudiFLVzokeqVwQXG9jWCUR
   8G/XGo6nmOah4clu0l8CiecrtllkPAq4tfyk1hl1tsmVcr67CswSgl/Qv
   1sH0O0cgNp3TX8WGcaEV4hgI3Qn6oQ74ZwGqIfJWzWKkOx4P7pBDpCZ/D
   CyRe0azJ3LLEuvQF6/OS+QxrsIdbKDNySK2CmSgxGInPhK91N6nuYDgSX
   7lNvGpJXroKlB6qYmKTkqrQfpvzqg6euYzzu8Q4z7JMXest+85hwaki1n
   +Q8QWlvtCIe3gPjUflScxYdnQLQ2gbRF6kll2lf1QTpy1dsShObVKNcFk
   A==;
X-CSE-ConnectionGUID: n4jF7eWDQyKQfQi1yOaAqA==
X-CSE-MsgGUID: TGCT1ZR9Rh+s5dW16tqxRw==
X-IronPort-AV: E=McAfee;i="6700,10204,11165"; a="21883949"
X-IronPort-AV: E=Sophos;i="6.10,150,1719903600"; 
   d="scan'208";a="21883949"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Aug 2024 21:14:41 -0700
X-CSE-ConnectionGUID: dkBEYQIRQKSIRSNYCWWj+Q==
X-CSE-MsgGUID: X47RcuYLSH2LK+3Tf4lMYA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,150,1719903600"; 
   d="scan'208";a="63968637"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 15 Aug 2024 21:14:39 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1seoMH-0005xa-1a;
	Fri, 16 Aug 2024 04:14:37 +0000
Date: Fri, 16 Aug 2024 12:13:37 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Xie XiuQi <xiexiuqi@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 9263/23498]
 drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dml1_display_rq_dlg_calc.o:
 warning: objtool: dml1_rq_dlg_get_dlg_params()+0x2f1c: unreachable
 instruction
Message-ID: <202408161225.VySIKip3-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   c75f813072b1d42cc638d175e1a8e84835f383ee
commit: f25433cb156a967d9b426ebaadf197c2369398e7 [9263/23498] drm/amd/display: readd -msse2 to prevent Clang from emitting libcalls to undefined SW FP routines
config: x86_64-randconfig-104-20240816 (https://download.01.org/0day-ci/archive/20240816/202408161225.VySIKip3-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240816/202408161225.VySIKip3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408161225.VySIKip3-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dml1_display_rq_dlg_calc.c:26:
   In file included from drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dml1_display_rq_dlg_calc.h:29:
   In file included from drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dml_common_defs.h:29:
   In file included from drivers/gpu/drm/amd/amdgpu/../display/dc/dm_services.h:35:
   In file included from drivers/gpu/drm/amd/amdgpu/../display/dc/dm_services_types.h:29:
   In file included from drivers/gpu/drm/amd/amdgpu/../display/dc/os_types.h:31:
   In file included from include/drm/drmP.h:62:
   In file included from arch/x86/include/asm/pgalloc.h:7:
   include/linux/pagemap.h:401:21: warning: cast from 'int (*)(struct file *, struct page *)' to 'filler_t *' (aka 'int (*)(void *, struct page *)') converts to incompatible function type [-Wcast-function-type-strict]
     401 |         filler_t *filler = (filler_t *)mapping->a_ops->readpage;
         |                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   1 warning generated.
>> drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dml1_display_rq_dlg_calc.o: warning: objtool: dml1_rq_dlg_get_dlg_params()+0x2f1c: unreachable instruction

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
