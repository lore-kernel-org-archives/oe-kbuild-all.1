Received: from mgamail.intel.com (unknown [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C8591426B
	for <oe-kbuild-all@lists.linux.dev>; Mon, 31 Jul 2023 10:22:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690798966; x=1722334966;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=PCMtkKQspwiJhUzhgqFCwoHLXmi/Ay0Pc3VA0Pbub2g=;
  b=b//bKHdppwjwET114RhPM0UGp0iFBB6PQ8gzvIHk6ZuTbViSuCNIqe+H
   05SIM04OdmnbZLKtAQmW4+W2GPSYwc4sTU9HmOgAGT0WVxblqoZJ+1LHx
   5Ugs18wMG3ttU1ePbJKq4onte1wlE1KlWyoiDZcV3psseumdmZX0IMu3V
   k5yglXMyVWRqZCH5JSbNeTqH+vXxSSRDBB/q5GD1/qngebeuBi5qoE+J+
   TmB6BOFM2cLsCnNmC3OlKoBNrg/m7WI56TNtZgzpdFU0rbWYyHxahOyDl
   5F6MqNLI88J2xStYpc7QMaRvs/j+ql4/5pv3J0vandTPVJWuR1SJuJBMx
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10787"; a="349283043"
X-IronPort-AV: E=Sophos;i="6.01,244,1684825200"; 
   d="scan'208";a="349283043"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jul 2023 03:22:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10787"; a="722013538"
X-IronPort-AV: E=Sophos;i="6.01,244,1684825200"; 
   d="scan'208";a="722013538"
Received: from lkp-server02.sh.intel.com (HELO 953e8cd98f7d) ([10.239.97.151])
  by orsmga007.jf.intel.com with ESMTP; 31 Jul 2023 03:22:35 -0700
Received: from kbuild by 953e8cd98f7d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qQQ2s-00053j-1g;
	Mon, 31 Jul 2023 10:22:34 +0000
Date: Mon, 31 Jul 2023 18:22:12 +0800
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
Message-ID: <202307311838.VQTSuKH4-lkp@intel.com>
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

kernel test robot noticed the following build warnings:

[auto build test WARNING on char-misc/char-misc-testing]
[also build test WARNING on char-misc/char-misc-next char-misc/char-misc-linus herbert-cryptodev-2.6/master linus/master v6.5-rc4 next-20230731]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/LeoLiu-oc/hwrng-via-rng-convert-to-x86_cpu_id-probing/20230731-164950
base:   char-misc/char-misc-testing
patch link:    https://lore.kernel.org/r/20230731084515.2057375-3-LeoLiu-oc%40zhaoxin.com
patch subject: [PATCH v2 2/2] hwrng: add Zhaoxin HW RNG driver
config: loongarch-allyesconfig (https://download.01.org/0day-ci/archive/20230731/202307311838.VQTSuKH4-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230731/202307311838.VQTSuKH4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307311838.VQTSuKH4-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from arch/loongarch/include/asm/inst.h:10,
                    from arch/loongarch/include/asm/uprobes.h:5,
                    from include/linux/uprobes.h:49,
                    from include/linux/mm_types.h:16,
                    from include/linux/buildid.h:5,
                    from include/linux/module.h:14,
                    from drivers/char/hw_random/zhaoxin-rng.c:10:
>> arch/loongarch/include/asm/asm.h:35: warning: "STACK_ALIGN" redefined
      35 | #define STACK_ALIGN     ~(0xf)
         | 
   In file included from drivers/char/hw_random/zhaoxin-rng.c:9:
   include/crypto/padlock.h:19: note: this is the location of the previous definition
      19 | #define STACK_ALIGN 16
         | 
   drivers/char/hw_random/zhaoxin-rng.c:16:10: fatal error: asm/cpu_device_id.h: No such file or directory
      16 | #include <asm/cpu_device_id.h>
         |          ^~~~~~~~~~~~~~~~~~~~~
   compilation terminated.


vim +/STACK_ALIGN +35 arch/loongarch/include/asm/asm.h

b738c106f7355e Huacai Chen 2022-05-31  31  
b738c106f7355e Huacai Chen 2022-05-31  32  /*
b738c106f7355e Huacai Chen 2022-05-31  33   * Stack alignment
b738c106f7355e Huacai Chen 2022-05-31  34   */
b738c106f7355e Huacai Chen 2022-05-31 @35  #define STACK_ALIGN	~(0xf)
b738c106f7355e Huacai Chen 2022-05-31  36  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
