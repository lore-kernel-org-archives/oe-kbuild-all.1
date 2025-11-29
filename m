Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7FBB8635D
	for <oe-kbuild-all@lists.linux.dev>; Sat, 29 Nov 2025 02:14:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764382497; cv=none; b=hKO0IUIYy+WLLXikaVFxt3/wag/r/XbrRAcq/riyGcLmFNS5UgAHQC8ats3Vbc7ntDmXNISTCoJYhETXA+fzACqEjHEW/RRpw+pYLe68V5Twui2XZ4p0ouDLJt1P2wXe5cml1uLedK/zokf/UoxjrsEOUhJxULaD1UJtdvWRttM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764382497; c=relaxed/simple;
	bh=cgjXDxiw2aDRQNcrNd+s1Q2srfNPDgtg6neXxpt1lSg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QK+YYw0BJnVJgFOdrdqpVAYs9wWF1MMTTMFhEC4kcGRMUQY79zdYZFudm1qLopAFeGLrRVFmA2MqHaZjIep1AlpTR+E9b+2TWWcgCjmP4XTo65Ll8lIeaWNJ3x8Sy68vdKbyDVpgomwT25Z5q+raTB+b3RLtf3LYW1CVGCMRroE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iMrRkIbh; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iMrRkIbh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764382494; x=1795918494;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=cgjXDxiw2aDRQNcrNd+s1Q2srfNPDgtg6neXxpt1lSg=;
  b=iMrRkIbheJ6EBvGkA9CtcV+gaM2wONNeF+NnAg+eMuPfIek1WP0bkdXx
   s/ELVqER9+ty76X1i3RhH2m0DKglDSklZ5NbFX7CAUpIOYVv4QKHqKsrp
   QEvcAjycbz5ef5B3p/TRiWjvbA3+0/q2peZU0LT1KBCdZqwSuIkNqEw1o
   z5EWCC3WqjoR3tcA4mnLnAW7/RpwipQgr9kHaoU+untBgwPIzP2etfd/4
   YJqHg0ebUIn1JKE9n/ANZbindsoaobdMfFti+M88yyK/MWf8H9DJMY4fk
   llZsCN3wkHd3GLiJzeraDorF0xBUXXiEFW0VkDLdHbgNS8+/57yyoHt01
   g==;
X-CSE-ConnectionGUID: w9aqGtZQRl23bFdAUAE/6Q==
X-CSE-MsgGUID: udZwau/dRW+F8H3x4HCAVQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11627"; a="66293170"
X-IronPort-AV: E=Sophos;i="6.20,235,1758610800"; 
   d="scan'208";a="66293170"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Nov 2025 18:14:54 -0800
X-CSE-ConnectionGUID: sK7AyqO/QoSyPf+3MEOZVQ==
X-CSE-MsgGUID: Rg7Si0DEQd6wIQs2t3iBIA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,235,1758610800"; 
   d="scan'208";a="194357403"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 28 Nov 2025 18:14:44 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vPATx-000000006tN-32zu;
	Sat, 29 Nov 2025 02:14:41 +0000
Date: Sat, 29 Nov 2025 10:14:24 +0800
From: kernel test robot <lkp@intel.com>
To: Anton Protopopov <a.s.protopopov@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH bpf-next] bpf: check for insn arrays in
 check_ptr_alignment
Message-ID: <202511291020.AUFdMAHa-lkp@intel.com>
References: <20251127210732.3241888-1-a.s.protopopov@gmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251127210732.3241888-1-a.s.protopopov@gmail.com>

Hi Anton,

kernel test robot noticed the following build errors:

[auto build test ERROR on bpf-next/master]

url:    https://github.com/intel-lab-lkp/linux/commits/Anton-Protopopov/bpf-check-for-insn-arrays-in-check_ptr_alignment/20251128-050350
base:   https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next.git master
patch link:    https://lore.kernel.org/r/20251127210732.3241888-1-a.s.protopopov%40gmail.com
patch subject: [PATCH bpf-next] bpf: check for insn arrays in check_ptr_alignment
config: i386-randconfig-062-20251129 (https://download.01.org/0day-ci/archive/20251129/202511291020.AUFdMAHa-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251129/202511291020.AUFdMAHa-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511291020.AUFdMAHa-lkp@intel.com/

All errors (new ones prefixed by >>):

   kernel/bpf/verifier.c: In function 'check_mem_access':
>> kernel/bpf/verifier.c:7568:39: error: 'insn_array' undeclared (first use in this function); did you mean 'its_array'?
    7568 |                 if (t == BPF_WRITE && insn_array) {
         |                                       ^~~~~~~~~~
         |                                       its_array
   kernel/bpf/verifier.c:7568:39: note: each undeclared identifier is reported only once for each function it appears in


vim +7568 kernel/bpf/verifier.c

5d99e198be2790 Xu Kuohai               2024-07-19  7521  
17a5267067f3c3 Alexei Starovoitov      2014-09-26  7522  /* check whether memory at (regno + off) is accessible for t = (read | write)
17a5267067f3c3 Alexei Starovoitov      2014-09-26  7523   * if t==write, value_regno is a register which value is stored into memory
17a5267067f3c3 Alexei Starovoitov      2014-09-26  7524   * if t==read, value_regno is a register which will receive the value from memory
17a5267067f3c3 Alexei Starovoitov      2014-09-26  7525   * if t==write && value_regno==-1, some unknown value is stored into memory
17a5267067f3c3 Alexei Starovoitov      2014-09-26  7526   * if t==read && value_regno==-1, don't care what we read from memory
17a5267067f3c3 Alexei Starovoitov      2014-09-26  7527   */
ca36960211eb22 Daniel Borkmann         2018-02-23  7528  static int check_mem_access(struct bpf_verifier_env *env, int insn_idx, u32 regno,
ca36960211eb22 Daniel Borkmann         2018-02-23  7529  			    int off, int bpf_size, enum bpf_access_type t,
1f9a1ea821ff25 Yonghong Song           2023-07-27  7530  			    int value_regno, bool strict_alignment_once, bool is_ldsx)
17a5267067f3c3 Alexei Starovoitov      2014-09-26  7531  {
638f5b90d46016 Alexei Starovoitov      2017-10-31  7532  	struct bpf_reg_state *regs = cur_regs(env);
638f5b90d46016 Alexei Starovoitov      2017-10-31  7533  	struct bpf_reg_state *reg = regs + regno;
17a5267067f3c3 Alexei Starovoitov      2014-09-26  7534  	int size, err = 0;
17a5267067f3c3 Alexei Starovoitov      2014-09-26  7535  
17a5267067f3c3 Alexei Starovoitov      2014-09-26  7536  	size = bpf_size_to_bytes(bpf_size);
17a5267067f3c3 Alexei Starovoitov      2014-09-26  7537  	if (size < 0)
17a5267067f3c3 Alexei Starovoitov      2014-09-26  7538  		return size;
17a5267067f3c3 Alexei Starovoitov      2014-09-26  7539  
f1174f77b50c94 Edward Cree             2017-08-07  7540  	/* alignment checks will add in reg->off themselves */
cc927f48dc4b41 Anton Protopopov        2025-11-27  7541  	err = check_ptr_alignment(env, reg, off, size, strict_alignment_once);
969bf05eb3cedd Alexei Starovoitov      2016-05-05  7542  	if (err)
969bf05eb3cedd Alexei Starovoitov      2016-05-05  7543  		return err;
17a5267067f3c3 Alexei Starovoitov      2014-09-26  7544  
f1174f77b50c94 Edward Cree             2017-08-07  7545  	/* for access checks, reg->off is just part of off */
f1174f77b50c94 Edward Cree             2017-08-07  7546  	off += reg->off;
f1174f77b50c94 Edward Cree             2017-08-07  7547  
69c087ba6225b5 Yonghong Song           2021-02-26  7548  	if (reg->type == PTR_TO_MAP_KEY) {
69c087ba6225b5 Yonghong Song           2021-02-26  7549  		if (t == BPF_WRITE) {
69c087ba6225b5 Yonghong Song           2021-02-26  7550  			verbose(env, "write to change key R%d not allowed\n", regno);
69c087ba6225b5 Yonghong Song           2021-02-26  7551  			return -EACCES;
69c087ba6225b5 Yonghong Song           2021-02-26  7552  		}
69c087ba6225b5 Yonghong Song           2021-02-26  7553  
69c087ba6225b5 Yonghong Song           2021-02-26  7554  		err = check_mem_region_access(env, regno, off, size,
69c087ba6225b5 Yonghong Song           2021-02-26  7555  					      reg->map_ptr->key_size, false);
69c087ba6225b5 Yonghong Song           2021-02-26  7556  		if (err)
69c087ba6225b5 Yonghong Song           2021-02-26  7557  			return err;
69c087ba6225b5 Yonghong Song           2021-02-26  7558  		if (value_regno >= 0)
69c087ba6225b5 Yonghong Song           2021-02-26  7559  			mark_reg_unknown(env, regs, value_regno);
69c087ba6225b5 Yonghong Song           2021-02-26  7560  	} else if (reg->type == PTR_TO_MAP_VALUE) {
aa3496accc412b Kumar Kartikeya Dwivedi 2022-11-04  7561  		struct btf_field *kptr_field = NULL;
61df10c7799e27 Kumar Kartikeya Dwivedi 2022-04-25  7562  
1be7f75d1668d6 Alexei Starovoitov      2015-10-07  7563  		if (t == BPF_WRITE && value_regno >= 0 &&
1be7f75d1668d6 Alexei Starovoitov      2015-10-07  7564  		    is_pointer_value(env, value_regno)) {
61bd5218eef349 Jakub Kicinski          2017-10-09  7565  			verbose(env, "R%d leaks addr into map\n", value_regno);
1be7f75d1668d6 Alexei Starovoitov      2015-10-07  7566  			return -EACCES;
1be7f75d1668d6 Alexei Starovoitov      2015-10-07  7567  		}
493d9e0d608339 Anton Protopopov        2025-11-05 @7568  		if (t == BPF_WRITE && insn_array) {
493d9e0d608339 Anton Protopopov        2025-11-05  7569  			verbose(env, "writes into insn_array not allowed\n");
493d9e0d608339 Anton Protopopov        2025-11-05  7570  			return -EACCES;
493d9e0d608339 Anton Protopopov        2025-11-05  7571  		}
493d9e0d608339 Anton Protopopov        2025-11-05  7572  
591fe9888d7809 Daniel Borkmann         2019-04-09  7573  		err = check_map_access_type(env, regno, off, size, t);
591fe9888d7809 Daniel Borkmann         2019-04-09  7574  		if (err)
591fe9888d7809 Daniel Borkmann         2019-04-09  7575  			return err;
61df10c7799e27 Kumar Kartikeya Dwivedi 2022-04-25  7576  		err = check_map_access(env, regno, off, size, false, ACCESS_DIRECT);
61df10c7799e27 Kumar Kartikeya Dwivedi 2022-04-25  7577  		if (err)
61df10c7799e27 Kumar Kartikeya Dwivedi 2022-04-25  7578  			return err;
61df10c7799e27 Kumar Kartikeya Dwivedi 2022-04-25  7579  		if (tnum_is_const(reg->var_off))
aa3496accc412b Kumar Kartikeya Dwivedi 2022-11-04  7580  			kptr_field = btf_record_find(reg->map_ptr->record,
99dde42e37497b Kui-Feng Lee            2024-10-23  7581  						     off + reg->var_off.value, BPF_KPTR | BPF_UPTR);
aa3496accc412b Kumar Kartikeya Dwivedi 2022-11-04  7582  		if (kptr_field) {
aa3496accc412b Kumar Kartikeya Dwivedi 2022-11-04  7583  			err = check_map_kptr_access(env, regno, value_regno, insn_idx, kptr_field);
61df10c7799e27 Kumar Kartikeya Dwivedi 2022-04-25  7584  		} else if (t == BPF_READ && value_regno >= 0) {
a23740ec43ba02 Andrii Nakryiko         2019-10-09  7585  			struct bpf_map *map = reg->map_ptr;
a23740ec43ba02 Andrii Nakryiko         2019-10-09  7586  
a23740ec43ba02 Andrii Nakryiko         2019-10-09  7587  			/* if map is read-only, track its contents as scalars */
a23740ec43ba02 Andrii Nakryiko         2019-10-09  7588  			if (tnum_is_const(reg->var_off) &&
a23740ec43ba02 Andrii Nakryiko         2019-10-09  7589  			    bpf_map_is_rdonly(map) &&
a23740ec43ba02 Andrii Nakryiko         2019-10-09  7590  			    map->ops->map_direct_value_addr) {
a23740ec43ba02 Andrii Nakryiko         2019-10-09  7591  				int map_off = off + reg->var_off.value;
a23740ec43ba02 Andrii Nakryiko         2019-10-09  7592  				u64 val = 0;
a23740ec43ba02 Andrii Nakryiko         2019-10-09  7593  
a23740ec43ba02 Andrii Nakryiko         2019-10-09  7594  				err = bpf_map_direct_read(map, map_off, size,
1f9a1ea821ff25 Yonghong Song           2023-07-27  7595  							  &val, is_ldsx);
a23740ec43ba02 Andrii Nakryiko         2019-10-09  7596  				if (err)
a23740ec43ba02 Andrii Nakryiko         2019-10-09  7597  					return err;
17a5267067f3c3 Alexei Starovoitov      2014-09-26  7598  
a23740ec43ba02 Andrii Nakryiko         2019-10-09  7599  				regs[value_regno].type = SCALAR_VALUE;
a23740ec43ba02 Andrii Nakryiko         2019-10-09  7600  				__mark_reg_known(&regs[value_regno], val);
493d9e0d608339 Anton Protopopov        2025-11-05  7601  			} else if (map->map_type == BPF_MAP_TYPE_INSN_ARRAY) {
493d9e0d608339 Anton Protopopov        2025-11-05  7602  				if (bpf_size != BPF_DW) {
493d9e0d608339 Anton Protopopov        2025-11-05  7603  					verbose(env, "Invalid read of %d bytes from insn_array\n",
493d9e0d608339 Anton Protopopov        2025-11-05  7604  						     size);
493d9e0d608339 Anton Protopopov        2025-11-05  7605  					return -EACCES;
493d9e0d608339 Anton Protopopov        2025-11-05  7606  				}
493d9e0d608339 Anton Protopopov        2025-11-05  7607  				copy_register_state(&regs[value_regno], reg);
493d9e0d608339 Anton Protopopov        2025-11-05  7608  				regs[value_regno].type = PTR_TO_INSN;
a23740ec43ba02 Andrii Nakryiko         2019-10-09  7609  			} else {
a23740ec43ba02 Andrii Nakryiko         2019-10-09  7610  				mark_reg_unknown(env, regs, value_regno);
a23740ec43ba02 Andrii Nakryiko         2019-10-09  7611  			}
a23740ec43ba02 Andrii Nakryiko         2019-10-09  7612  		}
34d3a78c681e8e Hao Luo                 2021-12-16  7613  	} else if (base_type(reg->type) == PTR_TO_MEM) {
34d3a78c681e8e Hao Luo                 2021-12-16  7614  		bool rdonly_mem = type_is_rdonly_mem(reg->type);
f2362a57aefff5 Eduard Zingerman        2025-06-25  7615  		bool rdonly_untrusted = rdonly_mem && (reg->type & PTR_UNTRUSTED);
34d3a78c681e8e Hao Luo                 2021-12-16  7616  
34d3a78c681e8e Hao Luo                 2021-12-16  7617  		if (type_may_be_null(reg->type)) {
34d3a78c681e8e Hao Luo                 2021-12-16  7618  			verbose(env, "R%d invalid mem access '%s'\n", regno,
34d3a78c681e8e Hao Luo                 2021-12-16  7619  				reg_type_str(env, reg->type));
34d3a78c681e8e Hao Luo                 2021-12-16  7620  			return -EACCES;
34d3a78c681e8e Hao Luo                 2021-12-16  7621  		}
34d3a78c681e8e Hao Luo                 2021-12-16  7622  
34d3a78c681e8e Hao Luo                 2021-12-16  7623  		if (t == BPF_WRITE && rdonly_mem) {
34d3a78c681e8e Hao Luo                 2021-12-16  7624  			verbose(env, "R%d cannot write into %s\n",
34d3a78c681e8e Hao Luo                 2021-12-16  7625  				regno, reg_type_str(env, reg->type));
34d3a78c681e8e Hao Luo                 2021-12-16  7626  			return -EACCES;
34d3a78c681e8e Hao Luo                 2021-12-16  7627  		}
34d3a78c681e8e Hao Luo                 2021-12-16  7628  
457f44363a8894 Andrii Nakryiko         2020-05-29  7629  		if (t == BPF_WRITE && value_regno >= 0 &&
457f44363a8894 Andrii Nakryiko         2020-05-29  7630  		    is_pointer_value(env, value_regno)) {
457f44363a8894 Andrii Nakryiko         2020-05-29  7631  			verbose(env, "R%d leaks addr into mem\n", value_regno);
457f44363a8894 Andrii Nakryiko         2020-05-29  7632  			return -EACCES;
457f44363a8894 Andrii Nakryiko         2020-05-29  7633  		}
34d3a78c681e8e Hao Luo                 2021-12-16  7634  
f2362a57aefff5 Eduard Zingerman        2025-06-25  7635  		/*
f2362a57aefff5 Eduard Zingerman        2025-06-25  7636  		 * Accesses to untrusted PTR_TO_MEM are done through probe
f2362a57aefff5 Eduard Zingerman        2025-06-25  7637  		 * instructions, hence no need to check bounds in that case.
f2362a57aefff5 Eduard Zingerman        2025-06-25  7638  		 */
f2362a57aefff5 Eduard Zingerman        2025-06-25  7639  		if (!rdonly_untrusted)
457f44363a8894 Andrii Nakryiko         2020-05-29  7640  			err = check_mem_region_access(env, regno, off, size,
457f44363a8894 Andrii Nakryiko         2020-05-29  7641  						      reg->mem_size, false);
34d3a78c681e8e Hao Luo                 2021-12-16  7642  		if (!err && value_regno >= 0 && (t == BPF_READ || rdonly_mem))
457f44363a8894 Andrii Nakryiko         2020-05-29  7643  			mark_reg_unknown(env, regs, value_regno);
1a0dc1ac1d2928 Alexei Starovoitov      2016-05-05  7644  	} else if (reg->type == PTR_TO_CTX) {
5d99e198be2790 Xu Kuohai               2024-07-19  7645  		struct bpf_retval_range range;
201b62ccc83153 Amery Hung              2025-02-21  7646  		struct bpf_insn_access_aux info = {
201b62ccc83153 Amery Hung              2025-02-21  7647  			.reg_type = SCALAR_VALUE,
201b62ccc83153 Amery Hung              2025-02-21  7648  			.is_ldsx = is_ldsx,
201b62ccc83153 Amery Hung              2025-02-21  7649  			.log = &env->log,
201b62ccc83153 Amery Hung              2025-02-21  7650  		};
19de99f70b87fc Alexei Starovoitov      2016-06-15  7651  
1be7f75d1668d6 Alexei Starovoitov      2015-10-07  7652  		if (t == BPF_WRITE && value_regno >= 0 &&
1be7f75d1668d6 Alexei Starovoitov      2015-10-07  7653  		    is_pointer_value(env, value_regno)) {
61bd5218eef349 Jakub Kicinski          2017-10-09  7654  			verbose(env, "R%d leaks addr into ctx\n", value_regno);
1be7f75d1668d6 Alexei Starovoitov      2015-10-07  7655  			return -EACCES;
1be7f75d1668d6 Alexei Starovoitov      2015-10-07  7656  		}
f1174f77b50c94 Edward Cree             2017-08-07  7657  
be80a1d3f9dbe5 Daniel Borkmann         2022-01-10  7658  		err = check_ptr_off_reg(env, reg, regno);
58990d1ff3f789 Daniel Borkmann         2018-06-07  7659  		if (err < 0)
58990d1ff3f789 Daniel Borkmann         2018-06-07  7660  			return err;
58990d1ff3f789 Daniel Borkmann         2018-06-07  7661  
201b62ccc83153 Amery Hung              2025-02-21  7662  		err = check_ctx_access(env, insn_idx, off, size, t, &info);
9e15db66136a14 Alexei Starovoitov      2019-10-15  7663  		if (err)
9e15db66136a14 Alexei Starovoitov      2019-10-15  7664  			verbose_linfo(env, insn_idx, "; ");
969bf05eb3cedd Alexei Starovoitov      2016-05-05  7665  		if (!err && t == BPF_READ && value_regno >= 0) {
f1174f77b50c94 Edward Cree             2017-08-07  7666  			/* ctx access returns either a scalar, or a
de8f3a83b0a0fd Daniel Borkmann         2017-09-25  7667  			 * PTR_TO_PACKET[_META,_END]. In the latter
de8f3a83b0a0fd Daniel Borkmann         2017-09-25  7668  			 * case, we know the offset is zero.
f1174f77b50c94 Edward Cree             2017-08-07  7669  			 */
201b62ccc83153 Amery Hung              2025-02-21  7670  			if (info.reg_type == SCALAR_VALUE) {
201b62ccc83153 Amery Hung              2025-02-21  7671  				if (info.is_retval && get_func_retval_range(env->prog, &range)) {
5d99e198be2790 Xu Kuohai               2024-07-19  7672  					err = __mark_reg_s32_range(env, regs, value_regno,
5d99e198be2790 Xu Kuohai               2024-07-19  7673  								   range.minval, range.maxval);
5d99e198be2790 Xu Kuohai               2024-07-19  7674  					if (err)
5d99e198be2790 Xu Kuohai               2024-07-19  7675  						return err;
5d99e198be2790 Xu Kuohai               2024-07-19  7676  				} else {
638f5b90d46016 Alexei Starovoitov      2017-10-31  7677  					mark_reg_unknown(env, regs, value_regno);
5d99e198be2790 Xu Kuohai               2024-07-19  7678  				}
46f8bc92758c62 Martin KaFai Lau        2019-02-09  7679  			} else {
638f5b90d46016 Alexei Starovoitov      2017-10-31  7680  				mark_reg_known_zero(env, regs,
61bd5218eef349 Jakub Kicinski          2017-10-09  7681  						    value_regno);
201b62ccc83153 Amery Hung              2025-02-21  7682  				if (type_may_be_null(info.reg_type))
46f8bc92758c62 Martin KaFai Lau        2019-02-09  7683  					regs[value_regno].id = ++env->id_gen;
5327ed3d44b754 Jiong Wang              2019-05-24  7684  				/* A load of ctx field could have different
5327ed3d44b754 Jiong Wang              2019-05-24  7685  				 * actual load size with the one encoded in the
5327ed3d44b754 Jiong Wang              2019-05-24  7686  				 * insn. When the dst is PTR, it is for sure not
5327ed3d44b754 Jiong Wang              2019-05-24  7687  				 * a sub-register.
5327ed3d44b754 Jiong Wang              2019-05-24  7688  				 */
5327ed3d44b754 Jiong Wang              2019-05-24  7689  				regs[value_regno].subreg_def = DEF_NOT_SUBREG;
201b62ccc83153 Amery Hung              2025-02-21  7690  				if (base_type(info.reg_type) == PTR_TO_BTF_ID) {
201b62ccc83153 Amery Hung              2025-02-21  7691  					regs[value_regno].btf = info.btf;
201b62ccc83153 Amery Hung              2025-02-21  7692  					regs[value_regno].btf_id = info.btf_id;
201b62ccc83153 Amery Hung              2025-02-21  7693  					regs[value_regno].ref_obj_id = info.ref_obj_id;
46f8bc92758c62 Martin KaFai Lau        2019-02-09  7694  				}
22dc4a0f5ed11b Andrii Nakryiko         2020-12-03  7695  			}
201b62ccc83153 Amery Hung              2025-02-21  7696  			regs[value_regno].type = info.reg_type;
969bf05eb3cedd Alexei Starovoitov      2016-05-05  7697  		}
17a5267067f3c3 Alexei Starovoitov      2014-09-26  7698  
f1174f77b50c94 Edward Cree             2017-08-07  7699  	} else if (reg->type == PTR_TO_STACK) {
01f810ace9ed37 Andrei Matei            2021-02-06  7700  		/* Basic bounds checks. */
37cce22dbd51a3 Daniel Xu               2025-01-14  7701  		err = check_stack_access_within_bounds(env, regno, off, size, t);
e4298d25830a86 Daniel Borkmann         2019-01-03  7702  		if (err)
e4298d25830a86 Daniel Borkmann         2019-01-03  7703  			return err;
8726679a0fa317 Alexei Starovoitov      2017-05-30  7704  
01f810ace9ed37 Andrei Matei            2021-02-06  7705  		if (t == BPF_READ)
01f810ace9ed37 Andrei Matei            2021-02-06  7706  			err = check_stack_read(env, regno, off, size,
61bd5218eef349 Jakub Kicinski          2017-10-09  7707  					       value_regno);
01f810ace9ed37 Andrei Matei            2021-02-06  7708  		else
01f810ace9ed37 Andrei Matei            2021-02-06  7709  			err = check_stack_write(env, regno, off, size,
01f810ace9ed37 Andrei Matei            2021-02-06  7710  						value_regno, insn_idx);
de8f3a83b0a0fd Daniel Borkmann         2017-09-25  7711  	} else if (reg_is_pkt_pointer(reg)) {
3a0af8fd61f909 Thomas Graf             2016-11-30  7712  		if (t == BPF_WRITE && !may_access_direct_pkt_data(env, NULL, t)) {
61bd5218eef349 Jakub Kicinski          2017-10-09  7713  			verbose(env, "cannot write into packet\n");
969bf05eb3cedd Alexei Starovoitov      2016-05-05  7714  			return -EACCES;
969bf05eb3cedd Alexei Starovoitov      2016-05-05  7715  		}
4acf6c0b84c912 Brenden Blanco          2016-07-19  7716  		if (t == BPF_WRITE && value_regno >= 0 &&
4acf6c0b84c912 Brenden Blanco          2016-07-19  7717  		    is_pointer_value(env, value_regno)) {
61bd5218eef349 Jakub Kicinski          2017-10-09  7718  			verbose(env, "R%d leaks addr into packet\n",
61bd5218eef349 Jakub Kicinski          2017-10-09  7719  				value_regno);
4acf6c0b84c912 Brenden Blanco          2016-07-19  7720  			return -EACCES;
4acf6c0b84c912 Brenden Blanco          2016-07-19  7721  		}
9fd29c08e52023 Yonghong Song           2017-11-12  7722  		err = check_packet_access(env, regno, off, size, false);
969bf05eb3cedd Alexei Starovoitov      2016-05-05  7723  		if (!err && t == BPF_READ && value_regno >= 0)
638f5b90d46016 Alexei Starovoitov      2017-10-31  7724  			mark_reg_unknown(env, regs, value_regno);
d58e468b1112dc Petar Penkov            2018-09-14  7725  	} else if (reg->type == PTR_TO_FLOW_KEYS) {
d58e468b1112dc Petar Penkov            2018-09-14  7726  		if (t == BPF_WRITE && value_regno >= 0 &&
d58e468b1112dc Petar Penkov            2018-09-14  7727  		    is_pointer_value(env, value_regno)) {
d58e468b1112dc Petar Penkov            2018-09-14  7728  			verbose(env, "R%d leaks addr into flow keys\n",
d58e468b1112dc Petar Penkov            2018-09-14  7729  				value_regno);
d58e468b1112dc Petar Penkov            2018-09-14  7730  			return -EACCES;
d58e468b1112dc Petar Penkov            2018-09-14  7731  		}
d58e468b1112dc Petar Penkov            2018-09-14  7732  
d58e468b1112dc Petar Penkov            2018-09-14  7733  		err = check_flow_keys_access(env, off, size);
d58e468b1112dc Petar Penkov            2018-09-14  7734  		if (!err && t == BPF_READ && value_regno >= 0)
d58e468b1112dc Petar Penkov            2018-09-14  7735  			mark_reg_unknown(env, regs, value_regno);
46f8bc92758c62 Martin KaFai Lau        2019-02-09  7736  	} else if (type_is_sk_pointer(reg->type)) {
c64b7983288e63 Joe Stringer            2018-10-02  7737  		if (t == BPF_WRITE) {
46f8bc92758c62 Martin KaFai Lau        2019-02-09  7738  			verbose(env, "R%d cannot write into %s\n",
c25b2ae136039f Hao Luo                 2021-12-16  7739  				regno, reg_type_str(env, reg->type));
c64b7983288e63 Joe Stringer            2018-10-02  7740  			return -EACCES;
c64b7983288e63 Joe Stringer            2018-10-02  7741  		}
5f4566498dee5e Martin KaFai Lau        2019-02-08  7742  		err = check_sock_access(env, insn_idx, regno, off, size, t);
c64b7983288e63 Joe Stringer            2018-10-02  7743  		if (!err && value_regno >= 0)
c64b7983288e63 Joe Stringer            2018-10-02  7744  			mark_reg_unknown(env, regs, value_regno);
9df1c28bb75217 Matt Mullins            2019-04-26  7745  	} else if (reg->type == PTR_TO_TP_BUFFER) {
9df1c28bb75217 Matt Mullins            2019-04-26  7746  		err = check_tp_buffer_access(env, reg, regno, off, size);
9df1c28bb75217 Matt Mullins            2019-04-26  7747  		if (!err && t == BPF_READ && value_regno >= 0)
9df1c28bb75217 Matt Mullins            2019-04-26  7748  			mark_reg_unknown(env, regs, value_regno);
bff61f6faedb36 Hao Luo                 2022-03-04  7749  	} else if (base_type(reg->type) == PTR_TO_BTF_ID &&
c00d738e1673ab Kumar Kartikeya Dwivedi 2024-12-13  7750  		   !type_may_be_null(reg->type)) {
9e15db66136a14 Alexei Starovoitov      2019-10-15  7751  		err = check_ptr_to_btf_access(env, regs, regno, off, size, t,
9e15db66136a14 Alexei Starovoitov      2019-10-15  7752  					      value_regno);
41c48f3a982317 Andrey Ignatov          2020-06-19  7753  	} else if (reg->type == CONST_PTR_TO_MAP) {
41c48f3a982317 Andrey Ignatov          2020-06-19  7754  		err = check_ptr_to_map_access(env, regs, regno, off, size, t,
41c48f3a982317 Andrey Ignatov          2020-06-19  7755  					      value_regno);
20b2aff4bc15bd Hao Luo                 2021-12-16  7756  	} else if (base_type(reg->type) == PTR_TO_BUF) {
20b2aff4bc15bd Hao Luo                 2021-12-16  7757  		bool rdonly_mem = type_is_rdonly_mem(reg->type);
20b2aff4bc15bd Hao Luo                 2021-12-16  7758  		u32 *max_access;
20b2aff4bc15bd Hao Luo                 2021-12-16  7759  
20b2aff4bc15bd Hao Luo                 2021-12-16  7760  		if (rdonly_mem) {
afbf21dce668ef Yonghong Song           2020-07-23  7761  			if (t == BPF_WRITE) {
afbf21dce668ef Yonghong Song           2020-07-23  7762  				verbose(env, "R%d cannot write into %s\n",
c25b2ae136039f Hao Luo                 2021-12-16  7763  					regno, reg_type_str(env, reg->type));
afbf21dce668ef Yonghong Song           2020-07-23  7764  				return -EACCES;
afbf21dce668ef Yonghong Song           2020-07-23  7765  			}
20b2aff4bc15bd Hao Luo                 2021-12-16  7766  			max_access = &env->prog->aux->max_rdonly_access;
20b2aff4bc15bd Hao Luo                 2021-12-16  7767  		} else {
20b2aff4bc15bd Hao Luo                 2021-12-16  7768  			max_access = &env->prog->aux->max_rdwr_access;
20b2aff4bc15bd Hao Luo                 2021-12-16  7769  		}
20b2aff4bc15bd Hao Luo                 2021-12-16  7770  
f6dfbe31e8fa5c Colin Ian King          2020-07-27  7771  		err = check_buffer_access(env, reg, regno, off, size, false,
44e9a741cad824 Shung-Hsi Yu            2022-03-07  7772  					  max_access);
20b2aff4bc15bd Hao Luo                 2021-12-16  7773  
20b2aff4bc15bd Hao Luo                 2021-12-16  7774  		if (!err && value_regno >= 0 && (rdonly_mem || t == BPF_READ))
afbf21dce668ef Yonghong Song           2020-07-23  7775  			mark_reg_unknown(env, regs, value_regno);
6082b6c328b548 Alexei Starovoitov      2024-03-07  7776  	} else if (reg->type == PTR_TO_ARENA) {
6082b6c328b548 Alexei Starovoitov      2024-03-07  7777  		if (t == BPF_READ && value_regno >= 0)
6082b6c328b548 Alexei Starovoitov      2024-03-07  7778  			mark_reg_unknown(env, regs, value_regno);
17a5267067f3c3 Alexei Starovoitov      2014-09-26  7779  	} else {
61bd5218eef349 Jakub Kicinski          2017-10-09  7780  		verbose(env, "R%d invalid mem access '%s'\n", regno,
c25b2ae136039f Hao Luo                 2021-12-16  7781  			reg_type_str(env, reg->type));
17a5267067f3c3 Alexei Starovoitov      2014-09-26  7782  		return -EACCES;
17a5267067f3c3 Alexei Starovoitov      2014-09-26  7783  	}
969bf05eb3cedd Alexei Starovoitov      2016-05-05  7784  
f1174f77b50c94 Edward Cree             2017-08-07  7785  	if (!err && size < BPF_REG_SIZE && value_regno >= 0 && t == BPF_READ &&
638f5b90d46016 Alexei Starovoitov      2017-10-31  7786  	    regs[value_regno].type == SCALAR_VALUE) {
1f9a1ea821ff25 Yonghong Song           2023-07-27  7787  		if (!is_ldsx)
f1174f77b50c94 Edward Cree             2017-08-07  7788  			/* b/h/w load zero-extends, mark upper bits as known 0 */
0c17d1d2c61936 Jann Horn               2017-12-18  7789  			coerce_reg_to_size(&regs[value_regno], size);
1f9a1ea821ff25 Yonghong Song           2023-07-27  7790  		else
1f9a1ea821ff25 Yonghong Song           2023-07-27  7791  			coerce_reg_to_size_sx(&regs[value_regno], size);
969bf05eb3cedd Alexei Starovoitov      2016-05-05  7792  	}
17a5267067f3c3 Alexei Starovoitov      2014-09-26  7793  	return err;
17a5267067f3c3 Alexei Starovoitov      2014-09-26  7794  }
17a5267067f3c3 Alexei Starovoitov      2014-09-26  7795  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
