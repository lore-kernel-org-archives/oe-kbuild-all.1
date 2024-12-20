Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C19B0157A48
	for <oe-kbuild-all@lists.linux.dev>; Fri, 20 Dec 2024 21:38:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734730703; cv=none; b=kcTvPNvHw040ZpLJVIg9gd0QmHjJh1xdk/IPjGZa4ncKfJav1XJzj3qC2uvdLq9IybnIf4M9tO6WhBFSpqKpN4Bi/zGTChHSFO4nCS008Y0WtPSe3iNZY9EA8FLQzMKPkRq/KSVVDXhkSD/L4tspABl1PGDULLZLC2b5MEzs2CU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734730703; c=relaxed/simple;
	bh=keIcYqp45wPVTAUDq2yOhYr3UR7uPkrPm2zeGzaDmiA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=pbLhB+K18eQAmxu8ib1g17QjfqVFP2W+bzGtEmEF7cfqAUo0CUWusfr3koNXsq48b2GA+EPRbuCPxZazTHn4rLrG6LhRwRb/H0zzbiW7Kty79qSN0UPxlmlSnPLibnD5Z+Y621dSQrZHs1IQv6qlxVyq/pJMCtQtaVB0az+HLeY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=btG/wEIt; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="btG/wEIt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734730701; x=1766266701;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=keIcYqp45wPVTAUDq2yOhYr3UR7uPkrPm2zeGzaDmiA=;
  b=btG/wEItKMtVxpbVTR5yEVNLmWq1yssGn4Jqg/RRYPfsKEJQAQlB7y/5
   p6d7zTkoGH0QTQR909h8jMKvU+Ry3LT0kwmnsHJPJW5ZapoFD833j4N6z
   xQrT9czidhFBJ7JHaV6QeKGSoOjN9Tq6GUUP+a30cCSl1zfN9S/1i1QCj
   xg4llDHXab9eioDrraAdcIWmUqjdyb827tNoo7yT/UZDYp6Td+N5MI5Cw
   HBqRi0cou1Wk5+fp4++UQnB6GqoQwbxrZNc0CnS0phbEYhsydr7mRIj6+
   P+wUnflQEWna/RCbspW2kGj05zyoJDTSAfikEyuT81jVoAjUy/2Y6/k4S
   w==;
X-CSE-ConnectionGUID: f+PA2nWMSUKbe2ah2ejlWQ==
X-CSE-MsgGUID: dCSM/cAJS0eddG6jW9YA7w==
X-IronPort-AV: E=McAfee;i="6700,10204,11292"; a="35316542"
X-IronPort-AV: E=Sophos;i="6.12,251,1728975600"; 
   d="scan'208";a="35316542"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Dec 2024 13:38:20 -0800
X-CSE-ConnectionGUID: 3kcLtDl3TM2k+KM5YLxgHg==
X-CSE-MsgGUID: rfYl3DR8TIWQ1sMfDV223Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,251,1728975600"; 
   d="scan'208";a="98389855"
Received: from lkp-server01.sh.intel.com (HELO a46f226878e0) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 20 Dec 2024 13:38:18 -0800
Received: from kbuild by a46f226878e0 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tOkhL-0001gh-31;
	Fri, 20 Dec 2024 21:38:15 +0000
Date: Sat, 21 Dec 2024 05:38:14 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Linus Torvalds <torvalds@linux-foundation.org>
Cc: oe-kbuild-all@lists.linux.dev, LKML <linux-kernel@vger.kernel.org>
Subject: [openeuler:openEuler-1.0-LTS 1341/1341] mm/sparse.o: warning:
 objtool: missing symbol for section .init.text
Message-ID: <202412210532.I31r9MaS-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   02951ceaa6d546dfa0f741f52f6d47e0fb0ac7b4
commit: 2a3cb8baef71e4dad4a6ec17f5f0db9e05f46a01 [1341/1341] mm/sparse: delete old sparse_init and enable new one
config: x86_64-buildonly-randconfig-006-20241220 (https://download.01.org/0day-ci/archive/20241221/202412210532.I31r9MaS-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241221/202412210532.I31r9MaS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412210532.I31r9MaS-lkp@intel.com/

All warnings (new ones prefixed by >>):

   mm/sparse.c: In function 'sparse_init_nid':
   mm/sparse.c:199:27: warning: comparison of unsigned expression in '>= 0' is always true [-Wtype-limits]
     199 |              ((section_nr >= 0) &&                              \
         |                           ^~
   mm/sparse.c:461:9: note: in expansion of macro 'for_each_present_section_nr'
     461 |         for_each_present_section_nr(pnum_begin, pnum) {
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   mm/sparse.c:199:27: warning: comparison of unsigned expression in '>= 0' is always true [-Wtype-limits]
     199 |              ((section_nr >= 0) &&                              \
         |                           ^~
   mm/sparse.c:480:9: note: in expansion of macro 'for_each_present_section_nr'
     480 |         for_each_present_section_nr(pnum_begin, pnum) {
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   mm/sparse.c: In function 'sparse_init':
   mm/sparse.c:199:27: warning: comparison of unsigned expression in '>= 0' is always true [-Wtype-limits]
     199 |              ((section_nr >= 0) &&                              \
         |                           ^~
   mm/sparse.c:503:9: note: in expansion of macro 'for_each_present_section_nr'
     503 |         for_each_present_section_nr(pnum_begin + 1, pnum_end) {
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~
>> mm/sparse.o: warning: objtool: missing symbol for section .init.text

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
