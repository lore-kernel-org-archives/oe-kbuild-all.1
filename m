Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6188422A4EF
	for <oe-kbuild-all@lists.linux.dev>; Mon, 23 Jun 2025 23:18:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750720729; cv=none; b=N0SX6jcFFjrwWn44EWMqMHOfKTXfTZUxKqkrn8Cl5xiw65pDJI5XYzI4br2HCepjk8RQU8dBkDLyFRfR2D/kNQTKMk8Y1AtMOFCCNIzSDvwBanu/A164w3tadlyWo9Xd2sGWAbCUY5KZqUh7Uxh+toLqaxPaJTMObkvlCNnDPv0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750720729; c=relaxed/simple;
	bh=2dRkRMbkHiBUJCY5pSJ7bc7dk73TWR5Uo+sNDbrXpjU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=GQVTJAchxXAVUdICYIaf0a/+gqW+LwLsdHP0lFEfSclSocty/pN+rasL3ql2K4LUq5xohTTgg7mcpgFq1zULDw6hTKvZqXix4tY/HvrL5mRqNOS80lkhKmk/F+TPNcDfeNR5yoI/xDGCkncHoiU/HenEBfWpdQTWJ3LKmAqOsVE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GQynfb3i; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GQynfb3i"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750720727; x=1782256727;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=2dRkRMbkHiBUJCY5pSJ7bc7dk73TWR5Uo+sNDbrXpjU=;
  b=GQynfb3iaLITbqwkWcnCDzU4nACwOqpt0tkkNzLVt5NFYwopKVaI/sLv
   UXWfIGVY6LeMDSCPGmRGUWckV2lQw/skoB+qo04SluZq+Aru88n/0A0jY
   3fdWQJt2HHOdJ7cVZ9LIdG8jJCCxfiGHcB9QjNgPGCrYgzF/9N7KRSEB/
   ItlTvyiYTAB7VOSwFe7JO+mJ0WVi14O5pFl2eM+cC2swMlrVWLjQdBbap
   I6aFWPWL3gqXGnRFUA9qev24JYYerMfuHnE3/A6GfUGd3nfvIHEikTJ43
   ts8MQkIrNO8xI2Y6rMhukMwJuUYX5X8XIlFC5UE9MyeuWOJ1EVok9HLJS
   Q==;
X-CSE-ConnectionGUID: VAvZ87cRRTW/08NK7w7eTQ==
X-CSE-MsgGUID: f929o69WTt6C/P4h9+9WWg==
X-IronPort-AV: E=McAfee;i="6800,10657,11473"; a="63640810"
X-IronPort-AV: E=Sophos;i="6.16,260,1744095600"; 
   d="scan'208";a="63640810"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jun 2025 16:18:44 -0700
X-CSE-ConnectionGUID: DeDtM++KSMeI2LAIGYJUlQ==
X-CSE-MsgGUID: qFkl17ntTXO7FqZC9mTNqA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,260,1744095600"; 
   d="scan'208";a="152247764"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 23 Jun 2025 16:18:44 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uTqQz-000RVS-1J;
	Mon, 23 Jun 2025 23:18:41 +0000
Date: Tue, 24 Jun 2025 07:18:35 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12 2/2] mm/memblock.c:2512:28: warning:
 cast to pointer from integer of different size
Message-ID: <202506240725.67m9jtiR-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android16-6.12
head:   986d344a4766b98e5aca8a690a37f226c952cd8b
commit: b2fbc2411ea7772d758ab4626d83f8aabf29eaf8 [2/2] ANDROID: memblock: introduce memsize showing reserved memory
config: arm-randconfig-001-20250624 (https://download.01.org/0day-ci/archive/20250624/202506240725.67m9jtiR-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 13.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250624/202506240725.67m9jtiR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506240725.67m9jtiR-lkp@intel.com/

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
