Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71E6419F115
	for <oe-kbuild-all@lists.linux.dev>; Tue, 12 Nov 2024 20:15:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731442507; cv=none; b=UnEOHI3FCAsR45W+fRJW1XB/Hk1Nzh4WMzbBQTXjidJexMNy3eF0dkopSTbGEjyZqS/csiy7AjYO43ZhzHsLbc0a4QLLdiw7iIYBlyOsod1ew1SU5fBGlWfE9AYKzJYMgwB32ZR9vMXyr6BeVBlY9Yy+7A7Kc/UIZosOC+5kLtM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731442507; c=relaxed/simple;
	bh=zo0JJELb2LkOedyaDe63RFxUPBoLNcwlP9Yqu7zVdGo=;
	h=Date:From:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=DZmab2ND90QIdymJjrJUWqQMiSLVa+XAPEGEJVf2ZWQ/pOnbp1bewxDEUkhp4PAwuO0McvcbDnAMV0Njc+5tn0iRN7b0X5TXN6U2eLf+JpU4Qs0jPb5uzPWBBhMQlTZONE6w/v331ddMb8IE9PexRkfhGLy54JECJjE6VHt+Lsg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JvfX7oH4; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JvfX7oH4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731442505; x=1762978505;
  h=date:from:cc:subject:message-id:mime-version;
  bh=zo0JJELb2LkOedyaDe63RFxUPBoLNcwlP9Yqu7zVdGo=;
  b=JvfX7oH4oTNcVoCnd5O4q1EzGx5m2ARJo/8wWVhmLKeUfNiRUSG+ORNY
   zaos4bIEh26wACHmM2RKpuMeMF1phTUtS/1GoUiGzAN6W1hyCMCaMJRhs
   NdqkpmgIaWYAgtSP99FAmxkcU8zfNjbl9l523CqoTfTJsmFrx/J+i9aKI
   AiKc8yv52WTYbGuXjZThTSR6oHEinCOPczkwVOl5HvZPYGdSdsWndOmWs
   LtfewmK/XJ1gC6pd6+zDssygWqEnW2Ob2MC5/gwhiZdi6MOW9vIl2+Aks
   RqeIGOH3VMh1ZEN3qKATwjtvyEKLUpf2Mv8+vi9PSZvFnzwQw6v7cVdak
   w==;
X-CSE-ConnectionGUID: N8nfNxiuQJCpN16xFhEPtA==
X-CSE-MsgGUID: c9n4BuOqR0Gk3sVHrYoTAQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11254"; a="30704946"
X-IronPort-AV: E=Sophos;i="6.12,149,1728975600"; 
   d="scan'208";a="30704946"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Nov 2024 12:15:05 -0800
X-CSE-ConnectionGUID: Rd2Z+AGgTemCNAecpkjQ/A==
X-CSE-MsgGUID: MP5yMYMFRb2fvq7l45L2oQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,149,1728975600"; 
   d="scan'208";a="110946525"
Received: from lkp-server01.sh.intel.com (HELO bcfed0da017c) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 12 Nov 2024 12:15:04 -0800
Received: from kbuild by bcfed0da017c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tAxHy-0001hl-1L
	for oe-kbuild-all@lists.linux.dev;
	Tue, 12 Nov 2024 20:15:02 +0000
Date: Wed, 13 Nov 2024 04:14:26 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [intel-lts:6.6/dovetail-xenomai 3781/13313] kernel/irq_work.c:79:13:
 warning: no previous prototype for function 'irq_local_work_raise'
Message-ID: <202411130426.JYLH8ZSu-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/intel/linux-intel-lts.git 6.6/dovetail-xenomai
head:   8025dd14d72f1eee946ab67036c7a3a569861654
commit: f229f1f2bd2e196c234ad6abe6edaba2ed10ecfd [3781/13313] genirq: irq_pipeline: add IRQ pipeline core
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20241113/202411130426.JYLH8ZSu-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241113/202411130426.JYLH8ZSu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411130426.JYLH8ZSu-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> kernel/irq_work.c:79:13: warning: no previous prototype for function 'irq_local_work_raise' [-Wmissing-prototypes]
      79 | void __weak irq_local_work_raise(void)
         |             ^
   kernel/irq_work.c:79:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      79 | void __weak irq_local_work_raise(void)
         | ^
         | static 
   1 warning generated.


vim +/irq_local_work_raise +79 kernel/irq_work.c

    78	
  > 79	void __weak irq_local_work_raise(void)
    80	{
    81		arch_irq_work_raise();
    82	}
    83	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
