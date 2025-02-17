Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41AB3D2FB
	for <oe-kbuild-all@lists.linux.dev>; Mon, 17 Feb 2025 01:19:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739755162; cv=none; b=XzyqvW3VU1dLWG8JLKT0CPNggQelsXFnEUTpmWOLJ2fiUAv/G8uxYd83/+p2mYn8/ZE9EqlG4i0xnrudnSQc3PEiWTq5odOKV8nS/uqBAfTrqWucMgPPuouNF/osj4DogwY5RWWj1OKalvoK4TZgxZdT7LpwTn6LDO5fojvJHG8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739755162; c=relaxed/simple;
	bh=z540d7bXIcZ0ian10GSqoE/tVXpcv4fsRFrd2bVt4yQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=CRy+O2xUW+ATTY7JQKykuppPecrOqNBTBezyKG6zm2+ZMT53KkEIvDWHc3TWy3pttSlmOjX5I6lro7/PF72EsFv/x35/wdUkazfp/U0O+QMaqqU5orXexeJ0nQtO2fmmqQwYHv3xpvL2sNXR02QnJLBFVyS8lER+chY+JgNl/nc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QR0MI4T2; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QR0MI4T2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739755160; x=1771291160;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=z540d7bXIcZ0ian10GSqoE/tVXpcv4fsRFrd2bVt4yQ=;
  b=QR0MI4T2vlqjC9Y98aVgx9bYARRV06wIWoRpsqEaJDnc4/GbvrcBM3Kh
   pbAGooQxxodT6N2RRvoYbbOXJerW42pwwInStHvhiwbH44tp/tLdnZDKt
   2R1i5Ui4gXf4qr+Zjxm7l78n9OHh1E7jp2MH/K0W/sxPKak9rjqh/fgYJ
   QYvge2wMjvatKas79t9jaNc1VUUet4v+PbEhTBRRQ3puxmBlzDI1XdFli
   LiGLRsJ2N5tNU1yL+ykzqhV8Z2Mxhc0VfiB8OOjvU6p22z7cQzC0afQjw
   N6oIHVwL4lfHDVfoUpct0UlOi0wpix+/h6ujUERfMOnBdjCxKY9G7KNnE
   g==;
X-CSE-ConnectionGUID: dvbhU3PFRR2eBHZ2Jbgbww==
X-CSE-MsgGUID: dEHC+x7LQK+0Zqyk9hWooQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11347"; a="40459860"
X-IronPort-AV: E=Sophos;i="6.13,291,1732608000"; 
   d="scan'208";a="40459860"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Feb 2025 17:19:19 -0800
X-CSE-ConnectionGUID: 4t+iE7D6S6K1GwBtDmy8mQ==
X-CSE-MsgGUID: VB/sNCIfQCO406YW9uF0pQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,291,1732608000"; 
   d="scan'208";a="118996756"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 16 Feb 2025 17:19:19 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tjpn2-001CRL-0G;
	Mon, 17 Feb 2025 01:19:16 +0000
Date: Mon, 17 Feb 2025 09:18:59 +0800
From: kernel test robot <lkp@intel.com>
To: Piotr =?iso-8859-1?Q?Pi=F3rkowski?= <piotr.piorkowski@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, Junxiao Chang <junxiao.chang@intel.com>
Subject: [intel-lts:pr/56 0/1]
 drivers/gpu/drm/i915/gt/iov/intel_iov_ggtt.c:55:18: warning: implicit
 conversion from 'typeof ((1023 << 0))' (aka 'int') to 'u8' (aka 'unsigned
 char') changes value from 1023 to 255
Message-ID: <202502170907.7EcLc4BU-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Piotr,

FYI, the error/warning still remains.

tree:   https://github.com/intel/linux-intel-lts.git pr/56
head:   bb98b2d2ae2bd66f1a46663bdeed5d1d70afd128
commit: bcf6f14318c852a7319cf3ebeb0978432e314c0e [0/1] drm/i915/gt/iov: Add MTL WA for update VF GGTT via VF2PF relay
config: x86_64-buildonly-randconfig-006-20250217 (https://download.01.org/0day-ci/archive/20250217/202502170907.7EcLc4BU-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250217/202502170907.7EcLc4BU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502170907.7EcLc4BU-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/gpu/drm/i915/gt/iov/intel_iov_ggtt.c:7:
   In file included from drivers/gpu/drm/i915/gt/iov/intel_iov_ggtt.h:11:
   In file included from drivers/gpu/drm/i915/gt/intel_gtt.h:21:
   In file included from include/linux/mm.h:1756:
   include/linux/vmstat.h:516:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     516 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
>> drivers/gpu/drm/i915/gt/iov/intel_iov_ggtt.c:55:18: warning: implicit conversion from 'typeof ((1023 << 0))' (aka 'int') to 'u8' (aka 'unsigned char') changes value from 1023 to 255 [-Wconstant-conversion]
      55 |         u8 max_copies = FIELD_MAX(VF2PF_MMIO_UPDATE_GGTT_REQUEST_MSG_1_NUM_COPIES);
         |            ~~~~~~~~~~   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/bitfield.h:86:2: note: expanded from macro 'FIELD_MAX'
      86 |         ({                                                              \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      87 |                 __BF_FIELD_CHECK(_mask, 0ULL, 0ULL, "FIELD_MAX: ");     \
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      88 |                 (typeof(_mask))((_mask) >> __bf_shf(_mask));            \
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      89 |         })
         |         ~~
>> drivers/gpu/drm/i915/gt/iov/intel_iov_ggtt.c:146:9: warning: variable 'err' is uninitialized when used here [-Wuninitialized]
     146 |         return err;
         |                ^~~
   drivers/gpu/drm/i915/gt/iov/intel_iov_ggtt.c:136:9: note: initialize the variable 'err' to silence this warning
     136 |         int err;
         |                ^
         |                 = 0
   3 warnings generated.


vim +55 drivers/gpu/drm/i915/gt/iov/intel_iov_ggtt.c

    51	
    52	int intel_iov_ggtt_vf_update_pte(struct intel_iov *iov, u32 offset, gen8_pte_t pte)
    53	{
    54		struct intel_iov_vf_ggtt_ptes *buffer = &iov->vf.ptes_buffer;
  > 55		u8 max_copies = FIELD_MAX(VF2PF_MMIO_UPDATE_GGTT_REQUEST_MSG_1_NUM_COPIES);
    56		u8 max_ptes = MMIO_UPDATE_GGTT_MAX_PTES;
    57		u32 pte_offset = (offset >> PAGE_SHIFT) - (iov->vf.config.ggtt_base >> PAGE_SHIFT);
    58	
    59		BUILD_BUG_ON(MMIO_UPDATE_GGTT_MODE_DUPLICATE != VF2PF_UPDATE_GGTT32_MODE_DUPLICATE);
    60		BUILD_BUG_ON(MMIO_UPDATE_GGTT_MODE_REPLICATE != VF2PF_UPDATE_GGTT32_MODE_REPLICATE);
    61		BUILD_BUG_ON(MMIO_UPDATE_GGTT_MODE_DUPLICATE_LAST !=
    62			     VF2PF_UPDATE_GGTT32_MODE_DUPLICATE_LAST);
    63		BUILD_BUG_ON(MMIO_UPDATE_GGTT_MODE_REPLICATE_LAST !=
    64			     VF2PF_UPDATE_GGTT32_MODE_REPLICATE_LAST);
    65	
    66		GEM_BUG_ON(!intel_iov_is_vf(iov));
    67	
    68		if (intel_guc_ct_enabled(&iov_to_guc(iov)->ct))
    69			max_ptes = VF2PF_UPDATE_GGTT_MAX_PTES;
    70	
    71		if (!buffer->count) {
    72			buffer->offset = pte_offset;
    73			buffer->ptes[buffer->count++] = pte;
    74			buffer->count = 1;
    75			buffer->num_copies = 0;
    76			/**
    77			 * If num_copies is equal to 0, then the value
    78			 * of the MODE field is no matter.
    79			 * Let's set MODE as invalid so that we can check later
    80			 * if this field is set as expected.
    81			 */
    82			buffer->mode = VF_RELAY_UPDATE_GGTT_MODE_INVALID;
    83		} else if (!is_next_ggtt_offset(iov, pte_offset) || buffer->num_copies == max_copies) {
    84			goto flush;
    85		} else if (!buffer->num_copies) {
    86			if (is_pte_duplicatable(iov, pte)) {
    87				buffer->mode = (buffer->count == 1) ? MMIO_UPDATE_GGTT_MODE_DUPLICATE :
    88								      MMIO_UPDATE_GGTT_MODE_DUPLICATE_LAST;
    89				buffer->num_copies++;
    90			} else if (is_pte_replicable(iov, pte)) {
    91				buffer->mode = (buffer->count == 1) ? MMIO_UPDATE_GGTT_MODE_REPLICATE :
    92								      MMIO_UPDATE_GGTT_MODE_REPLICATE_LAST;
    93				buffer->num_copies++;
    94			} else {
    95				if (buffer->count == max_ptes)
    96					goto flush;
    97	
    98				buffer->ptes[buffer->count++] = pte;
    99			}
   100		} else if (buffer->count == 1 &&
   101			   buffer->mode == MMIO_UPDATE_GGTT_MODE_DUPLICATE &&
   102			   is_pte_duplicatable(iov, pte)) {
   103			buffer->num_copies++;
   104		} else if (buffer->count == 1 &&
   105			   buffer->mode == MMIO_UPDATE_GGTT_MODE_REPLICATE &&
   106			   is_pte_replicable(iov, pte)) {
   107			buffer->num_copies++;
   108		} else if (buffer->mode == MMIO_UPDATE_GGTT_MODE_DUPLICATE_LAST &&
   109			   is_pte_duplicatable(iov, pte)) {
   110			buffer->num_copies++;
   111		} else if (buffer->mode == MMIO_UPDATE_GGTT_MODE_REPLICATE_LAST &&
   112			 is_pte_replicable(iov, pte)) {
   113			buffer->num_copies++;
   114		/*
   115		 * If we operate in a mode that is not *_LAST
   116		 * (according to the ABI below the value of 2), then we
   117		 * have a chance to add some more PTEs to our request before
   118		 * send.
   119		 */
   120		} else if (buffer->mode < 2 && buffer->count != max_ptes) {
   121			buffer->ptes[buffer->count++] = pte;
   122		} else {
   123			goto flush;
   124		}
   125	
   126		return 0;
   127	flush:
   128		intel_iov_ggtt_vf_flush_ptes(iov);
   129		intel_iov_ggtt_vf_update_pte(iov, offset, pte);
   130		return 0;
   131	}
   132	
   133	int intel_iov_ggtt_vf_flush_ptes(struct intel_iov *iov)
   134	{
   135		struct intel_iov_vf_ggtt_ptes *buffer = &iov->vf.ptes_buffer;
   136		int err;
   137	
   138		GEM_BUG_ON(!intel_iov_is_vf(iov));
   139	
   140		if (!buffer->count)
   141			return 0;
   142	
   143		intel_iov_query_update_ggtt_ptes(iov);
   144		buffer->count = 0;
   145	
 > 146		return err;

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
