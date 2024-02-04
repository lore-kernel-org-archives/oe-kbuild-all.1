Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DDB810F1
	for <oe-kbuild-all@lists.linux.dev>; Sun,  4 Feb 2024 02:36:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707014199; cv=none; b=dYLE63ZNaWxE+DGr6RCA0flGOOkpoaTXdM7h0YBpGYtuormJZEWvELmnD6NbgkJe1/Ow/t9japoM2MkB89Qq94a7jq4svW3VK556QgSUlFOujTYwwPS5e6E9gVpu0SY46xjKRcWdzslYFhmNP94rIeLs2KEHIdI1LPs9D6UMj/w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707014199; c=relaxed/simple;
	bh=MsLXGSpYIXwXXtOlqRtXM2x+I0nBNGqXPMORAJmDC0M=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=AlDiSw+952lahh/BglOzb37PUpPVk11354k755gQBvl2spsa7id8WSJ0ZISq9blMY9RBhU3Z1dNOVlxxCnrL33q5hPAZaYZnlMGo6kmjCZY8//t3+v819V/lHmvcMlBCeRkPe7KPDlwbMmkuZ+1aUu7MtO5SsSK9ztT8ydE5SoQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dsDiQSdC; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dsDiQSdC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707014198; x=1738550198;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=MsLXGSpYIXwXXtOlqRtXM2x+I0nBNGqXPMORAJmDC0M=;
  b=dsDiQSdC297Ux3IO4W3rlNgLa+1wp4f7vxxnEctOO7ZzpzjkVR0hKU+Q
   wPouNO34O9foOF7kSmmJqT2LSO6fd2bZ6zKDRPl8Qfh0Adk4ApQ7+TsEc
   I5uEix3cK5hpxxZKezaeYbPj2GelQHDScys4AkSP+Rsnoe5GMoN4EF6CF
   X+uYr8NDw0dB3ZDku9lkm2lhEi6BReQDILNLoy9eJ/JqSMgZwCXTeCVi6
   1zq5ZDLYp8CkmpvFZIMUIdT538sqR37+tIiFpksgihe7mIJxhmTz2OWPP
   hAiYHJXI58i1PnCd50pi5wF6pF4wYPuUmSi4C3CDxEMfhluiuFL4oLCdG
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10973"; a="253713"
X-IronPort-AV: E=Sophos;i="6.05,242,1701158400"; 
   d="scan'208";a="253713"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Feb 2024 18:36:37 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,242,1701158400"; 
   d="scan'208";a="627557"
Received: from lkp-server02.sh.intel.com (HELO 59f4f4cd5935) ([10.239.97.151])
  by fmviesa008.fm.intel.com with ESMTP; 03 Feb 2024 18:36:34 -0800
Received: from kbuild by 59f4f4cd5935 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rWSMy-0005uS-18;
	Sun, 04 Feb 2024 02:36:32 +0000
Date: Sun, 4 Feb 2024 10:36:02 +0800
From: kernel test robot <lkp@intel.com>
To: Daniel Cashman <dcashman@google.com>
Cc: oe-kbuild-all@lists.linux.dev, Ulrich Hecht <uli@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>,
	Ben Hutchings <bwh@kernel.org>
Subject: [cip:linux-4.4.y-cip-rebase 1830/2766] include/linux/kasan.h:14:10:
 fatal error: asm/kasan.h: No such file or directory
Message-ID: <202402041032.z998S1g8-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/cip/linux-cip.git linux-4.4.y-cip-rebase
head:   a1ba69950787dfcb1e5268dc14233e12f2861076
commit: 4dfb37ff6229e10facb903c5aa2a1966b930facf [1830/2766] arm: mm: support ARCH_MMAP_RND_BITS
config: arm-randconfig-001-20240203 (https://download.01.org/0day-ci/archive/20240204/202402041032.z998S1g8-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240204/202402041032.z998S1g8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402041032.z998S1g8-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/nodemask.h:92:0,
                    from include/linux/mmzone.h:16,
                    from include/linux/gfp.h:5,
                    from include/linux/kmod.h:22,
                    from include/linux/module.h:13,
                    from drivers/mfd/tps6105x.c:16:
   include/linux/bitmap.h: In function 'bitmap_empty':
   include/linux/bitmap.h:300:36: warning: comparison between signed and unsigned integer expressions [-Wsign-compare]
     return find_first_bit(src, nbits) == nbits;
                                       ^~
   include/linux/bitmap.h: In function 'bitmap_full':
   include/linux/bitmap.h:308:41: warning: comparison between signed and unsigned integer expressions [-Wsign-compare]
     return find_first_zero_bit(src, nbits) == nbits;
                                            ^~
   In file included from include/linux/slab.h:107:0,
                    from drivers/mfd/tps6105x.c:22:
   include/linux/kasan.h: At top level:
>> include/linux/kasan.h:14:10: fatal error: asm/kasan.h: No such file or directory
    #include <asm/kasan.h>
             ^~~~~~~~~~~~~
   compilation terminated.
--
   In file included from include/linux/nodemask.h:92:0,
                    from include/linux/mmzone.h:16,
                    from include/linux/gfp.h:5,
                    from include/linux/kmod.h:22,
                    from include/linux/module.h:13,
                    from drivers/mfd/wm8350-i2c.c:16:
   include/linux/bitmap.h: In function 'bitmap_empty':
   include/linux/bitmap.h:300:36: warning: comparison between signed and unsigned integer expressions [-Wsign-compare]
     return find_first_bit(src, nbits) == nbits;
                                       ^~
   include/linux/bitmap.h: In function 'bitmap_full':
   include/linux/bitmap.h:308:41: warning: comparison between signed and unsigned integer expressions [-Wsign-compare]
     return find_first_zero_bit(src, nbits) == nbits;
                                            ^~
   In file included from include/linux/writeback.h:192:0,
                    from include/linux/memcontrol.h:30,
                    from include/linux/swap.h:8,
                    from include/linux/suspend.h:4,
                    from include/linux/regulator/machine.h:19,
                    from include/linux/mfd/wm8350/pmic.h:18,
                    from include/linux/mfd/wm8350/core.h:24,
                    from drivers/mfd/wm8350-i2c.c:22:
   include/linux/bio.h: In function 'bio_next_split':
   include/linux/bio.h:424:14: warning: comparison between signed and unsigned integer expressions [-Wsign-compare]
     if (sectors >= bio_sectors(bio))
                 ^~
   In file included from include/linux/slab.h:107:0,
                    from drivers/mfd/wm8350-i2c.c:24:
   include/linux/kasan.h: At top level:
>> include/linux/kasan.h:14:10: fatal error: asm/kasan.h: No such file or directory
    #include <asm/kasan.h>
             ^~~~~~~~~~~~~
   compilation terminated.


vim +14 include/linux/kasan.h

0b24becc810dc3 Andrey Ryabinin 2015-02-13  13  
0b24becc810dc3 Andrey Ryabinin 2015-02-13 @14  #include <asm/kasan.h>
69786cdb379bbc Andrey Ryabinin 2015-08-13  15  #include <asm/pgtable.h>
0b24becc810dc3 Andrey Ryabinin 2015-02-13  16  #include <linux/sched.h>
0b24becc810dc3 Andrey Ryabinin 2015-02-13  17  

:::::: The code at line 14 was first introduced by commit
:::::: 0b24becc810dc3be6e3f94103a866f214c282394 kasan: add kernel address sanitizer infrastructure

:::::: TO: Andrey Ryabinin <a.ryabinin@samsung.com>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
