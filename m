Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32A0F352C54
	for <oe-kbuild-all@lists.linux.dev>; Fri, 12 Jun 2026 05:46:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781243201; cv=none; b=Pempn5qoYql45iIIY5LGaTZYIvDE5qZBgkxETgu4Sunnbd9GLMhql60LZb/vJByRDzUUr7kE+uINrfPmYiL7fER5s3jIQekecC5ga17QQWg6ZRNGubmwgW4DpsLld0IFI/drRezrQwJaQbVtXVbZ1UBSjHX9SrvKOMnufek7QHk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781243201; c=relaxed/simple;
	bh=KaA366UF8HyTXkjqDa9pvzv1rGq0sZL+FOYgv4qd85A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KuRK6VRr+ogggoTznKTGUzYJUCEnybFGaXel1PtM5kFTbU17hZXFYcRUDY4JpkrtaruASYgGNM9RgcnGX8mWWabz/Xvyh5rajdbOv+FP5uekMNRsXT8qt+ukWnD/xro0V8dSwXxnB1Kw/Z2ctHeE4NHW003Qm1CLgbyeIKYAgOI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LYJsA5sT; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LYJsA5sT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781243200; x=1812779200;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=KaA366UF8HyTXkjqDa9pvzv1rGq0sZL+FOYgv4qd85A=;
  b=LYJsA5sTOKSQQo3ZZBd96FuEadIGUhhKTkcHSM22eOA5cllVbqWW6m60
   AA1vWm2QqXZTJX4RdcKi3cj4Dg8tVtIIOUD3rq4oFeX3AiJxAUvg7ogYN
   sUM5VEYAEx4I1PbJOeTDjyDZDJQLCfpjFsOYTQIhFg13+850QFmpO8BOI
   HO7Kuukc0uy++TbOw3a2ym9Zb3lJudsLuLTV4niYIE7wU/9OBggAr4F/o
   9gje2dVjjdHdIe2xTphiFFTLaC9CFLpW05DlAWclrIAHwRORNLmAUsBgQ
   ens7/LIV2WvM1r44va06nmj2f0hp03PRxUzdLeXhJ2GgHZyHRaOAL8wyn
   Q==;
X-CSE-ConnectionGUID: 5gdquATmS7apyOX7fjdtyA==
X-CSE-MsgGUID: ezib9h3mRoCcuKWQycUgVg==
X-IronPort-AV: E=McAfee;i="6800,10657,11813"; a="93179821"
X-IronPort-AV: E=Sophos;i="6.24,200,1774335600"; 
   d="scan'208";a="93179821"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jun 2026 22:46:40 -0700
X-CSE-ConnectionGUID: nEEdCaH7Q06wrOi5DlRThA==
X-CSE-MsgGUID: brFEOOJOSAmRGMxHfJZsPA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,200,1774335600"; 
   d="scan'208";a="276925120"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 11 Jun 2026 22:46:35 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wXuiu-00000000ONd-0p3y;
	Fri, 12 Jun 2026 05:46:32 +0000
Date: Fri, 12 Jun 2026 13:46:10 +0800
From: kernel test robot <lkp@intel.com>
To: "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>, linux-mm@kvack.org
Cc: oe-kbuild-all@lists.linux.dev,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <chleroy@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>,
	Chris Li <chrisl@kernel.org>, Kairui Song <kasong@tencent.com>,
	Kemeng Shi <shikemeng@huaweicloud.com>,
	Nhat Pham <nphamcs@gmail.com>, Baoquan He <baoquan.he@linux.dev>,
	Barry Song <baohua@kernel.org>,
	Youngjun Park <youngjun.park@lge.com>,
	David Hildenbrand <david@kernel.org>, linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org, Sayali Patil <sayalip@linux.ibm.com>,
	"Ritesh Harjani (IBM)" <ritesh.list@gmail.com>
Subject: Re: [PATCH v2 3/3] powerpc: Kconfig: Enable THP_SWAP on Book3S64
Message-ID: <202606121305.h0cxjhP2-lkp@intel.com>
References: <3abf510d24c8ef17bd5e324cccc5e03e548afade.1781170904.git.ritesh.list@gmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3abf510d24c8ef17bd5e324cccc5e03e548afade.1781170904.git.ritesh.list@gmail.com>

Hi Ritesh,

kernel test robot noticed the following build warnings:

[auto build test WARNING on akpm-mm/mm-everything]
[also build test WARNING on linux-review/Ritesh-Harjani-IBM/include-linux-swap-h-Remove-unused-leftovers/20260611-111124 next-20260611]
[cannot apply to powerpc/next powerpc/fixes linus/master v7.1-rc7]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Ritesh-Harjani-IBM/mm-swap-make-SWAPFILE_CLUSTER-runtime/20260611-181121
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/3abf510d24c8ef17bd5e324cccc5e03e548afade.1781170904.git.ritesh.list%40gmail.com
patch subject: [PATCH v2 3/3] powerpc: Kconfig: Enable THP_SWAP on Book3S64
config: arm64-randconfig-r133-20260611 (https://download.01.org/0day-ci/archive/20260612/202606121305.h0cxjhP2-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260612/202606121305.h0cxjhP2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606121305.h0cxjhP2-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> mm/swapfile.c:133:6: sparse: sparse: symbol 'swap_table_use_page' was not declared. Should it be static?

vim +/swap_table_use_page +133 mm/swapfile.c

   131	
   132	unsigned int swap_slots_in_cluster __read_mostly;
 > 133	bool swap_table_use_page __read_mostly;
   134	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
