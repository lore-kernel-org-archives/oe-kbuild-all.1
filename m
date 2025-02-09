Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B7F7819
	for <oe-kbuild-all@lists.linux.dev>; Sun,  9 Feb 2025 00:36:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739061389; cv=none; b=KrS73cp0DmXt87Flfz1OOQ6jRN/wV52i7gSqQbOKaeQpuYjnj+jst5vSvzmCFGeG3Vg49JFj8Mvc601PCcojuuCYKNNGhjzNkUmsiB+Eqv6gl1IpZbcIScfQEa430qorqD+LB7Hub4POyeIJ05PGpZn8DNzOMFQssq3Q3+v+D0s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739061389; c=relaxed/simple;
	bh=TKQqqKaxmlMmSrED/XRPmRHef8z/uGDuge2IrqnZv30=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=AgDhhHfltdxRAVeDZNsT+YpPXTFFtLZnXBJ8CUe7jES0sXyri3tGSziLCOwHuLsKogRLh0fLUKWh1EIryi5TuZTeBnGrSGq1pJdd5j3Qq7B0A0kNDD4K8ELYiMJ0agXr1V4MEBpgEXQNfzGRmAPdxBomIyEh2pnPKDpt9aZOeew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VKQ3VKLu; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VKQ3VKLu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739061387; x=1770597387;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=TKQqqKaxmlMmSrED/XRPmRHef8z/uGDuge2IrqnZv30=;
  b=VKQ3VKLuS5je9eCRe8GfQD1Z9htg/p6iJfhHDmWeRRufOctL7c6x8iFL
   Me+pMxiudSYExlV9HXR/4DsqqAiEpt0q9RRTXVun3eQI+Hvterc0BsI9m
   L4uTVKR4j0MArv+XSkyTkn0x/3E0MWKXfifuzrtGASMVcHzL9ZpUCYbv/
   aNa3omvtDR/M309FPBqjbL1cCHxQzXM/KlZpsNE5CXL1Jbimplotu5e/t
   6XwZTxF8hC4slfdXLS5uEuTao+q+YIImiZc/7kIcfk7aVu7o6RWp7VfSH
   liBcLDClk84nN8795anMJo/zWOjLSJSRLd5W6i8yqCEr+cLVOLr56LKjE
   Q==;
X-CSE-ConnectionGUID: 4z8QtiI5QM6T1VWTR5CHSw==
X-CSE-MsgGUID: zVlclm7iQlq4PGjiYAmMyA==
X-IronPort-AV: E=McAfee;i="6700,10204,11339"; a="27279746"
X-IronPort-AV: E=Sophos;i="6.13,271,1732608000"; 
   d="scan'208";a="27279746"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Feb 2025 16:36:26 -0800
X-CSE-ConnectionGUID: RxnsPkHYTZyKOHnQIBmPsw==
X-CSE-MsgGUID: XkY268TxS8y0bMbdfaGfyg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="116455896"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 08 Feb 2025 16:36:25 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tgvJ9-0010pL-2F;
	Sun, 09 Feb 2025 00:36:23 +0000
Date: Sun, 9 Feb 2025 08:35:35 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Liu Jian <liujian56@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 2732/2732] kismet: WARNING: unmet direct
 dependencies detected for BPF_NET_GLOBAL_PROG when selected by
 SCHED_TASK_RELATIONSHIP
Message-ID: <202502090816.X4XejMgg-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   263072f655dcd6fd63f7d5dd1f9c5553134982fa
commit: 64ba5634c4c60ea966612ab3eca75cbf2d90f9bc [2732/2732] net: add some bpf hooks in tcp stack for network numa relationship
config: arm64-kismet-CONFIG_BPF_NET_GLOBAL_PROG-CONFIG_SCHED_TASK_RELATIONSHIP-0-0 (https://download.01.org/0day-ci/archive/20250209/202502090816.X4XejMgg-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20250209/202502090816.X4XejMgg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502090816.X4XejMgg-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for BPF_NET_GLOBAL_PROG when selected by SCHED_TASK_RELATIONSHIP
   WARNING: unmet direct dependencies detected for PGP_PRELOAD
     Depends on [n]: CRYPTO [=y] && ASYMMETRIC_KEY_TYPE [=n]
     Selected by [y]:
     - PGP_PRELOAD_PUBLIC_KEYS [=y] && CRYPTO [=y]
   
   WARNING: unmet direct dependencies detected for BPF_NET_GLOBAL_PROG
     Depends on [n]: NET [=n] && BPF_SYSCALL [=n]
     Selected by [y]:
     - SCHED_TASK_RELATIONSHIP [=y] && CGROUPS [=y] && NUMA_BALANCING [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
