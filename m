Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4689CA31
	for <oe-kbuild-all@lists.linux.dev>; Tue, 24 Jan 2023 03:03:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674529416; x=1706065416;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ACQUZuNdviAecT8GT36VzNSI2K6ANFhXe0EWrS1GW24=;
  b=UhaJQnXBX1gPw/+hVWrzVDHk+ggvSTO4qYfGavt2mBvqVXkHdMgbHqld
   Z3WkuPU6l4vll6SoTaJGn6Qh5deLpJzcV3tIWfoz8yqmgZxg/G959Fmy2
   pbW5sKhzDPTECkTmhCj3BMjvLVcDhok/n+u8g+hFQpPLwjaYeIpTAF96c
   Ej4eq68TOW0Lj7YIkeRcu5yYo5o6iRXVDBPqeP97kN4+SMXZlUp+WFTsJ
   aircM37HEFVpmeCZzv762fx4OuPZthauWHGIaSCprRC0qUUdcF6iC98rT
   damz1dk9VJoch/IbYvJ8ykzV8Ep0szSBzS1EaB6s4F96l5Q5t+HonaLIu
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10599"; a="305882248"
X-IronPort-AV: E=Sophos;i="5.97,241,1669104000"; 
   d="scan'208";a="305882248"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jan 2023 19:03:35 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10599"; a="663913656"
X-IronPort-AV: E=Sophos;i="5.97,241,1669104000"; 
   d="scan'208";a="663913656"
Received: from lkp-server01.sh.intel.com (HELO 5646d64e7320) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 23 Jan 2023 19:03:34 -0800
Received: from kbuild by 5646d64e7320 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pK9aw-00064c-09;
	Tue, 24 Jan 2023 03:03:34 +0000
Date: Tue, 24 Jan 2023 11:02:39 +0800
From: kernel test robot <lkp@intel.com>
To: Moudy Ho <moudy.ho@mediatek.com>
Cc: oe-kbuild-all@lists.linux.dev, Hans Verkuil <hverkuil@xs4all.nl>
Subject: [hverkuil-media-tree:for-v6.3c 1/13] mtk-mdp3-regs.c:undefined
 reference to `__udivdi3'
Message-ID: <202301241045.kEvM30dp-lkp@intel.com>
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
config: m68k-allyesconfig (https://download.01.org/0day-ci/archive/20230124/202301241045.kEvM30dp-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        git remote add hverkuil-media-tree git://linuxtv.org/hverkuil/media_tree.git
        git fetch --no-tags hverkuil-media-tree for-v6.3c
        git checkout f385660f6ddb7ec737797aea6f7c56e9870b6bf1
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=m68k olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=m68k SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   m68k-linux-ld: drivers/media/platform/mediatek/mdp3/mtk-mdp3-regs.o: in function `mdp_try_fmt_mplane':
>> mtk-mdp3-regs.c:(.text+0x680): undefined reference to `__udivdi3'
>> m68k-linux-ld: mtk-mdp3-regs.c:(.text+0x6b8): undefined reference to `__udivdi3'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
