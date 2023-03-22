Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC2732584
	for <oe-kbuild-all@lists.linux.dev>; Wed, 22 Mar 2023 20:51:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679518266; x=1711054266;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=uabzrRActvWORDWX39WS5JMj9IpucxbkVMI4llVLkMk=;
  b=cDiOafYV6egiq7jYbTejwEDkzAI/lAQUnmS4eOjPcD0MOfhNWLv7vESE
   ZGTqdB8lzDIqoj8OI0191en44LxUjJ1Ne05+5bBeO+oR1969J2E08I6ev
   mZb5v1mPSnsiAuf8saF2DLPG3O0dAbS+JvpzIbw2Hv81Zdnjh9QWgEDj2
   j1eznV4ukXLTH+JWlcEbuRk4T6Ow8WxwtfLxzzwpzYylQpyPMsOqzgAXY
   O0HqC11ZHVjGXGULQYWeTGRT+OP16QjRjVUemYCbs8vo6MPLzg1bOMzY5
   rjjPgUAXY4SR3nci2T+JUwLaz6GQgZ7aFqQ12kDM5N5Qi2UH5tAAu/6Ih
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10657"; a="341688278"
X-IronPort-AV: E=Sophos;i="5.98,282,1673942400"; 
   d="scan'208";a="341688278"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Mar 2023 13:51:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10657"; a="682055417"
X-IronPort-AV: E=Sophos;i="5.98,282,1673942400"; 
   d="scan'208";a="682055417"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 22 Mar 2023 13:50:54 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pf5Q6-000DeK-02;
	Wed, 22 Mar 2023 20:50:54 +0000
Date: Thu, 23 Mar 2023 04:50:45 +0800
From: kernel test robot <lkp@intel.com>
To: Martin Kurbanov <mmkurbanov@sberdevices.ru>,
	Mark Brown <broonie@kernel.org>, Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-spi@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
	kernel@sberdevices.ru, Martin Kurbanov <mmkurbanov@sberdevices.ru>
Subject: Re: [PATCH v1 2/2] spi: add support for Meson A1 SPI Flash Controller
Message-ID: <202303230442.lGIrV8PZ-lkp@intel.com>
References: <20230322150458.783901-3-mmkurbanov@sberdevices.ru>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230322150458.783901-3-mmkurbanov@sberdevices.ru>

Hi Martin,

Thank you for the patch! Yet something to improve:

[auto build test ERROR on broonie-spi/for-next]
[also build test ERROR on robh/for-next krzk-dt/for-next linus/master v6.3-rc3 next-20230322]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Martin-Kurbanov/dt-bindings-spi-add-binding-for-meson-spifc-a1/20230322-230744
base:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-next
patch link:    https://lore.kernel.org/r/20230322150458.783901-3-mmkurbanov%40sberdevices.ru
patch subject: [PATCH v1 2/2] spi: add support for Meson A1 SPI Flash Controller
config: sparc-allyesconfig (https://download.01.org/0day-ci/archive/20230323/202303230442.lGIrV8PZ-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/7d8d54cc0b563efb979caf17507b29c0bb3efde0
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Martin-Kurbanov/dt-bindings-spi-add-binding-for-meson-spifc-a1/20230322-230744
        git checkout 7d8d54cc0b563efb979caf17507b29c0bb3efde0
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=sparc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=sparc SHELL=/bin/bash drivers/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303230442.lGIrV8PZ-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/spi/spi-meson-spifc-a1.c: In function 'a1_spifc_read':
>> drivers/spi/spi-meson-spifc-a1.c:204:16: error: implicit declaration of function 'FIELD_PREP' [-Werror=implicit-function-declaration]
     204 |         val |= FIELD_PREP(A1_SPIFC_USER_DIN_MODE, mode);
         |                ^~~~~~~~~~
   cc1: some warnings being treated as errors


vim +/FIELD_PREP +204 drivers/spi/spi-meson-spifc-a1.c

   196	
   197	static int a1_spifc_read(struct a1_spifc *spifc, void *buf, u32 size, u32 mode)
   198	{
   199		u32 val = readl(spifc->base + A1_SPIFC_USER_CTRL3_REG);
   200		int ret;
   201	
   202		val &= ~(A1_SPIFC_USER_DIN_MODE | A1_SPIFC_USER_DIN_BYTES);
   203		val |= A1_SPIFC_USER_DIN_ENABLE;
 > 204		val |= FIELD_PREP(A1_SPIFC_USER_DIN_MODE, mode);
   205		val |= FIELD_PREP(A1_SPIFC_USER_DIN_BYTES, size);
   206		writel(val, spifc->base + A1_SPIFC_USER_CTRL3_REG);
   207	
   208		ret = a1_spifc_request(spifc, true);
   209		if (!ret)
   210			a1_spifc_drain_buffer(spifc, buf, size);
   211	
   212		return ret;
   213	}
   214	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
