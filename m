Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 334E26FBB
	for <oe-kbuild-all@lists.linux.dev>; Wed, 14 Jun 2023 13:05:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686747956; x=1718283956;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=gNR1CGlybaW16+0ie8Xomo54V9jN8wtg2oFB0nLPehs=;
  b=HsL6BJmEygj/saFee2dXQmwr5kH5v0EGT2bBQn51kXP7uNHw4Reh5lVN
   li1hroy9eJpbCYPUeYLfMXnUeFhIcdkMyXD1dqBaUfInXVh+nM/J/ZdNd
   KMTffoJMxtzdXTbjHDnjq4XTw3Bsw30y4cdulguule5EHhy4hYtLpDYet
   6nLaggiH+sQGyVAnILBpSEs4F9zAVuw7nEUwOlzz9Hrv0rOOj5vrvUqQz
   twFSkhuOrOG2jzcIULxjIGDEVjCoUL87iQGor5u3ccaFxW29j82IzhwU4
   j7aIWGxSknXOTKQAhhPrpn3rKe79G7wG+Ih49vVsSa3j4lmuEqk3QvHSe
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10741"; a="343301574"
X-IronPort-AV: E=Sophos;i="6.00,242,1681196400"; 
   d="scan'208";a="343301574"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jun 2023 06:05:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10741"; a="712062604"
X-IronPort-AV: E=Sophos;i="6.00,242,1681196400"; 
   d="scan'208";a="712062604"
Received: from lkp-server02.sh.intel.com (HELO d59cacf64e9e) ([10.239.97.151])
  by orsmga002.jf.intel.com with ESMTP; 14 Jun 2023 06:05:51 -0700
Received: from kbuild by d59cacf64e9e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q9QC7-0000fI-0K;
	Wed, 14 Jun 2023 13:05:51 +0000
Date: Wed, 14 Jun 2023 21:05:26 +0800
From: kernel test robot <lkp@intel.com>
To: Wei Chin Tsai <Wei-chin.Tsai@mediatek.com>,
	linux-kernel@vger.kernel.org, Russell King <linux@armlinux.org.uk>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: oe-kbuild-all@lists.linux.dev, wsd_upstream@mediatek.com,
	wei-chin.tsai@mediatek.com, mel.lee@mediatek.com,
	ivan.tseng@mediatek.com, linux-arm-kernel@lists.infradead.org,
	linux-fsdevel@vger.kernel.org, linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v2 2/3] memory: export symbols for memory related
 functions
Message-ID: <202306142030.GjGWnIkY-lkp@intel.com>
References: <20230614032038.11699-3-Wei-chin.Tsai@mediatek.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230614032038.11699-3-Wei-chin.Tsai@mediatek.com>

Hi Wei,

kernel test robot noticed the following build errors:

[auto build test ERROR on char-misc/char-misc-testing]
[also build test ERROR on char-misc/char-misc-next char-misc/char-misc-linus linus/master v6.4-rc6]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Wei-Chin-Tsai/kernel-process-fork-exit-export-symbol-for-fork-exit-tracing-functions/20230614-112218
base:   char-misc/char-misc-testing
patch link:    https://lore.kernel.org/r/20230614032038.11699-3-Wei-chin.Tsai%40mediatek.com
patch subject: [PATCH v2 2/3] memory: export symbols for memory related functions
config: arm-randconfig-r033-20230612 (https://download.01.org/0day-ci/archive/20230614/202306142030.GjGWnIkY-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.3.0
reproduce (this is a W=1 build):
        mkdir -p ~/bin
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        git remote add char-misc https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/char-misc.git
        git fetch char-misc char-misc-testing
        git checkout char-misc/char-misc-testing
        b4 shazam https://lore.kernel.org/r/20230614032038.11699-3-Wei-chin.Tsai@mediatek.com
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.3.0 ~/bin/make.cross W=1 O=build_dir ARCH=arm olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.3.0 ~/bin/make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306142030.GjGWnIkY-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: vmlinux: 'arch_vma_name' exported twice. Previous export was in vmlinux
WARNING: modpost: EXPORT symbol "arch_vma_name" [vmlinux] version generation failed, symbol will not be versioned.
Is "arch_vma_name" prototyped in <asm/asm-prototypes.h>?

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
