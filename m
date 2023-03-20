Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 841901850
	for <oe-kbuild-all@lists.linux.dev>; Mon, 20 Mar 2023 12:43:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679316224; x=1710852224;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=uxs1ZLsREjQXcb6c3+QtQxdUNuiPzjErwrIrKaXkkKo=;
  b=BWkHRPHqQQ6QpLS55CiAwdiz+QJ9LHCWYqY4MjTy6hv3zeCTtWgVf8XV
   wEQqOVMrHdWoy1KhEIy9ZymoAaJfFCyqcDLKWQhwRWkocNNylbXcxxV5b
   2PK+XMtRpmrSQx5QfXU3js2nSxSvIM39LSdU0bRZ9khAgaWhy3nLT+fjT
   KcjRXJs05EoDBuVcCpqK3Y+fNHRr8lNItgbNSo3yPykttnbqr0LNoFOTO
   QXMWk2/Ntc6O2dxcFvCAXkazqYVzk1b/0kJ5++kC2S2Tn+l3D3MyDNJYe
   IKs4NFVHJD0Fa7zBVeGjYJ2bmqY4jKGJokaTzyUtYh193ehLQRJO3ONO9
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10654"; a="319050319"
X-IronPort-AV: E=Sophos;i="5.98,274,1673942400"; 
   d="scan'208";a="319050319"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Mar 2023 05:43:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10654"; a="804886761"
X-IronPort-AV: E=Sophos;i="5.98,274,1673942400"; 
   d="scan'208";a="804886761"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 20 Mar 2023 05:43:43 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1peErW-000B2U-0k;
	Mon, 20 Mar 2023 12:43:42 +0000
Date: Mon, 20 Mar 2023 20:43:07 +0800
From: kernel test robot <lkp@intel.com>
To: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v4 5/7] arm64: dts: mediatek: mt8186: Add audio
 controller node
Message-ID: <202303202055.xGBaGZC5-lkp@intel.com>
References: <20230317060917.15175-6-allen-kh.cheng@mediatek.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230317060917.15175-6-allen-kh.cheng@mediatek.com>

Hi Allen-KH,

Thank you for the patch! Yet something to improve:

[auto build test ERROR on robh/for-next]
[also build test ERROR on krzk/for-next krzk-dt/for-next linus/master v6.3-rc3 next-20230320]
[cannot apply to mbgg-mediatek/for-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Allen-KH-Cheng/arm64-dts-mediatek-mt8186-Add-MTU3-nodes/20230317-141054
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/20230317060917.15175-6-allen-kh.cheng%40mediatek.com
patch subject: [PATCH v4 5/7] arm64: dts: mediatek: mt8186: Add audio controller node
config: arm64-randconfig-c041-20230319 (https://download.01.org/0day-ci/archive/20230320/202303202055.xGBaGZC5-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/8ead2e1b974415f4013e7b45e3f010025e7c097d
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Allen-KH-Cheng/arm64-dts-mediatek-mt8186-Add-MTU3-nodes/20230317-141054
        git checkout 8ead2e1b974415f4013e7b45e3f010025e7c097d
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm64 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303202055.xGBaGZC5-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/arm64/boot/dts/mediatek/mt8186.dtsi:1049.34-1109.5: ERROR (duplicate_node_names): /soc/audio-controller@11210000: Duplicate node name
>> ERROR: Input tree has errors, aborting (use -f to force output)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
