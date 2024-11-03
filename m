Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9BA1AD21
	for <oe-kbuild-all@lists.linux.dev>; Sun,  3 Nov 2024 00:15:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730592906; cv=none; b=R9shm40NDlkF1nd0ALx5QUnFHB7YECVsdpmzBOPSJ5TKT0yLlwp/YERyngWIlwwEUwMzrUALhuoO+K9T34LcWNQpaer8A/2Xten+hf4mlXljPIGRmxwunTmH3bzRorrNLZSORV0cNBueT+o4E96BR7895qlZh2/jEMWHan8gDvw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730592906; c=relaxed/simple;
	bh=uEIXB5+YmparKf5BPzrdvX0KLzvggu55uYDCjyljm8s=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=GHkcqHDaOsrHK0ccfjVmSiB27orK3d4MRxCUF6eYJmtbIeIg0313luMQC0obIyvadduDCJBMAkBFcZqmPCaFb7uSfp3c8ooZ5WxgzbCo0DavrIgOSIR6IVHDzchLwm2fETSXY7w+uNQdt0WRZGYDtc0WXwfiKyptyMxn3ww6f7o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TL22JqJg; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TL22JqJg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730592904; x=1762128904;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=uEIXB5+YmparKf5BPzrdvX0KLzvggu55uYDCjyljm8s=;
  b=TL22JqJgIQur0PglOBSITPkniLBqkgrv3eA08GMky4TpTEbGzu0nxHui
   aTSxA7fN0GC0crAiGJLlLrtCFtJMnvufSyuJVDluzX6B4na5IgEG296SG
   BZ+LUCfMVllIw21L6QEHcgAxhB2moYRco8XfWGbEAmB7q8YYV7of0liMY
   U3rNqO06kL660YppDFAyDSqN+3CDFueD0ziS4jwmStAXbJsGXtD8M7T0X
   G5Eb9l6CLCyBj3OCpdvJWE+vsVlQJm0FvN5dEQu/7LxomwSe82ivYlFDa
   Gr9p0syDQHk384Q2Bue6mXvvJC89eEU1bcCoGa/UICLmCJk8Mhqvo0TP6
   Q==;
X-CSE-ConnectionGUID: xqlaSZKIQ+mhvfNZV8hatw==
X-CSE-MsgGUID: Q/LQ1t7+RuyKTloaePqksg==
X-IronPort-AV: E=McAfee;i="6700,10204,11244"; a="40898835"
X-IronPort-AV: E=Sophos;i="6.11,253,1725346800"; 
   d="scan'208";a="40898835"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Nov 2024 17:15:03 -0700
X-CSE-ConnectionGUID: KZkj/jmyR6aPTeFXypG4vw==
X-CSE-MsgGUID: WBuHXSbgSqaktPQcofOjFQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,253,1725346800"; 
   d="scan'208";a="87815812"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 02 Nov 2024 17:15:02 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t7OGi-000jUP-1l;
	Sun, 03 Nov 2024 00:15:00 +0000
Date: Sun, 3 Nov 2024 08:14:30 +0800
From: kernel test robot <lkp@intel.com>
To: Jiri Olsa <jolsa@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jolsa-perf:bpf/optimized_usdt_3 19/24]
 include/linux/uprobes.h:133:9: error: unknown type name 'refcount_t'
Message-ID: <202411030854.YMt4ZJDy-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jolsa/perf.git bpf/optimized_usdt_3
head:   2e0575143d13814d04f02a33a4110989ccdbf3a3
commit: dad4c7b2a8fb2c951d2b83ace0b4ad41de222cba [19/24] uprobes: Add mapping for optimized uprobe trampolines
config: arm-allmodconfig (https://download.01.org/0day-ci/archive/20241103/202411030854.YMt4ZJDy-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241103/202411030854.YMt4ZJDy-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411030854.YMt4ZJDy-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/arm/probes/uprobes/actions-arm.c:10:
   include/linux/uprobes.h:126:33: error: field 'tramp_mutex' has incomplete type
     126 |         struct mutex            tramp_mutex;
         |                                 ^~~~~~~~~~~
>> include/linux/uprobes.h:133:9: error: unknown type name 'refcount_t'
     133 |         refcount_t              ref;
         |         ^~~~~~~~~~

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for GET_FREE_REGION
   Depends on [n]: SPARSEMEM [=n]
   Selected by [m]:
   - RESOURCE_KUNIT_TEST [=m] && RUNTIME_TESTING_MENU [=y] && KUNIT [=m]


vim +/refcount_t +133 include/linux/uprobes.h

   128	
   129	struct tramp_area {
   130		unsigned long		vaddr;
   131		struct page		*page;
   132		struct hlist_node	node;
 > 133		refcount_t		ref;
   134	};
   135	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
