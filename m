Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 390E24A1A
	for <oe-kbuild-all@lists.linux.dev>; Sat,  5 Apr 2025 00:50:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743814225; cv=none; b=unB3aDiIWTFvIqjLuk9070Zzc+hi9E4O91mFFq0MtdRYsJrYABntdO6eGu8EYeujwdPyf5xihB88H8KsZYinYlCR9CL9JGnlVlVFKOEJsPHjGTrFJKDJsASJOEvnJwd24gwmYiJBJ41PN2j90xFnjJM3U30U+f7WoKHIpp2ZAFY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743814225; c=relaxed/simple;
	bh=O4yebv23wWu2Rl3woPvvindNbicgo1+ivVEobi4sei8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=UAYaNKUZBIOdapU4rnnwcZAeSkWzyYzlWXdUcRXDkPjKqk4AmhF4skFv2muQ+xCmFSxX5q15eZPCNl0xYQqLqV0fjTuPgFfKa8WrqLSJZgdRJfmZKZV5Cx/ONh6xAhj9AIBQGZkQShL93S3jPKAiEFM44Rn8HaK4olxy6cPcDWY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UQRA1GuV; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UQRA1GuV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743814224; x=1775350224;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=O4yebv23wWu2Rl3woPvvindNbicgo1+ivVEobi4sei8=;
  b=UQRA1GuVO+0hkABJmi/ID50IXlFUzsG0qUlSwj0w8B6mqOKCvR1KnsSy
   4Scmwi0T9zI7Km/74WH4mOuNKKXY6vLB9nMGy8ZPB+mQeulR0x1G0D/UO
   dzu8RJE0FrHufvCuHHwdhn1/X4kWWqxpXA/qtwk2vUTAoFuwJMbFXfsW9
   fRvQJq574vTeuMBlBB7Vlmg3BfoyjHYWWjdR4J86ZEkhe320vQxLIZ4Un
   m+fl3QXFaRGYqvox7SO0iqVByu6lVIjTD4eloI7hxEe62cM7x9ZYtuZyU
   Lbd/WMHd852c6+KUIoG7B5IWTZ60iwzgse3YUsssTK7W8ziaNRyOlzSTD
   A==;
X-CSE-ConnectionGUID: V8kjDEgTSsy/pzQG807Bbw==
X-CSE-MsgGUID: GuO+z8EqQFyPcswTEp/IdQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11394"; a="45362637"
X-IronPort-AV: E=Sophos;i="6.15,189,1739865600"; 
   d="scan'208";a="45362637"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Apr 2025 17:50:24 -0700
X-CSE-ConnectionGUID: 4cpiKMJ3RcSIPOEAaC0/nw==
X-CSE-MsgGUID: AzPWGb9eRx+m7w4gqVmlXA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,189,1739865600"; 
   d="scan'208";a="127438794"
Received: from lkp-server01.sh.intel.com (HELO b207828170a5) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 04 Apr 2025 17:50:22 -0700
Received: from kbuild by b207828170a5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u0rjo-0001hv-1H;
	Sat, 05 Apr 2025 00:50:20 +0000
Date: Sat, 5 Apr 2025 08:49:46 +0800
From: kernel test robot <lkp@intel.com>
To: Josh Poimboeuf <jpoimboe@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, Juergen Gross <jgross@suse.com>
Subject: [jpoimboe:objtool-werror 1/3] vmlinux.o: warning: objtool:
 asm_load_gs_index+0x0: stack state mismatch: cfa1=4+8 cfa2=4+0
Message-ID: <202504050802.B6gCLJGB-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jpoimboe/linux.git objtool-werror
head:   449363264d269ad1a7708447c2ed718e7170143c
commit: b1c60a498c6146de0706572d3f47d3723ca91743 [1/3] objtool: Fix SYSCALL instruction handling and INSN_CONTEXT_SWITCH
config: x86_64-buildonly-randconfig-005-20250405 (https://download.01.org/0day-ci/archive/20250405/202504050802.B6gCLJGB-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250405/202504050802.B6gCLJGB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504050802.B6gCLJGB-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> vmlinux.o: warning: objtool: asm_load_gs_index+0x0: stack state mismatch: cfa1=4+8 cfa2=4+0
>> vmlinux.o: warning: objtool: asm_exc_nmi+0xd9: stack state mismatch: cfa1=4+0 cfa2=4+8

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
