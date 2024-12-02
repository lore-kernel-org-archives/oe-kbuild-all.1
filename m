Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 708171DE89C
	for <oe-kbuild-all@lists.linux.dev>; Mon,  2 Dec 2024 22:28:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733178540; cv=none; b=kTyq5bdYJIU/ZXJ9GQZUyaWytSnzWXbrPP0Vz3WXERGbpQ/WH995m993b43ku9jkZfokCHNsu1rFcQLyU6IS0L/uRKO7leSwzSMguJ8V7KQel1hPNXQLOJZw8eXDsIzTXHvVNL26K7dWpXbBpxSnr8rVggT0j45QSSz5mytGhPk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733178540; c=relaxed/simple;
	bh=qQxWXO6DZ0mP1MuZox3W4Vto2USRJPLnnb7oK/2ijiI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=D48ov6lAQwdl0hz/9pjchPp8t4CUwmCrAmvQAkDYFcrel3PSVi0yHi0tHHMFuD46y/WTNgdZf25q3Axv6pzqe7JgU4pwk8CKqDTXyyAmsfNsXIE3olVm+5mFbX+0a6WRtJ7Iugrt2PqWsD4ZD8DOx8vyR37zIXAltdHCAvoUMvc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cYZ90lZs; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cYZ90lZs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733178538; x=1764714538;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=qQxWXO6DZ0mP1MuZox3W4Vto2USRJPLnnb7oK/2ijiI=;
  b=cYZ90lZsFnAaMjXnQT1grZJpjR9s5WHJoil6smcfNqThGxnBA6Fo086C
   Z4W6WXaM/T1hAND3wo5ynzi6nMVqXTtwONzw8cxznXsJjHBAoefk2F1Ol
   xswV0b7yRfHTfSi9GRIXkdInzs9Mfotglw3tnUJAZBEQ4jJ4uG2J8p2h0
   ImVK92ez4V/9V/t12ve7IF9Li9WBbwKh47Vt04/t/2CXSy1zY4efH0IAg
   pzID1arFjXdqPLuEDvYs74Z2xM3e7RCJnxn1AFIHNEpHkDuieM0uLSHd6
   wqTJfkKlBGmNCQZpFtdjEDfOu9D6dGlpxKl/sveLY+69Lz2Vcqvv+DdNJ
   w==;
X-CSE-ConnectionGUID: K2MdwmuGQBWESUcmMfioJA==
X-CSE-MsgGUID: OLTiJzO1ToCyMAimwSPWMg==
X-IronPort-AV: E=McAfee;i="6700,10204,11274"; a="37307516"
X-IronPort-AV: E=Sophos;i="6.12,203,1728975600"; 
   d="scan'208";a="37307516"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Dec 2024 14:28:55 -0800
X-CSE-ConnectionGUID: 8n5jBM7TRCmrbR+yO+FCXA==
X-CSE-MsgGUID: qUU4eePsR0We6+u/6PJjwg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,203,1728975600"; 
   d="scan'208";a="93563704"
Received: from lkp-server02.sh.intel.com (HELO 36a1563c48ff) ([10.239.97.151])
  by fmviesa010.fm.intel.com with ESMTP; 02 Dec 2024 14:28:54 -0800
Received: from kbuild by 36a1563c48ff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tIEuO-0002xx-0c;
	Mon, 02 Dec 2024 22:28:49 +0000
Date: Tue, 3 Dec 2024 06:28:41 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Zheng Zengkai <zhengzengkai@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 2516/2516] arch/arm64/mm/pmem_reserve.c:13:13:
 warning: no previous prototype for 'setup_reserve_pmem'
Message-ID: <202412030629.xfIRDSCP-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Zhuling,

FYI, the error/warning still remains.

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   929a9df37c1b7dec73fd417d79a116d02a8f9380
commit: db4cd75bc674e6f473c0a7303b1744155352882c [2516/2516] arm64: register persistent memory via protected memory
config: arm64-randconfig-002-20241203 (https://download.01.org/0day-ci/archive/20241203/202412030629.xfIRDSCP-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241203/202412030629.xfIRDSCP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412030629.xfIRDSCP-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/arm64/mm/pmem_reserve.c:13:13: warning: no previous prototype for 'setup_reserve_pmem' [-Wmissing-prototypes]
      13 | void __init setup_reserve_pmem(u64 start, u64 size)
         |             ^~~~~~~~~~~~~~~~~~
>> arch/arm64/mm/pmem_reserve.c:25:13: warning: no previous prototype for 'request_pmem_res_resource' [-Wmissing-prototypes]
      25 | void __init request_pmem_res_resource(void)
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~
>> arch/arm64/mm/pmem_reserve.c:40:13: warning: no previous prototype for 'reserve_pmem' [-Wmissing-prototypes]
      40 | void __init reserve_pmem(void)
         |             ^~~~~~~~~~~~

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for HARDLOCKUP_DETECTOR
   Depends on [n]: DEBUG_KERNEL [=n] && !S390 && (HAVE_HARDLOCKUP_DETECTOR_PERF [=n] || HAVE_HARDLOCKUP_DETECTOR_ARCH [=y])
   Selected by [y]:
   - SDEI_WATCHDOG [=y] && ARM64 [=y] && ARM_SDE_INTERFACE [=y] && !HARDLOCKUP_CHECK_TIMESTAMP [=n]
   WARNING: unmet direct dependencies detected for PGP_PRELOAD
   Depends on [n]: CRYPTO [=y] && ASYMMETRIC_KEY_TYPE [=n]
   Selected by [y]:
   - PGP_PRELOAD_PUBLIC_KEYS [=y] && CRYPTO [=y]


vim +/setup_reserve_pmem +13 arch/arm64/mm/pmem_reserve.c

    12	
  > 13	void __init setup_reserve_pmem(u64 start, u64 size)
    14	{
    15		if (pmem_res_cnt >= MAX_REGIONS) {
    16			pr_err("protected memory regions above upper limit %d\n", MAX_REGIONS);
    17			return;
    18		}
    19	
    20		pmem_res[pmem_res_cnt].start = start;
    21		pmem_res[pmem_res_cnt].end = start + size - 1;
    22		pmem_res_cnt++;
    23	}
    24	
  > 25	void __init request_pmem_res_resource(void)
    26	{
    27		struct resource *res;
    28		int i;
    29	
    30		for (i = 0; i < pmem_res_cnt; i++) {
    31			res = &pmem_res[i];
    32			res->name = "Persistent Memory (legacy)";
    33			res->flags = IORESOURCE_MEM;
    34			res->desc = IORES_DESC_PERSISTENT_MEMORY_LEGACY;
    35			if (res->start && res->end)
    36				request_resource(&iomem_resource, res);
    37		}
    38	}
    39	
  > 40	void __init reserve_pmem(void)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
