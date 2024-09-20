Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D2CB13D897
	for <oe-kbuild-all@lists.linux.dev>; Fri, 20 Sep 2024 10:39:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726828785; cv=none; b=bHSZlAWZAst3UAfpnYtQpvAMLXhxsgVskupwbWL54Vw3DMJKhp+DIvR07AqoHulKY7R0odJ9dVoRIOeKIhNiRPxe2R/jlWopFyoqd9MXs++ePff+c1wWUGjCkUR26DLGLUipnOaUEMKI7h6GLfpOHkR8Fe9IGXXpm8vwgOedQzk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726828785; c=relaxed/simple;
	bh=hL2kchDzCm43BU9RwJcWzV931tS+zBMNTjkm4b3Pp5c=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Wzv66CwZDMOuJjpfzYZhSJeIacvXjaDvSrePqbV7oMv8mltOYMPxEtJP25X1Srp6jL/20G26LyPyTgrLn75r4124hb9/90GDsjU1ufNkw9eWCfI8mA7wqOPeD4E4K7e9Cfw/6euJovD/AWD+0lHGG5p1ap9B4u2f659tGfacZ5c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KM0G+RAl; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KM0G+RAl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726828783; x=1758364783;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=hL2kchDzCm43BU9RwJcWzV931tS+zBMNTjkm4b3Pp5c=;
  b=KM0G+RAl08VbiroudBJp4EXNlIEHMqvA+JQdKQZC2tTM8h0MfzhZJObS
   yE2NsaJ/paPsMyZix9bFJBJPSDmSaW95qwgVy68bv7tM4TBhfAltdiqJg
   vzVl4fyD58GEnBAN9DWvYKG6WgCEF7UYjfx7oBM3V0EBZ+/mSG9Bn6+UF
   OxqLUHZ3APSy2Y7+mCNW9rDA7jIN/d5IFw3tnxAbi0ElBW5kp4Lelui+y
   i5gI0hWdSBop/987J0gxWKc05PNO++SQRuynaEqqcaFJtC+Q3Nj2hlA4Y
   +EjQhJiE3PAD9tx9/k/iP1Px+g14EGzTdvzrl/RAPjF8AY9ZNoSFvh7D6
   A==;
X-CSE-ConnectionGUID: x6Uvq7jfQQupMHhiJ9EorA==
X-CSE-MsgGUID: ASHVu2w9QHKSaqgz85Ip8g==
X-IronPort-AV: E=McAfee;i="6700,10204,11200"; a="43295104"
X-IronPort-AV: E=Sophos;i="6.10,244,1719903600"; 
   d="scan'208";a="43295104"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Sep 2024 03:39:42 -0700
X-CSE-ConnectionGUID: JMNHJAIWQH2a5thbiPfkvg==
X-CSE-MsgGUID: PRqPdr0+Q8OXMOaHsEKIFQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,244,1719903600"; 
   d="scan'208";a="70697175"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 20 Sep 2024 03:39:41 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1srb34-000EHx-2v;
	Fri, 20 Sep 2024 10:39:38 +0000
Date: Fri, 20 Sep 2024 18:38:57 +0800
From: kernel test robot <lkp@intel.com>
To: Matthew Maurer <mmaurer@google.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Miguel Ojeda <ojeda@kernel.org>,
	Andrey Konovalov <andreyknvl@gmail.com>
Subject: [linux-next:master 11937/12481] mm/kasan/kasan_test_c.c:48:6:
 sparse: sparse: symbol 'kasan_ptr_result' was not declared. Should it be
 static?
Message-ID: <202409201822.CVGhLWKs-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Matthew,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   62f92d634458a1e308bb699986b9147a6d670457
commit: a2f11547052001bd448ccec81dd1e68409078fbb [11937/12481] kasan: rust: Add KASAN smoke test via UAF
config: x86_64-randconfig-123-20240920 (https://download.01.org/0day-ci/archive/20240920/202409201822.CVGhLWKs-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240920/202409201822.CVGhLWKs-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409201822.CVGhLWKs-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> mm/kasan/kasan_test_c.c:48:6: sparse: sparse: symbol 'kasan_ptr_result' was not declared. Should it be static?
>> mm/kasan/kasan_test_c.c:49:5: sparse: sparse: symbol 'kasan_int_result' was not declared. Should it be static?

vim +/kasan_ptr_result +48 mm/kasan/kasan_test_c.c

7ce0ea19d50e4e mm/kasan/kasan_test.c Andrey Konovalov 2022-09-27  43  
adb72ae1915db2 lib/test_kasan.c      Daniel Axtens    2020-06-03  44  /*
0fd379253691e7 lib/test_kasan.c      Andrey Konovalov 2021-02-24  45   * Some tests use these global variables to store return values from function
0fd379253691e7 lib/test_kasan.c      Andrey Konovalov 2021-02-24  46   * calls that could otherwise be eliminated by the compiler as dead code.
adb72ae1915db2 lib/test_kasan.c      Daniel Axtens    2020-06-03  47   */
adb72ae1915db2 lib/test_kasan.c      Daniel Axtens    2020-06-03 @48  void *kasan_ptr_result;
83c4e7a0363bdb lib/test_kasan.c      Patricia Alfonso 2020-10-13 @49  int kasan_int_result;
83c4e7a0363bdb lib/test_kasan.c      Patricia Alfonso 2020-10-13  50  

:::::: The code at line 48 was first introduced by commit
:::::: adb72ae1915db28f934e9e02c18bfcea2f3ed3b7 kasan: stop tests being eliminated as dead code with FORTIFY_SOURCE

:::::: TO: Daniel Axtens <dja@axtens.net>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
