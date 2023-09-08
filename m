Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A06E510EE
	for <oe-kbuild-all@lists.linux.dev>; Fri,  8 Sep 2023 02:24:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694139886; x=1725675886;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=V/vzbsHKdfZ9KZWcuQZW7uKeVFX368VsEQih/bzGuBI=;
  b=aXRexUpkilEW2I7reJUzKDcKD7xiWUQJbQo6S5arX53UdZHEY7crTUE1
   rk4dmRfiOQ/1mdmeNZ1nJOZLkWBCvrLx4VRMic21Bl1x1nTept5AzMHC3
   x+mP5YjREUaNwAiqEd9iU+OcpoXzLdqriFjE3VPe58B8+qPb8LK+pazRy
   PbXm7li8UmduNtNu8ycCkoevkWfVxBvl+WYRgRLr1o65gyHGqisOQU1+L
   HztcF39ugmVDzxs9qnEZPTaOeEDX6m6aeV1mMWGGofgt18kOOP7e5Rd6i
   aqn2F2eNZuSLM/hUjD18iIrFxLstriAwrYjFMGGBygFKnIF6+CC12ZI6Z
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10826"; a="381342483"
X-IronPort-AV: E=Sophos;i="6.02,236,1688454000"; 
   d="scan'208";a="381342483"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Sep 2023 19:24:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10826"; a="812383946"
X-IronPort-AV: E=Sophos;i="6.02,236,1688454000"; 
   d="scan'208";a="812383946"
Received: from lkp-server01.sh.intel.com (HELO 59b3c6e06877) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 07 Sep 2023 19:24:44 -0700
Received: from kbuild by 59b3c6e06877 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qeRAo-0001po-2K;
	Fri, 08 Sep 2023 02:24:42 +0000
Date: Fri, 8 Sep 2023 10:23:49 +0800
From: kernel test robot <lkp@intel.com>
To: Sean Christopherson <seanjc@google.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [sean-jc:x86/guarded_kvm_headers 3/18]
 drivers/vfio/vfio_main.c:1305:6: warning: no previous declaration for
 'vfio_device_set_kvm'
Message-ID: <202309081044.rK1Wq1P4-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/sean-jc/linux x86/guarded_kvm_headers
head:   0da764acdb7ea77d41e89508390331b1deb4076b
commit: 9b51a91f465c0a59830755ee2a8f14620cb89709 [3/18] KVM: vfio: Pass in kvm_{get,put}_kvm() helpers instead of doing symbol lookups
config: x86_64-randconfig-013-20230908 (https://download.01.org/0day-ci/archive/20230908/202309081044.rK1Wq1P4-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230908/202309081044.rK1Wq1P4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309081044.rK1Wq1P4-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/vfio/vfio_main.c:1305:6: warning: no previous declaration for 'vfio_device_set_kvm' [-Wmissing-declarations]
    void vfio_device_set_kvm(struct vfio_kvm_reference *ref,
         ^~~~~~~~~~~~~~~~~~~


vim +/vfio_device_set_kvm +1305 drivers/vfio/vfio_main.c

  1303	
  1304	#if IS_ENABLED(CONFIG_KVM)
> 1305	void vfio_device_set_kvm(struct vfio_kvm_reference *ref,
  1306				 struct kvm *kvm,
  1307				 bool (*get_kvm)(struct kvm *kvm),
  1308				 void (*put_kvm)(struct kvm *kvm))
  1309	{
  1310		if (WARN_ON_ONCE(kvm && (!get_kvm || !put_kvm)))
  1311			return;
  1312	
  1313		spin_lock(&ref->lock);
  1314		ref->kvm = kvm;
  1315		ref->get_kvm = get_kvm;
  1316		ref->put_kvm = put_kvm;
  1317		spin_unlock(&ref->lock);
  1318	}
  1319	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
