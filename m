Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 998DB242D86
	for <oe-kbuild-all@lists.linux.dev>; Tue, 21 Oct 2025 23:59:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761091142; cv=none; b=uFBxBXZWXj0bDA820IvsLVO8Zu0HTuyX+7T59hb5nrAUasyGstVR9sxG8p9mmdt6PrBQzobYI2MWC8UkVUN2/qQVvkqcRlmB0EnYr64qQE1ch+Og4aXU1TjXMNzHjVKbE5OJJRQrB1BnuGCH8mpXIjOv58fo+ukHXdFpdj/tLKg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761091142; c=relaxed/simple;
	bh=1ahH2eeysI4fi7fOatvEffiGpMUi7PGbwWW1WjR8iiA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=epuMoD59CssCeJSRvjrX0UDfJQM2IDpCtCstpgFDIShzfc//wTMJ+3Jvn7NBSg+9zx4kgXu0XCZ4/1lrf7tNZ6CF3/Mt5JOA7dOg5qBiBGb0TINfyT6emkT1Il9l+PT+WLBE9pgvHCcNMI8th1zqLuN8XdrDMa5I/i9ohRsF+78=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MCf5zO16; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MCf5zO16"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761091141; x=1792627141;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=1ahH2eeysI4fi7fOatvEffiGpMUi7PGbwWW1WjR8iiA=;
  b=MCf5zO162mvyQJ0DKfw+Pg/X220f6zwvD+gArLPRHcNn7wnKn1DG3uMd
   2ZebxmjMjf06ZTubMYKwd6rGCAb/1l1b04I/cY7YPeRLUEU+kP1NR/PF3
   vzZMmcGpIfeOuoQb86OGXSuW2P/kBMV1w2TMZd1bqnzyr4Txlb43yPySG
   VNFh4j3w6w6CP+1U8QapgOA4oVs2vHJCQlEQf+q6VUN2fXwC9EELJXcL7
   qkfYd/+wJ+FomRArX8D2S8itIcAi5beLJjXI09iR9MZuBGZf3oeKp2krv
   WIOO2PKoV7mT2Rh8HvVLjX/JCJR1PU4Xv5SWTYunZCoTuW6rYFkdMcG0H
   Q==;
X-CSE-ConnectionGUID: ontX0rsTRhO5NlQo0Uf7og==
X-CSE-MsgGUID: dAZCpQLgSsuMWXK9I0eoWw==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="63269029"
X-IronPort-AV: E=Sophos;i="6.19,246,1754982000"; 
   d="scan'208";a="63269029"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Oct 2025 16:59:00 -0700
X-CSE-ConnectionGUID: PE/Xh47TT2yw4KsHePbgrg==
X-CSE-MsgGUID: tIZDNFQnQEiFGDbguy582A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,246,1754982000"; 
   d="scan'208";a="183424983"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa007.fm.intel.com with ESMTP; 21 Oct 2025 16:58:59 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vBMFk-000BqT-36;
	Tue, 21 Oct 2025 23:58:56 +0000
Date: Wed, 22 Oct 2025 07:58:38 +0800
From: kernel test robot <lkp@intel.com>
To: Jim Cromie <jim.cromie@gmail.com>,
	=?utf-8?Q?=C5=81ukasz?= Bartosik <ukaszb@chromium.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jimc:dd-shrink-6a5 44/51] lib/dynamic_debug.c:1693:51: warning:
 shift count >= width of type
Message-ID: <202510220815.ZV6CURj1-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/jimc/linux.git dd-shrink-6a5
head:   a2f8b47e22fa6a1a9852e392166bc9adf45cc17d
commit: 027112748f47cdafe35ea0a28f410fc70d31e705 [44/51] dyndbg: optimized caching of dynamic prefixes
config: hexagon-randconfig-002-20251022 (https://download.01.org/0day-ci/archive/20251022/202510220815.ZV6CURj1-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 754ebc6ebb9fb9fbee7aef33478c74ea74949853)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251022/202510220815.ZV6CURj1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510220815.ZV6CURj1-lkp@intel.com/

All warnings (new ones prefixed by >>):

   lib/dynamic_debug.c:1360:10: warning: expression which evaluates to zero treated as a null pointer constant of type 'struct _ddebug_class_param *' [-Wnon-literal-null-conversion]
    1360 |                 return false;
         |                        ^~~~~
>> lib/dynamic_debug.c:1693:51: warning: shift count >= width of type [-Wshift-count-overflow]
    1693 |                ((unsigned long)prefix_flags(desc->flags) << DDEBUG_PREFIX_KEY_FLAGS_SHIFT);
         |                                                          ^  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   2 warnings generated.


vim +1693 lib/dynamic_debug.c

  1689	
  1690	static unsigned long ddebug_prefix_key(const struct _ddebug *desc)
  1691	{
  1692		return ((unsigned long)desc & DDEBUG_PREFIX_KEY_ADDR_MASK) |
> 1693		       ((unsigned long)prefix_flags(desc->flags) << DDEBUG_PREFIX_KEY_FLAGS_SHIFT);
  1694	}
  1695	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
