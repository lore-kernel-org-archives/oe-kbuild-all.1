Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFA6C456E14
	for <oe-kbuild-all@lists.linux.dev>; Wed, 23 Sep 2026 07:17:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790147835; cv=none; b=nq0vQA1UfNZjkHd9WyM+KIeGuc3YZwAUznZpkPjb5I6sle1xBHMuFTHX2+tvbPml/kItWgRlE5vfNAGPXEnn2V3oylnMmXtTPL5xxjVcBVebqQC2LWNZ5hHNHrQSycyZ8KfEtMn5t7BdC9peEIW8v8UbEdPerEe+NJD4ak5XkeQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790147835; c=relaxed/simple;
	bh=D+232rAPUFAY970900su/sCsdSxvevGKQ55Kf8Cqu+8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Mkd3DdVQF1yafCj0g8b7iJpZF6ZQfGo46eXHr5vD+QzBGAHHpTwXOUvqB3koIZgiCPXcJE/MxCn5pw3Dg0EvxSMnpTyCfbHoZmLdX+g5i6Hn25M8FUnkLsEpbqBMdAs6J/V6vCosM5wMzGOnyy8YzDVU5pf/zosEvbHhiUKNJZg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=daRdUgct; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="daRdUgct"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790147833; x=1821683833;
  h=date:from:to:cc:subject:message-id;
  bh=D+232rAPUFAY970900su/sCsdSxvevGKQ55Kf8Cqu+8=;
  b=daRdUgctob3AG0rmfLakwwCMouD+vF68Cuz3OdEsBe7TPQmQCGq78+g+
   s341DTy4ebJFtGXcrFc6o8dlhfCJC6SlRVJLKonti75uNKqzCCl2eTckF
   KphLyxNfUL2h1VY7CqxVd/5lxHcioraV4W7OKB3yxe67pnDntFnXaPP7h
   n0XaazsItjffyo/eA0KYbH9qW5r9F4BDKwvQmshiqgy68Rair+63U5ELu
   ioSfiwEdxO/NVRTv3yKE2dbm/x+oYqKwpNPwJ8yxNQ/ulTAjaJGbJvt6a
   SWNDymN63Cqsn2/Epq9go9zYcbWFaMgIunhTQ3gcdPqiAmyC7Z9f0xnUW
   g==;
X-CSE-ConnectionGUID: IMpcZ2KmRDWyfZQw4pCDYQ==
X-CSE-MsgGUID: b3HATmNmRPajaJmOVPaD9Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11913"; a="78367446"
X-IronPort-AV: E=Sophos;i="6.27,118,1787036400"; 
   d="scan'208";a="78367446"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2026 00:17:10 -0700
X-CSE-ConnectionGUID: cX743mNNSc21RLy7bIaAww==
X-CSE-MsgGUID: w7skAU2bRp6sWO12y6H+bQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,118,1787036400"; 
   d="scan'208";a="299723891"
Received: from igk-lkp-server01.igk.intel.com (HELO 1bbc298b9a73) ([10.211.93.152])
  by fmviesa002.fm.intel.com with ESMTP; 23 Sep 2026 00:17:09 -0700
Received: from kbuild by 1bbc298b9a73 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x9HE3-000000000Z1-0YYa;
	Wed, 23 Sep 2026 07:17:07 +0000
Date: Wed, 23 Sep 2026 09:17:01 +0200
From: kernel test robot <lkp@intel.com>
To: Petar Stepanovic <pstepanovic@axiado.com>
Cc: oe-kbuild-all@lists.linux.dev, Guenter Roeck <linux@roeck-us.net>,
 linux-doc@vger.kernel.org
Subject: [groeck-staging:hwmon-next 67/69] htmldocs:
 Documentation/hwmon/index.rst:19: WARNING: toctree contains reference to
 nonexisting document 'hwmon/axiado-pwm-fan' [toc.not_readable]
Message-ID: <202609230904.aIWyLsSt-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-next
head:   bf92ea2a46120fd0809f24d39ad3482d0f20876b
commit: 2d52742f408f7da7a76abed123f1a7b737eabc41 [67/69] hwmon: add Axiado AX3000 and AX3005 PWM fan controller driver
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
docutils: docutils (Docutils 0.21.2, Python 3.13.5, on linux)
reproduce: (https://download.01.org/0day-ci/archive/20260923/202609230904.aIWyLsSt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609230904.aIWyLsSt-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Runtime Survivability
   ===================== [docutils]
>> Documentation/hwmon/index.rst:19: WARNING: toctree contains reference to nonexisting document 'hwmon/axiado-pwm-fan' [toc.not_readable]
   Documentation/mm/memfd_preservation:7: ./mm/memfd_luo.c:13: ERROR: Unexpected section title.


vim +19 Documentation/hwmon/index.rst

7ebd8b66dd9e5a Mauro Carvalho Chehab 2019-04-17  18  
7ebd8b66dd9e5a Mauro Carvalho Chehab 2019-04-17 @19  .. toctree::

:::::: The code at line 19 was first introduced by commit
:::::: 7ebd8b66dd9e5a0b65e5ee5e2b8e7ca382ec97b7 docs: hwmon: Add an index file and rename docs to *.rst

:::::: TO: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
:::::: CC: Guenter Roeck <linux@roeck-us.net>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
