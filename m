Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 214EB15853B
	for <oe-kbuild-all@lists.linux.dev>; Thu,  2 Oct 2025 04:29:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759379367; cv=none; b=D1yyO9/g5NXQfswnmWEfpkrRwbrq22O3/ptX8Umb9LuS2HNHigBIZ0bQEeAnDg82fc+j7W0dnTPZPesnhV/yDdsMgraiBLrK67iI4hPEX90myOj4pWpoPLILB0vV8FUYGpl5nAhw8S/+ygNRpWBeGE1uIpIM0nJhKXcg35EXL44=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759379367; c=relaxed/simple;
	bh=9f+HXNcD7IOFZER/ertfy9YqZjvmxhL5wyEiNgnR4kw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YIdHIish/eBpopxEvPkemm6kRoSP9x283Xuz1jNoSM/eMD+2TU1+GlVWI+jL9gVio0qu8vTulnV8aZZPE79yyrJ4ITC9KhfWvu72vqU2IgyG5S27SuuE/WfRBGo94+7OSGGiX6sEy9LEu2AmNW2gWEp5KDI8LtwuAOqib7Q9ft8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=f9PdWfBF; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="f9PdWfBF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1759379365; x=1790915365;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=9f+HXNcD7IOFZER/ertfy9YqZjvmxhL5wyEiNgnR4kw=;
  b=f9PdWfBFqfh+2tPk0+T31gJzm2lnG500w44WT4vhNIrOWLfT0OnF3rux
   fpiVR9pICUapeBO1Gp0sY+L5pJWsL6sR8FszEZI/Li5umsRkT6LlvDPbf
   iwwbkHKjs/Gl0l5cpdqPFHyGYW4m8O2uvSUSeZhy4aSS/Xx2k1F77UWvF
   2y70x6wKFsyiIlJdfESrvX3c6IVYPONRcajGt9rAWLNcyQ4/xwYrIrW5p
   0QdC5JxFMSHdwMTanyBc+VT86tC3chYdTgfdBb71ScM3qeIiIHx3js0TE
   v3G2IHvVlUth0RCSjsbrwchCr4QVPtRUawCk+iF6FD+seYxV2a0kW+hlm
   g==;
X-CSE-ConnectionGUID: JBz6trCrQSWtsnbfo7xXAQ==
X-CSE-MsgGUID: X164NLFjQcCyqPw8PNj8bA==
X-IronPort-AV: E=McAfee;i="6800,10657,11569"; a="73016724"
X-IronPort-AV: E=Sophos;i="6.18,308,1751266800"; 
   d="scan'208";a="73016724"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Oct 2025 21:29:24 -0700
X-CSE-ConnectionGUID: LZEq29e4Tqu8t5/Q3RYwFw==
X-CSE-MsgGUID: wbDqmC1RT0KGjEqOh3Vncg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,308,1751266800"; 
   d="scan'208";a="179734321"
Received: from lkp-server01.sh.intel.com (HELO 2f2a1232a4e4) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 01 Oct 2025 21:29:21 -0700
Received: from kbuild by 2f2a1232a4e4 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v4AwR-0003Z5-0K;
	Thu, 02 Oct 2025 04:29:19 +0000
Date: Thu, 2 Oct 2025 12:29:15 +0800
From: kernel test robot <lkp@intel.com>
To: Jason Miu <jasonmiu@google.com>, Alexander Graf <graf@amazon.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Baoquan He <bhe@redhat.com>, Changyuan Lyu <changyuanl@google.com>,
	David Matlack <dmatlack@google.com>,
	David Rientjes <rientjes@google.com>,
	Jason Gunthorpe <jgg@nvidia.com>, Mike Rapoport <rppt@kernel.org>,
	Pasha Tatashin <pasha.tatashin@soleen.com>,
	Pratyush Yadav <pratyush@kernel.org>, kexec@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: Re: [PATCH v1 1/3] kho: Adopt KHO radix tree data structures
Message-ID: <202510021229.mKL5i2Vt-lkp@intel.com>
References: <20251001011941.1513050-2-jasonmiu@google.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251001011941.1513050-2-jasonmiu@google.com>

Hi Jason,

kernel test robot noticed the following build warnings:

[auto build test WARNING on rppt-memblock/for-next]
[also build test WARNING on linus/master v6.17]
[cannot apply to rppt-memblock/fixes akpm-mm/mm-everything next-20250929]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Jason-Miu/kho-Adopt-KHO-radix-tree-data-structures/20251001-092230
base:   https://git.kernel.org/pub/scm/linux/kernel/git/rppt/memblock.git for-next
patch link:    https://lore.kernel.org/r/20251001011941.1513050-2-jasonmiu%40google.com
patch subject: [PATCH v1 1/3] kho: Adopt KHO radix tree data structures
config: x86_64-randconfig-005-20251001 (https://download.01.org/0day-ci/archive/20251002/202510021229.mKL5i2Vt-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251002/202510021229.mKL5i2Vt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510021229.mKL5i2Vt-lkp@intel.com/

All warnings (new ones prefixed by >>, old ones prefixed by <<):

>> WARNING: modpost: vmlinux: section mismatch in reference: kho_radix_walk_trees_callback+0x83 (section: .text) -> __memblock_reserve (section: .init.text)
>> WARNING: modpost: vmlinux: section mismatch in reference: kho_radix_walk_trees_callback+0x91 (section: .text) -> memblock_reserved_mark_noinit (section: .init.text)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
