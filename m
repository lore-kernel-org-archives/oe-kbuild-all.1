Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BB5E2F56
	for <oe-kbuild-all@lists.linux.dev>; Sun, 20 Oct 2024 19:53:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729453997; cv=none; b=bZ8fxDNPNAN9Qlrptx83miTLg9mUHZkkh/Z+an/aFzCMqr30dQWBVfshnAn6OFIBJLNZdQJgbhGKVflwOi+F5W71V65w9Ka5Go7VAvQqByDHrUHJKj0klyVbe7onJ8tiozNITwnkL1homeS1Gk20Z9JFrK002zGDWg3ZdALUwOI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729453997; c=relaxed/simple;
	bh=J6E3qOlIPfmy+KzOM0qIYC0vVNBGa+kCznmafIO9OY0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=s1j9CfX40zwSctS2fuLUzuqlL13UFBCZxc3adosC9zoG8XflchyJkzi0wEqrU775A27ttO8x+fY6rCcJP88AdB0m1IUf9KV4XFqaPnqLH2ZMCR280Vn3PTgxozs0QoIQWfiZTZFRhZmt4Pa/wyYCigP56r7nxAbYyOKpO7V7xDM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=f3wHWiBr; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="f3wHWiBr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729453995; x=1760989995;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=J6E3qOlIPfmy+KzOM0qIYC0vVNBGa+kCznmafIO9OY0=;
  b=f3wHWiBrJkmBSCt+DuW0qFr+GvfF3wkHWsH3CVzo5qdViurN1IAAC/kv
   3kYXUPDLAMj3RWbZMQl47qAq/2jR171WddO8Guo9F4aBRx9DqU6SZ5uzD
   FS6w3qEMX9QVbdQaRljKd8oECYFrbZQKoS+BoyZn4XnfQ476d03sbJISo
   T0AcdRs9cEKwFyrxgSnGGLQJzyoqFKOBO5YGAhKQ2YFjrv1cMGRculySh
   ZvGqhjTjh7Ejzn9gZiOJ5+EY8B4X0z4/fc9P3Gwk626xnEOk3T0bhPVv5
   gslofWYdcMcVfQfkJ/fTU5ELvbV6vkUvUyWnytbnB65KPRgB0XSM4unf3
   g==;
X-CSE-ConnectionGUID: lZP+O8wpSIC1TsSwIosBSA==
X-CSE-MsgGUID: QxqT2CZZTcCXxpLTOVhGPg==
X-IronPort-AV: E=McAfee;i="6700,10204,11231"; a="16557541"
X-IronPort-AV: E=Sophos;i="6.11,219,1725346800"; 
   d="scan'208";a="16557541"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Oct 2024 12:53:14 -0700
X-CSE-ConnectionGUID: yFDUaOssRtWYrHNbgiCIFw==
X-CSE-MsgGUID: sPLuMLrSSIms6gOVGDUQBA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,219,1725346800"; 
   d="scan'208";a="78989801"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 20 Oct 2024 12:53:12 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t2bzC-000Qkx-06;
	Sun, 20 Oct 2024 19:53:10 +0000
Date: Mon, 21 Oct 2024 03:52:24 +0800
From: kernel test robot <lkp@intel.com>
To: Yonghong Song <yonghong.song@linux.dev>, bpf@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, Alexei Starovoitov <ast@kernel.org>,
	Andrii Nakryiko <andrii@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>, kernel-team@fb.com,
	Martin KaFai Lau <martin.lau@kernel.org>, Tejun Heo <tj@kernel.org>
Subject: Re: [PATCH bpf-next v5 7/9] bpf, x86: Add jit support for private
 stack
Message-ID: <202410210358.dvPfsO1C-lkp@intel.com>
References: <20241017223214.3177977-1-yonghong.song@linux.dev>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241017223214.3177977-1-yonghong.song@linux.dev>

Hi Yonghong,

kernel test robot noticed the following build warnings:

[auto build test WARNING on bpf-next/master]

url:    https://github.com/intel-lab-lkp/linux/commits/Yonghong-Song/bpf-Allow-each-subprog-having-stack-size-of-512-bytes/20241018-063530
base:   https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next.git master
patch link:    https://lore.kernel.org/r/20241017223214.3177977-1-yonghong.song%40linux.dev
patch subject: [PATCH bpf-next v5 7/9] bpf, x86: Add jit support for private stack
config: x86_64-randconfig-122-20241021 (https://download.01.org/0day-ci/archive/20241021/202410210358.dvPfsO1C-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241021/202410210358.dvPfsO1C-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410210358.dvPfsO1C-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> arch/x86/net/bpf_jit_comp.c:1487:44: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/net/bpf_jit_comp.c:1488:31: sparse: sparse: cast removes address space '__percpu' of expression
   arch/x86/net/bpf_jit_comp.c:2073:54: sparse: sparse: cast truncates bits from constant value (800000a00000 becomes a00000)

vim +/__percpu +1487 arch/x86/net/bpf_jit_comp.c

  1477	
  1478	static void emit_root_priv_frame_ptr(u8 **pprog, struct bpf_prog *bpf_prog,
  1479					     u32 orig_stack_depth)
  1480	{
  1481		void __percpu *priv_frame_ptr;
  1482		u8 *prog = *pprog;
  1483	
  1484		priv_frame_ptr = bpf_prog->aux->priv_stack_ptr + orig_stack_depth;
  1485	
  1486		/* movabs r9, priv_frame_ptr */
> 1487		emit_mov_imm64(&prog, X86_REG_R9, (long) priv_frame_ptr >> 32,
  1488			       (u32) (long) priv_frame_ptr);
  1489	#ifdef CONFIG_SMP
  1490		/* add <r9>, gs:[<off>] */
  1491		EMIT2(0x65, 0x4c);
  1492		EMIT3(0x03, 0x0c, 0x25);
  1493		EMIT((u32)(unsigned long)&this_cpu_off, 4);
  1494	#endif
  1495		*pprog = prog;
  1496	}
  1497	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
