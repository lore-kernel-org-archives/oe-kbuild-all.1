Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D17D33419D
	for <oe-kbuild-all@lists.linux.dev>; Mon, 18 Sep 2023 22:30:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695076257; x=1726612257;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=gRADdTb7wvW2svTuph32crKZ5CApE4KcvrsznUfArq0=;
  b=RQUUKPkp9m7kuyLYqtH6Ps6S+jvFtEIOaVb9QVY6/GU11ZL4sgxLTR4V
   IkAUEnLq+9p0XUtaQMgKiTl/L3x2vocJQVTZr6oioRWyt/ktabN78dwTA
   MMfmhGSDYl03lxoTSOiQmL5Pz6W1/3B+rwaYKJBRVX05zuGuNr9AHUcVV
   MXzqdAW20HEdDBMEeAtA8SB9CmnLlQ/8Le93kTgji4tArL525T7FubM9E
   eptlT4Xrxoz+4zembxV9iRvEI6V+o/rKi1Sd/45ubUVEKRjANLVJm8G7d
   cZ4rESHIO47xXnZCp2akBXUmkM5O/DUfzZGazxDGiz7066tMsiEEoJUsk
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10837"; a="466131742"
X-IronPort-AV: E=Sophos;i="6.02,157,1688454000"; 
   d="scan'208";a="466131742"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Sep 2023 15:30:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10837"; a="992913535"
X-IronPort-AV: E=Sophos;i="6.02,157,1688454000"; 
   d="scan'208";a="992913535"
Received: from lkp-server02.sh.intel.com (HELO 9ef86b2655e5) ([10.239.97.151])
  by fmsmga006.fm.intel.com with ESMTP; 18 Sep 2023 15:30:53 -0700
Received: from kbuild by 9ef86b2655e5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qiMlX-0006aM-2q;
	Mon, 18 Sep 2023 22:30:51 +0000
Date: Tue, 19 Sep 2023 06:30:49 +0800
From: kernel test robot <lkp@intel.com>
To: Kumar Kartikeya Dwivedi <memxor@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Alexei Starovoitov <ast@kernel.org>
Subject: [linux-next:master 5430/5912] kernel/bpf/verifier.c:15232:13:
 warning: variable 'prev_offset' set but not used
Message-ID: <202309190634.fL17FWoT-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   7fc7222d9680366edeecc219c21ca96310bdbc10
commit: aaa619ebccb2b78b3c6d2c0cd72d206ee8fc0025 [5430/5912] bpf: Refactor check_btf_func and split into two phases
config: arc-randconfig-002-20230919 (https://download.01.org/0day-ci/archive/20230919/202309190634.fL17FWoT-lkp@intel.com/config)
compiler: arc-elf-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230919/202309190634.fL17FWoT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309190634.fL17FWoT-lkp@intel.com/

All warnings (new ones prefixed by >>):

   kernel/bpf/verifier.c: In function 'check_btf_func':
>> kernel/bpf/verifier.c:15232:13: warning: variable 'prev_offset' set but not used [-Wunused-but-set-variable]
   15232 |         u32 prev_offset = 0;
         |             ^~~~~~~~~~~
>> kernel/bpf/verifier.c:15225:35: warning: variable 'min_size' set but not used [-Wunused-but-set-variable]
   15225 |         u32 i, nfuncs, urec_size, min_size;
         |                                   ^~~~~~~~


vim +/prev_offset +15232 kernel/bpf/verifier.c

 15219	
 15220	static int check_btf_func(struct bpf_verifier_env *env,
 15221				  const union bpf_attr *attr,
 15222				  bpfptr_t uattr)
 15223	{
 15224		const struct btf_type *type, *func_proto, *ret_type;
 15225		u32 i, nfuncs, urec_size, min_size;
 15226		u32 krec_size = sizeof(struct bpf_func_info);
 15227		struct bpf_func_info *krecord;
 15228		struct bpf_func_info_aux *info_aux = NULL;
 15229		struct bpf_prog *prog;
 15230		const struct btf *btf;
 15231		bpfptr_t urecord;
 15232		u32 prev_offset = 0;
 15233		bool scalar_return;
 15234		int ret = -ENOMEM;
 15235	
 15236		nfuncs = attr->func_info_cnt;
 15237		if (!nfuncs) {
 15238			if (check_abnormal_return(env))
 15239				return -EINVAL;
 15240			return 0;
 15241		}
 15242		if (nfuncs != env->subprog_cnt) {
 15243			verbose(env, "number of funcs in func_info doesn't match number of subprogs\n");
 15244			return -EINVAL;
 15245		}
 15246	
 15247		urec_size = attr->func_info_rec_size;
 15248	
 15249		prog = env->prog;
 15250		btf = prog->aux->btf;
 15251	
 15252		urecord = make_bpfptr(attr->func_info, uattr.is_kernel);
 15253		min_size = min_t(u32, krec_size, urec_size);
 15254	
 15255		krecord = prog->aux->func_info;
 15256		info_aux = kcalloc(nfuncs, sizeof(*info_aux), GFP_KERNEL | __GFP_NOWARN);
 15257		if (!info_aux)
 15258			return -ENOMEM;
 15259	
 15260		for (i = 0; i < nfuncs; i++) {
 15261			/* check insn_off */
 15262			ret = -EINVAL;
 15263	
 15264			if (env->subprog_info[i].start != krecord[i].insn_off) {
 15265				verbose(env, "func_info BTF section doesn't match subprog layout in BPF program\n");
 15266				goto err_free;
 15267			}
 15268	
 15269			/* Already checked type_id */
 15270			type = btf_type_by_id(btf, krecord[i].type_id);
 15271			info_aux[i].linkage = BTF_INFO_VLEN(type->info);
 15272			/* Already checked func_proto */
 15273			func_proto = btf_type_by_id(btf, type->type);
 15274	
 15275			ret_type = btf_type_skip_modifiers(btf, func_proto->type, NULL);
 15276			scalar_return =
 15277				btf_type_is_small_int(ret_type) || btf_is_any_enum(ret_type);
 15278			if (i && !scalar_return && env->subprog_info[i].has_ld_abs) {
 15279				verbose(env, "LD_ABS is only allowed in functions that return 'int'.\n");
 15280				goto err_free;
 15281			}
 15282			if (i && !scalar_return && env->subprog_info[i].has_tail_call) {
 15283				verbose(env, "tail_call is only allowed in functions that return 'int'.\n");
 15284				goto err_free;
 15285			}
 15286	
 15287			prev_offset = krecord[i].insn_off;
 15288			bpfptr_add(&urecord, urec_size);
 15289		}
 15290	
 15291		prog->aux->func_info_aux = info_aux;
 15292		return 0;
 15293	
 15294	err_free:
 15295		kfree(info_aux);
 15296		return ret;
 15297	}
 15298	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
