Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E792E5DF28
	for <oe-kbuild-all@lists.linux.dev>; Wed,  6 Mar 2024 09:15:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709716526; cv=none; b=PIEOf2H9GvRZMY0mjQubJfFgFxWjKaqVVZxlnDwGFkd4J2BLctcYVs7lqUa/xZtHQKrDPk1HQIHPlUtzYe4q1gIKQ8dHBglWCC4gYMpbAUqjurxkicCjkYUbLkWdVnpuIabnGenIZ2n2VRTRw6DaCDEDp7FwChm6BvAISOTK9Vo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709716526; c=relaxed/simple;
	bh=NhAJUYtlniNTFLuLDeKZgCK4oMrEZM+wnGHY+bYXWPc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=TxgvCrs6TZ1PNtNC+QZ3mH9BUnmW2rayc+ux/gLZI03NOy0TRQQfhdEVX8pVab2TCFAmjsiU/l2HL8PaM1zQ6wQB5caca0c9FQ280Im+0kMbLw4mXhIwKMslUlNCfiS5x7ZjgZyyGHrWXqsILZ0ZB4ITgCv3i3X7Xk2SEiSDk9g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GSv4HI4T; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GSv4HI4T"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709716524; x=1741252524;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=NhAJUYtlniNTFLuLDeKZgCK4oMrEZM+wnGHY+bYXWPc=;
  b=GSv4HI4Tn+DbwpBCAJcvM5vCJncf8Ea0zyjy12z44sgydKNqZdcoiRKh
   E1cANcaKUD4r4XRrbiXoAgniJ2j53j83aAr9VfmfB1nb72k+VzHwpfb2H
   A4M3yraUdrj02INo5kM7q+prB+9T/3tk50j+uwJzq+9Pz4ogAWdBQLZJY
   GXXZbp3QzTqRhgBhAgpSyb1LkdxyXLfX9bKTTBc9tbaBC8gwSzQaXYct/
   KhAQz1j3CS6AwJec/0OWh2QQdtG14y8apwCY+8m5ev6kjl0RNJG7/oHjk
   pfXLhPBnjlMwDIxOKIrchLBTXao+BeGtqpoLvjanYdhndn7dezNBqh/4x
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11004"; a="8080354"
X-IronPort-AV: E=Sophos;i="6.06,207,1705392000"; 
   d="scan'208";a="8080354"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Mar 2024 01:15:20 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,207,1705392000"; 
   d="scan'208";a="47219712"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 06 Mar 2024 01:15:17 -0800
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rhnMo-00045J-2K;
	Wed, 06 Mar 2024 09:15:14 +0000
Date: Wed, 6 Mar 2024 17:14:52 +0800
From: kernel test robot <lkp@intel.com>
To: jasperwang@tencent.com, kaixuxia@tencent.com, frankjpliu@tencent.com,
	kasong@tencent.com, sagazchen@tencent.com, kernelxing@tencent.com,
	aurelianliu@tencent.com, jason.zeng@intel.com, wu.zheng@intel.com,
	yingbao.jia@intel.com, pei.p.jia@intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [opencloudos:linux-5.4/next 25350/27434] mm/khugepaged.c:108:
 warning: Function parameter or member 'nr_exec_vma' not described in
 'mm_slot'
Message-ID: <202403061750.iWiySwka-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/OpenCloudOS/OpenCloudOS-Kernel.git linux-5.4/next
head:   0e88d1c26496999d1b2e37f3393b602d28b03faf
commit: da270ddbbd72c2edb229090a3a9b71f1d9d848b4 [25350/27434] anolis: mm, thp: hugetext: accelerate khugepaged for hugetext vma
config: arm64-defconfig (https://download.01.org/0day-ci/archive/20240306/202403061750.iWiySwka-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240306/202403061750.iWiySwka-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403061750.iWiySwka-lkp@intel.com/

All warnings (new ones prefixed by >>):

   mm/khugepaged.c:108: warning: Function parameter or member 'nr_pte_mapped_thp' not described in 'mm_slot'
   mm/khugepaged.c:108: warning: Function parameter or member 'pte_mapped_thp' not described in 'mm_slot'
>> mm/khugepaged.c:108: warning: Function parameter or member 'nr_exec_vma' not described in 'mm_slot'
>> mm/khugepaged.c:108: warning: Function parameter or member 'exec_vma' not described in 'mm_slot'
   mm/khugepaged.c:1475: warning: Function parameter or member 'mm' not described in 'collapse_pte_mapped_thp'
   mm/khugepaged.c:1475: warning: Function parameter or member 'addr' not described in 'collapse_pte_mapped_thp'
   mm/khugepaged.c:1711: warning: Function parameter or member 'mm' not described in 'collapse_file'
   mm/khugepaged.c:1711: warning: Function parameter or member 'file' not described in 'collapse_file'
   mm/khugepaged.c:1711: warning: Function parameter or member 'start' not described in 'collapse_file'
   mm/khugepaged.c:1711: warning: Function parameter or member 'hpage' not described in 'collapse_file'
   mm/khugepaged.c:1711: warning: Function parameter or member 'node' not described in 'collapse_file'


vim +108 mm/khugepaged.c

27e1f8273113ad Song Liu           2019-09-23   86  
b46e756f5e4703 Kirill A. Shutemov 2016-07-26   87  /**
b46e756f5e4703 Kirill A. Shutemov 2016-07-26   88   * struct mm_slot - hash lookup from mm to mm_slot
b46e756f5e4703 Kirill A. Shutemov 2016-07-26   89   * @hash: hash collision list
b46e756f5e4703 Kirill A. Shutemov 2016-07-26   90   * @mm_node: khugepaged scan list headed in khugepaged_scan.mm_head
b46e756f5e4703 Kirill A. Shutemov 2016-07-26   91   * @mm: the mm that this information is valid for
b46e756f5e4703 Kirill A. Shutemov 2016-07-26   92   */
b46e756f5e4703 Kirill A. Shutemov 2016-07-26   93  struct mm_slot {
b46e756f5e4703 Kirill A. Shutemov 2016-07-26   94  	struct hlist_node hash;
b46e756f5e4703 Kirill A. Shutemov 2016-07-26   95  	struct list_head mm_node;
b46e756f5e4703 Kirill A. Shutemov 2016-07-26   96  	struct mm_struct *mm;
27e1f8273113ad Song Liu           2019-09-23   97  
27e1f8273113ad Song Liu           2019-09-23   98  	/* pte-mapped THP in this mm */
27e1f8273113ad Song Liu           2019-09-23   99  	int nr_pte_mapped_thp;
27e1f8273113ad Song Liu           2019-09-23  100  	unsigned long pte_mapped_thp[MAX_PTE_MAPPED_THP];
da270ddbbd72c2 Xu Yu              2021-08-19  101  
da270ddbbd72c2 Xu Yu              2021-08-19  102  #ifdef CONFIG_HUGETEXT
da270ddbbd72c2 Xu Yu              2021-08-19  103  #define MAX_EXEC_VMA       8
da270ddbbd72c2 Xu Yu              2021-08-19  104  	/* exec vma vm_start in this mm */
da270ddbbd72c2 Xu Yu              2021-08-19  105  	int nr_exec_vma;
da270ddbbd72c2 Xu Yu              2021-08-19  106  	unsigned long exec_vma[MAX_EXEC_VMA];
da270ddbbd72c2 Xu Yu              2021-08-19  107  #endif
b46e756f5e4703 Kirill A. Shutemov 2016-07-26 @108  };
b46e756f5e4703 Kirill A. Shutemov 2016-07-26  109  

:::::: The code at line 108 was first introduced by commit
:::::: b46e756f5e47031c67658ff036e5ffe27062fa43 thp: extract khugepaged from mm/huge_memory.c

:::::: TO: Kirill A. Shutemov <kirill.shutemov@linux.intel.com>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
