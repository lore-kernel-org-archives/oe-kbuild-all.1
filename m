Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E77629AC
	for <oe-kbuild-all@lists.linux.dev>; Sat, 15 Apr 2023 13:51:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681566704; x=1713102704;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=dp1KrvY6QkSy/NSlI5qeWAuev70hEPslSdXj3c+151c=;
  b=hvaz62ktqbm303AkGlhRNt4tEmgzP+yZP7qy7KOQFnRYeplR4TgdY0vY
   /oYFIwz2JZUiwZINjeJZe8a9dZ+ZzLJ4k6UMvKEEazWm5dt9NVT/xlMpo
   shGACSlkITFdxufJiv/yJAIARVEcMYIlrkKZxt1LAIaPXB5bXXUF47aMM
   CkZGPiZL8VoSzRioGIhkVKvUkNIfLO2jMRfDThOafQdfSdE/f3wD7TJz7
   hf332PF8D8sKpOinDBOAUf8h7pzPbyCm+GcnNbyVwQq9U0WnI33G8BAfY
   HhwkUWq1UbHyxOXskNRAT+kgG95pYuwXIx1+7BPrRzOXCh/H7KBD4ttHR
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10681"; a="324272763"
X-IronPort-AV: E=Sophos;i="5.99,199,1677571200"; 
   d="scan'208";a="324272763"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Apr 2023 06:51:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10681"; a="833913007"
X-IronPort-AV: E=Sophos;i="5.99,199,1677571200"; 
   d="scan'208";a="833913007"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 15 Apr 2023 06:51:42 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pngJZ-000b4p-22;
	Sat, 15 Apr 2023 13:51:41 +0000
Date: Sat, 15 Apr 2023 21:51:40 +0800
From: kernel test robot <lkp@intel.com>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v5 08/14] arm64: dts: qcom: pm8150b: Add a TCPM
 description
Message-ID: <202304152117.Bbof9aHB-lkp@intel.com>
References: <20230413113438.1577658-9-bryan.odonoghue@linaro.org>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230413113438.1577658-9-bryan.odonoghue@linaro.org>

Hi Bryan,

kernel test robot noticed the following build errors:

[auto build test ERROR on usb/usb-testing]
[also build test ERROR on usb/usb-next usb/usb-linus robh/for-next broonie-regulator/for-next linus/master v6.3-rc6]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Bryan-O-Donoghue/dt-bindings-regulator-qcom-usb-vbus-regulator-Mark-reg-as-required/20230413-193753
base:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
patch link:    https://lore.kernel.org/r/20230413113438.1577658-9-bryan.odonoghue%40linaro.org
patch subject: [PATCH v5 08/14] arm64: dts: qcom: pm8150b: Add a TCPM description
config: arm-allyesconfig (https://download.01.org/0day-ci/archive/20230415/202304152117.Bbof9aHB-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/f70460d49d6af0c5f743cf69873fbc60dbd2c4be
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Bryan-O-Donoghue/dt-bindings-regulator-qcom-usb-vbus-regulator-Mark-reg-as-required/20230413-193753
        git checkout f70460d49d6af0c5f743cf69873fbc60dbd2c4be
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304152117.Bbof9aHB-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ERROR: Input tree has errors, aborting (use -f to force output)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
