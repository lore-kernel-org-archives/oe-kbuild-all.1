Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3875413AD0
	for <oe-kbuild-all@lists.linux.dev>; Sun, 12 Jan 2025 03:59:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736654385; cv=none; b=UM686zUTAWNUzDR1ZHsn2rSKkTo+/LPnZUkvnAwczSTyPK2nOB9wPAQpv6qMXyl/FiFTMHov8oa/jBxZe8ajZLg6TSH9lWrnBCGymPAtjxywCxoAGr5nRUFr0Y3o6yzV/0smF6VEjlSLr8XHr9sY6T5kvJp0N5f6NPTyo984AoM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736654385; c=relaxed/simple;
	bh=eTZN2STrb+gCg3+K22Wg4O+H39SX/DLOW16WuizIubU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=OEdlsTc6dJOzW0eluPUVmFdeCIeEj+GzXKY5fXaJN8qLJquT5VZG/aH5gPmd4q65NQoGPO7uFFMz7l+MN6zmtyemuFSoU5tEVTtsQHEwdyf6ua64sGODMZQPFqkfuBfm/+dXcueDFwo5bQNBxbXmEWsj+joVXPBYK2NcNurl/1Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NtNEy6m9; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NtNEy6m9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736654385; x=1768190385;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=eTZN2STrb+gCg3+K22Wg4O+H39SX/DLOW16WuizIubU=;
  b=NtNEy6m9uRti1sbYkkxL9h7Gj8K4IKAgW+HU1flHIyc5GMfQMkiUAuE8
   ego5p2lXBhTyvC3wYRUHG30cCRzICxR6Grb4TF1/VNhKc1tYryXBWMR/1
   xOvlS1q1ozbMl1BQvSArYrRbSPTk8XFg9v62f65BoFopqqnzP7RBntJxu
   31jyD1V5IpHELMg2o89NO4IEeAIJU+5TykO+c+b7siJ24ylZKZ1awotY4
   4peXxa/gZHV0D4IiPqFoXsItKxOjuIq1JsGmbDqOQGe0DL+LIK+ke+6c7
   0XfYIw6/OW4LKht3FRC8qyss58n3nmuzRdChdfRx8V4XYGx1nVFb1vEr1
   g==;
X-CSE-ConnectionGUID: 7l6ZeNs5T9uS3QFV9o8hTQ==
X-CSE-MsgGUID: I/kQtkVBSPmqlfGbpwdn/Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11312"; a="37014489"
X-IronPort-AV: E=Sophos;i="6.12,308,1728975600"; 
   d="scan'208";a="37014489"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jan 2025 19:59:44 -0800
X-CSE-ConnectionGUID: 08aZEE2wT9SP6JHpF9U2UQ==
X-CSE-MsgGUID: Z7LVG/HWRCa6mZOtFRWAZg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="104968625"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 11 Jan 2025 19:59:41 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tWp8U-000LYZ-28;
	Sun, 12 Jan 2025 03:59:38 +0000
Date: Sun, 12 Jan 2025 11:58:38 +0800
From: kernel test robot <lkp@intel.com>
To: Pranavi Somisetty <pranavi.somisetty@xilinx.com>
Cc: Paul Gazzillo <paul@pgazz.com>,
	Necip Fazil Yildiran <fazilyildiran@gmail.com>,
	oe-kbuild-all@lists.linux.dev, git@amd.com,
	Michal Simek <monstr@monstr.eu>,
	Harini Katakam <harini.katakam@xilinx.com>,
	Radhey Shyam Pandey <radhey.shyam.pandey@xilinx.com>
Subject: [xilinx-xlnx:lkp_test 111/504] kismet: WARNING: unmet direct
 dependencies detected for PTP_1588_CLOCK when selected by XILINX_TSN_QBV
Message-ID: <202501121402.abxzrFeV-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Xilinx/linux-xlnx lkp_test
head:   9ac6b4acf9144465ac1408d4d799635dec0223a0
commit: 79569a88d904a3efdb6a5f054e40344b688ed82e [111/504] staging: net: xilinx: add Xilinx TSN driver
config: nios2-kismet-CONFIG_PTP_1588_CLOCK-CONFIG_XILINX_TSN_QBV-0-0 (https://download.01.org/0day-ci/archive/20250112/202501121402.abxzrFeV-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20250112/202501121402.abxzrFeV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501121402.abxzrFeV-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for PTP_1588_CLOCK when selected by XILINX_TSN_QBV
   WARNING: unmet direct dependencies detected for PTP_1588_CLOCK
     Depends on [n]: NET [=y] && POSIX_TIMERS [=n]
     Selected by [y]:
     - XILINX_TSN_PTP [=y] && STAGING [=y] && NET_VENDOR_XILINX [=y] && XILINX_TSN [=y]
     - XILINX_TSN_QBV [=y] && STAGING [=y] && NET_VENDOR_XILINX [=y] && XILINX_TSN_PTP [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
