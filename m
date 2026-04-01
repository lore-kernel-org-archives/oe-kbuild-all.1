Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67DB933F8C1
	for <oe-kbuild-all@lists.linux.dev>; Wed,  1 Apr 2026 02:37:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775011064; cv=none; b=tVY/p9h69efPEWGC24wQMLClYuk8Pr0cckIlEvk5wb4KYUmTH2dyOvcXCZvtYAueVjLiPxiZUiDXpa/dKiCqvRYg++og695Dg64RN3hehHYUA7UMfDMzbrW52X6XAzZb0ntkebmrfwiP+MToj3WOI3OtrxkeccipSdhv+9ZCspA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775011064; c=relaxed/simple;
	bh=7iHNj1Ug4GFFMczvGOmPORtEMu7xH9FrzXWI3XjZYFk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=lcVDxDBhq0MiUe4OZrpeuy4f88IR5h3YZOymilzfoT/WrCNO6O2biwbCQ7pqyShRMDT+2cxJhMx9v9XuLBSLaicqJIitSNBpPjRtJlEC3J/5gWuDe6xcJzuJB7x1e/M8eejocu4OgZ4LflKAE4tBg2riPJ8Es2ER+GRDJ8LgWkc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KfbTkIHh; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KfbTkIHh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775011049; x=1806547049;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=7iHNj1Ug4GFFMczvGOmPORtEMu7xH9FrzXWI3XjZYFk=;
  b=KfbTkIHh4hPF2BmBPLV1JAX8/7woQS44lnUbgYwUsRyVNqf8qlLedM3o
   S65DovjvIbBAd9ROiUG14pj0cExCNNlKB/xiGdCjJjCjLkVhkL09iUwL7
   pSxK7sH9xFcghP4ui6xRSrfmIb3mv5MAmd7bRmAkf1iOzO2C5q+E+uxo9
   rfwzlnQj9nBVSuJAn/SddZJLXQAdqkDgBGnFBJVT4uVU4HBnosqY6qdMZ
   eHY0iBGEZ510WPfc+FDd0Ge86PUeT5/EM9UuaACYk4o1T6n2IBg8uM3xJ
   CZpHXFI2DYvLQtOxghw2l9nTsklD1gTcD3R3Wkl2qZ9Ru1Z7pwYczsHII
   g==;
X-CSE-ConnectionGUID: vTnG81fjSAC8fCRJ8LPVjg==
X-CSE-MsgGUID: +3FmvaShSvia7mmHUrMnZQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11745"; a="76100442"
X-IronPort-AV: E=Sophos;i="6.23,153,1770624000"; 
   d="scan'208";a="76100442"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Mar 2026 19:37:28 -0700
X-CSE-ConnectionGUID: z2vLWY7yREyPHKUP7bakFA==
X-CSE-MsgGUID: Duhx8NZlQhOXZYWlW2LyHQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,153,1770624000"; 
   d="scan'208";a="223658794"
Received: from lkp-server01.sh.intel.com (HELO 283bf2e1b94a) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 31 Mar 2026 19:37:27 -0700
Received: from kbuild by 283bf2e1b94a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w7lSP-000000004eO-0A45;
	Wed, 01 Apr 2026 02:37:25 +0000
Date: Wed, 01 Apr 2026 10:37:08 +0800
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:devel-6.6 190/190]
 mm/page_alloc.c:297:20: warning: 'add_to_free_list' declared 'static' but
 never defined
Message-ID: <202604011059.lNpKvxtI-lkp@intel.com>
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

tree:   https://gitee.com/anolis/intel-cloud-kernel.git devel-6.6
head:   666b43ed3d6a1bcc6c4d71681beb459cd846cad6
commit: dce9170c150f27ea23a2a52e539cc02b6957b595 [190/190] mm: page_alloc: =
batch vmstat updates in expand()
config: x86_64-allnoconfig (https://download.01.org/0day-ci/archive/2026040=
1/202604011059.lNpKvxtI-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.4.0-5) 12.4.0
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20260401/202604011059.lNpKvxtI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604011059.lNpKvxtI-lkp@i=
ntel.com/

All warnings (new ones prefixed by >>):

>> mm/page_alloc.c:297:20: warning: 'add_to_free_list' declared 'static' bu=
t never defined [-Wunused-function]
     297 | static inline void add_to_free_list(struct page *page, struct zo=
ne *zone,
         |                    ^~~~~~~~~~~~~~~~


vim +297 mm/page_alloc.c

418508c13222dd Miklos Szeredi     2007-05-23  292 =20
dcdfdd40fa82b6 Kirill A. Shutemov 2023-06-06  293  static bool page_contain=
s_unaccepted(struct page *page, unsigned int order);
dcdfdd40fa82b6 Kirill A. Shutemov 2023-06-06  294  static void accept_page(=
struct page *page, unsigned int order);
b77471c6760a22 Kirill A. Shutemov 2024-08-09  295  static bool cond_accept_=
memory(struct zone *zone, unsigned int order);
dcdfdd40fa82b6 Kirill A. Shutemov 2023-06-06  296  static bool __free_unacc=
epted(struct page *page);
8c8774fcbaf476 Johannes Weiner    2024-03-20 @297  static inline void add_t=
o_free_list(struct page *page, struct zone *zone,
8c8774fcbaf476 Johannes Weiner    2024-03-20  298                          =
            unsigned int order, int migratetype,
8c8774fcbaf476 Johannes Weiner    2024-03-20  299                          =
            bool tail);
dcdfdd40fa82b6 Kirill A. Shutemov 2023-06-06  300 =20

:::::: The code at line 297 was first introduced by commit
:::::: 8c8774fcbaf47634f07ee957e9cd9403f5e0ce2c mm: page_alloc: consolidate=
 free page accounting

:::::: TO: Johannes Weiner <hannes@cmpxchg.org>
:::::: CC: =E5=B0=8F=E9=BE=99 <wenqing.ly@alibaba-inc.com>

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
