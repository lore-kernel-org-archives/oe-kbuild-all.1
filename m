Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CDCF369D7C
	for <oe-kbuild-all@lists.linux.dev>; Tue, 19 May 2026 22:33:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779230008; cv=none; b=osF7y+aLtYXJseYnBM4P43lzvFbrS2btI0mSlJDS4gFS1kdu7ji4EiATe9V8kj/vOYpchNwfVi1922RbcykVaJNZguP8DDVJ/VCf6Fc9jBeiY8/XAaskLloiTeD/LEXKVZDWmFnPZ3eCiDXR4WL44qrAdFE3j7vwYOEA0WAXdUA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779230008; c=relaxed/simple;
	bh=0pGBn64zN0HRKKEZz7Ae2IJLbWzclKZKQ5ALejbA+cA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Qaexv6fFFacuMDP5V7P4jl8W4UnuIjZHFEKBYUAtehaHsAS/QDV7Hj2/yb5QRvJApKWz0GAmEhsGru6qvTDeMWPqhclu+FfbC0sHxvL8WDJTUjlcAB2tLBIdAycKPny/MaeuSaM5rG1Llz/AGptnfht0b6eRlosg7xsPuUhLQk8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LIfWoBxF; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LIfWoBxF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779230006; x=1810766006;
  h=date:from:to:cc:subject:message-id;
  bh=0pGBn64zN0HRKKEZz7Ae2IJLbWzclKZKQ5ALejbA+cA=;
  b=LIfWoBxF29c/9olQieuYSzjdQcyghCbozNEW9aO15qaeCGw7OXXeJznT
   NlyMOaJ7XdawwIAWA1LjaLzNqlsoV/9yVeM49ySHIkPd3uOxkj06p5oLA
   TH/Eo4lE7ZpQfC3QgNzugJ1FQsCfwhwyjfNIv92pYtCRfNyymNCoJf0ct
   WfO9ZNHzZ12rmXghjbWco+J35n4td2D0QWFWGzlv4ou3O7Y+zfdfqjKtI
   tMmT14lJ2kX7kWClcFZYZpGBlWGAo14CiEbKyMIX5o35399kojAZqcuew
   hG0ansd6NhFI4bfnq1UpNz6Gv67WuYhUJ6WYyRY/aDdzMLu9tBF8XrNDw
   w==;
X-CSE-ConnectionGUID: Dszp0BJvSmCn2x3TTlPu9g==
X-CSE-MsgGUID: oFXktKmxRUCPCh3801Vclw==
X-IronPort-AV: E=McAfee;i="6800,10657,11791"; a="80175067"
X-IronPort-AV: E=Sophos;i="6.23,243,1770624000"; 
   d="scan'208";a="80175067"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 May 2026 15:33:26 -0700
X-CSE-ConnectionGUID: xBhX36/7SaSvl7zS7YsJSA==
X-CSE-MsgGUID: KuqsaPpcQGW5KRlzY81TXg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,243,1770624000"; 
   d="scan'208";a="244888476"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by orviesa005.jf.intel.com with ESMTP; 19 May 2026 15:33:24 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wPT05-00000000AKh-3pNx;
	Tue, 19 May 2026 22:33:21 +0000
Date: Wed, 20 May 2026 00:33:09 +0200
From: kernel test robot <lkp@intel.com>
To: Ard Biesheuvel <ardb@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev,
 "Mike Rapoport (Microsoft)" <rppt@kernel.org>,
 Kevin Brodsky <kevin.brodsky@arm.com>, Jann Horn <jannh@google.com>,
 Feng Tang <feng.tang@linux.alibaba.com>
Subject: [ardb:arm64-remap-linear-data-alias-v5 2/13]
 arch/powerpc/lib/code-patching.c:120:30: warning: passing argument 1 of
 'map_patch_area' discards 'const' qualifier from pointer target type
Message-ID: <202605200014.FgCcCxxG-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/ardb/linux.git arm64-remap-linear-data-alias-v5
head:   d3ef1c7a7d081f762b2bb61c614d06af61ace42b
commit: f8ca7ccc34aa79d6d288b0b2c2f7da546487afa4 [2/13] mm: Make empty_zero_page[] const
config: powerpc64-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20260520/202605200014.FgCcCxxG-lkp@intel.com/config)
compiler: powerpc64-linux-gnu-gcc (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260520/202605200014.FgCcCxxG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605200014.FgCcCxxG-lkp@intel.com/

All warnings (new ones prefixed by >>):

   arch/powerpc/lib/code-patching.c: In function 'text_area_cpu_up':
>> arch/powerpc/lib/code-patching.c:120:30: warning: passing argument 1 of 'map_patch_area' discards 'const' qualifier from pointer target type [-Wdiscarded-qualifiers]
     120 |         err = map_patch_area(empty_zero_page, addr);
         |                              ^~~~~~~~~~~~~~~
   arch/powerpc/lib/code-patching.c:63:33: note: expected 'void *' but argument is of type 'const uint8_t *' {aka 'const unsigned char *'}
      63 | static int map_patch_area(void *addr, unsigned long text_poke_addr);
         |                           ~~~~~~^~~~


vim +120 arch/powerpc/lib/code-patching.c

c28c15b6d28a77 Christopher M. Riedl 2022-11-09  104  
37bc3e5fd764fb Balbir Singh         2017-06-29  105  static int text_area_cpu_up(unsigned int cpu)
37bc3e5fd764fb Balbir Singh         2017-06-29  106  {
37bc3e5fd764fb Balbir Singh         2017-06-29  107  	struct vm_struct *area;
591b4b268435f0 Michael Ellerman     2022-02-23  108  	unsigned long addr;
591b4b268435f0 Michael Ellerman     2022-02-23  109  	int err;
37bc3e5fd764fb Balbir Singh         2017-06-29  110  
d262a192d38e52 Christophe Leroy     2025-02-12  111  	area = get_vm_area(PAGE_SIZE, 0);
37bc3e5fd764fb Balbir Singh         2017-06-29  112  	if (!area) {
37bc3e5fd764fb Balbir Singh         2017-06-29  113  		WARN_ONCE(1, "Failed to create text area for cpu %d\n",
37bc3e5fd764fb Balbir Singh         2017-06-29  114  			cpu);
37bc3e5fd764fb Balbir Singh         2017-06-29  115  		return -1;
37bc3e5fd764fb Balbir Singh         2017-06-29  116  	}
591b4b268435f0 Michael Ellerman     2022-02-23  117  
591b4b268435f0 Michael Ellerman     2022-02-23  118  	// Map/unmap the area to ensure all page tables are pre-allocated
591b4b268435f0 Michael Ellerman     2022-02-23  119  	addr = (unsigned long)area->addr;
591b4b268435f0 Michael Ellerman     2022-02-23 @120  	err = map_patch_area(empty_zero_page, addr);
591b4b268435f0 Michael Ellerman     2022-02-23  121  	if (err)
591b4b268435f0 Michael Ellerman     2022-02-23  122  		return err;
591b4b268435f0 Michael Ellerman     2022-02-23  123  
591b4b268435f0 Michael Ellerman     2022-02-23  124  	unmap_patch_area(addr);
591b4b268435f0 Michael Ellerman     2022-02-23  125  
2f228ee1ade5d8 Benjamin Gray        2022-11-09  126  	this_cpu_write(cpu_patching_context.area, area);
2f228ee1ade5d8 Benjamin Gray        2022-11-09  127  	this_cpu_write(cpu_patching_context.addr, addr);
2f228ee1ade5d8 Benjamin Gray        2022-11-09  128  	this_cpu_write(cpu_patching_context.pte, virt_to_kpte(addr));
37bc3e5fd764fb Balbir Singh         2017-06-29  129  
37bc3e5fd764fb Balbir Singh         2017-06-29  130  	return 0;
37bc3e5fd764fb Balbir Singh         2017-06-29  131  }
37bc3e5fd764fb Balbir Singh         2017-06-29  132  

:::::: The code at line 120 was first introduced by commit
:::::: 591b4b268435f00d2f0b81f786c2c7bd5ef66416 powerpc/code-patching: Pre-map patch area

:::::: TO: Michael Ellerman <mpe@ellerman.id.au>
:::::: CC: Michael Ellerman <mpe@ellerman.id.au>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
