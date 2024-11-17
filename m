Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63F7526AD4
	for <oe-kbuild-all@lists.linux.dev>; Sun, 17 Nov 2024 12:23:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731846213; cv=none; b=gyaiVjKEpsgIMLEzNsxp2kI+UnWDn7yCrlMAga98NmfetrdorFTZJnqJoh9rCFDRI50EF16DpDHhEZqjDx7eWy5hXk2DpH+kduWbj6R0jY2ybMsJie+wlqZeG3SU1tchSbvo/aWZvAp/2YQtihG5SZgvjO9dOZ3tZ7zYNbypoAc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731846213; c=relaxed/simple;
	bh=hi4kd1Mg9LEqiOlqVsNuqxt+FvZmQN6Gm/zTxVik0rM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=VPnXwIPPojp3mY1Q0ZJJSawSWd2WUsHgNN7gQWvegH94B5gMLMAd4lGLKq216IllBVKFP4bY6QXbPPsvSOf2nZxW77CML3MfURi+w73VRUo62vlwp1LcKgUDCkbmH5Q0DlySwEPG1JPR9S8lsM1s1l4aaYsVZnKFcH9A/dEFYUs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NbhDMU8d; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NbhDMU8d"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731846211; x=1763382211;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=hi4kd1Mg9LEqiOlqVsNuqxt+FvZmQN6Gm/zTxVik0rM=;
  b=NbhDMU8dMAwI59o8Ns+11RIcj0CvjkH/s9Me3XfVy7+bHjyfNBeEOSqG
   vrl6alh1hnCqP8H+W0KcJ/Whsw3JRcHZO7sujF4Oepk/+kUy8zWW3YhIs
   Harv/3SZgritsYbbj6rNwXjf+WHDV8uEHgvuPk7pn8EnJ9APiD9w61yPX
   ItKZ2rszdO7XCxGk1owopvhJzM8Kw1kUfDtH7lynv78UW1NZmFZDU21JU
   rZLg7Ximzo3Wh+dBNRcp9IIiq8lG84BWyTINT6bJzvzQySXDgwgw96QzC
   F9SdNEoYDDtzqf5GF+iiyjl5WzMFTDOjBBfmvOI/Zgj2rxMPiWMlp4FhV
   w==;
X-CSE-ConnectionGUID: b1jUzA6BThSiEM/rULASPg==
X-CSE-MsgGUID: jqPKNgWyR4+n2Z+cfOxl2Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11259"; a="35480818"
X-IronPort-AV: E=Sophos;i="6.12,161,1728975600"; 
   d="scan'208";a="35480818"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Nov 2024 04:23:31 -0800
X-CSE-ConnectionGUID: retvnytVSUiG4nLMQMSo5g==
X-CSE-MsgGUID: g01/693CTW6fLSO7ax5ErQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,161,1728975600"; 
   d="scan'208";a="93437988"
Received: from lkp-server01.sh.intel.com (HELO 1e3cc1889ffb) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 17 Nov 2024 04:23:30 -0800
Received: from kbuild by 1e3cc1889ffb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tCeJL-0001jN-1j;
	Sun, 17 Nov 2024 12:23:27 +0000
Date: Sun, 17 Nov 2024 20:22:33 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Wang Wensheng <wangwensheng4@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 1474/1474] mm/share_pool.c:1226:14: error: call
 to undeclared function 'huge_ptep_get'; ISO C99 and later do not support
 implicit function declarations
Message-ID: <202411172041.LAsMkbYc-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Wang,

FYI, the error/warning still remains.

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   7c547c6bbe6b6a9cedf63d7cdadb2529404df633
commit: 549b1f40b56511536196f7522ffa4d7b3da42337 [1474/1474] mm/sharepool: Implement mg_sp_make_share_u2k()
config: arm64-randconfig-003-20241117 (https://download.01.org/0day-ci/archive/20241117/202411172041.LAsMkbYc-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241117/202411172041.LAsMkbYc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411172041.LAsMkbYc-lkp@intel.com/

All errors (new ones prefixed by >>):

>> mm/share_pool.c:1226:14: error: call to undeclared function 'huge_ptep_get'; ISO C99 and later do not support implicit function declarations [-Werror,-Wimplicit-function-declaration]
           pte_t pte = huge_ptep_get(ptep);
                       ^
   mm/share_pool.c:1226:8: error: initializing 'pte_t' with an expression of incompatible type 'int'
           pte_t pte = huge_ptep_get(ptep);
                 ^     ~~~~~~~~~~~~~~~~~~~
   2 errors generated.


vim +/huge_ptep_get +1226 mm/share_pool.c

  1221	
  1222	static int sp_hugetlb_entry(pte_t *ptep, unsigned long hmask,
  1223				    unsigned long addr, unsigned long next,
  1224				    struct mm_walk *walk)
  1225	{
> 1226		pte_t pte = huge_ptep_get(ptep);
  1227		struct page *page = pte_page(pte);
  1228		struct sp_walk_data *sp_walk_data;
  1229	
  1230		if (unlikely(!pte_present(pte))) {
  1231			pr_debug("the page of addr %lx unexpectedly not in RAM\n", (unsigned long)addr);
  1232			return -EFAULT;
  1233		}
  1234	
  1235		sp_walk_data = walk->private;
  1236		get_page(page);
  1237		sp_walk_data->pages[sp_walk_data->page_count++] = page;
  1238		return 0;
  1239	}
  1240	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
