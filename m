Received: from mgamail.intel.com (unknown [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B8494429
	for <oe-kbuild-all@lists.linux.dev>; Mon, 31 Jul 2023 13:06:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690808817; x=1722344817;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=dxI4YScDLo8YpeDgT4DDfRErG18F4mdrsXlfYWF5Ri0=;
  b=ej97X0aPZ1Ro8mQFiYey6ReFWvemO4rUJEHaMovQgz157VLybCZ6My+a
   6L7Lus8gKyTB5bCt/XDaUerA1YZhAhCLDcK+5QDisMxww1p4CSiYWFY+b
   iB7Tc+zW3RWcCTRnamLWj2ebfFz2PIJToUT3IruxYgciN4yYxh3TxrW4H
   kfQfGQANP+pZdl+Bv8Noh+rxpiH+PN8txnN12g6if7/lOygiSPdoxpabE
   u5r6uobFaSAf45MZgy3GyUVcUwhoZzxToSy3GVHr/VnJTtq2dORWotrLw
   VBpxgG5a6kCd6xWa1Y2EuI+xkdnlGnvR4ZAFP2MNcB7AFYAQnc+V2gah9
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10788"; a="366495605"
X-IronPort-AV: E=Sophos;i="6.01,244,1684825200"; 
   d="scan'208";a="366495605"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jul 2023 06:06:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10788"; a="678334713"
X-IronPort-AV: E=Sophos;i="6.01,244,1684825200"; 
   d="scan'208";a="678334713"
Received: from lkp-server02.sh.intel.com (HELO 953e8cd98f7d) ([10.239.97.151])
  by orsmga003.jf.intel.com with ESMTP; 31 Jul 2023 06:06:44 -0700
Received: from kbuild by 953e8cd98f7d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qQSbS-00057z-1S;
	Mon, 31 Jul 2023 13:06:29 +0000
Date: Mon, 31 Jul 2023 21:06:10 +0800
From: kernel test robot <lkp@intel.com>
To: LeoLiu-oc <LeoLiu-oc@zhaoxin.com>, olivia@selenic.com,
	herbert@gondor.apana.org.au, jiajie.ho@starfivetech.com,
	conor.dooley@microchip.com, martin@kaiser.cx, mmyangfl@gmail.com,
	jenny.zhang@starfivetech.com, linux-kernel@vger.kernel.org,
	linux-crypto@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, leoliu@zhaoxin.com, CobeChen@zhaoxin.com,
	YunShen@zhaoxin.com, TonyWWang@zhaoxin.com,
	leoliu-oc <leoliu-oc@zhaoxin.com>
Subject: Re: [PATCH v2 2/2] hwrng: add Zhaoxin HW RNG driver
Message-ID: <202307312040.d5kTGcBX-lkp@intel.com>
References: <20230731084515.2057375-3-LeoLiu-oc@zhaoxin.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230731084515.2057375-3-LeoLiu-oc@zhaoxin.com>

Hi LeoLiu-oc,

kernel test robot noticed the following build errors:

[auto build test ERROR on char-misc/char-misc-testing]
[also build test ERROR on char-misc/char-misc-next char-misc/char-misc-linus herbert-cryptodev-2.6/master linus/master v6.5-rc4 next-20230731]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/LeoLiu-oc/hwrng-via-rng-convert-to-x86_cpu_id-probing/20230731-164950
base:   char-misc/char-misc-testing
patch link:    https://lore.kernel.org/r/20230731084515.2057375-3-LeoLiu-oc%40zhaoxin.com
patch subject: [PATCH v2 2/2] hwrng: add Zhaoxin HW RNG driver
config: openrisc-randconfig-r003-20230731 (https://download.01.org/0day-ci/archive/20230731/202307312040.d5kTGcBX-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230731/202307312040.d5kTGcBX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307312040.d5kTGcBX-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/char/hw_random/zhaoxin-rng.c:16:10: fatal error: asm/cpu_device_id.h: No such file or directory
      16 | #include <asm/cpu_device_id.h>
         |          ^~~~~~~~~~~~~~~~~~~~~
   compilation terminated.


vim +16 drivers/char/hw_random/zhaoxin-rng.c

  > 16	#include <asm/cpu_device_id.h>
    17	#include <asm/fpu/api.h>
    18	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
