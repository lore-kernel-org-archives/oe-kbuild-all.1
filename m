Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0831123D75
	for <oe-kbuild-all@lists.linux.dev>; Thu,  8 Jun 2023 23:06:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686265610; x=1717801610;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=vl9G1QSuA7ilJ+TglaAeFYIzhthc8BU1twBHAkS5g5w=;
  b=lClBm7RpxnTyuDqATcikhh1mEkS3OIkLQ+ev2eRswOyCzHPbGceWvBUe
   b1QrbsyPOoJMhyrWE2nreqMHo675o//fS/scn4W3m10ATtWlDKMy2noOH
   lesfCJmCLlVNk95fAi0AYuL1H89Vt+XWFfSRiKhfdzZCIgk/ER0cqWy0X
   DilM15rLcHOI3VBkjQ3Hk2NPnMpJRX1Cu6ARmKZXtsC5m4FdFIcU3tEhx
   jHyCQ4YdILuou/Occo4cUvGZCfbxHSeMbFBx4R4ZBnGbnaGq1cjmU6i2f
   BQUOcZbyTV8w9QCBUiYdOLV99F6xwU1nRev/7eBw2n3BwJdvxDf/YrmYQ
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10735"; a="356342165"
X-IronPort-AV: E=Sophos;i="6.00,227,1681196400"; 
   d="scan'208";a="356342165"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jun 2023 16:06:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10735"; a="834391281"
X-IronPort-AV: E=Sophos;i="6.00,227,1681196400"; 
   d="scan'208";a="834391281"
Received: from lkp-server01.sh.intel.com (HELO 15ab08e44a81) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 08 Jun 2023 16:06:47 -0700
Received: from kbuild by 15ab08e44a81 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q7OiM-0008KS-1I;
	Thu, 08 Jun 2023 23:06:46 +0000
Date: Fri, 9 Jun 2023 07:06:03 +0800
From: kernel test robot <lkp@intel.com>
To: "Stanley.Yang" <Stanley.Yang@amd.com>
Cc: oe-kbuild-all@lists.linux.dev, Alex Deucher <alexander.deucher@amd.com>,
	Hawking Zhang <Hawking.Zhang@amd.com>, linux-doc@vger.kernel.org
Subject: [agd5f:drm-next 834/865]
 drivers/gpu/drm/amd/amdgpu/amdgpu_ras_eeprom.c:76: warning: This comment
 starts with '/**', but isn't a kernel-doc comment. Refer
 Documentation/doc-guide/kernel-doc.rst
Message-ID: <202306090615.QR4VmYLN-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitlab.freedesktop.org/agd5f/linux.git drm-next
head:   11007d9259632b46afa565cba971de53b889c7cc
commit: 4a4cbe5d13827db793b3f4523553a5dee39fe6a4 [834/865] drm/amdgpu: Add support EEPROM table v2.1
config: csky-buildonly-randconfig-r006-20230608 (https://download.01.org/0day-ci/archive/20230609/202306090615.QR4VmYLN-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 12.3.0
reproduce (this is a W=1 build):
        mkdir -p ~/bin
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        git remote add agd5f https://gitlab.freedesktop.org/agd5f/linux.git
        git fetch --no-tags agd5f drm-next
        git checkout 4a4cbe5d13827db793b3f4523553a5dee39fe6a4
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.3.0 ~/bin/make.cross W=1 O=build_dir ARCH=csky olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.3.0 ~/bin/make.cross W=1 O=build_dir ARCH=csky SHELL=/bin/bash drivers/gpu/drm/amd/amdgpu/

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306090615.QR4VmYLN-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/amd/amdgpu/amdgpu_ras_eeprom.c:76: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
    * EEPROM Table structure v1
   drivers/gpu/drm/amd/amdgpu/amdgpu_ras_eeprom.c:98: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
    * EEPROM Table structrue v2.1


vim +76 drivers/gpu/drm/amd/amdgpu/amdgpu_ras_eeprom.c

    74	
    75	/**
  > 76	 * EEPROM Table structure v1
    77	 * ---------------------------------
    78	 * |                               |
    79	 * |     EEPROM TABLE HEADER       |
    80	 * |      ( size 20 Bytes )        |
    81	 * |                               |
    82	 * ---------------------------------
    83	 * |                               |
    84	 * |    BAD PAGE RECORD AREA       |
    85	 * |                               |
    86	 * ---------------------------------
    87	 */
    88	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
