Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CE6A1A76C8
	for <oe-kbuild-all@lists.linux.dev>; Sat, 30 Nov 2024 18:15:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732990536; cv=none; b=uoAPJD/OAz46xqyhJSoOtVC9nyeZzvkE6HQotMmw8ZEr6rMNfJhYYZ0nirTnaofGeLtnpL1cjA+KfyXTGhbLI1ZxqN4ExK5DOTavNhElSZfbTFwfSsHkNjmhLMCGy2nXmRY0u0dB7HgjDnGvNmfEHIcdVUtOrpXWff72blqIcVM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732990536; c=relaxed/simple;
	bh=k9l0vAb7HO1tC6q3pYnMOUuZHbH53Hi77cSpVQfZHsI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=rsoRMNHSEGvdPRZ8eOyZG//1qbHaNoY7qW0AB5DN1gi8pdTpIs4I6QXgf+WWpaxix81AAIhyJByFhuJv/kK0p3MM/tMZozFPwIcZTxs5Kqh815M70EQlS7V4+Nt2lt5hGc6UjkmWzB81G/LX0q68GDcbU0os5h7xKRLBJObt3SA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Y+siyBVD; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Y+siyBVD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732990534; x=1764526534;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=k9l0vAb7HO1tC6q3pYnMOUuZHbH53Hi77cSpVQfZHsI=;
  b=Y+siyBVDIDaPTrVDIC/ynf9ISO4B4JhL3/VtKxM3rMKu5ebxMi07i0Gb
   ihJaOi2FqfRxcp2XV/XLor1Egps2ERS5DQc0NXStJXBS8JoHSzN777Z6O
   ToSafzJF6IwxTXMzurZtVnkpYhIE0sIov6kqV+EB3fiz/ZkOG7O77/GnR
   M5S1utft0gbBt6o4/wOom9dVuqrG123wmvUolkzyMn3Be/8C0boe/QcMg
   ePdQyNuLDTKhVlHdwKW0vdcKR8x0azDwaVmhA2LSzZDXj5eV4sHZJc/XY
   hEujVHKRvYXMwNdRHyf0oXmHcTWKVR/OeSLNlvOpG+PbYuly3IoaTXNYT
   g==;
X-CSE-ConnectionGUID: W/oX52P0T6Ws1qnE27RR3Q==
X-CSE-MsgGUID: NFMavVabRRWIA8SQWZrYuQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11272"; a="50593015"
X-IronPort-AV: E=Sophos;i="6.12,199,1728975600"; 
   d="scan'208";a="50593015"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Nov 2024 10:15:33 -0800
X-CSE-ConnectionGUID: kj0kZ/6wSH6OxbBRsdQJzQ==
X-CSE-MsgGUID: 5ecn+y/6SwO/3YikDlc5HQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,198,1728975600"; 
   d="scan'208";a="97495288"
Received: from lkp-server02.sh.intel.com (HELO 36a1563c48ff) ([10.239.97.151])
  by fmviesa004.fm.intel.com with ESMTP; 30 Nov 2024 10:15:29 -0800
Received: from kbuild by 36a1563c48ff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tHRzh-0000td-0f;
	Sat, 30 Nov 2024 18:15:09 +0000
Date: Sun, 1 Dec 2024 02:14:28 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, leoliu-oc <leoliu-oc@zhaoxin.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 1474/1474]
 arch/x86/events/zhaoxin/uncore.c:255:1: sparse: sparse: symbol
 '__pcpu_scope_zx_package_id' was not declared. Should it be static?
Message-ID: <202412010208.hwdQ3YqT-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   df4c334beecb4cf58e4e8d63b491aa5ac0a84f46
commit: 5cbf647edcff3d5cda5cb172c6bf0e4c1b6e8ec6 [1474/1474] x86/perf: Add uncore performance events support for Zhaoxin CPU
config: x86_64-randconfig-123-20241118 (https://download.01.org/0day-ci/archive/20241201/202412010208.hwdQ3YqT-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241201/202412010208.hwdQ3YqT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412010208.hwdQ3YqT-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> arch/x86/events/zhaoxin/uncore.c:255:1: sparse: sparse: symbol '__pcpu_scope_zx_package_id' was not declared. Should it be static?
>> arch/x86/events/zhaoxin/uncore.c:256:1: sparse: sparse: symbol '__pcpu_scope_zx_subnode_id' was not declared. Should it be static?
>> arch/x86/events/zhaoxin/uncore.c:257:1: sparse: sparse: symbol '__pcpu_scope_zx_cluster_id' was not declared. Should it be static?
>> arch/x86/events/zhaoxin/uncore.c:312:1: sparse: sparse: symbol '__pcpu_scope_zx_cluster_core_bits' was not declared. Should it be static?
>> arch/x86/events/zhaoxin/uncore.c:313:1: sparse: sparse: symbol '__pcpu_scope_zx_subnode_core_bits' was not declared. Should it be static?
   arch/x86/events/zhaoxin/uncore.c:1788:28: sparse: sparse: symbol 'uncore_msr_cluster_uncores' was not declared. Should it be static?
   arch/x86/events/zhaoxin/uncore.c:1793:28: sparse: sparse: symbol 'uncore_msr_subnode_uncores' was not declared. Should it be static?
   arch/x86/events/zhaoxin/uncore.c:1799:28: sparse: sparse: symbol 'uncore_pci_subnode_uncores' was not declared. Should it be static?
   arch/x86/events/zhaoxin/uncore.c: note: in included file (through arch/x86/include/asm/cpuid.h, arch/x86/include/asm/processor.h, arch/x86/include/asm/cpu_device_id.h):
>> arch/x86/include/asm/paravirt.h:229:9: sparse: sparse: cast truncates bits from constant value (10000000f becomes f)

vim +/__pcpu_scope_zx_package_id +255 arch/x86/events/zhaoxin/uncore.c

   254	
 > 255	DEFINE_PER_CPU(int, zx_package_id);
 > 256	DEFINE_PER_CPU(int, zx_subnode_id);
 > 257	DEFINE_PER_CPU(int, zx_cluster_id);
   258	
   259	static void get_topology_info(void)
   260	{
   261		int cpu;
   262		int cluster_id;
   263		int socket_id;
   264		int die_id;
   265		int subnode_id;
   266	
   267		int die_info;
   268		int subnode_info;
   269		int cluster_info;
   270	
   271		u64 config;
   272	
   273		for_each_present_cpu(cpu) {
   274			smp_call_function_single(cpu, get_global_status_msr, &config, 1);
   275			socket_id = (int)((config >> 3) & 0x1);
   276			per_cpu(zx_package_id, cpu) = socket_id;
   277	
   278			/* only yongfeng needs cluster and subnode info */
   279			if (boot_cpu_data.x86_model != ZHAOXIN_FAM7_YONGFENG)
   280				continue;
   281	
   282			smp_call_function_single(cpu, get_hdw_config_msr, &config, 1);
   283	
   284			die_info = (int)((config >> 21) & 0x3);
   285			die_id = socket_id * dies_per_socket + die_info;
   286	
   287			subnode_info = (int)((config >> 20) & 0x1);
   288			subnode_id = die_id * subnodes_per_die + subnode_info;
   289			per_cpu(zx_subnode_id, cpu) = subnode_id;
   290	
   291			cluster_info = (int)((config >> 18) & 0x3);
   292			cluster_id = subnode_id * clusters_per_subnode + cluster_info;
   293			per_cpu(zx_cluster_id, cpu) = cluster_id;
   294		}
   295	}
   296	
   297	static int zx_topology_cluster_id(int cpu)
   298	{
   299		return per_cpu(zx_cluster_id, cpu);
   300	}
   301	
   302	static int zx_topology_subnode_id(int cpu)
   303	{
   304		return per_cpu(zx_subnode_id, cpu);
   305	}
   306	
   307	static int zx_topology_package_id(int cpu)
   308	{
   309		return per_cpu(zx_package_id, cpu);
   310	}
   311	
 > 312	DEFINE_PER_CPU(cpumask_t, zx_cluster_core_bits);
 > 313	DEFINE_PER_CPU(cpumask_t, zx_subnode_core_bits);
   314	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
