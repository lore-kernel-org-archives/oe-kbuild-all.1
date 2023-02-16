Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BB556FD6
	for <oe-kbuild-all@lists.linux.dev>; Thu, 16 Feb 2023 16:43:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676565805; x=1708101805;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=g2eIYHh9zGxtdvu7NiOAjrjjkKuyIVvDaoZ19Y4BUC8=;
  b=EriLHhYH+lAO7wmvuO9u1ZewKhhWo/snxFu2eglO0/urYti5EuFUKUip
   WpFQ7kPDM/fhyxuDAdp1kRTRTWlvoVEnekkjTbrskM/ecG6JN9UU7vv1W
   /NtaAcWDMfGqRNjRdRzp2ZXq/6szx3M2E/vAEnajOSyRyqA7GafsxaM5L
   Su2QFPILfNDLCoR8ndYIHacZ1G1FB48nwbeKUjRtPFF94+UqD/pH5BP4Z
   70nIWV4CYkD/9xXHSGMAGpHhyXAYJ+YwSgQH4uRXAMzNRc+3IbUF7nbMX
   cJmoPiWiNWQIOPll/BHorJsXbxD9sqpBCJi8bj4CGZS2dis71VponOhjZ
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10623"; a="319852253"
X-IronPort-AV: E=Sophos;i="5.97,302,1669104000"; 
   d="scan'208";a="319852253"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Feb 2023 08:34:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10623"; a="999104045"
X-IronPort-AV: E=Sophos;i="5.97,302,1669104000"; 
   d="scan'208";a="999104045"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 16 Feb 2023 08:34:31 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pShDK-000ALx-20;
	Thu, 16 Feb 2023 16:34:30 +0000
Date: Fri, 17 Feb 2023 00:33:31 +0800
From: kernel test robot <lkp@intel.com>
To: Ilya Leoshkevich <iii@linux.ibm.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH RFC bpf-next 1/1] bpf: Support 64-bit pointers to kfuncs
Message-ID: <202302170058.5ftAyjXt-lkp@intel.com>
References: <20230214212809.242632-2-iii@linux.ibm.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230214212809.242632-2-iii@linux.ibm.com>

Hi Ilya,

[FYI, it's a private test report for your RFC patch.]
[auto build test ERROR on bpf-next/master]

url:    https://github.com/intel-lab-lkp/linux/commits/Ilya-Leoshkevich/bpf-Support-64-bit-pointers-to-kfuncs/20230215-054702
base:   https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next.git master
patch link:    https://lore.kernel.org/r/20230214212809.242632-2-iii%40linux.ibm.com
patch subject: [PATCH RFC bpf-next 1/1] bpf: Support 64-bit pointers to kfuncs
config: loongarch-buildonly-randconfig-r003-20230214 (https://download.01.org/0day-ci/archive/20230217/202302170058.5ftAyjXt-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/5b93c73d640845b2e5ddd1b4af608f4896379002
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Ilya-Leoshkevich/bpf-Support-64-bit-pointers-to-kfuncs/20230215-054702
        git checkout 5b93c73d640845b2e5ddd1b4af608f4896379002
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=loongarch olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=loongarch SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302170058.5ftAyjXt-lkp@intel.com/

All errors (new ones prefixed by >>):

   kernel/bpf/core.c: In function 'bpf_jit_get_func_addr':
>> kernel/bpf/core.c:1217:23: error: implicit declaration of function 'bpf_get_kfunc_addr'; did you mean 'bpf_jit_get_func_addr'? [-Werror=implicit-function-declaration]
    1217 |                 err = bpf_get_kfunc_addr(prog, imm, off, &addr);
         |                       ^~~~~~~~~~~~~~~~~~
         |                       bpf_jit_get_func_addr
   kernel/bpf/core.c:1227:20: warning: assignment to 'u64' {aka 'long long unsigned int'} from 'u8 *' {aka 'unsigned char *'} makes integer from pointer without a cast [-Wint-conversion]
    1227 |         *func_addr = addr;
         |                    ^
   kernel/bpf/core.c: At top level:
   kernel/bpf/core.c:1646:12: warning: no previous prototype for 'bpf_probe_read_kernel' [-Wmissing-prototypes]
    1646 | u64 __weak bpf_probe_read_kernel(void *dst, u32 size, const void *unsafe_ptr)
         |            ^~~~~~~~~~~~~~~~~~~~~
   kernel/bpf/core.c:2085:6: warning: no previous prototype for 'bpf_patch_call_args' [-Wmissing-prototypes]
    2085 | void bpf_patch_call_args(struct bpf_insn *insn, u32 stack_depth)
         |      ^~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +1217 kernel/bpf/core.c

  1181	
  1182	int bpf_jit_get_func_addr(const struct bpf_prog *prog,
  1183				  const struct bpf_insn *insn, bool extra_pass,
  1184				  u64 *func_addr, bool *func_addr_fixed)
  1185	{
  1186		s16 off = insn->off;
  1187		s32 imm = insn->imm;
  1188		bool fixed;
  1189		u8 *addr;
  1190		int err;
  1191	
  1192		switch (insn->src_reg) {
  1193		case BPF_PSEUDO_CALL:
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
  1205			fixed = false;
  1206			break;
  1207		case 0:
  1208			/* Address of a BPF helper call. Since part of the core
  1209			 * kernel, it's always at a fixed location. __bpf_call_base
  1210			 * and the helper with imm relative to it are both in core
  1211			 * kernel.
  1212			 */
  1213			addr = (u8 *)__bpf_call_base + imm;
  1214			fixed = true;
  1215			break;
  1216		case BPF_PSEUDO_KFUNC_CALL:
> 1217			err = bpf_get_kfunc_addr(prog, imm, off, &addr);
  1218			if (err)
  1219				return err;
  1220			fixed = true;
  1221			break;
  1222		default:
  1223			return -EINVAL;
  1224		}
  1225	
  1226		*func_addr_fixed = fixed;
  1227		*func_addr = addr;
  1228		return 0;
  1229	}
  1230	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
