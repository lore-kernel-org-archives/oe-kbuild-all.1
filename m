Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D10810789
	for <oe-kbuild-all@lists.linux.dev>; Sat, 16 Dec 2023 02:11:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="h1wPhyin"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702692715; x=1734228715;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=tJvnUiB1+1aEeIMZvIR/Sq7HbUExH0j6W7oC5B66bRw=;
  b=h1wPhyinj6FQ6nim1T2MBBbm5Qw8MQ80gLaoA25NJBtjINUPMSqz9KiQ
   YmFtZzXTG8CX9PQfvO3Mwa+eWkxTskfCf/d0MrzCsh0BXtXco8jND3tsj
   q2N75Nz2c6gRCFXtdMKbaAO0MbVtT1l4XFH6zXWMECg3LOdaut7bphxSg
   xUuvM5FRxBhgwreupA0qom1xz7/Z1oQUNERYwD3MLEKPITJPIfAK5v9c4
   yXqVYeFoNPdbB8RZm11MqZCZ12iHenyZduIgLvRars0tOonz5sNVt4aFk
   w5zSxRPKXGi91eM1EhkyFv6FhLBX+UT3AbaaAREn7XWJzVB4wKnxyqWSJ
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10925"; a="375505169"
X-IronPort-AV: E=Sophos;i="6.04,280,1695711600"; 
   d="scan'208";a="375505169"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Dec 2023 18:11:54 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10925"; a="778470045"
X-IronPort-AV: E=Sophos;i="6.04,280,1695711600"; 
   d="scan'208";a="778470045"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga007.fm.intel.com with ESMTP; 15 Dec 2023 18:11:53 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rEK9f-00012O-1J;
	Sat, 16 Dec 2023 02:11:51 +0000
Date: Sat, 16 Dec 2023 10:11:02 +0800
From: kernel test robot <lkp@intel.com>
To: Sean Christopherson <seanjc@google.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [sean-jc:x86/guarded_kvm_headers_file 29/29]
 drivers/vfio/pci/vfio_pci_zdev.c:162:27: error: implicit declaration of
 function 'kvm_file_to_kvm'
Message-ID: <202312160921.Qpeh3gkB-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/sean-jc/linux x86/guarded_kvm_headers_file
head:   0be6b668fd3a7619601e3df43d90ed56971f9261
commit: 0be6b668fd3a7619601e3df43d90ed56971f9261 [29/29] KVM: Hide KVM internal data structures and values from kernel at-large
config: s390-allmodconfig (https://download.01.org/0day-ci/archive/20231216/202312160921.Qpeh3gkB-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231216/202312160921.Qpeh3gkB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312160921.Qpeh3gkB-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   drivers/vfio/pci/vfio_pci_zdev.c: In function 'vfio_pci_zdev_close_device':
>> drivers/vfio/pci/vfio_pci_zdev.c:162:27: error: implicit declaration of function 'kvm_file_to_kvm' [-Werror=implicit-function-declaration]
     162 |         struct kvm *kvm = kvm_file_to_kvm(vdev->vdev.kvm_vm);
         |                           ^~~~~~~~~~~~~~~
>> drivers/vfio/pci/vfio_pci_zdev.c:162:27: warning: initialization of 'struct kvm *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
   cc1: some warnings being treated as errors


vim +/kvm_file_to_kvm +162 drivers/vfio/pci/vfio_pci_zdev.c

8061d1c31f1a018 Matthew Rosato      2022-06-06  159  
8061d1c31f1a018 Matthew Rosato      2022-06-06  160  void vfio_pci_zdev_close_device(struct vfio_pci_core_device *vdev)
8061d1c31f1a018 Matthew Rosato      2022-06-06  161  {
832060a51cf1d52 Sean Christopherson 2023-12-11 @162  	struct kvm *kvm = kvm_file_to_kvm(vdev->vdev.kvm_vm);

:::::: The code at line 162 was first introduced by commit
:::::: 832060a51cf1d52a5c78c319584b99820fe3b68c KVM: vfio: Track "struct kvm" via file, not raw KVM object

:::::: TO: Sean Christopherson <seanjc@google.com>
:::::: CC: Sean Christopherson <seanjc@google.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
