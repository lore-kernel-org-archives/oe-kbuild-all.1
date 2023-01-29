Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89561182
	for <oe-kbuild-all@lists.linux.dev>; Sun, 29 Jan 2023 00:06:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674950761; x=1706486761;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=z1EdoqrhkZitbg+m6YNXzQvRScELmumh0YOlDPuVQT8=;
  b=Qu673kooMwOQmDzSQJ321YFQaWcvMNV26yjoRpTMWmk4/jboEGvzjXSn
   IbN8xpAn2Gof0TTZf4JTuPUkeqm/L4bq5QRQ68vILE8I3kePm8MVn3PVk
   bGcoJBeWV92I2h9R8o55djgbAHI2EVy5z0klCIPh2v2nF8PMkPJH3KcC7
   pEWI9vCm9YCuIBCncGNn4yx1KALFJNSzL75TBgl23Brg/5kOM20OxAU3J
   G1F2wyrvp59/8LYbkgXslc2zRFjj0F5VkwroBLSUULgPTjm98OTdAvUCK
   aIQVVDg2cq1GYqwJpF10n4ragzwT+McOXzVpBErzT41VcBotqglhiqL5u
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10604"; a="354660873"
X-IronPort-AV: E=Sophos;i="5.97,254,1669104000"; 
   d="scan'208";a="354660873"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jan 2023 16:06:00 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10604"; a="732266871"
X-IronPort-AV: E=Sophos;i="5.97,254,1669104000"; 
   d="scan'208";a="732266871"
Received: from lkp-server01.sh.intel.com (HELO ffa7f14d1d0f) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 28 Jan 2023 16:05:59 -0800
Received: from kbuild by ffa7f14d1d0f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pLvCo-0001FK-38;
	Sun, 29 Jan 2023 00:05:58 +0000
Date: Sun, 29 Jan 2023 08:05:28 +0800
From: kernel test robot <lkp@intel.com>
To: Mark Rutland <mark.rutland@arm.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	Catalin Marinas <catalin.marinas@arm.com>
Subject: [arm64:for-next/ftrace 2/9] (.text+0x800): multiple definition of
 `pcap_init'; arch/um/drivers/pcap_kern.o:pcap_kern.c:(.text+0x40): first
 defined here
Message-ID: <202301290725.8aJgJtiQ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git for-next/ftrace
head:   dc4824faa265db1bc93449e8ec386a0245404fa6
commit: c27cd083cfb9d392f304657ed00fcde1136704e7 [2/9] Compiler attributes: GCC cold function alignment workarounds
config: um-allyesconfig (https://download.01.org/0day-ci/archive/20230129/202301290725.8aJgJtiQ-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce (this is a W=1 build):
        # https://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git/commit/?id=c27cd083cfb9d392f304657ed00fcde1136704e7
        git remote add arm64 https://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git
        git fetch --no-tags arm64 for-next/ftrace
        git checkout c27cd083cfb9d392f304657ed00fcde1136704e7
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=um olddefconfig
        make W=1 O=build_dir ARCH=um SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   ld: /usr/lib/gcc/x86_64-linux-gnu/11/../../../x86_64-linux-gnu/libpcap.a(pcap.o): in function `pcap_init':
>> (.text+0x800): multiple definition of `pcap_init'; arch/um/drivers/pcap_kern.o:pcap_kern.c:(.text+0x40): first defined here

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
