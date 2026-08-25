Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEEFA33A70A
	for <oe-kbuild-all@lists.linux.dev>; Tue, 25 Aug 2026 16:01:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787673712; cv=none; b=H5IOrwrk1JpeknJA7I9qbRF/8ZrkMuJLlSV/K6+ZKtWt/eS0ab+3WBF0FboKsTlBRbVpNawUURoivCWy0UWv22nalXgWmva6EIbJo9cfnqYywBN3jwAfG0aCTaq6t+DwShxwhsFIvDe5kZRjSAzrf8z13MtOvGVqDxVhI1x9Gao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787673712; c=relaxed/simple;
	bh=rAJbpU6gJc2AONA3wrofFqhh8FfSbI/eet5SZx1PWUE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=Poga+9oenLHA9/mO1pBry0QLvmX53XY4Id4MEmIVH2o6UVulPhlDLkiAynfZWqM3Hb/hOLRYaOP4Bc/c4mksNvPswHM2oP/ghfSOTKpgjzAN+uMJwVnVK0jJlgtJ8LPYldqx4zPaD2mEpj6S16M/8wQLqDVI3OfeCysXHmM3a1E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bfxipTht; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bfxipTht"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787673711; x=1819209711;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=rAJbpU6gJc2AONA3wrofFqhh8FfSbI/eet5SZx1PWUE=;
  b=bfxipThtir18aKA7MmxRQcHn0hhLtIk96IzXFtSQO1/YOGo2pXi9kczf
   Q3Q7OZvFYSGtN7lMBsVfNuCgDdx0sxjlsaE4hFyuxuXoJgXYNTShwoAsM
   miOc3C8cwFNw8C5am4MgQLru9YD7p0YhYv6nEEnySNHVruPS2VGa5Zy3Y
   Jy0iGqkyRyEa51HZZdwTfYkQc8bWnnmgCPmnWmCIaB2bJyu3T+kL54Bk0
   upTyoCQwISMp0wjIgafjLKITUPdCKwyUg56laHjpB9rpeQe9FxI71exB+
   iE3ZqMPeNz2yATVYQ7w0t0zUwJYckyiMYnXXtlLC4x1YLiyLfYl9fOCgd
   Q==;
X-CSE-ConnectionGUID: B7wC4GsYQEu3T61MWFbbJw==
X-CSE-MsgGUID: qs3JcHabSHW7MzxRgyZZFw==
X-IronPort-AV: E=McAfee;i="6800,10657,11886"; a="75682040"
X-IronPort-AV: E=Sophos;i="6.25,243,1779174000"; 
   d="scan'208";a="75682040"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Aug 2026 09:01:50 -0700
X-CSE-ConnectionGUID: 50HQruoXS/CdwStXQ9okBQ==
X-CSE-MsgGUID: z2aqqBktQqGyxJzvYPs0Rg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,243,1779174000"; 
   d="scan'208";a="264706885"
Received: from lkp-server01.sh.intel.com (HELO 3532383e6126) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 25 Aug 2026 09:01:49 -0700
Received: from kbuild by 3532383e6126 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wytar-0000000063n-0Od7;
	Tue, 25 Aug 2026 16:01:45 +0000
Date: Wed, 26 Aug 2026 00:01:13 +0800
From: kernel test robot <lkp@intel.com>
To: Jim Cromie <jim.cromie@gmail.com>,
 =?utf-8?Q?"=C5=81ukasz?= Bartosik" <ukaszb@chromium.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jimc:scratchpad-v10 12/14] kernel/bpf/syscall.c:2066:1:
 sparse: sparse: symbol 'batch_ENABLE_KEY' was not declared. Should it be
 static?
Message-ID: <202608252318.PDYxPq71-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

tree:   https://github.com/jimc/linux.git scratchpad-v10
head:   45e5e0071e4ad7afee159e8cbe6cbe50c8db61d0
commit: fb64a69b9c601ac8e03f211ad8af9ab8df902cd6 [12/14] bpf/syscall: Route generic_map_update_batch key/value allocations to scratchpad
config: hexagon-randconfig-r133-20260825 (https://download.01.org/0day-ci/archive/20260825/202608252318.PDYxPq71-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260825/202608252318.PDYxPq71-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608252318.PDYxPq71-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> kernel/bpf/syscall.c:2066:1: sparse: sparse: symbol 'batch_ENABLE_KEY' was not declared. Should it be static?

vim +/batch_ENABLE_KEY +2066 kernel/bpf/syscall.c

  2065	
> 2066	DEFINE_SCRATCHPAD_PARAM(batch,
  2067				"Toggle BPF generic map update batch scratchpad");
  2068	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
