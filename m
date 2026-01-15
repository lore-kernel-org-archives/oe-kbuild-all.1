Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1228B2BE621
	for <oe-kbuild-all@lists.linux.dev>; Thu, 15 Jan 2026 05:15:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768454149; cv=none; b=uTmlILFCN68jzU5peYWzYpselrtmYXZHYDKSnVQldvCFea+LdNdmTni6hxh4mHfmivfOoP7deTDv5GgxFxX1nLE307BhQSi6ADpk0hP5mj8aU3toT2QBmQGOKsf9HqytK64Gq5hlJC8BQoNPkYEe4IXKjg9l87PuNI+yKIwAV0c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768454149; c=relaxed/simple;
	bh=vHJ1dv5WAtIGV0+AyYeoWG2NYgEuwSGoC9/YLGBuYkQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=h4Refik1b5yGn4dfsEiPBg52+k/YPGDXmjwCubFoQ1oMBsHCCxBoevmdsTTvfpQoKDGgk+2sh/dp1/Rb4H5xAfN9+MlhiB6T5RaqO2uTK2CRy4yIln9embtXLLolEB8CaryJy0Yt+/YeokXUksS2sRX15fQRnLwePlQGG9xjnmo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VNQJWtpT; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VNQJWtpT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768454148; x=1799990148;
  h=date:from:to:cc:subject:message-id;
  bh=vHJ1dv5WAtIGV0+AyYeoWG2NYgEuwSGoC9/YLGBuYkQ=;
  b=VNQJWtpTN9bxskxdPetrDVD2ux6R8RxsxfAKP53FrYsV5HH+v0dqv8XF
   2A30hHEcSEgQ6KWSvk04BXD4zGvR1LI2v4Jxqt4r7NZDDYEG0avtpE5bk
   UEMq/h7QCKbTAwuK4VEV7HAcjzd/+7MMwF2jU/cea3LuBW3z/n2h4mniR
   wNjUkCXGyWWQSH0hGXhAeTJOeAEV71QyMCNgDBc62mjfLqLLMSZOTM7S+
   IE20sxufxgJlPPjvP7JNwALV8+uinVf8YrtxG91Z2zK9OYO8IcYEPCvmV
   unUz8eOXTn9O2K8PLjNxhBom5yan5NPV1Rzsd7o/5Hz8AzEPlz9qcUBeR
   A==;
X-CSE-ConnectionGUID: FkqTpKtfSrWyHoeOW8qovg==
X-CSE-MsgGUID: oEDOwsUISduv+1g7QfnIrQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11671"; a="81124392"
X-IronPort-AV: E=Sophos;i="6.21,226,1763452800"; 
   d="scan'208";a="81124392"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jan 2026 21:15:47 -0800
X-CSE-ConnectionGUID: AVeGK823Qk2l5ZmUwwvPCA==
X-CSE-MsgGUID: vdq4IuT+RqWqocc8IZTyiA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,226,1763452800"; 
   d="scan'208";a="205277846"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 14 Jan 2026 21:15:46 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vgFhw-00000000HZs-0gHz;
	Thu, 15 Jan 2026 05:15:44 +0000
Date: Thu, 15 Jan 2026 13:15:12 +0800
From: kernel test robot <lkp@intel.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [axboe:io_uring-bpf-restrictions 14/15]
 io_uring/bpf_filter.c:84:3: error: implicit declaration of function
 'io_socket_bpf_populate'; did you mean 'vmemmap_populate'?
Message-ID: <202601151348.XwxgNChZ-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux.git io_uring-bpf-restrictions
head:   fa70f6f40710a9cdb29e47989eb0dff2f9c950f6
commit: 11d1f358bfae44ea49a9c7781e19d9d91eb8551d [14/15] io_uring: add support for BPF filtering for opcode restrictions
config: xtensa-randconfig-001-20260115 (https://download.01.org/0day-ci/archive/20260115/202601151348.XwxgNChZ-lkp@intel.com/config)
compiler: xtensa-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260115/202601151348.XwxgNChZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601151348.XwxgNChZ-lkp@intel.com/

All errors (new ones prefixed by >>):

   io_uring/bpf_filter.c: In function 'io_uring_populate_bpf_ctx':
>> io_uring/bpf_filter.c:84:3: error: implicit declaration of function 'io_socket_bpf_populate'; did you mean 'vmemmap_populate'? [-Werror=implicit-function-declaration]
      io_socket_bpf_populate(bctx, req);
      ^~~~~~~~~~~~~~~~~~~~~~
      vmemmap_populate
   cc1: some warnings being treated as errors


vim +84 io_uring/bpf_filter.c

    72	
    73	/* Populate BPF context from SQE */
    74	static void io_uring_populate_bpf_ctx(struct io_uring_bpf_ctx *bctx,
    75					      struct io_kiocb *req)
    76	{
    77		memset(bctx, 0, sizeof(*bctx));
    78		bctx->opcode = req->opcode;
    79		bctx->sqe_flags = req->flags & SQE_VALID_FLAGS;
    80		bctx->user_data = req->cqe.user_data;
    81	
    82		switch (req->opcode) {
    83		case IORING_OP_SOCKET:
  > 84			io_socket_bpf_populate(bctx, req);
    85			break;
    86		}
    87	}
    88	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
