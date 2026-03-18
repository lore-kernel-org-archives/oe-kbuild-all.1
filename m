Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DF27149C6F
	for <oe-kbuild-all@lists.linux.dev>; Wed, 18 Mar 2026 00:21:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773793267; cv=none; b=ATmPtV9Z2HZf3fSWAn1T+tMueb4kHDuUvKwqPxBfEEIPAmqp0+4MRVX5x3fG8MYvepkYC6d7qe9uTXTm/FJTA0xfsMR2sx90gizX2VOrDAATXLIA0SMH3qpa9lQnexbhFMQDLjIs1Je45ZPT+mgCtiahMYH6NL4QHdcKHB92DpA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773793267; c=relaxed/simple;
	bh=gRkRndKxC6k74U/ynUEHeZYF+y/OWDStP+/LOy0JX/8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=B4NcHlhvlUh6yWbWxbxZYZF9CJlFEeaYpwMlCskXH+AQDZv9wf+8Lq9bpHVJTrz3BAnVYwhzFbPUSYXH5sd5eNt1zahYqcQL+TwtMFWC6s9Lfn/RTuP+M9ulUGwIldfU5le2gkMXVjxjL8JVfVCY2koRnxGQib2ZT0iOJ2y/n1Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FFbqQ9gG; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FFbqQ9gG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773793265; x=1805329265;
  h=date:from:to:cc:subject:message-id;
  bh=gRkRndKxC6k74U/ynUEHeZYF+y/OWDStP+/LOy0JX/8=;
  b=FFbqQ9gG2Cb478Yn72XKHQglJfTnQCxVpdFh2umeHFqubR7/NcDryPQN
   Pje7xwTBF2S/l3HEmv4Dq39c4hdXs45eVZzvcAXjtZJi3p58q9PeB31Db
   Kg7biXJa5+JkuLoQp6TlzqMkFR6Ex/OJmMM8aDZv53u8Ff63DJeVSfPCK
   xtZ8J406HxQcbqlA/0jtX/m/geVIbIte08yO7l92Pe+KBl4vl8s8Kl/TH
   3Ekfz0NFxNJl3EAUwCNBvJBorYaGxUtQ99dfaOrkFzReC+hJw3NbvRVkz
   +aUZJ/gpAZMTLiEHMfLbGWWEeUa2mmUUei/BA5gB1W7uXmQmUEOt2mfqG
   A==;
X-CSE-ConnectionGUID: 8Cw7iaG/QNStinCjcUt3mw==
X-CSE-MsgGUID: /IczCePWRt2qrAYqneP4kg==
X-IronPort-AV: E=McAfee;i="6800,10657,11732"; a="85919101"
X-IronPort-AV: E=Sophos;i="6.23,126,1770624000"; 
   d="scan'208";a="85919101"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Mar 2026 17:21:04 -0700
X-CSE-ConnectionGUID: /XAVGiD5RWWJivLjzsUX1A==
X-CSE-MsgGUID: x9ZF5Q2pSEWSGvGlUrQwMg==
X-ExtLoop1: 1
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by fmviesa003.fm.intel.com with ESMTP; 17 Mar 2026 17:21:03 -0700
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w2eei-000000004Y1-2L4B;
	Wed, 18 Mar 2026 00:21:00 +0000
Date: Wed, 18 Mar 2026 01:20:49 +0100
From: kernel test robot <lkp@intel.com>
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev,
 Andrew Morton <akpm@linux-foundation.org>,
 Linux Memory Management List <linux-mm@kvack.org>,
 "Lorenzo Stoakes (Oracle)" <ljs@kernel.org>
Subject: [akpm-mm:mm-unstable 178/373] Diff in
 drivers/android/binder/page_range.rs:762:
Message-ID: <202603180101.Ucu0xecf-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-unstable
head:   62b00bcb1e330a36eff84d9d976b340a7bef6952
commit: d061c7d44da39ab5ed6e4696a8870d21f1540916 [178/373] mm: rename zap_page_range_single() to zap_vma_range()
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20260318/202603180101.Ucu0xecf-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260318/202603180101.Ucu0xecf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603180101.Ucu0xecf-lkp@intel.com/

All errors (new ones prefixed by >>):

   PATH=/opt/cross/clang-20/bin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
   INFO PATH=/opt/cross/rustc-1.88.0-bindgen-0.72.1/cargo/bin:/opt/cross/clang-20/bin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
   /usr/bin/timeout -k 100 12h /usr/bin/make KCFLAGS=\ -fno-crash-diagnostics\ -Wno-error=return-type\ -Wreturn-type\ -funsigned-char\ -Wundef\ -falign-functions=64 W=1 --keep-going LLVM=1 -j32 -C source O=/kbuild/obj/consumer/x86_64-rhel-9.4-rust ARCH=x86_64 SHELL=/bin/bash rustfmtcheck 
   make: Entering directory '/kbuild/src/consumer'
   make[1]: Entering directory '/kbuild/obj/consumer/x86_64-rhel-9.4-rust'
>> Diff in drivers/android/binder/page_range.rs:762:
        if let Some(unchecked_vma) = mmap_read.vma_lookup(vma_addr) {
            if let Some(vma) = check_vma(unchecked_vma, range_ptr) {
                let user_page_addr = vma_addr + (page_index << PAGE_SHIFT);
   -        vma.zap_vma_range(user_page_addr, PAGE_SIZE);
   +            vma.zap_vma_range(user_page_addr, PAGE_SIZE);
            }
        }
    
>> Diff in drivers/android/binder/page_range.rs:762:
        if let Some(unchecked_vma) = mmap_read.vma_lookup(vma_addr) {
            if let Some(vma) = check_vma(unchecked_vma, range_ptr) {
                let user_page_addr = vma_addr + (page_index << PAGE_SHIFT);
   -        vma.zap_vma_range(user_page_addr, PAGE_SIZE);
   +            vma.zap_vma_range(user_page_addr, PAGE_SIZE);
            }
        }
    
   make[2]: *** [Makefile:1916: rustfmt] Error 123
   make[2]: Target 'rustfmtcheck' not remade because of errors.
   make[1]: Leaving directory '/kbuild/obj/consumer/x86_64-rhel-9.4-rust'
   make[1]: *** [Makefile:248: __sub-make] Error 2
   make[1]: Target 'rustfmtcheck' not remade because of errors.
   make: *** [Makefile:248: __sub-make] Error 2
   make: Target 'rustfmtcheck' not remade because of errors.
   make: Leaving directory '/kbuild/src/consumer'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
