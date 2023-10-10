Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED8A52FE2A
	for <oe-kbuild-all@lists.linux.dev>; Tue, 10 Oct 2023 17:20:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VX2sjkWI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696958445; x=1728494445;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=/+Mfrapl/++Abw7OhBV5GXIN1QFhxGHIvpLOCgh9mrk=;
  b=VX2sjkWI9OmSh3Mbci2CDdxFl49hz3LvkL2tG92sRjsQdQ3ZOUl4rprR
   a6fqCSKBRuoDkBQHzxyulCvrJv60/JVg1YentdSbkwbLjUlqH+XQ1qCe2
   cyN3vlbk6R1EJ6jDXCOTMemeFP8j/Hr66f+Zf+h1QgL19MBdCvYe3xmaS
   xgfp/SZQq+C/9/6SzXXUuNCCdQlArRIHEVZfhRtuzPX3/yasQqxs+89ab
   Q+LOcYs7dt4BwKj5pDRvTQwVkMqtvaUP3NNcwVAe9vuBwzFEvS5ThfdOQ
   NSX/z5ysjZa2Sy++QLyFfou1/jcA0E1zj5ckwGlMQEoeRKblRnICVtdwo
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10859"; a="363810608"
X-IronPort-AV: E=Sophos;i="6.03,213,1694761200"; 
   d="scan'208";a="363810608"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Oct 2023 10:20:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10859"; a="823857872"
X-IronPort-AV: E=Sophos;i="6.03,213,1694761200"; 
   d="scan'208";a="823857872"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by fmsmga004.fm.intel.com with ESMTP; 10 Oct 2023 10:20:40 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qqGPM-0000ou-2Y;
	Tue, 10 Oct 2023 17:20:37 +0000
Date: Wed, 11 Oct 2023 01:20:12 +0800
From: kernel test robot <lkp@intel.com>
To: Duje =?utf-8?Q?Mihanovi=C4=87?= <duje.mihanovic@skole.hr>,
	Lee Jones <lee@kernel.org>,
	Daniel Thompson <daniel.thompson@linaro.org>,
	Jingoo Han <jingoohan1@gmail.com>, Pavel Machek <pavel@ucw.cz>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Helge Deller <deller@gmx.de>
Cc: oe-kbuild-all@lists.linux.dev, Karel Balej <balejk@matfyz.cz>,
	dri-devel@lists.freedesktop.org, linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-fbdev@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
	Duje =?utf-8?Q?Mihanovi=C4=87?= <duje.mihanovic@skole.hr>
Subject: Re: [PATCH 2/2] backlight: Add Kinetic KTD2801 driver
Message-ID: <202310110122.Syu9oJQI-lkp@intel.com>
References: <20231005-ktd2801-v1-2-43cd85b0629a@skole.hr>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231005-ktd2801-v1-2-43cd85b0629a@skole.hr>

Hi Duje,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 8a749fd1a8720d4619c91c8b6e7528c0a355c0aa]

url:    https://github.com/intel-lab-lkp/linux/commits/Duje-Mihanovi/dt-bindings-backlight-add-Kinetic-KTD2801-binding/20231006-025106
base:   8a749fd1a8720d4619c91c8b6e7528c0a355c0aa
patch link:    https://lore.kernel.org/r/20231005-ktd2801-v1-2-43cd85b0629a%40skole.hr
patch subject: [PATCH 2/2] backlight: Add Kinetic KTD2801 driver
config: i386-allyesconfig (https://download.01.org/0day-ci/archive/20231011/202310110122.Syu9oJQI-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231011/202310110122.Syu9oJQI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310110122.Syu9oJQI-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/video/backlight/ktd2801-backlight.c:15: warning: "DS" redefined
      15 | #define DS              5
         | 
   In file included from arch/x86/include/uapi/asm/ptrace.h:6,
                    from arch/x86/include/asm/ptrace.h:7,
                    from arch/x86/include/asm/math_emu.h:5,
                    from arch/x86/include/asm/processor.h:13,
                    from arch/x86/include/asm/cpufeature.h:5,
                    from arch/x86/include/asm/thread_info.h:53,
                    from include/linux/thread_info.h:60,
                    from arch/x86/include/asm/preempt.h:9,
                    from include/linux/preempt.h:79,
                    from include/linux/rcupdate.h:27,
                    from include/linux/rculist.h:11,
                    from include/linux/pid.h:5,
                    from include/linux/sched.h:14,
                    from include/linux/ratelimit.h:6,
                    from include/linux/dev_printk.h:16,
                    from include/linux/device.h:15,
                    from include/linux/backlight.h:12,
                    from drivers/video/backlight/ktd2801-backlight.c:2:
   arch/x86/include/uapi/asm/ptrace-abi.h:14: note: this is the location of the previous definition
      14 | #define DS 7
         | 


vim +/DS +15 drivers/video/backlight/ktd2801-backlight.c

     8	
     9	#define EW_DELAY	150
    10	#define EW_DET		270
    11	#define LOW_BIT_HIGH	5
    12	#define LOW_BIT_LOW	(4 * HIGH_BIT_LOW)
    13	#define HIGH_BIT_LOW	5
    14	#define HIGH_BIT_HIGH	(4 * HIGH_BIT_LOW)
  > 15	#define DS		5
    16	#define EOD_L		10
    17	#define EOD_H		350
    18	#define PWR_DOWN_DELAY	2600
    19	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
