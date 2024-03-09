Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9240A257D
	for <oe-kbuild-all@lists.linux.dev>; Sat,  9 Mar 2024 01:44:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709948653; cv=none; b=Sp55r7iAV8n7uzkKwbcfkO+QljbDUFq+J7nKCsQULmNAtR+VzyCv+p7kpJmHYrKsAN2vxPHWBjx7GnpL+rL1PO5IwpDtdgRD9U1GyQ+u4+ZmpAke9EfVN+9TOQqrbD0UeboJanQZFATsrrDoOaFRI2Ao6+edkqfsqs1GpkGe4wM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709948653; c=relaxed/simple;
	bh=O+Imi4BRS55eAy5zRDASzzyLknub8Sh0qi03eP+e7ks=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=tH/7Ky1iRaYf5sA5X0zQp171GffaNJeshiIsOn365DSyaneLSwKnwNeIowmX4WoQ6pZXnYFKlO14aAyuMhHoseyvQinRTCzSfrVd08DlPjo/K8lJhMYzi1ecC8Z41+hTGiK1oWz6ZEzky9kM/Jblc4FY1Wqkh+87Zx5sGs/4ed8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LQSLvYny; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LQSLvYny"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709948651; x=1741484651;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=O+Imi4BRS55eAy5zRDASzzyLknub8Sh0qi03eP+e7ks=;
  b=LQSLvYny4pM2IaxeYnSbv5bSym5B5BVmIMk2WeyRnMKkIFJGQdsH0+7D
   9GRLuKMkfyQZIar0AgCUizJQHRx0WBZ01qzC43CJlXaQvkAnQgaeeF41Z
   tmZHLnvfC/tQ2c7/BZIgc/Dlv9o7fkKIPcsL3snJTcuvExLFVoVFUT7B+
   XbRGsP+Cz49aAaVLlIDFLbST6JtMI5wzAYiNHsIALSLBPqVWzNgHFyJg6
   y8LuNNB04CUOqElpXo4a0REsXh68XDMtOvXxOG9Uliy7+gNKxjeHUK52R
   aNO669K5of43rSeFsS+xKSdRLaDAZ9a/98FBCVtV4r7PVNxu6EuRL6c0j
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11007"; a="15330806"
X-IronPort-AV: E=Sophos;i="6.07,111,1708416000"; 
   d="scan'208";a="15330806"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Mar 2024 17:44:10 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,111,1708416000"; 
   d="scan'208";a="11187659"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 08 Mar 2024 17:44:09 -0800
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rilkt-0006rz-09;
	Sat, 09 Mar 2024 01:44:07 +0000
Date: Sat, 9 Mar 2024 09:44:05 +0800
From: kernel test robot <lkp@intel.com>
To: Phil Elwell <phil@raspberrypi.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Dave Stevenson <dave.stevenson@raspberrypi.com>
Subject: [jmondi:pispbe/media-staging/be-upstream 15/143] clk-rp1.c:undefined
 reference to `rp1_get_platform'
Message-ID: <202403090904.QkUUhB8f-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jmondi/linux.git pispbe/media-staging/be-upstream
head:   b7b928a1ff80dc548d6f5c1b8c00b2082212e38e
commit: e816c18ae317e9fef655662b2187f72f1cd00f2f [15/143] clk: Add rp1 clock driver
config: m68k-allyesconfig (https://download.01.org/0day-ci/archive/20240309/202403090904.QkUUhB8f-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240309/202403090904.QkUUhB8f-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403090904.QkUUhB8f-lkp@intel.com/

All errors (new ones prefixed by >>):

   m68k-linux-ld: drivers/clk/clk-rp1.o: in function `rp1_clk_probe':
>> clk-rp1.c:(.text+0x490): undefined reference to `rp1_get_platform'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
