Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4B2F136F
	for <oe-kbuild-all@lists.linux.dev>; Fri,  8 Sep 2023 05:35:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694151353; x=1725687353;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=7AIXlO0lwCoOkQqytY3geNhi/PUr/b034g2Zsxcob1g=;
  b=ZZSAu3dAnBe71sjqRKYwgArnYPDTKMW+N2qEo74kYkRZa44Vjj5BdV7M
   HXncPC7zrbh1TADYL+1kTJLwuV1uPTNG7/ey2uuIe6bT3Zm/CGfdsUc7A
   nz5sqWYynhJYfxfzCHZob4ptxHy5KnLQIxIGpRLuQoT5jqZK67y1MZDhY
   RRlHpD1MBJp0q5L8Qn9X3b801vxSZ9LAHkMOVKZKH+B+JYlX7W/1xrFIo
   3zEtqZ2kcWE6w5Dx4WZx9ekIl1d1O2jpV4UQyolQg0K/0nrOZ/Ixec9yX
   3guCRTVkY8k32rdK1efM5nYiByjVmjEmqIVQLFn9ut6LNDF4nIK1KgI7F
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10826"; a="367827860"
X-IronPort-AV: E=Sophos;i="6.02,236,1688454000"; 
   d="scan'208";a="367827860"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Sep 2023 22:35:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10826"; a="885520783"
X-IronPort-AV: E=Sophos;i="6.02,236,1688454000"; 
   d="scan'208";a="885520783"
Received: from lkp-server01.sh.intel.com (HELO 59b3c6e06877) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 07 Sep 2023 22:35:35 -0700
Received: from kbuild by 59b3c6e06877 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qeU9k-0001xb-2j;
	Fri, 08 Sep 2023 05:35:48 +0000
Date: Fri, 8 Sep 2023 13:35:09 +0800
From: kernel test robot <lkp@intel.com>
To: Sean Christopherson <seanjc@google.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [sean-jc:x86/guarded_kvm_headers 3/20]
 drivers/vfio/vfio_main.c:1379:43: error: invalid use of undefined type
 'struct vfio_group'
Message-ID: <202309081316.tBXnqEFL-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/sean-jc/linux x86/guarded_kvm_headers
head:   bac0634d402f98992a041354ea641c03d00ee498
commit: 9b51a91f465c0a59830755ee2a8f14620cb89709 [3/20] KVM: vfio: Pass in kvm_{get,put}_kvm() helpers instead of doing symbol lookups
config: x86_64-randconfig-071-20230908 (https://download.01.org/0day-ci/archive/20230908/202309081316.tBXnqEFL-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230908/202309081316.tBXnqEFL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309081316.tBXnqEFL-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/vfio/vfio_main.c:1305:6: warning: no previous prototype for 'vfio_device_set_kvm' [-Wmissing-prototypes]
    1305 | void vfio_device_set_kvm(struct vfio_kvm_reference *ref,
         |      ^~~~~~~~~~~~~~~~~~~
   drivers/vfio/vfio_main.c: In function 'vfio_file_set_kvm':
>> drivers/vfio/vfio_main.c:1379:43: error: invalid use of undefined type 'struct vfio_group'
    1379 |                 vfio_device_set_kvm(&group->kvm_ref, kvm, get_kvm, put_kvm);
         |                                           ^~


vim +1379 drivers/vfio/vfio_main.c

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
  1320	void vfio_device_get_kvm(struct vfio_device *device,
  1321				 struct vfio_kvm_reference *ref)
  1322	{
  1323		lockdep_assert_held(&device->dev_set->lock);
  1324	
  1325		/*
  1326		 * Note!  The "kvm" and "put_kvm" pointers *must* be transfered to the
  1327		 * device so that the device can put its reference to KVM.  KVM can
  1328		 * invoke vfio_device_set_kvm() to detach from VFIO, i.e. nullify all
  1329		 * pointers in @ref, even if a device holds a reference to KVM!  That
  1330		 * also means that detaching KVM from VFIO only prevents "new" devices
  1331		 * from using KVM, it doesn't invalidate KVM references in existing
  1332		 * devices.
  1333		 */
  1334		spin_lock(&ref->lock);
  1335		if (ref->kvm && ref->get_kvm(ref->kvm)) {
  1336			device->kvm = ref->kvm;
  1337			device->put_kvm = ref->put_kvm;
  1338		}
  1339		spin_lock(&ref->lock);
  1340	}
  1341	
  1342	void vfio_device_put_kvm(struct vfio_device *device)
  1343	{
  1344		lockdep_assert_held(&device->dev_set->lock);
  1345	
  1346		if (!device->kvm)
  1347			return;
  1348	
  1349		if (WARN_ON(!device->put_kvm))
  1350			return;
  1351	
  1352		device->put_kvm(device->kvm);
  1353	}
  1354	
  1355	static void vfio_device_file_set_kvm(struct file *file, struct kvm *kvm,
  1356				             bool (*get_kvm)(struct kvm *kvm),
  1357					     void (*put_kvm)(struct kvm *kvm))
  1358	{
  1359		struct vfio_device_file *df = file->private_data;
  1360	
  1361		vfio_device_set_kvm(&df->kvm_ref, kvm, get_kvm, put_kvm);
  1362	}
  1363	
  1364	/**
  1365	 * vfio_file_set_kvm - Link a kvm with VFIO drivers
  1366	 * @file: VFIO group file or VFIO device file
  1367	 * @kvm: KVM to link
  1368	 * @get_kvm: Callback to get a reference to @kvm
  1369	 * @put_kvm: Callback to put a reference to @kvm
  1370	 */
  1371	void vfio_file_set_kvm(struct file *file, struct kvm *kvm,
  1372			       bool (*get_kvm)(struct kvm *kvm),
  1373			       void (*put_kvm)(struct kvm *kvm))
  1374	{
  1375		struct vfio_group *group;
  1376	
  1377		group = vfio_group_from_file(file);
  1378		if (group)
> 1379			vfio_device_set_kvm(&group->kvm_ref, kvm, get_kvm, put_kvm);
  1380	
  1381		if (vfio_device_from_file(file))
  1382			vfio_device_file_set_kvm(file, kvm, get_kvm, put_kvm);
  1383	}
  1384	EXPORT_SYMBOL_GPL(vfio_file_set_kvm);
  1385	#endif
  1386	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
