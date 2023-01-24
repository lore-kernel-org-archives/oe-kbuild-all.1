Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46F987E0
	for <oe-kbuild-all@lists.linux.dev>; Tue, 24 Jan 2023 00:19:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674519571; x=1706055571;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=scAk4tReoetpK63O7SiAEqfpx7ahJ+7uqiXO6jvqYgQ=;
  b=RUhY0w+kBf9TwuVqTp5fgwQYm8lnPD2e0GgfUaYUkfIzdKovPaCZwkvb
   QcXiMu8Z8dfZR8dB0mYHBK5df18YrL69hHSmskDGXnOLu0ryQy6/5QhZe
   /CTWWK+5cbIZ0olIC07KEDPgk/Uw90CaQGnLvC5hL2hJ6WFKn14eXrhli
   lPYUHVlClY+jf9aZ0qIpvKw6TsHWRxGGIaosQyxHqOa4c2zQZ91GqP5Ho
   zEr02yU8qMoozteiX2mij1RzgnlMSgoj1cNHy8k8trUPOvgkEVQUaa2BV
   jCZzvPBxlCx9h5NQgtGRTH9fpu1SRTlkBaZpSA7+Lc+4V3g4lrYvMEuo8
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10599"; a="353468206"
X-IronPort-AV: E=Sophos;i="5.97,240,1669104000"; 
   d="scan'208";a="353468206"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jan 2023 16:19:30 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10599"; a="694143857"
X-IronPort-AV: E=Sophos;i="5.97,240,1669104000"; 
   d="scan'208";a="694143857"
Received: from lkp-server01.sh.intel.com (HELO 5646d64e7320) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 23 Jan 2023 16:19:29 -0800
Received: from kbuild by 5646d64e7320 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pK728-0005yY-0b;
	Tue, 24 Jan 2023 00:19:28 +0000
Date: Tue, 24 Jan 2023 08:19:13 +0800
From: kernel test robot <lkp@intel.com>
To: Moudy Ho <moudy.ho@mediatek.com>
Cc: oe-kbuild-all@lists.linux.dev, Hans Verkuil <hverkuil@xs4all.nl>
Subject: [hverkuil-media-tree:for-v6.3c 1/13] ERROR: modpost: "__udivdi3"
 [drivers/media/platform/mediatek/mdp3/mtk-mdp3.ko] undefined!
Message-ID: <202301240846.qpuGj2l1-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://linuxtv.org/hverkuil/media_tree.git for-v6.3c
head:   925b929d27923da7bdf3cad91a2ab759f0abc9ef
commit: f385660f6ddb7ec737797aea6f7c56e9870b6bf1 [1/13] media: platform: mtk-mdp3: fix potential frame size overflow in mdp_try_fmt_mplane()
config: powerpc-allmodconfig (https://download.01.org/0day-ci/archive/20230124/202301240846.qpuGj2l1-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        git remote add hverkuil-media-tree git://linuxtv.org/hverkuil/media_tree.git
        git fetch --no-tags hverkuil-media-tree for-v6.3c
        git checkout f385660f6ddb7ec737797aea6f7c56e9870b6bf1
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=powerpc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=powerpc SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "__udivdi3" [drivers/media/platform/mediatek/mdp3/mtk-mdp3.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
