Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46A6B243392
	for <oe-kbuild-all@lists.linux.dev>; Sun,  9 Feb 2025 12:02:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739102564; cv=none; b=kb7fa1fm9Y6g1Q1lp/xXNhA0srM4egW3f5V6HXYM38m1W86GkHlI7Q4g/XIN15wJF+TF0dLS6ul6rxnBoTdmgxn5fsuVRmoszoFCbEMc4/ed295O3gu3obL8/xp21HKfK7KIST/zJfZK4jnfi0VBOXNPG3HLMVM9tJ5ES11gh0Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739102564; c=relaxed/simple;
	bh=91Xo4ogC/DHzA7wBOF8SSGg3fut5XxSi29POMtAmGFc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=D8Fb1ClO2c7/qfK5dkskMwnp8AtXZZ8tNPdImdMskSI3P7/B60vSDCtyJPaUsErbj/hscPbG623mVSksUtH10THQ2CmpzEbB6dYL/v/lm1HanwyzKp1n6VjO/k/TuR307e1m5ThAcv4rtsrnEjjPRJHuE4SLfOp5dfiE5vED/TE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TbxHvVbL; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TbxHvVbL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739102562; x=1770638562;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=91Xo4ogC/DHzA7wBOF8SSGg3fut5XxSi29POMtAmGFc=;
  b=TbxHvVbLSrcE9SSZGeXRvqwL7Sx4vtlmke8kwT8YmAU9N6oRvEQiKd8z
   5oKYSsmG2pj0wE1Xt103GxbJqvh9/kp0uLD0/BsNlrMYoQLIdzYVsJN4+
   Z/w/E96JguakIo6zV3dKPP9wK5P3YJWiM+EqWyZxGVM5FELZW6H+DCQn0
   1n3jC6y9h1ee2YD/MDhDwvyQLUG6dKDyLP6og2kkj/MjryrERDt/uCCaL
   qUy2UNEyad0z9OyNpFjjdlFPFFel3UuCP6dGzcpZSbTL5oqIiqIshwSbI
   Tb2VjkiDc7Et7CVQpFyd2DyUYKWnMR4h2rCTBrueUpBrzFMUcrdFf2BWy
   Q==;
X-CSE-ConnectionGUID: cuWWnS5ZQRKWFKkjvmwQjw==
X-CSE-MsgGUID: LqRH87obQm+bGztu5D8ECg==
X-IronPort-AV: E=McAfee;i="6700,10204,11340"; a="38927853"
X-IronPort-AV: E=Sophos;i="6.13,272,1732608000"; 
   d="scan'208";a="38927853"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Feb 2025 04:02:41 -0800
X-CSE-ConnectionGUID: kW4yVd8hRjW39OeetQoZmw==
X-CSE-MsgGUID: 8//UHHdzR66C68479DzS4Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="116546117"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 09 Feb 2025 04:02:40 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1th61G-0011QR-0i;
	Sun, 09 Feb 2025 12:02:38 +0000
Date: Sun, 9 Feb 2025 20:02:28 +0800
From: kernel test robot <lkp@intel.com>
To: Alexander Graf <graf@amazon.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>,
	"Mike Rapoport (Microsoft)" <rppt@kernel.org>
Subject: [akpm-mm:mm-unstable 161/165] WARNING: modpost: vmlinux: section
 mismatch in reference: kho_reserve_scratch+0x78 (section: .text.unlikely) ->
 scratch_size (section: .init.text)
Message-ID: <202502092027.4etZOLjv-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-unstable
head:   8bf30f9d23eb5040d37e6e712789cee8e71e1577
commit: 1fb6c647dcd16c42a235b9d12453798609dbd08e [161/165] arm64: add KHO support
config: arm64-randconfig-r051-20250209 (https://download.01.org/0day-ci/archive/20250209/202502092027.4etZOLjv-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250209/202502092027.4etZOLjv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502092027.4etZOLjv-lkp@intel.com/

All warnings (new ones prefixed by >>, old ones prefixed by <<):

>> WARNING: modpost: vmlinux: section mismatch in reference: memmap_init_kho_scratch_pages+0x110 (section: .text) -> init_deferred_page (section: .init.text)
>> WARNING: modpost: vmlinux: section mismatch in reference: kho_reserve_scratch+0x64 (section: .text.unlikely) -> memblock_alloc_try_nid (section: .init.text)
>> WARNING: modpost: vmlinux: section mismatch in reference: kho_reserve_scratch+0x78 (section: .text.unlikely) -> scratch_size (section: .init.text)
>> WARNING: modpost: vmlinux: section mismatch in reference: kho_reserve_scratch+0x8c (section: .text.unlikely) -> memblock_phys_alloc_range (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: kho_reserve_scratch+0x114 (section: .text.unlikely) -> scratch_size (section: .init.text)
>> WARNING: modpost: vmlinux: section mismatch in reference: kho_reserve_scratch+0x130 (section: .text.unlikely) -> memblock_alloc_range_nid (section: .init.text)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
