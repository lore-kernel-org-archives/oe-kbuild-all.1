Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD13C28FC
	for <oe-kbuild-all@lists.linux.dev>; Fri,  1 Nov 2024 05:39:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730439554; cv=none; b=LK76OrqukEXLDEx2orekDrqTU7xc5+qIky2Z/fKGpRdm8EEza7M2AHaZfmJ/mmhzymSQUvfVObapJmsRPw7TfnzuZp8CDz/EjKgDlIHvEQiyRXb9ie22c+bM+mLF/keMWxi4NVenaApbN4iMYabgUBTaDVwxo4D3ykqrwV7lUgo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730439554; c=relaxed/simple;
	bh=jJSvVKhT+GAjGgMUgVjzRZUpRO7MMJ4zu+avsamrwuE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=hyxUExyrS8srj2S6KEpbHCo5FXm8n5htHXPKbeYY99AO762eOCVf1FqcEp1HujY0fWh/s1S6rNmpO4pAx8MerSrn57xqRJpK97XBeRV8OTun8FBA49ynAwU9G51u68OsUKWFOAIQ0jiLR0z+jKRPcKM5P0uQuIt2UAKkpYyfLbk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XKovNREw; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XKovNREw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730439551; x=1761975551;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=jJSvVKhT+GAjGgMUgVjzRZUpRO7MMJ4zu+avsamrwuE=;
  b=XKovNREwOD/6K+oHbI8pZuTU1gBN/h8aFlwNIgxyqo5ZEZvPtjQbiRX2
   41f4VDpZju8j3ejveDJPWrUsNs1R+zn0MLNZtl+PD+80U3Arg4MJQ0ZKx
   xkRLJ26kC84HcsTD5+EVjV2Uj4fPQjsJ7NFVKmDhGt1+pdIK5raZwapIQ
   w2BFt531hzszQFv4kLIGkBQrwl+9B9CCtpjz0bS0grYzHr7umUIg2nxmo
   xfoFcDfhN6UVwgPhwP2C48cVpasLIhCdZJiWrDQlZo542atXEA4zL50/S
   OfHqFOpJ1MZZcuy6BiP82TOpVLp6mzcAbzl7mihjLbaLMam+s0HVWK7ft
   A==;
X-CSE-ConnectionGUID: uBSsctWsSBGX9ZXP4DSo1A==
X-CSE-MsgGUID: YNwQGTo/RxuAhtcA4nDU3Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="30371325"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="30371325"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Oct 2024 22:39:10 -0700
X-CSE-ConnectionGUID: Rgtq9S1YSICiWdjlPWQxCA==
X-CSE-MsgGUID: jdmwleHqReWrWQNqMLnZfw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="87640811"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 31 Oct 2024 22:39:09 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t6kNG-000hBd-2Y;
	Fri, 01 Nov 2024 05:39:06 +0000
Date: Fri, 1 Nov 2024 13:38:33 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Yang Yingliang <yangyingliang@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 15256/23932]
 arch/arm64/kernel/mpam/mpam_device.c:1250: warning: Function parameter or
 member 'comp' not described in 'do_device_sync'
Message-ID: <202411011311.9dahsLh5-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   c129df6fe938fddc83fddea6a1976cd18573b095
commit: b55756d8f2c3e005e73aa59652dae1e528956862 [15256/23932] arm64/mpam: Implement helpers for handling configuration and monitoring
config: arm64-randconfig-001-20241029 (https://download.01.org/0day-ci/archive/20241101/202411011311.9dahsLh5-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241101/202411011311.9dahsLh5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411011311.9dahsLh5-lkp@intel.com/

All warnings (new ones prefixed by >>):

   arch/arm64/kernel/mpam/mpam_device.c:520:24: warning: no previous prototype for 'mpam_component_get' [-Wmissing-prototypes]
     520 | struct mpam_component *mpam_component_get(struct mpam_class *class, int id,
         |                        ^~~~~~~~~~~~~~~~~~
   arch/arm64/kernel/mpam/mpam_device.c:612:1: warning: no previous prototype for '__mpam_device_create' [-Wmissing-prototypes]
     612 | __mpam_device_create(u8 level_idx, enum mpam_class_types type,
         | ^~~~~~~~~~~~~~~~~~~~
   arch/arm64/kernel/mpam/mpam_device.c:692:12: warning: no previous prototype for 'mpam_discovery_start' [-Wmissing-prototypes]
     692 | int __init mpam_discovery_start(void)
         |            ^~~~~~~~~~~~~~~~~~~~
   arch/arm64/kernel/mpam/mpam_device.c:918:12: warning: no previous prototype for 'mpam_discovery_complete' [-Wmissing-prototypes]
     918 | int __init mpam_discovery_complete(void)
         |            ^~~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kernel/mpam/mpam_device.c:935:13: warning: no previous prototype for 'mpam_discovery_failed' [-Wmissing-prototypes]
     935 | void __init mpam_discovery_failed(void)
         |             ^~~~~~~~~~~~~~~~~~~~~
   In file included from arch/arm64/include/asm/atomic.h:34,
                    from include/linux/atomic.h:7,
                    from include/asm-generic/bitops/atomic.h:5,
                    from arch/arm64/include/asm/bitops.h:37,
                    from include/linux/bitops.h:19,
                    from include/linux/kernel.h:11,
                    from include/asm-generic/bug.h:18,
                    from arch/arm64/include/asm/bug.h:37,
                    from include/linux/bug.h:5,
                    from include/linux/io.h:23,
                    from arch/arm64/kernel/mpam/mpam_device.c:29:
   In function '__cmpxchg_case_mb_4',
       inlined from '__cmpxchg_mb' at arch/arm64/include/asm/cmpxchg.h:143:1,
       inlined from 'mpam_cpu_online' at arch/arm64/kernel/mpam/mpam_device.c:891:8:
   arch/arm64/include/asm/atomic_lse.h:492:9: warning: array subscript 'long unsigned int[0]' is partly outside array bounds of 'int[1]' [-Warray-bounds=]
     492 |         asm volatile(                                                   \
         |         ^~~
   arch/arm64/include/asm/atomic_lse.h:523:1: note: in expansion of macro '__CMPXCHG_CASE'
     523 | __CMPXCHG_CASE(w,  ,  mb_4, al, "memory")
         | ^~~~~~~~~~~~~~
   arch/arm64/kernel/mpam/mpam_device.c: In function 'mpam_cpu_online':
   arch/arm64/kernel/mpam/mpam_device.c:73:12: note: object 'mpam_broken' of size 4
      73 | static int mpam_broken;
         |            ^~~~~~~~~~~
   In function '__cmpxchg_case_mb_4',
       inlined from '__cmpxchg_mb' at arch/arm64/include/asm/cmpxchg.h:143:1,
       inlined from 'mpam_cpu_online' at arch/arm64/kernel/mpam/mpam_device.c:891:8:
   arch/arm64/include/asm/atomic_lse.h:492:9: warning: array subscript 'long unsigned int[0]' is partly outside array bounds of 'int[1]' [-Warray-bounds=]
     492 |         asm volatile(                                                   \
         |         ^~~
   arch/arm64/include/asm/atomic_lse.h:523:1: note: in expansion of macro '__CMPXCHG_CASE'
     523 | __CMPXCHG_CASE(w,  ,  mb_4, al, "memory")
         | ^~~~~~~~~~~~~~
   arch/arm64/kernel/mpam/mpam_device.c: In function 'mpam_cpu_online':
   arch/arm64/kernel/mpam/mpam_device.c:73:12: note: object 'mpam_broken' of size 4
      73 | static int mpam_broken;
         |            ^~~~~~~~~~~
>> arch/arm64/kernel/mpam/mpam_device.c:1250: warning: Function parameter or member 'comp' not described in 'do_device_sync'
>> arch/arm64/kernel/mpam/mpam_device.c:1250: warning: Function parameter or member 'sync_ctx' not described in 'do_device_sync'


vim +1250 arch/arm64/kernel/mpam/mpam_device.c

  1242	
  1243	/**
  1244	 * in some cases/platforms the MSC register access is only possible with
  1245	 * the associated CPUs. And need to check if those CPUS are online before
  1246	 * accessing it. So we use those CPUs dev->online_affinity to apply config.
  1247	 */
  1248	static int do_device_sync(struct mpam_component *comp,
  1249					struct mpam_device_sync *sync_ctx)
> 1250	{
  1251		int cpu;
  1252		struct mpam_device *dev;
  1253	
  1254		lockdep_assert_cpus_held();
  1255	
  1256		cpu = get_cpu();
  1257		if (cpumask_test_cpu(cpu, &comp->fw_affinity))
  1258			mpam_component_device_sync(sync_ctx);
  1259		put_cpu();
  1260	
  1261		/*
  1262		 * Find the set of other CPUs we need to run on to update
  1263		 * this component
  1264		 */
  1265		list_for_each_entry(dev, &comp->devices, comp_list) {
  1266			if (sync_ctx->error)
  1267				break;
  1268	
  1269			if (cpumask_intersects(&dev->online_affinity,
  1270						&sync_ctx->updated_on))
  1271				continue;
  1272	
  1273			/*
  1274			 * This device needs the config applying, and hasn't been
  1275			 * reachable by any cpu so far.
  1276			 */
  1277			cpu = cpumask_any(&dev->online_affinity);
  1278			smp_call_function_single(cpu, mpam_component_device_sync,
  1279						sync_ctx, 1);
  1280		}
  1281	
  1282		return sync_ctx->error;
  1283	}
  1284	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
