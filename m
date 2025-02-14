Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BFA526869A
	for <oe-kbuild-all@lists.linux.dev>; Fri, 14 Feb 2025 17:44:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739555097; cv=none; b=kn58SxeWEixVv9Mi6f3ZoHsMwFOw0v8j1cqqnQA5Kc/lR8bdAbzAcT2lN/tAQAEem3STUiPtLwwKWluPB5WXzRmRzcDniVrFEGYVpvHW1vhfipU7l9rIaZZU6fIasa/h1nUSicy9o5wTGHICTSIFhrtkHJDT3ksNrui1lSX+sC4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739555097; c=relaxed/simple;
	bh=6Eca5RyitApw05FUFqqK/KWjakVHSZsOTM1AmVXS3d8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=K7i7jEQVidbXF3CmGZa1liYuJr3w48c/2CPch914qsMi+aHIlonwGOQoMkVk8Vus4kwVbBNuZyVW8I83NHpRQK+Ex9P0oVx0LbZ4pFK7NHo71X/l10gdHFoISsJRG6t5nGNQCU6iJYbvzkgwJfHaT4r45tzGwwE++9Q2xTAsDYs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bCbjqSMu; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bCbjqSMu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739555097; x=1771091097;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=6Eca5RyitApw05FUFqqK/KWjakVHSZsOTM1AmVXS3d8=;
  b=bCbjqSMuTl6fjnQVXUFGMT8iUZ0AvUZkAezzksQtenlH8IyvvCheOBNV
   tpR8b2ekXtQV88vin5gjn+ngC8rlqmwEE5Tl5TjHJgRCeltiVDAP5ahG9
   m/9F+RhyWKIY8QNXde1L/se63Td7TWs9rbihqXfuvF3ofTj69+btdAMnr
   TSHEzLxB7MqXOIoMYRJ4YbBpbuIvHm1bYA00hJC7Yb6soALvFNqjpc7y7
   vdvb8hKb/rqEdq3L3LmM6+cIWiTRnx3lMNHsmy2fZ1Tmk+6/Co1InhNBm
   bsOVf+8QvYxSSn4fVQNPg5ZEeoyWjcs15DkBnh8/7rCLAOkHve6Fu+Hqz
   Q==;
X-CSE-ConnectionGUID: Xf6KVm7ZRMykW+Zznix9Zg==
X-CSE-MsgGUID: X+R5Q0uTQtiBV4XunH7ycg==
X-IronPort-AV: E=McAfee;i="6700,10204,11345"; a="40436457"
X-IronPort-AV: E=Sophos;i="6.13,286,1732608000"; 
   d="scan'208";a="40436457"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Feb 2025 09:44:56 -0800
X-CSE-ConnectionGUID: KbW0p+xJQIqTIKcUKoDtlA==
X-CSE-MsgGUID: ErbVLeP0RVi7Qm1a7RvF9Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="118720615"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 14 Feb 2025 09:44:51 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tizk8-0019yJ-1X;
	Fri, 14 Feb 2025 17:44:48 +0000
Date: Sat, 15 Feb 2025 01:44:01 +0800
From: kernel test robot <lkp@intel.com>
To: zhangmingyi <zhangmingyi5@huawei.com>, ast@kernel.org,
	daniel@iogearbox.net, andrii@kernel.org, martin.lau@linux.dev,
	song@kernel.org, yhs@fb.com, john.fastabend@gmail.com,
	kpsingh@kernel.org, sdf@google.com, haoluo@google.com,
	jolsa@kernel.org
Cc: oe-kbuild-all@lists.linux.dev, bpf@vger.kernel.org,
	linux-kernel@vger.kernel.org, yanan@huawei.com,
	wuchangye@huawei.com, xiesongyang@huawei.com, liuxin350@huawei.com,
	liwei883@huawei.com, tianmuyang@huawei.com, zhangmingyi5@huawei.com
Subject: Re: [PATCH v2 2/2] bpf-next: selftest for TCP_ULP in bpf_setsockopt
Message-ID: <202502150104.1LKDPqiq-lkp@intel.com>
References: <20250210134550.3189616-3-zhangmingyi5@huawei.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250210134550.3189616-3-zhangmingyi5@huawei.com>

Hi zhangmingyi,

kernel test robot noticed the following build errors:

[auto build test ERROR on bpf-next/master]
[also build test ERROR on bpf/master mptcp/export mptcp/export-net linus/master v6.14-rc2 next-20250214]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/zhangmingyi/bpf-next-Introduced-to-support-the-ULP-to-get-or-set-sockets/20250210-215203
base:   https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next.git master
patch link:    https://lore.kernel.org/r/20250210134550.3189616-3-zhangmingyi5%40huawei.com
patch subject: [PATCH v2 2/2] bpf-next: selftest for TCP_ULP in bpf_setsockopt
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250215/202502150104.1LKDPqiq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502150104.1LKDPqiq-lkp@intel.com/

All errors (new ones prefixed by >>):

>> progs/setget_sockopt_tcp_ulp.c:18:42: error: use of undeclared identifier 'TCP_ULP'; did you mean 'MCP_UC'?
      18 |                 if (bpf_setsockopt(skops, IPPROTO_TCP, TCP_ULP, (void *)target_ulp,
         |                                                        ^~~~~~~
         |                                                        MCP_UC
   tools/testing/selftests/bpf/tools/include/vmlinux.h:18434:2: note: 'MCP_UC' declared here
    18434 |         MCP_UC = 2,
          |         ^
   progs/setget_sockopt_tcp_ulp.c:22:42: error: use of undeclared identifier 'TCP_ULP'; did you mean 'MCP_UC'?
      22 |                 if (bpf_getsockopt(skops, IPPROTO_TCP, TCP_ULP, verify_ulp,
         |                                                        ^~~~~~~
         |                                                        MCP_UC
   tools/testing/selftests/bpf/tools/include/vmlinux.h:18434:2: note: 'MCP_UC' declared here
    18434 |         MCP_UC = 2,
          |         ^
   2 errors generated.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
