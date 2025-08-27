Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7610C1E8342
	for <oe-kbuild-all@lists.linux.dev>; Wed, 27 Aug 2025 07:22:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756279329; cv=none; b=HnqgMr2eFWQVH/WFI3rq+EkaC/d/Toi3ECSAYkBZOBvzIczReB860MLH5I6ipyTiRHWAP/G5Fza8HRSX6rob8yFHddBlW7RDfIg/EGq6k+hLCu7fjRInzuDZoTw/MGSvN/V0ejhijDaFnkOVfcVgcUPRQYqJpupjjpu0z8CTBJc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756279329; c=relaxed/simple;
	bh=zLMbNLpEcJl+0DRk/xqaQmh6ZrL/FDZprl4SiKjb5Tk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=DkcWMpInzXjfNF1KF+xNwOCb1OxSTpNeLC15mlbg6qObw6FvVFR5dStt1dEBCB39KThWIs4l9iFtEltoruqj3bl6HQ86+zy89i/W0wEoZNbfjyCHhSf26tZFByQcO0MzVyY+VUgNERxvNG94lhuMbZhKgb2B8VmYaglGlBi22pY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hvw3roDn; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hvw3roDn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756279327; x=1787815327;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=zLMbNLpEcJl+0DRk/xqaQmh6ZrL/FDZprl4SiKjb5Tk=;
  b=hvw3roDn3J3XNXjAZ5SzXTT9spkAWW36bJu3Mar2qwvHOdLnp0ivhDPY
   5C5nqSt8k+uE42SEvwo2Bpnqj/4c9mlNI0qlo15kBWX9Q8u/El1D77JS4
   AX4reUQ2mUlrPWc5V2U1AkzvAdU80IDR7P7mFCXrg5BpnL0yX/ouBdgd9
   7wjtdUi6+wcrNXrZzIZ7V91E7R6lxV2MUFlIWJBhZBqJ4jtyygu+OPmqR
   VySzz0nIoW9hFLGMZA0WDAK81E6E+OLgJYlC5/TXLNLxDc/yoTZRvJNoj
   9c4vCVKCyEqdPXtYHufGcBouqXDeAVUZPrbzWKd7oVE0WNpdQOVRZtLoe
   g==;
X-CSE-ConnectionGUID: 1/YwCg/8SdWhIrYAxv9pbw==
X-CSE-MsgGUID: a5D3U6npRY6o3QyXY0fTrw==
X-IronPort-AV: E=McAfee;i="6800,10657,11534"; a="58461081"
X-IronPort-AV: E=Sophos;i="6.18,214,1751266800"; 
   d="scan'208";a="58461081"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Aug 2025 00:22:07 -0700
X-CSE-ConnectionGUID: +tCroVIVTn6ugqwz7PIePw==
X-CSE-MsgGUID: 5TF7AwWITguHanjZKbRKNg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,214,1751266800"; 
   d="scan'208";a="193423349"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by fmviesa002.fm.intel.com with ESMTP; 27 Aug 2025 00:22:05 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1urATr-000Sln-1h;
	Wed, 27 Aug 2025 07:22:03 +0000
Date: Wed, 27 Aug 2025 15:21:07 +0800
From: kernel test robot <lkp@intel.com>
To: Jim Cromie <jim.cromie@gmail.com>,
	=?utf-8?Q?=C5=81ukasz?= Bartosik <ukaszb@chromium.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jimc:dd-classmap-fix-v4i 58/65] kernel/module/main.c:2696:17:
 error: dereferencing pointer to incomplete type 'struct _ddebug_class_map'
Message-ID: <202508271511.a3ULKEB0-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/jimc/linux.git dd-classmap-fix-v4i
head:   009dc85942290aa1a54fcb1f4ccebade74aa1fa8
commit: 1f1e51f3a3c29c117e6a9f2f494018217d3b0cff [58/65] dyndbg: add stub defns for DYNAMIC_DEBUG_CLASSMAP_* macros
config: s390-randconfig-002-20250827 (https://download.01.org/0day-ci/archive/20250827/202508271511.a3ULKEB0-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250827/202508271511.a3ULKEB0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508271511.a3ULKEB0-lkp@intel.com/

All errors (new ones prefixed by >>):

   kernel/module/main.c: In function 'find_module_sections':
>> kernel/module/main.c:2696:17: error: dereferencing pointer to incomplete type 'struct _ddebug_class_map'
             sizeof(*mod->dyndbg_info.maps.start),
                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> kernel/module/main.c:2699:17: error: dereferencing pointer to incomplete type 'struct _ddebug_class_user'
             sizeof(*mod->dyndbg_info.users.start),
                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +2696 kernel/module/main.c

3d6e44623841c8 kernel/module/main.c Jeremy Kerr      2022-07-09  2684  
811d66a0e1e999 kernel/module.c      Rusty Russell    2010-08-05  2685  	mod->extable = section_objs(info, "__ex_table",
811d66a0e1e999 kernel/module.c      Rusty Russell    2010-08-05  2686  				    sizeof(*mod->extable), &mod->num_exentries);
811d66a0e1e999 kernel/module.c      Rusty Russell    2010-08-05  2687  
49668688dd5a5f kernel/module.c      Rusty Russell    2010-08-05  2688  	if (section_addr(info, "__obsparm"))
bddb12b32f90c5 kernel/module.c      Andrew Morton    2013-11-12  2689  		pr_warn("%s: Ignoring obsolete parameters\n", mod->name);
811d66a0e1e999 kernel/module.c      Rusty Russell    2010-08-05  2690  
7deabd67498869 kernel/module/main.c Jason Baron      2023-03-03  2691  #ifdef CONFIG_DYNAMIC_DEBUG_CORE
1b3696e5264aa4 kernel/module/main.c Jim Cromie       2024-10-19  2692  	mod->dyndbg_info.descs.start = section_objs(info, "__dyndbg_descriptors",
1b3696e5264aa4 kernel/module/main.c Jim Cromie       2024-10-19  2693  						    sizeof(*mod->dyndbg_info.descs.start),
1b3696e5264aa4 kernel/module/main.c Jim Cromie       2024-10-19  2694  						    &mod->dyndbg_info.descs.len);
1b3696e5264aa4 kernel/module/main.c Jim Cromie       2024-10-19  2695  	mod->dyndbg_info.maps.start = section_objs(info, "__dyndbg_class_maps",
1b3696e5264aa4 kernel/module/main.c Jim Cromie       2024-10-19 @2696  						   sizeof(*mod->dyndbg_info.maps.start),
1b3696e5264aa4 kernel/module/main.c Jim Cromie       2024-10-19  2697  						   &mod->dyndbg_info.maps.len);
062032b7b6dd3b kernel/module/main.c Jim Cromie       2022-12-21  2698  	mod->dyndbg_info.users.start = section_objs(info, "__dyndbg_class_users",
062032b7b6dd3b kernel/module/main.c Jim Cromie       2022-12-21 @2699  						   sizeof(*mod->dyndbg_info.users.start),
062032b7b6dd3b kernel/module/main.c Jim Cromie       2022-12-21  2700  						   &mod->dyndbg_info.users.len);
7deabd67498869 kernel/module/main.c Jason Baron      2023-03-03  2701  #endif
eb3057df732c30 kernel/module.c      Frantisek Hrbata 2013-10-14  2702  
eb3057df732c30 kernel/module.c      Frantisek Hrbata 2013-10-14  2703  	return 0;
f91a13bb99b739 kernel/module.c      Linus Torvalds   2010-08-05  2704  }
f91a13bb99b739 kernel/module.c      Linus Torvalds   2010-08-05  2705  

:::::: The code at line 2696 was first introduced by commit
:::::: 1b3696e5264aa4edab732ea66de90a2fdefdfbe4 dyndbg,module: make proper substructs in _ddebug_info

:::::: TO: Jim Cromie <jim.cromie@gmail.com>
:::::: CC: Jim Cromie <jim.cromie@gmail.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
