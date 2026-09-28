Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E1864B0497
	for <oe-kbuild-all@lists.linux.dev>; Mon, 28 Sep 2026 12:07:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790597256; cv=none; b=nesE7FohHAk2/d8RdZENABf40u/P5ieYPD+mIxySAUYnf4pv6jXBFXKpKWwz/eHPdRP5wfjQ5psecaMMeaV8Dp/swe251WZ1XDJ8kAOeYB6PoYL+QG2V29KmZdwhmZ3dShlW+5jUPnUECTN5RjruRLiLuC/UAh2eLPGdCnV+MuA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790597256; c=relaxed/simple;
	bh=ni2k3nL4Yq7l137R6Pws+5i3Dj79qswP/c7K66ubsA8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=dVfxtqSuZU5o5wwAE7zk1fOEz/LTvVJHv5Oue+ZDV9y7H7rEi235AALUha7uxotmIaKkd4KrHunAaGUAri96yY7uBnSLQxqQ4j68J4n0UNsPRm9eW6oYHHAcykn04SrkLBadNvCa+pmP5MfJ497wCfSULS6EhwbIwx1kErDddE4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZPnm9+x9; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZPnm9+x9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790597254; x=1822133254;
  h=date:from:to:cc:subject:message-id;
  bh=ni2k3nL4Yq7l137R6Pws+5i3Dj79qswP/c7K66ubsA8=;
  b=ZPnm9+x9fKYnS8uHPfehB6EixTnOLqDogDhboLj4mivWYlSbl+Nj46fr
   o0i8/VUr5aXdHkmkqvkWUcdIJHzpUyssL+QMxhnPBLrYp9eiWXFn07uLr
   e/iSg14NZ5TaIbjoPyjfF705aL7qZhbhlaQCNdP2kXYisGc1SYQ8fE/v/
   CA0IRipWriv8QWjjV3KdOED3lUB7E+8HjUd++QJJDV5Em1Yz8Ee/IPxk0
   pPkdD+5bZM6HX4wUUXEb3MkJ7Y98WwFt2jV2E0oHu/INKXXSedumr0hbB
   dLG3zb/9b5Qu69zOToOPXQJxgyLKFhV9qp++Fb3ojRnvroCAH9HUFC8QX
   A==;
X-CSE-ConnectionGUID: /Rhd7rY2TriAlS2V9gMwRw==
X-CSE-MsgGUID: MJmJEI7VRZuZFgVZAgUukw==
X-IronPort-AV: E=McAfee;i="6800,10657,11918"; a="108783420"
X-IronPort-AV: E=Sophos;i="6.27,128,1787036400"; 
   d="scan'208";a="108783420"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Sep 2026 05:07:18 -0700
X-CSE-ConnectionGUID: O0hJlwNzQQa/s4P4NjOu6w==
X-CSE-MsgGUID: 0mvQy9W1RiycZW4iuD/3ag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,128,1787036400"; 
   d="scan'208";a="274259730"
Received: from igk-lkp-server01.igk.intel.com (HELO 04362d00df5a) ([10.211.93.152])
  by fmviesa010.fm.intel.com with ESMTP; 28 Sep 2026 05:07:17 -0700
Received: from kbuild by 04362d00df5a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xBA8W-000000000zT-08Sw;
	Mon, 28 Sep 2026 12:07:12 +0000
Date: Mon, 28 Sep 2026 14:06:59 +0200
From: kernel test robot <lkp@intel.com>
To: Kumar Kartikeya Dwivedi <memxor@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [kkdwivedi:typed-arena 5/17] sparc-linux-ld:
 verifier.c:undefined reference to `bpf_typed_arena_put'
Message-ID: <202609281305.Mu2sZkiw-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/kkdwivedi/linux typed-arena
head:   f6fd10fe616e1927b9c398a528edc49c6593c06a
commit: 8888450621df54338133ec7cb64dfa0c4483d06a [5/17] bpf: Add the typed_arena_cast instruction
config: sparc-randconfig-2001-20260928 (https://download.01.org/0day-ci/archive/20260928/202609281305.Mu2sZkiw-lkp@intel.com/config)
compiler: sparc-linux-gcc (GCC) 13.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260928/202609281305.Mu2sZkiw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609281305.Mu2sZkiw-lkp@intel.com/

All errors (new ones prefixed by >>):

   sparc-linux-ld: kernel/bpf/verifier.o: in function `release_maps':
   verifier.c:(.text+0x6c40): undefined reference to `bpf_prog_arena'
>> sparc-linux-ld: verifier.c:(.text+0x6c54): undefined reference to `bpf_typed_arena_put'
   sparc-linux-ld: kernel/bpf/verifier.o: in function `typed_arena_register':
   verifier.c:(.text+0x91c8): undefined reference to `bpf_prog_arena'
>> sparc-linux-ld: verifier.c:(.text+0x91e0): undefined reference to `bpf_typed_arena_get'
   sparc-linux-ld: kernel/bpf/fixups.o: in function `bpf_lower_typed_arena_insns':
   fixups.c:(.text+0x2198): undefined reference to `bpf_typed_arena_cast_insns'

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
