Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D077946C
	for <oe-kbuild-all@lists.linux.dev>; Mon, 16 Feb 2026 21:32:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771277563; cv=none; b=Bq6HyFIdLon9sVtlAZlUjDBORKIuJGYhg+gEWEjmzZklPsa7hWwYgenpgaWAJWm7s36hfqiIFrv0UT1zHV5EfgMfNRXfHyyd1aNy07TpwgrAGZ7U/LWkWheiCs/eA6WKtLlImKV6A044J4M+h9oYF9Vfm45HnT9ZlG9qxaYk858=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771277563; c=relaxed/simple;
	bh=xHA9ZKOOl5nkzYInUh/55B/vJarpWYTaz1y4OrRGuvI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=dTi3vSv7317H3I9ZsKzxCRqWvIEvXFQnnOJHtvyY5I0IGjHD4YffbjRkoA+uPU7SAcKBALPawurv5UeC7283xHDaWtXRP5eV98kv2bmwqa3jiRcodXzhR+8DiRUmwbPqSAWL3ECBIp62XYnPPGh4dafVNv2vD++VRQNl85CslII=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mjlWe82c; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mjlWe82c"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771277562; x=1802813562;
  h=date:from:to:cc:subject:message-id;
  bh=xHA9ZKOOl5nkzYInUh/55B/vJarpWYTaz1y4OrRGuvI=;
  b=mjlWe82cbjPa7uTdKSpHhfxuTnw+Gv5RLoyuXGSRPFlT8iKJOlNDXyov
   D7C7lJH1CgxrvIAPrWhLOft0+bD51ARN34FyCkm/vCfRGqffz70ZCMPnw
   JOUNAjJs9L9/mTkzm5W3k0BrQveHv5ApXXYYndBfSJg7iOldMv3rU4Jbp
   BkUA56b+1b8wIaY4WMe7lj9XnwPkno1fXLD2w3rmz0SqYP5bo1jQSf2lC
   XgN0Mp3s7pXpCnHGbNy3+lpJNhvQT5oT0jPDwNbisvLV6hhjet41OkkN5
   0Do9rRI8Go8Ok8mIOTcpZzjI4bP4WvKZJwqNEl0bTtWK7Qi2YOGkd3q9a
   Q==;
X-CSE-ConnectionGUID: 5JWwv0SAStKn6X1o6+lJ3g==
X-CSE-MsgGUID: MRmqULRpT9Op9BBSTCqY6Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11703"; a="76197237"
X-IronPort-AV: E=Sophos;i="6.21,294,1763452800"; 
   d="scan'208";a="76197237"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Feb 2026 13:32:41 -0800
X-CSE-ConnectionGUID: Qq/klxpaQO+qz+y3jHCqCA==
X-CSE-MsgGUID: pn6YirOYQ622wX6rUYUFRg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,295,1763452800"; 
   d="scan'208";a="217849942"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 16 Feb 2026 13:32:33 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vs6Cl-000000010Im-2hyK;
	Mon, 16 Feb 2026 21:32:31 +0000
Date: Tue, 17 Feb 2026 05:31:38 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12 0/2]
 sound/soc/codecs/ak4458.c:631:13: warning: 'ak4458_reset' defined but not
 used
Message-ID: <202602170556.dxLrrnSd-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Shengjiu,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android16-6.12
head:   f2758f0da7bc5628c5fc4d3822976b07b3649b24
commit: 47c4976513f1dd9630c97b5d13a579ab68f908d1 [0/2] ASoC: ak4458: remove the reset operation in probe and remove
config: x86_64-randconfig-003-20260217 (https://download.01.org/0day-ci/archive/20260217/202602170556.dxLrrnSd-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260217/202602170556.dxLrrnSd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602170556.dxLrrnSd-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> sound/soc/codecs/ak4458.c:631:13: warning: 'ak4458_reset' defined but not used [-Wunused-function]
     631 | static void ak4458_reset(struct ak4458_priv *ak4458, bool active)
         |             ^~~~~~~~~~~~


vim +/ak4458_reset +631 sound/soc/codecs/ak4458.c

ee6047b8288814 Daniel Baluta          2019-01-04  630  
e953daeb68b1ab Eliot Blennerhassett   2021-01-22 @631  static void ak4458_reset(struct ak4458_priv *ak4458, bool active)
08660086eff9e9 Cosmin-Gabriel Samoila 2018-02-14  632  {
1e0dff741b0a8a Shengjiu Wang          2024-07-03  633  	if (!IS_ERR_OR_NULL(ak4458->reset)) {
8a0de73cf9dc04 Viorel Suman           2022-10-13  634  		if (active)
8a0de73cf9dc04 Viorel Suman           2022-10-13  635  			reset_control_assert(ak4458->reset);
8a0de73cf9dc04 Viorel Suman           2022-10-13  636  		else
8a0de73cf9dc04 Viorel Suman           2022-10-13  637  			reset_control_deassert(ak4458->reset);
8a0de73cf9dc04 Viorel Suman           2022-10-13  638  		usleep_range(1000, 2000);
08660086eff9e9 Cosmin-Gabriel Samoila 2018-02-14  639  	}
08660086eff9e9 Cosmin-Gabriel Samoila 2018-02-14  640  }
08660086eff9e9 Cosmin-Gabriel Samoila 2018-02-14  641  

:::::: The code at line 631 was first introduced by commit
:::::: e953daeb68b1abd8a7d44902786349fdeef5c297 ASoC: ak4458: correct reset polarity

:::::: TO: Eliot Blennerhassett <eliot@blennerhassett.gen.nz>
:::::: CC: Mark Brown <broonie@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
