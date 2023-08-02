Received: from mgamail.intel.com (unknown [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AED50373
	for <oe-kbuild-all@lists.linux.dev>; Wed,  2 Aug 2023 06:38:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690958297; x=1722494297;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=5ZpeJe8VE8xWQCLk+NZZ2GiPiKqjdb6St86NZ8p68i4=;
  b=SEUYeQXkAC5Upd2cH6wX1/gG8Pm1Uc5RUlUN2HHpAwF01NwSaZcOo4j2
   pT5KPMX+OgRjTOYSkifcH+SvsPCXAVPv++gfV2ofduiWIIr1Mor5qDLRW
   enarVEvBKW3Wrbim8ivzDCUrTbnYZEMo1f2yuJ3vjwYIeh6gWcs5KmAek
   8Q5L6jZ/uWSR74IAh8gnHXp8x8HMvMKRC7azh02+nvNajySFtm4uOyfcF
   kPqnCijFrm+mgEW7+rlfKUP98h/aIYk+UgtquTUHiLuZpET9/N8ZuG3wr
   CtjQs19T58pXNPtzn5E0hhPBSP2A3jtSiEIG5lMb1AbckYG6BE3MUfAbz
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10789"; a="373138916"
X-IronPort-AV: E=Sophos;i="6.01,248,1684825200"; 
   d="scan'208";a="373138916"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Aug 2023 23:38:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10789"; a="732262511"
X-IronPort-AV: E=Sophos;i="6.01,248,1684825200"; 
   d="scan'208";a="732262511"
Received: from lkp-server01.sh.intel.com (HELO d1ccc7e87e8f) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 01 Aug 2023 23:38:15 -0700
Received: from kbuild by d1ccc7e87e8f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qR5Us-0000xB-2e;
	Wed, 02 Aug 2023 06:38:14 +0000
Date: Wed, 2 Aug 2023 14:37:35 +0800
From: kernel test robot <lkp@intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: oe-kbuild-all@lists.linux.dev, Ard Biesheuvel <ardb@kernel.org>
Subject: [ardb:x86-efistub-cleanup-v8 6/29] ld: Unexpected run-time
 relocations (.rel) detected!
Message-ID: <202308021435.0ghnXo2R-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/ardb/linux.git x86-efistub-cleanup-v8
head:   86807fc227c90cc8e913a805c348a24707aeea37
commit: a86d2ae3d18320a4655e540999ece8325c70702f [6/29] x86/boot: Introduce MMIO accessors and their support in earlyprintk
config: i386-buildonly-randconfig-r006-20230731 (https://download.01.org/0day-ci/archive/20230802/202308021435.0ghnXo2R-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230802/202308021435.0ghnXo2R-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308021435.0ghnXo2R-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: Unexpected GOT/PLT entries detected!
   ld: Unexpected run-time procedure linkages detected!
>> ld: Unexpected run-time relocations (.rel) detected!
   ld: arch/x86/boot/compressed/early_serial_console.o: in function `mem8_serial_out':
   early_serial_console.c:(.text+0x125): undefined reference to `writeb'
   ld: arch/x86/boot/compressed/early_serial_console.o: in function `mem8_serial_in':
   early_serial_console.c:(.text+0x149): undefined reference to `readb'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
