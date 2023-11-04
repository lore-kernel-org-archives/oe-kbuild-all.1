Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85FF58C11
	for <oe-kbuild-all@lists.linux.dev>; Sat,  4 Nov 2023 07:28:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="P/rqtkwH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699082904; x=1730618904;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=mg5ayO+YrFp0D3kb75dnACoXUH/wU0y6Ek7Dnfuzvj0=;
  b=P/rqtkwHjYzIQVY0xhDapYnLjxdT+k/7+MR2a2UqzzjLDUq9WIFENMHI
   q5ss9X1RtenFBnAO/ecDCgJdUxcXfM/GgCgK52P44GZaSmEJ9PRa5d5d9
   MfE0H3ZM6+KF4lyFm0BZ5e+Ol8+odwip82OE0ls6A0qVaxcpBwBwNpp5j
   6CVWHvYCKGZE3B1RghdekMXgmWxR8+7YZKnOQah32xiUIuPHRxtHZ4UKO
   8NvLvcOD0rCU4IsENzq+4UiATHhkKO8dAQ+Ugmhn3u+f+0hqZBnMeQsXc
   6HixcuF/UZfxY8qGEcxDqf24XiRH8f+mn8pBm/W6AiEumkXk6QXJRRHit
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10883"; a="1955042"
X-IronPort-AV: E=Sophos;i="6.03,276,1694761200"; 
   d="scan'208";a="1955042"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2023 00:28:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,276,1694761200"; 
   d="scan'208";a="9604146"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 04 Nov 2023 00:28:18 -0700
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qzB4p-0003d2-02;
	Sat, 04 Nov 2023 07:28:15 +0000
Date: Sat, 4 Nov 2023 15:27:16 +0800
From: kernel test robot <lkp@intel.com>
To: Milan Broz <gmazyland@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [mbroz:opal-test 3/6] drivers/usb/storage/usual-tables.c:18:10:
 fatal error: usb-ids.c: No such file or directory
Message-ID: <202311041507.AOYwj5tK-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mbroz/linux.git opal-test
head:   6c5f27462ce89488c748a3a456b9656058396c9d
commit: 739034f7a933dcd8689721e5996b05d78ae6f256 [3/6] usb-storage,uas: use host helper to generate driver info
config: m68k-allyesconfig (https://download.01.org/0day-ci/archive/20231104/202311041507.AOYwj5tK-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231104/202311041507.AOYwj5tK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311041507.AOYwj5tK-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/usb/storage/usual-tables.c:18:10: fatal error: usb-ids.c: No such file or directory
      18 | #include "usb-ids.c"
         |          ^~~~~~~~~~~
   compilation terminated.
--
>> drivers/usb/storage/uas.c:34:10: fatal error: usb-ids-uas.c: No such file or directory
      34 | #include "usb-ids-uas.c"
         |          ^~~~~~~~~~~~~~~
   compilation terminated.


vim +18 drivers/usb/storage/usual-tables.c

    13	
    14	
    15	/*
    16	 * The table of devices is pre-generated in usb-ids.c
    17	 */
  > 18	#include "usb-ids.c"
    19	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
