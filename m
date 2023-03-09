Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74CF5D50B
	for <oe-kbuild-all@lists.linux.dev>; Thu,  9 Mar 2023 15:20:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678375241; x=1709911241;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=B//ffOIlaCZoqGWrl3k0tinZmKmcI4OPWjPvucgTJxY=;
  b=ZiCCnHZwyKQG5yjYKt2dgyy9r7kXcC7aPKHi+lsow46XA7MMdZtvZuJb
   49NiRtl4sikdWANaz3UwJJMKH/DaFTVO13zWv7qo/VcyDLbna5riVzCEB
   yRWaNtEM8dwLVoY0NVvaQqN8V2Yhg4sEzjHf++/C04lFeAKuYSNR40tZW
   M/i/kZs9YBLGC6uc/CPagRAk4rEcrJUAsq4IT+f3VPT35PHRxMbth7ilz
   /V82IGuC9l4h39+BP5PoTFKVjt1oQR7g/ABDJjTdSyJWDJdTjvpIYs2MV
   b2T5f3gIEJKBb5NOluhnl+RL8u4+4afE3RYBGCvUmJh5j0PR0BISZSJ2o
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10643"; a="336478576"
X-IronPort-AV: E=Sophos;i="5.98,246,1673942400"; 
   d="scan'208";a="336478576"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Mar 2023 07:20:29 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10643"; a="801217017"
X-IronPort-AV: E=Sophos;i="5.98,246,1673942400"; 
   d="scan'208";a="801217017"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 09 Mar 2023 07:20:28 -0800
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1paI4B-00032B-1q;
	Thu, 09 Mar 2023 15:20:27 +0000
Date: Thu, 9 Mar 2023 23:20:13 +0800
From: kernel test robot <lkp@intel.com>
To: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Mark Brown <broonie@kernel.org>
Subject: sound/soc/qcom/qdsp6/q6apm.c:30:14: sparse: sparse: symbol 'g_apm'
 was not declared. Should it be static?
Message-ID: <202303092330.kPhyOd01-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   6a98c9cae232800c319ed69e1063480d31430887
commit: 47bc8cf60e926d1fb0c5d990bf6f5e01e9b3352e ASoC: qdsp6: audioreach: Add ADSP ready check
date:   6 weeks ago
config: riscv-randconfig-s043-20230309 (https://download.01.org/0day-ci/archive/20230309/202303092330.kPhyOd01-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 12.1.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # apt-get install sparse
        # sparse version: v0.6.4-39-gce1a6720-dirty
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=47bc8cf60e926d1fb0c5d990bf6f5e01e9b3352e
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 47bc8cf60e926d1fb0c5d990bf6f5e01e9b3352e
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=riscv olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=riscv SHELL=/bin/bash drivers/soc/fsl/qe/ sound/soc/qcom/qdsp6/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303092330.kPhyOd01-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   WARNING: invalid argument to '-march': '_zihintpause'
>> sound/soc/qcom/qdsp6/q6apm.c:30:14: sparse: sparse: symbol 'g_apm' was not declared. Should it be static?

vim +/g_apm +30 sound/soc/qcom/qdsp6/q6apm.c

    29	
  > 30	struct q6apm *g_apm;
    31	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
