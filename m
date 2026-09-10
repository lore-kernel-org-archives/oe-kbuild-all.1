Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7341549B5C0
	for <oe-kbuild-all@lists.linux.dev>; Thu, 10 Sep 2026 21:59:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789077542; cv=none; b=i3yEX09sbJFy/ZKZYEEMv+UoN7bzfPFhGfbuNw9lFO50ZtHxJ9EU8CYiS7yJVppa9ZPgxV650Nn+r02qYYDpvrT4VvAA2jlQzBJtf2Jljnt3gmt7fSssTvbyX66mIHTIyED6TxCxM1ic5ADIUKHbci2TSk+y0WKET+Xw6WI96X8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789077542; c=relaxed/simple;
	bh=YD4rVoGm1zM3Nmk9+3lHcOX2BlSywlDeF+4dVxY3kQ0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=juijIE7p8CyrREU8x0GsjC+ZaCTtHy2EsVuD/N3pK0fbYqgd9exoN3JJ6sV324+JB/sKDIi+UZ+Fz0hwDjtlGMqPjnlmD9N6wNtMh3ZnTpVseVYYspZhOBvqUNJ/dhC1PRqQwwb7cuQ7zA7WlKtNEi0vzmnBzNJzJn1PCMWFI6Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=izFw2yvV; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="izFw2yvV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789077540; x=1820613540;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=YD4rVoGm1zM3Nmk9+3lHcOX2BlSywlDeF+4dVxY3kQ0=;
  b=izFw2yvVh8SxWbd3uv6aPsoFCCO90gskEbAm0qNrgYlTXq17D0b2rCxa
   slI+Q1L00k9d+IrRcIchBELSlSwEpy0OHhAi7aKLsYkRU9JtEsoOnCw2x
   a0dD/Bqxn8AuPbvf8QJJ3LJQ/3KvJ6gNi4e+sJsA2nRku2X6AkvdeQSuP
   vGzlfjxg3M+kGJCRVGVTyed8Z4Ynu9LCH+6sxm/5JeQUxQmDeA+7cmpG6
   8iZ+qIk/3dIA8Z//UPtmOg7rHBaS6A2mctGhxd43c6hnQ5O0FYcrwrG83
   k0tOAfAnCqQY0fnAubgBH4lkvHu820V1YBR7NxUX9tPfALSREnMbERwgw
   g==;
X-CSE-ConnectionGUID: Q8t3Ejy/QbKSrv2XTbFM5A==
X-CSE-MsgGUID: G8jOSA+TS7SBXfbt155TuA==
X-IronPort-AV: E=McAfee;i="6800,10657,11901"; a="89579604"
X-IronPort-AV: E=Sophos;i="6.27,96,1787036400"; 
   d="scan'208";a="89579604"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Sep 2026 14:59:00 -0700
X-CSE-ConnectionGUID: dvXh4/OMRKukDox6cKgHrA==
X-CSE-MsgGUID: faCtN3FtQo2vDs/028jQfA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,96,1787036400"; 
   d="scan'208";a="295230477"
Received: from lkp-server02.sh.intel.com (HELO 0a3643a6ed9d) ([10.239.97.151])
  by fmviesa002.fm.intel.com with ESMTP; 10 Sep 2026 14:58:58 -0700
Received: from kbuild by 0a3643a6ed9d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x4mnA-000000000ZL-49fc;
	Thu, 10 Sep 2026 21:58:52 +0000
Date: Fri, 11 Sep 2026 05:55:24 +0800
From: kernel test robot <lkp@intel.com>
To: Jim Cromie <jim.cromie@gmail.com>,
 =?utf-8?Q?"=C5=81ukasz?= Bartosik" <ukaszb@chromium.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jimc:dd-classmaps-v9-akpm 27/40]
 lib/dynamic_debug.c:1492:13: warning: 'ddebug_table_free' defined but not
 used
Message-ID: <202609110513.znignNei-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

tree:   https://github.com/jimc/linux.git dd-classmaps-v9-akpm
head:   2a850a9a6b701a3e47427395b1ac34c92e21f0ca
commit: fce78b7f456f7e2c306de600ea603e2017c4f2d5 [27/40] dyndbg: detect class_id reservation conflicts
config: microblaze-randconfig-r131-20260910 (https://download.01.org/0day-ci/archive/20260911/202609110513.znignNei-lkp@intel.com/config)
compiler: microblaze-linux-gcc (GCC) 15.2.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260911/202609110513.znignNei-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609110513.znignNei-lkp@intel.com/

All warnings (new ones prefixed by >>):

   lib/dynamic_debug.c: In function 'ddebug_sync_classbits':
   lib/dynamic_debug.c:1274:47: error: '_DPRINTK_FLAGS_ACTIVE' undeclared (first use in this function)
    1274 |         init_bits = (_DPRINTK_FLAGS_DEFAULT & _DPRINTK_FLAGS_ACTIVE) ?
         |                                               ^~~~~~~~~~~~~~~~~~~~~
   lib/dynamic_debug.c:1274:47: note: each undeclared identifier is reported only once for each function it appears in
   lib/dynamic_debug.c: At top level:
>> lib/dynamic_debug.c:1492:13: warning: 'ddebug_table_free' defined but not used [-Wunused-function]
    1492 | static void ddebug_table_free(struct ddebug_table *dt)
         |             ^~~~~~~~~~~~~~~~~


vim +/ddebug_table_free +1492 lib/dynamic_debug.c

b48420c1d3019c Jim Cromie  2012-04-27  1491  
e9d376f0fa66bd Jason Baron 2009-02-05 @1492  static void ddebug_table_free(struct ddebug_table *dt)
e9d376f0fa66bd Jason Baron 2009-02-05  1493  {
e9d376f0fa66bd Jason Baron 2009-02-05  1494  	list_del_init(&dt->link);
e9d376f0fa66bd Jason Baron 2009-02-05  1495  	kfree(dt);
e9d376f0fa66bd Jason Baron 2009-02-05  1496  }
e9d376f0fa66bd Jason Baron 2009-02-05  1497  

:::::: The code at line 1492 was first introduced by commit
:::::: e9d376f0fa66bd630fe27403669c6ae6c22a868f dynamic debug: combine dprintk and dynamic printk

:::::: TO: Jason Baron <jbaron@redhat.com>
:::::: CC: Greg Kroah-Hartman <gregkh@suse.de>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
