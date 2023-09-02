Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDAE815A5
	for <oe-kbuild-all@lists.linux.dev>; Sat,  2 Sep 2023 01:14:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693617243; x=1725153243;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=l5+o5wevSDg+Y+TjthufhRBUgcSDLhrM3DoNXkcdNRI=;
  b=XTl/BJyOv+2poDR98bGFH3EMRyAHm6DjiioVvU7bHa6dfm96I6Jys/O5
   CqPkASWkhAromISxxT2c7fE7Ysp0+yF6RfT7iBdzbt5qjHoN5QNB+2ZLq
   Rcx2IZvm4RLFvjrsn5wsuJOQHEsyS1DfRbOJx/9R0CQ8p6PrH3Y7QZ7Om
   rIVilqMvwhPX97vOYva8wxCVy+LsmxNDMTA9anAkUkTFpHQp4DKLNu1NL
   FJmp6FZYy+hwPSHnV8/i3mHAAOVXhaLmBDIBxJNj8E8Q6tZi0alXC+kO8
   DrGJc/pGlOU2jNM6W6ZWqfVRm6ZhAVXfQJrgptsWqvMc0cBzRf5ZqM+AU
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10819"; a="380127195"
X-IronPort-AV: E=Sophos;i="6.02,221,1688454000"; 
   d="scan'208";a="380127195"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Sep 2023 18:14:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10819"; a="689947213"
X-IronPort-AV: E=Sophos;i="6.02,221,1688454000"; 
   d="scan'208";a="689947213"
Received: from lkp-server01.sh.intel.com (HELO 5d8055a4f6aa) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 01 Sep 2023 18:14:01 -0700
Received: from kbuild by 5d8055a4f6aa with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qcFD5-0001oh-0r;
	Sat, 02 Sep 2023 01:13:59 +0000
Date: Sat, 2 Sep 2023 09:13:13 +0800
From: kernel test robot <lkp@intel.com>
To: Andi Kleen <ak@linux.intel.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
Subject: [intel-tdx:guest 97/136] arch/x86/include/asm/paravirt.h:120:38:
 sparse: sparse: cast truncates bits from constant value (c000000000000000
 becomes 0)
Message-ID: <202309020935.Rbazprcl-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/intel/tdx.git guest
head:   f3d7a7e86bf2f0d5ce629f2fb7be11dca88ac06d
commit: c34bfda30e18342b8ae7856fd59b76e9ca938460 [97/136] x86/tdx/paravirt: Move wrmsrl outside PARAVIRT_XXL
config: i386-randconfig-061-20230902 (https://download.01.org/0day-ci/archive/20230902/202309020935.Rbazprcl-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230902/202309020935.Rbazprcl-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309020935.Rbazprcl-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   drivers/hv/vmbus_drv.c: note: in included file (through arch/x86/include/asm/msr.h, arch/x86/include/asm/processor.h, arch/x86/include/asm/timex.h, ...):
>> arch/x86/include/asm/paravirt.h:120:38: sparse: sparse: cast truncates bits from constant value (c000000000000000 becomes 0)

vim +120 arch/x86/include/asm/paravirt.h

   117	
   118	static inline void wrmsrl(unsigned msr, u64 val)
   119	{
 > 120		paravirt_write_msr(msr, (u32)val, (u32)(val>>32));
   121	}
   122	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
