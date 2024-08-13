Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CDB91A4F22
	for <oe-kbuild-all@lists.linux.dev>; Tue, 13 Aug 2024 23:31:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723591906; cv=none; b=rq46dbs+rQWA1KKGabKOxTXD2b/yjw7TSuDUBizH0JDV95EG/zY1j9QsgaMtscgWBhUsQIztFp2Ktfo5KzrltipAj3Fl249oNHFSDTeHoooCJ6dVN/RJYAEOOFEKRownCOEBEKP2Fvx/kApmdtv+7zGY4UaIXxBq7WYqstO1Nr0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723591906; c=relaxed/simple;
	bh=prTxGrEtta5fFfd/vZff0kay+3jUlevokrdm2ERMT5M=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=rj/MHlqOBX1/21c+OJrofM+QWrkwA85EdH+m4m119Zb8Mg49d5goQedAhNWwaj9BUmaCOhzUXyqAds4X3IZvf1PtWwRohv6dUx3U82aoaHixDA6FwUKSB/G4gkeiWtj17fEYPH0zvgSxwvwHam6Nqynh1XP626dEgCfoNbQ09mc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LCiPgCaO; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LCiPgCaO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723591905; x=1755127905;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=prTxGrEtta5fFfd/vZff0kay+3jUlevokrdm2ERMT5M=;
  b=LCiPgCaOVcdSxrkOSxfa3B3gAk5B6tQgTr9g9lmZAJ8XQ5yBlJ9jd0In
   +1RaCWM0hjeNeEHvASAx5CjeEVMTzGNpLPlo08xjxqjQjuDg9/uO5uLaL
   ESf0m2TKRb/08bcaBfN7BG6wZfMl4h8K1CHhJuEepyY+4f2bymW2D7ZDp
   7SPqoOKMAKESTE7RrUpxugEgqmzEMNY33W0z5ZJPwmCQaIuIDpu79/CYu
   dV8E3+P+91GH6HQHDYwyojNlxGQt8vFgBtCYT3LRBuorIkS8A+2dZyTNq
   2LE7U8V27Wv096XzNFAbEwb1EN4NwoV+KgSX2DNzwKlW8JrtZhfX0nynW
   Q==;
X-CSE-ConnectionGUID: 7z1F4KMHSPmsItrnw+H7Vw==
X-CSE-MsgGUID: PAO6DCwSQQmX24wDa1hxjA==
X-IronPort-AV: E=McAfee;i="6700,10204,11163"; a="21928475"
X-IronPort-AV: E=Sophos;i="6.09,287,1716274800"; 
   d="scan'208";a="21928475"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Aug 2024 16:31:43 -0700
X-CSE-ConnectionGUID: f0QjkXZNQw2pZHKKQcYwaw==
X-CSE-MsgGUID: HOKf1lSFRry7JpnUX06SNw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,287,1716274800"; 
   d="scan'208";a="89644032"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 13 Aug 2024 16:31:42 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1se0zM-0000m0-05;
	Tue, 13 Aug 2024 23:31:40 +0000
Date: Wed, 14 Aug 2024 07:30:50 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Yang Yingliang <yangyingliang@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 18043/23490] mm/page_alloc.o: warning:
 objtool: __putback_isolated_page()+0x3c4: unreachable instruction
Message-ID: <202408140708.dRZedKqV-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   ffc1b506e4066379411520003b9c59e509b05252
commit: 91bac2310ae7eca9d9869222c96fcc3d02851eea [18043/23490] mm: add function __putback_isolated_page
config: x86_64-buildonly-randconfig-001-20240812 (https://download.01.org/0day-ci/archive/20240814/202408140708.dRZedKqV-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240814/202408140708.dRZedKqV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408140708.dRZedKqV-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from mm/page_alloc.c:21:
   include/linux/pagemap.h:425:21: warning: cast from 'int (*)(struct file *, struct page *)' to 'filler_t *' (aka 'int (*)(void *, struct page *)') converts to incompatible function type [-Wcast-function-type-strict]
     425 |         filler_t *filler = (filler_t *)mapping->a_ops->readpage;
         |                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   mm/page_alloc.c:2304:5: warning: no previous prototype for function 'find_suitable_fallback' [-Wmissing-prototypes]
    2304 | int find_suitable_fallback(struct free_area *area, unsigned int order,
         |     ^
   mm/page_alloc.c:2304:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    2304 | int find_suitable_fallback(struct free_area *area, unsigned int order,
         | ^
         | static 
   2 warnings generated.
   mm/page_alloc.c:3005: warning: Function parameter or member 'mt' not described in '__putback_isolated_page'
>> mm/page_alloc.o: warning: objtool: __putback_isolated_page()+0x3c4: unreachable instruction

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
