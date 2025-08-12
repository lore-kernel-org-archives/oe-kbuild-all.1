Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21CA3C13B
	for <oe-kbuild-all@lists.linux.dev>; Tue, 12 Aug 2025 05:01:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754974865; cv=none; b=VR5VjIuuI1syez2hYWK8aBXWVFZdHDCtOTqnL7D2ryhig504vB6leKw/W/AY5S8aV30kEkojzDtBvDuOZTJmkLhU7+PYWlkUh/hlv2iITufsl7UvjYuf+6bE6W5XDwRM7nSeZr9bOj57Odua8RxFygt3MZ5TXG10SeSYp32H3H8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754974865; c=relaxed/simple;
	bh=yCKygfnmy7YbZUNejCDiAjpDw11eg9r23PLCNyvkNrw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=DS/0j07GPq8wom7Juu4ba1hTGAZMVAvZ4sEp1U8kAH0yCmnuT0ialXkHPoM3VqBDfOfiOdmt3bSOsVVmCyWT4ILN1eP+RqM6ktfWB0TIap/oMNx9HZaqoZPLfmFJeAo7j+wvWcLvPK/YMXaa/25FRoRtbMyX4w064MBGvSV2s0w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Bm1WnHyx; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Bm1WnHyx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754974863; x=1786510863;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=yCKygfnmy7YbZUNejCDiAjpDw11eg9r23PLCNyvkNrw=;
  b=Bm1WnHyx7VKeiiHLG9VzAY/FzKOgzuC/52Yw4LmwsGeEQTHRZ58i93Vi
   NgS+V2AD+b0D6fIpZVdUsIuYsTq/JfCxQTLjUhG+PJk9wHuD+uYYi+gvP
   DevDIOyXMo5gJKXp3hj7DlsnzgvcFsMN+oVjLjXg2W199BiMTHEA0IQTr
   jbirjKm3m8jqYaql99kA6N/hlm2Dx1y6q+ptGHiZC8oyyc7QlpjA5m2qi
   AQ0vOf8m+W1eQsWIiJjlz6Qd8awyaRP9VxILX446Phced5LEESWtjA0f/
   zsaVL1M4OSZ8cjfB5cvw1l/RXp6JPnVzwzsnPG/XatKOv7I1sJP57OWfY
   w==;
X-CSE-ConnectionGUID: sC7dZn8OSCWLmEspFeqvpw==
X-CSE-MsgGUID: GEDwKBtiQ6a2rxZbaweCeA==
X-IronPort-AV: E=McAfee;i="6800,10657,11518"; a="68613406"
X-IronPort-AV: E=Sophos;i="6.17,284,1747724400"; 
   d="scan'208";a="68613406"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Aug 2025 22:01:02 -0700
X-CSE-ConnectionGUID: 0bGZ0NzLSGOYlmT65bfAzg==
X-CSE-MsgGUID: wrS8Dd3/TrqrVssHCO2TBA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,284,1747724400"; 
   d="scan'208";a="165330151"
Received: from igk-lkp-server01.igk.intel.com (HELO b3b7d4258b7c) ([10.91.175.65])
  by orviesa010.jf.intel.com with ESMTP; 11 Aug 2025 22:01:01 -0700
Received: from kbuild by b3b7d4258b7c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ulh86-0003E7-2S;
	Tue, 12 Aug 2025 05:00:58 +0000
Date: Tue, 12 Aug 2025 07:00:06 +0200
From: kernel test robot <lkp@intel.com>
To: Yury Norov <yury.norov@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [norov:declare_bitmap 3/3] include/linux/find.h:586:62: warning:
 left-hand operand of comma expression has no effect
Message-ID: <202508120645.zimfaCd1-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/norov/linux declare_bitmap
head:   01ab0916a9bf06c1c2c964b3747e9a02f812285c
commit: 01ab0916a9bf06c1c2c964b3747e9a02f812285c [3/3] bitmap: move DECLARE_BITMAP() macro to include/linux/bitmap.h
config: m68k-randconfig-2003-20250812 (https://download.01.org/0day-ci/archive/20250812/202508120645.zimfaCd1-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250812/202508120645.zimfaCd1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508120645.zimfaCd1-lkp@intel.com/

All warnings (new ones prefixed by >>):

   include/linux/cpumask_types.h:18:37: error: 'const struct cpumask' has no member named 'bits'
    #define cpumask_bits(maskp) ((maskp)->bits)
                                        ^~
   include/linux/cpumask.h:208:11: note: in expansion of macro 'cpumask_bits'
              cpumask_bits(srcp3), small_cpumask_bits);
              ^~~~~~~~~~~~
   include/linux/cpumask.h: In function 'cpumask_last':
   include/linux/cpumask_types.h:18:37: error: 'const struct cpumask' has no member named 'bits'
    #define cpumask_bits(maskp) ((maskp)->bits)
                                        ^~
   include/linux/cpumask.h:219:23: note: in expansion of macro 'cpumask_bits'
     return find_last_bit(cpumask_bits(srcp), small_cpumask_bits);
                          ^~~~~~~~~~~~
   include/linux/cpumask.h: In function 'cpumask_next':
   include/linux/cpumask_types.h:18:37: error: 'const struct cpumask' has no member named 'bits'
    #define cpumask_bits(maskp) ((maskp)->bits)
                                        ^~
   include/linux/cpumask.h:235:23: note: in expansion of macro 'cpumask_bits'
     return find_next_bit(cpumask_bits(srcp), small_cpumask_bits, n + 1);
                          ^~~~~~~~~~~~
   include/linux/cpumask.h: In function 'cpumask_next_zero':
   include/linux/cpumask_types.h:18:37: error: 'const struct cpumask' has no member named 'bits'
    #define cpumask_bits(maskp) ((maskp)->bits)
                                        ^~
   include/linux/cpumask.h:251:28: note: in expansion of macro 'cpumask_bits'
     return find_next_zero_bit(cpumask_bits(srcp), small_cpumask_bits, n+1);
                               ^~~~~~~~~~~~
   include/linux/cpumask.h: In function 'cpumask_next_and':
   include/linux/cpumask_types.h:18:37: error: 'const struct cpumask' has no member named 'bits'
    #define cpumask_bits(maskp) ((maskp)->bits)
                                        ^~
   include/linux/cpumask.h:296:27: note: in expansion of macro 'cpumask_bits'
     return find_next_and_bit(cpumask_bits(src1p), cpumask_bits(src2p),
                              ^~~~~~~~~~~~
   include/linux/cpumask_types.h:18:37: error: 'const struct cpumask' has no member named 'bits'
    #define cpumask_bits(maskp) ((maskp)->bits)
                                        ^~
   include/linux/cpumask.h:296:48: note: in expansion of macro 'cpumask_bits'
     return find_next_and_bit(cpumask_bits(src1p), cpumask_bits(src2p),
                                                   ^~~~~~~~~~~~
   include/linux/cpumask.h: In function 'cpumask_next_andnot':
   include/linux/cpumask_types.h:18:37: error: 'const struct cpumask' has no member named 'bits'
    #define cpumask_bits(maskp) ((maskp)->bits)
                                        ^~
   include/linux/cpumask.h:315:30: note: in expansion of macro 'cpumask_bits'
     return find_next_andnot_bit(cpumask_bits(src1p), cpumask_bits(src2p),
                                 ^~~~~~~~~~~~
   include/linux/cpumask_types.h:18:37: error: 'const struct cpumask' has no member named 'bits'
    #define cpumask_bits(maskp) ((maskp)->bits)
                                        ^~
   include/linux/cpumask.h:315:51: note: in expansion of macro 'cpumask_bits'
     return find_next_andnot_bit(cpumask_bits(src1p), cpumask_bits(src2p),
                                                      ^~~~~~~~~~~~
   include/linux/cpumask.h: In function 'cpumask_next_and_wrap':
   include/linux/cpumask_types.h:18:37: error: 'const struct cpumask' has no member named 'bits'
    #define cpumask_bits(maskp) ((maskp)->bits)
                                        ^~
   include/linux/cpumask.h:336:32: note: in expansion of macro 'cpumask_bits'
     return find_next_and_bit_wrap(cpumask_bits(src1p), cpumask_bits(src2p),
                                   ^~~~~~~~~~~~
   include/linux/cpumask_types.h:18:37: error: 'const struct cpumask' has no member named 'bits'
    #define cpumask_bits(maskp) ((maskp)->bits)
                                        ^~
   include/linux/cpumask.h:336:53: note: in expansion of macro 'cpumask_bits'
     return find_next_and_bit_wrap(cpumask_bits(src1p), cpumask_bits(src2p),
                                                        ^~~~~~~~~~~~
   include/linux/cpumask.h: In function 'cpumask_next_wrap':
   include/linux/cpumask_types.h:18:37: error: 'const struct cpumask' has no member named 'bits'
    #define cpumask_bits(maskp) ((maskp)->bits)
                                        ^~
   include/linux/cpumask.h:354:28: note: in expansion of macro 'cpumask_bits'
     return find_next_bit_wrap(cpumask_bits(src), small_cpumask_bits, n + 1);
                               ^~~~~~~~~~~~
   include/linux/cpumask.h: In function 'cpumask_random':
   include/linux/cpumask_types.h:18:37: error: 'const struct cpumask' has no member named 'bits'
    #define cpumask_bits(maskp) ((maskp)->bits)
                                        ^~
   include/linux/cpumask.h:366:25: note: in expansion of macro 'cpumask_bits'
     return find_random_bit(cpumask_bits(src), nr_cpu_ids);
                            ^~~~~~~~~~~~
   In file included from include/linux/bitmap.h:11,
                    from include/linux/cpumask.h:12,
                    from include/linux/smp.h:13,
                    from include/linux/lockdep.h:14,
                    from include/linux/spinlock.h:63,
                    from include/linux/sched.h:37,
                    from arch/m68k/kernel/asm-offsets.c:15:
   include/linux/cpumask.h: In function 'cpumask_any_but':
   include/linux/cpumask_types.h:18:37: error: 'const struct cpumask' has no member named 'bits'
    #define cpumask_bits(maskp) ((maskp)->bits)
                                        ^~
   include/linux/find.h:586:41: note: in definition of macro 'for_each_set_bit'
     for ((bit) = 0; (bit) = find_next_bit((addr), (size), (bit)), (bit) < (size); (bit)++)
                                            ^~~~
   include/linux/cpumask.h:377:24: note: in expansion of macro 'cpumask_bits'
     for_each_set_bit(cpu, cpumask_bits(mask), small_cpumask_bits)
                           ^~~~~~~~~~~~
   include/linux/cpumask.h:472:2: note: in expansion of macro 'for_each_cpu'
     for_each_cpu(i, mask)
     ^~~~~~~~~~~~
>> include/linux/find.h:586:62: warning: left-hand operand of comma expression has no effect [-Wunused-value]
     for ((bit) = 0; (bit) = find_next_bit((addr), (size), (bit)), (bit) < (size); (bit)++)
                                                                 ^
   include/linux/cpumask.h:377:2: note: in expansion of macro 'for_each_set_bit'
     for_each_set_bit(cpu, cpumask_bits(mask), small_cpumask_bits)
     ^~~~~~~~~~~~~~~~
   include/linux/cpumask.h:472:2: note: in expansion of macro 'for_each_cpu'
     for_each_cpu(i, mask)
     ^~~~~~~~~~~~
   In file included from include/linux/sched.h:16,
                    from arch/m68k/kernel/asm-offsets.c:15:
   include/linux/cpumask.h: In function 'cpumask_nth':
   include/linux/cpumask_types.h:18:37: error: 'const struct cpumask' has no member named 'bits'
    #define cpumask_bits(maskp) ((maskp)->bits)
                                        ^~
   include/linux/cpumask.h:542:22: note: in expansion of macro 'cpumask_bits'
     return find_nth_bit(cpumask_bits(srcp), small_cpumask_bits, cpumask_check(cpu));
                         ^~~~~~~~~~~~
   include/linux/cpumask.h: In function 'cpumask_nth_and':
   include/linux/cpumask_types.h:18:37: error: 'const struct cpumask' has no member named 'bits'
    #define cpumask_bits(maskp) ((maskp)->bits)
                                        ^~
   include/linux/cpumask.h:557:26: note: in expansion of macro 'cpumask_bits'
     return find_nth_and_bit(cpumask_bits(srcp1), cpumask_bits(srcp2),
                             ^~~~~~~~~~~~
   include/linux/cpumask_types.h:18:37: error: 'const struct cpumask' has no member named 'bits'
    #define cpumask_bits(maskp) ((maskp)->bits)
                                        ^~
   include/linux/cpumask.h:557:47: note: in expansion of macro 'cpumask_bits'
     return find_nth_and_bit(cpumask_bits(srcp1), cpumask_bits(srcp2),
                                                  ^~~~~~~~~~~~
   include/linux/cpumask.h: In function 'cpumask_nth_and_andnot':
   include/linux/cpumask_types.h:18:37: error: 'const struct cpumask' has no member named 'bits'
    #define cpumask_bits(maskp) ((maskp)->bits)
                                        ^~
   include/linux/cpumask.h:575:33: note: in expansion of macro 'cpumask_bits'
     return find_nth_and_andnot_bit(cpumask_bits(srcp1),
                                    ^~~~~~~~~~~~
   include/linux/cpumask_types.h:18:37: error: 'const struct cpumask' has no member named 'bits'
    #define cpumask_bits(maskp) ((maskp)->bits)
                                        ^~
   include/linux/cpumask.h:576:6: note: in expansion of macro 'cpumask_bits'
         cpumask_bits(srcp2),
         ^~~~~~~~~~~~
   include/linux/cpumask_types.h:18:37: error: 'const struct cpumask' has no member named 'bits'
    #define cpumask_bits(maskp) ((maskp)->bits)
                                        ^~
   include/linux/cpumask.h:577:6: note: in expansion of macro 'cpumask_bits'
         cpumask_bits(srcp3),
         ^~~~~~~~~~~~
   In file included from include/linux/bitops.h:67,
                    from include/linux/thread_info.h:27,
                    from arch/m68k/include/asm/current.h:16,
                    from include/linux/sched.h:12,
                    from arch/m68k/kernel/asm-offsets.c:15:
   include/linux/cpumask.h: In function 'cpumask_set_cpu':
   include/linux/cpumask_types.h:18:37: error: 'struct cpumask' has no member named 'bits'
    #define cpumask_bits(maskp) ((maskp)->bits)
                                        ^~
   arch/m68k/include/asm/bitops.h:61:49: note: in definition of macro 'set_bit'
    #define set_bit(nr, vaddr) bset_mem_set_bit(nr, vaddr)
                                                    ^~~~~
   include/linux/cpumask.h:599:30: note: in expansion of macro 'cpumask_bits'
     set_bit(cpumask_check(cpu), cpumask_bits(dstp));
                                 ^~~~~~~~~~~~
   In file included from include/linux/thread_info.h:27,
                    from arch/m68k/include/asm/current.h:16,
                    from include/linux/sched.h:12,
                    from arch/m68k/kernel/asm-offsets.c:15:
   include/linux/cpumask.h: In function '__cpumask_set_cpu':
   include/linux/cpumask_types.h:18:37: error: 'struct cpumask' has no member named 'bits'
    #define cpumask_bits(maskp) ((maskp)->bits)
                                        ^~
   include/linux/bitops.h:44:37: note: in definition of macro 'bitop'
       __builtin_constant_p((uintptr_t)(addr) != (uintptr_t)NULL) && \
                                        ^~~~
   include/linux/cpumask.h:605:2: note: in expansion of macro '__set_bit'
     __set_bit(cpumask_check(cpu), cpumask_bits(dstp));
     ^~~~~~~~~
   include/linux/cpumask.h:605:32: note: in expansion of macro 'cpumask_bits'
     __set_bit(cpumask_check(cpu), cpumask_bits(dstp));
                                   ^~~~~~~~~~~~
   include/linux/cpumask_types.h:18:37: error: 'struct cpumask' has no member named 'bits'
    #define cpumask_bits(maskp) ((maskp)->bits)
                                        ^~
   include/linux/bitops.h:45:16: note: in definition of macro 'bitop'
       (uintptr_t)(addr) != (uintptr_t)NULL &&   \
                   ^~~~
   include/linux/cpumask.h:605:2: note: in expansion of macro '__set_bit'
     __set_bit(cpumask_check(cpu), cpumask_bits(dstp));
     ^~~~~~~~~
   include/linux/cpumask.h:605:32: note: in expansion of macro 'cpumask_bits'
     __set_bit(cpumask_check(cpu), cpumask_bits(dstp));
                                   ^~~~~~~~~~~~
   include/linux/cpumask_types.h:18:37: error: 'struct cpumask' has no member named 'bits'
    #define cpumask_bits(maskp) ((maskp)->bits)
                                        ^~
   include/linux/bitops.h:46:50: note: in definition of macro 'bitop'
       __builtin_constant_p(*(const unsigned long *)(addr))) ? \
                                                     ^~~~
   include/linux/cpumask.h:605:2: note: in expansion of macro '__set_bit'


vim +586 include/linux/find.h

6b8ecb84f8f640 include/asm-generic/bitops/find.h Yury Norov 2021-08-14  584  
bc9d6635c293a2 include/linux/find.h              Yury Norov 2021-08-14  585  #define for_each_set_bit(bit, addr, size) \
fdae96a3fc7f70 include/linux/find.h              Yury Norov 2022-09-19 @586  	for ((bit) = 0; (bit) = find_next_bit((addr), (size), (bit)), (bit) < (size); (bit)++)
bc9d6635c293a2 include/linux/find.h              Yury Norov 2021-08-14  587  

:::::: The code at line 586 was first introduced by commit
:::::: fdae96a3fc7f70eb8ff9619550d7fa604719626a lib/find: optimize for_each() macros

:::::: TO: Yury Norov <yury.norov@gmail.com>
:::::: CC: Yury Norov <yury.norov@gmail.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
