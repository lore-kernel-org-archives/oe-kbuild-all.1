Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 407CF14E2F2
	for <oe-kbuild-all@lists.linux.dev>; Thu, 29 May 2025 11:03:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748516596; cv=none; b=QKDvJSTQDVmHntNOPhx+hNrqtFv8VcAd0TEYx/o0WeYdHou6fZAp/mDYnMHSnGONOY+QnW54esuqgEoD8xm1+9Zv6FlYSGRsXEyX64xqKvyF+jx2MkumeGyMqinRXX1jkIhAVIkQiJDLz0Gifg+dsTa4+kaFJVRAmXFKcXUBM9I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748516596; c=relaxed/simple;
	bh=UhLHII+3v3jFAvSvK34+txDCqWgri82oUmXnIyqAL/M=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=PidSwE2YZiDjH/TZRrZocPyfnHN35XdCk7B+Wkiac7Kr9nrRhhFdaUz8XAjQNTUsKn8bBeg7Y7FAAbHWm5c22utED9VvQFlLfIBhDk03KtjV6PsTse22xeKNX8GKLMNNRRuKZpVNqLQxLjeDMaGOXNP09vxPLLbjmLh9UiX9ABk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dFw47TRB; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dFw47TRB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748516595; x=1780052595;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=UhLHII+3v3jFAvSvK34+txDCqWgri82oUmXnIyqAL/M=;
  b=dFw47TRBebvOtRjm2kIRoxopSRA7vQll8/vJSZkyxl1+MegDWKRs4PDs
   Bj5yoZ2rRNiPn0YapAO3TPpMexqQ2uc10iLJDVYnqbQ/gwnRMBsvOdkrC
   QwEVlVkZXQrbnJntpY42idgEzcHsHQ5SXSCk+E4UrYnZmbYNBZSpszZaZ
   eF4EzuwTXRk+18P6EzTyHnHhl1dWQ6dwLF9BL5/Nwg+HocDrgkDTAgbtL
   yvPpLEV/S/7rA1eh1iXmXNAAKlyciWILsOD0L/ymXDaiKhn8bU4MLtgxa
   mce3zfojC6xm8n3XMglPPJrwASpgrRDWeXZb6dReBJDn1hHu10AcNo6RV
   A==;
X-CSE-ConnectionGUID: g8vDoyDGSqidTXfKpfHj3g==
X-CSE-MsgGUID: SoCF5AsJTGKguQu+rFT9ew==
X-IronPort-AV: E=McAfee;i="6700,10204,11447"; a="54369593"
X-IronPort-AV: E=Sophos;i="6.15,192,1739865600"; 
   d="scan'208";a="54369593"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 May 2025 04:03:12 -0700
X-CSE-ConnectionGUID: ixV5cDEoSVyYWJizhCWlTg==
X-CSE-MsgGUID: B0+BcLheTHuhI5WlnmBrkg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,192,1739865600"; 
   d="scan'208";a="148303617"
Received: from igk-lkp-server01.igk.intel.com (HELO b69e6467d450) ([10.211.3.150])
  by orviesa003.jf.intel.com with ESMTP; 29 May 2025 04:03:10 -0700
Received: from kbuild by b69e6467d450 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uKb2R-0000G9-2g;
	Thu, 29 May 2025 11:03:07 +0000
Date: Mon, 26 May 2025 21:38:06 +0800
From: kernel test robot <lkp@intel.com>
To: jason.zeng@intel.com, lin.x.wang@intel.com, pei.p.jia@intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [bytedance:5.15-velinux 0/1] mm/vmscan.c:186:38: error: macro
 "get_total_swap_pages" passed 1 arguments, but takes just 0
Message-ID: <202505262151.Fs60ODaj-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/bytedance/kernel.git 5.15-velinux
head:   de277dab626c9ece4c9cf99ec9c56f23b298a042
commit: 5291f45f705b03858f36c68bbdfdbdf7857e651b [0/1] bytedance: mm: add /proc knob for proactive swappiness
config: x86_64-buildonly-randconfig-2002-20250514 (https://download.01.org/0day-ci/archive/20250526/202505262151.Fs60ODaj-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250526/202505262151.Fs60ODaj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505262151.Fs60ODaj-lkp@intel.com/

All errors (new ones prefixed by >>):

>> mm/vmscan.c:186:38: error: macro "get_total_swap_pages" passed 1 arguments, but takes just 0
     186 | inline long get_total_swap_pages(void)
         |                                      ^
   In file included from mm/vmscan.c:20:
   include/linux/swap.h:565: note: macro "get_total_swap_pages" defined here
     565 | #define get_total_swap_pages()                  0L
         | 
   mm/vmscan.c:187:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
     187 | {
         | ^
   mm/vmscan.c: In function 'demote_page_list':
   mm/vmscan.c:761:13: warning: variable 'err' set but not used [-Wunused-but-set-variable]
     761 |         int err;
         |             ^~~


vim +/get_total_swap_pages +186 mm/vmscan.c

   185	
 > 186	inline long get_total_swap_pages(void)
   187	{
   188		return proactive_swappiness_enabled ? 0 : total_swap_pages;
   189	}
   190	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
