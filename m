Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 717B73176EB
	for <oe-kbuild-all@lists.linux.dev>; Fri, 15 Aug 2025 18:06:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755281197; cv=none; b=FY9ycosNxA9k+O11iU60I6qaFM7uVXW4bjCAFw1X+Z2fqtrr84f6WX/tbS5UsgqwtkXrfN5TlfotgyKIfSq7ZSt5Yi9ECeHW5C+aSkdUhEuf8uhWBrwibYTlo+MtkXPg2p1OmP4p2mpUKyF+HovTUbhVONmh03rDI216DfAE0FE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755281197; c=relaxed/simple;
	bh=o7UBMqfzDFywgYxzrjrHuGzCJdhs4C4WEmdj59BvIZU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=D0zQzW2xQqE22pEZ/RnfPFzW90Mkth3hT5HET0l/7Vy6sXipiRlT6+D/w2IhLV9ZR/piFGZbpe/8hudhdY3SDg5Az4c5KSO8/2oBz8WxZ7M5IvkILzFX0ZPhIlHuj3u14WpH5B9DRs6AqVeSEKi2UVjTbhOva/a+YYvtXBPdATc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=afv/p6Eh; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="afv/p6Eh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755281196; x=1786817196;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=o7UBMqfzDFywgYxzrjrHuGzCJdhs4C4WEmdj59BvIZU=;
  b=afv/p6EhoJicBzZcwN8UejCZhfUZmzVLFbpWwwQbh84MYfnS7bwvDKA5
   Qi8e7bDyKgAJsdtLvAqRRDeBodLz7Q8qvqyjvh+a2IluzU0G3+vR8xGAL
   CDr6P5vmxTI3uMJ7QmFVZTqfgBT9YV2VguOG2BavNHMpXIuDokOTu4cNh
   aVNrDHntWIJetZcVv/t4VYjDnVkob11aZmKjaQYQ4udzYFPLEd/M2M63w
   amzSlJoBnE3O2/e3CdS6FhRs324TO771pINvgP/1Q6xT0GHQnH6QPjJoE
   X65P9ycfL16JOkP68vvQTKhjdawtvML/yp56nUznWkK9M1laqy7t+qqdG
   A==;
X-CSE-ConnectionGUID: SLKJlTEyR0O4xn1bIzN/ow==
X-CSE-MsgGUID: dT217yQ/TGuV81+BxXViog==
X-IronPort-AV: E=McAfee;i="6800,10657,11523"; a="69053535"
X-IronPort-AV: E=Sophos;i="6.17,293,1747724400"; 
   d="scan'208";a="69053535"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Aug 2025 11:06:35 -0700
X-CSE-ConnectionGUID: hiheKD3fQ6G4YzfpvYacPQ==
X-CSE-MsgGUID: 67Eyn7ZyR8C5HSwY3H3Lzw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,293,1747724400"; 
   d="scan'208";a="167448075"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by fmviesa009.fm.intel.com with ESMTP; 15 Aug 2025 11:06:31 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1umyou-000CDM-1z;
	Fri, 15 Aug 2025 18:06:28 +0000
Date: Sat, 16 Aug 2025 02:06:05 +0800
From: kernel test robot <lkp@intel.com>
To: Puranjay Mohan <puranjay@kernel.org>,
	Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Andrii Nakryiko <andrii@kernel.org>,
	Martin KaFai Lau <martin.lau@linux.dev>,
	Eduard Zingerman <eddyz87@gmail.com>, Song Liu <song@kernel.org>,
	Yonghong Song <yonghong.song@linux.dev>,
	John Fastabend <john.fastabend@gmail.com>,
	KP Singh <kpsingh@kernel.org>, Stanislav Fomichev <sdf@fomichev.me>,
	Hao Luo <haoluo@google.com>, Jiri Olsa <jolsa@kernel.org>,
	Xu Kuohai <xukuohai@huaweicloud.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Kumar Kartikeya Dwivedi <memxor@gmail.com>, bpf@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH bpf-next v2 2/3] bpf: Report arena faults to BPF stderr
Message-ID: <202508160152.El7IYy94-lkp@intel.com>
References: <20250811111828.13836-3-puranjay@kernel.org>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250811111828.13836-3-puranjay@kernel.org>

Hi Puranjay,

kernel test robot noticed the following build errors:

[auto build test ERROR on bpf-next/master]

url:    https://github.com/intel-lab-lkp/linux/commits/Puranjay-Mohan/bpf-arm64-simplify-exception-table-handling/20250811-192218
base:   https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next.git master
patch link:    https://lore.kernel.org/r/20250811111828.13836-3-puranjay%40kernel.org
patch subject: [PATCH bpf-next v2 2/3] bpf: Report arena faults to BPF stderr
config: x86_64-randconfig-122-20250815 (https://download.01.org/0day-ci/archive/20250816/202508160152.El7IYy94-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250816/202508160152.El7IYy94-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508160152.El7IYy94-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: vmlinux.o: in function `ex_handler_bpf':
>> arch/x86/net/bpf_jit_comp.c:1450: undefined reference to `bpf_prog_report_arena_violation'


vim +1450 arch/x86/net/bpf_jit_comp.c

  1430	
  1431	bool ex_handler_bpf(const struct exception_table_entry *x, struct pt_regs *regs)
  1432	{
  1433		u32 reg = FIELD_GET(FIXUP_REG_MASK, x->fixup);
  1434		u32 insn_len = FIELD_GET(FIXUP_INSN_LEN_MASK, x->fixup);
  1435		bool is_arena = !!(x->fixup & FIXUP_ARENA_ACCESS);
  1436		bool is_write = (reg == DONT_CLEAR);
  1437		unsigned long addr;
  1438		s16 off;
  1439		u32 arena_reg;
  1440	
  1441		/* jump over faulting load and clear dest register */
  1442		if (reg != DONT_CLEAR)
  1443			*(unsigned long *)((void *)regs + reg) = 0;
  1444		regs->ip += insn_len;
  1445	
  1446		if (is_arena) {
  1447			arena_reg = FIELD_GET(FIXUP_ARENA_REG_MASK, x->data);
  1448			off = FIELD_GET(DATA_ARENA_OFFSET_MASK, x->data);
  1449			addr = *(unsigned long *)((void *)regs + arena_reg) + off;
> 1450			bpf_prog_report_arena_violation(is_write, addr);
  1451		}
  1452	
  1453		return true;
  1454	}
  1455	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
