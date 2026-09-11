Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5383E4BA1D3
	for <oe-kbuild-all@lists.linux.dev>; Fri, 11 Sep 2026 21:23:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789161807; cv=none; b=pwn2pwR6Tj3v3zfTuY2MNyIDpjrQosoY7JYK9sOqiRGFAZ6dn6/0eODmPblAOC3QHMwFsqBK9pzvchG9vUeM2OsuME7vYlIxJVYL48MX5vLVzBjS+vyso4dCCEfQTbPzvFHqWpUikfwzDltdAPh2kEli1zzMoauhUnc+lIHv0ak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789161807; c=relaxed/simple;
	bh=fs87BtYGNLtuHNYhQ0HxTB4V2EPha8OjmzwQ+9mDyBo=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ETdFoqmmV+eDpvLP3cpMDSLhmnzJ9HVDaaPB6Hx1kEHkopaTjd9ZSfvNmfJbFkVxJGO87LE+nNokS38AMnQj9x9+f7CpjiyeXHfX5xrC1eyceTPE/LWgKyRb5Q1bKIOIiUpPQHJtmcyiY0vt56PHMmmuaFMCBJryk5AwW3AXOF8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NGHrSvct; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NGHrSvct"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789161805; x=1820697805;
  h=date:from:to:cc:subject:message-id;
  bh=fs87BtYGNLtuHNYhQ0HxTB4V2EPha8OjmzwQ+9mDyBo=;
  b=NGHrSvctLgLCUuYhXVtU+TFsOYo7bYf9FoN2BbsqssPAfyb/7EICaY8G
   Dk6LwbVJ4VXiRaLhfPr05rwsx9YgnUJp//9sKrFT6/laZ/T9o3L/OLcqu
   uFcIo3OQyYY27Tu79ikpL1aNI9LbGWFdU53o3ryS+ClBsuexW6YIQpOXz
   69ozaht3hG5Jw42oWSlOeb/KQZ88ZkKMBnrjDdG+y7eOEQdougQ6IMZFo
   Krmq+4Xv71kzlVmX04S4TUqrokJf9qLbfhXxXuHSmzjwUAQ3xdKxLg/4p
   vQG3p9FMEX9Ys40McjP92GPYIJE7XJZ/S3p6vcOdaBEtPSS64OVGCsl6E
   Q==;
X-CSE-ConnectionGUID: a4K5qRM8RIGy5sM6ti9yfQ==
X-CSE-MsgGUID: 4+uuTzD8S8WjdDEeEaVwig==
X-IronPort-AV: E=McAfee;i="6800,10657,11902"; a="89639325"
X-IronPort-AV: E=Sophos;i="6.27,98,1787036400"; 
   d="scan'208";a="89639325"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Sep 2026 14:23:24 -0700
X-CSE-ConnectionGUID: udotvmDyRSiPUh5e2/gtzA==
X-CSE-MsgGUID: aaahv+AaTL2gIy/L7aB9Jg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,98,1787036400"; 
   d="scan'208";a="270637050"
Received: from lkp-server02.sh.intel.com (HELO 0a3643a6ed9d) ([10.239.97.151])
  by orviesa010.jf.intel.com with ESMTP; 11 Sep 2026 14:23:24 -0700
Received: from kbuild by 0a3643a6ed9d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x58iJ-000000002B1-3JUH;
	Fri, 11 Sep 2026 21:23:17 +0000
Date: Sat, 12 Sep 2026 05:23:07 +0800
From: kernel test robot <lkp@intel.com>
To: Sean Christopherson <seanjc@google.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [sean-jc:x86/uaccess_bad_mm 2/9]
 arch/powerpc/kvm/powerpc.c:775:48: error: 'slot' undeclared; did you mean
 'slots'?
Message-ID: <202609120412.o9nbvSrY-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/sean-jc/linux x86/uaccess_bad_mm
head:   4bb0673580aaec2cd71aef201741a528bfa407d0
commit: 86720f4ae2e361cdc3235fbe2c4c729458ed9ec4 [2/9] KVM: PPC: Flush/zap all memslots on kvm_arch_flush_shadow_all()
config: powerpc-allmodconfig (https://download.01.org/0day-ci/archive/20260912/202609120412.o9nbvSrY-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260912/202609120412.o9nbvSrY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609120412.o9nbvSrY-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/powerpc/kvm/powerpc.c: In function 'kvm_arch_flush_shadow_all':
>> arch/powerpc/kvm/powerpc.c:775:48: error: 'slot' undeclared (first use in this function); did you mean 'slots'?
     775 |                 kvmppc_core_flush_memslot(kvm, slot);
         |                                                ^~~~
         |                                                slots
   arch/powerpc/kvm/powerpc.c:775:48: note: each undeclared identifier is reported only once for each function it appears in


vim +775 arch/powerpc/kvm/powerpc.c

   766	
   767	void kvm_arch_flush_shadow_all(struct kvm *kvm)
   768	{
   769		struct kvm_memory_slot *memslot;
   770		struct kvm_memslots *slots;
   771		int bkt;
   772	
   773		slots = kvm_memslots(kvm);
   774		kvm_for_each_memslot(memslot, bkt, slots)
 > 775			kvmppc_core_flush_memslot(kvm, slot);
   776	}
   777	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
