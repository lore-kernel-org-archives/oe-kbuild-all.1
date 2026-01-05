Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC07127A907
	for <oe-kbuild-all@lists.linux.dev>; Mon,  5 Jan 2026 23:34:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767656085; cv=none; b=aC10JVHVmon+QgW/GlrVaos3A6JWF+cg/nLciJkZxEgKBUDNsGI8kDGSXGTWj70noeMIBHUjMuElpoUcAavAoFNIOPBq8KqjMX8bn/xlAc1lNzjdzE3lC16E6SlRFcEaEsDdrn4Ovui1EGIfk//cfb0Tq/TUUb+KfL4kvKbS/t8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767656085; c=relaxed/simple;
	bh=aVel+3PArrHiUppJby9wckkKcoGFZZBoY3CDbI51Urs=;
	h=Date:From:To:Cc:Subject:Message-ID; b=f4x+cpMF9o4t03Vrr12L6kInkR2fbP4BDGvroclx+6ldm9X5UZ2Sk0ZpJ87YkkIB4sEHR3qkt1e5E0ihf5Qo2vrZ4yunqg48fk/HWvAZYAYEQc2IHfry0lq0hILKQplQvIldqJULFT4U6I2TFgB18PQEnqghpJnDYuz7e1ntovE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fU49/vS+; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fU49/vS+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767656083; x=1799192083;
  h=date:from:to:cc:subject:message-id;
  bh=aVel+3PArrHiUppJby9wckkKcoGFZZBoY3CDbI51Urs=;
  b=fU49/vS++g5DIJI9Ic2v+EiZEd3NIKfk0fcAlt61bYl9vgWxq4YqOcq/
   CctzJ1zK1z5SOQeiXKmfbUuk5azCSNmS/gTaK3Ih66XZxtckBZ6QQgKk2
   8Ee1jCg5dQK1WEI+fCuw/C9r6i6G/bL2UN6C6dVS9v096O+e7oRYEYP11
   W+7/regtbtnBQ1QfdQJIJLHfR2tacdoqmccffAAWjh+CG4+lb/szEdkgE
   rewIkVtZmcw4XHJjPhwqKznDA3sfUEfAA1vgLXptuB67Y4cFf38W2hDlc
   BUFf1MXn5ekVFCSZzbAqxk0x8YDNqXLKc2vvaFeRT9dw/EGSu+lGI/Jdd
   A==;
X-CSE-ConnectionGUID: oJNMlzpJQLCMA9z1zfPgJA==
X-CSE-MsgGUID: uJWiGdSzQpyQXMB107z0Pg==
X-IronPort-AV: E=McAfee;i="6800,10657,11662"; a="72870856"
X-IronPort-AV: E=Sophos;i="6.21,204,1763452800"; 
   d="scan'208";a="72870856"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jan 2026 15:34:43 -0800
X-CSE-ConnectionGUID: 43+3hMdSSCGLQtAjsvBYmg==
X-CSE-MsgGUID: ZkfWgQolTfSJzcBHGPPdUA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,204,1763452800"; 
   d="scan'208";a="233640378"
Received: from igk-lkp-server01.igk.intel.com (HELO 92b2e8bd97aa) ([10.211.93.152])
  by fmviesa001.fm.intel.com with ESMTP; 05 Jan 2026 15:34:41 -0800
Received: from kbuild by 92b2e8bd97aa with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vcu5u-000000001CT-34fk;
	Mon, 05 Jan 2026 23:34:38 +0000
Date: Tue, 06 Jan 2026 00:34:05 +0100
From: kernel test robot <lkp@intel.com>
To: "Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev,
 "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
 LKML <linux-kernel@vger.kernel.org>
Subject: [gustavoars:testing/wfamnae-next20260105 6/18]
 kvm_binary_stats_test.c:77:17: error: no member named 'flags' in 'struct
 kvm_stats_desc'
Message-ID: <202601060036.1vHuHuQQ-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/gustavoars/linux.git testing/wfamnae-next20260105
head:   0864e0ff8ab1707473f669bf2a8dc94e97629018
commit: a5aa83f40659ad9d45ae30a0e5eee768b0d141f0 [6/18] KVM: Avoid a few dozen -Wflex-array-member-not-at-end warnings
config: arm64-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20260106/202601060036.1vHuHuQQ-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project f43d6834093b19baf79beda8c0337ab020ac5f17)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260106/202601060036.1vHuHuQQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601060036.1vHuHuQQ-lkp@intel.com/

Note: the gustavoars/testing/wfamnae-next20260105 HEAD 0864e0ff8ab1707473f669bf2a8dc94e97629018 builds fine.
      It only hurts bisectability.

All errors (new ones prefixed by >>):

   In file included from kvm_binary_stats_test.c:17:
   In file included from include/kvm_util.h:14:
   usr/include/linux/kvm.h:1572:2: error: type name requires a specifier or qualifier
    1572 |         __struct_group(kvm_stats_desc_hdr, __hdr, /* no attrs */,
         |         ^
   usr/include/linux/kvm.h:1572:58: error: expected identifier
    1572 |         __struct_group(kvm_stats_desc_hdr, __hdr, /* no attrs */,
         |                                                                 ^
   usr/include/linux/kvm.h:1573:14: error: expected ')'
    1573 |                 __u32 flags;
         |                            ^
   usr/include/linux/kvm.h:1572:16: note: to match this '('
    1572 |         __struct_group(kvm_stats_desc_hdr, __hdr, /* no attrs */,
         |                       ^
   usr/include/linux/kvm.h:1578:2: error: type name requires a specifier or qualifier
    1578 |         );
         |         ^
   usr/include/linux/kvm.h:1578:2: error: expected member name or ';' after declaration specifiers
   usr/include/linux/kvm.h:1577:21: error: expected ';' at end of declaration list
    1577 |                 __u32 bucket_size;
         |                                   ^
   usr/include/linux/kvm.h:1581:57: error: invalid application of 'sizeof' to an incomplete type 'struct kvm_stats_desc_hdr'
    1581 | _Static_assert(offsetof(struct kvm_stats_desc, name) == sizeof(struct kvm_stats_desc_hdr),
         |                                                         ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~
   usr/include/linux/kvm.h:1581:71: note: forward declaration of 'struct kvm_stats_desc_hdr'
    1581 | _Static_assert(offsetof(struct kvm_stats_desc, name) == sizeof(struct kvm_stats_desc_hdr),
         |                                                                       ^
>> kvm_binary_stats_test.c:77:17: error: no member named 'flags' in 'struct kvm_stats_desc'
      77 |                 type = pdesc->flags & KVM_STATS_TYPE_MASK;
         |                        ~~~~~  ^
   kvm_binary_stats_test.c:78:17: error: no member named 'flags' in 'struct kvm_stats_desc'
      78 |                 unit = pdesc->flags & KVM_STATS_UNIT_MASK;
         |                        ~~~~~  ^
   kvm_binary_stats_test.c:79:17: error: no member named 'flags' in 'struct kvm_stats_desc'
      79 |                 base = pdesc->flags & KVM_STATS_BASE_MASK;
         |                        ~~~~~  ^
   kvm_binary_stats_test.c:102:18: error: no member named 'flags' in 'struct kvm_stats_desc'
     102 |                 switch (pdesc->flags & KVM_STATS_UNIT_MASK) {
         |                         ~~~~~  ^
   kvm_binary_stats_test.c:126:18: error: no member named 'flags' in 'struct kvm_stats_desc'
     126 |                 switch (pdesc->flags & KVM_STATS_TYPE_MASK) {
         |                         ~~~~~  ^
   12 errors generated.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
