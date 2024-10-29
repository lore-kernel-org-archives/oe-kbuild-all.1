Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28D07190486
	for <oe-kbuild-all@lists.linux.dev>; Tue, 29 Oct 2024 19:15:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730229326; cv=none; b=C0ikgtV2AeiclAnwZ5u54ZT4YUBruldzWKnrcnHm8u9oS672sd8hnBGWbWOAvZ7mCL+M91NAoPyvyR6c8yh1+7wg64PaXddIDpdH2YgNNIpCSR0mosU3f/3tpambqXOIRlh5wvmpm01MG9NtFWEqo/cPHM83j22snMp2BukYsYI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730229326; c=relaxed/simple;
	bh=fol3lReCl+EEvoqhQZzbp7CshrqaCj/RI2ZfdTsC8lA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=dea3VWLh9ZlIc1Jx/Eu9SwfbYr9NEQ3rfd0K82Qv6mUyrDGUdFCkUUeXQHHyc+Q6vF/TT9hAj4qAHQwtVA1ylTsmkQx5xkoX0Wh6F5ipYZr/TklzzhKQAuiuAjZn9AcNXHXgWOGmhpDdJXioa92fBk17r05RD2YAr2mUqeslapg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PA9PB3Tb; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PA9PB3Tb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730229324; x=1761765324;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=fol3lReCl+EEvoqhQZzbp7CshrqaCj/RI2ZfdTsC8lA=;
  b=PA9PB3TbewHgizCrbsVtuCdmRyDlzaDvQo14RpU5CKhZBAEaGF/L9bSb
   bOgGp3iYYeHVDNW62H1qkT2Js2/S93F/gFwX8GChnYfWMnPiBNs3y0h1w
   Ma/p/HL3y3NWBQ0mqfguyBot1DtVWQuho/VTDpoTyr+gSSX2jsfs8Oe3W
   rTom/wBK082OjeJ5GJ/nzYfmKr33PDdmIk37KYgjFJTVZIQl3ysAEBmAx
   vE0iF9vYZvjr7Rj4/J7zPtLQpmWoiZk8DXQaLoW0iofZlnKbbdbFOLME4
   0OaFewQaA0F5iOL+j8w57gtN2oM4gn4KAW3LZXoy/6Qrkoqttv9MYyq9G
   A==;
X-CSE-ConnectionGUID: Za2L0zR3RgeB9aVIviriyg==
X-CSE-MsgGUID: C9K+O82rT/+ihxr7aOPD2Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11240"; a="33695083"
X-IronPort-AV: E=Sophos;i="6.11,241,1725346800"; 
   d="scan'208";a="33695083"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Oct 2024 12:15:23 -0700
X-CSE-ConnectionGUID: vkAUEdUGSN2Zw/1LUmhKTA==
X-CSE-MsgGUID: aUurtH+wQuOiy9aMgh7h+g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,241,1725346800"; 
   d="scan'208";a="119544147"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 29 Oct 2024 12:15:22 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t5rgW-000e26-0x;
	Tue, 29 Oct 2024 19:15:20 +0000
Date: Wed, 30 Oct 2024 03:14:52 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6-partner_predev 7/68]
 include/linux/kvm_host.h:1576: multiple definition of
 `kvm_arch_reclaim_device';
 arch/x86/kvm/vmx/vmx.o:include/linux/kvm_host.h:1576: first defined here
Message-ID: <202410300308.Qsd7Ez0C-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android15-6.6-partner_predev
head:   0db30a10b0076364f5db3533414a8aea94f662d6
commit: 6f86b0b0d35ef8ed8a18b9012d5c4909c90dc50f [7/68] ANDROID: KVM: Add arch function for device assignment
config: x86_64-rhel-8.3 (https://download.01.org/0day-ci/archive/20241030/202410300308.Qsd7Ez0C-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241030/202410300308.Qsd7Ez0C-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410300308.Qsd7Ez0C-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from arch/x86/events/intel/core.c:17:
>> include/linux/kvm_host.h:1575:6: warning: no previous prototype for 'kvm_arch_reclaim_device' [-Wmissing-prototypes]
    1575 | void kvm_arch_reclaim_device(struct device *dev)
         |      ^~~~~~~~~~~~~~~~~~~~~~~
>> include/linux/kvm_host.h:1579:6: warning: no previous prototype for 'kvm_arch_reclaim_group' [-Wmissing-prototypes]
    1579 | void kvm_arch_reclaim_group(struct iommu_group *group)
         |      ^~~~~~~~~~~~~~~~~~~~~~
--
   In file included from arch/x86/kvm/../../../virt/kvm/vfio.c:11:
>> include/linux/kvm_host.h:1575:6: warning: no previous prototype for 'kvm_arch_reclaim_device' [-Wmissing-prototypes]
    1575 | void kvm_arch_reclaim_device(struct device *dev)
         |      ^~~~~~~~~~~~~~~~~~~~~~~
>> include/linux/kvm_host.h:1579:6: warning: no previous prototype for 'kvm_arch_reclaim_group' [-Wmissing-prototypes]
    1579 | void kvm_arch_reclaim_group(struct iommu_group *group)
         |      ^~~~~~~~~~~~~~~~~~~~~~
   In file included from include/linux/kallsyms.h:14,
                    from include/linux/ftrace.h:13,
                    from include/linux/kvm_host.h:32:
   arch/x86/kvm/../../../virt/kvm/vfio.c: In function 'kvm_vfio_file_get_device':
   arch/x86/kvm/../../../virt/kvm/vfio.c:88:25: error: 'vfio_file_get_device' undeclared (first use in this function); did you mean 'kvm_vfio_file_get_device'?
      88 |         fn = symbol_get(vfio_file_get_device);
         |                         ^~~~~~~~~~~~~~~~~~~~
   include/linux/module.h:304:33: note: in definition of macro 'symbol_get'
     304 | #define symbol_get(x) ((typeof(&x))(__symbol_get(__stringify(x))))
         |                                 ^
   arch/x86/kvm/../../../virt/kvm/vfio.c:88:25: note: each undeclared identifier is reported only once for each function it appears in
      88 |         fn = symbol_get(vfio_file_get_device);
         |                         ^~~~~~~~~~~~~~~~~~~~
   include/linux/module.h:304:33: note: in definition of macro 'symbol_get'
     304 | #define symbol_get(x) ((typeof(&x))(__symbol_get(__stringify(x))))
         |                                 ^
--
   ld: arch/x86/kvm/vmx/pmu_intel.o: in function `kvm_arch_reclaim_device':
>> include/linux/kvm_host.h:1576: multiple definition of `kvm_arch_reclaim_device'; arch/x86/kvm/vmx/vmx.o:include/linux/kvm_host.h:1576: first defined here
   ld: arch/x86/kvm/vmx/pmu_intel.o: in function `kvm_arch_reclaim_group':
>> include/linux/kvm_host.h:1579: multiple definition of `kvm_arch_reclaim_group'; arch/x86/kvm/vmx/vmx.o:include/linux/kvm_host.h:1579: first defined here
   ld: arch/x86/kvm/vmx/vmcs12.o: in function `kvm_arch_reclaim_device':
>> include/linux/kvm_host.h:1576: multiple definition of `kvm_arch_reclaim_device'; arch/x86/kvm/vmx/vmx.o:include/linux/kvm_host.h:1576: first defined here
   ld: arch/x86/kvm/vmx/vmcs12.o: in function `kvm_arch_reclaim_group':
>> include/linux/kvm_host.h:1579: multiple definition of `kvm_arch_reclaim_group'; arch/x86/kvm/vmx/vmx.o:include/linux/kvm_host.h:1579: first defined here
   ld: arch/x86/kvm/vmx/hyperv.o: in function `kvm_arch_reclaim_device':
>> include/linux/kvm_host.h:1576: multiple definition of `kvm_arch_reclaim_device'; arch/x86/kvm/vmx/vmx.o:include/linux/kvm_host.h:1576: first defined here
   ld: arch/x86/kvm/vmx/hyperv.o: in function `kvm_arch_reclaim_group':
>> include/linux/kvm_host.h:1579: multiple definition of `kvm_arch_reclaim_group'; arch/x86/kvm/vmx/vmx.o:include/linux/kvm_host.h:1579: first defined here
   ld: arch/x86/kvm/vmx/nested.o: in function `kvm_arch_reclaim_device':
>> include/linux/kvm_host.h:1576: multiple definition of `kvm_arch_reclaim_device'; arch/x86/kvm/vmx/vmx.o:include/linux/kvm_host.h:1576: first defined here
   ld: arch/x86/kvm/vmx/nested.o: in function `kvm_arch_reclaim_group':
>> include/linux/kvm_host.h:1579: multiple definition of `kvm_arch_reclaim_group'; arch/x86/kvm/vmx/vmx.o:include/linux/kvm_host.h:1579: first defined here
   ld: arch/x86/kvm/vmx/posted_intr.o: in function `kvm_arch_reclaim_device':
>> include/linux/kvm_host.h:1576: multiple definition of `kvm_arch_reclaim_device'; arch/x86/kvm/vmx/vmx.o:include/linux/kvm_host.h:1576: first defined here
   ld: arch/x86/kvm/vmx/posted_intr.o: in function `kvm_arch_reclaim_group':
>> include/linux/kvm_host.h:1579: multiple definition of `kvm_arch_reclaim_group'; arch/x86/kvm/vmx/vmx.o:include/linux/kvm_host.h:1579: first defined here
--
   ld: arch/x86/kvm/svm/pmu.o: in function `kvm_arch_reclaim_device':
>> include/linux/kvm_host.h:1576: multiple definition of `kvm_arch_reclaim_device'; arch/x86/kvm/svm/svm.o:include/linux/kvm_host.h:1576: first defined here
   ld: arch/x86/kvm/svm/pmu.o: in function `kvm_arch_reclaim_group':
>> include/linux/kvm_host.h:1579: multiple definition of `kvm_arch_reclaim_group'; arch/x86/kvm/svm/svm.o:include/linux/kvm_host.h:1579: first defined here
   ld: arch/x86/kvm/svm/nested.o: in function `kvm_arch_reclaim_device':
>> include/linux/kvm_host.h:1576: multiple definition of `kvm_arch_reclaim_device'; arch/x86/kvm/svm/svm.o:include/linux/kvm_host.h:1576: first defined here
   ld: arch/x86/kvm/svm/nested.o: in function `kvm_arch_reclaim_group':
>> include/linux/kvm_host.h:1579: multiple definition of `kvm_arch_reclaim_group'; arch/x86/kvm/svm/svm.o:include/linux/kvm_host.h:1579: first defined here
   ld: arch/x86/kvm/svm/avic.o: in function `kvm_arch_reclaim_device':
>> include/linux/kvm_host.h:1576: multiple definition of `kvm_arch_reclaim_device'; arch/x86/kvm/svm/svm.o:include/linux/kvm_host.h:1576: first defined here
   ld: arch/x86/kvm/svm/avic.o: in function `kvm_arch_reclaim_group':
>> include/linux/kvm_host.h:1579: multiple definition of `kvm_arch_reclaim_group'; arch/x86/kvm/svm/svm.o:include/linux/kvm_host.h:1579: first defined here
   ld: arch/x86/kvm/svm/sev.o: in function `kvm_arch_reclaim_device':
>> include/linux/kvm_host.h:1576: multiple definition of `kvm_arch_reclaim_device'; arch/x86/kvm/svm/svm.o:include/linux/kvm_host.h:1576: first defined here
   ld: arch/x86/kvm/svm/sev.o: in function `kvm_arch_reclaim_group':
>> include/linux/kvm_host.h:1579: multiple definition of `kvm_arch_reclaim_group'; arch/x86/kvm/svm/svm.o:include/linux/kvm_host.h:1579: first defined here
   ld: arch/x86/kvm/svm/hyperv.o: in function `kvm_arch_reclaim_device':
>> include/linux/kvm_host.h:1576: multiple definition of `kvm_arch_reclaim_device'; arch/x86/kvm/svm/svm.o:include/linux/kvm_host.h:1576: first defined here
   ld: arch/x86/kvm/svm/hyperv.o: in function `kvm_arch_reclaim_group':
>> include/linux/kvm_host.h:1579: multiple definition of `kvm_arch_reclaim_group'; arch/x86/kvm/svm/svm.o:include/linux/kvm_host.h:1579: first defined here
   ld: arch/x86/kvm/svm/svm_onhyperv.o: in function `kvm_arch_reclaim_device':
>> include/linux/kvm_host.h:1576: multiple definition of `kvm_arch_reclaim_device'; arch/x86/kvm/svm/svm.o:include/linux/kvm_host.h:1576: first defined here
   ld: arch/x86/kvm/svm/svm_onhyperv.o: in function `kvm_arch_reclaim_group':
>> include/linux/kvm_host.h:1579: multiple definition of `kvm_arch_reclaim_group'; arch/x86/kvm/svm/svm.o:include/linux/kvm_host.h:1579: first defined here


vim +1576 include/linux/kvm_host.h

  1574	
> 1575	void kvm_arch_reclaim_device(struct device *dev)
> 1576	{
  1577	}
  1578	
> 1579	void kvm_arch_reclaim_group(struct iommu_group *group)
  1580	{
  1581	}
  1582	#endif
  1583	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
