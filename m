Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDCD73D3CEF
	for <oe-kbuild-all@lists.linux.dev>; Fri, 17 Jul 2026 22:55:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784328922; cv=none; b=j+n4+CxdI+MitucFBV0YwqYBrvW5UPoMWV5RmyqqHjxg3gumc0fa+0gWClSkzevvmF8eUxv1YIIeLYxobpDrdnaiAEkTLKZdtMMzedSTZ+KXWYjUdwBBdJQIJymu2oDcj/U+JS4hB0t9xIVsw3TiIlk6B+8clkkzKuSjDF7zoN8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784328922; c=relaxed/simple;
	bh=Hho2LnwXM6aZTZmHd+YDDYWMr1YoayxsXjpiarbTYzc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=YYcP9ofHy0Kz4hHGhA9kFR2kDX9Lp84x7pw6hmijltwlJbJNzwnDkfwJy0qI+y+km7WHQG1Zq1fVDGBNJEOIoiUaz6L+tB2x2pdk7vI1P1CDoga7AqVe+5kofqhdVsgwOmFoHQEssGyh+NkDTqXg65DtNPD+b7Q0cegUixaCoO8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mt4QpYv2; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mt4QpYv2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784328912; x=1815864912;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Hho2LnwXM6aZTZmHd+YDDYWMr1YoayxsXjpiarbTYzc=;
  b=mt4QpYv2wHsyRIfJfUgynkBcXKkCsMi3SKvszuME7u6f+jNCYJdJZdUs
   CjxfmwKXEfGDZVixi3l3seNZe9sl4Rl+LIsrYPSTNr20sSyHvr3yuRRzr
   tA4X5T0q09KZH9HU7uLvKYIaIuVXhSshNLvl6PX3itgdZyCUiSyuSJEk/
   ZZvh0b+mjBCsaMIHB4XOEEKfAZ8448IG6HOvDXwPSGYY/eoECBki2U98N
   71HAB/45BUQbRq66BrJTnWymy8Q1ZmFk65Y7lCItJKLl7v85PKz/fh555
   himxcBqx5b6ITa5ugB9t7pLIwrUo1BRLdhvJp9GQX3NEGO/7B93QmRGJ0
   g==;
X-CSE-ConnectionGUID: pFe5FpGiSweuAF/Pcq812Q==
X-CSE-MsgGUID: LVRfn/ZsRrihen/rVbWjwQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11849"; a="96139612"
X-IronPort-AV: E=Sophos;i="6.25,170,1779174000"; 
   d="scan'208";a="96139612"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jul 2026 15:55:08 -0700
X-CSE-ConnectionGUID: kgY+GNmYRcmPcKp3Cb1z7w==
X-CSE-MsgGUID: gAdiI85JTPCHcWt+ys6MUg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,170,1779174000"; 
   d="scan'208";a="256987086"
Received: from igk-lkp-server01.igk.intel.com (HELO e5a8ed462067) ([10.211.93.152])
  by orviesa007.jf.intel.com with ESMTP; 17 Jul 2026 15:55:06 -0700
Received: from kbuild by e5a8ed462067 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wkrSS-000000005f3-0s9l;
	Fri, 17 Jul 2026 22:55:04 +0000
Date: Sat, 18 Jul 2026 00:54:14 +0200
From: kernel test robot <lkp@intel.com>
To: =?utf-8?Q?"Andr=C3=A9?= Almeida" <andrealmeid@igalia.com>
Cc: oe-kbuild-all@lists.linux.dev, 0day robot <lkp@intel.com>
Subject: arch/arm64/kernel/vdso.c:89:12: warning: 'vdso32_mremap'
 defined but not used
Message-ID: <202607180007.ie9nlcUq-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

tree:   https://github.com/intel-lab-lkp/linux/commits/Andr-Almeida/arm64-vdso-Prepare-for-robust-futex-unlock-support/20260717-225213
head:   220f1df8b1f91a406405ba5aaee5b6001c94e1b5
commit: 41604186975072d3862522d1e43898584531ee98 arm64: vdso: Prepare for robust futex unlock support
date:   8 hours ago
config: arm64-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20260718/202607180007.ie9nlcUq-lkp@intel.com/config)
compiler: aarch64-linux-gnu-gcc (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260718/202607180007.ie9nlcUq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607180007.ie9nlcUq-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/arm64/kernel/vdso.c:89:12: warning: 'vdso32_mremap' defined but not used [-Wunused-function]
      89 | static int vdso32_mremap(const struct vm_special_mapping *sm,
         |            ^~~~~~~~~~~~~


vim +/vdso32_mremap +89 arch/arm64/kernel/vdso.c

    88	
  > 89	static int vdso32_mremap(const struct vm_special_mapping *sm,
    90			struct vm_area_struct *new_vma)
    91	{
    92		current->mm->context.vdso = (void *)new_vma->vm_start;
    93	
    94		vdso_futex_robust_unlock_update_ips(VDSO_ABI_AA32, current->mm);
    95	
    96		return 0;
    97	}
    98	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
