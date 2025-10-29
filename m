Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D0F313FEE
	for <oe-kbuild-all@lists.linux.dev>; Wed, 29 Oct 2025 06:38:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761719931; cv=none; b=ZxfVIrF6PS64HwT50kDBAmO3Dgn7FucAks736Efs+0sQsDzpLToeffZjw7vv35XE4YEWi3vuWlVtOrsoD/x6/n2oBp7godnal19ZZXU5ePuABxTb0m2kuNczf9m3qqRj7KQ15er/66XqMgOe9VIJ6rBDC0KpLLdCqVwuJfS7yWs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761719931; c=relaxed/simple;
	bh=3Z1BPOgyVipsEezQnbwe5YZFhdziWmmlOzgo50HTK8I=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=cit5WU1tl51VbEfq8ydtS1TkWM3TEn8dWBTmA+ilcf3EXaDq2UKG6ve3T7Z1uZexJv1SV11C+A47R3HodVYRVv80q6Kf922UTuSBLbNamSC2kqwu/QMZhtrsAtmHmhnkXOdoKKQOkw8U5VQ1PGs929waBpkq2oHB4NMu2dB1XNY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=k0g86AOn; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="k0g86AOn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761719928; x=1793255928;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=3Z1BPOgyVipsEezQnbwe5YZFhdziWmmlOzgo50HTK8I=;
  b=k0g86AOnaYN3yKKEem8Sj2sL4o3hTZYDll9t1U1tJNdRMjMf+Bd1i+x+
   iKmoMpHt8ilBXWIM6eokrNuhAuuENVXdwFTAVF0VDjJ8lcIshmrV6qMGo
   9HqrqtEYe/Y6245w+hsJvFfS4vd1qZahrP1z+/FySGU81owH2cwtbPihz
   XclxJQQ0M4CvDPE1dvmKU822yDiobtxHXf+6llcXncyWVXspWVM+9IXjw
   7AcKy9YkLYwk+rkCNQ1ymDYjlcjY1efGSbac3GHLPE8JQeAXgvFsg1kg2
   WDKMs2/K5vnpayPAb7DJr0a5YiKikYVRB1UsFx4OVHstralhay3Tbo0Oo
   w==;
X-CSE-ConnectionGUID: YALxiRVESwSrDAcuZa1jJA==
X-CSE-MsgGUID: WGnJr/PQRcSY9tPVG4avrw==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="67667637"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="67667637"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Oct 2025 23:38:47 -0700
X-CSE-ConnectionGUID: mhUh6/pbTnmhXvizTsMflQ==
X-CSE-MsgGUID: qJR7aXLwS4OqAdpM6RjKPA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,263,1754982000"; 
   d="scan'208";a="185268366"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa007.fm.intel.com with ESMTP; 28 Oct 2025 23:38:45 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vDzp0-000KIt-1r;
	Wed, 29 Oct 2025 06:38:25 +0000
Date: Wed, 29 Oct 2025 14:36:06 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Zhou Shuai <zhoushuai28@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 3058/3058]
 drivers/net/ethernet/huawei/hinic3/hw/hinic3_lld.c:1107:14: warning:
 allocation of insufficient size '8' for type 'struct hinic3_hw_pf_infos'
 with size '1156'
Message-ID: <202510291437.zwcK1qlA-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   3ecf87d6cde5142e8e8620915713663346d033fe
commit: dcb286ce50a35a77e51b61db72c7cc001647b598 [3058/3058] net/hinic3: add huawei/hinic3 driver
config: arm64-allyesconfig (https://download.01.org/0day-ci/archive/20251029/202510291437.zwcK1qlA-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project d1c086e82af239b245fe8d7832f2753436634990)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251029/202510291437.zwcK1qlA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510291437.zwcK1qlA-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from <built-in>:3:
   In file included from include/linux/compiler_types.h:150:
   include/linux/compiler-clang.h:42:9: warning: '__SANITIZE_THREAD__' macro redefined [-Wmacro-redefined]
      42 | #define __SANITIZE_THREAD__
         |         ^
   <built-in>:368:9: note: previous definition is here
     368 | #define __SANITIZE_THREAD__ 1
         |         ^
   In file included from drivers/net/ethernet/huawei/hinic3/hw/hinic3_lld.c:6:
   In file included from include/net/addrconf.h:52:
   In file included from include/linux/ipv6.h:100:
   In file included from include/linux/tcp.h:17:
   In file included from include/linux/skbuff.h:17:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:8:
   In file included from include/linux/cacheflush.h:5:
   In file included from arch/arm64/include/asm/cacheflush.h:11:
   In file included from include/linux/kgdb.h:19:
   In file included from include/linux/kprobes.h:28:
   In file included from include/linux/ftrace.h:13:
   In file included from include/linux/kallsyms.h:13:
   In file included from include/linux/mm.h:2193:
   include/linux/vmstat.h:508:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     508 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     509 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:515:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     515 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     516 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:522:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     522 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   include/linux/vmstat.h:527:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     527 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     528 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:536:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     536 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     537 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/huawei/hinic3/hw/hinic3_lld.c:69:6: warning: no previous prototype for function 'hinic3_uld_lock_init' [-Wmissing-prototypes]
      69 | void hinic3_uld_lock_init(void)
         |      ^
   drivers/net/ethernet/huawei/hinic3/hw/hinic3_lld.c:69:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      69 | void hinic3_uld_lock_init(void)
         | ^
         | static 
>> drivers/net/ethernet/huawei/hinic3/hw/hinic3_lld.c:1107:14: warning: allocation of insufficient size '8' for type 'struct hinic3_hw_pf_infos' with size '1156' [-Walloc-size]
    1107 |         *pf_infos = kzalloc(sizeof(*pf_infos), GFP_KERNEL);
         |                     ^
   8 warnings generated.


vim +1107 drivers/net/ethernet/huawei/hinic3/hw/hinic3_lld.c

  1094	
  1095	static int hinic3_get_pf_info(struct pci_dev *pdev, u16 service,
  1096				      struct hinic3_hw_pf_infos **pf_infos)
  1097	{
  1098		struct hinic3_pcidev *dev = pci_get_drvdata(pdev);
  1099		int err;
  1100	
  1101		if (service >= SERVICE_T_MAX) {
  1102			sdk_err(&pdev->dev, "Current vf do not supports set service_type = %u state in host\n",
  1103				service);
  1104			return -EFAULT;
  1105		}
  1106	
> 1107		*pf_infos = kzalloc(sizeof(*pf_infos), GFP_KERNEL);
  1108		err = hinic3_get_hw_pf_infos(dev->hwdev, *pf_infos, HINIC3_CHANNEL_COMM);
  1109		if (err) {
  1110			kfree(*pf_infos);
  1111			sdk_err(&pdev->dev, "Get chipf pf info failed, ret %d\n", err);
  1112			return -EFAULT;
  1113		}
  1114	
  1115		return 0;
  1116	}
  1117	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
