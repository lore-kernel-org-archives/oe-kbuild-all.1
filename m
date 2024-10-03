Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9896540879
	for <oe-kbuild-all@lists.linux.dev>; Thu,  3 Oct 2024 06:06:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727935581; cv=none; b=DMGXYg5SG3i6khdwYnogB2Z9+/7SAQeOduRKEgycpZq0PfIEhhA7Op9pSAGj2CUz6AZgZqfGs7RLJxdNqtmhxy1wGn4po79h/+SzOK8RT0TbHg0Jvly7bgKmGcFSvsGtf2X7XCY9MdXhJ8OoYDkqs1PSvm1cMYjcHTtbG8vrUBI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727935581; c=relaxed/simple;
	bh=pCaTI7U10s0N3wP7BM+zFQAWvo/U500n0FhTGgoR4dk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=c3ZVXWZVfup0WOqmZnMt5U7/hWt2zMPnYAmyqR5grnRyJyHJMCm0O2kpt+FDnBy4XdL/PaJ5Am2D+c69F9UVLv3Dse+ZbW8DrgtQTx3Zad5mypw4snw335auKmB+JhK81Ils2KBvof6ysSYD/RVaDMpDT8d4ig1hPdCbWng8KM8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AuwxP3Zy; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AuwxP3Zy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727935580; x=1759471580;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=pCaTI7U10s0N3wP7BM+zFQAWvo/U500n0FhTGgoR4dk=;
  b=AuwxP3ZyQUl7cOclO7XZeJbLDWJMPtqXPtDVhH8nF4/KS1QnSFGJGjjF
   CIeQo3hCWJR3DEwQA2rpQECVSQ8lL2+ahBPNHw3E56fRigwVUAKj13jmE
   QqRJSh1woloOGXy+LD2JFWxlrrGaatXoEIW/dX8fsUQNRGFFWb5Q6B4fH
   xl/t0xykWMrwzxc16vHRqqLBoHEM0ZeYWKD6f9w+f8Slm5VrBOnxG0msz
   7vrf7XR//hJwhWGKw+Lqa7O2FTURUthCPhCV117u0foHKZ5tf2y1qXaL5
   nIEp0L9yGnd3Vt36fv0romq4vOT65VaIbCy9ZBgihjBcaSqnjdqZCYN7J
   A==;
X-CSE-ConnectionGUID: ThVlPzSHSYqW7xglc1dIjg==
X-CSE-MsgGUID: 18+/osiqTOuyqxxBrWtU+A==
X-IronPort-AV: E=McAfee;i="6700,10204,11213"; a="26626458"
X-IronPort-AV: E=Sophos;i="6.11,173,1725346800"; 
   d="scan'208";a="26626458"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Oct 2024 23:06:19 -0700
X-CSE-ConnectionGUID: 1U0T3QfVRr+YdlnDNJIgtw==
X-CSE-MsgGUID: GCJvuWs4T2SrO0kS8zdbAQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,173,1725346800"; 
   d="scan'208";a="73833782"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 02 Oct 2024 23:06:17 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1swEyd-00006u-27;
	Thu, 03 Oct 2024 06:06:15 +0000
Date: Thu, 3 Oct 2024 14:05:41 +0800
From: kernel test robot <lkp@intel.com>
To: Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [cip:b-4.4-st56-rt51 368/395] drivers/char/random.c:1811:30:
 warning: 'hash_entropy_int_lock' defined but not used
Message-ID: <202410031407.tFcmiZWx-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/cip/linux-cip.git b-4.4-st56-rt51
head:   83b6d202216c6d5a6a328dc895dd1b7005dedd92
commit: 631b8d1ae2859fbbcb685622db85bb1f47d7925e [368/395] random: avoid preempt_disable()ed section
config: parisc-allnoconfig (https://download.01.org/0day-ci/archive/20241003/202410031407.tFcmiZWx-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241003/202410031407.tFcmiZWx-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410031407.tFcmiZWx-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/uapi/linux/stddef.h:1:0,
                    from include/linux/stddef.h:4,
                    from include/uapi/linux/posix_types.h:4,
                    from include/uapi/linux/types.h:13,
                    from include/linux/types.h:5,
                    from include/uapi/linux/capability.h:16,
                    from include/linux/capability.h:15,
                    from include/linux/sched.h:15,
                    from include/linux/utsname.h:5,
                    from drivers/char/random.c:238:
   arch/parisc/include/asm/uaccess.h: In function 'copy_from_user':
   arch/parisc/include/asm/uaccess.h:251:63: warning: comparison between signed and unsigned integer expressions [-Wsign-compare]
            if (likely(sz == -1 || !__builtin_constant_p(n) || sz >= n))
                                                                  ^
   include/linux/compiler.h:181:40: note: in definition of macro 'likely'
    # define likely(x) __builtin_expect(!!(x), 1)
                                           ^
   drivers/char/random.c: In function 'xfer_secondary_pool':
   drivers/char/random.c:983:23: warning: comparison between signed and unsigned integer expressions [-Wsign-compare]
         r->entropy_count >= (nbytes << (ENTROPY_SHIFT + 3)) ||
                          ^~
   drivers/char/random.c: In function 'account':
   drivers/char/random.c:1060:13: warning: comparison between signed and unsigned integer expressions [-Wsign-compare]
     if (ibytes < min)
                ^
   drivers/char/random.c: In function 'extract_buf':
   drivers/char/random.c:1109:16: warning: comparison between signed and unsigned integer expressions [-Wsign-compare]
     for (i = 0; i < LONGS(20); i++) {
                   ^
   In file included from drivers/char/random.c:263:0:
   At top level:
>> drivers/char/random.c:1811:30: warning: 'hash_entropy_int_lock' defined but not used [-Wunused-const-variable=]
    static DEFINE_LOCAL_IRQ_LOCK(hash_entropy_int_lock);
                                 ^
   include/linux/locallock.h:248:60: note: in definition of macro 'DEFINE_LOCAL_IRQ_LOCK'
    #define DEFINE_LOCAL_IRQ_LOCK(lvar)  __typeof__(const int) lvar
                                                               ^~~~


vim +/hash_entropy_int_lock +1811 drivers/char/random.c

  1808	
  1809	static DEFINE_PER_CPU(__u32 [MD5_DIGEST_WORDS], get_random_int_hash)
  1810			__aligned(sizeof(unsigned long));
> 1811	static DEFINE_LOCAL_IRQ_LOCK(hash_entropy_int_lock);
  1812	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
