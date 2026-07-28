Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B3EA224AF9
	for <oe-kbuild-all@lists.linux.dev>; Tue, 28 Jul 2026 05:48:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785217732; cv=none; b=irZc7WeHVcHDCDOASTO1773h8JZlFvNlISxxJB/JhudXcvGY9OIrPPCEOpLXodqHvaJ8puwdrqDz+BD3I3BtqAMR9gsjQF7EKjeW9rPAeH6G2kzQzzB1zDZiqp/et8tRUHkPikJ4aTx4Yb+HcOj3IlYr6NQ1yKkhc4sNqUIcYXg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785217732; c=relaxed/simple;
	bh=gX9+MfK6d4Y9vYqs9lkrAu1mwfFkA9zxw5T1VleAa4E=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=pRqJh93GZ/V49YLk22Qx+D2B5hAIQJ7/qsJ/hJB1qXs3th0N39p9zn6SOHlgF+n8KUwUWJAkHaI2YKp/BmnFXT15nzZzri2wKApmbhnkilsE3WYTD6YBsCBYSu+CvKjlQowsGfuxnMJM0wTfnhJj/ORNC3q5CICzzuW0mhH+XGI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dlU8z3CM; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dlU8z3CM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785217730; x=1816753730;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=gX9+MfK6d4Y9vYqs9lkrAu1mwfFkA9zxw5T1VleAa4E=;
  b=dlU8z3CMJwSFzJ9YE2KStYBbIxCMVIX3IwNgVdha2/tda5KDtLlz4RA1
   ldbD2uTdy7mar6D3TG9NX7qtpRlDdZ5JYrme2EbMXpI8U+G88yqSCOqG6
   HtdZ9qbsnSh0QELcgkjV3kaYne4SEDc3cKzNMOalE4LcI+G9CyuSByzKB
   b9Cqk3VWPo+p6SLvNqsXgTJrLIOYQe27bWcxFXPJILAqm4hxogdJqfBH9
   fkilNCfDh4tJPyzBiUbkat9Xw8Rc1EQlbyEsSdGkc/k4PK5DIEJ90ZxwQ
   +apWrJzqEGNT+k3vfTKsBxf/J5UxN1DGfYUsI+uxZG5hJgrAJBfCtlXXF
   w==;
X-CSE-ConnectionGUID: fDvebaeoS46jEg2VY/obhA==
X-CSE-MsgGUID: wSRLt6N7RFCWFQ6xC7tjXw==
X-IronPort-AV: E=McAfee;i="6800,10657,11858"; a="85985373"
X-IronPort-AV: E=Sophos;i="6.25,189,1779174000"; 
   d="scan'208";a="85985373"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jul 2026 22:48:49 -0700
X-CSE-ConnectionGUID: 4NriZRCKRUSE2V5HpYp76g==
X-CSE-MsgGUID: fLyF9SQnSQOL5WJcSaPufA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,189,1779174000"; 
   d="scan'208";a="253281418"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa009.fm.intel.com with ESMTP; 27 Jul 2026 22:48:48 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1woagD-00000000e2N-4Afp;
	Tue, 28 Jul 2026 05:48:43 +0000
Date: Tue, 28 Jul 2026 13:48:38 +0800
From: kernel test robot <lkp@intel.com>
To: "Stefan =?utf-8?Q?D=C3=B6singer"?= <stefandoesinger@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [stefandoesinger-zx297520:dlink 60/130]
 drivers/rpmsg/zx29_smd.c:130:13: warning: 'zx29_smd_release_device' defined
 but not used
Message-ID: <202607281337.O6FGBykU-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

tree:   https://gitlab.com/stefandoesinger/zx297520-kernel dlink
head:   3d8eb1c72ad9937912307a2d4f3de812b572b9b3
commit: 486c263f0e7ecd325e530c4fe8d876755f8f8988 [60/130] rpmsg v1
config: arc-allmodconfig (https://download.01.org/0day-ci/archive/20260728/202607281337.O6FGBykU-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260728/202607281337.O6FGBykU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607281337.O6FGBykU-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/rpmsg/zx29_smd.c: In function 'zx29_smd_trysend':
   drivers/rpmsg/zx29_smd.c:98:31: warning: unused variable 'zx29_ept' [-Wunused-variable]
      98 |         struct zx29_endpoint *zx29_ept = to_zx29_rpmsg_endpoint(ept);
         |                               ^~~~~~~~
   drivers/rpmsg/zx29_smd.c: In function 'zx29_smd_probe':
   drivers/rpmsg/zx29_smd.c:147:22: warning: unused variable 'i' [-Wunused-variable]
     147 |         unsigned int i;
         |                      ^
   drivers/rpmsg/zx29_smd.c: At top level:
>> drivers/rpmsg/zx29_smd.c:130:13: warning: 'zx29_smd_release_device' defined but not used [-Wunused-function]
     130 | static void zx29_smd_release_device(struct device *dev)
         |             ^~~~~~~~~~~~~~~~~~~~~~~


vim +/zx29_smd_release_device +130 drivers/rpmsg/zx29_smd.c

   129	
 > 130	static void zx29_smd_release_device(struct device *dev)
   131	{
   132		dev_info(dev, "zx29_smd_release_device\n");
   133	}
   134	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
