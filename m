Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD15B4DD3D1
	for <oe-kbuild-all@lists.linux.dev>; Mon, 28 Sep 2026 17:50:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790617847; cv=none; b=CxhDJkreuivRa9ErJjgvJNxHYyjrO1vliftKY5f67z13DMYCM3llI5tnAc1RlKlVOKx7OENlCF7n2CJPJ8aj/ZvIEaJq0jpOUeofebti2qO+4PUewaxNvp0PZsuKrD1q9oVhSCY8Hfz0O7oOK9cZP4IaPZSxIrLHcMs3RCQXIzM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790617847; c=relaxed/simple;
	bh=LWyj66Av9+ummXqOCciOt56A4kpspSDW0Y4RkeWBCAQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=FCfKX5Pk+vvKowmF4y11erPaOel46aZu/2+YBejeeEJZEK/kHTQFyuiHIqbxQtcbQk/fniLXELAtfDaQMqqP8pIhdLMMfT5vv2Tsjjj4hJCYAHMtoEeIveMmxB5XQjJW/JLZIsXm33mJhDotsqOGumBYDAnMHSxX3JLrxsaLBuo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=fail smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZsYri6OD; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZsYri6OD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790617840; x=1822153840;
  h=date:from:to:cc:subject:message-id;
  bh=LWyj66Av9+ummXqOCciOt56A4kpspSDW0Y4RkeWBCAQ=;
  b=ZsYri6OD2jTOyVlKUSrl8aEq/CpEP8k49XuCHCXoRkQUiLRZtHHa3au5
   wFxLu1kwRXJLUK4N9/AJpdoUMfOoQFplDrC3YfMimy4JOe8g6xEYcRGHr
   HFS0mGP/msy8c6MVd9Naq9eXtyTzzwhDbhAIom5wYA2Ah/vi0cSD9kdGU
   n1UtcBpW/CvGsrTAgsz1UkDIm5IubYnU8AjbankdExqzdUemjTE/3Z6cn
   /bQnmQ4zjxMgEe0HHeDGk9Wqq8cwTs9m22I93FMy8ogirsloZCCvZ1ECS
   mpbpNlvskt0sMEF8j1k4CNb61zBTShdENVv4clk2f47HL5yDoGX8+lelx
   A==;
X-CSE-ConnectionGUID: RJuHY5GxQOSFydNzViKSXg==
X-CSE-MsgGUID: jJSANjzZReaORjMRdFmE2w==
X-IronPort-AV: E=McAfee;i="6800,10657,11919"; a="94040084"
X-IronPort-AV: E=Sophos;i="6.27,128,1787036400"; 
   d="scan'208";a="94040084"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Sep 2026 10:50:39 -0700
X-CSE-ConnectionGUID: z38NhM6XQ1O77mEaX6ecMw==
X-CSE-MsgGUID: gJ2kG/seTV6aLZ1uiO37Zg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,128,1787036400"; 
   d="scan'208";a="274660648"
Received: from lkp-server01.sh.intel.com (HELO 462990a40a85) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 28 Sep 2026 10:50:38 -0700
Received: from kbuild by 462990a40a85 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xBFUn-00000000OJD-2wxu;
	Mon, 28 Sep 2026 17:50:33 +0000
Date: Tue, 29 Sep 2026 01:49:55 +0800
From: kernel test robot <lkp@intel.com>
To: Kumar Kartikeya Dwivedi <memxor@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [kkdwivedi:typed-arena 5/17] csky-linux-ld:
 kernel/bpf/verifier.c:20778:undefined reference to `bpf_typed_arena_put'
Message-ID: <202609290141.IpYfnt4D-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/kkdwivedi/linux typed-arena
head:   f6fd10fe616e1927b9c398a528edc49c6593c06a
commit: 8888450621df54338133ec7cb64dfa0c4483d06a [5/17] bpf: Add the typed_arena_cast instruction
config: csky-randconfig-1000-20260928 (https://download.01.org/0day-ci/archive/20260929/202609290141.IpYfnt4D-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260929/202609290141.IpYfnt4D-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609290141.IpYfnt4D-lkp@intel.com/

All errors (new ones prefixed by >>):

   csky-linux-ld: kernel/bpf/verifier.o: in function `release_typed_arenas':
   kernel/bpf/verifier.c:20778:(.text+0x4cbc): undefined reference to `bpf_prog_arena'
>> csky-linux-ld: kernel/bpf/verifier.c:20778:(.text+0x4cc8): undefined reference to `bpf_typed_arena_put'
   csky-linux-ld: kernel/bpf/verifier.o: in function `make_bpfptr':
>> include/linux/bpfptr.h:32:(.text+0x4cf4): undefined reference to `bpf_prog_arena'
>> csky-linux-ld: include/linux/bpfptr.h:32:(.text+0x4cf8): undefined reference to `bpf_typed_arena_put'
   csky-linux-ld: kernel/bpf/verifier.o: in function `typed_arena_register':
   kernel/bpf/verifier.c:17051:(.text+0x6cdc): undefined reference to `bpf_prog_arena'
>> csky-linux-ld: kernel/bpf/verifier.c:17051:(.text+0x6cf0): undefined reference to `bpf_typed_arena_get'
>> csky-linux-ld: kernel/bpf/verifier.c:17071:(.text+0x6d78): undefined reference to `bpf_prog_arena'
   csky-linux-ld: kernel/bpf/verifier.c:17071:(.text+0x6d7c): undefined reference to `bpf_typed_arena_get'
   csky-linux-ld: kernel/bpf/fixups.o: in function `bpf_lower_typed_arena_insns':
>> kernel/bpf/fixups.c:900:(.text+0x1af0): undefined reference to `bpf_typed_arena_cast_insns'
>> csky-linux-ld: kernel/bpf/fixups.c:910:(.text+0x1b4c): undefined reference to `bpf_typed_arena_cast_insns'

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
