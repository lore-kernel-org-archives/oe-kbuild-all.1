Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 205FC191F92
	for <oe-kbuild-all@lists.linux.dev>; Mon, 20 Oct 2025 15:42:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760974959; cv=none; b=KTnx/xvRikZSve7tyHNIFPawHK9kWpoRsDy5bEI5YFUnliydEINl2uFRJDLRVpRmKYDZhcnnAPAzPwG297axybES24GY1TEhlUx/pFrRw0j7khEBdLUQPxRWyLVAZ8CzjRgIT7RhJgE7B+dwiHzI8DAw78sautIGpk/TOt3UopE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760974959; c=relaxed/simple;
	bh=J1qEu8fGiDcrPTAj+5tLwlyX1TubBEKum5OPgMNKJaY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ro0jdhgn6fA3nCZt3Ffi8mtqqqHnn5pyr1HfVBMcWlEh0oGD/l6UwugsFdpSlJ1lv//yOmw4yU4wRLpg/x2ppChW9J5zGiKrfugtJJW33HpYwOlDUqUUl175EmgWvMYAs5aqefF7Rc//gIL+6XSJRjcfrzpeD1ovm2RPTHKi9Rs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=llwThhlH; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="llwThhlH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760974957; x=1792510957;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=J1qEu8fGiDcrPTAj+5tLwlyX1TubBEKum5OPgMNKJaY=;
  b=llwThhlHCtAZT9O6Bnq4pPiueeF75H6hvA/DU7bn9CUhRZekj6ICGu38
   dGE+hQ3KXRYVGZrTTgoZpDuB6yjMIayLBcJ2pt6DXTFbVCvZycW77omG8
   xaa/3fdbjAs6mg+MFlNIxaZgTfXAaeiIuPjX1hZksYvS7REZEWOzK+7PT
   ynOmM5XyiwgHTByJvUA3usYqWSDfs0JTHugpkYgWVL4ydFZqti3Qd9XhQ
   j9LUOiAl8UoxzAkw72SnasX93I/IGl3qVialZ+o2t1Q8xTOghvz60t/tZ
   VYaWRCfp+HiNwNVII06g687hprSxPmSTGqMXzrias9DD7q+bk1TwSEATd
   w==;
X-CSE-ConnectionGUID: 2XLLMMzdRmOEdUNpcyE0Bg==
X-CSE-MsgGUID: ZaXFHSjoQgGWtnI60qQguw==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="62985673"
X-IronPort-AV: E=Sophos;i="6.19,242,1754982000"; 
   d="scan'208";a="62985673"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Oct 2025 08:42:36 -0700
X-CSE-ConnectionGUID: xD6juVyMQD2MJjQQSSAWPA==
X-CSE-MsgGUID: 7pc4CGbrRW+SgcM85P94uw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,242,1754982000"; 
   d="scan'208";a="183301865"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa006.fm.intel.com with ESMTP; 20 Oct 2025 08:42:35 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vAs1p-0009xN-1L;
	Mon, 20 Oct 2025 15:42:33 +0000
Date: Mon, 20 Oct 2025 23:42:17 +0800
From: kernel test robot <lkp@intel.com>
To: Donglin Peng <dolinux.peng@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH v2 2/5] btf: sort BTF types by kind and name to
 enable binary search
Message-ID: <202510202307.NGx2FlfT-lkp@intel.com>
References: <20251020093941.548058-3-dolinux.peng@gmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251020093941.548058-3-dolinux.peng@gmail.com>

Hi Donglin,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on bpf-next/net]
[also build test ERROR on bpf-next/master bpf/master linus/master v6.18-rc2 next-20251020]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Donglin-Peng/btf-search-local-BTF-before-base-BTF/20251020-174656
base:   https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next.git net
patch link:    https://lore.kernel.org/r/20251020093941.548058-3-dolinux.peng%40gmail.com
patch subject: [RFC PATCH v2 2/5] btf: sort BTF types by kind and name to enable binary search
config: x86_64-buildonly-randconfig-004-20251020 (https://download.01.org/0day-ci/archive/20251020/202510202307.NGx2FlfT-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251020/202510202307.NGx2FlfT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510202307.NGx2FlfT-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from include/linux/bpf.h:29,
                    from include/linux/security.h:35,
                    from include/linux/perf_event.h:53,
                    from include/linux/trace_events.h:10,
                    from include/trace/syscall.h:7,
                    from include/linux/syscalls.h:95,
                    from include/linux/syscalls_api.h:1,
                    from kernel/sched/sched.h:61,
                    from kernel/sched/rq-offsets.c:5:
>> include/linux/btf.h:703:1: error: expected identifier or '(' before '{' token
     703 | {}
         | ^
>> include/linux/btf.h:702:20: warning: 'btf_check_sorted' declared 'static' but never defined [-Wunused-function]
     702 | static inline void btf_check_sorted(struct btf *btf, int start_id);
         |                    ^~~~~~~~~~~~~~~~
   make[3]: *** [scripts/Makefile.build:182: kernel/sched/rq-offsets.s] Error 1 shuffle=1795504952
   make[3]: Target 'prepare' not remade because of errors.
   make[2]: *** [Makefile:1280: prepare0] Error 2 shuffle=1795504952
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:248: __sub-make] Error 2 shuffle=1795504952
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:248: __sub-make] Error 2 shuffle=1795504952
   make: Target 'prepare' not remade because of errors.


vim +703 include/linux/btf.h

   642	
   643	static inline const char *btf_name_by_offset(const struct btf *btf,
   644						     u32 offset)
   645	{
   646		return NULL;
   647	}
   648	static inline u32 *btf_kfunc_id_set_contains(const struct btf *btf,
   649						     u32 kfunc_btf_id,
   650						     struct bpf_prog *prog)
   651	
   652	{
   653		return NULL;
   654	}
   655	static inline int register_btf_kfunc_id_set(enum bpf_prog_type prog_type,
   656						    const struct btf_kfunc_id_set *s)
   657	{
   658		return 0;
   659	}
   660	static inline s32 btf_find_dtor_kfunc(struct btf *btf, u32 btf_id)
   661	{
   662		return -ENOENT;
   663	}
   664	static inline int register_btf_id_dtor_kfuncs(const struct btf_id_dtor_kfunc *dtors,
   665						      u32 add_cnt, struct module *owner)
   666	{
   667		return 0;
   668	}
   669	static inline struct btf_struct_meta *btf_find_struct_meta(const struct btf *btf, u32 btf_id)
   670	{
   671		return NULL;
   672	}
   673	static inline bool
   674	btf_is_prog_ctx_type(struct bpf_verifier_log *log, const struct btf *btf,
   675			     const struct btf_type *t, enum bpf_prog_type prog_type,
   676			     int arg)
   677	{
   678		return false;
   679	}
   680	static inline int get_kern_ctx_btf_id(struct bpf_verifier_log *log,
   681					      enum bpf_prog_type prog_type) {
   682		return -EINVAL;
   683	}
   684	static inline bool btf_types_are_same(const struct btf *btf1, u32 id1,
   685					      const struct btf *btf2, u32 id2)
   686	{
   687		return false;
   688	}
   689	static inline int btf_check_iter_arg(struct btf *btf, const struct btf_type *func, int arg_idx)
   690	{
   691		return -EOPNOTSUPP;
   692	}
   693	static inline int btf_compare_type_kinds_names(const void *a, const void *b, void *priv)
   694	{
   695		return -EOPNOTSUPP;
   696	}
   697	static inline s32 find_btf_by_name_kind(const struct btf *btf, int start_id, const char *type_name,
   698				  u32 kind)
   699	{
   700		return -EOPNOTSUPP;
   701	}
 > 702	static inline void btf_check_sorted(struct btf *btf, int start_id);
 > 703	{}

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
