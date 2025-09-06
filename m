Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFC22279DBA
	for <oe-kbuild-all@lists.linux.dev>; Sat,  6 Sep 2025 07:44:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757144658; cv=none; b=Ihn9Df45ceJ9jW74NUpaH0+sv/0kSaXeNxbE9N8UVW7RqhKe9tUtpeI9Abs2fhNaotPSyjEkM7/8FecvUhugMEUnBmSxEsYMdTlpx5bucDw8wualHNcQ24UhBnlzkUt0wfOvm7DmgXqMC7CASlx7XL665n3cydNawy8Ms8DVHic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757144658; c=relaxed/simple;
	bh=pGmmzgbmSAkdbqgoS0aZowo6t4R1NEooaxG6YTxKioc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=kAHcmfg7AsvdWi+yAwShypEbopvO2KhkRw9EMqHkqG62a/MojNz35rGfsB94ngzQn2tKCuLcfgzS1vkHE2jc3wW5nZJucEH6MuYoZ8utSdt8VEcJ+/bbExQizH3jD3iaOnjmDAg5+zBpkfbZqxSf9y+IeH9jV+6bGs2DBaF2W7o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=B/e5kAHa; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="B/e5kAHa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1757144656; x=1788680656;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=pGmmzgbmSAkdbqgoS0aZowo6t4R1NEooaxG6YTxKioc=;
  b=B/e5kAHahw2kOeOiHnW0hCjvDVtMiTxU6faRQgy3rc+HCvs+ngtM7DK2
   mkSIusonpU/aVhumQ3gxPhHJkd5AHWfQAwX09tgtiQzHxfXGTznGs2oKy
   uMusXlOjRgJoCS7hxXXfWa/nXR8U81XUFcXW68LoNbMjL2v67D9bBLzc+
   cyUEt15vUpLmn/PjrVY5mMIC3M0I+5hBQ/ta+5HZpMIY/7kyYdlih5Q1U
   tLK8DjEjXQmRBu8GTiAVtShALTo7grAC3X1oXyGa1xNgmDhYsJtQPsrd4
   e716H3ijTKJXnafnCqYYW4Sfh7BjiV+HEduUZU2fJR4j9RQ24kM+bGq/n
   Q==;
X-CSE-ConnectionGUID: tp7NaR6vRkiDFB5WKHpJQA==
X-CSE-MsgGUID: HF5AaUpFT3SODdrd7/WJsw==
X-IronPort-AV: E=McAfee;i="6800,10657,11544"; a="59593268"
X-IronPort-AV: E=Sophos;i="6.18,243,1751266800"; 
   d="scan'208";a="59593268"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Sep 2025 00:44:13 -0700
X-CSE-ConnectionGUID: GhU67gMdQWqpgEimKk0eXQ==
X-CSE-MsgGUID: v1zNRUvlQ0iYPZwdJ/qfVA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,243,1751266800"; 
   d="scan'208";a="171889788"
Received: from igk-lkp-server01.igk.intel.com (HELO ca260db0ef79) ([10.91.175.65])
  by fmviesa007.fm.intel.com with ESMTP; 06 Sep 2025 00:44:11 -0700
Received: from kbuild by ca260db0ef79 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uunaj-000495-32;
	Sat, 06 Sep 2025 07:44:09 +0000
Date: Sat, 6 Sep 2025 09:43:50 +0200
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12-desktop 0/11] htmldocs:
 Documentation/virt/kvm/devices/vfio.rst:88: ERROR: Unexpected indentation.
 [docutils]
Message-ID: <202509060937.TZgrpGNS-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android16-6.12-desktop
head:   b35af1e3cfa947b4447968903845ace580362cb3
commit: 63c521232808f6389f5288ba7b67a853bd92d16e [0/11] ANDROID: KVM: arm64: Add documentation for pvIOMMU UAPI am: 8561efaa1b
reproduce: (https://download.01.org/0day-ci/archive/20250906/202509060937.TZgrpGNS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509060937.TZgrpGNS-lkp@intel.com/

All errors (new ones prefixed by >>):

   -------------------------------------- [docutils]
   Documentation/virt/kvm/arm/mmio-guard.rst:94: ERROR: Unexpected indentation. [docutils]
   Documentation/virt/kvm/devices/vfio.rst:21: WARNING: Definition list ends without a blank line; unexpected unindent. [docutils]
   Documentation/virt/kvm/devices/vfio.rst:77: WARNING: Definition list ends without a blank line; unexpected unindent. [docutils]
   Documentation/virt/kvm/devices/vfio.rst:84: WARNING: Block quote ends without a blank line; unexpected unindent. [docutils]
>> Documentation/virt/kvm/devices/vfio.rst:88: ERROR: Unexpected indentation. [docutils]
   Documentation/virt/kvm/devices/vfio.rst:97: WARNING: Definition list ends without a blank line; unexpected unindent. [docutils]
   Documentation/virt/kvm/devices/vfio.rst:105: ERROR: Unexpected indentation. [docutils]
   Documentation/virt/kvm/devices/vfio.rst:106: WARNING: Block quote ends without a blank line; unexpected unindent. [docutils]
   Documentation/virt/kvm/x86/pkvm-intel.rst:353: WARNING: Bullet list ends without a blank line; unexpected unindent. [docutils]
   Documentation/virt/kvm/x86/pkvm-intel.rst:432: WARNING: Block quote ends without a blank line; unexpected unindent. [docutils]


vim +88 Documentation/virt/kvm/devices/vfio.rst

8561efaa1bdcb2 Mostafa Saleh 2024-07-22  63  
8561efaa1bdcb2 Mostafa Saleh 2024-07-22  64  KVM_DEV_VFIO_PVIOMMU attributes:
8561efaa1bdcb2 Mostafa Saleh 2024-07-22  65    KVM_DEV_VFIO_PVIOMMU_ATTACH: Create and attach a pvIOMMU instance to the
8561efaa1bdcb2 Mostafa Saleh 2024-07-22  66      KVM VM associated with this device, returns a file descriptor "pviommufd"
8561efaa1bdcb2 Mostafa Saleh 2024-07-22  67      for this IOMMU which supports some IOCTLs.
8561efaa1bdcb2 Mostafa Saleh 2024-07-22  68  
8561efaa1bdcb2 Mostafa Saleh 2024-07-22  69    KVM_DEV_VFIO_PVIOMMU_GET_INFO: Retrieve information about IOMMUs for a VFIO
8561efaa1bdcb2 Mostafa Saleh 2024-07-22  70      devicefd, using the following struct:
8561efaa1bdcb2 Mostafa Saleh 2024-07-22  71  
8561efaa1bdcb2 Mostafa Saleh 2024-07-22  72  		struct kvm_vfio_iommu_info {
8561efaa1bdcb2 Mostafa Saleh 2024-07-22  73  			__u32 size;
8561efaa1bdcb2 Mostafa Saleh 2024-07-22  74  			__s32 device_fd;
8561efaa1bdcb2 Mostafa Saleh 2024-07-22  75  			__u32 out_nr_sids;
8561efaa1bdcb2 Mostafa Saleh 2024-07-22  76  			__u32 __reserved;
8561efaa1bdcb2 Mostafa Saleh 2024-07-22  77  		};
8561efaa1bdcb2 Mostafa Saleh 2024-07-22  78  
8561efaa1bdcb2 Mostafa Saleh 2024-07-22  79  	  Where kvm_vfio_iommu_info.device_fd the input VFIO device ID, and
8561efaa1bdcb2 Mostafa Saleh 2024-07-22  80  	  kvm_vfio_iommu_info.out_nr_sids is the number stream IDs(endpoint) for
8561efaa1bdcb2 Mostafa Saleh 2024-07-22  81  	  this device, this similar to VFIO_DEVICE_GET_IRQ_INFO which returns the
8561efaa1bdcb2 Mostafa Saleh 2024-07-22  82  	  number of irqs for a VFIO device.
8561efaa1bdcb2 Mostafa Saleh 2024-07-22  83  	  size is added to allow the struct to be extended, while __reserved
8561efaa1bdcb2 Mostafa Saleh 2024-07-22  84        must be zero.
8561efaa1bdcb2 Mostafa Saleh 2024-07-22  85  
8561efaa1bdcb2 Mostafa Saleh 2024-07-22  86    The rest of the IOCTLs are used to configure the pvIOMMU are part of
8561efaa1bdcb2 Mostafa Saleh 2024-07-22  87    the pviommufd returned from the attach operation:
8561efaa1bdcb2 Mostafa Saleh 2024-07-22 @88      KVM_PVIOMMU_SET_CONFIG: Configure pvIOMMU for an endpoint for a device,

:::::: The code at line 88 was first introduced by commit
:::::: 8561efaa1bdcb2aa3d5c571ebe57e56204735632 ANDROID: KVM: arm64: Add documentation for pvIOMMU UAPI

:::::: TO: Mostafa Saleh <smostafa@google.com>
:::::: CC: Carlos Llamas <cmllamas@google.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
