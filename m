Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 151C63AC1C
	for <oe-kbuild-all@lists.linux.dev>; Mon,  4 Aug 2025 17:14:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754327666; cv=none; b=sRPfiIb4u7NbDy46pcJVBLbeTGXd4Vg7QFP+YoKAxhHgSBvzKJAcbDdEmtz9zCQxG/AbASQrTyHsuIJiYC3X3ZN/rBdS98KlT8geb8REYiyK5Yhg5DD4A2MwfEcp+YVFmI7hTv2D5tcvynTJF/XKpBQkmv/68v3GwVM/jm+3lZE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754327666; c=relaxed/simple;
	bh=UgexuOY1XcLShJ2HQB4gwSZQ4fB8pNQpLLry18c9STM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=VM0aLJ3aSjNA2dQ1HqnCQolWV6RVmQtsnDBwfHUEz7luGaVm3/4VikeIhwpIdPAdhzs6nMT2KfSv/zDI5ttAoynpZq68Xr8dz2bxkkYLeTB6SeWL8q16jf01WmTrxM7p9uacd4rtpXNLMY/XpNVGRpDwqjMdo3bOaZCYqZ+BgN4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=U8XvgcYM; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="U8XvgcYM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754327665; x=1785863665;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=UgexuOY1XcLShJ2HQB4gwSZQ4fB8pNQpLLry18c9STM=;
  b=U8XvgcYM/qbsz6SyHMtvdyc5g0BbGIIHYh3EC9Hyz2ZEjtuhM7hmXthH
   +Y0/6dzjOJ+9L1CgeUBqhIuuXOx3iyF77RqnRiaR6JY5u9b0HKmkT34ym
   QoqBAMlf4a96h7KJcfpmxXo0XEoEdwY0lxDXvx5Fg1l/zG0msY7dI/ECs
   5niSsGujOwKVgMESDlLUxStH7KQiacy4nawwIScBxbSlyH4dh/O88YHr1
   rdFQJw/rcqVVPStr+DIxmZHi2+ndbsJvBfFN1+qQPTJHz17fj9WjL1fXf
   qUd6AACHOjH8zp+yngKMI0tYQ6Y9SRQiABUf2oTT+GivCuDSP20n4Ee+6
   Q==;
X-CSE-ConnectionGUID: XYOKFIZqTISHBJWyPeicnQ==
X-CSE-MsgGUID: PTDqySRdT32+FvB8PtwuFA==
X-IronPort-AV: E=McAfee;i="6800,10657,11512"; a="60431145"
X-IronPort-AV: E=Sophos;i="6.17,258,1747724400"; 
   d="scan'208";a="60431145"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Aug 2025 10:14:25 -0700
X-CSE-ConnectionGUID: AE/99b3zShWnnWIY0gQ0WA==
X-CSE-MsgGUID: KxRy58RWSk+OkHLbwlwYmg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,258,1747724400"; 
   d="scan'208";a="164613898"
Received: from igk-lkp-server01.igk.intel.com (HELO b3b7d4258b7c) ([10.91.175.65])
  by fmviesa009.fm.intel.com with ESMTP; 04 Aug 2025 10:14:23 -0700
Received: from kbuild by b3b7d4258b7c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uiylR-0001p5-1c;
	Mon, 04 Aug 2025 17:14:21 +0000
Date: Mon, 4 Aug 2025 19:13:35 +0200
From: kernel test robot <lkp@intel.com>
To: elver@google.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [melver:cap-analysis/dev 29/34] WARNING: modpost: EXPORT symbol
 "rhashtable_insert_slow" [vmlinux] version generation failed, symbol will
 not be versioned.
Message-ID: <202508041921.OrjN5TvW-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/melver/linux.git cap-analysis/dev
head:   84b025a0f61636d7599b175d0a8186de719087e4
commit: b8cbb419251f38f6c7c8a75e2b146a03004e87a8 [29/34] rhashtable: Enable capability analysis
config: mips-bmips_stb_defconfig (https://download.01.org/0day-ci/archive/20250804/202508041921.OrjN5TvW-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project faa4c4c2dc804c31845d8f036345fac00e016f2d)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250804/202508041921.OrjN5TvW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508041921.OrjN5TvW-lkp@intel.com/

All warnings (new ones prefixed by >>, old ones prefixed by <<):

>> WARNING: modpost: EXPORT symbol "rhashtable_insert_slow" [vmlinux] version generation failed, symbol will not be versioned.
Is "rhashtable_insert_slow" prototyped in <asm/asm-prototypes.h>?
>> WARNING: modpost: EXPORT symbol "rhashtable_walk_start_check" [vmlinux] version generation failed, symbol will not be versioned.
Is "rhashtable_walk_start_check" prototyped in <asm/asm-prototypes.h>?

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
