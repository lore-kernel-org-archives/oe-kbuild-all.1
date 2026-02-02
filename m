Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2133A21B918
	for <oe-kbuild-all@lists.linux.dev>; Mon,  2 Feb 2026 11:38:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770032339; cv=none; b=DQelPm8m0yWB6EUud8S0ghkTzuOr59yga+steFpt2rQtlHwPa9LaMgMK529gdf7qeMxLIOmj1k86LTE+s1yTAYXfEt2WuDVmTOs1yTfkBEvXIAsjzssYT6EVV/LJtpbiPrY+GAZkJ+aHoT+YSJNSnmnv4EM4CTWG9l5vx1RZn2g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770032339; c=relaxed/simple;
	bh=cI4AhGz2vfjhZkCobU0QYlVXoxFuWaqaxZ2OzB+fKnI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LiH8U86fhwD/cJ3xZh7cClHZNiXPkM5sAFU3kpMySr3dNCb1N5lkPd+GkKOJi0KX+6qO5AHzild6iJo43fVtRA8jYKOb/BZrOYrzyYdFT5zxn6g8bBEaJXOMUbKFrp0XVRvR1skyWWMerD/KDfLypykuUdGthe62FBl+Lwf82uQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gkcrF1KS; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gkcrF1KS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770032337; x=1801568337;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=cI4AhGz2vfjhZkCobU0QYlVXoxFuWaqaxZ2OzB+fKnI=;
  b=gkcrF1KSo2udlDi1XEyes0pIqblHRDUaOFXhVbLAsruEQ8ZyJiK6C3nI
   WVhjBa4jPtI1iqeUg2YUzC0K5uyNPxOevxmJH5ReSy9ze8X3BsYy0KGcQ
   9XhOhlZevep6ROZlNaH2Fjdub2j6NbIi9lJMWrHd69pxMPuPLD0n19QmM
   W6EZc+GQgysMXD1h3Bdgxul+gcE0J47qwvi6oStChuN0tUQjTdR38njRK
   TptZSXZ0QnE4xVHJdph5ncBus8FruyvGko1wp+DhzJ9wH/XiGtNBCn+Ab
   jFmuDAqD81bmBPttOGiB1srldl0EV+vnlGExHKnV8i20UmNY5sAk5d2ds
   w==;
X-CSE-ConnectionGUID: wLSZh0tuR+qs9g++flE5IQ==
X-CSE-MsgGUID: oqgpcDqlTiusg+p8gUMRfw==
X-IronPort-AV: E=McAfee;i="6800,10657,11689"; a="75044220"
X-IronPort-AV: E=Sophos;i="6.21,268,1763452800"; 
   d="scan'208";a="75044220"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Feb 2026 03:38:57 -0800
X-CSE-ConnectionGUID: g7r70AswQ0OlkrFzvxHLKQ==
X-CSE-MsgGUID: FoIesfKUSRycTPRboe9Lew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,268,1763452800"; 
   d="scan'208";a="214034707"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 02 Feb 2026 03:38:49 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vmsGU-00000000fWq-1Jt7;
	Mon, 02 Feb 2026 11:38:46 +0000
Date: Mon, 2 Feb 2026 19:37:46 +0800
From: kernel test robot <lkp@intel.com>
To: Lance Yang <lance.yang@linux.dev>, akpm@linux-foundation.org
Cc: oe-kbuild-all@lists.linux.dev, david@kernel.org, dave.hansen@intel.com,
	dave.hansen@linux.intel.com, ypodemsk@redhat.com, hughd@google.com,
	will@kernel.org, aneesh.kumar@kernel.org, npiggin@gmail.com,
	peterz@infradead.org, tglx@linutronix.de, mingo@redhat.com,
	bp@alien8.de, x86@kernel.org, hpa@zytor.com, arnd@arndb.de,
	lorenzo.stoakes@oracle.com, ziy@nvidia.com,
	baolin.wang@linux.alibaba.com, Liam.Howlett@oracle.com,
	npache@redhat.com, ryan.roberts@arm.com, dev.jain@arm.com,
	baohua@kernel.org, shy828301@gmail.com, riel@surriel.com,
	jannh@google.com, jgross@suse.com, seanjc@google.com,
	pbonzini@redhat.com
Subject: Re: [PATCH v4 1/3] mm: use targeted IPIs for TLB sync with lockless
 page table walkers
Message-ID: <202602021931.pSxULClL-lkp@intel.com>
References: <20260202074557.16544-2-lance.yang@linux.dev>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260202074557.16544-2-lance.yang@linux.dev>

Hi Lance,

kernel test robot noticed the following build errors:

[auto build test ERROR on akpm-mm/mm-everything]
[also build test ERROR on tip/x86/core arnd-asm-generic/master linus/master v6.19-rc8 next-20260130]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Lance-Yang/mm-use-targeted-IPIs-for-TLB-sync-with-lockless-page-table-walkers/20260202-154938
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/20260202074557.16544-2-lance.yang%40linux.dev
patch subject: [PATCH v4 1/3] mm: use targeted IPIs for TLB sync with lockless page table walkers
config: riscv-allnoconfig (https://download.01.org/0day-ci/archive/20260202/202602021931.pSxULClL-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260202/202602021931.pSxULClL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602021931.pSxULClL-lkp@intel.com/

All errors (new ones prefixed by >>):

   riscv64-linux-ld: mm/gup.o: in function `get_user_pages_unlocked':
>> gup.c:(.text+0x2900): undefined reference to `active_lockless_pt_walk_mm'
>> riscv64-linux-ld: gup.c:(.text+0x2922): undefined reference to `active_lockless_pt_walk_mm'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
