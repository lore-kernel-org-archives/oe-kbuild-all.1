Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E49418EFC6
	for <oe-kbuild-all@lists.linux.dev>; Wed, 26 Jun 2024 16:23:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719419002; cv=none; b=qijjwBBm3LWoBG8X7TpgGKkcPTD27Z1fetrFDyW87bttg/OrM7nHpbeiGnH1V/8XEjS/9DsiolXtitJPmvebvYdV+MSq67SXG5C+S9qJl2rhHslGvLp7rn4KF5FvwqnbKHiC61sv/r15xiCvXJITSwTA14H7pH4bakUaWjCo5n0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719419002; c=relaxed/simple;
	bh=tDUu9uHdJaLJIi7MMABaQQB7w98erPIZ3MAeJZ994qo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=fsg5P0tAQDSZK0wEdtCDm15NtXTPB6EIVwbfv7Yn5k6/6FF50oxBKU6hrnCvSMD+DeXw28BiDBarDW8bQtv77F4NkRFVhR/pd51MTEh1ezF/lnPE/B4DdV1bQiB9RC7YMFQnwUqEj/93xRN/9244rZUFSRNyjtEPmrSsaZ/XNwg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Z8fbdRTl; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Z8fbdRTl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1719419000; x=1750955000;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=tDUu9uHdJaLJIi7MMABaQQB7w98erPIZ3MAeJZ994qo=;
  b=Z8fbdRTlP6jr7dWgEaj/whamW0k24klG9qQDMyj3Tk+ZqtjZNRHOsPPT
   nCgJeDDahAsFufYpeEVWGsxHFMilrXM4Prjk0L3/wpon1/E/DGH3qlwJK
   YSrdTCrypL4IngwzXXTfNDf8aseTlaJ27PMOhy0u2gNpUlztrzlW3ryxr
   HtkrJEs73AMea1RaZ4WaM6zWxKOJ0Ux4FAjWT59tVl/5pYzICPOpHp6N0
   5PgImeJVBZbVPBpLbEK+0XFBppI/IXg7XMO/8N8/7dw8pfM9Y71PjCJHZ
   wtH90VpHpx+jKpUehI6UVtJC7Z52Xyc05sjb+3mZRVtVvjC4K8DVfVpod
   A==;
X-CSE-ConnectionGUID: 2Gd+yAIwRI2Al3s2v27qwg==
X-CSE-MsgGUID: b4lN9q2PQJGjFQvLatAXSg==
X-IronPort-AV: E=McAfee;i="6700,10204,11115"; a="27125932"
X-IronPort-AV: E=Sophos;i="6.08,267,1712646000"; 
   d="scan'208";a="27125932"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jun 2024 09:23:12 -0700
X-CSE-ConnectionGUID: NDy8yEZzS5+ci+TdtKWUTg==
X-CSE-MsgGUID: RIKAA7XvTXOECpQmHxD1VQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,267,1712646000"; 
   d="scan'208";a="48504870"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 26 Jun 2024 09:23:11 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sMVQK-000FNm-24;
	Wed, 26 Jun 2024 16:23:08 +0000
Date: Thu, 27 Jun 2024 00:22:46 +0800
From: kernel test robot <lkp@intel.com>
To: Jocelyn Falempe <jfalempe@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: [akpm-mm:mm-nonmm-unstable 43/43]
 arch/powerpc/kernel/nvram_64.c:79:17: error: initialization of 'void
 (*)(struct kmsg_dumper *, enum kmsg_dump_reason,  const char *)' from
 incompatible pointer type 'void (*)(struct kmsg_dumper *, enum
 kmsg_dump_reason)'
Message-ID: <202406270036.zXljQCFL-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-nonmm-unstable
head:   7e72bb7504d1192ab89809f6192dba1b06f4fa51
commit: 7e72bb7504d1192ab89809f6192dba1b06f4fa51 [43/43] printk: add a short description string to kmsg_dump()
config: powerpc64-randconfig-001-20240626 (https://download.01.org/0day-ci/archive/20240627/202406270036.zXljQCFL-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240627/202406270036.zXljQCFL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406270036.zXljQCFL-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

>> arch/powerpc/kernel/nvram_64.c:79:17: error: initialization of 'void (*)(struct kmsg_dumper *, enum kmsg_dump_reason,  const char *)' from incompatible pointer type 'void (*)(struct kmsg_dumper *, enum kmsg_dump_reason)' [-Werror=incompatible-pointer-types]
      79 |         .dump = oops_to_nvram
         |                 ^~~~~~~~~~~~~
   arch/powerpc/kernel/nvram_64.c:79:17: note: (near initialization for 'nvram_kmsg_dumper.dump')
>> arch/powerpc/kernel/nvram_64.c:645:13: error: conflicting types for 'oops_to_nvram'; have 'void(struct kmsg_dumper *, enum kmsg_dump_reason,  const char *)'
     645 | static void oops_to_nvram(struct kmsg_dumper *dumper,
         |             ^~~~~~~~~~~~~
   arch/powerpc/kernel/nvram_64.c:75:13: note: previous declaration of 'oops_to_nvram' with type 'void(struct kmsg_dumper *, enum kmsg_dump_reason)'
      75 | static void oops_to_nvram(struct kmsg_dumper *dumper,
         |             ^~~~~~~~~~~~~
>> arch/powerpc/kernel/nvram_64.c:75:13: warning: 'oops_to_nvram' used but never defined
>> arch/powerpc/kernel/nvram_64.c:645:13: warning: 'oops_to_nvram' defined but not used [-Wunused-function]
     645 | static void oops_to_nvram(struct kmsg_dumper *dumper,
         |             ^~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +79 arch/powerpc/kernel/nvram_64.c

78989f0a5592182 Hari Bathini 2015-02-06  74  
78989f0a5592182 Hari Bathini 2015-02-06 @75  static void oops_to_nvram(struct kmsg_dumper *dumper,
78989f0a5592182 Hari Bathini 2015-02-06  76  			  enum kmsg_dump_reason reason);
78989f0a5592182 Hari Bathini 2015-02-06  77  
78989f0a5592182 Hari Bathini 2015-02-06  78  static struct kmsg_dumper nvram_kmsg_dumper = {
78989f0a5592182 Hari Bathini 2015-02-06 @79  	.dump = oops_to_nvram
78989f0a5592182 Hari Bathini 2015-02-06  80  };
78989f0a5592182 Hari Bathini 2015-02-06  81  

:::::: The code at line 79 was first introduced by commit
:::::: 78989f0a5592182a3d45d869ddaafc71c8f673af powerpc/nvram: Move generic code for nvram and pstore

:::::: TO: Hari Bathini <hbathini@linux.vnet.ibm.com>
:::::: CC: Michael Ellerman <mpe@ellerman.id.au>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
