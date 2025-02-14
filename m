Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA9FF221DAD
	for <oe-kbuild-all@lists.linux.dev>; Fri, 14 Feb 2025 10:44:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739529901; cv=none; b=uSNmEkdPyhYt4vK3034Btc0/dTEJ2mGRNBxeTezUW2VxOEHAB+2B3etHrY+HJa6ZQ1jOO4hFfwGdGiitaB6p2Os9xfVACTHZQpR6VVkH/2GpB00wSlTB6FnW8djZgwVz9dQD3CNMJlHpGUKhq89teTyQSH8Itq/3WFky5ln7Y+E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739529901; c=relaxed/simple;
	bh=+BvG3kvZrnvFsxPS5WNy03PrHQwz56aOzhsaPLPxqYY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=dJKhwbo5Sox1fcoKCnlpaOQlHPx01x6bHU8gXYehtoP6pS4w7QmelgkwvO822P/gTb97l5YNnSYRMZZiELMzQ9I1H6BfK6/q8c7g1dJDkCOeH8v0pW/JulRdFJpAtFeevjeOBLxzffk1nkPwRoiKdmJ72R3JKAZJhfzr+9lBbi8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=h4/hgGHg; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="h4/hgGHg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739529899; x=1771065899;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=+BvG3kvZrnvFsxPS5WNy03PrHQwz56aOzhsaPLPxqYY=;
  b=h4/hgGHgYc8HD5RXyewftP03o5aO7tXabAoCT+GlVx6TaHjPqtPMeb4j
   mcR3Jt8PeQtg5h0mQ9z5mF3VD9eryhPVecBLxhugP0INI18szIXqfyp9z
   SY6kfYlKpc7qIucyxFhf3S+QdplVnCNteqaVKsEFq9dsPtwtKZ9r1A6sZ
   4TA3vrI3SwUSGGvIK/Wt1F9vMb1Wkj9DxAFSGgXHfDGHa6FWHehQn6LIP
   94kMBA6ShOJXZU9LOiKdss6P3DJd0cbDdRBrM+2c3nu4tApQpUlK39DdA
   W2MQMDVXGejuMDFB8yQ0s0ey1aRPy/h8T+pL0Wa6GTFvMjidi9aKHtLuc
   g==;
X-CSE-ConnectionGUID: TpkBnP2XRui8QELYmcm9lw==
X-CSE-MsgGUID: JbqfDmBJS92ovAnlv0ifWw==
X-IronPort-AV: E=McAfee;i="6700,10204,11344"; a="40197171"
X-IronPort-AV: E=Sophos;i="6.13,285,1732608000"; 
   d="scan'208";a="40197171"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Feb 2025 02:44:59 -0800
X-CSE-ConnectionGUID: eTA1lSYcSAmm13TchfgM2g==
X-CSE-MsgGUID: cS0hJAW3S/GoMe2faqICNw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="114326137"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 14 Feb 2025 02:44:56 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1titBm-0019PN-1s;
	Fri, 14 Feb 2025 10:44:54 +0000
Date: Fri, 14 Feb 2025 18:44:45 +0800
From: kernel test robot <lkp@intel.com>
To: Baoquan He <bhe@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>,
	Yang Li <yang.lee@linux.alibaba.com>
Subject: kernel/vmcore_info.c:117 paddr_vmcoreinfo_note() warn: unsigned '_x'
 is never less than zero.
Message-ID: <202502141843.5QoKdQ7g-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   128c8f96eb8638c060cd3532dc394d046ce64fe1
commit: 443cbaf9e2fdbef7d7cae457434a6cb8a679441b crash: split vmcoreinfo exporting code out from crash_core.c
date:   12 months ago
config: riscv-randconfig-r073-20250213 (https://download.01.org/0day-ci/archive/20250214/202502141843.5QoKdQ7g-lkp@intel.com/config)
compiler: riscv32-linux-gcc (GCC) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502141843.5QoKdQ7g-lkp@intel.com/

smatch warnings:
kernel/vmcore_info.c:117 paddr_vmcoreinfo_note() warn: unsigned '_x' is never less than zero.

vim +/_x +117 kernel/vmcore_info.c

   114	
   115	phys_addr_t __weak paddr_vmcoreinfo_note(void)
   116	{
 > 117		return __pa(vmcoreinfo_note);
   118	}
   119	EXPORT_SYMBOL(paddr_vmcoreinfo_note);
   120	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
