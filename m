Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E89671D6AB
	for <oe-kbuild-all@lists.linux.dev>; Sat, 11 Nov 2023 21:00:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="e3Z1S3DC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699736422; x=1731272422;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=8901V9I0idrPNWjdhcAVy12LHNvlkNgv/dpvzIQ91sc=;
  b=e3Z1S3DCtwFnFQQ8M+4nS7MXip4ajBfXrPoVJ/GM9fpKSu7mZ3lGv0K4
   uQuFj9lu6dz/ADmcRdUqBl7hbReOc6/imiYiXk8yiS8eLaqbtVQH5l2s6
   aSRBBfOXzSDWmJA5nUuPrpGDrJkD2CgalUlEP76Rj3SD9JYdDXyheetrY
   FH3j72QfQPuOl/mmXlK54eDFO51VEYkmSOidc3BzJlTKIBhU4/fRX5uk3
   klELecfzMOAdJTq3Bm/hsOGbUVUbPyoldN+HyqiHUhN54gIFMvmMOPMn2
   j5SvB+xVjfovUEi+5zBD6z3BVl8McQmpRuUdRMlr1imG2RIkChD1TsnoE
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10891"; a="454598465"
X-IronPort-AV: E=Sophos;i="6.03,296,1694761200"; 
   d="scan'208";a="454598465"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Nov 2023 13:00:19 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10891"; a="1095426122"
X-IronPort-AV: E=Sophos;i="6.03,296,1694761200"; 
   d="scan'208";a="1095426122"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 11 Nov 2023 13:00:17 -0800
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r1v5T-000Aks-0Q;
	Sat, 11 Nov 2023 21:00:15 +0000
Date: Sun, 12 Nov 2023 04:59:33 +0800
From: kernel test robot <lkp@intel.com>
To: Badal Nilawar <badal.nilawar@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, intel-xe@lists.freedesktop.org,
	Rodrigo Vivi <rodrigo.vivi@intel.com>,
	Riana Tauro <riana.tauro@intel.com>,
	Andi Shyti <andi.shyti@linux.intel.com>, linux-doc@vger.kernel.org
Subject: [drm-xe:drm-xe-next 1710/1931] htmldocs: Warning:
 /sys/devices/.../hwmon/hwmon<i>/in0_input is defined 2 times:
  ./Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon:46
  ./Documentation/ABI/testing/sysfs-driver-intel-i915-hwmon:0
Message-ID: <202311120445.XYvKYtud-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitlab.freedesktop.org/drm/xe/kernel.git drm-xe-next
head:   edeb8b8fa330a62d4a07b37d08145d86114bc151
commit: 29cb5a9ab2244d2ffa0b781edea7f058ce3cd5d2 [1710/1931] drm/xe/hwmon: Expose input voltage attribute
reproduce: (https://download.01.org/0day-ci/archive/20231112/202311120445.XYvKYtud-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311120445.XYvKYtud-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: /sys/devices/.../hwmon/hwmon<i>/in0_input is defined 2 times:  ./Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon:46  ./Documentation/ABI/testing/sysfs-driver-intel-i915-hwmon:0

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
