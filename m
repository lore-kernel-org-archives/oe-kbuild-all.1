Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2DCE23BE
	for <oe-kbuild-all@lists.linux.dev>; Sat, 21 Sep 2024 01:22:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726881746; cv=none; b=crhbl6Zn14MisdHgd84R83i4LXMIQZVpfspj2ZA8w3cz8Y9MZtA/aNNdtaMTWD4sA17Jsv5pq/ICcdGyI8wI7J27xqmfOlhAsqnO333BvX26V38qNmh3SX5xNVUMnQm3NKyK4QNTHwoBLxtnxaMcbQf+EaXP1OEPEudFc+uj0Ug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726881746; c=relaxed/simple;
	bh=KtakCcC2qdSEMD5iIVCn5JcCYsCNY/eSfJ41UJSWcUM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XXamhrYSyadZ8CVNYMffkIMtoEY5o0GzsyywAwhlky4dV4241+1raoT1HtIUsvWw8XPEapaAm6+pbzCRaa771CVGCjPZUZne2wG9S3298IucSAhHMtWyC18xNc8gxOhq8I4jHQJkHSeJLR6bfMwJ8+KCBhYi000P/w2KxbjX8OU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VQJdDZm5; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VQJdDZm5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726881745; x=1758417745;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=KtakCcC2qdSEMD5iIVCn5JcCYsCNY/eSfJ41UJSWcUM=;
  b=VQJdDZm5Y55uS1QRLfyFVyiRRCIzKAJraJtjwAu7hq59fAYXwfs3VVbG
   CSTDXbZGkG2D5Ry/LqRmAcY3DRkTU5BPthzvc5zEG1UIb0l23SQpRnUBX
   g+XnislMki8vYY8XgOXWxZdv/RL1KKE2Na5zwZLsu74JyouCuhVGYqq/W
   TBnwiLv/K3m44Fu+mW9D0bPl1qBgkKdhAbLtpGyuk3tu0INPTvJWtNcYs
   ZQJbVP2EV5xodYNnDdD/M18EKoPK4XQu4nOxh7ggPY3DtMHwiK0qywtt6
   OhHpS/FtNr0v14p8ncD3mcoKzjgRzNNRVBcBh1Z40dwEVYk4ypa6YZWg+
   w==;
X-CSE-ConnectionGUID: 7dJbuyPbQzaJreDFd+B9yQ==
X-CSE-MsgGUID: YpE+5Mb5SmGPGv9mf8Wfog==
X-IronPort-AV: E=McAfee;i="6700,10204,11201"; a="37276759"
X-IronPort-AV: E=Sophos;i="6.10,245,1719903600"; 
   d="scan'208";a="37276759"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Sep 2024 18:22:25 -0700
X-CSE-ConnectionGUID: m0vQv04lRSeYrzZoNsQZtQ==
X-CSE-MsgGUID: FdnzwO0zSYK0lqdXGTlIqA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,245,1719903600"; 
   d="scan'208";a="93810647"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 20 Sep 2024 18:22:20 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sropG-000F1C-2D;
	Sat, 21 Sep 2024 01:22:18 +0000
Date: Sat, 21 Sep 2024 09:21:36 +0800
From: kernel test robot <lkp@intel.com>
To: Tao Chen <chen.dylane@gmail.com>, Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	John Fastabend <john.fastabend@gmail.com>,
	Andrii Nakryiko <andrii@kernel.org>,
	Martin KaFai Lau <martin.lau@linux.dev>,
	Eduard Zingerman <eddyz87@gmail.com>, Song Liu <song@kernel.org>,
	Yonghong Song <yonghong.song@linux.dev>,
	Jiri Olsa <jolsa@kernel.org>, Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H . Peter Anvin" <hpa@zytor.com>
Cc: oe-kbuild-all@lists.linux.dev, bpf@vger.kernel.org,
	linux-kernel@vger.kernel.org, sparclinux@vger.kernel.org,
	Tao Chen <chen.dylane@gmail.com>
Subject: Re: [PATCH bpf-next 2/2] bpf: Add BPF_CALL_FUNC* to simplify code
Message-ID: <202409210926.ErxhBmi5-lkp@intel.com>
References: <20240920153706.919154-1-chen.dylane@gmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240920153706.919154-1-chen.dylane@gmail.com>

Hi Tao,

kernel test robot noticed the following build errors:

[auto build test ERROR on bpf-next/master]

url:    https://github.com/intel-lab-lkp/linux/commits/Tao-Chen/bpf-Add-BPF_CALL_FUNC-to-simplify-code/20240920-233936
base:   https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next.git master
patch link:    https://lore.kernel.org/r/20240920153706.919154-1-chen.dylane%40gmail.com
patch subject: [PATCH bpf-next 2/2] bpf: Add BPF_CALL_FUNC* to simplify code
config: openrisc-defconfig (https://download.01.org/0day-ci/archive/20240921/202409210926.ErxhBmi5-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240921/202409210926.ErxhBmi5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409210926.ErxhBmi5-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from kernel/bpf/core.c:21:
   kernel/bpf/core.c: In function '___bpf_prog_run':
>> include/linux/filter.h:464:38: error: called object is not a function or function pointer
     464 | #define BPF_CALL_FUNC(x)        ((x) + (u8 *)__bpf_call_base)
         |                                 ~~~~~^~~~~~~~~~~~~~~~~~~~~~~~
   kernel/bpf/core.c:2010:26: note: in expansion of macro 'BPF_CALL_FUNC'
    2010 |                 BPF_R0 = BPF_CALL_FUNC(insn->imm)(BPF_R1, BPF_R2, BPF_R3,
         |                          ^~~~~~~~~~~~~
   include/linux/filter.h:466:38: error: called object is not a function or function pointer
     466 | #define BPF_CALL_FUNC_ARGS(x)   ((x) + (u8 *)__bpf_call_base_args)
         |                                 ~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/bpf/core.c:2015:26: note: in expansion of macro 'BPF_CALL_FUNC_ARGS'
    2015 |                 BPF_R0 = BPF_CALL_FUNC_ARGS(insn->imm)(BPF_R1, BPF_R2,
         |                          ^~~~~~~~~~~~~~~~~~


vim +464 include/linux/filter.h

   463	
 > 464	#define BPF_CALL_FUNC(x)	((x) + (u8 *)__bpf_call_base)
   465	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
