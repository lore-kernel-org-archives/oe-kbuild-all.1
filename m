Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACF2C23DB
	for <oe-kbuild-all@lists.linux.dev>; Sat, 10 Feb 2024 09:07:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=134.134.136.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707556034; cv=none; b=cVq9mK+AqqQLjAESTD8w3wLPCf3nLLwAWQ7J9S7vlRu92fnwNq8qcGicU26hG6XI8cfpM62XQy821sg03v56SDzZlghapC0/+Mmj+ONMbmxPpTxXnXGvT6VdF/tMSxUfaMRvL81P9AutLuNyuGHcOloJOs35glEP11eC2y6bfRY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707556034; c=relaxed/simple;
	bh=9AUYeY6nTxc/Hm1O8OphujztTe2arpT0ByMBGKHWqZM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=T0EuTp3G36DI4ueKxUE3GPKibuz7GMKXYt3ysXffMT7pHdfc6I64OEVUhx2XkObj1RipI1y2Z3BokZhsBeDxJsfKKdMRIJ8TsWwOiWORt0Xt4fAXvqklk1P9BatIJEw+ruaSwRTBpyLKRxXoGFHZDrHH7UCnni0yEgBRcDd+3yc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mWzLK2T6; arc=none smtp.client-ip=134.134.136.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mWzLK2T6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707556032; x=1739092032;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=9AUYeY6nTxc/Hm1O8OphujztTe2arpT0ByMBGKHWqZM=;
  b=mWzLK2T6nH5veoz0UOlthyIcZFaMfdl2PfepUBpUtEVc6OaRAu2IdBp6
   c6cK7utbFDpXePMwFeIfJQcwb30RQPE/eBtH3n3ZmRLgCh+Du8eL/n3x3
   d0wAbBSLNCSSciqp0wDueoph9t8gf/KtIXcnDm8K+2UU5RAA128TfyVs0
   6CSs+qYQZg1KwJx/uggBofTeOHtoxbwFa76iognzzW3irrPMl8jLTZYmh
   fgQpeshBbBlzvwiaBeUUNYRzH2OdJQPBf00/2SHA60qJ96j2tHmMx9NOq
   oFp5yfXoe9raxz4tsIS5yvSjHVUwsYwBqUuGTZGOFN31Simde5zbihHXH
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10979"; a="395984049"
X-IronPort-AV: E=Sophos;i="6.05,259,1701158400"; 
   d="scan'208";a="395984049"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Feb 2024 01:07:11 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,259,1701158400"; 
   d="scan'208";a="2121797"
Received: from lkp-server01.sh.intel.com (HELO 01f0647817ea) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 10 Feb 2024 01:07:10 -0800
Received: from kbuild by 01f0647817ea with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rYjKG-0005WU-1T;
	Sat, 10 Feb 2024 09:07:08 +0000
Date: Sat, 10 Feb 2024 17:06:53 +0800
From: kernel test robot <lkp@intel.com>
To: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v2 bpf-next 03/20] bpf: Plumb get_unmapped_area()
 callback into bpf_map_ops
Message-ID: <202402101653.QJBLJLnM-lkp@intel.com>
References: <20240209040608.98927-4-alexei.starovoitov@gmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240209040608.98927-4-alexei.starovoitov@gmail.com>

Hi Alexei,

kernel test robot noticed the following build errors:

[auto build test ERROR on bpf-next/master]

url:    https://github.com/intel-lab-lkp/linux/commits/Alexei-Starovoitov/bpf-Allow-kfuncs-return-void/20240209-120941
base:   https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next.git master
patch link:    https://lore.kernel.org/r/20240209040608.98927-4-alexei.starovoitov%40gmail.com
patch subject: [PATCH v2 bpf-next 03/20] bpf: Plumb get_unmapped_area() callback into bpf_map_ops
config: sh-allmodconfig (https://download.01.org/0day-ci/archive/20240210/202402101653.QJBLJLnM-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240210/202402101653.QJBLJLnM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402101653.QJBLJLnM-lkp@intel.com/

All errors (new ones prefixed by >>):

   kernel/bpf/syscall.c: In function 'bpf_get_unmapped_area':
>> kernel/bpf/syscall.c:948:27: error: 'struct mm_struct' has no member named 'get_unmapped_area'
     948 |         return current->mm->get_unmapped_area(filp, addr, len, pgoff, flags);
         |                           ^~
   kernel/bpf/syscall.c:949:1: warning: control reaches end of non-void function [-Wreturn-type]
     949 | }
         | ^


vim +948 kernel/bpf/syscall.c

   939	
   940	static unsigned long bpf_get_unmapped_area(struct file *filp, unsigned long addr,
   941						   unsigned long len, unsigned long pgoff,
   942						   unsigned long flags)
   943	{
   944		struct bpf_map *map = filp->private_data;
   945	
   946		if (map->ops->map_get_unmapped_area)
   947			return map->ops->map_get_unmapped_area(filp, addr, len, pgoff, flags);
 > 948		return current->mm->get_unmapped_area(filp, addr, len, pgoff, flags);
   949	}
   950	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
