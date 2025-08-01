Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE06F14D29B
	for <oe-kbuild-all@lists.linux.dev>; Fri,  1 Aug 2025 02:00:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754013603; cv=none; b=so+LSderd9jbyIouU567/7X3IHRO8SSDyycg/CFx0eX93It1GBSVlEhcIH9fyLsGxchGcivi2cchaA/njcc3N8bElQ/UytCazIhrCpcUHDMmM1do+kl/ev2ONMwYPd0BW0qRRxYZdWvdEQrXQR9NRSGnslPo5RZrRxOpP462/MM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754013603; c=relaxed/simple;
	bh=R9A4+rH+cYaErrSVMznYpDaXYvsReGCOR0hex+PkQ9k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=a5p8IL2SWRvzZ67oRV2GZoLyF0NFQFgLp5tKNsmXqBR/rdXCHWgm84nwn8EUjjo8Xk6jOWhiaH3+8amQn4Qek6QBgChcUJXplS13RLpht6Wj7Wr1PN/0ZSg9jzx54uvmobva/7UtZ3L5Ie+AbWvvZpWpup+XBpHLVaUuIo32kTE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=USGo5Lyr; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="USGo5Lyr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754013602; x=1785549602;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=R9A4+rH+cYaErrSVMznYpDaXYvsReGCOR0hex+PkQ9k=;
  b=USGo5LyrKTX4X1Gb2p4Da6M5dNw1Cd+orNUCQDfL0ZQuy2TQ0fuLUn2E
   +8W1PVs2pe0wLYoZ8nAeBMGkAM+TBHZ8R3WFOenyzXq0hu02vPXRZCcJe
   bBpnjN6VSNoGPKcgkS8M3d3Hu1hR21CqWUW6mMGY19gtTROk8dNwGwiPx
   LUCl4U7aASxrYjI5+GkPdPjH4PErhGOjJFppTVrtlYiFCQ7LFajb9oPIl
   CjKQ2OxvoN6/NrOFt0NO5hz74ATPqTAOYR8oo9q3M3cEesDw/dQnWKdUS
   KvhkW63DV+/7n9KO2U7489xSIer1I5lmFQYDVdAWK7CnK67rgiSX7hIq/
   A==;
X-CSE-ConnectionGUID: M97mAhfwQma6TkWCbI+fCw==
X-CSE-MsgGUID: r9X9LhYGSky2bmmRRDs60w==
X-IronPort-AV: E=McAfee;i="6800,10657,11508"; a="56499910"
X-IronPort-AV: E=Sophos;i="6.17,255,1747724400"; 
   d="scan'208";a="56499910"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jul 2025 19:00:00 -0700
X-CSE-ConnectionGUID: u9Nj1x+uSXenhvfEBM97+w==
X-CSE-MsgGUID: iXiqFlJfRB6QGRbn9nIcYg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,255,1747724400"; 
   d="scan'208";a="164218468"
Received: from lkp-server01.sh.intel.com (HELO 160750d4a34c) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 31 Jul 2025 18:59:59 -0700
Received: from kbuild by 160750d4a34c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uhf3s-0004Hs-0m;
	Fri, 01 Aug 2025 01:59:56 +0000
Date: Fri, 1 Aug 2025 09:59:07 +0800
From: kernel test robot <lkp@intel.com>
To: James Bottomley <James.Bottomley@hansenpartnership.com>,
	bpf@vger.kernel.org, linux-trace-kernel@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, Roberto Sassu <roberto.sassu@huawei.com>
Subject: Re: [PATCH v2 3/3] bpf: eliminate the allocation of an intermediate
 struct bpf_key
Message-ID: <202508010906.eulQ24IN-lkp@intel.com>
References: <20250730172745.8480-4-James.Bottomley@HansenPartnership.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250730172745.8480-4-James.Bottomley@HansenPartnership.com>

Hi James,

kernel test robot noticed the following build warnings:

[auto build test WARNING on bpf-next/master]
[also build test WARNING on bpf/master linus/master v6.16 next-20250731]
[cannot apply to bpf-next/net]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/James-Bottomley/bpf-make-bpf_key-an-opaque-type/20250731-013040
base:   https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next.git master
patch link:    https://lore.kernel.org/r/20250730172745.8480-4-James.Bottomley%40HansenPartnership.com
patch subject: [PATCH v2 3/3] bpf: eliminate the allocation of an intermediate struct bpf_key
config: i386-randconfig-r133-20250801 (https://download.01.org/0day-ci/archive/20250801/202508010906.eulQ24IN-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250801/202508010906.eulQ24IN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508010906.eulQ24IN-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   kernel/trace/bpf_trace.c:834:41: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected void [noderef] __user *[addressable] [assigned] [usertype] sival_ptr @@     got void * @@
   kernel/trace/bpf_trace.c:834:41: sparse:     expected void [noderef] __user *[addressable] [assigned] [usertype] sival_ptr
   kernel/trace/bpf_trace.c:834:41: sparse:     got void *
>> kernel/trace/bpf_trace.c:1249:11: sparse: sparse: symbol 'BUILTIN_KEY' was not declared. Should it be static?
   kernel/trace/bpf_trace.c:3684:52: sparse: sparse: cast removes address space '__user' of expression
   kernel/trace/bpf_trace.c:3698:56: sparse: sparse: cast removes address space '__user' of expression
   kernel/trace/bpf_trace.c:3712:52: sparse: sparse: cast removes address space '__user' of expression
   kernel/trace/bpf_trace.c:3719:56: sparse: sparse: cast removes address space '__user' of expression
   kernel/trace/bpf_trace.c:3727:52: sparse: sparse: cast removes address space '__user' of expression
   kernel/trace/bpf_trace.c:3735:56: sparse: sparse: cast removes address space '__user' of expression
   kernel/trace/bpf_trace.c: note: in included file (through include/linux/rbtree.h, include/linux/mm_types.h, include/linux/mmzone.h, ...):
   include/linux/rcupdate.h:871:25: sparse: sparse: context imbalance in 'uprobe_prog_run' - unexpected unlock

vim +/BUILTIN_KEY +1249 kernel/trace/bpf_trace.c

  1243	
  1244	#ifdef CONFIG_KEYS
  1245	/* BTF requires this even if it serves no purpose */
  1246	struct bpf_key {
  1247	};
  1248	/* conventional value to replace zero return which would become NULL */
> 1249	const u64 BUILTIN_KEY = -1LL;
  1250	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
