Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE58A17EC
	for <oe-kbuild-all@lists.linux.dev>; Fri, 28 Jul 2023 03:39:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690515576; x=1722051576;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=fF1iD1JPES47DLkkP+M3b6eez0SDDe7G3R8JHz4KPQU=;
  b=O8MA8e5K/5Qvkfi9hvQxjAGzjYoEiOCdn5UmRBomdNgV0eoWtTLvcFVJ
   iZxwTmiAmzu6czBCLRzu1GDYq+Ggj3OL/1te89wwoqOi0F29qoUsTiK0H
   18tgNmp/3+X8iHHJ9Q/l3WPmHd0+2ryLrK1ny31Y9F3b6JQgRZv/CjeNY
   akcHGk00gbA++4yGCaxJBcn402yfv2X0IEXZgw3L2OCyWJRGgC/bn4otn
   dtjACxvS7VbKBw9sS+GQSrYXoGT5gJ/aTNo0CGjebTMRPzAC+aBq5AeeD
   PhzRL9BaA8SDMTZPf5tZyyXnv05i9onsPV1BQIdGDZWfeapirMZ4rk4cq
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10784"; a="365955762"
X-IronPort-AV: E=Sophos;i="6.01,236,1684825200"; 
   d="scan'208";a="365955762"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jul 2023 20:39:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10784"; a="1057964022"
X-IronPort-AV: E=Sophos;i="6.01,236,1684825200"; 
   d="scan'208";a="1057964022"
Received: from lkp-server02.sh.intel.com (HELO 953e8cd98f7d) ([10.239.97.151])
  by fmsmga005.fm.intel.com with ESMTP; 27 Jul 2023 20:39:30 -0700
Received: from kbuild by 953e8cd98f7d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qPEKA-0002qd-07;
	Fri, 28 Jul 2023 03:39:30 +0000
Date: Fri, 28 Jul 2023 11:38:38 +0800
From: kernel test robot <lkp@intel.com>
To: Yonghong Song <yonghong.song@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev, Alexei Starovoitov <ast@kernel.org>
Subject: [bpf-next:master 3/20] kernel/bpf/verifier.c:5895:21: warning:
 suggest parentheses around comparison in operand of '=='
Message-ID: <202307281133.wi0c4SqG-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next.git master
head:   f7e6bd33d1d404608515addcd84cf25ac5289314
commit: 1f9a1ea821ff25353a0e80d971e7958cd55b47a3 [3/20] bpf: Support new sign-extension load insns
config: arc-randconfig-r043-20230728 (https://download.01.org/0day-ci/archive/20230728/202307281133.wi0c4SqG-lkp@intel.com/config)
compiler: arc-elf-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230728/202307281133.wi0c4SqG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307281133.wi0c4SqG-lkp@intel.com/

All warnings (new ones prefixed by >>):

   kernel/bpf/verifier.c: In function 'coerce_reg_to_size_sx':
>> kernel/bpf/verifier.c:5895:21: warning: suggest parentheses around comparison in operand of '==' [-Wparentheses]
    5895 |         if (s64_max >= 0 == s64_min >= 0) {
         |             ~~~~~~~~^~~~


vim +5895 kernel/bpf/verifier.c

  5848	
  5849	static void coerce_reg_to_size_sx(struct bpf_reg_state *reg, int size)
  5850	{
  5851		s64 init_s64_max, init_s64_min, s64_max, s64_min, u64_cval;
  5852		u64 top_smax_value, top_smin_value;
  5853		u64 num_bits = size * 8;
  5854	
  5855		if (tnum_is_const(reg->var_off)) {
  5856			u64_cval = reg->var_off.value;
  5857			if (size == 1)
  5858				reg->var_off = tnum_const((s8)u64_cval);
  5859			else if (size == 2)
  5860				reg->var_off = tnum_const((s16)u64_cval);
  5861			else
  5862				/* size == 4 */
  5863				reg->var_off = tnum_const((s32)u64_cval);
  5864	
  5865			u64_cval = reg->var_off.value;
  5866			reg->smax_value = reg->smin_value = u64_cval;
  5867			reg->umax_value = reg->umin_value = u64_cval;
  5868			reg->s32_max_value = reg->s32_min_value = u64_cval;
  5869			reg->u32_max_value = reg->u32_min_value = u64_cval;
  5870			return;
  5871		}
  5872	
  5873		top_smax_value = ((u64)reg->smax_value >> num_bits) << num_bits;
  5874		top_smin_value = ((u64)reg->smin_value >> num_bits) << num_bits;
  5875	
  5876		if (top_smax_value != top_smin_value)
  5877			goto out;
  5878	
  5879		/* find the s64_min and s64_min after sign extension */
  5880		if (size == 1) {
  5881			init_s64_max = (s8)reg->smax_value;
  5882			init_s64_min = (s8)reg->smin_value;
  5883		} else if (size == 2) {
  5884			init_s64_max = (s16)reg->smax_value;
  5885			init_s64_min = (s16)reg->smin_value;
  5886		} else {
  5887			init_s64_max = (s32)reg->smax_value;
  5888			init_s64_min = (s32)reg->smin_value;
  5889		}
  5890	
  5891		s64_max = max(init_s64_max, init_s64_min);
  5892		s64_min = min(init_s64_max, init_s64_min);
  5893	
  5894		/* both of s64_max/s64_min positive or negative */
> 5895		if (s64_max >= 0 == s64_min >= 0) {
  5896			reg->smin_value = reg->s32_min_value = s64_min;
  5897			reg->smax_value = reg->s32_max_value = s64_max;
  5898			reg->umin_value = reg->u32_min_value = s64_min;
  5899			reg->umax_value = reg->u32_max_value = s64_max;
  5900			reg->var_off = tnum_range(s64_min, s64_max);
  5901			return;
  5902		}
  5903	
  5904	out:
  5905		set_sext64_default_val(reg, size);
  5906	}
  5907	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
