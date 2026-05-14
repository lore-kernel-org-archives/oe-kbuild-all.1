Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A53A6388E6E
	for <oe-kbuild-all@lists.linux.dev>; Thu, 14 May 2026 18:53:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778784802; cv=none; b=mF05KSPz5NxXzN3pKjJUG01gBVsTMHZ/Yq8Pte6rQBVEeTrUTM8cMv4eCgCLoN1VjbBKw6QGVxWj3SPaemMCL0grniGHscW/r0KB+mPHndnEqvYGFmGzsRZL8g+Vwit6i28GlaG2jj3QCyIfHRFuLVUXgn4/d9j/N+RN489aQG8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778784802; c=relaxed/simple;
	bh=Ja3DFxFuB21esx6e5OEmK+ngFY6W5ymCAwcAME1jX4k=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=gKC9lBKjkobs3xLUxQw1AQSSGe+fygmitTFlWj47wu1kuUZy10jmey98XzMNoHRPjkNHyR1g2Ff+JKGXtr6hshHMEbGCeuJqKX9KVlbAmhFrDclMtfbK/e4UpjMIjFNo8T0tCaaLJ1l/d7qhGvhiErWgvw5rJ5J64Ui6Vds71xw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gXvjKRn9; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gXvjKRn9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778784801; x=1810320801;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=Ja3DFxFuB21esx6e5OEmK+ngFY6W5ymCAwcAME1jX4k=;
  b=gXvjKRn9xcHWHYQ6K93xGobuQyq7XWHPAupo97NC+v8e8SJsycOrdzCK
   yrefM2U55BeZD5A93r783WkuImCuR5/Jes8rKiBfuWPCIawd3xDJtN5SS
   FcATklbMjaU+zr1xNr5cgHXyT17p2e4LLKjnx783RmmgfsX4Z803ADrVq
   9UaaAXNmEL9ablOp0s1nzwuF3t3JWmdOwWmcde8t4TmHzvnwYiLp6o1cv
   3fNjQSTzL6xmMa3KEmA6x/gVrr80dZjbbgtG05MPHXGjrg5EIDVdU4ZHA
   213hFZhwZvXWfB7JxCMH7uECaxw03RcUw1EA6Qi+tp75LcqOjiDOsGGB9
   A==;
X-CSE-ConnectionGUID: XXBt0/x0SgWCYWIcMrAqEg==
X-CSE-MsgGUID: MWcTDIx/TZuwPy+CSPXk6g==
X-IronPort-AV: E=McAfee;i="6800,10657,11786"; a="83604849"
X-IronPort-AV: E=Sophos;i="6.23,235,1770624000"; 
   d="scan'208";a="83604849"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 May 2026 11:53:21 -0700
X-CSE-ConnectionGUID: tnstvXrQRImFKJLC7MUzOw==
X-CSE-MsgGUID: rbORKmYNQoexvXGNDye2Uw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,235,1770624000"; 
   d="scan'208";a="242466896"
Received: from lkp-server01.sh.intel.com (HELO dca79079c3eb) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 14 May 2026 11:53:19 -0700
Received: from kbuild by dca79079c3eb with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wNbBM-000000006wl-3SlX;
	Thu, 14 May 2026 18:53:16 +0000
Date: Fri, 15 May 2026 02:52:59 +0800
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:intel-6.6-DMR-ISA-ANBZ35251 7/7]
 mm/page_alloc.c:297:20: warning: 'add_to_free_list' declared 'static' but
 never defined
Message-ID: <202605150216.uSLaJApy-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi Johannes,

FYI, the error/warning still remains.

tree:   https://gitee.com/anolis/intel-cloud-kernel.git intel-6.6-DMR-ISA-A=
NBZ35251
head:   1b8b6044ea621040ede1783279f18a666da924a8
commit: dce9170c150f27ea23a2a52e539cc02b6957b595 [7/7] mm: page_alloc: batc=
h vmstat updates in expand()
config: x86_64-allnoconfig (https://download.01.org/0day-ci/archive/2026051=
5/202605150216.uSLaJApy-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.4.0-5) 12.4.0
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20260515/202605150216.uSLaJApy-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605150216.uSLaJApy-lkp@i=
ntel.com/

All warnings (new ones prefixed by >>):

>> mm/page_alloc.c:297:20: warning: 'add_to_free_list' declared 'static' bu=
t never defined [-Wunused-function]
     297 | static inline void add_to_free_list(struct page *page, struct zo=
ne *zone,
         |                    ^~~~~~~~~~~~~~~~


vim +297 mm/page_alloc.c

418508c13222ddb Miklos Szeredi     2007-05-23  292 =20
dcdfdd40fa82b67 Kirill A. Shutemov 2023-06-06  293  static bool page_contai=
ns_unaccepted(struct page *page, unsigned int order);
dcdfdd40fa82b67 Kirill A. Shutemov 2023-06-06  294  static void accept_page=
(struct page *page, unsigned int order);
b77471c6760a22d Kirill A. Shutemov 2024-08-09  295  static bool cond_accept=
_memory(struct zone *zone, unsigned int order);
dcdfdd40fa82b67 Kirill A. Shutemov 2023-06-06  296  static bool __free_unac=
cepted(struct page *page);
8c8774fcbaf4763 Johannes Weiner    2024-03-20 @297  static inline void add_=
to_free_list(struct page *page, struct zone *zone,
8c8774fcbaf4763 Johannes Weiner    2024-03-20  298                         =
             unsigned int order, int migratetype,
8c8774fcbaf4763 Johannes Weiner    2024-03-20  299                         =
             bool tail);
dcdfdd40fa82b67 Kirill A. Shutemov 2023-06-06  300 =20

:::::: The code at line 297 was first introduced by commit
:::::: 8c8774fcbaf47634f07ee957e9cd9403f5e0ce2c mm: page_alloc: consolidate=
 free page accounting

:::::: TO: Johannes Weiner <hannes@cmpxchg.org>
:::::: CC: =E5=B0=8F=E9=BE=99 <wenqing.ly@alibaba-inc.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
