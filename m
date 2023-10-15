Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0374523A7
	for <oe-kbuild-all@lists.linux.dev>; Sun, 15 Oct 2023 08:15:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="X8V35ms1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697357733; x=1728893733;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=uWRUtxpoduDwBFd5MRp+s8FpiidMtSJGk6VM8iIw1mE=;
  b=X8V35ms1TURmRu+imV/0QQMzEBQtOBmas390E7t2X/XFx94YiqA+w/of
   9XIZink6UMKztsMOjD09D7QxKC+p/JLfG7mh4TwT1q96KzpxEDqO1wJDd
   FhnwH2rBAQSsGhA5ZRUI9Q7sq/7uK+Km/0VwerPi9+yXYFEE3PfIBCsph
   BDuO4AARFb79qJQD8SBA/TIpAAy2/TXg9fQDxdp9vhJwKOtCyFPMzxOlh
   TExCiSO7487ZBoljpK3Ysly23Qg2RzLvJHfKrV/hdIgiSuyuEEyfEGMdt
   nXVoLjSds1wJ/vxolx1GYlG2MuZrth6/MQOJtHRi76/uymoSC8Aj3XfqH
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10863"; a="364736077"
X-IronPort-AV: E=Sophos;i="6.03,226,1694761200"; 
   d="scan'208";a="364736077"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Oct 2023 01:15:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10863"; a="846027165"
X-IronPort-AV: E=Sophos;i="6.03,226,1694761200"; 
   d="scan'208";a="846027165"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by FMSMGA003.fm.intel.com with ESMTP; 15 Oct 2023 01:15:32 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qrwHa-0007Ct-0n;
	Sun, 15 Oct 2023 08:15:30 +0000
Date: Sun, 15 Oct 2023 16:15:02 +0800
From: kernel test robot <lkp@intel.com>
To: "Rafael J. Wysocki" <rjw@rjwysocki.net>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [rafael-pm:thermal-core 5/15] checkpatch: ERROR: that open brace {
 should be on the previous line
Message-ID: <202310151616.DfDcXTfc-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/rafael/linux-pm.git thermal-core
head:   9c1c13868b8254adfbed8d5aba187e3e1c0b6691
commit: a56cc0a8338523f709892696cc229527617c1316 [5/15] thermal: core: Add function to walk trips under zone lock
reproduce: (https://download.01.org/0day-ci/archive/20231015/202310151616.DfDcXTfc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310151616.DfDcXTfc-lkp@intel.com/

# many are suggestions rather than must-fix

ERROR:OPEN_BRACE: that open brace { should be on the previous line
#29: FILE: drivers/thermal/thermal_trip.c:30:
+int thermal_zone_for_each_trip(struct thermal_zone_device *tz,
+			       int (*cb)(struct thermal_trip *, void *),
+			       void *data)
+{

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
