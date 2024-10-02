Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEF5518787F
	for <oe-kbuild-all@lists.linux.dev>; Wed,  2 Oct 2024 19:31:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727897498; cv=none; b=tpT4Mh66c+ml5uNFnIKK/2tXq46vYC5j32jemcBkwL6/sZkZHNL13D+0QDkw1pWq8b0Ieuv5v2oIWdamjNblufkg4KxH6YDtk5KHC6sRNe2Z34P79WT+F3oEK0zHCextqish37s3ZZg1cAbql0EKEZlMxVvs1jQNnad7TlahbeE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727897498; c=relaxed/simple;
	bh=kpZEc9fsRUmPFhwwBB+GNb/AhvUaubvMwetIZI/fRLQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=DBvU+mCX741KVBX2OvZ10/Y1vve7zWA/5KFixZYou6SPujMQRe1zvbOmLylCr/7aCdgJMMqFNowGsz8GPj2jABeEUAtX2F9cAj5yGlKwKrbh5h1Vd9qX0nlmYMiBaDjF4oyZYCdkCbdJoHBPM+tDyM+mx0meBeF+WC/l9e5TXmM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bK1KC3Zd; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bK1KC3Zd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727897497; x=1759433497;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=kpZEc9fsRUmPFhwwBB+GNb/AhvUaubvMwetIZI/fRLQ=;
  b=bK1KC3ZdovS74ETHKizdoVbUBV1wz645B+/AXcmNcpuOOq2bL33IjhtO
   SExrF8trJg/80b131XDLgjlxFkvN2JA7NvAVBI8TotVVgGzD+V9mHR3Ai
   PiYIjLIafbkJRuqn9IehwNBUF+/nGJg/h83i3cdNogY95JXafHnCEnehK
   9Np9fBYXhxrR51/r/RichJnqLZn4lWFKHSeolsucLSwnv4VSDc1Hw24Pq
   DyUrN3FYJm1BbaOSKXjuTTSFHxahetWIU5ZF63UeOQ7Em3MoLrQpAXOas
   0hsbSmD3cDALkXV1krqOnRZZ3LY6yNOpObUB/dGBLXSk4ioaIyUb1WJkW
   A==;
X-CSE-ConnectionGUID: 4WW1EWwNR2qhLrFSWuIf0A==
X-CSE-MsgGUID: jeaCrv6zQaydweUAo274Pg==
X-IronPort-AV: E=McAfee;i="6700,10204,11213"; a="26948159"
X-IronPort-AV: E=Sophos;i="6.11,172,1725346800"; 
   d="scan'208";a="26948159"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Oct 2024 12:31:35 -0700
X-CSE-ConnectionGUID: t2JAqCY9QQKXZq11F1oP8A==
X-CSE-MsgGUID: wow0S26OTKKC21McUUP+aA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,172,1725346800"; 
   d="scan'208";a="111559852"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 02 Oct 2024 12:31:33 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sw54N-000UUN-0N;
	Wed, 02 Oct 2024 19:31:31 +0000
Date: Thu, 3 Oct 2024 03:30:49 +0800
From: kernel test robot <lkp@intel.com>
To: Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Paul Gazzillo <paul@pgazz.com>,
	Necip Fazil Yildiran <fazilyildiran@gmail.com>,
	oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: [linux-next:master 789/2025] kismet: WARNING: unmet direct
 dependencies detected for DRM_BRIDGE_CONNECTOR when selected by
 DRM_IMX_PARALLEL_DISPLAY
Message-ID: <202410030347.Lfbcw0tG-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   fe21733536749bb1b31c9c84e0b8d2ab8d82ce13
commit: f673055a46784ccea04465b9213e999f7bc5187e [789/2025] drm/imx: Add missing DRM_BRIDGE_CONNECTOR dependency
config: x86_64-kismet-CONFIG_DRM_BRIDGE_CONNECTOR-CONFIG_DRM_IMX_PARALLEL_DISPLAY-0-0 (https://download.01.org/0day-ci/archive/20241003/202410030347.Lfbcw0tG-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20241003/202410030347.Lfbcw0tG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410030347.Lfbcw0tG-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for DRM_BRIDGE_CONNECTOR when selected by DRM_IMX_PARALLEL_DISPLAY
   WARNING: unmet direct dependencies detected for DRM_BRIDGE_CONNECTOR
     Depends on [n]: HAS_IOMEM [=y] && DRM [=y] && DRM_DISPLAY_HELPER [=n]
     Selected by [y]:
     - DRM_IMX_PARALLEL_DISPLAY [=y] && HAS_IOMEM [=y] && DRM [=y] && DRM_IMX [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
