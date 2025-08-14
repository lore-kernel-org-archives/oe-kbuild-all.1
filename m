Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A569231984B
	for <oe-kbuild-all@lists.linux.dev>; Thu, 14 Aug 2025 18:39:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755196749; cv=none; b=PDw4x++YFLTrxCc/+LdhHAN1bgIxnKeWSagLbSjAnYHKA2qVQq8HVcinUwcFdinvalhiV08XqebqM7jHjuuSa6jA6yF+p6f+v1krmR5YoPuYRThLfbpz1/rQCNYi1zYQ+i1px44umTT8bSP97Yirnzu4mtSa66UApfifZBHhoc8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755196749; c=relaxed/simple;
	bh=t4VAT4JFAlsrCC/qIeZjeLUd6YOMCJQczxcuPyagYnQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=SmNeCmK31d3O/5P2PWoLdiw3lokLFU0kLFz5i79jvEGoRPnRKGkkS6SGbhKeL5iN4gkIRCh7M+RnJ9PR3NfFlNf/lxVm6Vilx2+Z8pGj5O/c0IRrgvInLjsZ2lVelbjh9Bn0nEtxLeTop/Zl9QFTTKcajxEtyN7GRy8iS9PjrB0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cFrqLlZV; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cFrqLlZV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755196748; x=1786732748;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=t4VAT4JFAlsrCC/qIeZjeLUd6YOMCJQczxcuPyagYnQ=;
  b=cFrqLlZVx6gDCcGn+l+SiX7v7ubad7aZNCj+J7d3+JZ/vJoOZsihJ+64
   RKhvcSczdzdc+Z5oyjkrI848GA28bd02KG9HpeoPSXtX+gGyvaPfDp4jW
   0fri84yAjD9X8MR87P1YuDoYH7puCxU0Cx2/sIc/SPSG9boJ/ShQmUsTl
   tz0CgXbXNy+K5vF7YjaSB9tiHk1FVmBpamK/J8kC6PbXfWwFnVli8o0HI
   QHEYsapVpWzPoPvk7WxI4beEKSPYqy5x28giMbroqlFzOlPcF/oyCIYEF
   rZ92TZraKjIpplO5Yygj5FjCl4Pq8c8RcyCMnDqmQsRgUpIOhZ7zN2+IB
   w==;
X-CSE-ConnectionGUID: n8j6Tv99T1Wt9kxi1s4BBw==
X-CSE-MsgGUID: HJp7/2HqTtaOEefcIcFxQQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11522"; a="57598171"
X-IronPort-AV: E=Sophos;i="6.17,290,1747724400"; 
   d="scan'208";a="57598171"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Aug 2025 11:39:08 -0700
X-CSE-ConnectionGUID: Jw6DdITyQmmPG/MrfGbrbw==
X-CSE-MsgGUID: Tz2RNVarQt+SKl1KTZloFA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,290,1747724400"; 
   d="scan'208";a="167092149"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by orviesa008.jf.intel.com with ESMTP; 14 Aug 2025 11:39:06 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1umcqt-000BFG-2Q;
	Thu, 14 Aug 2025 18:39:03 +0000
Date: Fri, 15 Aug 2025 02:39:00 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, GONG Ruiqi <gongruiqi1@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 2679/2679] arch/x86/mm/pat/set_memory.c:127:22:
 warning: no previous prototype for function 'x86_get_direct_pages_count'
Message-ID: <202508150235.tTN5yutB-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   43d8c124ec4624389b14d42595e5f0195e3e5a1d
commit: ef5847533f910a4b3aca1cd1c855b02d60389ad3 [2679/2679] bpf-rvi: Add bpf_x86_direct_pages kfunc
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20250815/202508150235.tTN5yutB-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250815/202508150235.tTN5yutB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508150235.tTN5yutB-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/x86/mm/pat/set_memory.c:127:22: warning: no previous prototype for function 'x86_get_direct_pages_count' [-Wmissing-prototypes]
     127 | const unsigned long *x86_get_direct_pages_count(void)
         |                      ^
   arch/x86/mm/pat/set_memory.c:127:7: note: declare 'static' if the function is not intended to be used outside of this translation unit
     127 | const unsigned long *x86_get_direct_pages_count(void)
         |       ^
         | static 
   1 warning generated.


vim +/x86_get_direct_pages_count +127 arch/x86/mm/pat/set_memory.c

   125	
   126	#ifdef CONFIG_BPF_RVI
 > 127	const unsigned long *x86_get_direct_pages_count(void)
   128	{
   129		return direct_pages_count;
   130	}
   131	#endif
   132	#else
   133	static inline void split_page_count(int level) { }
   134	#endif
   135	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
