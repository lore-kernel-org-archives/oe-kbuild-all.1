Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 414511FC8
	for <oe-kbuild-all@lists.linux.dev>; Fri,  4 Aug 2023 05:17:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691126233; x=1722662233;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=e1cpoVNcGs0kUXxIvP1Pk1UFLtW1Z3PkHvbpqT0KCQE=;
  b=Uc1TKH2xsKJlLcFid5zCBV872WTzkmaI84NZGNedaAc4auUh489LcRzE
   3TrcrmXowmU7t6774yGrEQWQnmUbZ854FFp1/66SlU+Fx++OESJNty4tc
   rffmxjtSZBrkjCD1P64Yn4ygpXmAhj3y02vLrwKls6Cavhxb1j1ikimal
   kJOGAeV4Vv140rESP4zCq7ktPN0/0dv/7S/4d/3YZDj6UsH2h6nID1iSq
   BlflAlNyZxvlTe95nNZT9k4En3ls4nV0KTi+FmKpU1xeJIqn6TjoFkDNl
   bC7yRfFY+0k/7GmfImRbkoEotaM47SiA6RoMnaMMnjyEzkMoSXqTo2mE6
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10791"; a="349660667"
X-IronPort-AV: E=Sophos;i="6.01,254,1684825200"; 
   d="scan'208";a="349660667"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Aug 2023 22:17:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10791"; a="1060583122"
X-IronPort-AV: E=Sophos;i="6.01,254,1684825200"; 
   d="scan'208";a="1060583122"
Received: from lkp-server01.sh.intel.com (HELO d1ccc7e87e8f) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 03 Aug 2023 22:17:05 -0700
Received: from kbuild by d1ccc7e87e8f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qRnBQ-0002dU-1y;
	Fri, 04 Aug 2023 05:17:04 +0000
Date: Fri, 4 Aug 2023 13:16:55 +0800
From: kernel test robot <lkp@intel.com>
To: Charlie Jenkins <charlie@rivosinc.com>, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org, kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org, bpf@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Peter Zijlstra <peterz@infradead.org>,
	Josh Poimboeuf <jpoimboe@kernel.org>,
	Jason Baron <jbaron@akamai.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ard Biesheuvel <ardb@kernel.org>, Anup Patel <anup@brainfault.org>,
	Atish Patra <atishp@atishpatra.org>,
	Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Andrii Nakryiko <andrii@kernel.org>,
	Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>,
	Yonghong Song <yhs@fb.com>,
	John Fastabend <john.fastabend@gmail.com>,
	KP Singh <kpsingh@kernel.org>, Stanislav Fomichev <sdf@google.com>,
	Hao Luo <haoluo@google.com>, Jiri Olsa <jolsa@kernel.org>,
	=?iso-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn@kernel.org>,
	Luke Nelson <luke.r.nels@gmail.com>, Xi Wang <xi.wang@gmail.com>,
	Nam Cao <namcaov@gmail.com>
Subject: Re: [PATCH 10/10] RISC-V: Refactor bug and traps instructions
Message-ID: <202308041213.o49SRQWZ-lkp@intel.com>
References: <20230803-master-refactor-instructions-v4-v1-10-2128e61fa4ff@rivosinc.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230803-master-refactor-instructions-v4-v1-10-2128e61fa4ff@rivosinc.com>

Hi Charlie,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 5d0c230f1de8c7515b6567d9afba1f196fb4e2f4]

url:    https://github.com/intel-lab-lkp/linux/commits/Charlie-Jenkins/RISC-V-Expand-instruction-definitions/20230804-101437
base:   5d0c230f1de8c7515b6567d9afba1f196fb4e2f4
patch link:    https://lore.kernel.org/r/20230803-master-refactor-instructions-v4-v1-10-2128e61fa4ff%40rivosinc.com
patch subject: [PATCH 10/10] RISC-V: Refactor bug and traps instructions
config: riscv-allyesconfig (https://download.01.org/0day-ci/archive/20230804/202308041213.o49SRQWZ-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230804/202308041213.o49SRQWZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308041213.o49SRQWZ-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/riscv/kernel/elf_kexec.c:326: warning: "RV_X" redefined
     326 | #define RV_X(x, s, n)  (((x) >> (s)) & ((1 << (n)) - 1))
         | 
   In file included from arch/riscv/include/asm/bug.h:14,
                    from include/linux/bug.h:5,
                    from include/linux/thread_info.h:13,
                    from include/asm-generic/preempt.h:5,
                    from ./arch/riscv/include/generated/asm/preempt.h:1,
                    from include/linux/preempt.h:79,
                    from include/linux/spinlock.h:56,
                    from include/linux/ipc.h:5,
                    from include/uapi/linux/sem.h:5,
                    from include/linux/sem.h:5,
                    from include/linux/compat.h:14,
                    from arch/riscv/include/asm/elf.h:12,
                    from include/linux/elf.h:6,
                    from arch/riscv/kernel/elf_kexec.c:15:
   arch/riscv/include/asm/insn.h:1915: note: this is the location of the previous definition
    1915 | #define RV_X(X, s, mask)  (((X) >> (s)) & (mask))
         | 


vim +/RV_X +326 arch/riscv/kernel/elf_kexec.c

6261586e0c91db1 Liao Chang 2022-04-08  325  
838b3e28488f702 Li Zhengyu 2022-04-08 @326  #define RV_X(x, s, n)  (((x) >> (s)) & ((1 << (n)) - 1))
838b3e28488f702 Li Zhengyu 2022-04-08  327  #define RISCV_IMM_BITS 12
838b3e28488f702 Li Zhengyu 2022-04-08  328  #define RISCV_IMM_REACH (1LL << RISCV_IMM_BITS)
838b3e28488f702 Li Zhengyu 2022-04-08  329  #define RISCV_CONST_HIGH_PART(x) \
838b3e28488f702 Li Zhengyu 2022-04-08  330  	(((x) + (RISCV_IMM_REACH >> 1)) & ~(RISCV_IMM_REACH - 1))
838b3e28488f702 Li Zhengyu 2022-04-08  331  #define RISCV_CONST_LOW_PART(x) ((x) - RISCV_CONST_HIGH_PART(x))
838b3e28488f702 Li Zhengyu 2022-04-08  332  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
