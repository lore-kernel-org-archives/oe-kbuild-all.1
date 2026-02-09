Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 062DD3793B1
	for <oe-kbuild-all@lists.linux.dev>; Mon,  9 Feb 2026 15:37:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770651455; cv=none; b=JdHUVG/IXRbfU1Q4ZRvNiz4IWwfDNoTXDcJCjymmWpdKExv9FTPZabvMiIf3YiM1Bjl09mE/aLWenqgZsjTLV28/alp+dnyKzwROaXeR6hMKDQvBpxgfabkPQULRNjJjX9JqsDZm6rj0gr38BqlsNnSHTLv8XbbkUcjzAWEyPVE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770651455; c=relaxed/simple;
	bh=B9YxDqF7yf/dGxT+KCmqV0XMg8o17akA2a3gTQVMKkQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=HLDGP2soDOXn+Vmij2yDd3PSdmgeCigcmB/89mOqUaHRcUQWoGlWJqiDTYxNvAhJKEl0puc3uxFcYlKRP++5gSiV0zT/T7a4m7MbiUguDXUe5xw0GSo5X3LUMCj2bR+Mo5UMO90mmhWRKXEfxaL2uUW9dVvsFrBgSe5FPSfWZbk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TKTIm9Ds; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TKTIm9Ds"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770651455; x=1802187455;
  h=date:from:to:cc:subject:message-id;
  bh=B9YxDqF7yf/dGxT+KCmqV0XMg8o17akA2a3gTQVMKkQ=;
  b=TKTIm9DsO5ZQvkRKUc9K4DGucEhMXSwnMZ1FMWpMgO0cVVxKbP4k1Cm9
   4TZHCt5MsaOiVJtTD2mrSlFYwgRFZ2kuJ89WU1K+rULnqdDimBsKr7HWm
   3u/B4mgUSFdxFLS92lg7VyOG+WaoY+BRwGww/X9Fj4k1nGHskPZazVILa
   V/13tMhfP/vg8s3k/8ijmRmd/LURDORxpt6UhmdfUtQzFYfHKU8atTpZT
   yC55TC8+0zSNwjC3UFz48wJiboGXrHV1r3Vg6uCRvSIldltVL4IC6WY4p
   9UzP4Mk4XiFzFtUL5uHSqwNH+voG+3MEEz40ApgNEC/cZPn/M5KbghHOV
   w==;
X-CSE-ConnectionGUID: 7PqUmfqlToODupsbJz0C+g==
X-CSE-MsgGUID: ekgWu3hJQH2FekjHOhPr8Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11696"; a="71665085"
X-IronPort-AV: E=Sophos;i="6.21,282,1763452800"; 
   d="scan'208";a="71665085"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Feb 2026 07:37:34 -0800
X-CSE-ConnectionGUID: GJF29HmyQgiXFHzt9N791A==
X-CSE-MsgGUID: Sz65rC9USmyDZiA7Vxgemg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,282,1763452800"; 
   d="scan'208";a="211627471"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 09 Feb 2026 07:37:32 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vpTKM-00000000o4y-2Ksm;
	Mon, 09 Feb 2026 15:37:30 +0000
Date: Mon, 09 Feb 2026 23:37:14 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12 2/2] mm/memblock.c:2512:28:
 warning: cast to pointer from integer of different size
Message-ID: <202602092305.uOn6Ah22-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Jaewon,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android16-6.12
head:   3b54985e12634723f50be663b001e0f03e8643e1
commit: b2fbc2411ea7772d758ab4626d83f8aabf29eaf8 [2/2] ANDROID: memblock: introduce memsize showing reserved memory
config: arm-randconfig-004-20260209 (https://download.01.org/0day-ci/archive/20260209/202602092305.uOn6Ah22-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 14.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260209/202602092305.uOn6Ah22-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602092305.uOn6Ah22-lkp@intel.com/

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
