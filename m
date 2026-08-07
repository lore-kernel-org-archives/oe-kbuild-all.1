Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE75E392C50
	for <oe-kbuild-all@lists.linux.dev>; Fri,  7 Aug 2026 03:26:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786073173; cv=none; b=EfrSYg2lbRW0IAK4uAfxFTGyjdhOjjrJZd3BWeaa4yxrH4Hc/ycqlWBLmYBTLm0HSAuO8XkV65OWum9Amt5FlZANSHenrnZzQ9/VkNRF/kScUgHtsnnp9uQrkBfV5VaPGwkusDPbA3SPV6F0l1i90U15Xsh6+IpcgKL8l7x2MIU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786073173; c=relaxed/simple;
	bh=FsIbhgxmwFlavCIj+S2RT63InHtLpUNZ6Ln0GQvBNZs=;
	h=Date:From:To:Cc:Subject:Message-ID; b=nfUKzAxjcfjBafp7EF2bmeKs+J+Cl70Wo2USqXK+mWksQJ8uLbZGse5g0Dnpx6DYfQFgV5Qg139tT84ZKOPjMX0eHOdbjT4m8hpgISTvHzFPRUGLM8tgD+LC/aE+6hSCd83pMOJmbrQAoYZNx5iqIst2ihC8z/MS6ddbmuR7Tck=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=W9+lOLmz; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="W9+lOLmz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786073171; x=1817609171;
  h=date:from:to:cc:subject:message-id;
  bh=FsIbhgxmwFlavCIj+S2RT63InHtLpUNZ6Ln0GQvBNZs=;
  b=W9+lOLmzn7F36GHB23KUv530acDXFoGIl4f4ikyvBtT5jWRr6bdemWX5
   sD64IwC+WGQS+pY5R1j62MCYCIdUmL/mGSZMWCUV0/JJThO1OvWOood8/
   Pd4LzDSds0DpZOJcqv90yw0Ju3ZOpcQPWPH1ZtI0ncSMe/0RJ5uHHNY/A
   mZP6MwaROsoHeyTdHjqwlamSNQDthSpPA/UVhTpVUL+q9BZFqCdeTvigq
   3KBEiJlOIhuBFWDj8q5gt6UViWXjGXc63VGq4qQns9YC7esm1Vf+0z+ho
   bGBCYlK2xozV/hBX66/AqJRm5Ryv9FM0lsTaHlFZ+u2tjaULH21XJfqlf
   g==;
X-CSE-ConnectionGUID: x+bVBJUNQsuJtbUSVtmpCw==
X-CSE-MsgGUID: YEsvDrTpS6aMhNlVfpJwNg==
X-IronPort-AV: E=McAfee;i="6800,10657,11867"; a="98188851"
X-IronPort-AV: E=Sophos;i="6.25,209,1779174000"; 
   d="scan'208";a="98188851"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Aug 2026 20:26:10 -0700
X-CSE-ConnectionGUID: RFOE7+f6SkeWR9oNJrW/cg==
X-CSE-MsgGUID: HKWkQxqdRvSmSZyPphPHlg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,209,1779174000"; 
   d="scan'208";a="292172230"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 06 Aug 2026 20:26:09 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wsBDi-00000000H1m-1zRR;
	Fri, 07 Aug 2026 03:26:06 +0000
Date: Fri, 07 Aug 2026 11:25:10 +0800
From: kernel test robot <lkp@intel.com>
To: Kumar Kartikeya Dwivedi <memxor@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [kkdwivedi:arena-args 14/14]
 kernel/bpf/trampoline.c:957:undefined reference to
 `bpf_prog_has_arena_ctx_arg'
Message-ID: <202608071101.khLFpmUL-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/kkdwivedi/linux arena-args
head:   15ae81f222268f3e796b1a2ab478fa12eda2354d
commit: 15ae81f222268f3e796b1a2ab478fa12eda2354d [14/14] bpf: Reject tracing progs for struct_ops with arena args
config: x86_64-randconfig-075-20260807 (https://download.01.org/0day-ci/archive/20260807/202608071101.khLFpmUL-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260807/202608071101.khLFpmUL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608071101.khLFpmUL-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: kernel/bpf/trampoline.o: in function `__bpf_trampoline_link_prog':
>> kernel/bpf/trampoline.c:957:(.text+0x65a9): undefined reference to `bpf_prog_has_arena_ctx_arg'


vim +957 kernel/bpf/trampoline.c

e6cc9ed677e6222 Jiri Olsa          2026-06-06  941  
65499074efaf574 Jiri Olsa          2026-06-06  942  static int __bpf_trampoline_link_prog(struct bpf_tramp_node *node,
e6cc9ed677e6222 Jiri Olsa          2026-06-06  943  				      struct bpf_trampoline *tr,
e6cc9ed677e6222 Jiri Olsa          2026-06-06  944  				      struct bpf_prog *tgt_prog,
e6cc9ed677e6222 Jiri Olsa          2026-06-06  945  				      const struct bpf_trampoline_ops *ops,
e6cc9ed677e6222 Jiri Olsa          2026-06-06  946  				      void *data)
e6cc9ed677e6222 Jiri Olsa          2026-06-06  947  {
e6cc9ed677e6222 Jiri Olsa          2026-06-06  948  	enum bpf_tramp_prog_type kind;
e6cc9ed677e6222 Jiri Olsa          2026-06-06  949  	int err = 0;
e6cc9ed677e6222 Jiri Olsa          2026-06-06  950  	int cnt = 0, i;
e6cc9ed677e6222 Jiri Olsa          2026-06-06  951  
65499074efaf574 Jiri Olsa          2026-06-06  952  	kind = bpf_attach_type_to_tramp(node->link->prog);
772e00a29fe12f6 Tejun Heo          2026-08-03  953  	/*
772e00a29fe12f6 Tejun Heo          2026-08-03  954  	 * Arena ctx args are converted only by struct_ops indirect
772e00a29fe12f6 Tejun Heo          2026-08-03  955  	 * trampolines. They must never be attached to a generic trampoline.
772e00a29fe12f6 Tejun Heo          2026-08-03  956  	 */
772e00a29fe12f6 Tejun Heo          2026-08-03 @957  	if (WARN_ON_ONCE(bpf_prog_has_arena_ctx_arg(node->link->prog)))
772e00a29fe12f6 Tejun Heo          2026-08-03  958  		return -ENOTSUPP;
772e00a29fe12f6 Tejun Heo          2026-08-03  959  
e6cc9ed677e6222 Jiri Olsa          2026-06-06  960  	if (tr->extension_prog)
e6cc9ed677e6222 Jiri Olsa          2026-06-06  961  		/* cannot attach fentry/fexit if extension prog is attached.
e6cc9ed677e6222 Jiri Olsa          2026-06-06  962  		 * cannot overwrite extension prog either.
e6cc9ed677e6222 Jiri Olsa          2026-06-06  963  		 */
e6cc9ed677e6222 Jiri Olsa          2026-06-06  964  		return -EBUSY;
e6cc9ed677e6222 Jiri Olsa          2026-06-06  965  
e6cc9ed677e6222 Jiri Olsa          2026-06-06  966  	for (i = 0; i < BPF_TRAMP_MAX; i++)
e6cc9ed677e6222 Jiri Olsa          2026-06-06  967  		cnt += tr->progs_cnt[i];
e6cc9ed677e6222 Jiri Olsa          2026-06-06  968  
e6cc9ed677e6222 Jiri Olsa          2026-06-06  969  	if (kind == BPF_TRAMP_REPLACE) {
e6cc9ed677e6222 Jiri Olsa          2026-06-06  970  		/* Cannot attach extension if fentry/fexit are in use. */
e6cc9ed677e6222 Jiri Olsa          2026-06-06  971  		if (cnt)
e6cc9ed677e6222 Jiri Olsa          2026-06-06  972  			return -EBUSY;
e6cc9ed677e6222 Jiri Olsa          2026-06-06  973  		err = bpf_freplace_check_tgt_prog(tgt_prog);
e6cc9ed677e6222 Jiri Olsa          2026-06-06  974  		if (err)
e6cc9ed677e6222 Jiri Olsa          2026-06-06  975  			return err;
65499074efaf574 Jiri Olsa          2026-06-06  976  		tr->extension_prog = node->link->prog;
e6cc9ed677e6222 Jiri Olsa          2026-06-06  977  		return bpf_arch_text_poke(tr->func.addr, BPF_MOD_NOP,
e6cc9ed677e6222 Jiri Olsa          2026-06-06  978  					  BPF_MOD_JUMP, NULL,
65499074efaf574 Jiri Olsa          2026-06-06  979  					  node->link->prog->bpf_func);
2d419c44658f75e Menglong Dong      2026-01-24  980  	}
65499074efaf574 Jiri Olsa          2026-06-06  981  	err = bpf_trampoline_add_prog(tr, node, cnt);
e6cc9ed677e6222 Jiri Olsa          2026-06-06  982  	if (err)
e6cc9ed677e6222 Jiri Olsa          2026-06-06  983  		return err;
e6cc9ed677e6222 Jiri Olsa          2026-06-06  984  	err = bpf_trampoline_update(tr, true /* lock_direct_mutex */, ops, data);
e6cc9ed677e6222 Jiri Olsa          2026-06-06  985  	if (err)
65499074efaf574 Jiri Olsa          2026-06-06  986  		bpf_trampoline_remove_prog(tr, node);
af3f4134006bf3b Stanislav Fomichev 2022-06-28  987  	return err;
af3f4134006bf3b Stanislav Fomichev 2022-06-28  988  }
af3f4134006bf3b Stanislav Fomichev 2022-06-28  989  

:::::: The code at line 957 was first introduced by commit
:::::: 772e00a29fe12f6af7d0d341c0ac0a26eb5e6be1 bpf: Support __arena and __arena_nullable on struct_ops arguments

:::::: TO: Tejun Heo <tj@kernel.org>
:::::: CC: Kumar Kartikeya Dwivedi <memxor@gmail.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
