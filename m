Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F023923D7EE
	for <oe-kbuild-all@lists.linux.dev>; Fri, 28 Nov 2025 13:45:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764337519; cv=none; b=Bu03A4t8vQ4YsNZ/sAxJnG9g4o0T10u3mZqxaPM8NkVn296GsIUgySzbg9+XN5xUGXGvEuTqodP38SH7z0N/7jb0FqjUT7LMgr9fRzA3f5wgHq9Wd88MDvHwSiOpLehl9hnbaYSpmc9n7014pWi/aCWm195qUyUGfwmu4/Gbaac=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764337519; c=relaxed/simple;
	bh=cGYhMtCpFJx2+KW092SAkF1Lv84UJ2KlzrlzM192x5s=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=pme10PNNIOx5iMaL5BgclL5OXXniaK8NeNjTkNFGCXyiSZ6g2LEZMTzMjneEtgc4yfNlc3y2x46QiAvpnpJnnQO4RcXeorlscpwbzoSym+jDpsyCaYR6bi3uX/3ES47wQ/UcpL2IzThw35OYNbCpmw5FkaPJtxdaeefQ04MheCo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GPfsGyGv; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GPfsGyGv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764337518; x=1795873518;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=cGYhMtCpFJx2+KW092SAkF1Lv84UJ2KlzrlzM192x5s=;
  b=GPfsGyGvOS/0pz9EkOvuhxJWc2HcY8E+cdIz3MEsEB/XZygHbtmS4Bsw
   sVD1FMhONOGxTIYIjEZfk+Y/j2Yvio+lt9wdX7VoDeqlVKzGjm3Djb1Df
   q1z026LlqF39ZivlMfamVMoV0wi91DUxxgrKJOBQ0MAtJXnnDwI3P1swx
   /j+jMHSEAD7l4D0gay1HjddsAlHPZWZBewk9uGRIuxFBsfJkQcS27qIJ8
   z7k16BdIwSZpxJsChNgbTOeyNJE6R2k7RdBXiiuufr1pvvzeWG6owhkhr
   vWYcTI6Ybj6q18kVjMaRGg1mLGoLLqLmLoDnwPi/SxDswONC/JEXPE3Sh
   w==;
X-CSE-ConnectionGUID: sxHFdFC4QBm0tvKuyZYdFA==
X-CSE-MsgGUID: WGp3gp7CTQCx1Fvc/HrBwA==
X-IronPort-AV: E=McAfee;i="6800,10657,11626"; a="53936598"
X-IronPort-AV: E=Sophos;i="6.20,234,1758610800"; 
   d="scan'208";a="53936598"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Nov 2025 05:45:17 -0800
X-CSE-ConnectionGUID: dqrKla1DRzi7NXzGcrdrpw==
X-CSE-MsgGUID: dlFZ8Mu2SSKZDv1fXD5Dug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,234,1758610800"; 
   d="scan'208";a="198574034"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 28 Nov 2025 05:45:15 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vOymf-000000006QP-1iKc;
	Fri, 28 Nov 2025 13:45:13 +0000
Date: Fri, 28 Nov 2025 21:44:23 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Zicheng Qu <quzicheng@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 3355/3355] kernel/xsched/core.c:497:12: warning:
 no previous prototype for function 'xsched_sched_init'
Message-ID: <202511282111.LvHs2qlX-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   ae3faae9efa6dabe1e7613b5e5d3758ffaefb86a
commit: 832ec54e11a079d968d8f23780ab455b1537b214 [3355/3355] xsched: Add xsched RT class
config: loongarch-allyesconfig (https://download.01.org/0day-ci/archive/20251128/202511282111.LvHs2qlX-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 9e9fe08b16ea2c4d9867fb4974edf2a3776d6ece)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251128/202511282111.LvHs2qlX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511282111.LvHs2qlX-lkp@intel.com/

All warnings (new ones prefixed by >>):

   kernel/xsched/core.c:189:5: warning: no previous prototype for function 'xsched_xse_set_class' [-Wmissing-prototypes]
     189 | int xsched_xse_set_class(struct xsched_entity *xse)
         |     ^
   kernel/xsched/core.c:189:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     189 | int xsched_xse_set_class(struct xsched_entity *xse)
         | ^
         | static 
>> kernel/xsched/core.c:497:12: warning: no previous prototype for function 'xsched_sched_init' [-Wmissing-prototypes]
     497 | __init int xsched_sched_init(void)
         |            ^
   kernel/xsched/core.c:497:8: note: declare 'static' if the function is not intended to be used outside of this translation unit
     497 | __init int xsched_sched_init(void)
         |        ^
         |        static 
   kernel/xsched/core.c:296:20: warning: unused function 'should_preempt' [-Wunused-function]
     296 | static inline bool should_preempt(struct xsched_entity *xse)
         |                    ^~~~~~~~~~~~~~
   3 warnings generated.
--
>> kernel/xsched/rt.c:207:6: warning: no previous prototype for function 'rq_init_rt' [-Wmissing-prototypes]
     207 | void rq_init_rt(struct xsched_cu *xcu)
         |      ^
   kernel/xsched/rt.c:207:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     207 | void rq_init_rt(struct xsched_cu *xcu)
         | ^
         | static 
>> kernel/xsched/rt.c:218:6: warning: no previous prototype for function 'xse_init_rt' [-Wmissing-prototypes]
     218 | void xse_init_rt(struct xsched_entity *xse)
         |      ^
   kernel/xsched/rt.c:218:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     218 | void xse_init_rt(struct xsched_entity *xse)
         | ^
         | static 
>> kernel/xsched/rt.c:228:6: warning: no previous prototype for function 'xse_deinit_rt' [-Wmissing-prototypes]
     228 | void xse_deinit_rt(struct xsched_entity *xse)
         |      ^
   kernel/xsched/rt.c:228:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     228 | void xse_deinit_rt(struct xsched_entity *xse)
         | ^
         | static 
   3 warnings generated.


vim +/xsched_sched_init +497 kernel/xsched/core.c

   496	
 > 497	__init int xsched_sched_init(void)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
