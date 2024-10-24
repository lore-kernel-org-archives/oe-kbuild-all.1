Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06843804
	for <oe-kbuild-all@lists.linux.dev>; Thu, 24 Oct 2024 00:20:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729729226; cv=none; b=fwSxiYSbm4pVE+UeEzVfpuSNjy0hWa+WqW5SG2TKd9V5ke545v2z+WBZaksUVjMIYfcIcQeDsCJIGuejAZOQ2/IqpSijEq6UTsr53SKnSAfvYEkdNzAIJfXt8Cp4AovmC8yMsB3FvBHahXgsdccXshXdPRhF7Du6hGbeamMLSIc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729729226; c=relaxed/simple;
	bh=lsfJo5QWwRYO2EFptdfU3ViDsyeAmeaiertbjA+N8Ww=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=OlNVuxXtc5QE/tJv54q+s6KJBiQrm3chsutV1wcOoNO9asincdVD/G6XTjYWNJmQZPchGFmJOKSHnRm2EOIBNrAwoLHPTgOpRPf2rKV5A+4IYMDeEPp1Wn4hVbJHvypVMJuLWobGRyBnOe8veNHrmi0MOR8mqy85sKJLZy13/nw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ybe6G31i; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ybe6G31i"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729729225; x=1761265225;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=lsfJo5QWwRYO2EFptdfU3ViDsyeAmeaiertbjA+N8Ww=;
  b=Ybe6G31iJLBxMz887q9keKWhp7vEOYG+cVDi0Ond/9a/3Hyd3Ek63xRo
   MCC68IBCmvoTzcf1H367CsvGTmuccHz1q0uQ6QAGJfvz6uBSHRzVxbVY1
   upLIwZzElauhjYfC0ikYEs2pDEY+bwgJfn6PJxcOqsSxR20gDJuHAi1pm
   pg9TbKqhPQHDktXfKfPgnGXGXo0Wg3KxKvR+CEU9/fMxlc8Z3aZo5Jows
   rdlzTMNdWoTmTH0/gQlWycD9osIDYVJH79mGGePdegCIWSxE2rcNEEfn4
   xBPz5XmlcTeQ0oRw8I34qWKd/7WVxzBzx1GM1v5uYKiwSUqpNpDxGq3IV
   A==;
X-CSE-ConnectionGUID: D7kKOuW+SlGEG8FUX0mr7g==
X-CSE-MsgGUID: y6imyFuOTYqQOA9yrg79zQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11234"; a="54744093"
X-IronPort-AV: E=Sophos;i="6.11,227,1725346800"; 
   d="scan'208";a="54744093"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Oct 2024 17:20:24 -0700
X-CSE-ConnectionGUID: 2Hvya47ORsCdu2xpLvnFxA==
X-CSE-MsgGUID: vmkrugeeQbSvtSM+HW69pA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,227,1725346800"; 
   d="scan'208";a="80739706"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 23 Oct 2024 17:20:23 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t3laP-000Vju-14;
	Thu, 24 Oct 2024 00:20:21 +0000
Date: Thu, 24 Oct 2024 08:19:22 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6 156/176]
 arch/arm64/kvm/hyp_trace.c:709:37: warning: 'hyp_trace_raw_fops' defined but
 not used
Message-ID: <202410240841.oH22XQDh-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android15-6.6
head:   7f1ad2ebaa24958e3b0527f36d96e58f42cf3f0e
commit: 8ae140fc839f2739df17942add206b1dc938c85c [156/176] ANDROID: KVM: arm64: Add raw interface to nVHE hyp tracing
config: arm64-randconfig-002-20241024 (https://download.01.org/0day-ci/archive/20241024/202410240841.oH22XQDh-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241024/202410240841.oH22XQDh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410240841.oH22XQDh-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/arm64/kvm/hyp_trace.c:709:37: warning: 'hyp_trace_raw_fops' defined but not used [-Wunused-const-variable=]
     709 | static const struct file_operations hyp_trace_raw_fops = {
         |                                     ^~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp_trace.c: In function 'hyp_trace_init_tracefs':
   arch/arm64/kvm/hyp_trace.c:778:66: warning: '%ld' directive output may be truncated writing between 1 and 20 bytes into a region of size 13 [-Wformat-truncation=]
     778 |                 snprintf(per_cpu_name, sizeof(per_cpu_name), "cpu%ld", cpu);
         |                                                                  ^~~
   arch/arm64/kvm/hyp_trace.c:778:62: note: directive argument in the range [-9223372036854775808, 4294967294]
     778 |                 snprintf(per_cpu_name, sizeof(per_cpu_name), "cpu%ld", cpu);
         |                                                              ^~~~~~~~
   arch/arm64/kvm/hyp_trace.c:778:17: note: 'snprintf' output between 5 and 24 bytes into a destination of size 16
     778 |                 snprintf(per_cpu_name, sizeof(per_cpu_name), "cpu%ld", cpu);
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/hyp_trace_raw_fops +709 arch/arm64/kvm/hyp_trace.c

   708	
 > 709	static const struct file_operations hyp_trace_raw_fops = {
   710		.open           = hyp_trace_raw_open,
   711		.read           = hyp_trace_raw_read,
   712		.release        = hyp_trace_raw_release,
   713		.llseek         = no_llseek,
   714	};
   715	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
