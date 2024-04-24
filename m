Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C58516D304
	for <oe-kbuild-all@lists.linux.dev>; Wed, 24 Apr 2024 17:49:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713980969; cv=none; b=tv+cmgwJEp/b8jGuGCvnJlMKXr1lxS+A74z14O3hKtYlLwbdPfN9OnVu32t9yTnmeeQzYm4sfa56tktrIb/OaW+3p5wvMEzAaAQyS0cdTWe2mitoTlSrt476SqXeAxGrgVu9tMHQgE8p+is9mGwPP+JyY1St5P018uqdKsuZcuc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713980969; c=relaxed/simple;
	bh=2NaYTaW37c8MLRY9yrQ327LxNm95bXi+3zkuonEiqwY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=aWoaiWygLGngrV2gQlI54z1gwd9kg//cSZmNjzqmCKvGqkI2psSLAfDJHIT1HrOdIhPEgodvj7Wk64cc/h7qqbQXzA1lZhqQsewy7gwTNdwX9nzu2792Aa3pgg9HsItYkT0rp27PVjK6QPZKvFLs2bqdhE0NPz0MRktE+6BQZO8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TQHNHbg9; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TQHNHbg9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713980968; x=1745516968;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=2NaYTaW37c8MLRY9yrQ327LxNm95bXi+3zkuonEiqwY=;
  b=TQHNHbg9OjnweLBSQVeUoi4sKkKqCTsKxJXyLX6AyI2fHkGfegpgiyyT
   cPaMp5DNIfqCWP1Q1GN74ZFE1BIsh+sMXk3y9cLixmNhDOy1MDQCBAAoQ
   CvsYE7+kezwb6vhI3uvzJbsj2bzswKCC5aK5pi7XDYGI7HkuRFllDYJNz
   13bbpmO/PDSAlkesDz4S/rfMCkn5oyXxoAiX22ocqUYSFcnCar+NEwu1c
   +GGRXYDwqdrGaRTqdLFHyBgml0KHQhewgeiXq17Pm9Wuz1+cjPI90yPja
   ulnA6h5OUw0ikMQ3Bb04hlYDNGFKHTbSAUjGdu1yavSnCmSRETFOI8E04
   A==;
X-CSE-ConnectionGUID: nvhNUJCvRf+MKWcQnkfx+w==
X-CSE-MsgGUID: ImHGNTyIRkq9KoxYyDeoTQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11054"; a="9496041"
X-IronPort-AV: E=Sophos;i="6.07,226,1708416000"; 
   d="scan'208";a="9496041"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Apr 2024 10:49:27 -0700
X-CSE-ConnectionGUID: BImF/s8QR+2ABQMxW2lRkg==
X-CSE-MsgGUID: XCwgnrwISAiDj5LlmyWx3A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,226,1708416000"; 
   d="scan'208";a="29587851"
Received: from lkp-server01.sh.intel.com (HELO e434dd42e5a1) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 24 Apr 2024 10:49:25 -0700
Received: from kbuild by e434dd42e5a1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rzgkF-0001Vu-0p;
	Wed, 24 Apr 2024 17:49:23 +0000
Date: Thu, 25 Apr 2024 01:48:57 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Zheng Zengkai <zhengzengkai@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 9662/30000] arch/arm64/mm/quick_kexec.c:21:13:
 warning: no previous prototype for 'reserve_quick_kexec'
Message-ID: <202404250122.Ybay1rip-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Kefeng,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   fca9656c7bff35049038766e63e93888847b5bff
commit: d61f4ca086e99bb481961b1120e10e7a4296c392 [9662/30000] arm64: quick_kexec: Move to stand-alone file
config: arm64-randconfig-002-20240425 (https://download.01.org/0day-ci/archive/20240425/202404250122.Ybay1rip-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240425/202404250122.Ybay1rip-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404250122.Ybay1rip-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/arm64/mm/quick_kexec.c:21:13: warning: no previous prototype for 'reserve_quick_kexec' [-Wmissing-prototypes]
      21 | void __init reserve_quick_kexec(void)
         |             ^~~~~~~~~~~~~~~~~~~
>> arch/arm64/mm/quick_kexec.c:47:13: warning: no previous prototype for 'request_quick_kexec_res' [-Wmissing-prototypes]
      47 | void __init request_quick_kexec_res(struct resource *res)
         |             ^~~~~~~~~~~~~~~~~~~~~~~


vim +/reserve_quick_kexec +21 arch/arm64/mm/quick_kexec.c

    20	
  > 21	void __init reserve_quick_kexec(void)
    22	{
    23		unsigned long long mem_start, mem_len;
    24	
    25		mem_len = quick_kexec_res.end;
    26		if (mem_len == 0)
    27			return;
    28	
    29		/* Current arm64 boot protocol requires 2MB alignment */
    30		mem_start = memblock_find_in_range(0, arm64_dma_phys_limit,
    31				mem_len, SZ_2M);
    32		if (mem_start == 0) {
    33			pr_warn("cannot allocate quick kexec mem (size:0x%llx)\n",
    34				mem_len);
    35			quick_kexec_res.end = 0;
    36			return;
    37		}
    38	
    39		memblock_reserve(mem_start, mem_len);
    40		pr_info("quick kexec mem reserved: 0x%016llx - 0x%016llx (%lld MB)\n",
    41			mem_start, mem_start + mem_len,	mem_len >> 20);
    42	
    43		quick_kexec_res.start = mem_start;
    44		quick_kexec_res.end = mem_start + mem_len - 1;
    45	}
    46	
  > 47	void __init request_quick_kexec_res(struct resource *res)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
