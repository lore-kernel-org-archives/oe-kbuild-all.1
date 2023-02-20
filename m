Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0633C23AF
	for <oe-kbuild-all@lists.linux.dev>; Mon, 20 Feb 2023 09:48:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676886492; x=1708422492;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/OY1sZ/SRhwY+iL0da906bd90e4LUnMdDeJ2E7Iv/24=;
  b=VWD/tnmDWW5DT3jobzBRDIuYHNfGJd/FlubUqQ82erJfUTOZ/SKuTHCz
   yyzPV1Pp1ZAKuTI6pTZD0L5nWR7tfjgJqazPaIIOy24NxB4qqFGO+xf9J
   GAAU9XhSM1hno/la8k10AKfCwD2+mV25+ViFsxtMNq5XT/eYXi8sb79k5
   Ndxgq0iHtg/u+sNN0H6EAhZ0J/WR8rkJm60hBaiiRgHW6RtrxcFc9Xhil
   AXPkVkdbvzcA91lZ/2PuQpbxfBXrzalvel9xl3Qdi+EE7Wl+57AdzRSUe
   kSHCewKY7RvrNNrKt5ZlyG3GbTcjTLAoAaB5LbvbXNNMWgG/CVwbGd2ap
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10626"; a="334565094"
X-IronPort-AV: E=Sophos;i="5.97,312,1669104000"; 
   d="scan'208";a="334565094"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Feb 2023 01:48:11 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10626"; a="845276925"
X-IronPort-AV: E=Sophos;i="5.97,312,1669104000"; 
   d="scan'208";a="845276925"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 20 Feb 2023 01:48:10 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pU2mH-000Dpu-31;
	Mon, 20 Feb 2023 09:48:09 +0000
Date: Mon, 20 Feb 2023 17:47:34 +0800
From: kernel test robot <lkp@intel.com>
To: Sven Peter <sven@svenpeter.dev>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [asahilinux:atcphy-20230219 47/54] (.init.text+0x0): multiple
 definition of `init_module'; drivers/thunderbolt/nhi.o:(.init.text+0x0):
 first defined here
Message-ID: <202302201713.NsmHjWR2-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/AsahiLinux/linux atcphy-20230219
head:   9928386c36c8def0becc6ce2db8f18f2111f9b3c
commit: 2845c3ae937f4ede4d68ba7299c48b55100ba3f5 [47/54] thunderbolt: Add Apple Silicon support
config: alpha-allmodconfig (https://download.01.org/0day-ci/archive/20230220/202302201713.NsmHjWR2-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/AsahiLinux/linux/commit/2845c3ae937f4ede4d68ba7299c48b55100ba3f5
        git remote add asahilinux https://github.com/AsahiLinux/linux
        git fetch --no-tags asahilinux atcphy-20230219
        git checkout 2845c3ae937f4ede4d68ba7299c48b55100ba3f5
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=alpha olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=alpha SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302201713.NsmHjWR2-lkp@intel.com/

All errors (new ones prefixed by >>):

   alpha-linux-ld: drivers/thunderbolt/protocol_adapter.o: in function `tb_protocol_adapter_init':
>> (.init.text+0x0): multiple definition of `init_module'; drivers/thunderbolt/nhi.o:(.init.text+0x0): first defined here
   alpha-linux-ld: drivers/thunderbolt/protocol_adapter.o: in function `tb_protocol_adapter_exit':
>> (.exit.text+0x0): multiple definition of `cleanup_module'; drivers/thunderbolt/nhi.o:(.exit.text+0x0): first defined here
   alpha-linux-ld: drivers/thunderbolt/nhi_apple.o: in function `apple_cio_driver_init':
>> (.init.text+0x0): multiple definition of `init_module'; drivers/thunderbolt/nhi.o:(.init.text+0x0): first defined here
   alpha-linux-ld: drivers/thunderbolt/nhi_apple.o: in function `apple_cio_driver_exit':
>> (.exit.text+0x0): multiple definition of `cleanup_module'; drivers/thunderbolt/nhi.o:(.exit.text+0x0): first defined here

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
