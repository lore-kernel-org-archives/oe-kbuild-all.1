Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7363F29B78F
	for <oe-kbuild-all@lists.linux.dev>; Sat, 17 Jan 2026 18:31:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768674679; cv=none; b=uUUfvRsaq5ZPkKdM7yxgMvnaA5KKFSh7rai+FlCqwQ/pTodrlRMYPAsgWqGax/UjJ07KqNuM9kWlfWyP908olylxbdHLC+yFXZZVqM58hgM8kzEGfqVAhzZqudS16oPhU5hIBUAr/Uo2EfS0q4ywPdZZ4oZPzn6fXexSJRM08uc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768674679; c=relaxed/simple;
	bh=fxtE1ZdtHxQh3vHBfZgCsGDjrYkXI8dtkMkkuwQzm20=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=f0mW3Zh9HW3sS1Ndq4hdcu9Yf8AqRna6PrsPu94e5w0Q+pTguzl80KgcP3K1CWF9OJadMH8v5cxDu46W/NWcxNUpXEZXFpytJsGLWuORGziAJ1hUK0iECxML41tDm6UPpxY5c8MM8j76mvmIlRie9AQIhAwtghzm+zlV9FTPp/E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=B45TlXlK; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="B45TlXlK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768674678; x=1800210678;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=fxtE1ZdtHxQh3vHBfZgCsGDjrYkXI8dtkMkkuwQzm20=;
  b=B45TlXlKAN5T1XBeqxg1RIxE/Rvr6gV0w58FvJZvFyZDprHj/gebpiGD
   DUaH+XlEHJo0oSgZ9QV0REQT9vS8htC1v2DXKjxptzQJ9LWC7+yzny7ak
   mfICDkIKwbpcrWa1VxaCyIkpwH/b0qRgAho+kJj6NfPXq7pEHU/cCjlER
   C881wfVEVMtXmhWMNttTyp2KOuN3YXVfZJQlVHWlbRZ98UrDnCYixdHHd
   1QqtFJ1hTxb3MIsA64ZhK+I2eM2deH3PH0HOP98cnVxarcL2/aNVUlDpP
   UvSQ9nPkXzTvO/l7tWOp2GP1eqm+BOF54V7BxPds9u3n4AeV7xcHPkKOX
   g==;
X-CSE-ConnectionGUID: IaeSQmRRQLi7PgxgTXTyzA==
X-CSE-MsgGUID: AH9eIJkDTUOFw8hZNRS0sw==
X-IronPort-AV: E=McAfee;i="6800,10657,11674"; a="69928035"
X-IronPort-AV: E=Sophos;i="6.21,234,1763452800"; 
   d="scan'208";a="69928035"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jan 2026 10:31:14 -0800
X-CSE-ConnectionGUID: C6SvgIGsRJCo6kbiVbZPMQ==
X-CSE-MsgGUID: C122qKqhQv6nZhN02i97Cg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,234,1763452800"; 
   d="scan'208";a="209996342"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 17 Jan 2026 10:31:12 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vhB4o-00000000M8O-0L81;
	Sat, 17 Jan 2026 18:31:10 +0000
Date: Sun, 18 Jan 2026 02:30:52 +0800
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:devel-6.6 1/1] mm/page_alloc.c:297:20:
 warning: 'add_to_free_list' declared 'static' but never defined
Message-ID: <202601180259.O5SoUFpV-lkp@intel.com>
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
head:   3b02b5ff38d9bf8ba9316914539c133bfbc2343b
commit: dce9170c150f27ea23a2a52e539cc02b6957b595 [1/1] mm: page_alloc: batc=
h vmstat updates in expand()
config: x86_64-allnoconfig (https://download.01.org/0day-ci/archive/2026011=
8/202601180259.O5SoUFpV-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.4.0-5) 12.4.0
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20260118/202601180259.O5SoUFpV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601180259.O5SoUFpV-lkp@i=
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
