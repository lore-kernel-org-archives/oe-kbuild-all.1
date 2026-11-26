Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.10
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795654698;
	b=aDEbGZBaPKiCsmnDVinSKzlS9MHj9Lcb7+VL5IPaBrQd/pwCMfgw7hNGJI6G0PkHKsa0
	 22gXsmYruTE6n4qdicqEwDtIxoNM6UIAeQfu1USp+CcrBrGst4t+mKvCoTFvHvmlllJkA
	 yx+znflI0ZH4wrPWfsMD5EYQlA8lYaWiUHB/TQrDrM6s5OPOkdJQSDSz7OTxfCa1ut0D6
	 Pi2iPhStsdn950Egh6zbEPTiWpW+60OJ9aaoxsS76KZOqQaYTCz7dE8IPHCC8I/C38Qrs
	 uhqK+WqCuTm2op+aoURlnVFuYrTIDpOXZnaHj0etCjuNmAWjwYJOqZglUv8UaCXgklw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795654698;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=mdTVZPPpUVykdMw6EAQWC+UEWWKVrACjkfXd85pT6Bs=;
	b=LBH/yP9mRgDlGh21isLMU9/2mDzGTPmfF2OLPdyc2qU8mV7bzYaPUWd1aHjV3BBra03c
	 lq68/uRD3d3jQts8DqmSIsryiUC7kYL4tdG05hoqYcAii7oJy9Dgay59hdv6JB5+Kq/W4
	 lHH8S6EjheenTDrtEJ6f219puV9DIjmkwintQHB9LqP+pm1BJGqZGywhdjq5Trsodf8ak
	 ubmF7oQqeiU2IVqD4YqvGMOjoARYBU6NFEugpRirDKhl15ZGmJgxjTaD2px9TnEIVW6W/
	 rlez+12ITpgHoGF5dj86Hx570Y6HwKM132brfECDPY5asYEeccEkvgp3E+xjRKsdkYg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=nsHbYEPi;
	arc=none smtp.remote-ip=198.175.65.10
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 533E7606A31E
	for <oe-kbuild-all@lists.linux.dev>; Thu, 26 Nov 2026 00:58:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 533E7606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=nsHbYEPi
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795654698; x=1827190698;
  h=date:from:to:cc:subject:message-id;
  bh=avKWBHDQyY62gpi9D3fUNqg8RufSmESIriuU1BU5qOk=;
  b=nsHbYEPitDIUomNHenYxHrTrWIYi9/G5WpQ/MBrBPHSfihDwk6dIZUqO
   NrOzv8PE6JAlY9B2ozLP9poyOZWHKCHcA2njTcQIqQO382db6QBQQ5mCN
   EnNwXviw/hhP00h5qYC4FApXhVaY2mrEcDRSGfxsfIOF0AcK+2P5JIjk3
   q27M6ByAk31vZFUkB3l4cR6JMW91yFntPLIh7X/FkWVB3FnS9heumrK68
   LJDDSQKWuDmhileY4J/i3lAnDddCzatz4Q90+vwKiY+uVLHmesvrRU5DP
   0gIGF23Dzm+1B9AIOoa1Pz01FRG9Kxp0OnJob4b9d3oJ9Q0/hnEFRHLX/
   w==;
X-CSE-ConnectionGUID: amtanXSWThyb6QaDhHJKXg==
X-CSE-MsgGUID: A//HyUSUTQagH47wpAX6/Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11977"; a="4476628"
X-IronPort-AV: E=Sophos;i="6.27,233,1787036400"; 
   d="scan'208";a="4476628"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Nov 2026 16:58:17 -0800
X-CSE-ConnectionGUID: 5Z/niroPQCSUzmzk1gIcsg==
X-CSE-MsgGUID: 76ZfMEQmRdyx5imgcyeRqw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,233,1787036400"; 
   d="scan'208";a="12303229"
Received: from igk-lkp-server01.igk.intel.com (HELO a03d4d989450) ([10.211.93.152])
  by fmviesa008.fm.intel.com with ESMTP; 25 Nov 2026 16:58:15 -0800
Received: from kbuild by a03d4d989450 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xWNoT-000000000BX-2QWk;
	Thu, 26 Nov 2026 00:58:13 +0000
Date: Thu, 26 Nov 2026 01:57:39 +0100
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android17-6.18-2026-09 1/1] Warning:
 fs/kernfs/dir.c:491 function parameter 'drop_supers' not described in
 'kernfs_drain'
Message-ID: <20261126015540.OJIDdCq5-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

Hi Mercier,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android17-6.18-2026-09
head:   b1e96f99cc54fce82ed2e4f3ddc909e5e25fa5a3
commit: d05d941c20c9dbdbf19c7935bed9b00eb5b44eaa [1/1] UPSTREAM: kernfs: Send IN_DELETE_SELF and IN_IGNORED
config: x86_64-randconfig-2002-20261125 (https://download.01.org/0day-ci/archive/20261126/20261126015540.OJIDdCq5-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261126/20261126015540.OJIDdCq5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/20261126015540.OJIDdCq5-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: fs/kernfs/dir.c:491 function parameter 'drop_supers' not described in 'kernfs_drain'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
