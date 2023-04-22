Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11B087F
	for <oe-kbuild-all@lists.linux.dev>; Sat, 22 Apr 2023 05:10:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1682140241; x=1713676241;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=vL+6lv6YpA47a5Sy4bqJ0e6cCGGH5T899ycUi9rc0l8=;
  b=MB2kg0V+4wdQKQlxuxQnk9irtzOOzsWw3AQXy4aZSxT4NWhwohILjTTY
   PH5M5iuKAxFnq/rkFU55gzZ0xWjfsO7ha3Q9ISlE2yneeLlfa7wIIeXn5
   pP+K5M7Xqsuc9uOy7d2rwNI1/DXmiZ3rrqLXPUxJ08CsM/xqQW5FHKRHa
   WdPvvs9i0cQxVYqZpOkqha5fxB5kLbrweq/9S/U8ogVIJGC69O/JFWVaR
   KBJurXqE3qdwqggAX6DqK88QhwHXdaOXVy0MghQivnSJgVPSdsV0qhhNq
   UsLhkDpqdNjdvwUiWCk++u/qa41VxmzSMfsXLmsni1icecfJQ7B4k7SbW
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10687"; a="325724906"
X-IronPort-AV: E=Sophos;i="5.99,216,1677571200"; 
   d="scan'208";a="325724906"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Apr 2023 22:10:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10687"; a="781814870"
X-IronPort-AV: E=Sophos;i="5.99,216,1677571200"; 
   d="scan'208";a="781814870"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 21 Apr 2023 22:10:36 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pq5W7-000h5a-11;
	Sat, 22 Apr 2023 05:10:35 +0000
Date: Sat, 22 Apr 2023 13:10:03 +0800
From: kernel test robot <lkp@intel.com>
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Florian Fainelli <f.fainelli@gmail.com>
Subject: [linux-next:master 12579/13717] qca8k-leds.c:(.rodata.cst4+0x2c):
 undefined reference to `devm_led_classdev_register_ext'
Message-ID: <202304221358.uhQrT8FL-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   d3e1ee0e67e7603d36f4fa2fec6b881c01aabe89
commit: 1e264f9d2918b5737023c44a23ae04def1095210 [12579/13717] net: dsa: qca8k: add LEDs basic support
config: parisc-randconfig-r004-20230421 (https://download.01.org/0day-ci/archive/20230422/202304221358.uhQrT8FL-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=1e264f9d2918b5737023c44a23ae04def1095210
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout 1e264f9d2918b5737023c44a23ae04def1095210
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=parisc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=parisc SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304221358.uhQrT8FL-lkp@intel.com/

All errors (new ones prefixed by >>):

   hppa-linux-ld: hppa-linux-ld: DWARF error: could not find abbrev number 3185
   drivers/net/dsa/qca/qca8k-leds.o: in function `.LC20':
>> qca8k-leds.c:(.rodata.cst4+0x2c): undefined reference to `devm_led_classdev_register_ext'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
