Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A27F283FCD
	for <oe-kbuild-all@lists.linux.dev>; Sat, 20 Dec 2025 20:00:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766260852; cv=none; b=a2BwO2OBpM6IsyNzwktP+p6xv1+iZLANf7vMf4B1jK8A4B7rDNVzu4nyJIVBik3QgjXLBMNNOpwBjTkAzvHe0ah3mp+/NTKfuezcRHYmBoH17EwNUWs/dFTeJx2+idi4NGgoeZ+5wa6plnnKtNu76belThbPgjcXMvRpY34RdRY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766260852; c=relaxed/simple;
	bh=L+0umxAfiZIdC5wEywdypyGwKS8of5I7b+hEU/RPeSw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZCwCnWpArv4DzYiakiC0mOCWEAaBH12b4ND44wTm6m39Is5qFVmJiaB7/uwV18u483cRldnDnNCpllsUWqGr/xvwQijJhRuhzjIR5nQWpmi/WdXCUqU1dhOfwl2uBbSte6ulb2+Z5G0Uzhc/PggkVvblzadYpegh/z3cS2Yp9fw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=esg3SF8Z; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="esg3SF8Z"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766260851; x=1797796851;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=L+0umxAfiZIdC5wEywdypyGwKS8of5I7b+hEU/RPeSw=;
  b=esg3SF8Z856Kkfp/wrD+O3nzBp/EgnsuiPNYvknt6bHMWkDxojbeNgqa
   0TQ8DflvBD64k91wMc+YR9Fy9F54aRfVuYJRuZZ8ibMNRRl7wyJcROiTv
   3Lz7kqoVfStUYIWDm7tPSJ4Q7bTArdl69wr/xbIht2Om4jj+Adxu6up5k
   RbyF2SAZ4xiILPTWXVfNyOb8abXhsuCvEEhWcSFOY+ddGrtU1W2qn3iAo
   3fYEsyMPa8Xn8nIKRYcTPso4KcQ4sxsOGKv+BzkzjwfopYBryTQRiRRii
   OZCzRb7IH6seeNyPlVK7B+0wyo0tTJIYEuAD95kjHyn+Yu6sAt0FIR1gV
   w==;
X-CSE-ConnectionGUID: Gdc1PSHRQfukhfhEL/Biyw==
X-CSE-MsgGUID: L5ZvUdfAR02+EK8fn3kMBg==
X-IronPort-AV: E=McAfee;i="6800,10657,11648"; a="72030181"
X-IronPort-AV: E=Sophos;i="6.21,164,1763452800"; 
   d="scan'208";a="72030181"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Dec 2025 12:00:48 -0800
X-CSE-ConnectionGUID: rQ5eOjHQRRaWnSJ3qoF3Ag==
X-CSE-MsgGUID: oMAjf1M4QSyprInMY2znDg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,164,1763452800"; 
   d="scan'208";a="198398351"
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a) ([10.211.93.152])
  by orviesa010.jf.intel.com with ESMTP; 20 Dec 2025 12:00:48 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vX388-000000004ls-35Xb;
	Sat, 20 Dec 2025 20:00:44 +0000
Date: Sat, 20 Dec 2025 21:00:08 +0100
From: kernel test robot <lkp@intel.com>
To: Roman Gushchin <roman.gushchin@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH bpf-next v2 4/7] mm: introduce BPF kfuncs to access memcg
 statistics and events
Message-ID: <202512202043.6R1j29mD-lkp@intel.com>
References: <20251220041250.372179-5-roman.gushchin@linux.dev>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251220041250.372179-5-roman.gushchin@linux.dev>

Hi Roman,

kernel test robot noticed the following build warnings:

[auto build test WARNING on akpm-mm/mm-everything]

url:    https://github.com/intel-lab-lkp/linux/commits/Roman-Gushchin/mm-declare-memcg_page_state_output-in-memcontrol-h/20251220-121603
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/20251220041250.372179-5-roman.gushchin%40linux.dev
patch subject: [PATCH bpf-next v2 4/7] mm: introduce BPF kfuncs to access memcg statistics and events
config: powerpc64-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20251220/202512202043.6R1j29mD-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251220/202512202043.6R1j29mD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512202043.6R1j29mD-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> powerpc64-linux-ld: warning: discarding dynamic section .glink
>> powerpc64-linux-ld: warning: discarding dynamic section .plt
   powerpc64-linux-ld: linkage table error against `mem_cgroup_usage'
   powerpc64-linux-ld: stubs don't match calculated size
   powerpc64-linux-ld: can not build stubs: bad value
   powerpc64-linux-ld: mm/bpf_memcontrol.o: in function `bpf_mem_cgroup_usage':
   mm/bpf_memcontrol.c:103:(.text+0x87c): undefined reference to `mem_cgroup_usage'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
