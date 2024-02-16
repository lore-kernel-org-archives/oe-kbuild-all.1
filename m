Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F836DDCA
	for <oe-kbuild-all@lists.linux.dev>; Fri, 16 Feb 2024 01:31:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708047092; cv=none; b=Osx3puwQqTNKhnQXFP5qSQ+lxtRKokMaBMCF2mJY0t8128I9Plkzlyfp4JgtmoWJ88V03Ezf9ItkuELsQCT0fY03x8R67G6OHFD0bh2UHublj84cFQInO32b961SsjG3KhaYK6HOQS/qfGR7EGzcFbUioZ/caSSvjtcuxzqP32g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708047092; c=relaxed/simple;
	bh=VcJ2BkXI5kGmkMNvYW5r73S4siLAsgxzMjlGq+UhuSI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=JnDil7qeMVB6M69zbhvfqYKtMjIBDqFrvvQmdJTEf76MdciSkfZIlC9/hjHmOg4mupkZZkbUI4gqquSc7sDtU50xDm0wxH01bWmraUU/h/cXtTM3n2QQ8U8nSjFA9t20G3MLCHWTu29owQO13mgd+jywuFTYDnKVNGTmjsObsSk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JMLiTSDY; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JMLiTSDY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1708047091; x=1739583091;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=VcJ2BkXI5kGmkMNvYW5r73S4siLAsgxzMjlGq+UhuSI=;
  b=JMLiTSDYxZYUFZsW/b8iR5XnkXrlL5ES+safSi7J5DrnCBnVUZroZ7OQ
   E/S+qi3xDklPJjpOJFJrS0ORw4Npm0KKEAwqXj3DDPE2sdp66MW6yWYEs
   La2oF/ZOSom1TtReh4s6Z9C5biVciuGzYZTywSuGhImDljBYXvSmyf32H
   27hJBBpsJ6m5wwlhA0P0YroUoawH5hhnObVBWeUHimeAyZO1lZWCASlIR
   ZSTlVlOQniAEpWInO1wBSpyyZf1tiDg4eRY+kjXb7lITwOWnPkEHq4y/Y
   hinZ1v9YK+AzielnuS+qW/ntZWMkKpUxTcY4b2hzYk0YG6bD25ujVp0jZ
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10985"; a="2286439"
X-IronPort-AV: E=Sophos;i="6.06,163,1705392000"; 
   d="scan'208";a="2286439"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Feb 2024 17:31:30 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,163,1705392000"; 
   d="scan'208";a="4001893"
Received: from lkp-server02.sh.intel.com (HELO 3c78fa4d504c) ([10.239.97.151])
  by fmviesa006.fm.intel.com with ESMTP; 15 Feb 2024 17:31:28 -0800
Received: from kbuild by 3c78fa4d504c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ran4W-0000uW-0w;
	Fri, 16 Feb 2024 01:31:24 +0000
Date: Fri, 16 Feb 2024 09:31:19 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:mirror-chromeos-5.10-arcvm 5/10]
 arch/x86/kvm/../../../virt/kvm/kvm_main.c:4388:50: error: 'kvm' undeclared
Message-ID: <202402160928.7tGk35l3-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common mirror-chromeos-5.10-arcvm
head:   f9690232902eb464b12d3aa2b42a878afdeb7e0a
commit: e83c4175c7c5f93b48df71be2926e360865c0120 [5/10] CHROMIUM: kvm: x86: enable/disable global/per-guest vcpu boost feature
config: i386-allmodconfig (https://download.01.org/0day-ci/archive/20240216/202402160928.7tGk35l3-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240216/202402160928.7tGk35l3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402160928.7tGk35l3-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/x86/kvm/../../../virt/kvm/kvm_main.c: In function 'kvm_dev_ioctl':
>> arch/x86/kvm/../../../virt/kvm/kvm_main.c:4388:50: error: 'kvm' undeclared (first use in this function)
    4388 |                         kvm_set_pv_sched_enabled(kvm, arg);
         |                                                  ^~~
   arch/x86/kvm/../../../virt/kvm/kvm_main.c:4388:50: note: each undeclared identifier is reported only once for each function it appears in


vim +/kvm +4388 arch/x86/kvm/../../../virt/kvm/kvm_main.c

  4350	
  4351	static long kvm_dev_ioctl(struct file *filp,
  4352				  unsigned int ioctl, unsigned long arg)
  4353	{
  4354		long r = -EINVAL;
  4355	
  4356		switch (ioctl) {
  4357		case KVM_GET_API_VERSION:
  4358			if (arg)
  4359				goto out;
  4360			r = KVM_API_VERSION;
  4361			break;
  4362		case KVM_CREATE_VM:
  4363			r = kvm_dev_ioctl_create_vm(arg);
  4364			break;
  4365		case KVM_CHECK_EXTENSION:
  4366			r = kvm_vm_ioctl_check_extension_generic(NULL, arg);
  4367			break;
  4368		case KVM_GET_VCPU_MMAP_SIZE:
  4369			if (arg)
  4370				goto out;
  4371			r = PAGE_SIZE;     /* struct kvm_run */
  4372	#ifdef CONFIG_X86
  4373			r += PAGE_SIZE;    /* pio data page */
  4374	#endif
  4375	#ifdef CONFIG_KVM_MMIO
  4376			r += PAGE_SIZE;    /* coalesced mmio ring page */
  4377	#endif
  4378			break;
  4379		case KVM_TRACE_ENABLE:
  4380		case KVM_TRACE_PAUSE:
  4381		case KVM_TRACE_DISABLE:
  4382			r = -EOPNOTSUPP;
  4383			break;
  4384	#ifdef CONFIG_PARAVIRT_SCHED_KVM
  4385		case KVM_SET_PV_SCHED_ENABLED:
  4386			r = -EINVAL;
  4387			if (arg == 0 || arg == 1) {
> 4388				kvm_set_pv_sched_enabled(kvm, arg);
  4389				r = 0;
  4390			}
  4391			break;
  4392		case KVM_GET_PV_SCHED_ENABLED:
  4393			r = kvm->pv_sched_enabled;
  4394			break;
  4395	#endif
  4396		default:
  4397			return kvm_arch_dev_ioctl(filp, ioctl, arg);
  4398		}
  4399	out:
  4400		return r;
  4401	}
  4402	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
