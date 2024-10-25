Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFE1B4C98
	for <oe-kbuild-all@lists.linux.dev>; Fri, 25 Oct 2024 00:11:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729815093; cv=none; b=C/pHcrsinTvldgE3MJmKIEyiSvFeqrsYpQFhd5qh/eU6P6CH+kItxvLTBmD3IplGKgoAvQ19fcgz7gz/llhW2vheTOJnF431ySqBBDQAr+9UvA8c0jtI21NRvkvzuqupRLqK9Lyg1TqoXExaLVC0CEJCg6QOAwfZ4gy5TctFgXg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729815093; c=relaxed/simple;
	bh=8bZMCubFltC4DcRdPxrFsf6NxLIXPutRrub1xC7hRNA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RltAK+SZijC4Gew0gxV2Ht2l427TjA0G9mrhP6GuI5Wg2uGWUaDo9d6voWAPEZk/UhTLP8q8viiRQ5P2e/6Thd/tLnlPepEQL+NFr2NPOa8a60wWiMFwtOFrFC6uIYwT0/SGdzXROAjki0bxG9MOHy2uwsby2M+inGIWvx0CIUM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BDlPOc7y; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BDlPOc7y"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729815090; x=1761351090;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=8bZMCubFltC4DcRdPxrFsf6NxLIXPutRrub1xC7hRNA=;
  b=BDlPOc7yZAKj8C4qOIgibe2q2fjM0HnabZBiy1xC9kBlr68xoraMSy/1
   fQ0bBl3l0lCbmKhTbN/r4ZWxwKIAXuIr4FdbOK/d2VWSbXb3Bpcw/eaBb
   9AfVNlgRAq8MpzWfucj3uru2WOmK5v2r5fdGLTybBLaXTVTpQZN1CjA+s
   jAabdYEWU3C/E/Ak8wSksK0X7nX1nidPCbtn8HLdhcH1nGk+YDvvUSrpe
   OQXNJY4l2Pk+CFwB17TUzcDLNn1n+P00h/PpRiNjtDt8jp1lBt28cJq6V
   XpLERxHig8QZA8Y7UXra0MA64QK1amLq3rRRkqkTqIwFCBK3tQfRaspyp
   w==;
X-CSE-ConnectionGUID: DJp259vERYK4VNGzkBeQgQ==
X-CSE-MsgGUID: vzalkBVjQ7W8U/28W5TCTQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11235"; a="54877301"
X-IronPort-AV: E=Sophos;i="6.11,230,1725346800"; 
   d="scan'208";a="54877301"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Oct 2024 17:11:29 -0700
X-CSE-ConnectionGUID: BjNbCnhnTsKOPvNG5qQO5g==
X-CSE-MsgGUID: yRMlvEWySrCwsrUkWQU10g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="85523481"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 24 Oct 2024 17:11:29 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t47vK-000XIy-0F;
	Fri, 25 Oct 2024 00:11:26 +0000
Date: Fri, 25 Oct 2024 08:11:19 +0800
From: kernel test robot <lkp@intel.com>
To: Suren Baghdasaryan <surenb@google.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v4 4/6] alloc_tag: populate memory for module tags as
 needed
Message-ID: <202410250808.dQGyYjlk-lkp@intel.com>
References: <20241023170759.999909-5-surenb@google.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241023170759.999909-5-surenb@google.com>

Hi Suren,

kernel test robot noticed the following build errors:

[auto build test ERROR on b5d43fad926a3f542cd06f3c9d286f6f489f7129]

url:    https://github.com/intel-lab-lkp/linux/commits/Suren-Baghdasaryan/maple_tree-add-mas_for_each_rev-helper/20241024-010916
base:   b5d43fad926a3f542cd06f3c9d286f6f489f7129
patch link:    https://lore.kernel.org/r/20241023170759.999909-5-surenb%40google.com
patch subject: [PATCH v4 4/6] alloc_tag: populate memory for module tags as needed
config: sh-rsk7203_defconfig (https://download.01.org/0day-ci/archive/20241025/202410250808.dQGyYjlk-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 13.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241025/202410250808.dQGyYjlk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410250808.dQGyYjlk-lkp@intel.com/

All errors (new ones prefixed by >>):

   sh4-linux-ld: mm/execmem.o: in function `execmem_vmap':
>> mm/execmem.c:385:(.text+0xf4): undefined reference to `__get_vm_area_node'


vim +385 mm/execmem.c

   370	
   371	struct vm_struct *execmem_vmap(size_t size)
   372	{
   373		struct execmem_range *range = &execmem_info->ranges[EXECMEM_MODULE_DATA];
   374		struct vm_struct *area;
   375	
   376		area = __get_vm_area_node(size, range->alignment, PAGE_SHIFT, VM_ALLOC,
   377					  range->start, range->end, NUMA_NO_NODE,
   378					  GFP_KERNEL, __builtin_return_address(0));
   379		if (!area && range->fallback_start)
   380			area = __get_vm_area_node(size, range->alignment, PAGE_SHIFT, VM_ALLOC,
   381						  range->fallback_start, range->fallback_end,
   382						  NUMA_NO_NODE, GFP_KERNEL, __builtin_return_address(0));
   383	
   384		return area;
 > 385	}
   386	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
