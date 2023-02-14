Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DDC52F24
	for <oe-kbuild-all@lists.linux.dev>; Tue, 14 Feb 2023 23:15:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676416526; x=1707952526;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=tvPQkNuaD2MeiO6BBhlWS0kqfNE3fkEFuRj59HqyWbI=;
  b=ImGUJIADnqAy95gaYFxGyBgt/QtbvdkyQd2fBz2jYvTJMkXns8cK/bkH
   Fyi7OKqUahstjjtUVp8jj/zrH3HpLuWkDsDoEF0kJ/UeM5/Z+hqclte/9
   TgTZrpPVVx8D7hK0+jWy1cN5sb5JFQiCKtljQjHdP53qd9vLMF55cyq5H
   6jLo8VBAcLOGXNhGrt8GNJpPGIVsGnlkWsDoMyDpaAiXG3bV2gF91v5TT
   uTV/DQufCmWXKMMQhIfg0kRzO0Uj5drT+d656Svkjo+8P4rn29zSyF/YY
   wbEXZF6XiH7csPGDkPi+gLx7U0FMRpKKhV6idTinZ5mAeiE4D/gMZ2d7a
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10621"; a="314947390"
X-IronPort-AV: E=Sophos;i="5.97,298,1669104000"; 
   d="scan'208";a="314947390"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Feb 2023 15:15:26 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10621"; a="843347561"
X-IronPort-AV: E=Sophos;i="5.97,298,1669104000"; 
   d="scan'208";a="843347561"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 14 Feb 2023 15:15:24 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pS4WB-0008qP-33;
	Tue, 14 Feb 2023 23:15:23 +0000
Date: Wed, 15 Feb 2023 07:14:28 +0800
From: kernel test robot <lkp@intel.com>
To: Ilya Leoshkevich <iii@linux.ibm.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH RFC bpf-next 1/1] bpf: Support 64-bit pointers to kfuncs
Message-ID: <202302150614.eexWgsVE-lkp@intel.com>
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
[auto build test WARNING on bpf-next/master]

url:    https://github.com/intel-lab-lkp/linux/commits/Ilya-Leoshkevich/bpf-Support-64-bit-pointers-to-kfuncs/20230215-054702
base:   https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next.git master
patch link:    https://lore.kernel.org/r/20230214212809.242632-2-iii%40linux.ibm.com
patch subject: [PATCH RFC bpf-next 1/1] bpf: Support 64-bit pointers to kfuncs
config: loongarch-allyesconfig (https://download.01.org/0day-ci/archive/20230215/202302150614.eexWgsVE-lkp@intel.com/config)
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
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=loongarch SHELL=/bin/bash kernel/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302150614.eexWgsVE-lkp@intel.com/

All warnings (new ones prefixed by >>):

   kernel/bpf/core.c: In function 'bpf_jit_get_func_addr':
>> kernel/bpf/core.c:1227:20: warning: assignment to 'u64' {aka 'long long unsigned int'} from 'u8 *' {aka 'unsigned char *'} makes integer from pointer without a cast [-Wint-conversion]
    1227 |         *func_addr = addr;
         |                    ^


vim +1227 kernel/bpf/core.c

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
  1217			err = bpf_get_kfunc_addr(prog, imm, off, &addr);
  1218			if (err)
  1219				return err;
  1220			fixed = true;
  1221			break;
  1222		default:
  1223			return -EINVAL;
  1224		}
  1225	
  1226		*func_addr_fixed = fixed;
> 1227		*func_addr = addr;
  1228		return 0;
  1229	}
  1230	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
