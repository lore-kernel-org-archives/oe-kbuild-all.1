Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1636E2853F3
	for <oe-kbuild-all@lists.linux.dev>; Sat, 11 Apr 2026 04:25:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775881505; cv=none; b=gYQFsC2DcTxBZanly7l7h0o97qCc9RHMkvQGbuEuODAp4qXFU2Nyltz64aRHZlsHArEEFzo8GM7eYl1xXWlS/XbJ4k5XySJDXcqIbrfAmcGBvgvQTV3KuNzlVG45Xz5h4IONL2Vx+ie8SN/y2hpAXwxgn/qKetZ4eIkAoF5xGc4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775881505; c=relaxed/simple;
	bh=yvHB+i+JTS5bmJv4Ky5lOBo7NF6lJEXxmNCbnRf9aC0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=QK1ZJYrA0rdQxAvokxlSv2VHFyEycFeSCIp+aHv7UN+riQwZv5YBTZu+6hQaUgporX1Wd3EK3XqEWrB9oqkKt59PurznAmBsL7sCkm1Cu+njNURZHAZPr6pxGD8pKsxT9JzeucY++i6P5f0lKailfJ7paepE1a2IIjpIhRkSvB8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=V+Ss5zjj; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="V+Ss5zjj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775881503; x=1807417503;
  h=date:from:to:cc:subject:message-id;
  bh=yvHB+i+JTS5bmJv4Ky5lOBo7NF6lJEXxmNCbnRf9aC0=;
  b=V+Ss5zjjcxd5i0coSByyH37U9w6XeIZIXNEjYhXWzX+CohyGR1TOwKP1
   1yc9QW41agMlFCTESAwkcd7ZeJrUiUBpsGWof8hBGG/fN5KZcau4pVQv9
   jRyelcvdiSyRo/9wF+LkJcHIpcsAxIX4oNEdItm247TnFCPH/iCwnbnEl
   u8gBI3JksVuO0mP9/6borxYEEMzaiMzhU9x5LQiw4nGmFzbI1E3PmIk7Y
   Ugx/NITcc4jEiaUJMQXI4aSro7M0Cxi1cFnqAalJ99rJd33+H1HqCm9Kg
   rhDyn1/m9Mw06AcdKm2fDRymIpHEERchQqp5SdnTMC2jJDDQDk0fbXgmV
   w==;
X-CSE-ConnectionGUID: uZa8zHtHQri5k9e6DTHvUA==
X-CSE-MsgGUID: D++Xj6kkSFWHhdB2qVgpkQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11755"; a="80763186"
X-IronPort-AV: E=Sophos;i="6.23,172,1770624000"; 
   d="scan'208";a="80763186"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Apr 2026 21:25:02 -0700
X-CSE-ConnectionGUID: 65msAdEARlyHFDrkAtyzSw==
X-CSE-MsgGUID: PVz0pmUTR/yRCerYlVJJfA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,172,1770624000"; 
   d="scan'208";a="224544902"
Received: from lkp-server01.sh.intel.com (HELO 3eaaf1a74b89) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 10 Apr 2026 21:25:00 -0700
Received: from kbuild by 3eaaf1a74b89 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wBPty-000000000l5-1wFu;
	Sat, 11 Apr 2026 04:24:58 +0000
Date: Sat, 11 Apr 2026 12:24:57 +0800
From: kernel test robot <lkp@intel.com>
To: Sean Christopherson <seanjc@google.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [sean-jc:x86/vfio_kvm_file_refcount 1/1]
 arch/s390/kvm/../../../virt/kvm/vfio.c:178:38: error: passing argument 2 of
 'kvm_vfio_file_set_kvm' from incompatible pointer type
Message-ID: <202604111204.X10r01MO-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/sean-jc/linux x86/vfio_kvm_file_refcount
head:   3088b9660354afa55c95eeec0bba6d939123ce06
commit: 3088b9660354afa55c95eeec0bba6d939123ce06 [1/1] tmp
config: s390-randconfig-001-20260411 (https://download.01.org/0day-ci/archive/20260411/202604111204.X10r01MO-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260411/202604111204.X10r01MO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604111204.X10r01MO-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/s390/kvm/../../../virt/kvm/vfio.c: In function 'kvm_vfio_file_add':
>> arch/s390/kvm/../../../virt/kvm/vfio.c:178:38: error: passing argument 2 of 'kvm_vfio_file_set_kvm' from incompatible pointer type [-Werror=incompatible-pointer-types]
     kvm_vfio_file_set_kvm(kvf->file, dev->kvm);
                                      ~~~^~~~~
   arch/s390/kvm/../../../virt/kvm/vfio.c:38:67: note: expected 'struct file *' but argument is of type 'struct kvm *'
    static void kvm_vfio_file_set_kvm(struct file *file, struct file *kvm)
                                                         ~~~~~~~~~~~~~^~~
   cc1: some warnings being treated as errors

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for OF_GPIO
   Depends on [n]: GPIOLIB [=y] && OF [=y] && HAS_IOMEM [=n]
   Selected by [y]:
   - REGULATOR_RT5133 [=y] && REGULATOR [=y] && I2C [=y] && GPIOLIB [=y] && OF [=y]


vim +/kvm_vfio_file_set_kvm +178 arch/s390/kvm/../../../virt/kvm/vfio.c

e0f0bbc527f6e9 Alex Williamson 2013-10-30  142  
2f99073a722bee Yi Liu          2023-07-18  143  static int kvm_vfio_file_add(struct kvm_device *dev, unsigned int fd)
ec53500fae421e Alex Williamson 2013-10-30  144  {
ec53500fae421e Alex Williamson 2013-10-30  145  	struct kvm_vfio *kv = dev->private;
2f99073a722bee Yi Liu          2023-07-18  146  	struct kvm_vfio_file *kvf;
d55d9e7a457218 Jason Gunthorpe 2022-05-04  147  	struct file *filp;
73e2f19da50857 Dmitry Torokhov 2023-07-14  148  	int ret = 0;
ec53500fae421e Alex Williamson 2013-10-30  149  
d55d9e7a457218 Jason Gunthorpe 2022-05-04  150  	filp = fget(fd);
d55d9e7a457218 Jason Gunthorpe 2022-05-04  151  	if (!filp)
ec53500fae421e Alex Williamson 2013-10-30  152  		return -EBADF;
ec53500fae421e Alex Williamson 2013-10-30  153  
b1a59be8a2b64d Yi Liu          2023-07-18  154  	/* Ensure the FD is a vfio FD. */
b1a59be8a2b64d Yi Liu          2023-07-18  155  	if (!kvm_vfio_file_is_valid(filp)) {
3e5449d5f954f5 Jason Gunthorpe 2022-05-04  156  		ret = -EINVAL;
73e2f19da50857 Dmitry Torokhov 2023-07-14  157  		goto out_fput;
3e5449d5f954f5 Jason Gunthorpe 2022-05-04  158  	}
3e5449d5f954f5 Jason Gunthorpe 2022-05-04  159  
ec53500fae421e Alex Williamson 2013-10-30  160  	mutex_lock(&kv->lock);
ec53500fae421e Alex Williamson 2013-10-30  161  
2f99073a722bee Yi Liu          2023-07-18  162  	list_for_each_entry(kvf, &kv->file_list, node) {
2f99073a722bee Yi Liu          2023-07-18  163  		if (kvf->file == filp) {
73b0565f19a8fb Jason Gunthorpe 2022-05-04  164  			ret = -EEXIST;
73e2f19da50857 Dmitry Torokhov 2023-07-14  165  			goto out_unlock;
ec53500fae421e Alex Williamson 2013-10-30  166  		}
ec53500fae421e Alex Williamson 2013-10-30  167  	}
ec53500fae421e Alex Williamson 2013-10-30  168  
69050f8d6d075d Kees Cook       2026-02-20  169  	kvf = kzalloc_obj(*kvf, GFP_KERNEL_ACCOUNT);
2f99073a722bee Yi Liu          2023-07-18  170  	if (!kvf) {
73b0565f19a8fb Jason Gunthorpe 2022-05-04  171  		ret = -ENOMEM;
73e2f19da50857 Dmitry Torokhov 2023-07-14  172  		goto out_unlock;
ec53500fae421e Alex Williamson 2013-10-30  173  	}
ec53500fae421e Alex Williamson 2013-10-30  174  
73e2f19da50857 Dmitry Torokhov 2023-07-14  175  	kvf->file = get_file(filp);
2f99073a722bee Yi Liu          2023-07-18  176  	list_add_tail(&kvf->node, &kv->file_list);
ec53500fae421e Alex Williamson 2013-10-30  177  
9e0f4f2918c2ff Dmitry Torokhov 2023-07-14 @178  	kvm_vfio_file_set_kvm(kvf->file, dev->kvm);
e0f0bbc527f6e9 Alex Williamson 2013-10-30  179  	kvm_vfio_update_coherency(dev);
e0f0bbc527f6e9 Alex Williamson 2013-10-30  180  
73e2f19da50857 Dmitry Torokhov 2023-07-14  181  out_unlock:
73b0565f19a8fb Jason Gunthorpe 2022-05-04  182  	mutex_unlock(&kv->lock);
73e2f19da50857 Dmitry Torokhov 2023-07-14  183  out_fput:
d55d9e7a457218 Jason Gunthorpe 2022-05-04  184  	fput(filp);
73b0565f19a8fb Jason Gunthorpe 2022-05-04  185  	return ret;
73b0565f19a8fb Jason Gunthorpe 2022-05-04  186  }
ec53500fae421e Alex Williamson 2013-10-30  187  

:::::: The code at line 178 was first introduced by commit
:::::: 9e0f4f2918c2ff145d3dedee862d9919a6ed5812 kvm/vfio: ensure kvg instance stays around in kvm_vfio_group_add()

:::::: TO: Dmitry Torokhov <dmitry.torokhov@gmail.com>
:::::: CC: Alex Williamson <alex.williamson@redhat.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
