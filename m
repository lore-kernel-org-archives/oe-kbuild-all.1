Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29AC6258CCB
	for <oe-kbuild-all@lists.linux.dev>; Fri, 19 Sep 2025 02:15:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758248135; cv=none; b=HonttHKYTZdqsK4znLLHyhMy1TfZ0UatdYE+07zmmXRxRVED78gBNDxryo9hFXMbN59hHIBgBFqv8jP2if7MCgv8yNBTHWhSFKbHFHT1BlZ/8EQeTw0NYJ+uCgOwsVaYZMECllsw4S4sRUv8YmlKh9h1sXjDZla5m9+aamZispw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758248135; c=relaxed/simple;
	bh=IQZHFAK8PtveWRGnclQaHL18/vImOeLO7EDaNpus0I4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dfloaXJLq8rT33MI05PA/GVnDgy26TcNk1A+zjmy7wytZKgaIX6177sX2qrbx23FGB8qrvrV7cCie+k8jBbr+v3iO8cdyWyBBW9G8mZ2VinJZbby8L2Sd66bVXlw6TMp/G37ZThjv+BOkZQErNAxtz9jLEGnl/5mVb6hmnt5VB4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jbeU1aDy; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jbeU1aDy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758248133; x=1789784133;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=IQZHFAK8PtveWRGnclQaHL18/vImOeLO7EDaNpus0I4=;
  b=jbeU1aDyUbBU0czXw3Xxl1c3YH8V8pYXJtd8Kv3W+nlvSdmkzz04hpeP
   L9N+2i+L2i/uH4mHJa8JzRajisQjqLPCTv25oqjLyrYIw0kd0gbYXZNru
   /2xCuOkMv6QcDd47i9LWJ+93Or4lmjkTJJLf/E4HjG0KZir7JERWigV6I
   +0GHmBiUOpnAJ6zhcAphcRVgsEESt8y4AybatQ+1xLqZIEaXZauunhUu3
   Ektn0CXvpCtBf3vAg8Z2geWGwWVnWQtlqBUNXyUUooDgxyksVLQBenbij
   Snox5FVjHixF1YTuf3Y8sAej3Je04OFP/csy/OuLiOoUjXlvOnxuOwMVL
   g==;
X-CSE-ConnectionGUID: /glfKzfCRRa1M42aSGLkIw==
X-CSE-MsgGUID: eoVj2XsxTaGYmO5621UBtw==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="60539406"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="60539406"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Sep 2025 19:15:32 -0700
X-CSE-ConnectionGUID: zQrZnim8QG29tw9DKDrYyQ==
X-CSE-MsgGUID: Db9RlGbCTvmwuqClGMndMw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,276,1751266800"; 
   d="scan'208";a="174833926"
Received: from lkp-server01.sh.intel.com (HELO 84a20bd60769) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 18 Sep 2025 19:15:31 -0700
Received: from kbuild by 84a20bd60769 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uzQen-0003uP-0j;
	Fri, 19 Sep 2025 02:15:29 +0000
Date: Fri, 19 Sep 2025 10:14:43 +0800
From: kernel test robot <lkp@intel.com>
To: Jason Miu <jasonmiu@google.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC v1 2/4] kho: Adopt KHO page tables and remove serialization
Message-ID: <202509190904.5fDS4QJv-lkp@intel.com>
References: <20250917025019.1585041-3-jasonmiu@google.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250917025019.1585041-3-jasonmiu@google.com>

Hi Jason,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on rppt-memblock/for-next]
[also build test WARNING on linus/master v6.17-rc6]
[cannot apply to rppt-memblock/fixes akpm-mm/mm-everything next-20250918]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Jason-Miu/kho-Introduce-KHO-page-table-data-structures/20250917-105117
base:   https://git.kernel.org/pub/scm/linux/kernel/git/rppt/memblock.git for-next
patch link:    https://lore.kernel.org/r/20250917025019.1585041-3-jasonmiu%40google.com
patch subject: [RFC v1 2/4] kho: Adopt KHO page tables and remove serialization
config: x86_64-buildonly-randconfig-003-20250919 (https://download.01.org/0day-ci/archive/20250919/202509190904.5fDS4QJv-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250919/202509190904.5fDS4QJv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509190904.5fDS4QJv-lkp@intel.com/

All warnings (new ones prefixed by >>, old ones prefixed by <<):

>> WARNING: modpost: vmlinux: section mismatch in reference: kho_memblock_reserve+0x3d (section: .text) -> __memblock_reserve (section: .init.text)
>> WARNING: modpost: vmlinux: section mismatch in reference: kho_memblock_reserve+0x49 (section: .text) -> memblock_reserved_mark_noinit (section: .init.text)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
