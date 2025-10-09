Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 679622D130B
	for <oe-kbuild-all@lists.linux.dev>; Thu,  9 Oct 2025 11:45:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760010324; cv=none; b=syL0/0zDloSVX9ywxjq700RLzmX3yyDcf1Q8TKINQEs27eMWa79B3d9Ue3vgWEbydFlVR5dXiNGtuJxjrN5tXkIF6b0aJZ7seoydDLHo8dt9timYsLwfzgIyLXDgWc7qj4nW04dcrmk0xaCvZp8hWghZBh3YDu2m6YmzKn3aWFo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760010324; c=relaxed/simple;
	bh=V8el+wof1Gu7BXqRDdLnGTQT3SfenbyQ2POsTIkX2qc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ksFrk8zu1trlSvKQ8iBXYtXPsnwwZ1VKxpvAKM3H/abRL0Gbzuxtg9BCa1x1y7b/qlz4DfXqcL9LY7hSd6Kd+M5OZXWHdUZLfXE3zm79AG13RaghE26dMgql2ksNOTmy38+Yikdi1M9OZ/sALQrAIAGlnDl1bGmznFN6yNVlHXo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mkmV+J48; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mkmV+J48"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760010322; x=1791546322;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=V8el+wof1Gu7BXqRDdLnGTQT3SfenbyQ2POsTIkX2qc=;
  b=mkmV+J48+cyqk62Q1I5KL7C633jISfsD7CjMkMUXrCv3vtJaKgDa7En/
   Tq9eJHnbczAkeIIPXmiSIeio95Gs4kQob7z76r8vweiHkGX7CEZk0H2N6
   wf5yrMZzLe1nTJA+TOyr58RI0zctN80fFHsEDvx2GmcHuSb/q2AFn5Pg1
   duue3bdRCdSiWmezSi2T1evCcNXQw22HI7uQk1P/XFPw1q4G1oqFkSYyK
   pVIZ/cixMk1X9zxk8bkjR81tjOkMTrvaGbZ7+2egf5rsyZxtg2KJMG6sF
   vthMr9N+oI4h7SKokk2y2h9SRl91jm6g8+IY3VGkEoun3HYdu6yj8fTbR
   Q==;
X-CSE-ConnectionGUID: TqBYFMZnTc6e6iq+2XvbOw==
X-CSE-MsgGUID: VOr5DeidTpStiATMA+xGOw==
X-IronPort-AV: E=McAfee;i="6800,10657,11576"; a="64836664"
X-IronPort-AV: E=Sophos;i="6.19,216,1754982000"; 
   d="scan'208";a="64836664"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2025 04:45:22 -0700
X-CSE-ConnectionGUID: aeIbQuIAR16gM9MzdV75Og==
X-CSE-MsgGUID: nMFG2kwcQbKtg6klHbLAdg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,216,1754982000"; 
   d="scan'208";a="181117796"
Received: from lkp-server01.sh.intel.com (HELO 6a630e8620ab) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 09 Oct 2025 04:45:20 -0700
Received: from kbuild by 6a630e8620ab with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v6p5B-0000cd-34;
	Thu, 09 Oct 2025 11:45:17 +0000
Date: Thu, 9 Oct 2025 19:44:48 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12-desktop 13/13] mm/memblock.c:2512:28:
 warning: cast to pointer from integer of different size
Message-ID: <202510091919.AXHldWeX-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Jaewon,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android16-6.12-desktop
head:   1ae89fc12f7b197fa525f33bf6b016ec3d782f45
commit: b2fbc2411ea7772d758ab4626d83f8aabf29eaf8 [13/13] ANDROID: memblock: introduce memsize showing reserved memory
config: arm-randconfig-003-20251009 (https://download.01.org/0day-ci/archive/20251009/202510091919.AXHldWeX-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251009/202510091919.AXHldWeX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510091919.AXHldWeX-lkp@intel.com/

All warnings (new ones prefixed by >>):

   mm/memblock.c: In function 'memblock_memsize_show':
>> mm/memblock.c:2512:28: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
    2512 |                            (void *)base, (void *)end,
         |                            ^
   mm/memblock.c:2512:42: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
    2512 |                            (void *)base, (void *)end,
         |                                          ^


vim +2512 mm/memblock.c

  2493	
  2494	static int memblock_memsize_show(struct seq_file *m, void *private)
  2495	{
  2496		int i;
  2497		struct memsize_rgn_struct *rgn;
  2498		unsigned long reserved = 0, reusable = 0;
  2499	
  2500		sort(memsize_rgn, memsize_rgn_count,
  2501		     sizeof(memsize_rgn[0]), memsize_rgn_cmp, NULL);
  2502		for (i = 0; i < memsize_rgn_count; i++) {
  2503			phys_addr_t base, end;
  2504			long size;
  2505	
  2506			rgn = &memsize_rgn[i];
  2507			base = rgn->base;
  2508			size = rgn->size;
  2509			end = base + size;
  2510	
  2511			seq_printf(m, "0x%pK-0x%pK 0x%08lx ( %7lu KB ) %s %s %s\n",
> 2512				   (void *)base, (void *)end,
  2513				   size, DIV_ROUND_UP(size, SZ_1K),
  2514				   rgn->nomap ? "nomap" : "  map",
  2515				   rgn->reusable ? "reusable" : "unusable",
  2516				   rgn->name);
  2517			if (rgn->reusable)
  2518				reusable += (unsigned long)rgn->size;
  2519			else
  2520				reserved += (unsigned long)rgn->size;
  2521		}
  2522	
  2523		seq_puts(m, "\n");
  2524		seq_printf(m, " .unusable  : %7lu KB\n",
  2525			   DIV_ROUND_UP(reserved, SZ_1K));
  2526		seq_printf(m, " .reusable  : %7lu KB\n",
  2527			   DIV_ROUND_UP(reusable, SZ_1K));
  2528		return 0;
  2529	}
  2530	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
