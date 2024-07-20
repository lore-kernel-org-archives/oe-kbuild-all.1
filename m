Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA4BD946C
	for <oe-kbuild-all@lists.linux.dev>; Sat, 20 Jul 2024 15:48:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721490513; cv=none; b=DpT1mBV2jW581OR9JKsfTuyhGaLr3xFkfU2qmvLGbp49uGQy/AkRJIY3+w6L9Yi8wuNdupm5qAlbiD3XolUEv0IV1JzuOgVGpVcaz9jVM+dy1NMM6t7gou98MTDnyvCdrv5TfOrgndtfHOkzLRPgH07LL3Ztr176luFFBTxAQNo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721490513; c=relaxed/simple;
	bh=BFvdBUVPQeKFK6yppajU2wovHHdWvBrpoUFi9JINWfg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Wk10pWVQRlZ5YUNybI6rIaAvObb4Pww2Khfn0kEH7s36+VMPwqMfzoYWM5NykQ+c+noOYdPB63Dpmkfh1L2dBRJaXgodbCslYL4ZJdiqJl3ZwDizkIvx0wneE6tZPXpBgQctHosT974Bw112XjgNr3F1diJrb0BgzrUeEdwd5bI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CKDcJsn7; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CKDcJsn7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1721490511; x=1753026511;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=BFvdBUVPQeKFK6yppajU2wovHHdWvBrpoUFi9JINWfg=;
  b=CKDcJsn7O5xNs0wyFCashSXkTDtRuhPLQQJCZlr+ayTnK4lpK8KSWAoV
   brqCu2zu8W6TWboA7uXLDlj1rKMSmJE2EVt+mMfGoh2+YHQ17Y9uJvR+C
   GWub/X5vhYvIkv2+9ebzIIWprot423illadn5ktbszTx+MZox+RYOkh6j
   LXI/y3Hu32DPvMjR/JJUgTwG9sE49ifGr6NgcX5HzUa4fkOgag/RRHxYJ
   wYqGzJ4X6MbPd3CWL95inGCzVH20RjcjjBOHchWH4CEuJdkGGNl+fxob1
   RzZjsye9lROtnyjUOv/e9Oxcmw4oEHSBUygIxLatUzaNjfNCGlmGTN3sr
   Q==;
X-CSE-ConnectionGUID: nMSYBWkuRsO6Xi+dbbG5jQ==
X-CSE-MsgGUID: pksWQgAHS9+TueaBcO17mA==
X-IronPort-AV: E=McAfee;i="6700,10204,11139"; a="18721997"
X-IronPort-AV: E=Sophos;i="6.09,224,1716274800"; 
   d="scan'208";a="18721997"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jul 2024 08:48:28 -0700
X-CSE-ConnectionGUID: TAegkoh8TgGdGzFWwAJrOA==
X-CSE-MsgGUID: 3Qb2lXCiSy+dPQQILQKwdw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,224,1716274800"; 
   d="scan'208";a="55582326"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 20 Jul 2024 08:48:27 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sVCJt-000jLv-1T;
	Sat, 20 Jul 2024 15:48:25 +0000
Date: Sat, 20 Jul 2024 23:47:55 +0800
From: kernel test robot <lkp@intel.com>
To: "Alex Shi (Tencent)" <alexs@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [alexshi:mmunstable2 41/42] mm/memory.c:192:25: warning:
 initialization makes pointer from integer without a cast
Message-ID: <202407202350.UKSxYJZj-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/alexshi/linux.git mmunstable2
head:   17ce8ec8001d3efaa81c659d6ec565025c3f42b0
commit: 934c05f8c50fed91942a8aa9db46a0feae38594c [41/42] use ptdesc in free_pte_range and pte_free_tlb series functions
config: i386-randconfig-001-20240720 (https://download.01.org/0day-ci/archive/20240720/202407202350.UKSxYJZj-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240720/202407202350.UKSxYJZj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407202350.UKSxYJZj-lkp@intel.com/

All warnings (new ones prefixed by >>):

   mm/memory.c: In function 'free_pte_range':
   mm/memory.c:192:25: error: implicit declaration of function 'pmd_ptdesc'; did you mean 'pfn_ptdesc'? [-Werror=implicit-function-declaration]
     struct ptdesc *token = pmd_ptdesc(pmd);
                            ^~~~~~~~~~
                            pfn_ptdesc
>> mm/memory.c:192:25: warning: initialization makes pointer from integer without a cast [-Wint-conversion]
   cc1: some warnings being treated as errors


vim +192 mm/memory.c

   184	
   185	/*
   186	 * Note: this doesn't free the actual pages themselves. That
   187	 * has been handled earlier when unmapping all the memory regions.
   188	 */
   189	static void free_pte_range(struct mmu_gather *tlb, pmd_t *pmd,
   190				   unsigned long addr)
   191	{
 > 192		struct ptdesc *token = pmd_ptdesc(pmd);
   193		pmd_clear(pmd);
   194		pte_free_tlb(tlb, token, addr);
   195		mm_dec_nr_ptes(tlb->mm);
   196	}
   197	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
