Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2556639A04B
	for <oe-kbuild-all@lists.linux.dev>; Fri, 18 Sep 2026 03:39:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789702781; cv=none; b=jskQPa9sI6unaKnKJctIkOnu/H7DlEtZuBw9BGqxTJGLl8sPxtzzIrmoIzm4zcsVvsDo7dA0ZR9plzGEUoA3DmDNby0F1Xc4ogN4GSD51hBeMdridnJVcLkjL/I5IDFbZVNcepg1vQ+inYxLtvIeYEZz+odIzYMEIDjQpgIPU3Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789702781; c=relaxed/simple;
	bh=wBZsvZfe+74A8uWVvV/1EwQ3MPK9mKOXRGcDb8RiLxo=;
	h=Date:From:To:Cc:Subject:Message-ID; b=s9xdnjZ8oyxpNIzp5dB6svi6uWvxhAM3YlUwPr9ReCDrERw3xks2RKBmdzS9no6r9uLGTtH1QAtAWCp8fVBR6xHc96d6kJDBx3VlckbRnDtw8q0yIB33EnpqUmRXlQZs0TC8WW3VAMi0SCmU3c/RRK27WjaJ4zYxxGAwpW6rw4U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QMkBtobr; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QMkBtobr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789702780; x=1821238780;
  h=date:from:to:cc:subject:message-id;
  bh=wBZsvZfe+74A8uWVvV/1EwQ3MPK9mKOXRGcDb8RiLxo=;
  b=QMkBtobrRkF/PxjOMt0MWYMiE5bDBsLQNoWM9uQ4QTRe9Myt33CoqKPK
   t30bg8JJmbn49/tv/DJKAfmv82ulyyS2w+Tk2GZFTJcIJtw5ll/xm/QMA
   Vv5r1Z6MkkZNxuAjg3V8HuCUGDuoNXaj9RqpIsbQwkmxN1ZiK3Sd9eT2n
   3tXKEWYkCxmFIpk8CJIUfuKjKeHhuvGlu3g6LfIwmySgvokqukvuJ+ZXm
   /234GS7OeVEE3reY2g0paKY+mWfr2YOhtqmYSRRolEuYeAdke7+cKB8Qn
   Od/mbXdQOXrcJtv3+SkNXLrYtPV5OQHDnyYChtEtsZnQ/foO4i4EaX0TL
   Q==;
X-CSE-ConnectionGUID: s0U0RTQuSiGzkXcO4R43Ww==
X-CSE-MsgGUID: pjEcAt/7Qcm/kyC4ExWBpA==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="107687445"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="107687445"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Sep 2026 20:39:40 -0700
X-CSE-ConnectionGUID: Z1+6iK2wT1aWCRkOdHBp8Q==
X-CSE-MsgGUID: 2JPeSDO8T8ODaNThk8NdiQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="279405116"
Received: from lkp-server01.sh.intel.com (HELO 462990a40a85) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 17 Sep 2026 20:39:38 -0700
Received: from kbuild by 462990a40a85 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x7PRn-000000009Dr-2kyy;
	Fri, 18 Sep 2026 03:39:35 +0000
Date: Fri, 18 Sep 2026 11:38:51 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6 3/3] mm/memblock.c:2327:28:
 warning: cast to pointer from integer of different size
Message-ID: <202609181052.UYPD9SXQ-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Jaewon,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android15-6.6
head:   cdc3592a0ce26ec13098dd267d8c47b97aa03b49
commit: 3368d09174c6e8f3759bd201dbe6ca20ed0cd0e0 [3/3] FROMLIST: memblock: introduce memsize showing reserved memory
config: arm-randconfig-r1300-20260918 (https://download.01.org/0day-ci/archive/20260918/202609181052.UYPD9SXQ-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 15.2.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260918/202609181052.UYPD9SXQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609181052.UYPD9SXQ-lkp@intel.com/

All warnings (new ones prefixed by >>):

   mm/memblock.c: In function 'memblock_memsize_show':
>> mm/memblock.c:2327:28: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
    2327 |                            (void *)base, (void *)end,
         |                            ^
   mm/memblock.c:2327:42: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
    2327 |                            (void *)base, (void *)end,
         |                                          ^


vim +2327 mm/memblock.c

  2308	
  2309	static int memblock_memsize_show(struct seq_file *m, void *private)
  2310	{
  2311		int i;
  2312		struct memsize_rgn_struct *rgn;
  2313		unsigned long reserved = 0, reusable = 0;
  2314	
  2315		sort(memsize_rgn, memsize_rgn_count,
  2316		     sizeof(memsize_rgn[0]), memsize_rgn_cmp, NULL);
  2317		for (i = 0; i < memsize_rgn_count; i++) {
  2318			phys_addr_t base, end;
  2319			long size;
  2320	
  2321			rgn = &memsize_rgn[i];
  2322			base = rgn->base;
  2323			size = rgn->size;
  2324			end = base + size;
  2325	
  2326			seq_printf(m, "0x%pK-0x%pK 0x%08lx ( %7lu KB ) %s %s %s\n",
> 2327				   (void *)base, (void *)end,
  2328				   size, DIV_ROUND_UP(size, SZ_1K),
  2329				   rgn->nomap ? "nomap" : "  map",
  2330				   rgn->reusable ? "reusable" : "unusable",
  2331				   rgn->name);
  2332			if (rgn->reusable)
  2333				reusable += (unsigned long)rgn->size;
  2334			else
  2335				reserved += (unsigned long)rgn->size;
  2336		}
  2337	
  2338		seq_puts(m, "\n");
  2339		seq_printf(m, " .unusable  : %7lu KB\n",
  2340			   DIV_ROUND_UP(reserved, SZ_1K));
  2341		seq_printf(m, " .reusable  : %7lu KB\n",
  2342			   DIV_ROUND_UP(reusable, SZ_1K));
  2343		return 0;
  2344	}
  2345	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
