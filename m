Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CB613234
	for <oe-kbuild-all@lists.linux.dev>; Wed,  5 Apr 2023 18:54:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680720867; x=1712256867;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=8ySDpSlY61EmOZUDP9ab+Mrr9+JW/wcfMmHmCCzcMfg=;
  b=XuI36g29NulwfPPRqzY+2gBpr+ufcKuygwoKHHfiu9WdNGyStRimiJDA
   OaMC5vEixmq8/sNiHCCYqkHqZxIWUoMKxLS2AEmzP6IoYUxFXKXeAwjqx
   xugNOUG51ckyIoBSL4DqIunZSizpJxILxtiWearZFJa+j0LPscM0ZKUUy
   UMSWS10le91mxeJjqNU+lHyvbw//wb4/mupTNeaRAFz+hsiAQccg/+CVG
   HOmTW8e8uYZvzESuT38gBZ6jUEOGqziWkD21QY3UADr50wtEgXvJDdwEK
   2zFRVCh4GJiHFdJd/Ub1waZbkm7K+smC9KNe2CvSqY7cQpMkuJVXrPBvh
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10671"; a="370370268"
X-IronPort-AV: E=Sophos;i="5.98,321,1673942400"; 
   d="scan'208";a="370370268"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Apr 2023 11:54:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10671"; a="861099879"
X-IronPort-AV: E=Sophos;i="5.98,321,1673942400"; 
   d="scan'208";a="861099879"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 05 Apr 2023 11:54:22 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pk8Gz-000QiU-04;
	Wed, 05 Apr 2023 18:54:21 +0000
Date: Thu, 6 Apr 2023 02:54:13 +0800
From: kernel test robot <lkp@intel.com>
To: Ilya Leoshkevich <iii@linux.ibm.com>,
	Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Andrii Nakryiko <andrii@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, bpf@vger.kernel.org,
	Heiko Carstens <hca@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Jiri Olsa <olsajiri@gmail.com>, Stanislav Fomichev <sdf@google.com>,
	Ilya Leoshkevich <iii@linux.ibm.com>
Subject: Re: [PATCH bpf-next v5] bpf: Support 64-bit pointers to kfuncs
Message-ID: <202304060240.OeUgnjzZ-lkp@intel.com>
References: <20230405141407.172357-1-iii@linux.ibm.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230405141407.172357-1-iii@linux.ibm.com>

Hi Ilya,

kernel test robot noticed the following build errors:

[auto build test ERROR on bpf-next/master]

url:    https://github.com/intel-lab-lkp/linux/commits/Ilya-Leoshkevich/bpf-Support-64-bit-pointers-to-kfuncs/20230405-221738
base:   https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next.git master
patch link:    https://lore.kernel.org/r/20230405141407.172357-1-iii%40linux.ibm.com
patch subject: [PATCH bpf-next v5] bpf: Support 64-bit pointers to kfuncs
config: i386-randconfig-r022-20230403 (https://download.01.org/0day-ci/archive/20230406/202304060240.OeUgnjzZ-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce (this is a W=1 build):
        # https://github.com/intel-lab-lkp/linux/commit/43119fecff7ac0771f037a6dc128ceb791917466
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Ilya-Leoshkevich/bpf-Support-64-bit-pointers-to-kfuncs/20230405-221738
        git checkout 43119fecff7ac0771f037a6dc128ceb791917466
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=i386 olddefconfig
        make W=1 O=build_dir ARCH=i386 SHELL=/bin/bash kernel/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304060240.OeUgnjzZ-lkp@intel.com/

All errors (new ones prefixed by >>):

   kernel/bpf/core.c: In function 'bpf_jit_get_func_addr':
>> kernel/bpf/core.c:1207:23: error: implicit declaration of function 'bpf_get_kfunc_addr'; did you mean 'bpf_jit_get_func_addr'? [-Werror=implicit-function-declaration]
    1207 |                 err = bpf_get_kfunc_addr(prog, insn->imm, insn->off, &addr);
         |                       ^~~~~~~~~~~~~~~~~~
         |                       bpf_jit_get_func_addr
   kernel/bpf/core.c: At top level:
   kernel/bpf/core.c:1638:12: warning: no previous prototype for 'bpf_probe_read_kernel' [-Wmissing-prototypes]
    1638 | u64 __weak bpf_probe_read_kernel(void *dst, u32 size, const void *unsafe_ptr)
         |            ^~~~~~~~~~~~~~~~~~~~~
   kernel/bpf/core.c:2075:6: warning: no previous prototype for 'bpf_patch_call_args' [-Wmissing-prototypes]
    2075 | void bpf_patch_call_args(struct bpf_insn *insn, u32 stack_depth)
         |      ^~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +1207 kernel/bpf/core.c

  1182	
  1183	int bpf_jit_get_func_addr(const struct bpf_prog *prog,
  1184				  const struct bpf_insn *insn, bool extra_pass,
  1185				  u64 *func_addr, bool *func_addr_fixed)
  1186	{
  1187		s16 off = insn->off;
  1188		s32 imm = insn->imm;
  1189		u8 *addr;
  1190		int err;
  1191	
  1192		*func_addr_fixed = insn->src_reg != BPF_PSEUDO_CALL;
  1193		if (!*func_addr_fixed) {
  1194			/* Place-holder address till the last pass has collected
  1195			 * all addresses for JITed subprograms in which case we
  1196			 * can pick them up from prog->aux.
  1197			 */
  1198			if (!extra_pass)
  1199				addr = NULL;
  1200			else if (prog->aux->func &&
  1201				 off >= 0 && off < prog->aux->func_cnt)
  1202				addr = (u8 *)prog->aux->func[off]->bpf_func;
  1203			else
  1204				return -EINVAL;
  1205		} else if (insn->src_reg == BPF_PSEUDO_KFUNC_CALL &&
  1206			   bpf_jit_supports_far_kfunc_call()) {
> 1207			err = bpf_get_kfunc_addr(prog, insn->imm, insn->off, &addr);
  1208			if (err)
  1209				return err;
  1210		} else {
  1211			/* Address of a BPF helper call. Since part of the core
  1212			 * kernel, it's always at a fixed location. __bpf_call_base
  1213			 * and the helper with imm relative to it are both in core
  1214			 * kernel.
  1215			 */
  1216			addr = (u8 *)__bpf_call_base + imm;
  1217		}
  1218	
  1219		*func_addr = (unsigned long)addr;
  1220		return 0;
  1221	}
  1222	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
