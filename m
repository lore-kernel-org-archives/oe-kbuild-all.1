Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CC9E25F99F
	for <oe-kbuild-all@lists.linux.dev>; Tue, 17 Feb 2026 05:24:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771305859; cv=none; b=k16jAadzVb8KO5sA9hDjviG0NVN6jgj1/jss+1IxRzqFRLNiJlOz1nYtxzubUka+yo00VqVdKkxxLt/QPcruMenD+YnSqY+StLK+K+8of0xN7Cot9dl4Esxfgi2zJVpYMFh0grP2MKJOoXnq6q6eyghhQU4gNPQbGLhbIKaJWTo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771305859; c=relaxed/simple;
	bh=xnzvI0dvY1F6SzS6tkE5JdjTYwIWYLKs5Ofc48sGVdA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XazDDwMOhxYSFk9DRDjr580HShoLOhKykCQoKxwO258Y5pdmo65LLGbZG951gq4Fj9Q5agvS1MpbJfVk/BqpdkX6QyhYgLpuP+KJtr3Eq7M8WG7DEZjD5HMowv5iEaJN/shVHmWniBikgmN9iL+iFOgxQZv9g1B0mCqx93SwXZ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=M/v7YkrE; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="M/v7YkrE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771305858; x=1802841858;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=xnzvI0dvY1F6SzS6tkE5JdjTYwIWYLKs5Ofc48sGVdA=;
  b=M/v7YkrE3Cl4/vyLuOBLeZ3KWCGtq21iKaFI2XYSuCpRUeg0U3OqGIwL
   GryT6ItIyeFUS2ySLtJ+n5ZcO8uIVtIRb0HGP7IP4ch6GvvRPyny67dYP
   vkyuOFGzqqz1SQ00n8lH7ONpnkkqwc5EgNUzHVKsogEji+IU5q/bepmS1
   2d9c0qZuccpWntApm62x/+PgkNWvyhMmfaaa0iyLVy9u0RN2TqLW8wJ4j
   RBhQgN4+aqC9p6OFsnK6yWWqVvE0Fv+zueNNAf1dDl/rHFtmzsaEnQ8rx
   wi1vx/BESqPIpXizgrgzaBb6GYAdcnMO3ZkasvAVEoIoBMRBlnDQVMmjh
   Q==;
X-CSE-ConnectionGUID: GkWqianKTXarJEVc/NGCQw==
X-CSE-MsgGUID: V0ucgjz7TciyCineH/4q5w==
X-IronPort-AV: E=McAfee;i="6800,10657,11703"; a="72279697"
X-IronPort-AV: E=Sophos;i="6.21,295,1763452800"; 
   d="scan'208";a="72279697"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Feb 2026 21:24:16 -0800
X-CSE-ConnectionGUID: +RfV6L2hToyQWGU8Gz6V9w==
X-CSE-MsgGUID: mkNANzXsT9ydo831Z9v36A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,295,1763452800"; 
   d="scan'208";a="212869103"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 16 Feb 2026 21:24:15 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vsDZE-000000010do-3W9j;
	Tue, 17 Feb 2026 05:24:12 +0000
Date: Tue, 17 Feb 2026 13:24:03 +0800
From: kernel test robot <lkp@intel.com>
To: Pavel Begunkov <asml.silence@gmail.com>, io-uring@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, asml.silence@gmail.com,
	bpf@vger.kernel.org, axboe@kernel.dk,
	Alexei Starovoitov <alexei.starovoitov@gmail.com>
Subject: Re: [PATCH v7 2/5] io_uring/bpf-ops: implement loop_step with BPF
 struct_ops
Message-ID: <202602171315.iJKYSSFe-lkp@intel.com>
References: <ec7d21e6e16c49165fa1e8af2aa09d01c111ea97.1771260487.git.asml.silence@gmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ec7d21e6e16c49165fa1e8af2aa09d01c111ea97.1771260487.git.asml.silence@gmail.com>

Hi Pavel,

kernel test robot noticed the following build warnings:

[auto build test WARNING on axboe/for-next]
[also build test WARNING on linus/master next-20260216]
[cannot apply to shuah-kselftest/next shuah-kselftest/fixes v6.19]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Pavel-Begunkov/io_uring-introduce-callback-driven-main-loop/20260217-005705
base:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux.git for-next
patch link:    https://lore.kernel.org/r/ec7d21e6e16c49165fa1e8af2aa09d01c111ea97.1771260487.git.asml.silence%40gmail.com
patch subject: [PATCH v7 2/5] io_uring/bpf-ops: implement loop_step with BPF struct_ops
config: parisc-randconfig-r071-20260217 (https://download.01.org/0day-ci/archive/20260217/202602171315.iJKYSSFe-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 8.5.0
smatch version: v0.5.0-8994-gd50c5a4c

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602171315.iJKYSSFe-lkp@intel.com/

smatch warnings:
io_uring/bpf-ops.c:45 bpf_io_btf_struct_access() warn: always true condition '(off >= $expr_0x7fb415932650(30)) => (s32min-s32max >= 0)'

vim +45 io_uring/bpf-ops.c

    37	
    38	static int bpf_io_btf_struct_access(struct bpf_verifier_log *log,
    39					    const struct bpf_reg_state *reg, int off,
    40					    int size)
    41	{
    42		const struct btf_type *t = btf_type_by_id(reg->btf, reg->btf_id);
    43	
    44		if (t == loop_params_type) {
  > 45			if (off >= offsetof(struct iou_loop_params, cq_wait_idx) &&
    46			    off + size <= offsetofend(struct iou_loop_params, cq_wait_idx))
    47				return SCALAR_VALUE;
    48		}
    49	
    50		return -EACCES;
    51	}
    52	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
