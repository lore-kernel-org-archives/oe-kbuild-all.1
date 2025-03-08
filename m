Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DDBE1632F2
	for <oe-kbuild-all@lists.linux.dev>; Sat,  8 Mar 2025 04:46:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741409179; cv=none; b=i1YXjBzmytx+a1Yc9eva5iq49r3u0FolvFl0AlCSeQBCFCjjwyo1f/X65fGHx6GfX/LFu7lKnrA1DrizwZXh7kAC+b+jafY0CZ+AzJU1FkoKvSfv2aegG1Q623CgyMXrrQNDV4VGD2QpIcJd4KjrWEyj3bg4iVOMFQnicXT4S68=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741409179; c=relaxed/simple;
	bh=tEZwjY7jnQLrvcUrRgZo3yzmolvWjEoTDkLNRs1ptDA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=BmyTrbKmbWy6CLSh19JkYePegso8UqDviYBMiVPvVpJcLq5ZUmDmv0K5BD2aJfLC9qahHfUmsKwa94zX6PxaRSXf1pSM+FzPtylrZ1rinXP49MqosOcFf+VmXhTDUimSoO2MlmjGRaBeTnS5tJxa7jJ0WkMui75v3ptIKxA/CIk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QugK1cMY; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QugK1cMY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741409178; x=1772945178;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=tEZwjY7jnQLrvcUrRgZo3yzmolvWjEoTDkLNRs1ptDA=;
  b=QugK1cMYl4n5HEOwo1ioHunSfMo/UMizTtWpvzVw6Cw+kYxEt/fsxafB
   xyVKIv6ztboLJkglG1GI6wEUZNm16Vr+r9mlFN3oGwEMaEBs+GimGczEo
   TP0ruejGfurxhzE1rduHmoLf3M3VEXoTmk+Qa6XFshwAGKCrJOPZyll5p
   2SRueyqX9PXw0prLW0Zmp60AXoDGeRX5CPHIzOyxLz9p+4Gf29ELcvndc
   0qLU8QMJtUSaNQZOgV7ywsrxLsd7pnYnp+fzx4Uu7LXtkGHXnhoFORrAu
   hDKsEG6epO50DBYFdE/BpWG6G9fCx0VkA1QD4np1M3m3Z4LuP/HnGs+gA
   g==;
X-CSE-ConnectionGUID: 3/e7WPCVQqa1AUuWt6LHxg==
X-CSE-MsgGUID: Xp/XUlPDSCy0AmMd/LrALw==
X-IronPort-AV: E=McAfee;i="6700,10204,11366"; a="41719995"
X-IronPort-AV: E=Sophos;i="6.14,231,1736841600"; 
   d="scan'208";a="41719995"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Mar 2025 20:46:16 -0800
X-CSE-ConnectionGUID: Ux+I+CltRFWYiWK35JxYzw==
X-CSE-MsgGUID: P6Y/WYP+RnemIyRQ1NbxaA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="119435717"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by orviesa010.jf.intel.com with ESMTP; 07 Mar 2025 20:46:15 -0800
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tqm4i-0001VH-05;
	Sat, 08 Mar 2025 04:46:12 +0000
Date: Sat, 8 Mar 2025 12:45:16 +0800
From: kernel test robot <lkp@intel.com>
To: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev, Oliver Upton <oliver.upton@linux.dev>,
	Cornelia Huck <cohuck@redhat.com>,
	Sebastian Ott <sebott@redhat.com>
Subject: [linux-next:master 5819/9634]
 drivers/firmware/smccc/kvm_guest.c:89:39: error: invalid application of
 'sizeof' to incomplete type 'struct target_impl_cpu'
Message-ID: <202503081204.QiGGXtvL-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   0a2f889128969dab41861b6e40111aa03dc57014
commit: 86edf6bdcf0571c07103b8751e9d792a4b808e97 [5819/9634] smccc/kvm_guest: Enable errata based on implementation CPUs
config: arm-randconfig-002-20250308 (https://download.01.org/0day-ci/archive/20250308/202503081204.QiGGXtvL-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250308/202503081204.QiGGXtvL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503081204.QiGGXtvL-lkp@intel.com/

Note: the linux-next/master HEAD 0a2f889128969dab41861b6e40111aa03dc57014 builds fine.
      It may have been fixed somewhere.

All errors (new ones prefixed by >>):

   drivers/firmware/smccc/kvm_guest.c:58:14: warning: no previous prototype for 'kvm_arm_target_impl_cpu_init' [-Wmissing-prototypes]
      58 | void  __init kvm_arm_target_impl_cpu_init(void)
         |              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/firmware/smccc/kvm_guest.c: In function 'kvm_arm_target_impl_cpu_init':
>> drivers/firmware/smccc/kvm_guest.c:89:39: error: invalid application of 'sizeof' to incomplete type 'struct target_impl_cpu'
      89 |         target = memblock_alloc(sizeof(*target) * max_cpus,  __alignof__(*target));
         |                                       ^
>> drivers/firmware/smccc/kvm_guest.c:89:62: error: invalid application of '__alignof__' to incomplete type 'struct target_impl_cpu'
      89 |         target = memblock_alloc(sizeof(*target) * max_cpus,  __alignof__(*target));
         |                                                              ^~~~~~~~~~~
>> drivers/firmware/smccc/kvm_guest.c:102:23: error: invalid use of undefined type 'struct target_impl_cpu'
     102 |                 target[i].midr = res.a1;
         |                       ^
   drivers/firmware/smccc/kvm_guest.c:102:26: error: invalid use of undefined type 'struct target_impl_cpu'
     102 |                 target[i].midr = res.a1;
         |                          ^
   drivers/firmware/smccc/kvm_guest.c:103:23: error: invalid use of undefined type 'struct target_impl_cpu'
     103 |                 target[i].revidr = res.a2;
         |                       ^
   drivers/firmware/smccc/kvm_guest.c:103:26: error: invalid use of undefined type 'struct target_impl_cpu'
     103 |                 target[i].revidr = res.a2;
         |                          ^
   drivers/firmware/smccc/kvm_guest.c:104:23: error: invalid use of undefined type 'struct target_impl_cpu'
     104 |                 target[i].aidr = res.a3;
         |                       ^
   drivers/firmware/smccc/kvm_guest.c:104:26: error: invalid use of undefined type 'struct target_impl_cpu'
     104 |                 target[i].aidr = res.a3;
         |                          ^
>> drivers/firmware/smccc/kvm_guest.c:107:14: error: implicit declaration of function 'cpu_errata_set_target_impl' [-Wimplicit-function-declaration]
     107 |         if (!cpu_errata_set_target_impl(max_cpus, target)) {
         |              ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/firmware/smccc/kvm_guest.c:116:37: error: invalid application of 'sizeof' to incomplete type 'struct target_impl_cpu'
     116 |         memblock_free(target, sizeof(*target) * max_cpus);
         |                                     ^


vim +89 drivers/firmware/smccc/kvm_guest.c

    57	
  > 58	void  __init kvm_arm_target_impl_cpu_init(void)
    59	{
    60		int i;
    61		u32 ver;
    62		u64 max_cpus;
    63		struct arm_smccc_res res;
    64		struct target_impl_cpu *target;
    65	
    66		if (!kvm_arm_hyp_service_available(ARM_SMCCC_KVM_FUNC_DISCOVER_IMPL_VER) ||
    67		    !kvm_arm_hyp_service_available(ARM_SMCCC_KVM_FUNC_DISCOVER_IMPL_CPUS))
    68			return;
    69	
    70		arm_smccc_1_1_invoke(ARM_SMCCC_VENDOR_HYP_KVM_DISCOVER_IMPL_VER_FUNC_ID,
    71				     0, &res);
    72		if (res.a0 != SMCCC_RET_SUCCESS)
    73			return;
    74	
    75		/* Version info is in lower 32 bits and is in SMMCCC_VERSION format */
    76		ver = lower_32_bits(res.a1);
    77		if (PSCI_VERSION_MAJOR(ver) != 1) {
    78			pr_warn("Unsupported target CPU implementation version v%d.%d\n",
    79				PSCI_VERSION_MAJOR(ver), PSCI_VERSION_MINOR(ver));
    80			return;
    81		}
    82	
    83		if (!res.a2) {
    84			pr_warn("No target implementation CPUs specified\n");
    85			return;
    86		}
    87	
    88		max_cpus = res.a2;
  > 89		target = memblock_alloc(sizeof(*target) * max_cpus,  __alignof__(*target));
    90		if (!target) {
    91			pr_warn("Not enough memory for struct target_impl_cpu\n");
    92			return;
    93		}
    94	
    95		for (i = 0; i < max_cpus; i++) {
    96			arm_smccc_1_1_invoke(ARM_SMCCC_VENDOR_HYP_KVM_DISCOVER_IMPL_CPUS_FUNC_ID,
    97					     i, &res);
    98			if (res.a0 != SMCCC_RET_SUCCESS) {
    99				pr_warn("Discovering target implementation CPUs failed\n");
   100				goto mem_free;
   101			}
 > 102			target[i].midr = res.a1;
 > 103			target[i].revidr = res.a2;
   104			target[i].aidr = res.a3;
   105		};
   106	
 > 107		if (!cpu_errata_set_target_impl(max_cpus, target)) {

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
