Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4087B8BF3
	for <oe-kbuild-all@lists.linux.dev>; Wed,  8 Mar 2023 20:00:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678305601; x=1709841601;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ULAiKdJ7Sq2BySuFi9xZPuOxpMn7M82AJjm5F0ROKhQ=;
  b=EPsq1lbZbuvlxNX2uRxS73nwpWL7lcCv+pYu8TJpWECn85UcjuUa6dCP
   HHwZJrm6L2zCUY3Voy31PXOh2bNn2UJxfRp/5ZdrfeDGWqCX+8KraEqMr
   BgStpoXTw5Pg9BERU6nY199+tKZ1dhggJDSwDtEEJiNQm0ZtbWwzlfmy1
   XeJMJl/MyXYdz4av9kWDQkTmyU+Pi72HivL9C1sEpzz7qSeqT2Kz7Rxgo
   SG1pWHxlYk4dMg/Xcl5eCcuAqJvCFZeAn/RLGkK2QeKNpVx5pWtZHyPMX
   Infpdn2cZO5S8FBDDJClzPGrwKsIfSYvEI76OHuUCAdTVxlMOIpbGhg6Z
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10643"; a="337783814"
X-IronPort-AV: E=Sophos;i="5.98,244,1673942400"; 
   d="scan'208";a="337783814"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Mar 2023 11:59:58 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10643"; a="627061026"
X-IronPort-AV: E=Sophos;i="5.98,244,1673942400"; 
   d="scan'208";a="627061026"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 08 Mar 2023 11:59:57 -0800
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pZzx6-0002Nj-2a;
	Wed, 08 Mar 2023 19:59:56 +0000
Date: Thu, 9 Mar 2023 03:59:15 +0800
From: kernel test robot <lkp@intel.com>
To: Evgeniy Baskov <baskov@ispras.ru>
Cc: oe-kbuild-all@lists.linux.dev, Ard Biesheuvel <ardb@kernel.org>
Subject: [ardb:efi-x86-nx 12/24]
 arch/x86/boot/compressed/ident_map_64.c:95:15: sparse: sparse: symbol
 'kernel_add_identity_map_' was not declared. Should it be static?
Message-ID: <202303090348.l0pqa8oz-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/ardb/linux.git efi-x86-nx
head:   8171142f3e4c96f6be75a6195de59d1607f1bd4b
commit: 72df0ae166b896e7584f288dcdcc9fa63b360030 [12/24] x86/boot: Make kernel_add_identity_map() a pointer
config: x86_64-randconfig-s022 (https://download.01.org/0day-ci/archive/20230309/202303090348.l0pqa8oz-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce:
        # apt-get install sparse
        # sparse version: v0.6.4-39-gce1a6720-dirty
        # https://git.kernel.org/pub/scm/linux/kernel/git/ardb/linux.git/commit/?id=72df0ae166b896e7584f288dcdcc9fa63b360030
        git remote add ardb git://git.kernel.org/pub/scm/linux/kernel/git/ardb/linux.git
        git fetch --no-tags ardb efi-x86-nx
        git checkout 72df0ae166b896e7584f288dcdcc9fa63b360030
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=x86_64 olddefconfig
        make W=1 C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=x86_64 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303090348.l0pqa8oz-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   arch/x86/boot/compressed/ident_map_64.c: note: in included file:
   arch/x86/boot/compressed/../../mm/ident_map.c:102:7: sparse: sparse: symbol 'ident_split_large_pud' was not declared. Should it be static?
>> arch/x86/boot/compressed/ident_map_64.c:95:15: sparse: sparse: symbol 'kernel_add_identity_map_' was not declared. Should it be static?
   arch/x86/boot/compressed/ident_map_64.c:179:23: sparse: sparse: memset with byte count of 237568
   arch/x86/boot/compressed/ident_map_64.c:183:23: sparse: sparse: memset with byte count of 262144

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
