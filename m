Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CAACBE6C
	for <oe-kbuild-all@lists.linux.dev>; Sat, 28 Dec 2024 10:17:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735381059; cv=none; b=cXW/Pnj15Prq5kgPhEaVTZ+lVfll5TVnEBLjC2jxaT6KFgUjOqDm6OQTx85SgCRoax+vy8uMuEaMZMyEi4/w67eRmIN+WqbLlFeEaIJSalFD9+RhF12Cfx7OFy0QHXq0fIBRyym0jrD4s4I/M6Qc9y6vg52LjtINPPr6ylv/7yk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735381059; c=relaxed/simple;
	bh=jwH7/2YG6zRcgxWA7M3AwkWUC0ifLu3TTTzu2XqO1mU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=uqDcYNTl+r8fUVE7dp1xBBnYsxw793cVv5y85sfO9Y+LIZ4nLafYBp/qEuWjJWeWXVEu3Qt2pXm233rn3VTHa96E7CEeac4PlDQrzOXug0leQzLq556MNAhzCrbziICg6+1DlDjeSZ/X8eVjwQe/QJiG+4Ca9xu6p08838keu/w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LYk9eLMB; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LYk9eLMB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735381057; x=1766917057;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=jwH7/2YG6zRcgxWA7M3AwkWUC0ifLu3TTTzu2XqO1mU=;
  b=LYk9eLMBjuxKzNjB5ZBP9PH6FQP5xXKvkSM/nMJFc1sEL5qCtyo5G0ND
   txMRDMtD6jfx0OZxwb6iwB56uwDkd4AyYG75nmaHM9EsnR1LCJPysZyln
   JXRWDN95sQzCmRby18un2zGGPPeKTkMfv1PvRUJOZ48PyMJtuVUhEwIUB
   qdbUAAuMWzbskCVBy/fHngGS7y1XbWiyVB4N11XgPjxLcuZNDszCE6E75
   qAt8f28jgi5L+GosdDOkkFQ+AokueJLzyGeJ+KJ1+wmY0bTJVzhhZLdLN
   OzY2np49Qp6BIcGgt/lSYZBdUa7SKo7q5CohnITw7i6hM5c/HmaNj6NBO
   Q==;
X-CSE-ConnectionGUID: us5GvcioRdiZNs8qrHJRXg==
X-CSE-MsgGUID: 9DyTKOjCTcW2qpJLjAnFjg==
X-IronPort-AV: E=McAfee;i="6700,10204,11298"; a="47169422"
X-IronPort-AV: E=Sophos;i="6.12,272,1728975600"; 
   d="scan'208";a="47169422"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Dec 2024 02:17:36 -0800
X-CSE-ConnectionGUID: LFiF83bgQqqpOSESEJI1JA==
X-CSE-MsgGUID: y3Rsu40RRraygS/iSYuKvg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="137682013"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 28 Dec 2024 02:17:35 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tRTsz-00040q-0u;
	Sat, 28 Dec 2024 10:17:33 +0000
Date: Sat, 28 Dec 2024 18:16:45 +0800
From: kernel test robot <lkp@intel.com>
To: Xin3 Li <xin3.li@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [xinli-intel-fred-public:fix_sp_calculation 13/13] clang diag:
 arch/x86/include/asm/msr.h:240:17: warning: 'cold' attribute only applies to
 functions
Message-ID: <202412281836.VNZLaZn8-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/xinli-intel/linux-fred-public.git fix_sp_calculation
head:   7ae208f8a9ad3b0127853271eec4fb7211f71daa
commit: d306be716e5af1adafb2353116f5a5aec9f5fa15 [13/13] x86/msr: Use the alternatives mechanism to call Xen MSR APIs
config: x86_64-buildonly-randconfig-004-20241228 (https://download.01.org/0day-ci/archive/20241228/202412281836.VNZLaZn8-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241228/202412281836.VNZLaZn8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412281836.VNZLaZn8-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> clang diag: arch/x86/include/asm/msr.h:240:17: warning: 'cold' attribute only applies to functions [-Wignored-attributes]
   clang diag: arch/x86/include/asm/msr.h:278:17: warning: 'cold' attribute only applies to functions [-Wignored-attributes]
   clang diag: arch/x86/include/asm/msr.h:313:17: warning: 'cold' attribute only applies to functions [-Wignored-attributes]
   clang diag: arch/x86/include/asm/msr.h:345:17: warning: 'cold' attribute only applies to functions [-Wignored-attributes]
   clang diag: arch/x86/include/asm/msr.h:568:17: warning: 'cold' attribute only applies to functions [-Wignored-attributes]
   clang diag: arch/x86/include/asm/msr.h:594:17: warning: 'cold' attribute only applies to functions [-Wignored-attributes]
   clang diag: arch/x86/include/asm/msr.h:636:17: warning: 'cold' attribute only applies to functions [-Wignored-attributes]
   clang diag: arch/x86/include/asm/msr.h:671:17: warning: 'cold' attribute only applies to functions [-Wignored-attributes]
--
   In file included from arch/x86/kernel/asm-offsets.c:9:
   In file included from include/linux/crypto.h:17:
   In file included from include/linux/slab.h:16:
   In file included from include/linux/gfp.h:7:
   In file included from include/linux/mmzone.h:22:
   In file included from include/linux/mm_types.h:16:
   In file included from include/linux/uprobes.h:18:
   In file included from include/linux/timer.h:6:
   In file included from include/linux/ktime.h:25:
   In file included from include/linux/jiffies.h:10:
   In file included from include/linux/time.h:60:
   In file included from include/linux/time32.h:13:
   In file included from include/linux/timex.h:67:
   In file included from arch/x86/include/asm/timex.h:6:
   In file included from arch/x86/include/asm/tsc.h:10:
   arch/x86/include/asm/msr.h:240:17: warning: 'cold' attribute only applies to functions [-Wignored-attributes]
     240 |         __attribute__((cold, unused));
         |                        ^
   arch/x86/include/asm/msr.h:278:17: warning: 'cold' attribute only applies to functions [-Wignored-attributes]
     278 |         __attribute__((cold, unused));
         |                        ^
   arch/x86/include/asm/msr.h:313:17: warning: 'cold' attribute only applies to functions [-Wignored-attributes]
     313 |         __attribute__((cold, unused));
         |                        ^
   arch/x86/include/asm/msr.h:345:17: warning: 'cold' attribute only applies to functions [-Wignored-attributes]
     345 |         __attribute__((cold, unused));
         |                        ^
   arch/x86/include/asm/msr.h:568:17: warning: 'cold' attribute only applies to functions [-Wignored-attributes]
     568 |         __attribute__((cold, unused));
         |                        ^
   arch/x86/include/asm/msr.h:594:17: warning: 'cold' attribute only applies to functions [-Wignored-attributes]
     594 |         __attribute__((cold, unused));
         |                        ^
   arch/x86/include/asm/msr.h:636:17: warning: 'cold' attribute only applies to functions [-Wignored-attributes]
     636 |         __attribute__((cold, unused));
         |                        ^
   arch/x86/include/asm/msr.h:671:17: warning: 'cold' attribute only applies to functions [-Wignored-attributes]
     671 |         __attribute__((cold, unused));
         |                        ^
   8 warnings generated.
   ***
   *** Rust bindings generator 'bindgen' < 0.69.5 together with libclang >= 19.1
   *** may not work due to a bug (https://github.com/rust-lang/rust-bindgen/pull/2824),
   *** unless patched (like Debian's).
   ***   Your bindgen version:  0.65.1
   ***   Your libclang version: 19.1.3
   ***
   ***
   *** Please see Documentation/rust/quick-start.rst for details
   *** on how to set up the Rust support.
   ***
   In file included from rust/helpers/helpers.c:10:
   In file included from rust/helpers/blk.c:3:
   In file included from include/linux/blk-mq.h:5:
   In file included from include/linux/blkdev.h:9:
   In file included from include/linux/blk_types.h:10:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:5:
   In file included from include/linux/fs.h:10:
   In file included from include/linux/stat.h:19:
   In file included from include/linux/time.h:60:
   In file included from include/linux/time32.h:13:
   In file included from include/linux/timex.h:67:
   In file included from arch/x86/include/asm/timex.h:6:
   In file included from arch/x86/include/asm/tsc.h:10:
   arch/x86/include/asm/msr.h:240:17: warning: 'cold' attribute only applies to functions [-Wignored-attributes]
     240 |         __attribute__((cold, unused));
         |                        ^
   arch/x86/include/asm/msr.h:278:17: warning: 'cold' attribute only applies to functions [-Wignored-attributes]
     278 |         __attribute__((cold, unused));
         |                        ^
   arch/x86/include/asm/msr.h:313:17: warning: 'cold' attribute only applies to functions [-Wignored-attributes]
     313 |         __attribute__((cold, unused));
         |                        ^
   arch/x86/include/asm/msr.h:345:17: warning: 'cold' attribute only applies to functions [-Wignored-attributes]
     345 |         __attribute__((cold, unused));
         |                        ^
   arch/x86/include/asm/msr.h:568:17: warning: 'cold' attribute only applies to functions [-Wignored-attributes]
     568 |         __attribute__((cold, unused));
         |                        ^
   arch/x86/include/asm/msr.h:594:17: warning: 'cold' attribute only applies to functions [-Wignored-attributes]
     594 |         __attribute__((cold, unused));
         |                        ^
   arch/x86/include/asm/msr.h:636:17: warning: 'cold' attribute only applies to functions [-Wignored-attributes]
     636 |         __attribute__((cold, unused));
         |                        ^
   arch/x86/include/asm/msr.h:671:17: warning: 'cold' attribute only applies to functions [-Wignored-attributes]
     671 |         __attribute__((cold, unused));
         |                        ^
   8 warnings generated.
>> clang diag: arch/x86/include/asm/msr.h:240:17: warning: 'cold' attribute only applies to functions [-Wignored-attributes]
   clang diag: arch/x86/include/asm/msr.h:278:17: warning: 'cold' attribute only applies to functions [-Wignored-attributes]
   clang diag: arch/x86/include/asm/msr.h:313:17: warning: 'cold' attribute only applies to functions [-Wignored-attributes]
   clang diag: arch/x86/include/asm/msr.h:345:17: warning: 'cold' attribute only applies to functions [-Wignored-attributes]
   clang diag: arch/x86/include/asm/msr.h:568:17: warning: 'cold' attribute only applies to functions [-Wignored-attributes]
   clang diag: arch/x86/include/asm/msr.h:594:17: warning: 'cold' attribute only applies to functions [-Wignored-attributes]
   clang diag: arch/x86/include/asm/msr.h:636:17: warning: 'cold' attribute only applies to functions [-Wignored-attributes]
   clang diag: arch/x86/include/asm/msr.h:671:17: warning: 'cold' attribute only applies to functions [-Wignored-attributes]
>> clang diag: arch/x86/include/asm/msr.h:240:17: warning: 'cold' attribute only applies to functions [-Wignored-attributes]
   clang diag: arch/x86/include/asm/msr.h:278:17: warning: 'cold' attribute only applies to functions [-Wignored-attributes]
   clang diag: arch/x86/include/asm/msr.h:313:17: warning: 'cold' attribute only applies to functions [-Wignored-attributes]
   clang diag: arch/x86/include/asm/msr.h:345:17: warning: 'cold' attribute only applies to functions [-Wignored-attributes]
   clang diag: arch/x86/include/asm/msr.h:568:17: warning: 'cold' attribute only applies to functions [-Wignored-attributes]
   clang diag: arch/x86/include/asm/msr.h:594:17: warning: 'cold' attribute only applies to functions [-Wignored-attributes]
   clang diag: arch/x86/include/asm/msr.h:636:17: warning: 'cold' attribute only applies to functions [-Wignored-attributes]
   clang diag: arch/x86/include/asm/msr.h:671:17: warning: 'cold' attribute only applies to functions [-Wignored-attributes]
>> clang diag: arch/x86/include/asm/msr.h:240:17: warning: 'cold' attribute only applies to functions [-Wignored-attributes]
   clang diag: arch/x86/include/asm/msr.h:278:17: warning: 'cold' attribute only applies to functions [-Wignored-attributes]
   clang diag: arch/x86/include/asm/msr.h:313:17: warning: 'cold' attribute only applies to functions [-Wignored-attributes]
   clang diag: arch/x86/include/asm/msr.h:345:17: warning: 'cold' attribute only applies to functions [-Wignored-attributes]
   clang diag: arch/x86/include/asm/msr.h:568:17: warning: 'cold' attribute only applies to functions [-Wignored-attributes]
   clang diag: arch/x86/include/asm/msr.h:594:17: warning: 'cold' attribute only applies to functions [-Wignored-attributes]
   clang diag: arch/x86/include/asm/msr.h:636:17: warning: 'cold' attribute only applies to functions [-Wignored-attributes]
   clang diag: arch/x86/include/asm/msr.h:671:17: warning: 'cold' attribute only applies to functions [-Wignored-attributes]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
