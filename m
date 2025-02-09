Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C153220693
	for <oe-kbuild-all@lists.linux.dev>; Sun,  9 Feb 2025 20:52:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739134362; cv=none; b=GOqYnHga1Qgqa1A6lzq/85r9nwKRelkElnKGY8oZ8AXOnnWh1D1YUMiGLxq9yqFNhIPHP71MBS0ST1vkzt6xsy/jnH0aJfsGB9nmSJqK7ipCqKGAiQIVws4zjNCLmOuPnNlOUB4y5tvWvJd3eBLG5ZApitEuPu/N4VGG0PhxCGo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739134362; c=relaxed/simple;
	bh=f97bW4zMTHKXPk/rXA7ZWl6Wh9XawALBk56xOR1X1i8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=e5OgexzrGyP5zQPTA+h6BUleJS02qttrRpqMAdjA3e7WJi2iXY/G2dKWL7/6mMV4XiUc5IKYv2qZXz/p7DChPHKCsHuxp+DATN7bjisU5rxpqdZu9WG23tADbprOeAwjKsYqrrGqtsaFOG5dtlp9uyPA/kGpkctK+0UL0UTe1Jo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mUzUl5gC; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mUzUl5gC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739134361; x=1770670361;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=f97bW4zMTHKXPk/rXA7ZWl6Wh9XawALBk56xOR1X1i8=;
  b=mUzUl5gCMpuDrHlou5IHXcR5Q8zOVCZxB0wp4Gx6Odybafsfi2hyi/wa
   agKXXqh+wR2ZkxG7qFRa5VHsOchwPQfUXh111To2u6W/jOK840nEDzCSM
   c9GZxJ5d2rR1jwgl3pqPcrq8LTIfw8kIYqHUGxBMEzd6OpIWtTYvCLwdU
   Lks4yKQ0W8qgRWyxnvEFcm3SBQgeoYVW0JrEUVFZkMyFbVKsAQzadC7b3
   qiOsdOu+moDbXn/GqUkZy8+ctMBiaZyGpl9BvaVZNjX0KFVetAVyk3ZY1
   FeZQFDDjLKWtQRTNIfYanPo6OgcW8UUYFIqmAkZqZFv9q3C4148lAQBQv
   w==;
X-CSE-ConnectionGUID: nRG1VWR9TgCdJZ1+Rkzogg==
X-CSE-MsgGUID: mTrUYLfBQ7+fwH7QX7m/kw==
X-IronPort-AV: E=McAfee;i="6700,10204,11340"; a="39733917"
X-IronPort-AV: E=Sophos;i="6.13,273,1732608000"; 
   d="scan'208";a="39733917"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Feb 2025 12:52:40 -0800
X-CSE-ConnectionGUID: bqdsqiBMTZmEzEHwGcUdgg==
X-CSE-MsgGUID: 9FC3qtNpQsu2e9I0TKp2oQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="117222220"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 09 Feb 2025 12:52:38 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1thEI8-0011tf-19;
	Sun, 09 Feb 2025 20:52:36 +0000
Date: Mon, 10 Feb 2025 04:51:52 +0800
From: kernel test robot <lkp@intel.com>
To: Cong Wang <cong.wang@bytedance.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [congwang:xdp_tso 2/2] xdp_hw_metadata.c:399:24: error:
 'XDP_TXMD_FLAGS_GSO' undeclared; did you mean 'XDP_TXMD_FLAGS_CHECKSUM'?
Message-ID: <202502100442.iF1LOQMF-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/congwang/linux.git xdp_tso
head:   af192238f025efad3209ee89f781077db0f66247
commit: af192238f025efad3209ee89f781077db0f66247 [2/2] selftests/bpf: Add tests for XDP_TXMD_FLAGS_GSO
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250210/202502100442.iF1LOQMF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502100442.iF1LOQMF-lkp@intel.com/

All errors (new ones prefixed by >>):

   xdp_hw_metadata.c: In function 'ping_pong':
>> xdp_hw_metadata.c:399:24: error: 'XDP_TXMD_FLAGS_GSO' undeclared (first use in this function); did you mean 'XDP_TXMD_FLAGS_CHECKSUM'?
     399 |         meta->flags |= XDP_TXMD_FLAGS_GSO;
         |                        ^~~~~~~~~~~~~~~~~~
         |                        XDP_TXMD_FLAGS_CHECKSUM
   xdp_hw_metadata.c:399:24: note: each undeclared identifier is reported only once for each function it appears in
>> xdp_hw_metadata.c:400:13: error: 'struct xsk_tx_metadata' has no member named 'gso'
     400 |         meta->gso.gso_size = 512;  /* Each segment will be 512 bytes */
         |             ^~
   xdp_hw_metadata.c:401:13: error: 'struct xsk_tx_metadata' has no member named 'gso'
     401 |         meta->gso.gso_segs = 2;    /* Split into 2 segments */
         |             ^~
   xdp_hw_metadata.c:402:13: error: 'struct xsk_tx_metadata' has no member named 'gso'
     402 |         meta->gso.gso_type = SKB_GSO_UDP_L4;  /* UDP segmentation */
         |             ^~
>> xdp_hw_metadata.c:402:30: error: 'SKB_GSO_UDP_L4' undeclared (first use in this function)
     402 |         meta->gso.gso_type = SKB_GSO_UDP_L4;  /* UDP segmentation */
         |                              ^~~~~~~~~~~~~~
   xdp_hw_metadata.c:405:25: error: 'struct xsk_tx_metadata' has no member named 'gso'
     405 |                xsk, meta->gso.gso_size, meta->gso.gso_segs,
         |                         ^~
   xdp_hw_metadata.c:405:45: error: 'struct xsk_tx_metadata' has no member named 'gso'
     405 |                xsk, meta->gso.gso_size, meta->gso.gso_segs,
         |                                             ^~
   xdp_hw_metadata.c:406:20: error: 'struct xsk_tx_metadata' has no member named 'gso'
     406 |                meta->gso.gso_type, len);
         |                    ^~
   xdp_hw_metadata.c:409:17: error: 'struct xsk_tx_metadata' has no member named 'gso'
     409 |         if (meta->gso.gso_size * meta->gso.gso_segs > len) {
         |                 ^~
   xdp_hw_metadata.c:409:38: error: 'struct xsk_tx_metadata' has no member named 'gso'
     409 |         if (meta->gso.gso_size * meta->gso.gso_segs > len) {
         |                                      ^~
   xdp_hw_metadata.c:411:33: error: 'struct xsk_tx_metadata' has no member named 'gso'
     411 |                        xsk, meta->gso.gso_size, meta->gso.gso_segs,
         |                                 ^~
   xdp_hw_metadata.c:411:53: error: 'struct xsk_tx_metadata' has no member named 'gso'
     411 |                        xsk, meta->gso.gso_size, meta->gso.gso_segs,
         |                                                     ^~
   xdp_hw_metadata.c:412:28: error: 'struct xsk_tx_metadata' has no member named 'gso'
     412 |                        meta->gso.gso_size * meta->gso.gso_segs, len);
         |                            ^~
   xdp_hw_metadata.c:412:49: error: 'struct xsk_tx_metadata' has no member named 'gso'
     412 |                        meta->gso.gso_size * meta->gso.gso_segs, len);
         |                                                 ^~
--
   tools/testing/selftests/bpf/prog_tests/xdp_metadata.c: In function 'generate_packet':
>> tools/testing/selftests/bpf/prog_tests/xdp_metadata.c:193:24: error: 'XDP_TXMD_FLAGS_GSO' undeclared (first use in this function); did you mean 'XDP_TXMD_FLAGS_CHECKSUM'?
     193 |         meta->flags |= XDP_TXMD_FLAGS_GSO;
         |                        ^~~~~~~~~~~~~~~~~~
         |                        XDP_TXMD_FLAGS_CHECKSUM
   tools/testing/selftests/bpf/prog_tests/xdp_metadata.c:193:24: note: each undeclared identifier is reported only once for each function it appears in
>> tools/testing/selftests/bpf/prog_tests/xdp_metadata.c:194:13: error: 'struct xsk_tx_metadata' has no member named 'gso'
     194 |         meta->gso.gso_size = 256;  /* Smaller segments since this is a test packet */
         |             ^~
   tools/testing/selftests/bpf/prog_tests/xdp_metadata.c:195:13: error: 'struct xsk_tx_metadata' has no member named 'gso'
     195 |         meta->gso.gso_segs = 2;    /* Split into 2 segments */
         |             ^~
   tools/testing/selftests/bpf/prog_tests/xdp_metadata.c:196:13: error: 'struct xsk_tx_metadata' has no member named 'gso'
     196 |         meta->gso.gso_type = SKB_GSO_UDP_L4;
         |             ^~
>> tools/testing/selftests/bpf/prog_tests/xdp_metadata.c:196:30: error: 'SKB_GSO_UDP_L4' undeclared (first use in this function)
     196 |         meta->gso.gso_type = SKB_GSO_UDP_L4;
         |                              ^~~~~~~~~~~~~~
   In file included from tools/testing/selftests/bpf/prog_tests/xdp_metadata.c:2:
   tools/testing/selftests/bpf/prog_tests/xdp_metadata.c:199:28: error: 'struct xsk_tx_metadata' has no member named 'gso'
     199 |         if (!ASSERT_LE(meta->gso.gso_size * meta->gso.gso_segs,
         |                            ^~
   ./test_progs.h:283:16: note: in definition of macro 'ASSERT_LE'
     283 |         typeof(actual) ___act = (actual);                               \
         |                ^~~~~~
   tools/testing/selftests/bpf/prog_tests/xdp_metadata.c:199:49: error: 'struct xsk_tx_metadata' has no member named 'gso'
     199 |         if (!ASSERT_LE(meta->gso.gso_size * meta->gso.gso_segs,
         |                                                 ^~
   ./test_progs.h:283:16: note: in definition of macro 'ASSERT_LE'
     283 |         typeof(actual) ___act = (actual);                               \
         |                ^~~~~~
   tools/testing/selftests/bpf/prog_tests/xdp_metadata.c:199:28: error: 'struct xsk_tx_metadata' has no member named 'gso'
     199 |         if (!ASSERT_LE(meta->gso.gso_size * meta->gso.gso_segs,
         |                            ^~
   ./test_progs.h:283:34: note: in definition of macro 'ASSERT_LE'
     283 |         typeof(actual) ___act = (actual);                               \
         |                                  ^~~~~~
   tools/testing/selftests/bpf/prog_tests/xdp_metadata.c:199:49: error: 'struct xsk_tx_metadata' has no member named 'gso'
     199 |         if (!ASSERT_LE(meta->gso.gso_size * meta->gso.gso_segs,
         |                                                 ^~
   ./test_progs.h:283:34: note: in definition of macro 'ASSERT_LE'
     283 |         typeof(actual) ___act = (actual);                               \
         |                                  ^~~~~~
--
   tools/testing/selftests/bpf/prog_tests/xdp_metadata.c: In function 'generate_packet':
>> tools/testing/selftests/bpf/prog_tests/xdp_metadata.c:193:24: error: 'XDP_TXMD_FLAGS_GSO' undeclared (first use in this function); did you mean 'XDP_TXMD_FLAGS_CHECKSUM'?
     193 |         meta->flags |= XDP_TXMD_FLAGS_GSO;
         |                        ^~~~~~~~~~~~~~~~~~
         |                        XDP_TXMD_FLAGS_CHECKSUM
   tools/testing/selftests/bpf/prog_tests/xdp_metadata.c:193:24: note: each undeclared identifier is reported only once for each function it appears in
>> tools/testing/selftests/bpf/prog_tests/xdp_metadata.c:194:13: error: 'struct xsk_tx_metadata' has no member named 'gso'
     194 |         meta->gso.gso_size = 256;  /* Smaller segments since this is a test packet */
         |             ^~
   tools/testing/selftests/bpf/prog_tests/xdp_metadata.c:195:13: error: 'struct xsk_tx_metadata' has no member named 'gso'
     195 |         meta->gso.gso_segs = 2;    /* Split into 2 segments */
         |             ^~
   tools/testing/selftests/bpf/prog_tests/xdp_metadata.c:196:13: error: 'struct xsk_tx_metadata' has no member named 'gso'
     196 |         meta->gso.gso_type = SKB_GSO_UDP_L4;
         |             ^~
>> tools/testing/selftests/bpf/prog_tests/xdp_metadata.c:196:30: error: 'SKB_GSO_UDP_L4' undeclared (first use in this function)
     196 |         meta->gso.gso_type = SKB_GSO_UDP_L4;
         |                              ^~~~~~~~~~~~~~
   In file included from tools/testing/selftests/bpf/prog_tests/xdp_metadata.c:2:
   tools/testing/selftests/bpf/prog_tests/xdp_metadata.c:199:28: error: 'struct xsk_tx_metadata' has no member named 'gso'
     199 |         if (!ASSERT_LE(meta->gso.gso_size * meta->gso.gso_segs,
         |                            ^~
   tools/testing/selftests/bpf/test_progs.h:283:16: note: in definition of macro 'ASSERT_LE'
     283 |         typeof(actual) ___act = (actual);                               \
         |                ^~~~~~
   tools/testing/selftests/bpf/prog_tests/xdp_metadata.c:199:49: error: 'struct xsk_tx_metadata' has no member named 'gso'
     199 |         if (!ASSERT_LE(meta->gso.gso_size * meta->gso.gso_segs,
         |                                                 ^~
   tools/testing/selftests/bpf/test_progs.h:283:16: note: in definition of macro 'ASSERT_LE'
     283 |         typeof(actual) ___act = (actual);                               \
         |                ^~~~~~
   tools/testing/selftests/bpf/prog_tests/xdp_metadata.c:199:28: error: 'struct xsk_tx_metadata' has no member named 'gso'
     199 |         if (!ASSERT_LE(meta->gso.gso_size * meta->gso.gso_segs,
         |                            ^~
   tools/testing/selftests/bpf/test_progs.h:283:34: note: in definition of macro 'ASSERT_LE'
     283 |         typeof(actual) ___act = (actual);                               \
         |                                  ^~~~~~
   tools/testing/selftests/bpf/prog_tests/xdp_metadata.c:199:49: error: 'struct xsk_tx_metadata' has no member named 'gso'
     199 |         if (!ASSERT_LE(meta->gso.gso_size * meta->gso.gso_segs,
         |                                                 ^~
   tools/testing/selftests/bpf/test_progs.h:283:34: note: in definition of macro 'ASSERT_LE'
     283 |         typeof(actual) ___act = (actual);                               \
         |                                  ^~~~~~

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
