Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B69B1C29
	for <oe-kbuild-all@lists.linux.dev>; Mon, 20 Mar 2023 15:16:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679325410; x=1710861410;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=1Kie3axpK0YEAMxl1xgeKO1QWh9kK4W20Umsd4CUIKU=;
  b=cMftfzmvTUr5mKWWXZbJFXcYV90w56t4/P1j7Vru6N6qfrtLzzNxIiIi
   z9ePcu6cMk+ER/ZjhsQWSk87PzSVa7QRLtCS27lUrxSx7eyW4fyMVjpD1
   fbAia6kGIuRetHdQQoXkTyr5m2dD+CqoZH/mrg/J1/PxmcaIcsjGLzMDj
   BtLNfmTg6jthRM+M7Vi6Xl1foFiYG5Knu0BPmqLoaGMluMD2KkIdPy/Wp
   KsiBNzeHI4/szIu9+W9Y8MiJeORQM+7Aj6P1R3lGQ/22XyVLJe8P6FCAH
   99yRH1BT9FVdUDX7vIuTHRe+AeuMdASujqq+Hy04xb2Otbj0RV77n07Vz
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10655"; a="337406319"
X-IronPort-AV: E=Sophos;i="5.98,274,1673942400"; 
   d="scan'208";a="337406319"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Mar 2023 08:16:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10655"; a="681109943"
X-IronPort-AV: E=Sophos;i="5.98,274,1673942400"; 
   d="scan'208";a="681109943"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 20 Mar 2023 08:16:47 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1peHFe-000B6w-1s;
	Mon, 20 Mar 2023 15:16:46 +0000
Date: Mon, 20 Mar 2023 23:16:32 +0800
From: kernel test robot <lkp@intel.com>
To: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
Subject: [intel-tdx:tdx-mig-wip 104/627] ld: Unexpected GOT/PLT entries
 detected!
Message-ID: <202303202319.7FaRpd36-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Kirill,

FYI, the error/warning still remains.

tree:   https://github.com/intel/tdx.git tdx-mig-wip
head:   61038376124dad7d5d6f0e23bb56643c4e9bd64a
commit: f9d9defcf521899d36fdc2577bb89a1bac32493d [104/627] x86/tdx: Add unaccepted memory support
config: x86_64-randconfig-a013 (https://download.01.org/0day-ci/archive/20230320/202303202319.7FaRpd36-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce (this is a W=1 build):
        # https://github.com/intel/tdx/commit/f9d9defcf521899d36fdc2577bb89a1bac32493d
        git remote add intel-tdx https://github.com/intel/tdx.git
        git fetch --no-tags intel-tdx tdx-mig-wip
        git checkout f9d9defcf521899d36fdc2577bb89a1bac32493d
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=x86_64 olddefconfig
        make W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303202319.7FaRpd36-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

>> ld: Unexpected GOT/PLT entries detected!
>> ld: Unexpected run-time procedure linkages detected!
>> ld: Unexpected run-time relocations (.rela) detected!
   ld: drivers/firmware/efi/libstub/x86-stub.stub.o: in function `exit_boot_func':
>> x86-stub.c:(.text+0x2d): undefined reference to `efi_is_64bit'
--
   drivers/firmware/efi/libstub/x86-stub.c: In function 'exit_boot_func':
>> drivers/firmware/efi/libstub/x86-stub.c:790:21: warning: implicit declaration of function 'efi_is_64bit' [-Wimplicit-function-declaration]
     790 |         signature = efi_is_64bit() ? EFI64_LOADER_SIGNATURE
         |                     ^~~~~~~~~~~~

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for EFI_STUB
   Depends on [n]: EFI [=n]
   Selected by [y]:
   - INTEL_TDX_GUEST [=y] && HYPERVISOR_GUEST [=y] && X86_64 [=y] && CPU_SUP_INTEL [=y] && X86_X2APIC [=y]
   WARNING: unmet direct dependencies detected for UNACCEPTED_MEMORY
   Depends on [n]: EFI [=n] && EFI_STUB [=y]
   Selected by [y]:
   - INTEL_TDX_GUEST [=y] && HYPERVISOR_GUEST [=y] && X86_64 [=y] && CPU_SUP_INTEL [=y] && X86_X2APIC [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
