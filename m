Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AB0E1E3769
	for <oe-kbuild-all@lists.linux.dev>; Mon, 12 May 2025 14:12:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747059168; cv=none; b=kzwzkdyMrkh2CND2xch36OCUvb1wcVTcoSWlu8fYus2OHIBPtji9gWJ8uHwUntuNf0s2dJsSjORIlmFgfW5faQzKrVyzCQzq5Gjj2HeppY5J0tPHs0EqHVgaSmli+TIgLYEMnfxEUUXKydHlt57poLcEf+DmiB5spR7Ys6YZYwY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747059168; c=relaxed/simple;
	bh=ykkn9DKQ0aPtmZ2kHgrlNxRrRVuRcBvkAFyFSTb+U4U=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=UFpCUb32NzdDeNUotql/dIqybZ+gVq2qtjMllDqnbL1fLl7+eqK0/B9ft2L8gt+alY1TAq+BSUScntANObwCF91kwGERUaGnkh891OCbu0QVIN/bLEmJz+MEU6NkxTxD/d7wAqnP4d17q+QhgKLwH++B68smqrWYlJ6yKYi7ha4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=h4urVg1Y; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="h4urVg1Y"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747059167; x=1778595167;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ykkn9DKQ0aPtmZ2kHgrlNxRrRVuRcBvkAFyFSTb+U4U=;
  b=h4urVg1YubYxxooiOW/vAAbvlLVEJWJj1DbhplAMqPcxPiZUelABMcaO
   5FZACpxFm2iHA++vlRAsNAMApU9j1mWgAeuZIMgKTN39JE0bSqFiQCFTW
   RD3kErLP6K3dgVdOhc+pJLS40GxqrYOJVaXoW9ROdiXLm4ypiE2YqKQX3
   HS3sphLWGZWVIgJxshaHfvmgnubGFWj9lgecSoYwD5PI0YODH1kmXXm/D
   GE2BqO1XQNc4+94WMTofrsEQec2KUaqNI7lzJ1rsEuEYds3UR6saICGms
   Zj5Md7+QynGjKZv0NtskosnmVWYUN+7a/SpzCpn3BjUJZZIkSta4Xhc7/
   Q==;
X-CSE-ConnectionGUID: XRGynzmsSKOYlH5jHLMMWw==
X-CSE-MsgGUID: EnBY17/hRsiEAbqAqWzuow==
X-IronPort-AV: E=McAfee;i="6700,10204,11431"; a="36485118"
X-IronPort-AV: E=Sophos;i="6.15,282,1739865600"; 
   d="scan'208";a="36485118"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 May 2025 07:12:47 -0700
X-CSE-ConnectionGUID: oz69bIN3T9eJvAUFwv56GQ==
X-CSE-MsgGUID: PiCjhvVzTmqXrYgaLn23ng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,282,1739865600"; 
   d="scan'208";a="141444368"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 12 May 2025 07:12:46 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uETtb-000EUZ-2q;
	Mon, 12 May 2025 14:12:43 +0000
Date: Mon, 12 May 2025 22:11:56 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 2220/2220]
 arch/loongarch/kernel/paravirt.c:57:undefined reference to `__ashlti3'
Message-ID: <202505122209.a4CThmkS-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   e1106320058bf1d983657f80490249b4f919ebad
commit: 462dd429f52a7659ea1c74f02f7134a43fccccc8 [2220/2220] LoongArch: Add pv ipi support on guest kernel side
config: loongarch-randconfig-001-20250512 (https://download.01.org/0day-ci/archive/20250512/202505122209.a4CThmkS-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 13.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250512/202505122209.a4CThmkS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505122209.a4CThmkS-lkp@intel.com/

All errors (new ones prefixed by >>):

   loongarch64-linux-ld: arch/loongarch/kernel/paravirt.o: in function `pv_send_ipi_mask':
>> arch/loongarch/kernel/paravirt.c:57:(.text+0x1f4): undefined reference to `__ashlti3'


vim +57 arch/loongarch/kernel/paravirt.c

    33	
    34	#define KVM_IPI_CLUSTER_SIZE		(2 * BITS_PER_LONG)
    35	static void pv_send_ipi_mask(const struct cpumask *mask, unsigned int action)
    36	{
    37		unsigned int cpu, i, min = 0, max = 0, old;
    38		__uint128_t bitmap = 0;
    39		irq_cpustat_t *info;
    40	
    41		if (cpumask_empty(mask))
    42			return;
    43	
    44		action = BIT(action);
    45		for_each_cpu(i, mask) {
    46			info = &per_cpu(irq_stat, i);
    47			old = atomic_fetch_or(action, &info->message);
    48			if (old)
    49				continue;
    50	
    51			cpu = cpu_logical_map(i);
    52			if (!bitmap) {
    53				min = max = cpu;
    54			} else if (cpu > min && cpu < min + KVM_IPI_CLUSTER_SIZE) {
    55				max = cpu > max ? cpu : max;
    56			} else if (cpu < min && (max - cpu) < KVM_IPI_CLUSTER_SIZE) {
  > 57				bitmap <<= min - cpu;
    58				min = cpu;
    59			} else {
    60				/*
    61				 * Physical cpuid is sorted in ascending order ascend
    62				 * for the next mask calculation, send IPI here
    63				 * directly and skip the remainding cpus
    64				 */
    65				kvm_hypercall3(KVM_HCALL_FUNC_PV_IPI,
    66					(unsigned long)bitmap,
    67					(unsigned long)(bitmap >> BITS_PER_LONG), min);
    68				min = max = cpu;
    69				bitmap = 0;
    70			}
    71			__set_bit(cpu - min, (unsigned long *)&bitmap);
    72		}
    73	
    74		if (bitmap)
    75			kvm_hypercall3(KVM_HCALL_FUNC_PV_IPI, (unsigned long)bitmap,
    76					(unsigned long)(bitmap >> BITS_PER_LONG), min);
    77	}
    78	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
