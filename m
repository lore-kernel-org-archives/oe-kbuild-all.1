Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 206F25DF34
	for <oe-kbuild-all@lists.linux.dev>; Sat,  3 Feb 2024 09:02:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706950978; cv=none; b=hYvKWUu7OUjYju8gG7vZdqVmd7ZyPlrWP8mk5j69EhDAbIrABlWrLSmeQDpdEj23ZmY8SzA+qbrCaboswBQ1mJqPGJZAbSLUVi65lBymc23RVQ7V9ZablIeaX0koSJzsbr3QTm7jR2VPPIvqiAzw0tG0TOOWbmJ+Nn+F/jSl3M8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706950978; c=relaxed/simple;
	bh=/tepwleuqxLdhLdo+rX5pyzq+UCKQZC0ikmqbWbma2Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=M9OOCPc0kA9NACpsFE0wEtWaM7y5l/77BaVWWDLLNIvgnN0uDw0rTy3aUJeTKpFPJXwZLM6eIAsVl1QGex8dsAOTe0it/8BSO7ht0ufKES73vGFOTEGqZx9ySuNuBRf0zqoEvlru5mOVTSq3vSRy73sXx8MGaKA4Oojkn2aNfFU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=V1B6Udpk; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="V1B6Udpk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706950976; x=1738486976;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=/tepwleuqxLdhLdo+rX5pyzq+UCKQZC0ikmqbWbma2Q=;
  b=V1B6UdpkcRPvzs+dhnlkGiqk8+oS5ZxxnqDnntJ3uP8fkxB1WRLeh/VZ
   3ovJ8ERybZABAl74IaqHGqYhHi7kTBvo6yh28Ko3BkuV5qS45K+Gy6QQZ
   0FB2xtSdAKPZn31z86nTXQt3XgfMxZt0WcXU+lKOtPOAhb2BCJ+Xv33Gs
   F4wIfWZhQvr+t18/GkN/GDTqL52VtluX3rjIe2vOH1k5VT+X/Cxvy3nUU
   3HBhgHjoS27TQMMIIlaJcL8juGcaWr3h2Ds6G3sIi+2Ipb6tfA59G9UMd
   pLo0bIs8pn/9Q/VtsQ92NAveonTq8/3N6mv5yhI2SsLqzFb4ZzoQl80UP
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10971"; a="533543"
X-IronPort-AV: E=Sophos;i="6.05,240,1701158400"; 
   d="scan'208";a="533543"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Feb 2024 01:02:55 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,240,1701158400"; 
   d="scan'208";a="349921"
Received: from lkp-server02.sh.intel.com (HELO 59f4f4cd5935) ([10.239.97.151])
  by fmviesa007.fm.intel.com with ESMTP; 03 Feb 2024 01:02:54 -0800
Received: from kbuild by 59f4f4cd5935 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rWBvI-0004p8-0A;
	Sat, 03 Feb 2024 09:02:52 +0000
Date: Sat, 3 Feb 2024 17:02:15 +0800
From: kernel test robot <lkp@intel.com>
To: Kumar Kartikeya Dwivedi <memxor@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH v1 10/14] bpf, x86: Implement runtime resource
 cleanup for exceptions
Message-ID: <202402031647.EPHvf6YH-lkp@intel.com>
References: <20240201042109.1150490-11-memxor@gmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240201042109.1150490-11-memxor@gmail.com>

Hi Kumar,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on 77326a4a06e1e97432322f403cb439880871d34d]

url:    https://github.com/intel-lab-lkp/linux/commits/Kumar-Kartikeya-Dwivedi/bpf-Mark-subprogs-as-throw-reachable-before-do_check-pass/20240201-162356
base:   77326a4a06e1e97432322f403cb439880871d34d
patch link:    https://lore.kernel.org/r/20240201042109.1150490-11-memxor%40gmail.com
patch subject: [RFC PATCH v1 10/14] bpf, x86: Implement runtime resource cleanup for exceptions
config: m68k-allyesconfig (https://download.01.org/0day-ci/archive/20240203/202402031647.EPHvf6YH-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240203/202402031647.EPHvf6YH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402031647.EPHvf6YH-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/btf.h:10,
                    from include/linux/bpf.h:28,
                    from include/linux/bpf_verifier.h:7,
                    from net/core/filter.c:21:
   include/linux/btf_ids.h:231: warning: "BTF_KFUNCS_START" redefined
     231 | #define BTF_KFUNCS_START(name) static struct btf_id_set8 __maybe_unused name = { .flags = BTF_SET8_KFUNCS };
         | 
   include/linux/btf_ids.h:230: note: this is the location of the previous definition
     230 | #define BTF_KFUNCS_START(name) static struct btf_id_set8 __maybe_unused name = { 0 };
         | 
   net/core/filter.c: In function 'bpf_sk_release_dtor':
>> net/core/filter.c:6917:24: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
    6917 |         bpf_sk_release((u64)ptr, 0, 0, 0, 0);
         |                        ^
--
   In file included from include/linux/btf.h:10,
                    from include/linux/bpf.h:28,
                    from kernel/bpf/helpers.c:4:
   include/linux/btf_ids.h:231: warning: "BTF_KFUNCS_START" redefined
     231 | #define BTF_KFUNCS_START(name) static struct btf_id_set8 __maybe_unused name = { .flags = BTF_SET8_KFUNCS };
         | 
   include/linux/btf_ids.h:230: note: this is the location of the previous definition
     230 | #define BTF_KFUNCS_START(name) static struct btf_id_set8 __maybe_unused name = { 0 };
         | 
   kernel/bpf/helpers.c: In function 'bpf_cleanup_resource_reg':
   kernel/bpf/helpers.c:2515:45: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
    2515 |                         bpf_sk_release_dtor((void *)reg_value);
         |                                             ^
   kernel/bpf/helpers.c:2527:50: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
    2527 |                         bpf_percpu_obj_drop_impl((void *)reg_value, meta);
         |                                                  ^
   kernel/bpf/helpers.c:2529:43: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
    2529 |                         bpf_obj_drop_impl((void *)reg_value, meta);
         |                                           ^
   kernel/bpf/helpers.c:2535:53: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
    2535 |                                 bpf_sk_release_dtor((void *)reg_value);
         |                                                     ^
   kernel/bpf/helpers.c:2539:68: error: 'BPF_DTOR_KPTR' undeclared (first use in this function); did you mean 'BPF_KPTR'?
    2539 |                 dtor_id = btf_find_dtor_kfunc(fd->btf, fd->btf_id, BPF_DTOR_KPTR | BPF_DTOR_CLEANUP);
         |                                                                    ^~~~~~~~~~~~~
         |                                                                    BPF_KPTR
   kernel/bpf/helpers.c:2539:68: note: each undeclared identifier is reported only once for each function it appears in
   kernel/bpf/helpers.c:2539:84: error: 'BPF_DTOR_CLEANUP' undeclared (first use in this function)
    2539 |                 dtor_id = btf_find_dtor_kfunc(fd->btf, fd->btf_id, BPF_DTOR_KPTR | BPF_DTOR_CLEANUP);
         |                                                                                    ^~~~~~~~~~~~~~~~
   kernel/bpf/helpers.c:2539:27: error: too many arguments to function 'btf_find_dtor_kfunc'
    2539 |                 dtor_id = btf_find_dtor_kfunc(fd->btf, fd->btf_id, BPF_DTOR_KPTR | BPF_DTOR_CLEANUP);
         |                           ^~~~~~~~~~~~~~~~~~~
   include/linux/btf.h:524:5: note: declared here
     524 | s32 btf_find_dtor_kfunc(struct btf *btf, u32 btf_id);
         |     ^~~~~~~~~~~~~~~~~~~
   kernel/bpf/helpers.c:2547:30: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
    2547 |                         dtor((void *)reg_value);
         |                              ^
   kernel/bpf/helpers.c: In function 'bpf_cleanup_resource_dynptr':
>> kernel/bpf/helpers.c:2564:63: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
    2564 |                         bpf_ringbuf_discard_dynptr_proto.func((u64)ptr, 0, 0, 0, 0);
         |                                                               ^
   kernel/bpf/helpers.c: In function 'bpf_cleanup_resource_iter':
   kernel/bpf/helpers.c:2578:60: error: 'BPF_DTOR_CLEANUP' undeclared (first use in this function)
    2578 |         dtor_id = btf_find_dtor_kfunc(fd->btf, fd->btf_id, BPF_DTOR_CLEANUP);
         |                                                            ^~~~~~~~~~~~~~~~
   kernel/bpf/helpers.c:2578:19: error: too many arguments to function 'btf_find_dtor_kfunc'
    2578 |         dtor_id = btf_find_dtor_kfunc(fd->btf, fd->btf_id, BPF_DTOR_CLEANUP);
         |                   ^~~~~~~~~~~~~~~~~~~
   include/linux/btf.h:524:5: note: declared here
     524 | s32 btf_find_dtor_kfunc(struct btf *btf, u32 btf_id);
         |     ^~~~~~~~~~~~~~~~~~~


vim +6917 net/core/filter.c

  6914	
  6915	void bpf_sk_release_dtor(void *ptr)
  6916	{
> 6917		bpf_sk_release((u64)ptr, 0, 0, 0, 0);
  6918	}
  6919	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
