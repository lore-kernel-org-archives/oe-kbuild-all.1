Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C745C1841
	for <oe-kbuild-all@lists.linux.dev>; Fri,  3 Mar 2023 03:05:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677812748; x=1709348748;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=cOjizNYfnhUTV00WsRR5dA7M5+jqIWk41W0ai3uqpoE=;
  b=WdKMcCbW9ewST0ipBaN7HXDFMdaXs5CKJYDKug7kkbzNwtNm+q9vh2Sz
   /uhRS6o4W2qvS5xFmem+6Zn0EqQXHt3movXbZP6iwoNBGxkiyM7kNvU4Z
   zH02saCC6Nx8CmwsD9zTIq9zQjsNujd4P6YRJOtrgrk9md46s2psKeqW7
   1msxUgBw4hrOb7Y80VMXU6Prd7mMBFjVLgsr8fU9/7hxrPwD+YSiZjWVp
   56yPBNpN7H9MDyKzuiudMttH2hoDrM7+xBPR1PNa1HIK7KomXNbaSPg+L
   lNOPkWUbbbt0TJ4PKKeJd0IPZghtAwwLhfkJ5G9Dh8k+zeyCvIg98WpdI
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10637"; a="314594856"
X-IronPort-AV: E=Sophos;i="5.98,229,1673942400"; 
   d="scan'208";a="314594856"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Mar 2023 19:05:48 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10637"; a="705496270"
X-IronPort-AV: E=Sophos;i="5.98,229,1673942400"; 
   d="scan'208";a="705496270"
Received: from lkp-server01.sh.intel.com (HELO 776573491cc5) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 02 Mar 2023 19:05:47 -0800
Received: from kbuild by 776573491cc5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pXvju-000184-1u;
	Fri, 03 Mar 2023 03:05:46 +0000
Date: Fri, 3 Mar 2023 11:05:18 +0800
From: kernel test robot <lkp@intel.com>
To: Sasha Levin <sashal@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [sashal-stable:pending-6.2 41/752] Error:
 arch/arm64/boot/dts/qcom/sdm845-sony-xperia-tama.dtsi:391.1-14 Label or path
 pm8998_gpios not found
Message-ID: <202303031019.3kH6Csmn-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/sashal/linux-stable.git pending-6.2
head:   a20fc97b4aad96c792a8fc65baf7e6ca73fad8cc
commit: ccdd31f06e524b6f043f3fb82f81a468555baa48 [41/752] arm64: dts: qcom: sdm845-tama: Add volume up and camera GPIO keys
config: arm64-allyesconfig (https://download.01.org/0day-ci/archive/20230303/202303031019.3kH6Csmn-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/sashal/linux-stable.git/commit/?id=ccdd31f06e524b6f043f3fb82f81a468555baa48
        git remote add sashal-stable https://git.kernel.org/pub/scm/linux/kernel/git/sashal/linux-stable.git
        git fetch --no-tags sashal-stable pending-6.2
        git checkout ccdd31f06e524b6f043f3fb82f81a468555baa48
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm64 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303031019.3kH6Csmn-lkp@intel.com/

All errors (new ones prefixed by >>):

>> Error: arch/arm64/boot/dts/qcom/sdm845-sony-xperia-tama.dtsi:391.1-14 Label or path pm8998_gpios not found
>> FATAL ERROR: Syntax error parsing input tree

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
