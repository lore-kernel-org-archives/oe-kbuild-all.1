Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BB2F1F7914
	for <oe-kbuild-all@lists.linux.dev>; Wed, 26 Mar 2025 21:43:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743025412; cv=none; b=kUP/wnNMc6kN3nfVznWcpILp7Jmak9Lfc9KvEwDa9JtwXI5mK9i/gypRSqhcDthCdbZMx47Dbq/soAYfaC8Qrfzf7fKzZJbdBl7UB8G00APIT4ogOlwukxTCDi3roGsv61Zc99aCYyT2rSHpCvJq2KX4FNSK7ARTcxK0/u88kfU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743025412; c=relaxed/simple;
	bh=p/gHC2gyfjWQQDS+oWlt0tuAw1RPZrs075UYoQYKmgQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=sKs5Vw9EYCkiWq0xg0+hJp3LcrEpfOxexhrLCqsop5aHbhKgnnRjlgFt53WDXpiuhw50RvkfdXBxu4aIcq0bHkkIwhOcQCiY/3gDuygnpL536uf3fGS5odKSaiCu5LCxUhgVu3gvGuXq14E4Fw7oUE0fz2yuneFp9k6Ine9K/YA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=D6nFYagd; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="D6nFYagd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743025410; x=1774561410;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=p/gHC2gyfjWQQDS+oWlt0tuAw1RPZrs075UYoQYKmgQ=;
  b=D6nFYagdVJV5CuCfnt6hNLnB/QjGk4rAELi6mfqgn5XT/58leSnGWQtW
   KPeut/EM6edrEepDgg0JMtlp4KL6AhF1iziqPLw0IPrxAyPpOpuuVc7Kv
   qTQFVT/88bKfUPIWsQOeQrX65V+Oy8KpqwLTjQHt9yJH5G5HHrAUfs9T7
   gJ8p825sUJLIvXhhFYfcuCsa5XWFiC9pS8RuvL6pdGH+2P1hKjxU1lPrV
   SmgkJ4a1oKb4a94GkzFzuE/F8oewNREpacqW6eoqVjGzO07rW7bg3uYuz
   YdUFYX/BvlOcMvbbwMbKTMRFvVZXUGJIHJFE2Jc3N1b4ONnHlbvFLVVmm
   g==;
X-CSE-ConnectionGUID: log8JrLgTwCGyKtIm2VU4w==
X-CSE-MsgGUID: HDCoX6clQsWllnVIIgzDZw==
X-IronPort-AV: E=McAfee;i="6700,10204,11385"; a="44460412"
X-IronPort-AV: E=Sophos;i="6.14,278,1736841600"; 
   d="scan'208";a="44460412"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Mar 2025 14:43:28 -0700
X-CSE-ConnectionGUID: G2HP3MuXS5KjnWjF5R1PNA==
X-CSE-MsgGUID: cCiZsApaTFyjgQH0Vhqdfg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,278,1736841600"; 
   d="scan'208";a="124908359"
Received: from lkp-server02.sh.intel.com (HELO e98e3655d6d2) ([10.239.97.151])
  by fmviesa007.fm.intel.com with ESMTP; 26 Mar 2025 14:43:27 -0700
Received: from kbuild by e98e3655d6d2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1txYWz-00066E-0I;
	Wed, 26 Mar 2025 21:43:25 +0000
Date: Thu, 27 Mar 2025 05:42:51 +0800
From: kernel test robot <lkp@intel.com>
To: steven@liquorix.net
Cc: oe-kbuild-all@lists.linux.dev
Subject: [zen:6.14/zen-sauce 7/31] mm/hugetlb_cgroup.c:828:58: warning: '%s'
 directive output may be truncated writing up to 1623 bytes into a region of
 size between 32 and 63
Message-ID: <202503270538.FVI4A4gW-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/zen-kernel/zen-kernel 6.14/zen-sauce
head:   cb33a6dc022faa07ac1e1cd544567b28a7e9afeb
commit: f4f448a305e9d705b9a0da102ddfd58bfaac5cc0 [7/31] ZEN: Restore CONFIG_OPTIMIZE_FOR_PERFORMANCE_O3
config: x86_64-randconfig-002-20250327 (https://download.01.org/0day-ci/archive/20250327/202503270538.FVI4A4gW-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250327/202503270538.FVI4A4gW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503270538.FVI4A4gW-lkp@intel.com/

All warnings (new ones prefixed by >>):

   mm/hugetlb_cgroup.c: In function 'hugetlb_cgroup_file_init':
>> mm/hugetlb_cgroup.c:828:58: warning: '%s' directive output may be truncated writing up to 1623 bytes into a region of size between 32 and 63 [-Wformat-truncation=]
     828 |                 snprintf(cft->name, MAX_CFTYPE_NAME, "%s.%s", buf, tmpl->name);
         |                                                          ^~
   In function 'hugetlb_cgroup_cfttypes_init',
       inlined from '__hugetlb_cgroup_file_dfl_init' at mm/hugetlb_cgroup.c:847:2,
       inlined from '__hugetlb_cgroup_file_init' at mm/hugetlb_cgroup.c:861:2,
       inlined from 'hugetlb_cgroup_file_init' at mm/hugetlb_cgroup.c:891:3:
   mm/hugetlb_cgroup.c:828:17: note: 'snprintf' output between 2 and 1656 bytes into a destination of size 64
     828 |                 snprintf(cft->name, MAX_CFTYPE_NAME, "%s.%s", buf, tmpl->name);
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   mm/hugetlb_cgroup.c: In function 'hugetlb_cgroup_file_init':
   mm/hugetlb_cgroup.c:828:58: warning: '%s' directive output may be truncated writing up to 2087 bytes into a region of size between 32 and 63 [-Wformat-truncation=]
     828 |                 snprintf(cft->name, MAX_CFTYPE_NAME, "%s.%s", buf, tmpl->name);
         |                                                          ^~
   In function 'hugetlb_cgroup_cfttypes_init',
       inlined from '__hugetlb_cgroup_file_legacy_init' at mm/hugetlb_cgroup.c:855:2,
       inlined from '__hugetlb_cgroup_file_init' at mm/hugetlb_cgroup.c:862:2,
       inlined from 'hugetlb_cgroup_file_init' at mm/hugetlb_cgroup.c:891:3:
   mm/hugetlb_cgroup.c:828:17: note: 'snprintf' output between 2 and 2120 bytes into a destination of size 64
     828 |                 snprintf(cft->name, MAX_CFTYPE_NAME, "%s.%s", buf, tmpl->name);
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +828 mm/hugetlb_cgroup.c

47179fe03588caa Xiu Jianfeng 2024-06-12  814  
47179fe03588caa Xiu Jianfeng 2024-06-12  815  static void __init
47179fe03588caa Xiu Jianfeng 2024-06-12  816  hugetlb_cgroup_cfttypes_init(struct hstate *h, struct cftype *cft,
47179fe03588caa Xiu Jianfeng 2024-06-12  817  			     struct cftype *tmpl, int tmpl_size)
47179fe03588caa Xiu Jianfeng 2024-06-12  818  {
47179fe03588caa Xiu Jianfeng 2024-06-12  819  	char buf[32];
47179fe03588caa Xiu Jianfeng 2024-06-12  820  	int i, idx = hstate_index(h);
47179fe03588caa Xiu Jianfeng 2024-06-12  821  
47179fe03588caa Xiu Jianfeng 2024-06-12  822  	/* format the size */
47179fe03588caa Xiu Jianfeng 2024-06-12  823  	mem_fmt(buf, sizeof(buf), huge_page_size(h));
47179fe03588caa Xiu Jianfeng 2024-06-12  824  
47179fe03588caa Xiu Jianfeng 2024-06-12  825  	for (i = 0; i < tmpl_size; cft++, tmpl++, i++) {
47179fe03588caa Xiu Jianfeng 2024-06-12  826  		*cft = *tmpl;
47179fe03588caa Xiu Jianfeng 2024-06-12  827  		/* rebuild the name */
47179fe03588caa Xiu Jianfeng 2024-06-12 @828  		snprintf(cft->name, MAX_CFTYPE_NAME, "%s.%s", buf, tmpl->name);
47179fe03588caa Xiu Jianfeng 2024-06-12  829  		/* rebuild the private */
47179fe03588caa Xiu Jianfeng 2024-06-12  830  		cft->private = MEMFILE_PRIVATE(idx, tmpl->private);
47179fe03588caa Xiu Jianfeng 2024-06-12  831  		/* rebuild the file_offset */
47179fe03588caa Xiu Jianfeng 2024-06-12  832  		if (tmpl->file_offset) {
47179fe03588caa Xiu Jianfeng 2024-06-12  833  			unsigned int offset = tmpl->file_offset;
47179fe03588caa Xiu Jianfeng 2024-06-12  834  
47179fe03588caa Xiu Jianfeng 2024-06-12  835  			cft->file_offset = MEMFILE_OFFSET0(offset) +
47179fe03588caa Xiu Jianfeng 2024-06-12  836  					   MEMFILE_FIELD_SIZE(offset) * idx;
47179fe03588caa Xiu Jianfeng 2024-06-12  837  		}
47179fe03588caa Xiu Jianfeng 2024-06-12  838  
47179fe03588caa Xiu Jianfeng 2024-06-12  839  		lockdep_register_key(&cft->lockdep_key);
47179fe03588caa Xiu Jianfeng 2024-06-12  840  	}
47179fe03588caa Xiu Jianfeng 2024-06-12  841  }
47179fe03588caa Xiu Jianfeng 2024-06-12  842  

:::::: The code at line 828 was first introduced by commit
:::::: 47179fe03588caa13a9bae642b058901709ddc55 mm/hugetlb_cgroup: prepare cftypes based on template

:::::: TO: Xiu Jianfeng <xiujianfeng@huawei.com>
:::::: CC: Andrew Morton <akpm@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
