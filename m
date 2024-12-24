Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 912D34C80
	for <oe-kbuild-all@lists.linux.dev>; Tue, 24 Dec 2024 17:02:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735059750; cv=none; b=SssIAofOD+CGRzHwgg+kI5ZYa+lqntEAQ44Gjsfs5y9TXn8xwyQUxIJ+IDd0V2fFi0JwP1PHTy2elrdxpzHt7vL/t57SPdw+Q2eNREbzMbQ+uCN5haqpMLKoBSo+yu5OOB1I0iJZMsCxWN/EZy6F2J5chNxXuunTVTUhYiwdQ/8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735059750; c=relaxed/simple;
	bh=OmFcbx8bCKOvQRIBz3FxiCJdiS1kUl2WFTKgCKnjQhA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=uZ+sQoNnob4Zo3X7OGgJbsbgf5V4x9stYtaXsMioBN1wyqvIZ0DYMReymgqfiAgIlMCrvawC4VO9IaVl2bFqvr3XPJtXJEuE7RyDd2gGj9tTtfL7MIM4DDVqYOhwMgDR04MWhKqpoJYGNj56PU7MtEKsv81WWni54xTiHj5fL6w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aGvWOOhu; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aGvWOOhu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735059748; x=1766595748;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=OmFcbx8bCKOvQRIBz3FxiCJdiS1kUl2WFTKgCKnjQhA=;
  b=aGvWOOhuS246XO+hyKDn/c1xYL+fkvRReQVL3V1qLtq4UbPqSv5ogSUJ
   sqI6VmrZQR/ED2Bak8En1cBJZehubldtT+yzpm3PIYlVca+L6l7I1EKfC
   R9/9iWslTVmuSbma5MvRsM4wqmxODqHF9wnk4EFmkPvKoTGBpnV4DBc7B
   /01frwIaGUus5bpC9ZAxTntQTYJW4/qAp6+6xmyKkaQCMciaqdKA/VmvV
   nqwS0grUg+Mywilrbi070ypXyUUHodbqaFF8hIu/arhhocHGDXyyijbx3
   zJRJJzvzrqJF/Z2jPNzfZ677qFDMjaU4FJtNdPgDfyHjC91+qxrBGGC3s
   w==;
X-CSE-ConnectionGUID: XL+l85qSRy6cnnbRZ806Cw==
X-CSE-MsgGUID: NX+Aq85cT56ckNhDBf6mLA==
X-IronPort-AV: E=McAfee;i="6700,10204,11296"; a="46536258"
X-IronPort-AV: E=Sophos;i="6.12,260,1728975600"; 
   d="scan'208";a="46536258"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Dec 2024 09:02:19 -0800
X-CSE-ConnectionGUID: Snxc161TRJS6TcyD3B3FOw==
X-CSE-MsgGUID: KiEj/2PpTbmNWKscqfx0Sg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,260,1728975600"; 
   d="scan'208";a="104379614"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 24 Dec 2024 09:02:18 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tQ8IS-0001JG-0O;
	Tue, 24 Dec 2024 17:02:16 +0000
Date: Wed, 25 Dec 2024 01:01:57 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Yang Yingliang <yangyingliang@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1345/1345] binfmt_elf32.c:undefined
 reference to `elf_core_extra_phdrs'
Message-ID: <202412250053.0bM6RR8q-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   33267d4a7f512d371a3ea853568832174be4caba
commit: 63a07568188f27d31954cf24f43540c9c2fa92cd [1345/1345] arm64: introduce binfmt_elf32.c
config: arm64-randconfig-001-20241224 (https://download.01.org/0day-ci/archive/20241225/202412250053.0bM6RR8q-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241225/202412250053.0bM6RR8q-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412250053.0bM6RR8q-lkp@intel.com/

All errors (new ones prefixed by >>):

   aarch64-linux-ld: warning: .tmp_vmlinux1 has a LOAD segment with RWX permissions
   aarch64-linux-ld: arch/arm64/kernel/binfmt_elf32.o: in function `elf_core_dump':
>> binfmt_elf32.c:(.text+0x2460): undefined reference to `elf_core_extra_phdrs'
>> binfmt_elf32.c:(.text+0x2460): relocation truncated to fit: R_AARCH64_CALL26 against undefined symbol `elf_core_extra_phdrs'
>> aarch64-linux-ld: binfmt_elf32.c:(.text+0x2650): undefined reference to `elf_core_extra_data_size'
>> binfmt_elf32.c:(.text+0x2650): relocation truncated to fit: R_AARCH64_CALL26 against undefined symbol `elf_core_extra_data_size'
>> aarch64-linux-ld: binfmt_elf32.c:(.text+0x27bc): undefined reference to `elf_core_write_extra_phdrs'
>> binfmt_elf32.c:(.text+0x27bc): relocation truncated to fit: R_AARCH64_CALL26 against undefined symbol `elf_core_write_extra_phdrs'
>> aarch64-linux-ld: binfmt_elf32.c:(.text+0x2a88): undefined reference to `elf_core_write_extra_data'
>> binfmt_elf32.c:(.text+0x2a88): relocation truncated to fit: R_AARCH64_CALL26 against undefined symbol `elf_core_write_extra_data'
   aarch64-linux-ld: kernel/sched/cputime.o: in function `sched_idle_time_adjust':
   cputime.c:(.text+0xa28): undefined reference to `get_idle_time'
   cputime.c:(.text+0xa28): relocation truncated to fit: R_AARCH64_CALL26 against undefined symbol `get_idle_time'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
