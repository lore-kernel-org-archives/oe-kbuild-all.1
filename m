Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4C91634
	for <oe-kbuild-all@lists.linux.dev>; Fri,  7 Feb 2025 05:30:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738906210; cv=none; b=m917JnuF/vINBE5Nf9fWBqaJq4E0NY+L976DWhI27mUeAPVkxezq16dsJG+UXIpDfrxgA9WeOXzR5+9geYsxRTWQjE2gMFJt/1EoLJ8IZ6Ez+CjtDqA4t4m1Cr06KwV0GYf72TrDSzOEmttzjk8lB/lVBWa+xT67/X4t07FQ1a8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738906210; c=relaxed/simple;
	bh=CUi24stRuekkZ6TsOFWN2FT1u0lvuoHozBYvXE2auV0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=cZlAOiWLV7QRNzxQE3e4UYclZxutaryLx59EyevXkDRjjCc3awxLSt6YT27KBW/n8+iK1CitTWR5XLBoka8vwee+BBeqEdq+aJnesoMFSTAVwPW5MaLnnjpimCAANx0C69m5WqJqRDEhQhJFS6G9j62o/1/b3UPY43TTzFwCCt0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NJWCsHvK; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NJWCsHvK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738906208; x=1770442208;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=CUi24stRuekkZ6TsOFWN2FT1u0lvuoHozBYvXE2auV0=;
  b=NJWCsHvK17tvgEflbuxEuXZIOAM4SH3d1fspBDCnUJf44oquEoKpo42V
   6y2rihHJj6sHuNe57YGDkuuSPqfUz1z8GtMLQaYDDtZwIduZcKtJQRblQ
   YSuLcJqjCmkCCSeMmjNOtpN4zHHl8gw7weTO2p/c7KQI6gp4h6WY8HZY5
   WHvOHyTlm0bQ01Z18vXTXPSPiY+DFygp37Q5KjkNDVeKoCrCDoZal8Uhx
   XRGyC+KVAZO7i97czetNGfgee9K0RXklD3nuQLQ6V55IxO9VaiWu9LgzE
   8gL7kcOWlkRfk5A9Ih2FNyb+F66xzeuZV3VhX7yX/nuv03OWh0Bx40eKa
   A==;
X-CSE-ConnectionGUID: fiUsePNHQSiR8Nfhkhj3Xw==
X-CSE-MsgGUID: jWFW320ISAe+HJ8EeZyoOA==
X-IronPort-AV: E=McAfee;i="6700,10204,11336"; a="39235466"
X-IronPort-AV: E=Sophos;i="6.13,266,1732608000"; 
   d="scan'208";a="39235466"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Feb 2025 21:30:08 -0800
X-CSE-ConnectionGUID: a/5eKHTMR9mqPN458udXvg==
X-CSE-MsgGUID: PJEHyzklTUWmWDfq+iYyig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="111865022"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 06 Feb 2025 21:30:07 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tgGwG-000xnD-2o;
	Fri, 07 Feb 2025 05:30:04 +0000
Date: Fri, 7 Feb 2025 13:29:22 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Jinjiang Tu <tujinjiang@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 1897/1897] mm/madvise.c:297:6: warning: no
 previous prototype for 'force_swapin_vma'
Message-ID: <202502071345.oFOjxkvF-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Liu,

FYI, the error/warning still remains.

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   fdc8c83a12a8fc4b7c55971d552758ffe2f34c14
commit: 92a0eb9bde6c03412b39f9f3d20968c091ea3b46 [1897/1897] memcg: introduce per-memcg swapin interface
config: x86_64-alldefconfig (https://download.01.org/0day-ci/archive/20250207/202502071345.oFOjxkvF-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250207/202502071345.oFOjxkvF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502071345.oFOjxkvF-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> mm/madvise.c:297:6: warning: no previous prototype for 'force_swapin_vma' [-Wmissing-prototypes]
     297 | void force_swapin_vma(struct vm_area_struct *vma)
         |      ^~~~~~~~~~~~~~~~


vim +/force_swapin_vma +297 mm/madvise.c

   280	
   281	#ifdef CONFIG_MEMCG_SWAP_QOS
   282	void force_swapin_vma(struct vm_area_struct *vma)
   283	{
   284		struct file *file = vma->vm_file;
   285	
   286		if (!can_madv_lru_vma(vma))
   287			return;
   288	
   289		if (!file) {
   290			walk_page_vma(vma, &swapin_walk_ops, vma);
   291			lru_add_drain();
   292		} else if (shmem_mapping(file->f_mapping))
   293			shmem_swapin_range(vma, vma->vm_start,
   294				vma->vm_end, file->f_mapping);
   295	}
   296	#else
 > 297	void force_swapin_vma(struct vm_area_struct *vma)
   298	{
   299	}
   300	#endif
   301	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
