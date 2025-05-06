Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2754027FB1C
	for <oe-kbuild-all@lists.linux.dev>; Tue,  6 May 2025 12:21:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746534103; cv=none; b=ruRaZKPPXOPISvjIH89mhKUenEZbabKTsFtUCE5nzAXnGd9ldLxxcMm3TC7HQMC4AkBwbJMaDAqayVYQasETSsrOvhvUT4d4OGjJOs4vr+QUe0bG3W3nDMdpe+d6GN8XzaDFI/G9F7WcvQJetKOT/CaMaFhwUh83Iqh+vHB/xKo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746534103; c=relaxed/simple;
	bh=cRnp8PBOLGdjDAU9DbMmArRITpyJTs0gmqJEuG1SgJY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KBQdZT3ZUHQ74l4XG08Avs51z+01UYoJG1qdJSLUpsFB6ZRqCPDGsWW6IiJLF9lz4Ts9zKhvVz8huCeEEdkuiKpvnkLVNwsbzYgLiQfWlmeQ0w+TdbeBcY7C5k9VyFrDL6x8rB3xHg4SSvSt/wkqLD+xlP5aThb9FQ5B1tqFqNo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jN77n7aY; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jN77n7aY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746534100; x=1778070100;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=cRnp8PBOLGdjDAU9DbMmArRITpyJTs0gmqJEuG1SgJY=;
  b=jN77n7aYaEzDt4j/YzgVxQfOs8xwj4WfGtFyQSCqPHe0wP1J75WGoZF0
   sn62zMq+h/BW/h2K9LYrdxNwf/ndtRuIDoTY+XCvnwVUBDZt6nyQ85c1M
   tRU/8tvaVXDX64yNemfJN56tJdleHBYnS1C0uLH0+vufcc+sEJDAxQUFD
   RiTUrUy7nbPX0IPR2a6EBVZaJcf5bAloWbM3PAv0zA0IXY30Nzr6Hxlwb
   isNTjcezG3lyx32H2gCwFAU84Xd9W2X9j0EyUwHXKUUEYc2IsKTuKMbfr
   bnUe7VPE3JRFRC6I62v8oT9+MkEO72dh3BVC7o9CTWzwTeavfmQ6P2RCM
   Q==;
X-CSE-ConnectionGUID: sVjPncnDSGKcFP6/lur3Vg==
X-CSE-MsgGUID: AnFyD1MKQh6NDWGPO2w15A==
X-IronPort-AV: E=McAfee;i="6700,10204,11425"; a="35819423"
X-IronPort-AV: E=Sophos;i="6.15,266,1739865600"; 
   d="scan'208";a="35819423"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 May 2025 05:21:39 -0700
X-CSE-ConnectionGUID: 8MNmLvvETbeWvuRX0IMOBw==
X-CSE-MsgGUID: EFowLbLmS7azKEjtPzzO+A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,266,1739865600"; 
   d="scan'208";a="135508096"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 06 May 2025 05:21:37 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uCHIl-0006Y5-18;
	Tue, 06 May 2025 12:21:35 +0000
Date: Tue, 6 May 2025 20:20:51 +0800
From: kernel test robot <lkp@intel.com>
To: Kees Cook <kees@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH RFC 4/4] stackleak: Support Clang stack depth tracking
Message-ID: <202505061846.12FMyRjj-lkp@intel.com>
References: <20250502190129.246328-4-kees@kernel.org>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250502190129.246328-4-kees@kernel.org>

Hi Kees,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on arm64/for-next/core]
[also build test ERROR on soc/for-next linus/master v6.15-rc5]
[cannot apply to kees/for-next/hardening tip/x86/core next-20250505]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Kees-Cook/stackleak-Rename-CONFIG_GCC_PLUGIN_STACKLEAK-to-CONFIG_STACKLEAK/20250503-030310
base:   https://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git for-next/core
patch link:    https://lore.kernel.org/r/20250502190129.246328-4-kees%40kernel.org
patch subject: [PATCH RFC 4/4] stackleak: Support Clang stack depth tracking
config: um-allyesconfig (https://download.01.org/0day-ci/archive/20250506/202505061846.12FMyRjj-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250506/202505061846.12FMyRjj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505061846.12FMyRjj-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from <command-line>:
   drivers/nvme/host/pci.c: In function 'nvme_init':
>> include/linux/compiler_types.h:557:45: error: call to '__compiletime_assert_678' declared with attribute error: BUILD_BUG_ON failed: nvme_pci_npages_prp() > NVME_MAX_NR_ALLOCATIONS
     557 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |                                             ^
   include/linux/compiler_types.h:538:25: note: in definition of macro '__compiletime_assert'
     538 |                         prefix ## suffix();                             \
         |                         ^~~~~~
   include/linux/compiler_types.h:557:9: note: in expansion of macro '_compiletime_assert'
     557 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:39:37: note: in expansion of macro 'compiletime_assert'
      39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:50:9: note: in expansion of macro 'BUILD_BUG_ON_MSG'
      50 |         BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
         |         ^~~~~~~~~~~~~~~~
   drivers/nvme/host/pci.c:3804:9: note: in expansion of macro 'BUILD_BUG_ON'
    3804 |         BUILD_BUG_ON(nvme_pci_npages_prp() > NVME_MAX_NR_ALLOCATIONS);
         |         ^~~~~~~~~~~~


vim +/__compiletime_assert_678 +557 include/linux/compiler_types.h

eb5c2d4b45e3d2 Will Deacon 2020-07-21  543  
eb5c2d4b45e3d2 Will Deacon 2020-07-21  544  #define _compiletime_assert(condition, msg, prefix, suffix) \
eb5c2d4b45e3d2 Will Deacon 2020-07-21  545  	__compiletime_assert(condition, msg, prefix, suffix)
eb5c2d4b45e3d2 Will Deacon 2020-07-21  546  
eb5c2d4b45e3d2 Will Deacon 2020-07-21  547  /**
eb5c2d4b45e3d2 Will Deacon 2020-07-21  548   * compiletime_assert - break build and emit msg if condition is false
eb5c2d4b45e3d2 Will Deacon 2020-07-21  549   * @condition: a compile-time constant condition to check
eb5c2d4b45e3d2 Will Deacon 2020-07-21  550   * @msg:       a message to emit if condition is false
eb5c2d4b45e3d2 Will Deacon 2020-07-21  551   *
eb5c2d4b45e3d2 Will Deacon 2020-07-21  552   * In tradition of POSIX assert, this macro will break the build if the
eb5c2d4b45e3d2 Will Deacon 2020-07-21  553   * supplied condition is *false*, emitting the supplied error message if the
eb5c2d4b45e3d2 Will Deacon 2020-07-21  554   * compiler has support to do so.
eb5c2d4b45e3d2 Will Deacon 2020-07-21  555   */
eb5c2d4b45e3d2 Will Deacon 2020-07-21  556  #define compiletime_assert(condition, msg) \
eb5c2d4b45e3d2 Will Deacon 2020-07-21 @557  	_compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
eb5c2d4b45e3d2 Will Deacon 2020-07-21  558  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
