Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C01DC950
	for <oe-kbuild-all@lists.linux.dev>; Wed,  5 Apr 2023 22:12:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680732750; x=1712268750;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=iC0mZlCAzixfOXBnIq7xgw74OEBZwsOqXd/osPcdF7g=;
  b=HOE2f1A4a8qbOlK9q3takTMJXBb34Wq0gH1CBE0gY27zizOxJqmf56D4
   4soNqUg9gSA3HH7IHDY1IDSnUdL+cgkh/7r/Vuwgtrp9bo6g/lBrKZ0+C
   u+affep8tNRJ9fv/Za6+h3YBhmk3dPXIMFz6l7IaWQYgyjxI1Lgefnsv4
   LyVGSPP9YBs/wxQ9NdnZsx++ijmBYck/U7zt2Esinzhp3By06o5P1/rT4
   1z1qn0ReaxFZF94CZUOaApjTw4VI74leySyOjWEPVmHkKlpgJoUYxdRkU
   wPGNXR8+qP/+jzWHfeQIZtqYmEMstJiNmLj4lS5fOuc6XxEe34U2tQ7lD
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10671"; a="405365222"
X-IronPort-AV: E=Sophos;i="5.98,322,1673942400"; 
   d="scan'208";a="405365222"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Apr 2023 15:12:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10671"; a="751412952"
X-IronPort-AV: E=Sophos;i="5.98,322,1673942400"; 
   d="scan'208";a="751412952"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 05 Apr 2023 15:12:28 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pkBMh-000Qr0-1s;
	Wed, 05 Apr 2023 22:12:27 +0000
Date: Thu, 6 Apr 2023 06:11:59 +0800
From: kernel test robot <lkp@intel.com>
To: Sasha Levin <sashal@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [sashal-stable:pending-5.15 3/25] drivers/edac/sifive_edac.c:23:
 warning: This comment starts with '/**', but isn't a kernel-doc comment.
 Refer Documentation/doc-guide/kernel-doc.rst
Message-ID: <202304060614.yaZEI9YZ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Greentime,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/sashal/linux-stable.git pending-5.15
head:   95e5345cb3cf9499018c33a4cda3267ae0a63803
commit: a43eedc526a7fda32c2f65e448e27b6581db1b19 [3/25] soc: sifive: ccache: Rename SiFive L2 cache to Composable cache.
config: riscv-randconfig-r042-20230406 (https://download.01.org/0day-ci/archive/20230406/202304060614.yaZEI9YZ-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project 67409911353323ca5edf2049ef0df54132fa1ca7)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/sashal/linux-stable.git/commit/?id=a43eedc526a7fda32c2f65e448e27b6581db1b19
        git remote add sashal-stable https://git.kernel.org/pub/scm/linux/kernel/git/sashal/linux-stable.git
        git fetch --no-tags sashal-stable pending-5.15
        git checkout a43eedc526a7fda32c2f65e448e27b6581db1b19
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash drivers/edac/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304060614.yaZEI9YZ-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/edac/sifive_edac.c:23: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
    * EDAC error callback


vim +23 drivers/edac/sifive_edac.c

91abaeaaff35d9 Yash Shah    2019-05-06  21  
91abaeaaff35d9 Yash Shah    2019-05-06  22  /**
91abaeaaff35d9 Yash Shah    2019-05-06 @23   * EDAC error callback
91abaeaaff35d9 Yash Shah    2019-05-06  24   *
91abaeaaff35d9 Yash Shah    2019-05-06  25   * @event: non-zero if unrecoverable.
91abaeaaff35d9 Yash Shah    2019-05-06  26   */
91abaeaaff35d9 Yash Shah    2019-05-06  27  static
91abaeaaff35d9 Yash Shah    2019-05-06  28  int ecc_err_event(struct notifier_block *this, unsigned long event, void *ptr)
91abaeaaff35d9 Yash Shah    2019-05-06  29  {
91abaeaaff35d9 Yash Shah    2019-05-06  30  	const char *msg = (char *)ptr;
91abaeaaff35d9 Yash Shah    2019-05-06  31  	struct sifive_edac_priv *p;
91abaeaaff35d9 Yash Shah    2019-05-06  32  
91abaeaaff35d9 Yash Shah    2019-05-06  33  	p = container_of(this, struct sifive_edac_priv, notifier);
91abaeaaff35d9 Yash Shah    2019-05-06  34  
a43eedc526a7fd Greentime Hu 2022-09-13  35  	if (event == SIFIVE_CCACHE_ERR_TYPE_UE)
91abaeaaff35d9 Yash Shah    2019-05-06  36  		edac_device_handle_ue(p->dci, 0, 0, msg);
a43eedc526a7fd Greentime Hu 2022-09-13  37  	else if (event == SIFIVE_CCACHE_ERR_TYPE_CE)
91abaeaaff35d9 Yash Shah    2019-05-06  38  		edac_device_handle_ce(p->dci, 0, 0, msg);
91abaeaaff35d9 Yash Shah    2019-05-06  39  
91abaeaaff35d9 Yash Shah    2019-05-06  40  	return NOTIFY_OK;
91abaeaaff35d9 Yash Shah    2019-05-06  41  }
91abaeaaff35d9 Yash Shah    2019-05-06  42  

:::::: The code at line 23 was first introduced by commit
:::::: 91abaeaaff35d97e88d2249f69f19db749a19a68 EDAC/sifive: Add EDAC platform driver for SiFive SoCs

:::::: TO: Yash Shah <yash.shah@sifive.com>
:::::: CC: Tony Luck <tony.luck@intel.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
