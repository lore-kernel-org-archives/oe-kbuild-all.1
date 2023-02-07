Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0481219B
	for <oe-kbuild-all@lists.linux.dev>; Tue,  7 Feb 2023 23:37:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675813074; x=1707349074;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=omBpa1w+GC1qoGnVF/p8MmF3o9UftNtB0LkmzVJYLOU=;
  b=bj1BP7zib3C1POrwyMpDYIBuhCZbIzIOENjE9P7agbNSIY0y5lv9NSDm
   K7GkgSjLpeAm+FNhvMBsNu1VrAHgcSxvSJN7bjVbDrEQg+4MCh1+i+P2e
   cZM4Hq/t4MwQIX+iWBHOtMRvSzYQcbFAc6DvYHf1ZQHRp9npE564wWz6y
   uyDQk7nGkjp+cz3xukclMO29/Iade/3J8poiiDf6xE4d8/F4Rkw3pJTKT
   Ig80hIH0B8gfHITljr2NkX2j9pgmILF3gKeJJLo7wgIT12snC3y8ldyFX
   UL6dVtoghun+F4X1wT4CMs0s12C8NJ955elIz3Jitllo1catJNY76Z8Zi
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10614"; a="394250533"
X-IronPort-AV: E=Sophos;i="5.97,279,1669104000"; 
   d="scan'208";a="394250533"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Feb 2023 15:37:41 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10614"; a="699429876"
X-IronPort-AV: E=Sophos;i="5.97,279,1669104000"; 
   d="scan'208";a="699429876"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 07 Feb 2023 15:37:40 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pPXWt-0003yc-0p;
	Tue, 07 Feb 2023 23:37:39 +0000
Date: Wed, 8 Feb 2023 07:36:53 +0800
From: kernel test robot <lkp@intel.com>
To: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
Cc: oe-kbuild-all@lists.linux.dev, Andi Kleen <ak@linux.intel.com>,
	Dan Williams <dan.j.williams@intel.com>
Subject: [intel-tdx:guest 71/136] arch/x86/kernel/tdx-filter.c:25:22: sparse:
 sparse: symbol 'pci_allow_ids' was not declared. Should it be static?
Message-ID: <202302080737.jUmj1Xdo-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/intel/tdx.git guest
head:   f3d7a7e86bf2f0d5ce629f2fb7be11dca88ac06d
commit: 01632c792a187f2923e951b58afb4f9b8ca6f6f0 [71/136] x86/tdx: Add device filter support for x86 TDX guest platform
config: x86_64-randconfig-s021 (https://download.01.org/0day-ci/archive/20230208/202302080737.jUmj1Xdo-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce:
        # apt-get install sparse
        # sparse version: v0.6.4-39-gce1a6720-dirty
        # https://github.com/intel/tdx/commit/01632c792a187f2923e951b58afb4f9b8ca6f6f0
        git remote add intel-tdx https://github.com/intel/tdx.git
        git fetch --no-tags intel-tdx guest
        git checkout 01632c792a187f2923e951b58afb4f9b8ca6f6f0
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=x86_64 olddefconfig
        make W=1 C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=x86_64 SHELL=/bin/bash arch/x86/kernel/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

sparse warnings: (new ones prefixed by >>)
>> arch/x86/kernel/tdx-filter.c:25:22: sparse: sparse: symbol 'pci_allow_ids' was not declared. Should it be static?

vim +/pci_allow_ids +25 arch/x86/kernel/tdx-filter.c

    16	
    17	/*
    18	 * Allow list for PCI bus
    19	 *
    20	 * NOTE: Device ID is duplicated here. But for small list
    21	 * of devices, it is easier to maintain the duplicated list
    22	 * here verses exporting the device ID table from the driver
    23	 * and use it.
    24	 */
  > 25	struct pci_device_id pci_allow_ids[] = {
    26		{ PCI_DEVICE(PCI_VENDOR_ID_REDHAT_QUMRANET, VIRTIO_TRANS_ID_NET) },
    27		{ PCI_DEVICE(PCI_VENDOR_ID_REDHAT_QUMRANET, VIRTIO_TRANS_ID_BLOCK) },
    28		{ PCI_DEVICE(PCI_VENDOR_ID_REDHAT_QUMRANET, VIRTIO_TRANS_ID_CONSOLE) },
    29		{ PCI_DEVICE(PCI_VENDOR_ID_REDHAT_QUMRANET, VIRTIO_TRANS_ID_9P) },
    30		{ PCI_DEVICE(PCI_VENDOR_ID_REDHAT_QUMRANET, VIRTIO1_ID_NET) },
    31		{ PCI_DEVICE(PCI_VENDOR_ID_REDHAT_QUMRANET, VIRTIO1_ID_BLOCK) },
    32		{ PCI_DEVICE(PCI_VENDOR_ID_REDHAT_QUMRANET, VIRTIO1_ID_CONSOLE) },
    33		{ PCI_DEVICE(PCI_VENDOR_ID_REDHAT_QUMRANET, VIRTIO1_ID_9P) },
    34		{ 0, },
    35	};
    36	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
