Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 134E58C1F
	for <oe-kbuild-all@lists.linux.dev>; Sat, 14 Sep 2024 04:00:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726286441; cv=none; b=EpjnfpCa07QQj0OnQnxz4qqcrwPU9PdF7sWNOon2IZf6zzuN0k1XlPASWOjKYYmbaTT3tti7s/3pvxJVjo4PGj3MIap78UMELL8vr1LlucLzacCN48oEVlB+n6EDuxZMpt9XbAeiMckfZKLIMTXpE0fjV5pxBvDLyeb1aIliY1c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726286441; c=relaxed/simple;
	bh=mr8BthVO3xbpsTK2eqfaU78eSzcg0ipfjQZujebvIco=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=WeGu0lWOnwVYlaP8X4ONQi2kDrBvsbKlkkDSXxSHNzZJM68YY94cj47Sxt0OC+QWs8yzvnkK6urq2bU2xpQalMUIPFMOw1iR+VWsiG5JkHZEQELD2WgpP9eD3ScD3ohEjKfGC8HyZFzQEnyKDR6H7/4kxmfw/bipnqHLw6asHBk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aa3pnapq; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aa3pnapq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726286441; x=1757822441;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=mr8BthVO3xbpsTK2eqfaU78eSzcg0ipfjQZujebvIco=;
  b=aa3pnapqL5B4o5069RUVTcyTQ7hdZfOUbeeg/VWGwXEg8KnvpSWzLmPL
   Cl4nOnM7TAZrGblCN2L41OQS/gOX/1JwNnYUL8LXHuyj38E+1GfMaHZVa
   YHJ9S1JpOQ7CM8/wJ2I7rW8j8eFHyvTykCimmq6X8EmckuM4z71EDXeBy
   Q6Grv/GUDxIY15eE9x7Y3BRSCuLCZJrWY0vVRlnsZq5UUp+gkl/tFpaP+
   u383kSeR/xXjNAPD/poKeGalrjhAwmU4LMzlkuzvKaZ5bZUdsGSWZtGQr
   9vbYCgcntGDvH5uTRs6tKnIZp1Fq7aivOPzE2r6gTrhsXsm3fuqKh/8fX
   Q==;
X-CSE-ConnectionGUID: XLkII2bqTyaHfxt9NCoq2g==
X-CSE-MsgGUID: ipC9MDfaRoGXBY7nOaHLRQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11194"; a="28944398"
X-IronPort-AV: E=Sophos;i="6.10,228,1719903600"; 
   d="scan'208";a="28944398"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Sep 2024 21:00:40 -0700
X-CSE-ConnectionGUID: tIO4vhGhRoy6/PUuEP/Y8w==
X-CSE-MsgGUID: Gc7J6yMdR/W4P8PhupgOTA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,228,1719903600"; 
   d="scan'208";a="73119090"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 13 Sep 2024 21:00:38 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1spJxc-0007LS-1J;
	Sat, 14 Sep 2024 04:00:36 +0000
Date: Sat, 14 Sep 2024 11:59:41 +0800
From: kernel test robot <lkp@intel.com>
To: Hardik T Shah <hardik.t.shah@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, "Pan, Kris" <kris.pan@intel.com>
Subject: [intel-lts:4.19/android_s 825/30000] kismet: WARNING: unmet direct
 dependencies detected for SND_SOC_SVFPGA when selected by SND_SOC_SVFPGA_SDW
Message-ID: <202409141122.JdI2ZY4B-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/intel/linux-intel-lts.git 4.19/android_s
head:   84d5fc421289417e51781e27e64fbb0fc44216ae
commit: d7a49dd5fcce1d2295e1c63f2fbe3802663e4292 [825/30000] ASoC:Codecs: Add support for SV FPGA SoundWire PDM Codec.
config: i386-kismet-CONFIG_SND_SOC_SVFPGA-CONFIG_SND_SOC_SVFPGA_SDW-0-0 (https://download.01.org/0day-ci/archive/20240914/202409141122.JdI2ZY4B-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20240914/202409141122.JdI2ZY4B-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409141122.JdI2ZY4B-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for SND_SOC_SVFPGA when selected by SND_SOC_SVFPGA_SDW
   WARNING: unmet direct dependencies detected for SND_SOC_SVFPGA
     Depends on [n]: SOUND [=y] && !UML && SND [=y] && SND_SOC [=y] && I2C [=n] && SDW [=y]
     Selected by [y]:
     - SND_SOC_SVFPGA_SDW [=y] && SOUND [=y] && !UML && SND [=y] && SND_SOC [=y] && SDW [=y]
   
   WARNING: unmet direct dependencies detected for SND_SOC_SVFPGA
     Depends on [n]: SOUND [=y] && !UML && SND [=y] && SND_SOC [=y] && I2C [=n] && SDW [=y]
     Selected by [y]:
     - SND_SOC_SVFPGA_SDW [=y] && SOUND [=y] && !UML && SND [=y] && SND_SOC [=y] && SDW [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
