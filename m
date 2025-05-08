Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5387E227E82
	for <oe-kbuild-all@lists.linux.dev>; Thu,  8 May 2025 12:54:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746708842; cv=none; b=eJQkGy7mtFrML4KGDB67j8QVfC84vM7mOdRYpW4FlDZBxDxpWca2TV4uxVVODrghF6LXYk+ir57CqJaglUPGzi3h1JXUYN+HGwu9cKcSnG62zG+51KVpzptHpz+tET+rqgH/lu0AuFudpnh6wNGxVl/XrhDmkaqfF1CX2wTwEcg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746708842; c=relaxed/simple;
	bh=E1G7/DPaVZcgUrXWpj/WuwzbkWxsDHrIBtx2tT4t4xA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZDYk6TdIegxJaDo2Xrzb9egexYsMSUyz6dcCmekyi/Q6dLQSLcUs2PfaC3LodfAWKJPJYttp1Tb1S7joq4CJOq11kQa9BN/IX6ZX/MMyUF6l1XIpoz9A6LK3RnX0d+QgyRS1eyQCuQFWR82ejGBXXiiWr7IR9Lk6HW2uhQs6/hw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HIbFmTCx; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HIbFmTCx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746708841; x=1778244841;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=E1G7/DPaVZcgUrXWpj/WuwzbkWxsDHrIBtx2tT4t4xA=;
  b=HIbFmTCxYBcIluq3tx2hnQQYM0D8m5ehcck4X771EtjdOncE6pDl+m7G
   BukpNqAlRHwfvoINTck5RDCstiGdXgkk5c1aCeuX/+XKUy9S1d6bQgCGN
   I1vXZDa44kp6RfmhSS8VO68p7ZjHjV/efNnXLteZ6+YsvlI9DiFVrAZI6
   N008GPWJXft6gfPJibiPljveoY1qTA0qwKvRoUyYwi26ycJvGpZalCk5t
   Xp3yDM3q/darBaUQnj2b2KBU8earJMTZiLytDhV2P6kpqux0ZgDC/oMR0
   kvY15kloKPSo+/sia5gnRFm8ooErRbrKEz2Jqa8EAa0ntrrlHqXzsZrgl
   A==;
X-CSE-ConnectionGUID: n716Ezm0TV2y56jLMKEwMA==
X-CSE-MsgGUID: 6RwFLnuYQ7uy2BAII8UcCA==
X-IronPort-AV: E=McAfee;i="6700,10204,11426"; a="59481429"
X-IronPort-AV: E=Sophos;i="6.15,272,1739865600"; 
   d="scan'208";a="59481429"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 May 2025 05:54:00 -0700
X-CSE-ConnectionGUID: WnBzK76JSti42Mp9yhkUWQ==
X-CSE-MsgGUID: VhDwxvZTTbW9ratli07BOA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,272,1739865600"; 
   d="scan'208";a="137213309"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 08 May 2025 05:53:59 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uD0lA-000AyJ-2C;
	Thu, 08 May 2025 12:53:56 +0000
Date: Thu, 8 May 2025 20:53:21 +0800
From: kernel test robot <lkp@intel.com>
To: Kumar Kartikeya Dwivedi <memxor@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH bpf-next v1 06/11] bpf: Report may_goto timeout to BPF
 stderr
Message-ID: <202505082019.euW3a7Kk-lkp@intel.com>
References: <20250507171720.1958296-7-memxor@gmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250507171720.1958296-7-memxor@gmail.com>

Hi Kumar,

kernel test robot noticed the following build errors:

[auto build test ERROR on 43745d11bfd9683abdf08ad7a5cc403d6a9ffd15]

url:    https://github.com/intel-lab-lkp/linux/commits/Kumar-Kartikeya-Dwivedi/bpf-Introduce-bpf_dynptr_from_mem_slice/20250508-012020
base:   43745d11bfd9683abdf08ad7a5cc403d6a9ffd15
patch link:    https://lore.kernel.org/r/20250507171720.1958296-7-memxor%40gmail.com
patch subject: [PATCH bpf-next v1 06/11] bpf: Report may_goto timeout to BPF stderr
config: microblaze-defconfig (https://download.01.org/0day-ci/archive/20250508/202505082019.euW3a7Kk-lkp@intel.com/config)
compiler: microblaze-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250508/202505082019.euW3a7Kk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505082019.euW3a7Kk-lkp@intel.com/

All errors (new ones prefixed by >>):

   microblaze-linux-ld: kernel/bpf/core.o: in function `bpf_prog_report_may_goto_violation':
>> kernel/bpf/core.c:3166:(.text+0x6e08): undefined reference to `bpf_prog_stream_error_limit'
>> microblaze-linux-ld: kernel/bpf/core.c:3166:(.text+0x6e28): undefined reference to `bpf_stream_stage_init'
>> microblaze-linux-ld: kernel/bpf/core.c:3166:(.text+0x6e3c): undefined reference to `bpf_stream_stage_printk'
>> microblaze-linux-ld: kernel/bpf/core.c:3166:(.text+0x6e48): undefined reference to `bpf_stream_stage_dump_stack'
>> microblaze-linux-ld: kernel/bpf/core.c:3166:(.text+0x6e5c): undefined reference to `bpf_stream_stage_commit'
>> microblaze-linux-ld: kernel/bpf/core.c:3166:(.text+0x6e68): undefined reference to `bpf_stream_stage_free'


vim +3166 kernel/bpf/core.c

  3158	
  3159	static noinline void bpf_prog_report_may_goto_violation(void)
  3160	{
  3161		struct bpf_prog *prog;
  3162	
  3163		prog = bpf_prog_find_from_stack();
  3164		if (!prog)
  3165			return;
> 3166		bpf_stream_stage(prog, BPF_STDERR, ({
  3167			bpf_stream_printk("ERROR: Timeout detected for may_goto instruction\n");
  3168			bpf_stream_dump_stack();
  3169		}));
  3170	}
  3171	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
