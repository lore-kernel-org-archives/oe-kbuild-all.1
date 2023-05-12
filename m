Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5065C7F4
	for <oe-kbuild-all@lists.linux.dev>; Fri, 12 May 2023 20:40:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683924058; x=1715460058;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=wH0SPQSaLBnklj/+zRWyqB050XvO8FEVGh1yo4hLukc=;
  b=SvUJwk+NDaS51PB67RRdglMi9z5lTfnp/KQGNocvDySzDtRxCPbJFDx4
   qE/dXuArCxe8eFuWJftdZ3LAh3E8AeUcuCZ9bOdf6bLE3Ay1LKGEMBSSL
   YrvRcjNV32EqUnTLp3XPsuL3oLe1PjJh+3XPMm1lrhMzAqQXED0mjzsut
   kBgbIMnhk9hPb2twvCnTzxGI1LJ9DCbZ1z5x0CNATRgwbOlvXPE4K+1yO
   H4dj7HFBWihbEshQO1mfb0SrWzo2kE/XlRwxHK1fcuIR2r0pD/VfTftoG
   bikpM3whrlXdKtigaJfckR+oQjSiy1vzrgKAKywm5KD4O9kRThypzzPGN
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10708"; a="340203840"
X-IronPort-AV: E=Sophos;i="5.99,269,1677571200"; 
   d="scan'208";a="340203840"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 May 2023 13:40:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10708"; a="844551966"
X-IronPort-AV: E=Sophos;i="5.99,269,1677571200"; 
   d="scan'208";a="844551966"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 12 May 2023 13:40:56 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pxZZP-000564-11;
	Fri, 12 May 2023 20:40:55 +0000
Date: Sat, 13 May 2023 04:40:11 +0800
From: kernel test robot <lkp@intel.com>
To: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
Cc: oe-kbuild-all@lists.linux.dev, Andi Kleen <ak@linux.intel.com>,
	Dan Williams <dan.j.williams@intel.com>
Subject: [intel-tdx:guest-filter 6/33] arch/x86/coco/tdx/filter.c:25:22:
 sparse: sparse: symbol 'pci_allow_ids' was not declared. Should it be
 static?
Message-ID: <202305130452.FZzb5bhB-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/intel/tdx.git guest-filter
head:   b143cfba688689945ae56d38a6f76100859b5025
commit: ad3392a755b5c4440bc92da2a95e8ec04caf0d6a [6/33] x86/tdx: Add device filter support for x86 TDX guest platform
config: x86_64-randconfig-s021 (https://download.01.org/0day-ci/archive/20230513/202305130452.FZzb5bhB-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce:
        # apt-get install sparse
        # sparse version: v0.6.4-39-gce1a6720-dirty
        # https://github.com/intel/tdx/commit/ad3392a755b5c4440bc92da2a95e8ec04caf0d6a
        git remote add intel-tdx https://github.com/intel/tdx.git
        git fetch --no-tags intel-tdx guest-filter
        git checkout ad3392a755b5c4440bc92da2a95e8ec04caf0d6a
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=x86_64 olddefconfig
        make W=1 C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=x86_64 SHELL=/bin/bash arch/x86/coco/tdx/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202305130452.FZzb5bhB-lkp@intel.com/

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
