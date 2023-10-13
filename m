Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 534EE168AF
	for <oe-kbuild-all@lists.linux.dev>; Fri, 13 Oct 2023 13:51:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kATHnbFy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697205092; x=1728741092;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=teQ1+WvuxymF9aWlIRNXLqSIBS3f3TfJiximrBEH2Sc=;
  b=kATHnbFyL1BDw046iewRveAAggX9acISJnJquAPHoKTq9msk6KGsAjDL
   gTLzKCLt0ywarJnR6ZrDTENqogjGqSlpHhjDUe8fPzp+opc7nzlwx+252
   4kMwcOPur6KxbiEKxsYO7Pip1DeJuvmzRfKpwkwLaDm2MwTasYX6aW8+j
   VaX8EK4nE3cCpEBQt+/x3KEEiD754mgkoPmGqwDVvfYSwyRjGaq5Vvehx
   RdVTUUyoXviWBAOb5pVjheko50W0KzURCnCMGbazo6PiXs015YyRyUvni
   L3ysrc2JVYdc3q1uD+NZhBCDW/xP5R5MyJnKbBHyja710B58bPAcwGBd+
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10862"; a="416235796"
X-IronPort-AV: E=Sophos;i="6.03,222,1694761200"; 
   d="scan'208";a="416235796"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Oct 2023 06:51:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10862"; a="731375088"
X-IronPort-AV: E=Sophos;i="6.03,222,1694761200"; 
   d="scan'208";a="731375088"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by orsmga006.jf.intel.com with ESMTP; 13 Oct 2023 06:51:18 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qrIZQ-0004pq-0L;
	Fri, 13 Oct 2023 13:51:16 +0000
Date: Fri, 13 Oct 2023 21:50:48 +0800
From: kernel test robot <lkp@intel.com>
To: Pavel Begunkov <asml.silence@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [isilence:zc/veth 5/7] checkpatch: WARNING: please, no space before
 tabs
Message-ID: <202310132150.09BV4aus-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/isilence/linux zc/veth
head:   cff8a226d561bc0db814b65ca5d2c97894d4d1cd
commit: 87d67390f5c169ff9ae3ed9748e59e5cfb540d70 [5/7] veth: zc_rx support
reproduce: (https://download.01.org/0day-ci/archive/20231013/202310132150.09BV4aus-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310132150.09BV4aus-lkp@intel.com/

# many are suggestions rather than must-fix

WARNING:SPACE_BEFORE_TAB: please, no space before tabs
#33: FILE: drivers/net/veth.c:81:
+^Ispinlock_t ^I^Izc_lock;$

WARNING:BRACES: braces {} are not necessary for single statement blocks
#64: FILE: drivers/net/veth.c:393:
+		if (!nskb) {
+			goto drop;
+		}

WARNING:SPACE_BEFORE_TAB: please, no space before tabs
#233: FILE: io_uring/zc_rx.c:122:
+^I// ^I^I^I  DMA_BIDIRECTIONAL,$

WARNING:SPACE_BEFORE_TAB: please, no space before tabs
#234: FILE: io_uring/zc_rx.c:123:
+^I// ^I^I^I  DMA_ATTR_SKIP_CPU_SYNC);$

WARNING:SPACE_BEFORE_TAB: please, no space before tabs
#236: FILE: io_uring/zc_rx.c:125:
+^I// ^Iset_page_private(page, 0);$

WARNING:SPACE_BEFORE_TAB: please, no space before tabs
#237: FILE: io_uring/zc_rx.c:126:
+^I// ^IClearPagePrivate(page);$

WARNING:SPACE_BEFORE_TAB: please, no space before tabs
#238: FILE: io_uring/zc_rx.c:127:
+^I// ^Ireturn -ENOMEM;$

WARNING:SPACE_BEFORE_TAB: please, no space before tabs
#255: FILE: io_uring/zc_rx.c:147:
+^I// ^I^I     DMA_BIDIRECTIONAL,$

WARNING:SPACE_BEFORE_TAB: please, no space before tabs
#256: FILE: io_uring/zc_rx.c:148:
+^I// ^I^I     DMA_ATTR_SKIP_CPU_SYNC);$

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
