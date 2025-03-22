Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C1518BF8
	for <oe-kbuild-all@lists.linux.dev>; Sat, 22 Mar 2025 05:58:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742623116; cv=none; b=uRRo3LiO67cnvMl/BIGTWSZbOcEAR5ROwomkc19PxK7UQHzELFT2LSkGWFfu0rDUXG5xm/bUY+iwE+D2oSNIuBaEwE9CNcpuE/rSb1VQv0fzyHv4Uoay4NynT1GtKdTa/JZiR4qc9JIuV87QsHUIurzsjwm/1piVruJZqVui42c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742623116; c=relaxed/simple;
	bh=uM1fJqWsDkhyZllQ99rXZ7PfmXNjyOwHADNIh+YQBOQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=JLWYBJ6ug2jRKF1drHbyjbpEyTdm9/9slbj8BsLcvR+fNFkOZQobw5cpjBBe17rb/iMSSRdIgFVzJy8X0SkczMe3CVliP25dJempiKQvvA5vudW7IRO7c2v2QIvkWMRbeMawOZRwFV0PzssKN9mntJlIPMnOFBu+eG6EzqWPyIg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=X65u77uE; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="X65u77uE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1742623115; x=1774159115;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=uM1fJqWsDkhyZllQ99rXZ7PfmXNjyOwHADNIh+YQBOQ=;
  b=X65u77uEnJXnW7OtbuYXmV/qH1SqiwZHrSxeEG0ECnBdIQYvwZFxWlZ0
   gtRhVivSKfx1rPSojBEOlis7WU6K4li1osq98FTtUu96izoPCB+ZHMpIQ
   7rKF7xNbidLkcTdMmBSOK96Dh5PjugzB6vf9wZ47Daf/EGTJXUMhyGI87
   s/TkzKMhaeoNL/YgNeC3Xiqff2lRP2wDODoe8yrAJP02LbWqQPssozA6T
   oY5WUiLq42OZmQHRbuQgvgZ3CyPKpdELnrSuWbRlFVfa8bavey0q3rPMs
   h0MYSNHZQsMU3HSv+yYK6Milfa60FryH1A9317fMiY9zUVxs5tbaic6QI
   g==;
X-CSE-ConnectionGUID: zsm0GzdvTsG4DYL0IpcCeA==
X-CSE-MsgGUID: +WrGJhQZQT6Fb1K3Bjw1pQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11380"; a="47548985"
X-IronPort-AV: E=Sophos;i="6.14,266,1736841600"; 
   d="scan'208";a="47548985"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Mar 2025 22:58:34 -0700
X-CSE-ConnectionGUID: Dj8O5SwwQuqlus87Rw6+Yw==
X-CSE-MsgGUID: 4VlxdGYwQ+OdNJJgwcaehA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,266,1736841600"; 
   d="scan'208";a="124107120"
Received: from lkp-server02.sh.intel.com (HELO e98e3655d6d2) ([10.239.97.151])
  by orviesa007.jf.intel.com with ESMTP; 21 Mar 2025 22:58:33 -0700
Received: from kbuild by e98e3655d6d2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tvrsM-0001y7-0v;
	Sat, 22 Mar 2025 05:58:30 +0000
Date: Sat, 22 Mar 2025 13:58:19 +0800
From: kernel test robot <lkp@intel.com>
To: Jim Cromie <jim.cromie@gmail.com>,
	=?utf-8?Q?=C5=81ukasz?= Bartosik <ukaszb@chromium.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jimc:_r8 67/69] include/linux/dynamic_debug.h:558:51: error:
 'counted_by' argument must be a simple declaration reference
Message-ID: <202503221321.I4npEwPW-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/jimc/linux.git _r8
head:   8cd9e8322a409930af5fd18e7a92094265a8bf67
commit: eca29da9bb4ccd69662c988ca00bd68f78bec28b [67/69] dyndbg: add,use _ddebug_descriptors_vector
config: riscv-randconfig-002-20250322 (https://download.01.org/0day-ci/archive/20250322/202503221321.I4npEwPW-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project c2692afc0a92cd5da140dfcdfff7818a5b8ce997)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250322/202503221321.I4npEwPW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503221321.I4npEwPW-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/riscv/kernel/asm-offsets.c:10:
   In file included from include/linux/ftrace.h:13:
   In file included from include/linux/kallsyms.h:14:
   In file included from include/linux/module.h:30:
>> include/linux/dynamic_debug.h:558:51: error: 'counted_by' argument must be a simple declaration reference
     558 |         struct _ddebug descriptors[] __counted_by(header.num_descs);
         |                                                   ^~~~~~~~~~~~~~~~
   include/linux/compiler_types.h:346:62: note: expanded from macro '__counted_by'
     346 | # define __counted_by(member)           __attribute__((__counted_by__(member)))
         |                                                                       ^~~~~~
   1 error generated.
   make[3]: *** [scripts/Makefile.build:102: arch/riscv/kernel/asm-offsets.s] Error 1 shuffle=1372271065
   make[3]: Target 'prepare' not remade because of errors.
   make[2]: *** [Makefile:1269: prepare0] Error 2 shuffle=1372271065
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:251: __sub-make] Error 2 shuffle=1372271065
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:251: __sub-make] Error 2 shuffle=1372271065
   make: Target 'prepare' not remade because of errors.


vim +/counted_by +558 include/linux/dynamic_debug.h

   544	
   545	/*
   546	 * invoked by lib/dynamic_debug.c to create the header record
   547	 * need something similar done for modules.
   548	 */
   549	#define DYNAMIC_DEBUG_DESCRIPTORS_HEADER(_ID_)			\
   550		static struct _ddebug_header  __aligned(8) __used	\
   551		__section(".gnu.linkonce.__dyndbg_descriptors")		\
   552			descs_anchor = {				\
   553			.uplink = NULL,	._id = _ID_ }
   554	
   555	
   556	struct _ddebug_descriptors_vector {
   557	        struct _ddebug_header header;
 > 558	        struct _ddebug descriptors[] __counted_by(header.num_descs);
   559	};
   560	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
