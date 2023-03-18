Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 525F2368
	for <oe-kbuild-all@lists.linux.dev>; Sat, 18 Mar 2023 00:06:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679097989; x=1710633989;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=ReMNAetjuziIagyWXWP1NZ5E1cfEyOq4UIZ1mhXddqs=;
  b=KsFhsaPribYSU1tiJn8trL89GFvfVF8louU2qaYHZ0kVeDlzW22GLcue
   4vhbORLsqUQaKTZxyj5eJzD2I9kaLKRF3xaXSQgjwQkyW6o0W9CDR8elL
   MPmSmc+h/qgBWtJO2oupoWvqpeRqicAEfjgFIy3dUDdz0a4xTd93QB9yT
   jVMQq25AYEK/bHb7lqYd0XnBKO4eS7hQIJ8ZXPFochbFJ+6ndY8OT1kbQ
   JIR6n15WBsqFmhMliqX68W52PQu5ICVXtqxx+4eiNDLa+Qht33vgV9sqJ
   4bzwH7Vlr9eNd+zCYSb0X5JPcmBJA0vrcAQa42JQhKjvQVhZg+pgs5gQQ
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10652"; a="339926932"
X-IronPort-AV: E=Sophos;i="5.98,270,1673942400"; 
   d="scan'208";a="339926932"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Mar 2023 17:06:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10652"; a="744734167"
X-IronPort-AV: E=Sophos;i="5.98,270,1673942400"; 
   d="scan'208";a="744734167"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 17 Mar 2023 17:06:24 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pdK5Y-0009fu-00;
	Sat, 18 Mar 2023 00:06:24 +0000
Date: Sat, 18 Mar 2023 08:06:16 +0800
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
Subject: Re: [PATCH V4 3/4] nvmem: core: export nvmem_add_cells_from_of()
Message-ID: <202303180709.WSD6mSsu-lkp@intel.com>
References: <20230317132620.31142-4-zajec5@gmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230317132620.31142-4-zajec5@gmail.com>

Hi Rafał,

I love your patch! Yet something to improve:

[auto build test ERROR on next-20230317]
[cannot apply to robh/for-next krzk-dt/for-next char-misc/char-misc-testing char-misc/char-misc-next char-misc/char-misc-linus linus/master v6.3-rc2 v6.3-rc1 v6.2 v6.3-rc2]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Rafa-Mi-ecki/dt-bindings-nvmem-layouts-add-fixed-layout/20230317-212948
patch link:    https://lore.kernel.org/r/20230317132620.31142-4-zajec5%40gmail.com
patch subject: [PATCH V4 3/4] nvmem: core: export nvmem_add_cells_from_of()
config: powerpc-allnoconfig (https://download.01.org/0day-ci/archive/20230318/202303180709.WSD6mSsu-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/70d21b7988db0cad28a2cb4b0d7f5d77d587a51f
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Rafa-Mi-ecki/dt-bindings-nvmem-layouts-add-fixed-layout/20230317-212948
        git checkout 70d21b7988db0cad28a2cb4b0d7f5d77d587a51f
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=powerpc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=powerpc SHELL=/bin/bash arch/powerpc/kernel/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303180709.WSD6mSsu-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/rtc.h:18,
                    from arch/powerpc/kernel/time.c:48:
>> include/linux/nvmem-provider.h:230:12: error: 'nvmem_add_cells_from_of' defined but not used [-Werror=unused-function]
     230 | static int nvmem_add_cells_from_of(struct nvmem_device *nvmem, struct device_node *np)
         |            ^~~~~~~~~~~~~~~~~~~~~~~
   cc1: all warnings being treated as errors


vim +/nvmem_add_cells_from_of +230 include/linux/nvmem-provider.h

   229	
 > 230	static int nvmem_add_cells_from_of(struct nvmem_device *nvmem, struct device_node *np)
   231	{
   232		return -EOPNOTSUPP;
   233	}
   234	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
