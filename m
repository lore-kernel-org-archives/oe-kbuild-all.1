Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC037630
	for <oe-kbuild-all@lists.linux.dev>; Tue, 28 Feb 2023 01:03:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677546192; x=1709082192;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=GNXATICZrCryCWF3zTKDWa9J1UOucT2otAPdUnYNidc=;
  b=mN/BJJz7ciV/bfkHr19fTNBsZekCSROQQ/UHmP5+HDPiQLDm1rrfawWL
   1HwQklsfiDj2uRkyE2YKwbiMv4C76M2SHYjeuo7sKHj6UIyIH7VN5srTl
   BHxHa/oOhM1I6MMsHCeZulF6yRHJbJnz+0KOXS/6w2WaMb6Lr8Gboojmr
   dsk5Y5rVtJUT2OMH3yKSlwJoBCXU3+nlFU6SY8LIjUpYL/jo2lbJlHpZG
   R+vwo1WDE/oEOyVcNdofeI3ExwAs7wkLnjgd0588F5ek53ggOlPDsHQKM
   +DnxtYARSSI/t+ZUGql2b+86Do2WWzSCvuKc2w0zPFlseyCJw5hO7OJKZ
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10634"; a="331489821"
X-IronPort-AV: E=Sophos;i="5.98,220,1673942400"; 
   d="scan'208";a="331489821"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Feb 2023 17:03:12 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10634"; a="816891567"
X-IronPort-AV: E=Sophos;i="5.98,220,1673942400"; 
   d="scan'208";a="816891567"
Received: from lkp-server01.sh.intel.com (HELO 3895f5c55ead) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 27 Feb 2023 17:03:11 -0800
Received: from kbuild by 3895f5c55ead with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pWoOc-0004x4-1Z;
	Tue, 28 Feb 2023 01:03:10 +0000
Date: Tue, 28 Feb 2023 09:02:46 +0800
From: kernel test robot <lkp@intel.com>
To: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
Cc: oe-kbuild-all@lists.linux.dev, Andi Kleen <ak@linux.intel.com>,
	Dan Williams <dan.j.williams@intel.com>
Subject: [intel-tdx:guest-filter 6/33] arch/x86/coco/tdx/filter.c:25:22:
 sparse: sparse: symbol 'pci_allow_ids' was not declared. Should it be
 static?
Message-ID: <202302280819.ki4LDd35-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/intel/tdx.git guest-filter
head:   84e4da295a7c45d801702d377c2fbbff9d2929a2
commit: 17a15f5b2befecdcf297661a7b9c5537f5834bb8 [6/33] x86/tdx: Add device filter support for x86 TDX guest platform
config: x86_64-randconfig-s021 (https://download.01.org/0day-ci/archive/20230228/202302280819.ki4LDd35-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce:
        # apt-get install sparse
        # sparse version: v0.6.4-39-gce1a6720-dirty
        # https://github.com/intel/tdx/commit/17a15f5b2befecdcf297661a7b9c5537f5834bb8
        git remote add intel-tdx https://github.com/intel/tdx.git
        git fetch --no-tags intel-tdx guest-filter
        git checkout 17a15f5b2befecdcf297661a7b9c5537f5834bb8
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=x86_64 olddefconfig
        make W=1 C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=x86_64 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302280819.ki4LDd35-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> arch/x86/coco/tdx/filter.c:25:22: sparse: sparse: symbol 'pci_allow_ids' was not declared. Should it be static?

vim +/pci_allow_ids +25 arch/x86/coco/tdx/filter.c

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
