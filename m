Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DDFE6FB9
	for <oe-kbuild-all@lists.linux.dev>; Sat, 26 Oct 2024 18:28:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729967301; cv=none; b=m1c6Mp7ZJ9aGXOX1oACWTNXhyrHFgdMd0HvQFYwOrEWQ3Kru42HmUj1ExCVap/J3dbZMkcliav0Ts84ZfaDU46OUC6Tsl3KWHCcr9Q6FtAl4aq+qV5j27Rf2CSag+DZjVQcTMFs1pNkUSurMoz8Hh14+/CfArPbFXFfJL5UQaCY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729967301; c=relaxed/simple;
	bh=KwRdfoEBq1pYdoaq8OKtn/dYtxekIo3gMVWqP/1JyBs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=WaGcbzrqyguMBMJeMAv4BzFH4WPm2Jnp14NgWhKO0zA59r/M1N/9n+nGBJnLs1pFM42nf3Df8x8jKa7g/Ur1vZ7wqs/qvdkLAS+mEZN6KBWpTWGHhumTaJUkSOPeL/pfr14xT+P5j3oQTo+PbvUovgPQGO7NVNxf59QcTg0kaIU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BC7xcujn; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BC7xcujn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729967298; x=1761503298;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=KwRdfoEBq1pYdoaq8OKtn/dYtxekIo3gMVWqP/1JyBs=;
  b=BC7xcujnuHKrACIpu7tb/0e9tR79Zva0s3rAxIJkFaOQhCl/tjdRyyd6
   E/5fw/cOtUY5ndeI0QQhFy7J952hOhZVKsPo4TlIIHhLlqxAW4TwPv/GD
   HdjYqi0V/u/1kmmG70zCdMJG94xqoadp8JgOlv/XkguneVueBignKiRdC
   5SS/vJKEn76UrVG0U3beQOsKZM3pgSBQK2S0YX8swoD7uehaO6LODuZr5
   160lL7hmFYZpugZU8EzXVMFKDP9ryZCOU7ctgKwdFML5g7wQtkE1mUo9H
   1NXmLseLclIQTbBsXw1cbnNV/tswrPWfi0WX4xSQvtghtfaKDNTE9XnE5
   Q==;
X-CSE-ConnectionGUID: fG849qVeQ2y9PokvqKGVjQ==
X-CSE-MsgGUID: BgMFdit5Qk+Ji4D6yQYAJg==
X-IronPort-AV: E=McAfee;i="6700,10204,11237"; a="55027536"
X-IronPort-AV: E=Sophos;i="6.11,235,1725346800"; 
   d="scan'208";a="55027536"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Oct 2024 11:28:18 -0700
X-CSE-ConnectionGUID: oaqJzP7eQVGuLrwgMeKoyg==
X-CSE-MsgGUID: yQh1uhgARo6N7pH/6xdsYg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,235,1725346800"; 
   d="scan'208";a="85178288"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 26 Oct 2024 11:28:16 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t4lWI-000Zvq-0w;
	Sat, 26 Oct 2024 18:28:14 +0000
Date: Sun, 27 Oct 2024 02:28:03 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Xie XiuQi <xiexiuqi@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 8428/23866]
 arch/arm64/kernel/acpi.c:266:5: warning: no previous prototype for
 'acpi_map_cpu'
Message-ID: <202410270248.Ne5SK2Qt-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   22c50245e8025b0c6beee13d0df238987b98e6f8
commit: 2875d85b7ff5a4f1350595c92305314f0ac07657 [8428/23866] arm64: Add CPU hotplug support
config: arm64-randconfig-002-20241026 (https://download.01.org/0day-ci/archive/20241027/202410270248.Ne5SK2Qt-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241027/202410270248.Ne5SK2Qt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410270248.Ne5SK2Qt-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/arm64/kernel/acpi.c:266:5: warning: no previous prototype for 'acpi_map_cpu' [-Wmissing-prototypes]
     266 | int acpi_map_cpu(acpi_handle handle, phys_cpuid_t physid, u32 acpi_id,
         |     ^~~~~~~~~~~~
   arch/arm64/kernel/acpi.c: In function 'acpi_map_cpu':
   arch/arm64/kernel/acpi.c:275:17: error: implicit declaration of function 'numa_add_cpu'; did you mean 'be64_add_cpu'? [-Werror=implicit-function-declaration]
     275 |                 numa_add_cpu(cpu);
         |                 ^~~~~~~~~~~~
         |                 be64_add_cpu
   arch/arm64/kernel/acpi.c: At top level:
>> arch/arm64/kernel/acpi.c:285:5: warning: no previous prototype for 'acpi_unmap_cpu' [-Wmissing-prototypes]
     285 | int acpi_unmap_cpu(int cpu)
         |     ^~~~~~~~~~~~~~
   arch/arm64/kernel/acpi.c: In function 'acpi_unmap_cpu':
   arch/arm64/kernel/acpi.c:288:9: error: implicit declaration of function 'numa_clear_node' [-Werror=implicit-function-declaration]
     288 |         numa_clear_node(cpu);
         |         ^~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +/acpi_map_cpu +266 arch/arm64/kernel/acpi.c

   265	
 > 266	int acpi_map_cpu(acpi_handle handle, phys_cpuid_t physid, u32 acpi_id,
   267			 int *pcpu)
   268	{
   269		int cpu, nid;
   270	
   271		cpu = acpi_map_cpuid(physid, acpi_id);
   272		nid = acpi_get_node(handle);
   273		if (nid != NUMA_NO_NODE) {
   274			set_cpu_numa_node(cpu, nid);
   275			numa_add_cpu(cpu);
   276		}
   277	
   278		*pcpu = cpu;
   279		set_cpu_present(cpu, true);
   280	
   281		return 0;
   282	}
   283	EXPORT_SYMBOL(acpi_map_cpu);
   284	
 > 285	int acpi_unmap_cpu(int cpu)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
