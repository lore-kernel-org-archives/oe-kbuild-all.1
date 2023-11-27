Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 506C736AE4
	for <oe-kbuild-all@lists.linux.dev>; Mon, 27 Nov 2023 16:30:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fWsVd7IO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701102600; x=1732638600;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=KQpyuKCJyibp4IHyGGIrIE6tPwrpgJe0Bq3V5hCGJmY=;
  b=fWsVd7IO3MJMmq55kySWJiEXSKlOulrqbtG+yVWuxUo8swLZfZ7Og9zr
   yHHEr8pviuCWgZ/hcB+qpuoXLQZ0S458k9O7TCLgwG0nNRExPwenV0At6
   W46B1DDjuOqNPbQhsgein9EhBU7LDXuLd1xxYfxU0EPYvnKAl839iThuZ
   FQCP+KlBRxJyV0sbSds/7Ba2gSRyvuuO/YP1i284f+6XZJAsJ6pwQcBm5
   bkHjyNZOBCabbyYsf/c5c0iK9QTV2D5q2+J6l6jRevn+Tqo1fyX05CZkw
   9CpgthWqKFfxYanpGa18sJcjZ1/eRBBsPzlYWznoEMPnHtDG7+NteSVHU
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10907"; a="14296692"
X-IronPort-AV: E=Sophos;i="6.04,231,1695711600"; 
   d="scan'208";a="14296692"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Nov 2023 08:28:40 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10907"; a="859103019"
X-IronPort-AV: E=Sophos;i="6.04,231,1695711600"; 
   d="scan'208";a="859103019"
Received: from lkp-server01.sh.intel.com (HELO d584ee6ebdcc) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 27 Nov 2023 08:28:37 -0800
Received: from kbuild by d584ee6ebdcc with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r7eSh-0006QU-1L;
	Mon, 27 Nov 2023 16:27:55 +0000
Date: Tue, 28 Nov 2023 00:27:02 +0800
From: kernel test robot <lkp@intel.com>
To: Jiri Olsa <jolsa@kernel.org>, Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Andrii Nakryiko <andrii@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, Lee Jones <lee@kernel.org>,
	Maciej Fijalkowski <maciej.fijalkowski@intel.com>,
	syzbot+97a4fe20470e9bc30810@syzkaller.appspotmail.com,
	bpf@vger.kernel.org, Martin KaFai Lau <kafai@fb.com>,
	Song Liu <songliubraving@fb.com>, Yonghong Song <yhs@fb.com>,
	John Fastabend <john.fastabend@gmail.com>,
	KP Singh <kpsingh@chromium.org>,
	Stanislav Fomichev <sdf@google.com>, Hao Luo <haoluo@google.com>
Subject: Re: [PATCH bpf] bpf, x64: Fix prog_array_map_poke_run map poke update
Message-ID: <202311272245.sevnkuSF-lkp@intel.com>
References: <20231127094525.1366740-1-jolsa@kernel.org>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231127094525.1366740-1-jolsa@kernel.org>

Hi Jiri,

kernel test robot noticed the following build errors:

[auto build test ERROR on bpf/master]

url:    https://github.com/intel-lab-lkp/linux/commits/Jiri-Olsa/bpf-x64-Fix-prog_array_map_poke_run-map-poke-update/20231127-174900
base:   https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf.git master
patch link:    https://lore.kernel.org/r/20231127094525.1366740-1-jolsa%40kernel.org
patch subject: [PATCH bpf] bpf, x64: Fix prog_array_map_poke_run map poke update
config: i386-randconfig-061-20231127 (https://download.01.org/0day-ci/archive/20231127/202311272245.sevnkuSF-lkp@intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231127/202311272245.sevnkuSF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311272245.sevnkuSF-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: kernel/bpf/arraymap.o: in function `prog_array_map_poke_run':
>> kernel/bpf/arraymap.c:1067: undefined reference to `__bpf_arch_text_poke'
>> ld: kernel/bpf/arraymap.c:1079: undefined reference to `__bpf_arch_text_poke'
   ld: kernel/bpf/arraymap.c:1090: undefined reference to `__bpf_arch_text_poke'
   ld: kernel/bpf/arraymap.c:1072: undefined reference to `__bpf_arch_text_poke'


vim +1067 kernel/bpf/arraymap.c

  1014	
  1015	static void prog_array_map_poke_run(struct bpf_map *map, u32 key,
  1016					    struct bpf_prog *old,
  1017					    struct bpf_prog *new)
  1018	{
  1019		u8 *old_addr, *new_addr, *old_bypass_addr;
  1020		struct prog_poke_elem *elem;
  1021		struct bpf_array_aux *aux;
  1022	
  1023		aux = container_of(map, struct bpf_array, map)->aux;
  1024		WARN_ON_ONCE(!mutex_is_locked(&aux->poke_mutex));
  1025	
  1026		list_for_each_entry(elem, &aux->poke_progs, list) {
  1027			struct bpf_jit_poke_descriptor *poke;
  1028			int i, ret;
  1029	
  1030			for (i = 0; i < elem->aux->size_poke_tab; i++) {
  1031				poke = &elem->aux->poke_tab[i];
  1032	
  1033				/* Few things to be aware of:
  1034				 *
  1035				 * 1) We can only ever access aux in this context, but
  1036				 *    not aux->prog since it might not be stable yet and
  1037				 *    there could be danger of use after free otherwise.
  1038				 * 2) Initially when we start tracking aux, the program
  1039				 *    is not JITed yet and also does not have a kallsyms
  1040				 *    entry. We skip these as poke->tailcall_target_stable
  1041				 *    is not active yet. The JIT will do the final fixup
  1042				 *    before setting it stable. The various
  1043				 *    poke->tailcall_target_stable are successively
  1044				 *    activated, so tail call updates can arrive from here
  1045				 *    while JIT is still finishing its final fixup for
  1046				 *    non-activated poke entries.
  1047				 * 3) Also programs reaching refcount of zero while patching
  1048				 *    is in progress is okay since we're protected under
  1049				 *    poke_mutex and untrack the programs before the JIT
  1050				 *    buffer is freed.
  1051				 * 4) Any error happening below from __bpf_arch_text_poke()
  1052				 *    is a unexpected bug.
  1053				 */
  1054				if (!READ_ONCE(poke->tailcall_target_stable))
  1055					continue;
  1056				if (poke->reason != BPF_POKE_REASON_TAIL_CALL)
  1057					continue;
  1058				if (poke->tail_call.map != map ||
  1059				    poke->tail_call.key != key)
  1060					continue;
  1061	
  1062				old_bypass_addr = old ? NULL : poke->bypass_addr;
  1063				old_addr = old ? (u8 *)old->bpf_func + poke->adj_off : NULL;
  1064				new_addr = new ? (u8 *)new->bpf_func + poke->adj_off : NULL;
  1065	
  1066				if (new) {
> 1067					ret = __bpf_arch_text_poke(poke->tailcall_target,
  1068								 BPF_MOD_JUMP,
  1069								 old_addr, new_addr);
  1070					BUG_ON(ret < 0);
  1071					if (!old) {
  1072						ret = __bpf_arch_text_poke(poke->tailcall_bypass,
  1073									 BPF_MOD_JUMP,
  1074									 poke->bypass_addr,
  1075									 NULL);
  1076						BUG_ON(ret < 0);
  1077					}
  1078				} else {
> 1079					ret = __bpf_arch_text_poke(poke->tailcall_bypass,
  1080								 BPF_MOD_JUMP,
  1081								 old_bypass_addr,
  1082								 poke->bypass_addr);
  1083					BUG_ON(ret < 0);
  1084					/* let other CPUs finish the execution of program
  1085					 * so that it will not possible to expose them
  1086					 * to invalid nop, stack unwind, nop state
  1087					 */
  1088					if (!ret)
  1089						synchronize_rcu();
  1090					ret = __bpf_arch_text_poke(poke->tailcall_target,
  1091								 BPF_MOD_JUMP,
  1092								 old_addr, NULL);
  1093					BUG_ON(ret < 0);
  1094				}
  1095			}
  1096		}
  1097	}
  1098	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
