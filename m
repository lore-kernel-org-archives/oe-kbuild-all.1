Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 017A121579F
	for <oe-kbuild-all@lists.linux.dev>; Thu, 29 May 2025 11:03:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748516594; cv=none; b=RrNWOgWD6pY7lgBu7jWwEjzNkqriF0wMdT6FJkvLqHWjF0goURQxz9woSU2tQr1XpFZ/hIzjDaIKcT8oXL0PJv7VfldcWDr7nIq7VcNXpslmllhLPbkMao7DfKWtz9wY90tvQodj/kgnmc+3GvLpmeYZaljVWJR+Yd5FCLGeulI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748516594; c=relaxed/simple;
	bh=pg5U0pCMgukkmYgLjEu4jazcDbVd553OUJssWuIK1Xs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=cfsRFR900WOpBSqq3xYXQjfVwafkfWEUbo8uz+sMveKStIUOZv206IK2VYNlXhUMWYGpO63336IFfZ3dG42TyVct6E+mTyM8RxZUjD1CPVeM1mlg8Sz0N90WB5Qzuc5P/J2Dgt88z/W6ekP1V0nIC7RCMMwu4xRebXdsqPLmRP4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=O5OypPkX; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="O5OypPkX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748516592; x=1780052592;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=pg5U0pCMgukkmYgLjEu4jazcDbVd553OUJssWuIK1Xs=;
  b=O5OypPkXlVrPrYgXTaRErH19llXBEonHfDrCwOgw1w6VExes88CjCgx1
   QWHrz71qiegCbwcy/9K7ewZ4dKD4pWOZPpDxKXlyV5/OszSUwJaNIyXxk
   SIiWjulQoHcCTFyW9JEf8/1Dxw9tnpDM2IMw9tFBEuqoFGCDbXWkKgFJe
   cfv0afu3hn4OA3KLs1m15dhBWiX/8SPNE4LBgkloaMWzA9x6EadW68Klo
   chhv/CULGlt2gb8yEfpdc+QLGuLpOR6kZAqk+cVuemIdXUAAp6RXaX+uO
   AgM8IWodOgsj7W5mYUwdKFo6kjh/vEs2sXd1dHuGJJuzzXsQ5bhJqmIHH
   w==;
X-CSE-ConnectionGUID: XSX38VbbQz6xt1dOLZuzXQ==
X-CSE-MsgGUID: JPp914WFQG2uJw8VKSqloQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11447"; a="54369589"
X-IronPort-AV: E=Sophos;i="6.15,192,1739865600"; 
   d="scan'208";a="54369589"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 May 2025 04:03:11 -0700
X-CSE-ConnectionGUID: GkxNT4qXT+6z7kQMoy3t8A==
X-CSE-MsgGUID: uqfnwTT6TyqRnCtemOwBzA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,192,1739865600"; 
   d="scan'208";a="148303609"
Received: from igk-lkp-server01.igk.intel.com (HELO b69e6467d450) ([10.211.3.150])
  by orviesa003.jf.intel.com with ESMTP; 29 May 2025 04:03:10 -0700
Received: from kbuild by b69e6467d450 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uKb2R-0000Fm-27;
	Thu, 29 May 2025 11:03:07 +0000
Date: Mon, 26 May 2025 22:32:08 +0800
From: kernel test robot <lkp@intel.com>
To: jason.zeng@intel.com, lin.x.wang@intel.com, pei.p.jia@intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [bytedance:5.15-velinux 0/1] include/linux/hugetlb.h:261:1: warning:
 no return statement in function returning non-void
Message-ID: <202505262230.SfyFTC92-lkp@intel.com>
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
commit: ae1584fe66d0d69c4ae034d6afa8abc3c8948614 [0/1] hugetlb: simplify hugetlb handling in follow_page_mask
config: x86_64-buildonly-randconfig-2001-20250514 (https://download.01.org/0day-ci/archive/20250526/202505262230.SfyFTC92-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250526/202505262230.SfyFTC92-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505262230.SfyFTC92-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from arch/x86/kernel/setup.c:21:
   include/linux/hugetlb.h: In function 'hugetlb_follow_page_mask':
>> include/linux/hugetlb.h:261:1: warning: no return statement in function returning non-void [-Wreturn-type]
     261 | }
         | ^


vim +261 include/linux/hugetlb.h

   256	
   257	static inline struct page *hugetlb_follow_page_mask(struct vm_area_struct *vma,
   258					unsigned long address, unsigned int flags)
   259	{
   260		BUILD_BUG(); /* should never be compiled in if !CONFIG_HUGETLB_PAGE*/
 > 261	}
   262	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
