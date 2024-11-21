Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B450643AA1
	for <oe-kbuild-all@lists.linux.dev>; Thu, 21 Nov 2024 20:20:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732220448; cv=none; b=GmtXDHo0zj+siEByDvGWMXKc+tZhPUI9L4dwUtTA9gnKlTLc9BZFXlxKVWlFi50TdBUn/ZuC7vcM3r5jnyQY9DkMyZmcw6YhQG/IYOpSi5SAAGjivECOpz3MG+SoM+L3SEBMT0E7E8li5fNxYU3YmL/0p85dJLhfGcKs2bHIfJI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732220448; c=relaxed/simple;
	bh=XeRIToAQIwSjxJZps05KNgYI7EJZSq7BsP10zJ4ceKI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ut9qCo2voHcBq5KS3GlBWtcltMiZyHp69D+8VXli+y1W3qNeOC5ab1RrMKwvQ86oZTLYmisi82sVSpVpTx3AdKJVDYuIWwl8G55lIFJa/HwAyzWwBRCr7PDaDKjFwtzwIGOslZbePLq923BV1ylLN7Gdl6WRHS3s95bQBEWYIRc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aVHhwdax; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aVHhwdax"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732220446; x=1763756446;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=XeRIToAQIwSjxJZps05KNgYI7EJZSq7BsP10zJ4ceKI=;
  b=aVHhwdaxwTc2Ija8pQzQQ8GmOyrXAFLIEKXjkpR/80HigkHNU4gkc4C/
   bc80Bm0XB7HsDIRxYsyj5WYsn2XAdnJhdKnRmFFmSQ0tHE5gfxTpVowky
   2AjzbeLkh1CTKjoEOm06SnVjS5nIPqR8BDplH91LEtBsnD+LoaFxaoElF
   3WD3VcvRwXj2c4KnW1N7Ixvjovd+otd4GG7JB2f2hEhb4jlqNPTI5Gv1H
   vqUyUmlX+Fn2CJIyDmvUQurqmjgPstr++NKW5Twt7xOPKNWNGN4F6M23z
   0FHJch9+U0SzqlxKklgfNAuJDNsBF2T5eWeuVsM6CtIyTsNgKUL1LNDMN
   w==;
X-CSE-ConnectionGUID: srt95sf3RwC3unsmI61oLw==
X-CSE-MsgGUID: JmfwAt41TYmUx1DuPz9viQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11263"; a="36267353"
X-IronPort-AV: E=Sophos;i="6.12,173,1728975600"; 
   d="scan'208";a="36267353"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Nov 2024 12:20:46 -0800
X-CSE-ConnectionGUID: tvyBWNe3S1SNaa0k1XawAw==
X-CSE-MsgGUID: Kuyu74oVRPyCWFm7t0H/tA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,173,1728975600"; 
   d="scan'208";a="90525957"
Received: from lkp-server01.sh.intel.com (HELO 8122d2fc1967) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 21 Nov 2024 12:20:45 -0800
Received: from kbuild by 8122d2fc1967 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tEDfO-0003Jp-2w;
	Thu, 21 Nov 2024 20:20:42 +0000
Date: Fri, 22 Nov 2024 04:20:22 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, leoliuoc <leoliu-oc@zhaoxin.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1297/1297]
 drivers/char/hw_random/zhaoxin-rng.o: warning: objtool: missing symbol for
 section .exit.text
Message-ID: <202411220413.5RZED7zc-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   81e029d5dd0cae934243168eee37ef303ebcce38
commit: 050ff2f361bf733d1dde505dea8b0f5ecb23507c [1297/1297] hwrng: Add Zhaoxin rng driver
config: x86_64-buildonly-randconfig-005-20241117 (https://download.01.org/0day-ci/archive/20241122/202411220413.5RZED7zc-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241122/202411220413.5RZED7zc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411220413.5RZED7zc-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/char/hw_random/zhaoxin-rng.o: warning: objtool: missing symbol for section .exit.text

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
