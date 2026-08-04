Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EA78385D73
	for <oe-kbuild-all@lists.linux.dev>; Tue,  4 Aug 2026 15:15:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785856521; cv=none; b=kPxRgCyold/ZoGbmoZxGyKpNP/wFMSf5FVTdBMBcP8cuRnhB2fS1NjgYd+/QPeR6+KvBAo68Jf7vw5kEMkQXuZ7XGiw2KH4LLowh3i1F9IazaWSsfVcNZ4kupKka8L9IVV7Q2DgmnRygmFp0FB+uU6c/cEmq0RQ6+MXDKVa24To=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785856521; c=relaxed/simple;
	bh=9NJ32ltbcB82qemSEoG7hUOvGbjw59Kq90HTXiUebBA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=PnJMVevd9tOxQ1adl1jJ25tKi7jQ5wveFPDtRK+wqUqNU73iU8inUPL+RUxAcaxTqL0UC90O1Qz2oC99Du0/BhD4ArXmLvJshVQ9ClWTqxcQ3hlTy3pDBCkxP/D7aL3TnD4uQKfD40kWAZlVlrreYRRvxKltvsrJnVwc3N3QASw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kDK+BRYV; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kDK+BRYV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785856516; x=1817392516;
  h=date:from:to:cc:subject:message-id;
  bh=9NJ32ltbcB82qemSEoG7hUOvGbjw59Kq90HTXiUebBA=;
  b=kDK+BRYVG8xZbGpN2uiW7cEBHiAtewOwXAmanEMVmU2vouDLaQNAw0rB
   kKhMGl3E338v7+bA9/HIiNO73UPlWy3DVeDYVcB0d8O3zsYDAiNfVuab+
   op+Ol/hZj1bbB5ak2BHbzERdk/RiwJvUtYqPRnrLhLpUPAynILCMreYck
   iQBdjdRoT3a6ztiVvSU+HmloN9y9TyOHiqZx3H94hOKpKfRLO5R2yjGq5
   7yk9J2s1nVv00Jkj6qS6B6tQbZDz+H2ib2qEppfZyJ7O7t9HgWie+oWGo
   8iguZYT77CeWzE4dIZGkcigm+brEh0tuVUjgqRlBBQKzoy4fHj6z5+zE4
   w==;
X-CSE-ConnectionGUID: G/3JePPRSZa5Ak6JbUp8xA==
X-CSE-MsgGUID: jvWvoeWhRhi3zoxs1aTpRg==
X-IronPort-AV: E=McAfee;i="6800,10657,11864"; a="86441906"
X-IronPort-AV: E=Sophos;i="6.25,204,1779174000"; 
   d="scan'208";a="86441906"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Aug 2026 08:15:12 -0700
X-CSE-ConnectionGUID: SirvBuQpQ/6ErkRXpQ9eXg==
X-CSE-MsgGUID: TWKi9LnJTDmscDnyOXkNzA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,204,1779174000"; 
   d="scan'208";a="265359660"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 04 Aug 2026 08:15:10 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wrGrE-00000000A5b-0Kia;
	Tue, 04 Aug 2026 15:15:08 +0000
Date: Tue, 04 Aug 2026 23:14:58 +0800
From: kernel test robot <lkp@intel.com>
To: Pratyush Mallick <pratmal@google.com>
Cc: oe-kbuild-all@lists.linux.dev, David Hildenbrand <david@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Linux Memory Management List <linux-mm@kvack.org>,
 mm-commits@vger.kernel.org, Lorenzo Stoakes <ljs@kernel.org>,
 SJ Park <sj@kernel.org>
Subject: [akpm-mm:mm-new 448/454]
 tools/testing/selftests/mm/.gitignore: warning: ignored by one of the
 .gitignore files
Message-ID: <202608042227.XDO54bZk-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-new
head:   e47602c51d20a93fa1711ed896dc9480de4374d9
commit: e051bf0188c9ae10e822a532aac5821c2cc0632a [448/454] selftests/mm: use pattern matching in .gitignore
config: nios2-allnoconfig (https://download.01.org/0day-ci/archive/20260804/202608042227.XDO54bZk-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260804/202608042227.XDO54bZk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608042227.XDO54bZk-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Documentation/.renames.txt: warning: ignored by one of the .gitignore files
>> tools/testing/selftests/mm/.gitignore: warning: ignored by one of the .gitignore files
>> tools/testing/selftests/mm/Makefile: warning: ignored by one of the .gitignore files
>> tools/testing/selftests/mm/charge_reserved_hugetlb.sh: warning: ignored by one of the .gitignore files
>> tools/testing/selftests/mm/check_config.sh: warning: ignored by one of the .gitignore files
>> tools/testing/selftests/mm/config: warning: ignored by one of the .gitignore files
>> tools/testing/selftests/mm/hugepage_settings.h: warning: ignored by one of the .gitignore files
>> tools/testing/selftests/mm/hugetlb_reparenting_test.sh: warning: ignored by one of the .gitignore files
>> tools/testing/selftests/mm/ksft_compaction.sh: warning: ignored by one of the .gitignore files
>> tools/testing/selftests/mm/ksft_cow.sh: warning: ignored by one of the .gitignore files
>> tools/testing/selftests/mm/ksft_gup_test.sh: warning: ignored by one of the .gitignore files
>> tools/testing/selftests/mm/ksft_hmm.sh: warning: ignored by one of the .gitignore files
>> tools/testing/selftests/mm/ksft_hugetlb.sh: warning: ignored by one of the .gitignore files
>> tools/testing/selftests/mm/ksft_hugevm.sh: warning: ignored by one of the .gitignore files
>> tools/testing/selftests/mm/ksft_kmemleak_confirm.sh: warning: ignored by one of the .gitignore files
>> tools/testing/selftests/mm/ksft_kmemleak_dedup.sh: warning: ignored by one of the .gitignore files
>> tools/testing/selftests/mm/ksft_ksm.sh: warning: ignored by one of the .gitignore files
>> tools/testing/selftests/mm/ksft_ksm_numa.sh: warning: ignored by one of the .gitignore files
>> tools/testing/selftests/mm/ksft_madv_guard.sh: warning: ignored by one of the .gitignore files
>> tools/testing/selftests/mm/ksft_madv_populate.sh: warning: ignored by one of the .gitignore files
>> tools/testing/selftests/mm/ksft_mdwe.sh: warning: ignored by one of the .gitignore files
   tools/testing/selftests/mm/ksft_memfd_secret.sh: warning: ignored by one of the .gitignore files
   tools/testing/selftests/mm/ksft_memory_failure.sh: warning: ignored by one of the .gitignore files
   tools/testing/selftests/mm/ksft_migration.sh: warning: ignored by one of the .gitignore files
   tools/testing/selftests/mm/ksft_mkdirty.sh: warning: ignored by one of the .gitignore files
   tools/testing/selftests/mm/ksft_mlock.sh: warning: ignored by one of the .gitignore files
   tools/testing/selftests/mm/ksft_mmap.sh: warning: ignored by one of the .gitignore files
   tools/testing/selftests/mm/ksft_mremap.sh: warning: ignored by one of the .gitignore files
   tools/testing/selftests/mm/ksft_page_frag.sh: warning: ignored by one of the .gitignore files
   tools/testing/selftests/mm/ksft_pagemap.sh: warning: ignored by one of the .gitignore files
   tools/testing/selftests/mm/ksft_pfnmap.sh: warning: ignored by one of the .gitignore files
   tools/testing/selftests/mm/ksft_pkey.sh: warning: ignored by one of the .gitignore files
   tools/testing/selftests/mm/ksft_process_madv.sh: warning: ignored by one of the .gitignore files
   tools/testing/selftests/mm/ksft_process_mrelease.sh: warning: ignored by one of the .gitignore files
   tools/testing/selftests/mm/ksft_rmap.sh: warning: ignored by one of the .gitignore files
   tools/testing/selftests/mm/ksft_soft_dirty.sh: warning: ignored by one of the .gitignore files
   tools/testing/selftests/mm/ksft_thp.sh: warning: ignored by one of the .gitignore files
   tools/testing/selftests/mm/ksft_userfaultfd.sh: warning: ignored by one of the .gitignore files
   tools/testing/selftests/mm/ksft_vma_merge.sh: warning: ignored by one of the .gitignore files
   tools/testing/selftests/mm/ksft_vmalloc.sh: warning: ignored by one of the .gitignore files
   tools/testing/selftests/mm/mlock2.h: warning: ignored by one of the .gitignore files
   tools/testing/selftests/mm/mseal_helpers.h: warning: ignored by one of the .gitignore files
   tools/testing/selftests/mm/page_frag/Makefile: warning: ignored by one of the .gitignore files
   tools/testing/selftests/mm/pkey-arm64.h: warning: ignored by one of the .gitignore files
   tools/testing/selftests/mm/pkey-helpers.h: warning: ignored by one of the .gitignore files
   tools/testing/selftests/mm/pkey-powerpc.h: warning: ignored by one of the .gitignore files
   tools/testing/selftests/mm/pkey-x86.h: warning: ignored by one of the .gitignore files
   tools/testing/selftests/mm/run_vmtests.sh: warning: ignored by one of the .gitignore files
   tools/testing/selftests/mm/settings: warning: ignored by one of the .gitignore files
   tools/testing/selftests/mm/test_hmm.sh: warning: ignored by one of the .gitignore files
   tools/testing/selftests/mm/test_page_frag.sh: warning: ignored by one of the .gitignore files
   tools/testing/selftests/mm/test_vmalloc.sh: warning: ignored by one of the .gitignore files
   tools/testing/selftests/mm/uffd-common.h: warning: ignored by one of the .gitignore files
   tools/testing/selftests/mm/va_high_addr_switch.sh: warning: ignored by one of the .gitignore files
   tools/testing/selftests/mm/vm_util.h: warning: ignored by one of the .gitignore files
   tools/testing/selftests/mm/write_hugetlb_memory.sh: warning: ignored by one of the .gitignore files

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
