Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38CFE21D3CD
	for <oe-kbuild-all@lists.linux.dev>; Wed, 10 Dec 2025 13:32:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765373540; cv=none; b=Y2+Lnr1Za1eNCFK67uUI6ITsVqxm4TAIwdDcO7YL37Bv50DZ5vSyxRuH4EBcKKietFTBCKrk6ZDH5AtwJIxSiL7+U2hQ+JBd67I/NvtWT2Dn5c7FULGLIyZJCnRZb/nsoFtWBJ5hQKtxbrqD3goUwB7HrDbu3F2znU65Qp+jwpY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765373540; c=relaxed/simple;
	bh=bR7qyDvgZE2jCf3H0ujBib170k/52NPa3WyOfHXF4yQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=AiD3P2S4cXZYWqvq9ex0+Lx3Doltv9n3DUu1zBLWlHBt3jcRZKJKr3mk6mHRlNovGxV1MDfKuDxSA4yys3+kcrlYhcmhRwlszFWSpjueDxi6VWlPVhsSWMWOvcgIBEYn50xF4Asw7dlktU2a4vmOyTnyw2u3E5BhmXdXDWfSv0Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=X6wZIKv4; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="X6wZIKv4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765373538; x=1796909538;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=bR7qyDvgZE2jCf3H0ujBib170k/52NPa3WyOfHXF4yQ=;
  b=X6wZIKv4W4bqNaC8l5pXh2g1U5VZhIEbau0HlAptBxzt0P6UH8DJn0wG
   R/ZgDlMYVWpiutNpLJNgXiPl45oeDRDhFrwClegaNiHJpXrW30Hg02Nop
   L9p8SvUnImlrRRPiPHTTSu9RJnTG6vkyoeYY9PnLC8Ni18S/+495ljy/5
   aJcvjgOCh9MKEdzcgIaom0Du689ThWu9PCqf2dW7e8cBsgKNTVVgVwPlv
   4rLozhrYidKSAOqBNVFt62ZFiCWH/5Yfqr5ezySHhnZLbXXVQClqTf2Ni
   yWXnFIG72j4VbEkRUH90qniuzlz+ASrARd3kprNV0ByKUZ9urhtw+DkSe
   g==;
X-CSE-ConnectionGUID: E2hiwtDVQmmGArvLvDDsyg==
X-CSE-MsgGUID: HWeNgNvbSnOUpbwOfTeqVw==
X-IronPort-AV: E=McAfee;i="6800,10657,11638"; a="67231972"
X-IronPort-AV: E=Sophos;i="6.20,264,1758610800"; 
   d="scan'208";a="67231972"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Dec 2025 05:32:18 -0800
X-CSE-ConnectionGUID: azkf0bRpRza3qEIELl9IIw==
X-CSE-MsgGUID: 3cgJN08KQKGQseYGsfto/A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,264,1758610800"; 
   d="scan'208";a="196517353"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 10 Dec 2025 05:32:17 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vTKIg-000000003EH-0jeL;
	Wed, 10 Dec 2025 13:32:14 +0000
Date: Wed, 10 Dec 2025 21:31:14 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12-desktop 1/1]
 fs/proc/task_mmu.c:2899:8: warning: no previous prototype for
 '__pagemap_lseek'
Message-ID: <202512102133.xwgXxmbc-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android16-6.12-desktop
head:   26ebc372eabce9c490a5186c997d9394a09dd9e5
commit: 669f0c4355a55a5e909d44d8d688cd46b874bcd5 [1/1] ANDROID: 16K: Emulate /proc/pid/pagemap
config: x86_64-randconfig-013-20251210 (https://download.01.org/0day-ci/archive/20251210/202512102133.xwgXxmbc-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.4.0-5) 12.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251210/202512102133.xwgXxmbc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512102133.xwgXxmbc-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/proc/task_mmu.c:2899:8: warning: no previous prototype for '__pagemap_lseek' [-Wmissing-prototypes]
    2899 | loff_t __pagemap_lseek(struct file *file, loff_t offset, int orig)
         |        ^~~~~~~~~~~~~~~


vim +/__pagemap_lseek +2899 fs/proc/task_mmu.c

  2898	
> 2899	loff_t __pagemap_lseek(struct file *file, loff_t offset, int orig)
  2900	{
  2901		unsigned long nr_subpages = __PAGE_SIZE / PAGE_SIZE;
  2902		loff_t ret;
  2903	
  2904		/*
  2905		 * Userspace thinks the pages are larger than they actually are, so adjust the
  2906		 * offset to compensate.
  2907		 */
  2908		offset *= nr_subpages;
  2909	
  2910		ret = mem_lseek(file, offset, orig);  /* borrow this */
  2911		if (ret < 0)
  2912			return offset;
  2913	
  2914		/* Re-adjust the offset to reflect the larger userspace page size. */
  2915		return ret / nr_subpages;
  2916	}
  2917	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
