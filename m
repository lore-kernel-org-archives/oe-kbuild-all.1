Received: from mgamail.intel.com (unknown [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AB615396
	for <oe-kbuild-all@lists.linux.dev>; Wed,  2 Aug 2023 08:43:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690965803; x=1722501803;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=8ynOVcqfYK4A/zu7FErwBJQKOn/xwTcneaEtI+8MDWg=;
  b=dwK0qvx9+ZGTCDeOeH05yhrbL/118sXFYeWFRw2m8zu+cnqRSubBfLHZ
   k+jEHv9sV7RpPTVx4IytBJXhIx/RyIAKOz2u0bD+BaP4XlaOmEsgBep8M
   N+YNq+gTbS8icCw/ElhPVlKM77sokXf/MnR0kFI9Y7wYi/S6kxIhaqdqz
   mOZRRFWx7i/K6AG3Kg3ba50tk93wcxFwitepZWGUiWccvmGURPwQrQK7p
   q5c5qbB4Jk20P71VlC4L52xyU+55oj8njzfen42DJaNuUsejGYrMiKZIO
   0K7smtpgYE70DV9Il9zllbNPNA0U0YgIOVByLex6Z3GGq7Rw0hE2OO/IC
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10789"; a="368419482"
X-IronPort-AV: E=Sophos;i="6.01,248,1684825200"; 
   d="scan'208";a="368419482"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Aug 2023 01:43:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10789"; a="758666481"
X-IronPort-AV: E=Sophos;i="6.01,248,1684825200"; 
   d="scan'208";a="758666481"
Received: from lkp-server01.sh.intel.com (HELO d1ccc7e87e8f) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 02 Aug 2023 01:43:21 -0700
Received: from kbuild by d1ccc7e87e8f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qR7Rw-00013P-1H;
	Wed, 02 Aug 2023 08:43:20 +0000
Date: Wed, 2 Aug 2023 16:42:37 +0800
From: kernel test robot <lkp@intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: oe-kbuild-all@lists.linux.dev, Ard Biesheuvel <ardb@kernel.org>
Subject: [ardb:x86-efistub-cleanup-v8 6/29] early_serial_console.c:undefined
 reference to `writeb'
Message-ID: <202308021600.08M88Wko-lkp@intel.com>
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
config: x86_64-buildonly-randconfig-r001-20230731 (https://download.01.org/0day-ci/archive/20230802/202308021600.08M88Wko-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230802/202308021600.08M88Wko-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308021600.08M88Wko-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from arch/x86/boot/compressed/early_serial_console.c:9:
   arch/x86/boot/compressed/../early_serial_console.c: In function 'mem8_serial_out':
>> arch/x86/boot/compressed/../early_serial_console.c:40:9: warning: implicit declaration of function 'writeb' [-Wimplicit-function-declaration]
      40 |         writeb(value, vaddr + offset);
         |         ^~~~~~
   arch/x86/boot/compressed/../early_serial_console.c: In function 'mem8_serial_in':
>> arch/x86/boot/compressed/../early_serial_console.c:47:16: warning: implicit declaration of function 'readb' [-Wimplicit-function-declaration]
      47 |         return readb(vaddr + offset);
         |                ^~~~~
--
>> ld: Unexpected GOT/PLT entries detected!
>> ld: Unexpected run-time procedure linkages detected!
>> ld: Unexpected run-time relocations (.rela) detected!
   ld: arch/x86/boot/compressed/early_serial_console.o: in function `mem8_serial_out':
>> early_serial_console.c:(.text+0xfe): undefined reference to `writeb'
   ld: arch/x86/boot/compressed/early_serial_console.o: in function `mem8_serial_in':
>> early_serial_console.c:(.text+0x119): undefined reference to `readb'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
