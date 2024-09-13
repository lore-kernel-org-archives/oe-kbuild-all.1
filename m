Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B56B450FA
	for <oe-kbuild-all@lists.linux.dev>; Fri, 13 Sep 2024 02:32:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726194757; cv=none; b=fqUEyjIbAqhadWyo3Ep3xm1CSBWTWtLnE97hyIkHfYvQt8nTlNB4+0ALgkRSUTcprDutDK6zENF2NQmqPe3Y25TQLVNZ/VxDCoE0EXzeR8yD5wNqv2T7be1qjAIBZOzha0ULuSU51eS/uaQEZlVEe44nFBUxA4AcSD2s1kTJYl0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726194757; c=relaxed/simple;
	bh=IXiiiqQww1vYkh/hd+T3suOs+WOQUvCxJ0ymOxZfZD0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=hZm8zOqHFMf6ZRAf+MS2/S9T8nbtAPsVjyyisp3t9mjIPNU5OkStkcb+6kSLThNsDsTuM49MbTUCz2Oqeaw/WpVxtHcZqIpe6hFAml0hX1W97HKom2sTZHSSXe5FlEUEfjdxncjhgWc1fzlQ92y8a1mF02TBw9TwEyphwBruXzQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=B+K+Bt6D; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="B+K+Bt6D"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726194755; x=1757730755;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=IXiiiqQww1vYkh/hd+T3suOs+WOQUvCxJ0ymOxZfZD0=;
  b=B+K+Bt6DDICrEtZH96RLRN7CDIT7SiXiFFDEPaQnHzPFYO4WrElZcXhA
   /eTKQFIekU/Y9B0Orv0tQX2aM/rPhVbyt9hz2eJFmnVXlW/DLV9f0HYk6
   j+tOj1IwDkmIa73DrlVvTJHIjYMo/mHh9jWvGuIunqbr8I1UZakTZXXuf
   IWsqwvfG627n1yqWgAHx3rGF6YxJZN+n20I3EHPJ7lDgaFh2t/FIvHCcf
   5lRi3T4LKvf4Yivc/lS267NxiEc7BGSlV8QenCcnekKjp2faNdowOVb8z
   ynxsQ9ItmVAifQSWyzR7HFLeFd+xUVO4WySPktoeftiQ0DVfQMgZpOdGz
   g==;
X-CSE-ConnectionGUID: jPMTcPztRNehH+wYOoE8hQ==
X-CSE-MsgGUID: iPB+ezbwSu2mPUUnS2nbOw==
X-IronPort-AV: E=McAfee;i="6700,10204,11193"; a="25234319"
X-IronPort-AV: E=Sophos;i="6.10,224,1719903600"; 
   d="scan'208";a="25234319"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Sep 2024 19:32:32 -0700
X-CSE-ConnectionGUID: qGkwZAQ9QxeNu0V7zB6+ww==
X-CSE-MsgGUID: yaJzAkOhQwGC3fB2iQfVjA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,224,1719903600"; 
   d="scan'208";a="72712566"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 12 Sep 2024 19:32:31 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sow6m-0005vG-1k;
	Fri, 13 Sep 2024 02:32:28 +0000
Date: Fri, 13 Sep 2024 10:31:45 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, fanyizhen1995 <en_0015767@163.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 19475/30000]
 drivers/ub/urma/ubcore/ubcore_dp.c:26:5: warning: no previous prototype for
 'ubcore_rearm_jfc'
Message-ID: <202409131051.TeavBfiV-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Yizhen,

FYI, the error/warning still remains.

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   8f53b22e47e98837db7830541a369ed0cd5df749
commit: ad84f0a92e3fe282d8280d8c45f8d5b8aab1a2b4 [19475/30000] ub: ubcore add event api and add jetty and event api impls to compile
config: arm64-randconfig-004-20240912 (https://download.01.org/0day-ci/archive/20240913/202409131051.TeavBfiV-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240913/202409131051.TeavBfiV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409131051.TeavBfiV-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/ub/urma/ubcore/ubcore_dp.c:26:5: warning: no previous prototype for 'ubcore_rearm_jfc' [-Wmissing-prototypes]
      26 | int ubcore_rearm_jfc(struct ubcore_jfc *jfc, bool solicited_only)
         |     ^~~~~~~~~~~~~~~~

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for PGP_KEY_PARSER
   Depends on [n]: CRYPTO [=y] && ASYMMETRIC_KEY_TYPE [=y] && ASYMMETRIC_PUBLIC_KEY_SUBTYPE [=n]
   Selected by [y]:
   - PGP_PRELOAD [=y] && CRYPTO [=y] && ASYMMETRIC_KEY_TYPE [=y]


vim +/ubcore_rearm_jfc +26 drivers/ub/urma/ubcore/ubcore_dp.c

    25	
  > 26	int ubcore_rearm_jfc(struct ubcore_jfc *jfc, bool solicited_only)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
