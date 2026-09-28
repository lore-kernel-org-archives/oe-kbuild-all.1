Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB8123AC0F6
	for <oe-kbuild-all@lists.linux.dev>; Mon, 28 Sep 2026 18:47:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790621268; cv=none; b=rZbCabwyCPyIx8vhmeDjrRqXU4dmux9D69szhYWfWDYrRm0TL8zbk8w+SkRMb74gjBUftApBs/aORdyU3fOz/nfBR8QpwP8jmsJj7T9hqF1Ms39l9wYj8D9TNxsE16OkFPggaNqiO+Axh0rw45+9tuvYwtmJJYoClQ4RQ/CJ5QU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790621268; c=relaxed/simple;
	bh=YcZzIIm4haMJyuIGmlQIOVcjHFXDTQ5GzRRfmL29rvE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=GbM8PQ3fLDT56XMyITuna7zQkFJX7O2HEMuaT+Ub1kWJsoMEpR2HkedhXdN8eVE/tH0nAUSm5UbU5q53o+bRPs3dnmDE0KHkGxEv7fzm/E/0Ospe/l6ibFzOs+GbNLz0/qED2bCcRNplyGMlQztim3TD8+R6hKMwPj0xMW3P66g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gt1Ly2lo; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gt1Ly2lo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790621266; x=1822157266;
  h=date:from:to:cc:subject:message-id;
  bh=YcZzIIm4haMJyuIGmlQIOVcjHFXDTQ5GzRRfmL29rvE=;
  b=gt1Ly2loy0dSvKyjRam+nx09XCbxMKiUbPqhFhq7KeiJjttMt8HYzUR5
   dxfi1PnVLCLeRQZu7le4KPQjeQMYfxlMgtRCM1q22XF6E0Jp3CcUG4VAM
   e+XTCQOgwJ98xNiGB13UbR1AiYWlQjOssfU+egXcCEL4LqhyRvJh1PF2M
   frK33iMz+msMwu/cgSkiLE78eEXBeUwNEHp9Z/G3RfFtMA4q/6rEL97Sh
   RtrY9QARr5HL7eyrghqvYWxXLime0OezG807RJHS1oi1TA8f7gziwRzkH
   b5EDE8hyqr5HlLs32eNX8HoI73ZbKHD1lBbdsTht4Cs/imM44a90KX68v
   w==;
X-CSE-ConnectionGUID: MhzasQQVRqWL+PCGze86oA==
X-CSE-MsgGUID: oaZYTylrSUCeRy5xxoJq3w==
X-IronPort-AV: E=McAfee;i="6800,10657,11919"; a="93820603"
X-IronPort-AV: E=Sophos;i="6.27,129,1787036400"; 
   d="scan'208";a="93820603"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Sep 2026 11:47:45 -0700
X-CSE-ConnectionGUID: qkCs0+LkS8Ky3eCE+DnF7A==
X-CSE-MsgGUID: 63sXvI7SSMCEKsRK06ahpQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,129,1787036400"; 
   d="scan'208";a="313044043"
Received: from igk-lkp-server01.igk.intel.com (HELO 04362d00df5a) ([10.211.93.152])
  by orviesa001.jf.intel.com with ESMTP; 28 Sep 2026 11:47:43 -0700
Received: from kbuild by 04362d00df5a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xBGO5-0000000016F-2F6F;
	Mon, 28 Sep 2026 18:47:41 +0000
Date: Mon, 28 Sep 2026 20:46:59 +0200
From: kernel test robot <lkp@intel.com>
To: Kumar Kartikeya Dwivedi <memxor@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [kkdwivedi:typed-arena 5/17] xtensa-linux-ld:
 kernel/bpf/verifier.c:20819:undefined reference to `bpf_typed_arena_put'
Message-ID: <202609282016.4ovb8xFG-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/kkdwivedi/linux typed-arena
head:   f6fd10fe616e1927b9c398a528edc49c6593c06a
commit: 8888450621df54338133ec7cb64dfa0c4483d06a [5/17] bpf: Add the typed_arena_cast instruction
config: xtensa-randconfig-r2106-20260928 (https://download.01.org/0day-ci/archive/20260928/202609282016.4ovb8xFG-lkp@intel.com/config)
compiler: xtensa-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260928/202609282016.4ovb8xFG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609282016.4ovb8xFG-lkp@intel.com/

All errors (new ones prefixed by >>):

   xtensa-linux-ld: kernel/bpf/verifier.o: in function `release_insn_arrays':
   kernel/bpf/verifier.c:20819:(.text+0x5698): undefined reference to `bpf_prog_arena'
>> xtensa-linux-ld: kernel/bpf/verifier.c:20819:(.text+0x569c): undefined reference to `bpf_typed_arena_put'
   xtensa-linux-ld: kernel/bpf/verifier.o: in function `release_typed_arenas':
   kernel/bpf/verifier.c:20778:(.text+0x56c3): undefined reference to `bpf_prog_arena'
   xtensa-linux-ld: kernel/bpf/verifier.c:20778:(.text+0x56d3): undefined reference to `bpf_typed_arena_put'
   xtensa-linux-ld: kernel/bpf/verifier.o: in function `_kzalloc_noprof.constprop.0':
>> include/linux/slab.h:995:(.text+0x76b4): undefined reference to `bpf_prog_arena'
>> xtensa-linux-ld: include/linux/slab.h:995:(.text+0x76b8): undefined reference to `bpf_typed_arena_get'
   xtensa-linux-ld: kernel/bpf/verifier.o: in function `typed_arena_register':
   kernel/bpf/verifier.c:17051:(.text+0x789f): undefined reference to `bpf_prog_arena'
>> xtensa-linux-ld: kernel/bpf/verifier.c:17051:(.text+0x78b3): undefined reference to `bpf_typed_arena_get'
   xtensa-linux-ld: kernel/bpf/fixups.o: in function `bpf_opt_subreg_zext_lo32_rnd_hi32':
>> kernel/bpf/fixups.c:872:(.text+0x1be0): undefined reference to `bpf_typed_arena_cast_insns'
   xtensa-linux-ld: kernel/bpf/fixups.o: in function `bpf_lower_typed_arena_insns':
   kernel/bpf/fixups.c:900:(.text+0x1c86): undefined reference to `bpf_typed_arena_cast_insns'

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
