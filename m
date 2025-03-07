Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD2EC14293
	for <oe-kbuild-all@lists.linux.dev>; Fri,  7 Mar 2025 17:23:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741368213; cv=none; b=DlYu0zxIGojjkply1Vco/aXZV96IN5Acv/TFScC0792pyVsTEG7RiewWQxA1Lwjx4qWjXPNQslqJX2561Xkze49GWbcPjYaly9AvTDfx5MjfRKbAsxuscfr1SgXVf+yrXTVO/5bJfPnmWUFM/Vt1wYnrN0zTNMcS+z5jd8JIPAQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741368213; c=relaxed/simple;
	bh=qRMqKDH1Fd2QfwXbKDjRCKTmuNzP+ii+msP+y1FFdS4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=mtHOaUxNqbsBx7WNiFJscqFzOEf3p58yCsggmBxNkltxkwqXEKzHSNnib/kelegK12SZ2Ij+MojYD0PtVXwtK4wFCS3gW2A4dLbmI/DXeBYHUehs9TcmDceZzqwJ8JqcO+xH+iQ3wzT7S3Gb4g8XfamBsRkab96aarVjBrqSvpQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ep5tLwOA; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ep5tLwOA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741368211; x=1772904211;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=qRMqKDH1Fd2QfwXbKDjRCKTmuNzP+ii+msP+y1FFdS4=;
  b=Ep5tLwOAW3amz89reAT499f2K8rrH8q+4f/mSkjhcf1pSrYr0Vt44lTI
   GBui+P+yaPqjNoIQ7XhKP6HqMplJqDrHtVlQkqgImtp3+SVnPypzu2RZr
   hXJV5K232/OFZbqv1S9vvx1216SYQfxQIN8zXys8a2qrNoThN/zf2VPnn
   +J5t6P+beGZY6xHB0JKB5jrcZAPtsNHEklV8t4kYmLjKLBwuXvOIatr0y
   vgkULnRiUlH5pnQMMtuLT6X8MGBn5dqRzG1l9Y2r5PB/YwKetStR5/n7N
   sT1UXUkmRqRo2Da+4Vg6Dw/J/s9w7p5pNXb376EwqPMoxGWh0ch/6rA35
   g==;
X-CSE-ConnectionGUID: YQQB5RPlRjqvWH7xF5DIPw==
X-CSE-MsgGUID: r9B3GZPIR2SlqYwY1X68eg==
X-IronPort-AV: E=McAfee;i="6700,10204,11365"; a="59828396"
X-IronPort-AV: E=Sophos;i="6.14,229,1736841600"; 
   d="scan'208";a="59828396"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Mar 2025 09:23:30 -0800
X-CSE-ConnectionGUID: 5trxo7hrSZ6Q5krlpKcY+Q==
X-CSE-MsgGUID: IYC2NGu/Rf+3ifEJTFOxJQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="150331588"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by fmviesa001.fm.intel.com with ESMTP; 07 Mar 2025 09:23:29 -0800
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tqbPz-0000ql-0P;
	Fri, 07 Mar 2025 17:23:27 +0000
Date: Sat, 8 Mar 2025 01:23:03 +0800
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:devel-5.10 1/1] arch/x86/mm/extable.c:102:16:
 warning: no previous prototype for 'ex_handler_fix_msmi'
Message-ID: <202503080112.RBtUEgsz-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/anolis/intel-cloud-kernel.git devel-5.10
head:   797aae63f086cf8250bfbb8395ab310c525ac4a6
commit: 5e5f0925dbf67120058434eccc8555df292111fa [1/1] KVM: TDX: Skip #MSMI induced #MC handling and handle it as a user #MC
config: x86_64-anolis-intel-cloud-devel-5.10 (https://download.01.org/0day-ci/archive/20250308/202503080112.RBtUEgsz-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250308/202503080112.RBtUEgsz-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503080112.RBtUEgsz-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/x86/mm/extable.c:102:16: warning: no previous prototype for 'ex_handler_fix_msmi' [-Wmissing-prototypes]
     102 | __visible bool ex_handler_fix_msmi(const struct exception_table_entry *fixup,
         |                ^~~~~~~~~~~~~~~~~~~


vim +/ex_handler_fix_msmi +102 arch/x86/mm/extable.c

   101	
 > 102	__visible bool ex_handler_fix_msmi(const struct exception_table_entry *fixup,
   103					struct pt_regs *regs, int trapnr)
   104	{
   105		regs->ip = ex_fixup_addr(fixup);
   106		/*
   107		 * Even on SPR C0, the silicon still doesn't set bit 0 of exit
   108		 * qualification correctly for MSMI, therefore in no case will SEAM
   109		 * module set non_recoverable bit for EXIT_REASON_OTHER_SMI.
   110		 *
   111		 * So fix it here to set non_recoverable bit (62).
   112		 */
   113		regs->ax |= BIT_ULL(62);
   114		return true;
   115	}
   116	EXPORT_SYMBOL(ex_handler_fix_msmi);
   117	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
