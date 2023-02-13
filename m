Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C018F33D1
	for <oe-kbuild-all@lists.linux.dev>; Mon, 13 Feb 2023 12:56:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676292979; x=1707828979;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=9kG7ury7/mZzMTthrsYY8I0tqsygiO2bVkhqB1wzY64=;
  b=YLd6vLuwy586M7k8t8cxTzfWXCpRJlQGIt1D/A/Qcanj4wchcmbFyMwF
   SM8Xq3Mq7dHcv2OkdH5zWQjFuwmlGtT+LoZvZstSvMKT/Yh6hAA/2SfSh
   8QoTY28H3aZpi2S4bCCNJT4Fd3jAKJanvWkYiVohXJX3X+aIsLtqP3mA+
   XBruuq1py7p3PrePl1Qpv+w77RUE91EXbgtTpoi7KzlgxLSQgkE4hZrvu
   bKP1u1ksEr6+QhLr7SQbZioEY3nRBEV6rs03q//ToVAvaGYSv2YP7Hvd2
   gm+SSApZN1XobiYYpA4WTMIU2mx1ZXEjWpz5iCNOEzPtOddHnLXktoeMi
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10619"; a="314524755"
X-IronPort-AV: E=Sophos;i="5.97,294,1669104000"; 
   d="scan'208";a="314524755"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Feb 2023 04:56:19 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10619"; a="757569445"
X-IronPort-AV: E=Sophos;i="5.97,294,1669104000"; 
   d="scan'208";a="757569445"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 13 Feb 2023 04:56:18 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pRYNV-0007kH-0e;
	Mon, 13 Feb 2023 12:56:17 +0000
Date: Mon, 13 Feb 2023 20:56:07 +0800
From: kernel test robot <lkp@intel.com>
To: Ben Skeggs <bskeggs@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [skeggsb-nouveau:01.03-gsp-ada 185/193] ERROR: modpost:
 "__aeabi_uldivmod" [drivers/gpu/drm/nouveau/nouveau.ko] undefined!
Message-ID: <202302132014.s00Hsu59-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitlab.freedesktop.org/skeggsb/nouveau 01.03-gsp-ada
head:   ab3448c2873e0fbcf1fd710cccb52dc548bdf449
commit: c24815755c5c79d50fa9370ec1124fedd29743bb [185/193] disp
config: arm-randconfig-r025-20230212 (https://download.01.org/0day-ci/archive/20230213/202302132014.s00Hsu59-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        git remote add skeggsb-nouveau https://gitlab.freedesktop.org/skeggsb/nouveau
        git fetch --no-tags skeggsb-nouveau 01.03-gsp-ada
        git checkout c24815755c5c79d50fa9370ec1124fedd29743bb
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302132014.s00Hsu59-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "__aeabi_uldivmod" [drivers/gpu/drm/nouveau/nouveau.ko] undefined!
>> ERROR: modpost: "__aeabi_ldivmod" [drivers/gpu/drm/nouveau/nouveau.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
