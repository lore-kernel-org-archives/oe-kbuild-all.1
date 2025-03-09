Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 956472F2E
	for <oe-kbuild-all@lists.linux.dev>; Sun,  9 Mar 2025 06:58:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741503534; cv=none; b=L29tPD37wLjSL3T1ZL+EelbPHZZA6DWDcTp418vwccMAjhpaW8d3M1Qblj2WBiEbr6yZaaSLVhiiKxYxYIk0iKAplyEvouDMFh5m+yYQa3Fjfyn923th4gfpuBzgSUTsyAUwEqo0dq/E9TTH+FW2XkjT2sCRz8NqEEy0dcCcwA8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741503534; c=relaxed/simple;
	bh=zJkL+33OpBlwLGagD/SKr5zX8FBK47bGo5jRmMiG/Ms=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=MJxvNNHNeHF0WOEC0unFN/I3+6psT/Eb5mtbwhI/9GcCWWVem30j2hwgNq7ZX7o0uoGsxcwlzBDioVdBcmcGc9XstQfvPW7Oyaw7FtEAncqjkEHcPfxnS2XYMtCq/OZ9w7LU4iF5dOTxEQhmaYNbq3Y6apHCmWkxmr7Eb6bM4dQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VQ7k801v; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VQ7k801v"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741503532; x=1773039532;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=zJkL+33OpBlwLGagD/SKr5zX8FBK47bGo5jRmMiG/Ms=;
  b=VQ7k801v6L9iEitHANH4d1dxOObGjBJw1tmn+1WDzj9B0NcVEuh+B5RF
   mPsbFaSFvMkJgStBYb3nCctXPd0SkJkA/9ENkhkiSJe3cCLqff4iDAAgY
   /5KvCvMY8IUjVVf7Z4p/d3PXlRvk9qsy16dx3VW2KH+nKP971FXofZGN1
   poNDE55HynI/8L/zoQuPZ7Sk9WTM2k9Xq5qiZVjcitIhXgpRdDwJY/SX5
   VHCxSzE0SZ07o+GZT2Gt2vZi6ip1RlWkpW0k/KzJRjHJAl858UlN2W6hE
   eJlcEge4y4AjTCjjffxrZfaqmZtSeqz7n9a4OCRYyMKUF4I9oaganYS+L
   Q==;
X-CSE-ConnectionGUID: PCLzWlghQkSc/POIpkK6Eg==
X-CSE-MsgGUID: Q4Y1EXCvS4Oe/8B+/KQiAg==
X-IronPort-AV: E=McAfee;i="6700,10204,11367"; a="41763329"
X-IronPort-AV: E=Sophos;i="6.14,233,1736841600"; 
   d="scan'208";a="41763329"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Mar 2025 22:58:52 -0800
X-CSE-ConnectionGUID: RQbVB+RFRUC9z2QAtTFaog==
X-CSE-MsgGUID: MN3m2S7pSNCI5kHxg00N2g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,233,1736841600"; 
   d="scan'208";a="120184315"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by fmviesa010.fm.intel.com with ESMTP; 08 Mar 2025 22:58:51 -0800
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1trAca-0002mi-2W;
	Sun, 09 Mar 2025 06:58:48 +0000
Date: Sun, 9 Mar 2025 14:58:45 +0800
From: kernel test robot <lkp@intel.com>
To: Jiri Olsa <jolsa@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jolsa-perf:bpf/optimized_usdt_1 19/20] kernel/seccomp.c:769:9:
 error: expected identifier or '(' before 'for'
Message-ID: <202503091449.ytCeLMrF-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jolsa/perf.git bpf/optimized_usdt_1
head:   c63f2f86076da544bc726c0e4dc9cb92f556b3d5
commit: 637a4f5485c20fbeb03d920745ae345b81406600 [19/20] seccomp: passthrough uprobe systemcall without filtering
config: i386-buildonly-randconfig-003-20250309 (https://download.01.org/0day-ci/archive/20250309/202503091449.ytCeLMrF-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250309/202503091449.ytCeLMrF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503091449.ytCeLMrF-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   kernel/seccomp.c: In function 'seccomp_is_const_allow':
>> kernel/seccomp.c:747:14: warning: unused variable 'op_res' [-Wunused-variable]
     747 |         bool op_res;
         |              ^~~~~~
>> kernel/seccomp.c:746:22: warning: unused variable 'pc' [-Wunused-variable]
     746 |         unsigned int pc;
         |                      ^~
>> kernel/seccomp.c:745:22: warning: unused variable 'reg_value' [-Wunused-variable]
     745 |         unsigned int reg_value = 0;
         |                      ^~~~~~~~~
   kernel/seccomp.c: At top level:
>> kernel/seccomp.c:769:9: error: expected identifier or '(' before 'for'
     769 |         for (pc = 0; pc < fprog->len; pc++) {
         |         ^~~
>> kernel/seccomp.c:769:25: error: expected '=', ',', ';', 'asm' or '__attribute__' before '<' token
     769 |         for (pc = 0; pc < fprog->len; pc++) {
         |                         ^
   kernel/seccomp.c:769:41: error: expected '=', ',', ';', 'asm' or '__attribute__' before '++' token
     769 |         for (pc = 0; pc < fprog->len; pc++) {
         |                                         ^~
   In file included from arch/x86/include/asm/bug.h:103,
                    from include/linux/bug.h:5,
                    from include/linux/refcount.h:96,
                    from kernel/seccomp.c:18:
>> include/asm-generic/bug.h:170:29: error: expected identifier or '(' before '{' token
     170 | #define WARN_ON(condition) ({                                           \
         |                             ^
   kernel/seccomp.c:828:9: note: in expansion of macro 'WARN_ON'
     828 |         WARN_ON(1);
         |         ^~~~~~~
>> kernel/seccomp.c:829:9: error: expected identifier or '(' before 'return'
     829 |         return false;
         |         ^~~~~~
>> kernel/seccomp.c:830:1: error: expected identifier or '(' before '}' token
     830 | }
         | ^
   kernel/seccomp.c: In function 'seccomp_is_const_allow':
   kernel/seccomp.c:767:9: warning: control reaches end of non-void function [-Wreturn-type]
     767 |         }
         |         ^


vim +769 kernel/seccomp.c

c8bee430dc52cf Kees Cook   2014-06-27  734  
8e01b51a31a1e0 YiFei Zhu   2020-10-11  735  #ifdef SECCOMP_ARCH_NATIVE
8e01b51a31a1e0 YiFei Zhu   2020-10-11  736  /**
8e01b51a31a1e0 YiFei Zhu   2020-10-11  737   * seccomp_is_const_allow - check if filter is constant allow with given data
8e01b51a31a1e0 YiFei Zhu   2020-10-11  738   * @fprog: The BPF programs
8e01b51a31a1e0 YiFei Zhu   2020-10-11  739   * @sd: The seccomp data to check against, only syscall number and arch
8e01b51a31a1e0 YiFei Zhu   2020-10-11  740   *      number are considered constant.
8e01b51a31a1e0 YiFei Zhu   2020-10-11  741   */
8e01b51a31a1e0 YiFei Zhu   2020-10-11  742  static bool seccomp_is_const_allow(struct sock_fprog_kern *fprog,
8e01b51a31a1e0 YiFei Zhu   2020-10-11  743  				   struct seccomp_data *sd)
8e01b51a31a1e0 YiFei Zhu   2020-10-11  744  {
8e01b51a31a1e0 YiFei Zhu   2020-10-11 @745  	unsigned int reg_value = 0;
8e01b51a31a1e0 YiFei Zhu   2020-10-11 @746  	unsigned int pc;
8e01b51a31a1e0 YiFei Zhu   2020-10-11 @747  	bool op_res;
8e01b51a31a1e0 YiFei Zhu   2020-10-11  748  
8e01b51a31a1e0 YiFei Zhu   2020-10-11  749  	if (WARN_ON_ONCE(!fprog))
8e01b51a31a1e0 YiFei Zhu   2020-10-11  750  		return false;
8e01b51a31a1e0 YiFei Zhu   2020-10-11  751  
cf6cb56ef24410 Eyal Birger 2025-02-02  752  	/* Our single exception to filtering. */
637a4f5485c20f Jiri Olsa   2025-03-08  753  #if defined __NR_uretprobe || defined __NR_uprobe
cf6cb56ef24410 Eyal Birger 2025-02-02  754  #ifdef SECCOMP_ARCH_COMPAT
cf6cb56ef24410 Eyal Birger 2025-02-02  755  	if (sd->arch == SECCOMP_ARCH_NATIVE)
cf6cb56ef24410 Eyal Birger 2025-02-02  756  #endif
637a4f5485c20f Jiri Olsa   2025-03-08  757  	{
637a4f5485c20f Jiri Olsa   2025-03-08  758  #ifdef __NR_uretprobe
cf6cb56ef24410 Eyal Birger 2025-02-02  759  		if (sd->nr == __NR_uretprobe)
cf6cb56ef24410 Eyal Birger 2025-02-02  760  			return true;
cf6cb56ef24410 Eyal Birger 2025-02-02  761  #endif
637a4f5485c20f Jiri Olsa   2025-03-08  762  #ifdef __NR_uprobe
637a4f5485c20f Jiri Olsa   2025-03-08  763  		if (sd->nr == __NR_uprobe)
637a4f5485c20f Jiri Olsa   2025-03-08  764  			return true;
637a4f5485c20f Jiri Olsa   2025-03-08  765  #endif
637a4f5485c20f Jiri Olsa   2025-03-08  766  #endif
637a4f5485c20f Jiri Olsa   2025-03-08  767  	}
cf6cb56ef24410 Eyal Birger 2025-02-02  768  
8e01b51a31a1e0 YiFei Zhu   2020-10-11 @769  	for (pc = 0; pc < fprog->len; pc++) {
8e01b51a31a1e0 YiFei Zhu   2020-10-11  770  		struct sock_filter *insn = &fprog->filter[pc];
8e01b51a31a1e0 YiFei Zhu   2020-10-11  771  		u16 code = insn->code;
8e01b51a31a1e0 YiFei Zhu   2020-10-11  772  		u32 k = insn->k;
8e01b51a31a1e0 YiFei Zhu   2020-10-11  773  
8e01b51a31a1e0 YiFei Zhu   2020-10-11  774  		switch (code) {
8e01b51a31a1e0 YiFei Zhu   2020-10-11  775  		case BPF_LD | BPF_W | BPF_ABS:
8e01b51a31a1e0 YiFei Zhu   2020-10-11  776  			switch (k) {
8e01b51a31a1e0 YiFei Zhu   2020-10-11  777  			case offsetof(struct seccomp_data, nr):
8e01b51a31a1e0 YiFei Zhu   2020-10-11  778  				reg_value = sd->nr;
8e01b51a31a1e0 YiFei Zhu   2020-10-11  779  				break;
8e01b51a31a1e0 YiFei Zhu   2020-10-11  780  			case offsetof(struct seccomp_data, arch):
8e01b51a31a1e0 YiFei Zhu   2020-10-11  781  				reg_value = sd->arch;
8e01b51a31a1e0 YiFei Zhu   2020-10-11  782  				break;
8e01b51a31a1e0 YiFei Zhu   2020-10-11  783  			default:
8e01b51a31a1e0 YiFei Zhu   2020-10-11  784  				/* can't optimize (non-constant value load) */
8e01b51a31a1e0 YiFei Zhu   2020-10-11  785  				return false;
8e01b51a31a1e0 YiFei Zhu   2020-10-11  786  			}
8e01b51a31a1e0 YiFei Zhu   2020-10-11  787  			break;
8e01b51a31a1e0 YiFei Zhu   2020-10-11  788  		case BPF_RET | BPF_K:
8e01b51a31a1e0 YiFei Zhu   2020-10-11  789  			/* reached return with constant values only, check allow */
8e01b51a31a1e0 YiFei Zhu   2020-10-11  790  			return k == SECCOMP_RET_ALLOW;
8e01b51a31a1e0 YiFei Zhu   2020-10-11  791  		case BPF_JMP | BPF_JA:
8e01b51a31a1e0 YiFei Zhu   2020-10-11  792  			pc += insn->k;
8e01b51a31a1e0 YiFei Zhu   2020-10-11  793  			break;
8e01b51a31a1e0 YiFei Zhu   2020-10-11  794  		case BPF_JMP | BPF_JEQ | BPF_K:
8e01b51a31a1e0 YiFei Zhu   2020-10-11  795  		case BPF_JMP | BPF_JGE | BPF_K:
8e01b51a31a1e0 YiFei Zhu   2020-10-11  796  		case BPF_JMP | BPF_JGT | BPF_K:
8e01b51a31a1e0 YiFei Zhu   2020-10-11  797  		case BPF_JMP | BPF_JSET | BPF_K:
8e01b51a31a1e0 YiFei Zhu   2020-10-11  798  			switch (BPF_OP(code)) {
8e01b51a31a1e0 YiFei Zhu   2020-10-11  799  			case BPF_JEQ:
8e01b51a31a1e0 YiFei Zhu   2020-10-11  800  				op_res = reg_value == k;
8e01b51a31a1e0 YiFei Zhu   2020-10-11  801  				break;
8e01b51a31a1e0 YiFei Zhu   2020-10-11  802  			case BPF_JGE:
8e01b51a31a1e0 YiFei Zhu   2020-10-11  803  				op_res = reg_value >= k;
8e01b51a31a1e0 YiFei Zhu   2020-10-11  804  				break;
8e01b51a31a1e0 YiFei Zhu   2020-10-11  805  			case BPF_JGT:
8e01b51a31a1e0 YiFei Zhu   2020-10-11  806  				op_res = reg_value > k;
8e01b51a31a1e0 YiFei Zhu   2020-10-11  807  				break;
8e01b51a31a1e0 YiFei Zhu   2020-10-11  808  			case BPF_JSET:
8e01b51a31a1e0 YiFei Zhu   2020-10-11  809  				op_res = !!(reg_value & k);
8e01b51a31a1e0 YiFei Zhu   2020-10-11  810  				break;
8e01b51a31a1e0 YiFei Zhu   2020-10-11  811  			default:
8e01b51a31a1e0 YiFei Zhu   2020-10-11  812  				/* can't optimize (unknown jump) */
8e01b51a31a1e0 YiFei Zhu   2020-10-11  813  				return false;
8e01b51a31a1e0 YiFei Zhu   2020-10-11  814  			}
8e01b51a31a1e0 YiFei Zhu   2020-10-11  815  
8e01b51a31a1e0 YiFei Zhu   2020-10-11  816  			pc += op_res ? insn->jt : insn->jf;
8e01b51a31a1e0 YiFei Zhu   2020-10-11  817  			break;
8e01b51a31a1e0 YiFei Zhu   2020-10-11  818  		case BPF_ALU | BPF_AND | BPF_K:
8e01b51a31a1e0 YiFei Zhu   2020-10-11  819  			reg_value &= k;
8e01b51a31a1e0 YiFei Zhu   2020-10-11  820  			break;
8e01b51a31a1e0 YiFei Zhu   2020-10-11  821  		default:
8e01b51a31a1e0 YiFei Zhu   2020-10-11  822  			/* can't optimize (unknown insn) */
8e01b51a31a1e0 YiFei Zhu   2020-10-11  823  			return false;
8e01b51a31a1e0 YiFei Zhu   2020-10-11  824  		}
8e01b51a31a1e0 YiFei Zhu   2020-10-11  825  	}
8e01b51a31a1e0 YiFei Zhu   2020-10-11  826  
8e01b51a31a1e0 YiFei Zhu   2020-10-11  827  	/* ran off the end of the filter?! */
8e01b51a31a1e0 YiFei Zhu   2020-10-11  828  	WARN_ON(1);
8e01b51a31a1e0 YiFei Zhu   2020-10-11 @829  	return false;
8e01b51a31a1e0 YiFei Zhu   2020-10-11 @830  }
8e01b51a31a1e0 YiFei Zhu   2020-10-11  831  

:::::: The code at line 769 was first introduced by commit
:::::: 8e01b51a31a1e08e2c3e8fcc0ef6790441be2f61 seccomp/cache: Add "emulator" to check if filter is constant allow

:::::: TO: YiFei Zhu <yifeifz2@illinois.edu>
:::::: CC: Kees Cook <keescook@chromium.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
