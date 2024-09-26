Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC01215B543
	for <oe-kbuild-all@lists.linux.dev>; Thu, 26 Sep 2024 20:42:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727383365; cv=none; b=DpH5ZAa0tEVyjMhHGSnJJeDUw4t0YWF6BQ5cT/Os/ibToWoXIl/E1tMViivAXVdmoNNgn4UYbq5KUpGFVr4c5midMcIylKyAaU9kArsA2p4S1w6AIgW7sFDUpirRF/25Q5Rmw1Qj4V9DSEag65nsCZGuGQyLopy5lG5Me/Nmkv4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727383365; c=relaxed/simple;
	bh=14wRSg/2y16ccuejLI68J87uo/D1IRgi0UoTJ2Vncdw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=fEsuHSATQv+42g3WU5HU3K6qK6aWXUsfqaH9lUL1yDKdTvZyshQpWXxJQQDqozPORjvqYrzz1GdyENu7hS54c07HTnrzifQeFpP3zQGqQFia98SQffr4nZTgMx8DCDAhq9PsgiLBBk+5PUJBKg4UQ1DguehbO+exvLhCIr61WZ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YZOKs6n5; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YZOKs6n5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727383363; x=1758919363;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=14wRSg/2y16ccuejLI68J87uo/D1IRgi0UoTJ2Vncdw=;
  b=YZOKs6n54qcpPnlBesQ2/S0iLI7BRvUQeXODH+RSvJJV7Rc0XmBy/x/x
   dWzqBWl52V/2w4K7Xa3Wb1NiHyHrumFeFItfGO8tEcJaAa7MW2Bu1rYxe
   JF7j7c6QXbyvvg0EzecwChlt54HOpoQxP+ggazMTSBzhQWrH4P/U4+w6E
   ucOku4PLujuYLhYSGkB0vP9Qsks8jcdV3fO0gTioB3uSn84BJ9pNEcoww
   1APYLm65cRa+igBNwKoNcIkIQlMqqtScvnC6klqdVIg4CBdVIHPxZaB4r
   D4qovo/QPB86fM2EdeI2y9E6jz0tGvmoBmUKbSjw20A1cnevYFHmP+buA
   w==;
X-CSE-ConnectionGUID: zrSS2iaOTyuK6gXZb1clRg==
X-CSE-MsgGUID: G+SYJthLRXqa493y9Ym19w==
X-IronPort-AV: E=McAfee;i="6700,10204,11207"; a="25981676"
X-IronPort-AV: E=Sophos;i="6.11,156,1725346800"; 
   d="scan'208";a="25981676"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Sep 2024 13:42:43 -0700
X-CSE-ConnectionGUID: tpPwMKm+QZi5JbWyBGUD0Q==
X-CSE-MsgGUID: SMem/xFSQl+XpV6N/iWYYg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,156,1725346800"; 
   d="scan'208";a="71970894"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 26 Sep 2024 13:42:42 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1stvJv-000LBB-21;
	Thu, 26 Sep 2024 20:42:39 +0000
Date: Fri, 27 Sep 2024 04:41:53 +0800
From: kernel test robot <lkp@intel.com>
To: Jisheng Zhang <jszhang@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, Drew Fustini <dfustini@tenstorrent.com>,
	Emil Renner Berthing <emil.renner.berthing@canonical.com>,
	linux-doc@vger.kernel.org
Subject: [pdp7:b4/th1520-dwmac 10/12] htmldocs: Warning: MAINTAINERS
 references a file that doesn't exist:
 Documentation/devicetree/bindings/net/thead,dwmac.yaml
Message-ID: <202409270406.No2vpr3D-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/pdp7/linux b4/th1520-dwmac
head:   c4e5c0b7aa139b5a6bfc8f2a3f6f6901d3dfcac3
commit: 0c2865dfa6aa9fb67ef9b12cf723cce6fa46e959 [10/12] dt-bindings: net: Add T-HEAD dwmac support
reproduce: (https://download.01.org/0day-ci/archive/20240927/202409270406.No2vpr3D-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409270406.No2vpr3D-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Warning: Documentation/devicetree/bindings/regulator/siliconmitus,sm5703-regulator.yaml references a file that doesn't exist: Documentation/devicetree/bindings/mfd/siliconmitus,sm5703.yaml
   Warning: Documentation/hwmon/g762.rst references a file that doesn't exist: Documentation/devicetree/bindings/hwmon/g762.txt
   Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/reserved-memory/qcom
   Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/misc/fsl,qoriq-mc.txt
>> Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/net/thead,dwmac.yaml
   Using alabaster theme

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
