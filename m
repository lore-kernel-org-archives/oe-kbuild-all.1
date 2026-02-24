Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DF5937AA81
	for <oe-kbuild-all@lists.linux.dev>; Tue, 24 Feb 2026 11:10:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771931405; cv=none; b=LLcvJlrX4AtKKi+CCvVt8DIdJYttlPY5cb3ZyL8QeinmUEjiPBSEEpAq44Buv0TZs/HGXYY20AZl1yhrLYSc/V6WCfk6JbMAaweCpMAqhZOulD/FqfRifhETnbicO7llWndmaSvzx2H3ZvqzbuiIderxBTxDunF+j8MoRoCqdFQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771931405; c=relaxed/simple;
	bh=C7ykLKItkPmxzpK06U5N23IcZ3OX+RJiF3Yu2+fGQIU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=SQYo+midDds0ks18dhKBrwqbrJtlPfv20nNxEPHrfMsSjKYV7pLZbW1ADS0iv4+dq1M6+Stp4HWSLV8FLMo6EEsWFz6wqL8Rm1brRoEgexLE/tgPw2DtehjBxUGcTvcfCF+ympY5rxSMm6cNaJlRHBVVuUuVncz2Jp/Vh9c2Bho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hjd7Yw3D; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hjd7Yw3D"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771931403; x=1803467403;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=C7ykLKItkPmxzpK06U5N23IcZ3OX+RJiF3Yu2+fGQIU=;
  b=hjd7Yw3DSvYbqYlLIBFZmYPRN/a0KMwCj/U5FOT/FP2qaG+0Ew4xhkiL
   K/UzA/AKl1LV4l4aUqZ9CpUk2e9jKemwF61tLukfsUYcWjRSONYQoBWVA
   e1YSoBEnnNn81zYKcbH7YBzzT472SG+g593s9TsRFh0D+vw5iTwX1YwtY
   jNVXJMMzmwlzWA+LwAemwjiMIHNdenTvWoIbUGxym5jVtRMQ+xiA+fq+c
   vlOkyMQX0tv5jl5ipvcMSE2tWilUNw2Sgpk+RstX7gvKMeG4PWtdcBIvO
   4PJUv9WpYlOBciBFSOEru6nGjgStVsOQYCZJ9yAfZG1gouLS5MyTwYpkg
   g==;
X-CSE-ConnectionGUID: ElmdvSiCRiW/mp4CQnN/sQ==
X-CSE-MsgGUID: GYCOGot1Qu2ZwZnj+SGvzQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11710"; a="90354076"
X-IronPort-AV: E=Sophos;i="6.21,308,1763452800"; 
   d="scan'208";a="90354076"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Feb 2026 03:10:03 -0800
X-CSE-ConnectionGUID: j52Lvbx+T+GGP/vPCKZG2g==
X-CSE-MsgGUID: uficyZ2nQOyGkZnckF2S+w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,308,1763452800"; 
   d="scan'208";a="220452388"
Received: from lkp-server02.sh.intel.com (HELO a3936d6a266d) ([10.239.97.151])
  by fmviesa005.fm.intel.com with ESMTP; 24 Feb 2026 03:10:01 -0800
Received: from kbuild by a3936d6a266d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vuqIg-000000001rV-3kqy;
	Tue, 24 Feb 2026 11:09:58 +0000
Date: Tue, 24 Feb 2026 19:09:14 +0800
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:intel-6.6-DMR-APX-ANBZ29353 30/30]
 mm/page_alloc.c:297:20: warning: 'add_to_free_list' declared 'static' but
 never defined
Message-ID: <202602241909.PxCWPKOt-lkp@intel.com>
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

tree:   https://gitee.com/anolis/intel-cloud-kernel.git intel-6.6-DMR-APX-A=
NBZ29353
head:   d8e6957edead90297a4f8cb1f247c54e559dbf8c
commit: dce9170c150f27ea23a2a52e539cc02b6957b595 [30/30] mm: page_alloc: ba=
tch vmstat updates in expand()
config: x86_64-allnoconfig (https://download.01.org/0day-ci/archive/2026022=
4/202602241909.PxCWPKOt-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.4.0-5) 12.4.0
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20260224/202602241909.PxCWPKOt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602241909.PxCWPKOt-lkp@i=
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
