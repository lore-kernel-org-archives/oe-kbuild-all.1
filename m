Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 908D816A92E
	for <oe-kbuild-all@lists.linux.dev>; Tue,  1 Oct 2024 08:15:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727770507; cv=none; b=fIcGFzPckoQTyn8MCEOwoql4cT711qGPuZt/j0QHvvOtLTLL4mRf/390nvdWwo5eztNpMd2NQzZB+Pc/Pj1Sda4LeWkicH+Hj7eJU0g9o6QLizjph29N9KGL9D9ex4Fmu1ljbEokqYlMOyp0I/5mixpgreSQVqs/Ht1qgpSoHYQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727770507; c=relaxed/simple;
	bh=3WQUZIVmVMhIFHnorCAed8ZvaApAE2u0vMsjjXq7dc0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=E3CIZ+YR0tFjcGnDarXPzZrz3iuYSdWISkD85SfEMLHnYH9ocVasxNhwhppogB6MXsoHIR4wO5lGW7D+DxMfPVS2WGinFYaPZoQVT66ne+3iDsqcPc7P16hMPPzYuwj3wwANUlmDUiPKqyk/mltk38uDt8yUpjlxggQzXwuChm4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VjNkxp6t; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VjNkxp6t"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727770506; x=1759306506;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=3WQUZIVmVMhIFHnorCAed8ZvaApAE2u0vMsjjXq7dc0=;
  b=VjNkxp6taiGVttN9iUUDL1482McIfhRZBRrlf/4bZe2wNyCW+OxXUShx
   Tns7lo7ZJ+kK139XxuiyZwg0fdwlJQsb09asd9oLWxf0FEFA8XvpMwEkd
   RNRwhwQp2+4a4NmkGVB1zHw81bk9YhdtEHpcXtz4kqgypROreUG/ZGsDG
   znYTZfj4ThkMAJONywN8aeodsPEGL4KRSuuy565PhSAu95rxY6EMxvOko
   9Q/TkTOjWoEGBIcHTzVHQqXNLS2u0942nygaMYspgWNk9H9Egv8q/k8+W
   RTRvdElF2VSjVXjGclQgYd3CQikD8Nzr3O3cDok3iJkhI2hePwFz3vHgl
   g==;
X-CSE-ConnectionGUID: VHSmXISFRyugNKHHX6PVUA==
X-CSE-MsgGUID: gEZQN/VYQECa0KM9GVv42w==
X-IronPort-AV: E=McAfee;i="6700,10204,11211"; a="37448311"
X-IronPort-AV: E=Sophos;i="6.11,167,1725346800"; 
   d="scan'208";a="37448311"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Oct 2024 01:15:03 -0700
X-CSE-ConnectionGUID: l28EGYOURPSkpq5X5WcHfA==
X-CSE-MsgGUID: UFlc3dKpSyC0KzWe4EFKqw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,167,1725346800"; 
   d="scan'208";a="73907534"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 01 Oct 2024 01:15:01 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1svY27-000QQ3-0U;
	Tue, 01 Oct 2024 08:14:59 +0000
Date: Tue, 1 Oct 2024 16:14:11 +0800
From: kernel test robot <lkp@intel.com>
To: Jai Luthra <j-luthra@ti.com>
Cc: oe-kbuild-all@lists.linux.dev, vigneshr@ti.com, nm@ti.com,
	Praneeth Bajjuri <praneeth@ti.com>,
	Manorit Chawdhry <m-chawdhry@ti.com>
Subject: [ti:ti-rt-linux-6.6.y-cicd 92/339] kismet: WARNING: unmet direct
 dependencies detected for GENERIC_PHY_MIPI_DPHY when selected by
 VIDEO_CADENCE_CSI2RX
Message-ID: <202410011607.3AdTrl6l-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git ti-rt-linux-6.6.y-cicd
head:   d05688f353d10af170286db56535443184202eab
commit: 7149fb6fface964718d99db0070c5cc5a2bae81a [92/339] media: platform: cadence: select MIPI_DPHY dependency
config: openrisc-kismet-CONFIG_GENERIC_PHY_MIPI_DPHY-CONFIG_VIDEO_CADENCE_CSI2RX-0-0 (https://download.01.org/0day-ci/archive/20241001/202410011607.3AdTrl6l-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20241001/202410011607.3AdTrl6l-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410011607.3AdTrl6l-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for GENERIC_PHY_MIPI_DPHY when selected by VIDEO_CADENCE_CSI2RX
   WARNING: unmet direct dependencies detected for GENERIC_PHY_MIPI_DPHY
     Depends on [n]: GENERIC_PHY [=n]
     Selected by [y]:
     - VIDEO_CADENCE_CSI2RX [=y] && MEDIA_SUPPORT [=y] && MEDIA_PLATFORM_SUPPORT [=y] && MEDIA_PLATFORM_DRIVERS [=y] && VIDEO_DEV [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
