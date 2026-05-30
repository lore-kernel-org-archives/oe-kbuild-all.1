Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B7D130E85C
	for <oe-kbuild-all@lists.linux.dev>; Sat, 30 May 2026 09:11:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780132293; cv=none; b=MfuNsgcB5ew0RvU8mQSGWWH4evbNM/o9F1hCLSAlbKUssQXkUsSV/geR+8+Cf6djN87VFXpLVlOnm7vCRgwJzxtDbqPNrumux0hLCaDNj92QzraSft59G7dYdhIwaOrw94k8gHclraKO25jphN3SIHBFuxkaYR4GOeGGMcMKjcY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780132293; c=relaxed/simple;
	bh=k8bOuOBaprLWAsQBUvPzU/f58n9YQFeIv20zS9f2X3o=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Ekc6RE253BZAslmBVuuDj/ayQ056U7fSUk5GdnqAm3feV1xah98vWtaAjipTCz7NllguSn7CfZmRxgQ3tTcQvnHaCIvKFXM0m068DSdAIS45MtWrlfAGDBnxAGBpIvVP/ime21EtBv6+htU6802tm5/GjWXxM25TadY0Rzshfic=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YHkToqzW; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YHkToqzW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780132291; x=1811668291;
  h=date:from:to:cc:subject:message-id;
  bh=k8bOuOBaprLWAsQBUvPzU/f58n9YQFeIv20zS9f2X3o=;
  b=YHkToqzWA7CT+cMLgjyvl77E2gfEUbc3XHYCRlA9+xdWWbWeAgA1o9hK
   nfHSKFFhc1jty9tX5cM3/tEqIu4XhmgB3/81xclq/aHPYCHuiCt0S0PeE
   bJXFoZrc+k+LDZdKkRSGS1scGdJQSVied2nxq69rluK0R8yUUxKSQSwY3
   cCwC2Gvsuk2Ag6Gzch/No07ZmSG0/jOlWinbPz6gDBYBqqYDsCVStFiUW
   wvWwEx5PBBQ3gEt+pwqSTD+st/K4EqPo2ddWyKqNn9OpgjutUpFCutlaT
   IdgR2941+IrilH3CfzpA1RtdeFS4UJudH+f+PrFxsjzSWA3Mkaspv0hrt
   g==;
X-CSE-ConnectionGUID: 7CFNO8YvSha8LZzh/2fpHw==
X-CSE-MsgGUID: AR+uPRBjSLmYSpKFU9STFA==
X-IronPort-AV: E=McAfee;i="6800,10657,11801"; a="83548958"
X-IronPort-AV: E=Sophos;i="6.24,177,1774335600"; 
   d="scan'208";a="83548958"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 May 2026 02:11:31 -0700
X-CSE-ConnectionGUID: L3Iw0OJ7TXOkXPuCZo0buA==
X-CSE-MsgGUID: EYPzea0RRGODJHNNCVHfGQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,177,1774335600"; 
   d="scan'208";a="242939860"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 30 May 2026 02:11:30 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wTFj4-000000008HC-4215;
	Sat, 30 May 2026 09:11:26 +0000
Date: Sat, 30 May 2026 17:10:59 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12-desktop 1/1]
 mm/memblock.c:2512:28: warning: cast to pointer from integer of different
 size
Message-ID: <202605301711.sCSHgsPC-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Jaewon,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android16-6.12-desktop
head:   3e20a144f5762d10c2d82a5cf65ece4d2c8ea320
commit: b2fbc2411ea7772d758ab4626d83f8aabf29eaf8 [1/1] ANDROID: memblock: introduce memsize showing reserved memory
config: arm-randconfig-002-20260530 (https://download.01.org/0day-ci/archive/20260530/202605301711.sCSHgsPC-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260530/202605301711.sCSHgsPC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605301711.sCSHgsPC-lkp@intel.com/

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
