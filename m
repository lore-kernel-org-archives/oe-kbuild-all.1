Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82FCE1F12F6
	for <oe-kbuild-all@lists.linux.dev>; Mon,  3 Mar 2025 19:38:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741030729; cv=none; b=XT5c8rdgWrH+LtMuYIujPkLLgNsJc9bO4g/J6uAa4M2/xANcz/atSS7BdNeJQIXqWFtGYZj+dI2VJ9MwvgpXAFtBpU/SHKWCunoBFE8wo3UEHPsIyDfPHE5v1hCuz6M4sL3DrwZHtbu5alHdWbq5mwbvcdtQqJZnDqtV7HtffVo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741030729; c=relaxed/simple;
	bh=hl92goR7DAmvjKNXhNfaGMRwKAnWSGDtCDRIavYpLbE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=k7GLcjWewaGBePHkMC/ZKeRWbbZaKC4oOGzZB/rDXjpPypLJ+ch+ppr0JxELjutP+l9RVg4RFwW7DD435K2EmpH85QR4WJIVnITFHZ2JVRlM2AdPn2IxuZrB29U5njLujJxFEfjLwC7LgsgX9tD/5oHodZAnz2ABMlzaQ9gwZNo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mRLKi54v; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mRLKi54v"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741030728; x=1772566728;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=hl92goR7DAmvjKNXhNfaGMRwKAnWSGDtCDRIavYpLbE=;
  b=mRLKi54vVmJTdEUbWgX2UT3yn/oFSD8UZxOaY3ximLnulLWQP48H/OTL
   LY3PXUwgZJckpkUhYQZdJcuemhEBqBGroOe94xWubOK6a5bheQ3YeYf9B
   brEd5HEtiMi3nxHRACOz2c9SFs5ja6Kw2RyTCkWMgrXImNfCY+vvrbgbi
   5g9Q4/HLk1X5HsuZ7sApCQRNLFwdla8YRQtLGTHxa+7h8jqvfOxDxQJif
   1fw21RezxA8SZG1VH6gp4rkwc6Tz5lETCSluPj9EAUQK+FGAFshW6C9U4
   8ZYgKMe3iBXkMci5BnD8VY34NTgOkHWRBZmtCJhDiF3yCR+ox4fowxbOZ
   w==;
X-CSE-ConnectionGUID: jgvlHPanTjOV6a10h3uSXg==
X-CSE-MsgGUID: OaNB6F1tSsKS5Auv7eOnvw==
X-IronPort-AV: E=McAfee;i="6700,10204,11362"; a="59335998"
X-IronPort-AV: E=Sophos;i="6.13,330,1732608000"; 
   d="scan'208";a="59335998"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Mar 2025 11:38:47 -0800
X-CSE-ConnectionGUID: IVBxjoSQSz6FxFsEUfZvcg==
X-CSE-MsgGUID: eTzaA4t/Qhm/aXA4K0+Rfg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="123367459"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by orviesa005.jf.intel.com with ESMTP; 03 Mar 2025 11:38:46 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tpBch-000Is6-2f;
	Mon, 03 Mar 2025 19:38:43 +0000
Date: Tue, 4 Mar 2025 03:37:54 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6 1/1] mm/memblock.c:2327:28: warning:
 cast to pointer from integer of different size
Message-ID: <202503040354.WeWHGh5i-lkp@intel.com>
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

tree:   https://android.googlesource.com/kernel/common android15-6.6
head:   ccc8abc3d9b0666f197fbf34ccd72be2a6d2ea1c
commit: 3368d09174c6e8f3759bd201dbe6ca20ed0cd0e0 [1/1] FROMLIST: memblock: introduce memsize showing reserved memory
config: arm-randconfig-004-20250304 (https://download.01.org/0day-ci/archive/20250304/202503040354.WeWHGh5i-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250304/202503040354.WeWHGh5i-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503040354.WeWHGh5i-lkp@intel.com/

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
