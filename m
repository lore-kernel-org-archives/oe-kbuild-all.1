Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70FEE6FDB
	for <oe-kbuild-all@lists.linux.dev>; Fri, 17 Mar 2023 15:55:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679068516; x=1710604516;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=mWrMwkurkDuf91iXXk4iuCqFycas6EenldJmpazdx0g=;
  b=ZRaZugErGc+S1wTyiG8uieId7uGE71J2ysd5tZojzw3mYMDk/Tb0HO37
   IvNYsxgU61husRnOLRF6/BYamGLnCJZYf8hWlJZtcy9hsT1F2Temcm+qA
   ytW1dDhTWYSHTn/Qy/u4sIi+lgAJIN2GCPBOWHIkY1D8CO95Cp5mjq8bt
   qBdQ9UwFlPEFmh32U6Zjty5sRc4sHyXn88nlxDAdVxblfAZLfcVtZ2uSV
   xjjrpIOtI1niS6ySmsclLuU+QhESyhuKidDmYQyvqZDKFZzNgxdmSZj+R
   RB7NJx5+Y/8N8Fn98ZX9E+rVoPJjqsdZyDqKrGS43lOY16tZek61LBBW0
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10652"; a="403159421"
X-IronPort-AV: E=Sophos;i="5.98,268,1673942400"; 
   d="scan'208";a="403159421"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Mar 2023 08:55:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10652"; a="790757122"
X-IronPort-AV: E=Sophos;i="5.98,268,1673942400"; 
   d="scan'208";a="790757122"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 17 Mar 2023 08:55:13 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pdCQC-0009SJ-22;
	Fri, 17 Mar 2023 15:55:12 +0000
Date: Fri, 17 Mar 2023 23:54:33 +0800
From: kernel test robot <lkp@intel.com>
To: =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Michael Walle <michael@walle.cc>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	=?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>
Subject: Re: [PATCH V4 4/4] nvmem: layouts: add fixed cells layout
Message-ID: <202303172348.sb4rePWl-lkp@intel.com>
References: <20230317132620.31142-5-zajec5@gmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230317132620.31142-5-zajec5@gmail.com>

Hi Rafał,

I love your patch! Perhaps something to improve:

[auto build test WARNING on next-20230317]
[cannot apply to robh/for-next krzk-dt/for-next char-misc/char-misc-testing char-misc/char-misc-next char-misc/char-misc-linus linus/master v6.3-rc2 v6.3-rc1 v6.2 v6.3-rc2]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Rafa-Mi-ecki/dt-bindings-nvmem-layouts-add-fixed-layout/20230317-212948
patch link:    https://lore.kernel.org/r/20230317132620.31142-5-zajec5%40gmail.com
patch subject: [PATCH V4 4/4] nvmem: layouts: add fixed cells layout
config: sparc-allyesconfig (https://download.01.org/0day-ci/archive/20230317/202303172348.sb4rePWl-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/7ffae9ad6cdb83ae60e3eacf96ab779e0b69a65b
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Rafa-Mi-ecki/dt-bindings-nvmem-layouts-add-fixed-layout/20230317-212948
        git checkout 7ffae9ad6cdb83ae60e3eacf96ab779e0b69a65b
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=sparc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=sparc SHELL=/bin/bash drivers/nvmem/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303172348.sb4rePWl-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/nvmem/layouts/fixed.c:37:1: warning: data definition has no type or storage class
      37 | module_nvmem_layout_driver(fixed_nvmem_layout);
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/nvmem/layouts/fixed.c:37:1: error: type defaults to 'int' in declaration of 'module_nvmem_layout_driver' [-Werror=implicit-int]
>> drivers/nvmem/layouts/fixed.c:37:1: warning: parameter names (without types) in function declaration
   cc1: some warnings being treated as errors


vim +37 drivers/nvmem/layouts/fixed.c

    36	
  > 37	module_nvmem_layout_driver(fixed_nvmem_layout);
    38	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
