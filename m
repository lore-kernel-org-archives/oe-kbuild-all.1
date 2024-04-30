Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9C08770F0
	for <oe-kbuild-all@lists.linux.dev>; Tue, 30 Apr 2024 14:54:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714488842; cv=none; b=SwRtV/O0o3UT7nHraT0q3jDAx7hQEvDjksl0fy8jUKmfhAAjSReCZaTvr2rkVwiJG1vAuhhcPaNUsU6RffXnnnVsuH7V73Sw6SDiWIx/lm0MtapYpj6h7Zw4VF85p7WlqMROPQxdjivpPXZnjsjvrDlEUQr5nQCFACXFEKPAVU4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714488842; c=relaxed/simple;
	bh=yrldSEdy1noZb0c/2yuVwa0dclZ/dwmEVjmC6c2nrmk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=suBu1JjjEiWjGEWTmLzMwLzcWIX1MyewrppQTWz8TPjIZuZ1GyVROjMf8zHyERCZeVeWQ9uZYG3XNqvJRM9EcdJRPtTmnQKbAzfGyurBCSe/gdzBWdBBelilQQmdXpRq67EHcMPDpBl/c5ErOa4kv9auOCELw9L/f2yueOlHi4I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=I3elH+xh; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="I3elH+xh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714488841; x=1746024841;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=yrldSEdy1noZb0c/2yuVwa0dclZ/dwmEVjmC6c2nrmk=;
  b=I3elH+xh4S8mHwAdAECBx75CZJ7vn30LNvModRvsubmBJ/Kck2j89v5e
   o7K6qUCxz6GaskLxnggjDay8BmCr6UbWQy3NpdOiHRPbJQuzARPpSwsnT
   OnZbEmlI6o4VOko+Fip++jGNDmxjNefuDv4O/+/DX1f2D6VXiob5WPQBx
   HZWKSR8VrqUYd75OYSLio9gZm4jPprQxLCMxSjCWoaWaa1h4dxOaJ0VOa
   krgNOYC4+sWKLdpO6KbQLta0xCn81VYlFgp0SKHXS7XF1WX5p/1/DD1Kk
   5Rpv/6Sanbaenh5+FaXsDwjZwMjAp/uQx3Q1w2E/fVhGXaj5nNFIz0CYM
   g==;
X-CSE-ConnectionGUID: iBsxgkuGSBaq3PxKjEzrKw==
X-CSE-MsgGUID: kWlT8A9SQ3Sy7WTNn4DPFg==
X-IronPort-AV: E=McAfee;i="6600,9927,11060"; a="14026709"
X-IronPort-AV: E=Sophos;i="6.07,242,1708416000"; 
   d="scan'208";a="14026709"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Apr 2024 07:54:01 -0700
X-CSE-ConnectionGUID: f5H3IN9vTu+DNxBw+2gW6w==
X-CSE-MsgGUID: sFrLIudiQIa56Dy5QPyVeQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,242,1708416000"; 
   d="scan'208";a="26571483"
Received: from lkp-server01.sh.intel.com (HELO e434dd42e5a1) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 30 Apr 2024 07:53:59 -0700
Received: from kbuild by e434dd42e5a1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s1orl-0008Ee-0G;
	Tue, 30 Apr 2024 14:53:57 +0000
Date: Tue, 30 Apr 2024 22:53:36 +0800
From: kernel test robot <lkp@intel.com>
To: Roman Gushchin <roman.gushchin@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [rgushchin:page_counters.1 3/5] include/linux/page_counter.h:20:28:
 error: 'HUGE_MAX_HSTATE' undeclared here (not in a function)
Message-ID: <202404302209.wHQ8bXrm-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/rgushchin/linux.git page_counters.1
head:   0dd15dbe99f4eddd40cb83a908540b86501419b0
commit: e6ba7c642b12387e823e16e891c5e4ec8d01b668 [3/5] mm: memcg: merge multiple page_counters into a single structure
config: arm64-defconfig (https://download.01.org/0day-ci/archive/20240430/202404302209.wHQ8bXrm-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240430/202404302209.wHQ8bXrm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404302209.wHQ8bXrm-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from mm/page_counter.c:8:
>> include/linux/page_counter.h:20:28: error: 'HUGE_MAX_HSTATE' undeclared here (not in a function)
      20 | #define __MCT_HUGETLB_MAX (HUGE_MAX_HSTATE * 2 - 1)
         |                            ^~~~~~~~~~~~~~~
   include/linux/page_counter.h:32:27: note: in expansion of macro '__MCT_HUGETLB_MAX'
      32 |         MCT_HUGETLB_MAX = __MCT_HUGETLB_MAX,
         |                           ^~~~~~~~~~~~~~~~~


vim +/HUGE_MAX_HSTATE +20 include/linux/page_counter.h

     9	
    10	/*
    11	 * Page counters are used by memory and hugetlb cgroups.
    12	 * Memory cgroups are using up to 4 separate counters:
    13	 * memory, swap (memory + swap on cgroup v1), kmem and tcpmem.
    14	 * Hugetlb cgroups are using 2 * HUGE_MAX_HSTATE separate
    15	 * counters: for tracking the usage and reservations of each
    16	 * supported hugepage size.
    17	 */
    18	
    19	#ifdef CONFIG_CGROUP_HUGETLB
  > 20	#define __MCT_HUGETLB_MAX (HUGE_MAX_HSTATE * 2 - 1)
    21	#endif /* CONFIG_CGROUP_HUGETLB */
    22	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
