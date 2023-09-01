Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77993BE6E
	for <oe-kbuild-all@lists.linux.dev>; Fri,  1 Sep 2023 14:01:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693576910; x=1725112910;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=GPLhuLtJoHWcvg/TV7xstbyHDzmVZg3P7x9Q6dFngZI=;
  b=aT33zjFxdy/BfFRUFaH3nJhRS0HX58TWRi8d4tL1ASWKdjnfSomBKs+o
   dR+ZnUbgqUF0pWOl/WbVxG9J3RVdhwXxhAvjfdLSNJt8wXRwkQ0SNMTF9
   A9uMDMB8cRVpYtvgm12kaLGDyAc9jYdtvUioplyI+aCL7aGw4nbNPP0Mt
   kA4Dx7MMNH3VfmG8ZA3crKWFK535Fq6wjvvyiB6G1l3FoiG9xh2542CWX
   7E5mXgNj3l2t+xcGyo4ZDxZRMGWngZH5omI1yLyNiaMfhmZH66MsDy+QS
   qYJh+mIMoZlYVWSoX/+RoGKnOqG3ZtFv2DTlPaecVxTdJThJF1vXDeLQA
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10819"; a="361250283"
X-IronPort-AV: E=Sophos;i="6.02,219,1688454000"; 
   d="scan'208";a="361250283"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Sep 2023 07:01:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10819"; a="733535899"
X-IronPort-AV: E=Sophos;i="6.02,219,1688454000"; 
   d="scan'208";a="733535899"
Received: from lkp-server01.sh.intel.com (HELO 5d8055a4f6aa) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 01 Sep 2023 07:01:40 -0700
Received: from kbuild by 5d8055a4f6aa with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qc4iQ-0001LV-0q;
	Fri, 01 Sep 2023 14:01:38 +0000
Date: Fri, 1 Sep 2023 22:01:36 +0800
From: kernel test robot <lkp@intel.com>
To: Sean Christopherson <seanjc@google.com>
Cc: oe-kbuild-all@lists.linux.dev, Anish Ghulati <aghulati@google.com>
Subject: [sean-jc:x86/hide_kvm_details 180/187] drivers/vfio/group.c:868:
 warning: Function parameter or member 'get_kvm' not described in
 'vfio_file_set_kvm'
Message-ID: <202309012133.nb3V9DhL-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/sean-jc/linux x86/hide_kvm_details
head:   f2de177a2d8f1b545e0c199bf68cf80d7727c2f5
commit: 2547667bd2e567b534e2588c6fa9a972ef718769 [180/187] tmp
config: arm64-defconfig (https://download.01.org/0day-ci/archive/20230901/202309012133.nb3V9DhL-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230901/202309012133.nb3V9DhL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309012133.nb3V9DhL-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/vfio/group.c:868: warning: Function parameter or member 'get_kvm' not described in 'vfio_file_set_kvm'
>> drivers/vfio/group.c:868: warning: Function parameter or member 'put_kvm' not described in 'vfio_file_set_kvm'


vim +868 drivers/vfio/group.c

9eefba8002c27d Yi Liu              2022-11-25  856  
9eefba8002c27d Yi Liu              2022-11-25  857  /**
9eefba8002c27d Yi Liu              2022-11-25  858   * vfio_file_set_kvm - Link a kvm with VFIO drivers
9eefba8002c27d Yi Liu              2022-11-25  859   * @file: VFIO group file
9eefba8002c27d Yi Liu              2022-11-25  860   * @kvm: KVM to link
9eefba8002c27d Yi Liu              2022-11-25  861   *
9eefba8002c27d Yi Liu              2022-11-25  862   * When a VFIO device is first opened the KVM will be available in
9eefba8002c27d Yi Liu              2022-11-25  863   * device->kvm if one was associated with the group.
9eefba8002c27d Yi Liu              2022-11-25  864   */
2547667bd2e567 Sean Christopherson 2023-08-22  865  void vfio_file_set_kvm(struct file *file, struct kvm *kvm,
2547667bd2e567 Sean Christopherson 2023-08-22  866  		       int (*get_kvm)(struct kvm *kvm),
2547667bd2e567 Sean Christopherson 2023-08-22  867  		       void (*put_kvm)(struct kvm *kvm))
9eefba8002c27d Yi Liu              2022-11-25 @868  {
9eefba8002c27d Yi Liu              2022-11-25  869  	struct vfio_group *group = file->private_data;
9eefba8002c27d Yi Liu              2022-11-25  870  
9eefba8002c27d Yi Liu              2022-11-25  871  	if (!vfio_file_is_group(file))
9eefba8002c27d Yi Liu              2022-11-25  872  		return;
9eefba8002c27d Yi Liu              2022-11-25  873  
2b48f52f2bff8e Matthew Rosato      2023-02-03  874  	spin_lock(&group->kvm_ref_lock);
9eefba8002c27d Yi Liu              2022-11-25  875  	group->kvm = kvm;
2547667bd2e567 Sean Christopherson 2023-08-22  876  	group->get_kvm = get_kvm;
2547667bd2e567 Sean Christopherson 2023-08-22  877  	group->put_kvm = put_kvm;
2b48f52f2bff8e Matthew Rosato      2023-02-03  878  	spin_unlock(&group->kvm_ref_lock);
9eefba8002c27d Yi Liu              2022-11-25  879  }
9eefba8002c27d Yi Liu              2022-11-25  880  EXPORT_SYMBOL_GPL(vfio_file_set_kvm);
9eefba8002c27d Yi Liu              2022-11-25  881  

:::::: The code at line 868 was first introduced by commit
:::::: 9eefba8002c27d65ab52a533fd0611b099b73591 vfio: Move vfio group specific code into group.c

:::::: TO: Yi Liu <yi.l.liu@intel.com>
:::::: CC: Jason Gunthorpe <jgg@nvidia.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
