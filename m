Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D29519DFB4
	for <oe-kbuild-all@lists.linux.dev>; Sat, 11 Jan 2025 12:47:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736599623; cv=none; b=IGvDoq/wOm3x1ILznj0t1L15iK//JdIXq7mt1q2itF1HG8kbcWHlZ0E5Bo7FcaPPpW7DZrSUYRVASWqP8g9oNl6QhR00cnp9RBMMgyFH1nRg5j6+N7ts2FlAAVhqpJv2VXXzaoO5U0YM3FOwCO41FhqZ7NMWzt6uV4DqpcmD3uo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736599623; c=relaxed/simple;
	bh=Wqh0vJ9zU/lOGvNr/+zZ5v9fFShIiZ2WIJ1CBFisLgM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=k+F15YMrQseayXRlgMrlxKK03rtFswyuRt6y/TrgXwrrbt8xFekw48ZKFi03NW+dvGnegpIjQyi7GOt1ZXulL5OLdtM/3dRLHDy2ydwv/IBvTpr2i2EyIksTSQy59ZlaXykHXngimBEC/yaqwW3UyqDBZJMiicx8mdFuD6tlq2o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YOd3+ATP; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YOd3+ATP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736599621; x=1768135621;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Wqh0vJ9zU/lOGvNr/+zZ5v9fFShIiZ2WIJ1CBFisLgM=;
  b=YOd3+ATPhgSHSOBYmm6Us3eQk4cJhImF4rX0vyUsFEr4JSeLN/LM0Jw7
   GeXDBNIRsJ2tPYOLhkFAU9zi7Hd1izSKtuN/rZm5yU3cryxfGLa8qsgAy
   Bp+PvB2dlakw4ZbMyhXyvPMTGptKk1vPNIGp2TaCSf72PoFhVpine8hho
   eJIgfKJiffkS+10skah9hHCBEm9kl7ThyouGDCTPfdio6Y2JIZlgVDhlr
   ftBI7sMirDNzwS0RGhBX+7AMXous+ZCCf6o0Wq2H0Vihu1M8O0iV+xNQN
   kQqtQekLq4IUFwGZqFWmMS2sTsIjx462PPwN3XiiK1Xddb2HnrC++6EA6
   A==;
X-CSE-ConnectionGUID: ZnczFGXOSxWr+0Yl+BDVog==
X-CSE-MsgGUID: weilck3vRZy5mwr5qFJ63w==
X-IronPort-AV: E=McAfee;i="6700,10204,11312"; a="47460249"
X-IronPort-AV: E=Sophos;i="6.12,307,1728975600"; 
   d="scan'208";a="47460249"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jan 2025 04:47:00 -0800
X-CSE-ConnectionGUID: zh6TSGQDRDaws9vtFp8www==
X-CSE-MsgGUID: JvCOZARTRTezN61BUZI1bw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="104501263"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 11 Jan 2025 04:46:59 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tWatE-000KeP-1n;
	Sat, 11 Jan 2025 12:46:56 +0000
Date: Sat, 11 Jan 2025 20:46:47 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Xie XiuQi <xiexiuqi@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1395/1395] arch/x86/kvm/vmx.o: warning:
 objtool: copy_shadow_to_vmcs12()+0x13e: unreachable instruction
Message-ID: <202501112054.wCj5DExm-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Paolo,

FYI, the error/warning still remains.

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   97f98c391a1fd153ae010a2faf73f9e03270da6e
commit: f98a0954a8ca618f8d94da7f6d52c1a93e6717bb [1395/1395] KVM: nVMX: do not use dangling shadow VMCS after guest reset
config: x86_64-buildonly-randconfig-003-20250108 (https://download.01.org/0day-ci/archive/20250111/202501112054.wCj5DExm-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250111/202501112054.wCj5DExm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501112054.wCj5DExm-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from arch/x86/kvm/vmx.c:55:
   In file included from arch/x86/include/asm/mmu_context.h:12:
   In file included from arch/x86/include/asm/pgalloc.h:7:
   include/linux/pagemap.h:401:21: warning: cast from 'int (*)(struct file *, struct page *)' to 'filler_t *' (aka 'int (*)(void *, struct page *)') converts to incompatible function type [-Wcast-function-type-strict]
     401 |         filler_t *filler = (filler_t *)mapping->a_ops->readpage;
         |                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/x86/kvm/vmx.c:4508:6: warning: variable 'vmx_msr_low' set but not used [-Wunused-but-set-variable]
    4508 |         u32 vmx_msr_low, vmx_msr_high;
         |             ^
   arch/x86/kvm/vmx.c:70:32: warning: unused variable 'vmx_cpu_id' [-Wunused-const-variable]
      70 | static const struct x86_cpu_id vmx_cpu_id[] = {
         |                                ^~~~~~~~~~
   3 warnings generated.
>> arch/x86/kvm/vmx.o: warning: objtool: copy_shadow_to_vmcs12()+0x13e: unreachable instruction

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
