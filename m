Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 561CD8C0F
	for <oe-kbuild-all@lists.linux.dev>; Wed, 10 May 2023 17:00:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683738045; x=1715274045;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=gKhRGj85UbImK57Kh1ESFgEHiDGK4xuek1Ky82rVH5g=;
  b=Vk9c5NcseKxu6iY8ZWvm2N2lrN0EaPA9wEyjfvIH4bfKeyk26qsKaHuE
   sccjdW9nrUphXWHVW7unb6kzsswJThusWAv1BhuprtFfE3tbZbMQMiyRL
   hXfHSnVkPckZbO+Lq6+HYUJJEw9WtiV/VBs+WO/liMnGj2VfIX/VhaQep
   6cmlBBtgEvrM8NIV5FLU69jPdtdyfH2bRIXkBYhZcIjh88B0HXke0BP0v
   ZuK33Xr8OJbembA/DqI6Hfeyb3aD0WJ5meVN9nkSAEeTCuddjIp7h+mmE
   ylnn14RYKHvkIfbIvoBMCaH6+vNWf8teZE2+Bg/C9GriL34gmbsBp5+KG
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10706"; a="436590201"
X-IronPort-AV: E=Sophos;i="5.99,265,1677571200"; 
   d="scan'208";a="436590201"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 May 2023 10:00:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10706"; a="764375418"
X-IronPort-AV: E=Sophos;i="5.99,265,1677571200"; 
   d="scan'208";a="764375418"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 10 May 2023 10:00:40 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pwnB9-0003S4-24;
	Wed, 10 May 2023 17:00:39 +0000
Date: Thu, 11 May 2023 01:00:23 +0800
From: kernel test robot <lkp@intel.com>
To: Zong Li <zong.li@sifive.com>, vkoul@kernel.org, palmer@dabbelt.com,
	radhey.shyam.pandey@amd.com, dmaengine@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, Zong Li <zong.li@sifive.com>
Subject: Re: [PATCH v2] dmaengine: xilinx: dma: remove arch dependency
Message-ID: <202305110023.SRQHQ5Sg-lkp@intel.com>
References: <20230510060421.30982-1-zong.li@sifive.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230510060421.30982-1-zong.li@sifive.com>

Hi Zong,

kernel test robot noticed the following build errors:

[auto build test ERROR on vkoul-dmaengine/next]
[also build test ERROR on linus/master v6.4-rc1 next-20230510]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Zong-Li/dmaengine-xilinx-dma-remove-arch-dependency/20230510-140509
base:   https://git.kernel.org/pub/scm/linux/kernel/git/vkoul/dmaengine.git next
patch link:    https://lore.kernel.org/r/20230510060421.30982-1-zong.li%40sifive.com
patch subject: [PATCH v2] dmaengine: xilinx: dma: remove arch dependency
config: s390-allmodconfig (https://download.01.org/0day-ci/archive/20230511/202305110023.SRQHQ5Sg-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/5ffa30d0089e127bb702f8904856e05dfdee85d5
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Zong-Li/dmaengine-xilinx-dma-remove-arch-dependency/20230510-140509
        git checkout 5ffa30d0089e127bb702f8904856e05dfdee85d5
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=s390 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=s390 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202305110023.SRQHQ5Sg-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "devm_platform_ioremap_resource" [drivers/dma/xilinx/xilinx_dma.ko] undefined!
ERROR: modpost: "devm_platform_ioremap_resource" [drivers/dma/fsl-edma.ko] undefined!
ERROR: modpost: "devm_platform_ioremap_resource" [drivers/dma/idma64.ko] undefined!
ERROR: modpost: "devm_platform_ioremap_resource" [drivers/char/xillybus/xillybus_of.ko] undefined!
ERROR: modpost: "devm_memremap" [drivers/misc/open-dice.ko] undefined!
ERROR: modpost: "devm_memunmap" [drivers/misc/open-dice.ko] undefined!
ERROR: modpost: "devm_ioremap" [drivers/net/ethernet/altera/altera_tse.ko] undefined!
ERROR: modpost: "iounmap" [drivers/pcmcia/pcmcia.ko] undefined!
ERROR: modpost: "ioremap" [drivers/pcmcia/pcmcia.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
