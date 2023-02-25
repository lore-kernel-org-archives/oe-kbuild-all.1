Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6066317FF
	for <oe-kbuild-all@lists.linux.dev>; Sat, 25 Feb 2023 07:47:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677311244; x=1708847244;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Ap5Pqm3j537Fg3J23kYjN57TRmGsmabVI10RTMqtgpg=;
  b=So0hVYDt9d/46tNAnxzOohjvMTQda1vZcA+tOGYklVZkNNUJJHmQ23+G
   /qD6D3UsfGfBmreHOup0amSSo02/Mo/fFjpnK6M5MwS+ziJzYMPfni3uv
   hdSNyHzo5eeevX5/gzhS+ETnpJSzpzvkxx74D2gq/p+jeIk3bAPkZjMLO
   RJ1o9+46xyTUyxSi4Fp2gIRkt7IP8SpMrtgMoVbG96K1FMlNfY1IhuG6b
   ZQV6/twOobJ1jPAcH5TwdC/LPx/VbfMCgBPmd8YnjDOOfERkvySxu9h0B
   QOoTajcy8aAjuWGYtnNphbxIH6OmXl34gekuqido3eGL/SnKpkPBg/Yp/
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10631"; a="313279023"
X-IronPort-AV: E=Sophos;i="5.97,327,1669104000"; 
   d="scan'208";a="313279023"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Feb 2023 23:47:23 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10631"; a="673144659"
X-IronPort-AV: E=Sophos;i="5.97,327,1669104000"; 
   d="scan'208";a="673144659"
Received: from lkp-server01.sh.intel.com (HELO 3895f5c55ead) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 24 Feb 2023 23:47:22 -0800
Received: from kbuild by 3895f5c55ead with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pVpH7-00032B-2w;
	Sat, 25 Feb 2023 07:47:21 +0000
Date: Sat, 25 Feb 2023 15:47:07 +0800
From: kernel test robot <lkp@intel.com>
To: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
Subject: [intel-tdx:tdx-mig-wip 104/625] ld: Unexpected GOT/PLT entries
 detected!
Message-ID: <202302251552.rsoPc0mZ-lkp@intel.com>
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
head:   e3f471304eb15841af5c14108b05d05b5370095b
commit: f9d9defcf521899d36fdc2577bb89a1bac32493d [104/625] x86/tdx: Add unaccepted memory support
config: x86_64-randconfig-a013 (https://download.01.org/0day-ci/archive/20230225/202302251552.rsoPc0mZ-lkp@intel.com/config)
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
| Link: https://lore.kernel.org/oe-kbuild-all/202302251552.rsoPc0mZ-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   drivers/firmware/efi/libstub/x86-stub.c: In function 'exit_boot_func':
>> drivers/firmware/efi/libstub/x86-stub.c:790:21: warning: implicit declaration of function 'efi_is_64bit' [-Wimplicit-function-declaration]
     790 |         signature = efi_is_64bit() ? EFI64_LOADER_SIGNATURE
         |                     ^~~~~~~~~~~~
--
>> ld: Unexpected GOT/PLT entries detected!
>> ld: Unexpected run-time procedure linkages detected!
>> ld: Unexpected run-time relocations (.rela) detected!
   ld: drivers/firmware/efi/libstub/x86-stub.stub.o: in function `exit_boot_func':
>> x86-stub.c:(.text+0x2d): undefined reference to `efi_is_64bit'

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
