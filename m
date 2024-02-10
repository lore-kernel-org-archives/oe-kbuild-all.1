Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5BAD1FB3
	for <oe-kbuild-all@lists.linux.dev>; Sat, 10 Feb 2024 00:17:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707524281; cv=none; b=CMuYhMoTmqeQuDxJrm9mIYT4/9gaPk/TEzZgFNJOSl9o/87XCxrqhvJ7hkfOJR0LdA2heHb6kkmDj4hIdFd8T0kesg4N1ijYvdtynWGMOk5mcGlJlNp8gdS0jMKn+r41kS9kqyGXuEj0FgN/4rTxB9Sg2Q4AlUBXbC4AzhEiQqg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707524281; c=relaxed/simple;
	bh=rG1AA9jKu9f+RnJuGzze7yNopMBivM3LzpS1EQOcQDc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=egXPTsP7w6n3cWPHNH05RbCUBqSUfIJJC9F2Q/th8Gww/VgFKW1GA6nGYJj8zXdrosV85QQSJjIiZ7lr3J3RmgFKdA+425gcDYGDl7LLELn67+OZQjOGOcXCCTKyQLQYT1KXZXw/aq0u5W5vkIVJ7vvCw25cDKKmyKc/78ke7DU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=U0MRb1QH; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="U0MRb1QH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707524279; x=1739060279;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=rG1AA9jKu9f+RnJuGzze7yNopMBivM3LzpS1EQOcQDc=;
  b=U0MRb1QH9q75AwvGg0OhjfwSn/Msm6/ziWY33TxymIHSdVrHqY8FEvNO
   Nh2FX9epRUhznDLObN07e6eM3PQ0JM4T+r9XHO6hovyUYkSE0CoLGjaqZ
   W3znREZrhJt3IBw++edfnPx0tqBdqDLXoiJszoDd1i4LXGriW2XkyWNeF
   Z3fZVOT30VedzzuzHpWoR8sDwkIUgcLFDwPbBmmHwfrVUO8ToYNI8+K/2
   df5J+MvXDcPruXD9Ry83kFVhphhOTLZpEDzPW2QMVU5xOOQGzx99+HlDI
   korV0WyUmeQxvrWeinnqOIUoQzamUvb+PBy7EoUMPnYg2NMz3DOJH2J3V
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10979"; a="12093196"
X-IronPort-AV: E=Sophos;i="6.05,258,1701158400"; 
   d="scan'208";a="12093196"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Feb 2024 16:17:59 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,258,1701158400"; 
   d="scan'208";a="25301353"
Received: from lkp-server01.sh.intel.com (HELO 01f0647817ea) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 09 Feb 2024 16:17:57 -0800
Received: from kbuild by 01f0647817ea with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rYb46-0005Dq-2C;
	Sat, 10 Feb 2024 00:17:54 +0000
Date: Sat, 10 Feb 2024 08:17:23 +0800
From: kernel test robot <lkp@intel.com>
To: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v2 bpf-next 03/20] bpf: Plumb get_unmapped_area()
 callback into bpf_map_ops
Message-ID: <202402100839.DY3MDEf1-lkp@intel.com>
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

kernel test robot noticed the following build warnings:

[auto build test WARNING on bpf-next/master]

url:    https://github.com/intel-lab-lkp/linux/commits/Alexei-Starovoitov/bpf-Allow-kfuncs-return-void/20240209-120941
base:   https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next.git master
patch link:    https://lore.kernel.org/r/20240209040608.98927-4-alexei.starovoitov%40gmail.com
patch subject: [PATCH v2 bpf-next 03/20] bpf: Plumb get_unmapped_area() callback into bpf_map_ops
config: sh-allyesconfig (https://download.01.org/0day-ci/archive/20240210/202402100839.DY3MDEf1-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240210/202402100839.DY3MDEf1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402100839.DY3MDEf1-lkp@intel.com/

All warnings (new ones prefixed by >>):

   kernel/bpf/syscall.c: In function 'bpf_get_unmapped_area':
   kernel/bpf/syscall.c:948:27: error: 'struct mm_struct' has no member named 'get_unmapped_area'
     948 |         return current->mm->get_unmapped_area(filp, addr, len, pgoff, flags);
         |                           ^~
>> kernel/bpf/syscall.c:949:1: warning: control reaches end of non-void function [-Wreturn-type]
     949 | }
         | ^


vim +949 kernel/bpf/syscall.c

   939	
   940	static unsigned long bpf_get_unmapped_area(struct file *filp, unsigned long addr,
   941						   unsigned long len, unsigned long pgoff,
   942						   unsigned long flags)
   943	{
   944		struct bpf_map *map = filp->private_data;
   945	
   946		if (map->ops->map_get_unmapped_area)
   947			return map->ops->map_get_unmapped_area(filp, addr, len, pgoff, flags);
   948		return current->mm->get_unmapped_area(filp, addr, len, pgoff, flags);
 > 949	}
   950	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
