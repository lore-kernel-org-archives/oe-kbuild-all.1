Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75A47364
	for <oe-kbuild-all@lists.linux.dev>; Wed, 12 Apr 2023 02:03:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681265022; x=1712801022;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=U88otumKl5yEfplv19WGphJFP6/9ZJyLTf7TpPmayYQ=;
  b=JZhjAo/BSW5gd2vBjxdVStH3WjggugtkZTfI3+Wenndr9k6kuTX4e4Et
   4+9AV9G5ojCT1l37T1Y9XmkVUw/0eTeH6g+jGFTFXi+kUb8nUDGVaj/ik
   u953bzBmdoP0gqjaApHzrMWNqa6SN+QAoRVTkCw8niHEpYG+l12wEaU3m
   Ut0v0V3go/h+7g/tHJ0ivlUYllY9S/voL8x5iEqKqfqG53n0yu1zQvyoD
   A6rQcm1c8+AHOZ7Gl7Pnqrm6Qdl84uNGYD0YsN6qso1j5Y7FI6E/oK0PX
   hnRMj3Dxenu7N58o0tdyttzMhvBOwXoCXD5ahcd+2Z4Gw3FjAtWCCaktQ
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10677"; a="406607395"
X-IronPort-AV: E=Sophos;i="5.98,336,1673942400"; 
   d="scan'208";a="406607395"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Apr 2023 19:03:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10677"; a="753347679"
X-IronPort-AV: E=Sophos;i="5.98,336,1673942400"; 
   d="scan'208";a="753347679"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 11 Apr 2023 19:03:40 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pmPpj-000Wyy-2l;
	Wed, 12 Apr 2023 02:03:39 +0000
Date: Wed, 12 Apr 2023 10:02:41 +0800
From: kernel test robot <lkp@intel.com>
To: Ard Biesheuvel <ardb@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [ardb:x86-efi-la57 1/1] x86-stub.c:undefined reference to
 `efi_setup_5level_paging'
Message-ID: <202304121014.F4MP9ng1-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/ardb/linux.git x86-efi-la57
head:   f19379b52679e058081ed37ca0bab8817a216aac
commit: f19379b52679e058081ed37ca0bab8817a216aac [1/1] efi/libstub: x86: Perform 4/5 level paging switch from the stub
config: i386-defconfig (https://download.01.org/0day-ci/archive/20230412/202304121014.F4MP9ng1-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce (this is a W=1 build):
        # https://git.kernel.org/pub/scm/linux/kernel/git/ardb/linux.git/commit/?id=f19379b52679e058081ed37ca0bab8817a216aac
        git remote add ardb git://git.kernel.org/pub/scm/linux/kernel/git/ardb/linux.git
        git fetch --no-tags ardb x86-efi-la57
        git checkout f19379b52679e058081ed37ca0bab8817a216aac
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=i386 olddefconfig
        make W=1 O=build_dir ARCH=i386 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304121014.F4MP9ng1-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: drivers/firmware/efi/libstub/x86-stub.stub.o: in function `efi_main':
>> x86-stub.c:(.text+0x48f): undefined reference to `efi_setup_5level_paging'
   ld: arch/x86/boot/compressed/vmlinux: hidden symbol `efi_setup_5level_paging' isn't defined
   ld: final link failed: bad value

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
