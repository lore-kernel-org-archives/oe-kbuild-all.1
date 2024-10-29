Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED5C02F56
	for <oe-kbuild-all@lists.linux.dev>; Tue, 29 Oct 2024 05:04:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730178288; cv=none; b=kUg82aT8kEtJ+TkC7+5NRYOTtOxUVhm/xNyOSLZlUOB1Z5XRUkty9NullBmzg2fnxIRzbTiigIAo4TdcD0TzZNKhSsD/mFsdOqsPhR9FUHIioUeLWwmqnqoeSF/KBxUwpIR/YPZO7ewA/RkJE0HLr1f0WjAtMxq0rQhCSXaCNqQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730178288; c=relaxed/simple;
	bh=+xIQhkc4ANhrc28xNedK1iu72uEXhQDIUKktmLrJxOA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=bzbCJlrxxKD+TO2k61fQivt7B6iPCjqM9szORkA7WTum4e6yQt8oV+6ojCWgSx3BoQMjscfDtOrjqX3h6CmteMlb9DrxFsJcvbsnui0lNUukHe0XKThHdxibqlb8TkBNNps48DlYIJ1VA/3YkeK0/EeWTM7VprBv4/MX1WoBG1I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=atwz/rO5; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="atwz/rO5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730178286; x=1761714286;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=+xIQhkc4ANhrc28xNedK1iu72uEXhQDIUKktmLrJxOA=;
  b=atwz/rO5iVQVx6iV5afgKOQiYQJBikbqr36yJsvF7m8B0e/8aW+4Ik6h
   BSNVqpsF/JYq9UZUjSXLv9tQBNYl4HJKDYoV8Xi4RlNquXOAO3ogxlGDw
   xBogPrIE9kOH6kzYvmFyq2AplUV/8aZ9PFPWiWe5OQ75hcOFaGpPvz0qV
   XKoU/oOAMyMl8jVmAcuLS0PXFWOyAva8gNMBImlCrRTignLKERlELdEVd
   urps8oJuXL+ImWE0+JCEtA7P9w0tjLlY/6KZm6ZRl5NfEaU24CH2SYef+
   VnSa+o+ED2XBnwkeNuGi57Cn4pPb643R3r3lk674mZv2GsYvAGWGt/sdr
   Q==;
X-CSE-ConnectionGUID: z3beOD5UStK+WIAOnTCzTw==
X-CSE-MsgGUID: don5THYUSWWUg3hgYk4Yew==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="40336863"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="40336863"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Oct 2024 22:04:45 -0700
X-CSE-ConnectionGUID: 7e9Ozp2RQHWYyzl/Nxj50w==
X-CSE-MsgGUID: hrRZlDC+SYO74UkZsr+HCQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,241,1725346800"; 
   d="scan'208";a="81926552"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 28 Oct 2024 22:04:42 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t5ePH-000dGi-2p;
	Tue, 29 Oct 2024 05:04:39 +0000
Date: Tue, 29 Oct 2024 13:03:41 +0800
From: kernel test robot <lkp@intel.com>
To: kaixuxia@tencent.com, frankjpliu@tencent.com, kasong@tencent.com,
	sagazchen@tencent.com, kernelxing@tencent.com,
	aurelianliu@tencent.com, deshengwu@tencent.com,
	flyingpeng@tencent.com, jingqunli@tencent.com, jason.zeng@intel.com,
	wu.zheng@intel.com, yingbao.jia@intel.com, pei.p.jia@intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [opencloudos:next 13036/13046] arch/x86/kvm/x86.c:11156:6: sparse:
 sparse: symbol 'kvm_arch_vcpu_preempted_in_kernel' was not declared. Should
 it be static?
Message-ID: <202410291325.4DNG6ETN-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Sean,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://gitee.com/OpenCloudOS/OpenCloudOS-Kernel.git next
head:   ce9f9d823a41831d622fa11e29c3d620c044f51b
commit: 4071fe18bc901882fa719cbafb49a11f337ca17e [13036/13046] KVM: x86: Reorganize code in x86.c to co-locate vCPU blocking/running helpers
config: x86_64-randconfig-r112-20241029 (https://download.01.org/0day-ci/archive/20241029/202410291325.4DNG6ETN-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241029/202410291325.4DNG6ETN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410291325.4DNG6ETN-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   arch/x86/kvm/x86.c:246:47: sparse: sparse: array of flexible structures
   arch/x86/kvm/x86.c: note: in included file:
   include/linux/kvm_host.h:1946:54: sparse: sparse: array of flexible structures
   arch/x86/kvm/x86.c:272:49: sparse: sparse: array of flexible structures
   include/linux/kvm_host.h:1948:56: sparse: sparse: array of flexible structures
>> arch/x86/kvm/x86.c:11156:6: sparse: sparse: symbol 'kvm_arch_vcpu_preempted_in_kernel' was not declared. Should it be static?
   arch/x86/kvm/x86.c:3012:9: sparse: sparse: context imbalance in '__kvm_start_pvclock_update' - wrong count at exit
   arch/x86/kvm/x86.c:3023:13: sparse: sparse: context imbalance in 'kvm_end_pvclock_update' - unexpected unlock
   arch/x86/kvm/x86.c: note: in included file (through arch/x86/include/asm/uaccess.h, include/linux/uaccess.h, include/linux/sched/task.h, ...):
   arch/x86/include/asm/uaccess_64.h:88:24: sparse: sparse: cast removes address space '__user' of expression
   arch/x86/include/asm/uaccess_64.h:88:24: sparse: sparse: cast removes address space '__user' of expression
   arch/x86/include/asm/uaccess_64.h:88:24: sparse: sparse: cast removes address space '__user' of expression
   arch/x86/kvm/x86.c:4681:42: sparse: sparse: self-comparison always evaluates to false
   arch/x86/kvm/x86.c:4681:42: sparse: sparse: self-comparison always evaluates to false
   arch/x86/kvm/x86.c:4681:42: sparse: sparse: self-comparison always evaluates to false
   arch/x86/kvm/x86.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, ...):
   include/linux/srcu.h:285:9: sparse: sparse: context imbalance in 'vcpu_enter_guest' - unexpected unlock
   include/linux/srcu.h:285:9: sparse: sparse: context imbalance in 'vcpu_run' - unexpected unlock

vim +/kvm_arch_vcpu_preempted_in_kernel +11156 arch/x86/kvm/x86.c

 11155	
 11156	bool kvm_arch_vcpu_preempted_in_kernel(struct kvm_vcpu *vcpu)
 11157	{
 11158		return vcpu->arch.preempted_in_kernel;
 11159	}
 11160	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
