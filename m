Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D44CFA945
	for <oe-kbuild-all@lists.linux.dev>; Sat, 14 Jun 2025 04:33:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749875582; cv=none; b=QFi3kw3ccUf7a2H52rwjXVlZ4Z1N8nonJ+OQsbtPdnnPzPFo8vkMUqyvkfZ8MvHntPxqucnXswzbKcM/DUgeBeur9Vj96IjxUl/JgD3KdKn6rWaJbRIb7lDluCZlaQCdi9ka94qF2c6uUI7zhqiXoujL/+0Urls0oP1pDCCkBzI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749875582; c=relaxed/simple;
	bh=F4zzCZQStaDfn9Xeb7dHKaUTAt0aWoaugxinFwVI6D8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Qkx2HKIgxo3BfZoFu6P2aO2GYMMRdP4W+cIaPZ7aKCpgn9qhE/ucQNk9PYFEv5wkuifisEHulq0crV0VXsJxru3U4cW1o0QFTmJMFBcVRpzvBleELRh67Bxg/Of5DmzKFTpHZTvy+oDGw5Z4CbCeZ/y1foBAiczsyFkKwxZIT6w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=brv9p78R; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="brv9p78R"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749875581; x=1781411581;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=F4zzCZQStaDfn9Xeb7dHKaUTAt0aWoaugxinFwVI6D8=;
  b=brv9p78Rec7ipFm3TD0J3CneAOwAJigNs5XWykZ9PFj9Oe1brdMni5ud
   BKah4AKedxPDiZqDCuxi3TunVsIGx/u7SLJNLUGcEtLt+GuSgCeQOrpfA
   /RUMv6Ok3JjBO3aHqxuWnBEJXpwuxVRW/v1BG29NuAJ65PCz6qyDzLZcG
   T7x5YfyVC8o0Vvj0qKXXEr4eDZSG5I89lrfIte/YZfIE1HUAuZqIw1a+7
   UgSAao4D6gspDj/MgSkfd/rbZ/PW/r/3tA04cBXqNpCqz4eZr9VuCYGzB
   ndGzrAs8CagaDQeZ0MuceWBGFe9wV1jh6MHL+aaEu9KSNtdic/lZDr4cd
   g==;
X-CSE-ConnectionGUID: 7FbZCiSlT3CQI75hkADpXg==
X-CSE-MsgGUID: E06orPRzT2+paksdF7eeZg==
X-IronPort-AV: E=McAfee;i="6800,10657,11463"; a="63504832"
X-IronPort-AV: E=Sophos;i="6.16,235,1744095600"; 
   d="scan'208";a="63504832"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jun 2025 21:33:00 -0700
X-CSE-ConnectionGUID: KXsPiffZSZuuDUNyoXBIvw==
X-CSE-MsgGUID: qdHoSNMRQ0CTmw7TwgFYdg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,235,1744095600"; 
   d="scan'208";a="147892628"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 13 Jun 2025 21:32:59 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uQIZc-000DIQ-2a;
	Sat, 14 Jun 2025 04:32:56 +0000
Date: Sat, 14 Jun 2025 12:31:57 +0800
From: kernel test robot <lkp@intel.com>
To: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
	intel-xe@lists.freedesktop.org
Cc: oe-kbuild-all@lists.linux.dev, matthew.brost@intel.com,
	thomas.hellstrom@linux.intel.com,
	Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Subject: Re: [PATCH v4 11/20] drm/xe: Allow CPU address mirror VMA unbind
 with gpu bindings for madvise
Message-ID: <202506141250.wwQhe2P0-lkp@intel.com>
References: <20250613125558.2607665-12-himal.prasad.ghimiray@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250613125558.2607665-12-himal.prasad.ghimiray@intel.com>

Hi Himal,

kernel test robot noticed the following build warnings:

[auto build test WARNING on drm-xe/drm-xe-next]
[also build test WARNING on next-20250613]
[cannot apply to linus/master v6.16-rc1]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Himal-Prasad-Ghimiray/Introduce-drm_gpuvm_sm_map_ops_flags-enums-for-sm_map_ops/20250614-003138
base:   https://gitlab.freedesktop.org/drm/xe/kernel.git drm-xe-next
patch link:    https://lore.kernel.org/r/20250613125558.2607665-12-himal.prasad.ghimiray%40intel.com
patch subject: [PATCH v4 11/20] drm/xe: Allow CPU address mirror VMA unbind with gpu bindings for madvise
config: loongarch-allmodconfig (https://download.01.org/0day-ci/archive/20250614/202506141250.wwQhe2P0-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250614/202506141250.wwQhe2P0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506141250.wwQhe2P0-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: drivers/gpu/drm/xe/xe_svm.c:945 function parameter 'vm' not described in 'xe_svm_unmap_address_range'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
