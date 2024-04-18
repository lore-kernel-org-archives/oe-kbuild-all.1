Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E5B616F855
	for <oe-kbuild-all@lists.linux.dev>; Thu, 18 Apr 2024 17:18:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713460740; cv=none; b=A94AXq40ln4pytlMWqnaYriTmF7jayY0BG3MlDl9BgXU9De7k577Ej9TL7IePzpU3afR3VYttvFVoA98uUgutNcYMHeqrXHBKjw8aYjDU9D0vVdGRCR5YuoGZHiH0Ma9xKgDIPTLKhessfSalg4si3+OmruiprafLPCxXswb2y4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713460740; c=relaxed/simple;
	bh=F6oNdtYoYxI6V0mztQhj6XmfpJuo5TGKVpHtwTaY9zI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=s06qbcIGlUSAFqfiUfnqqI9PHMce5ki3aAZiTMANrMcnrEdWBhPcakWoIx0uodixZlecWy0G4OyU88d75cHPKPOeyktoM3TMr+UWs5vWwC0shYAHWZxGDSo4zZil0LSntGqJ5DBhlDU0W5S0+7hlOH9qWSejWspNgvl2izhERqE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nLvFNKxz; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nLvFNKxz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713460740; x=1744996740;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=F6oNdtYoYxI6V0mztQhj6XmfpJuo5TGKVpHtwTaY9zI=;
  b=nLvFNKxzejPA7u5UsTWVw6bH0dlGtyTfT78Cbj7QlqztOXBHLSe4PATU
   JTFqfY8q8xA/Nme+ndFloWETjOJEFW9tXj6K4X4bd0cOARvrD1Lj2uTSb
   NIS0/dbW97rJI3OXqufKwf263aB++n9la5ef3T/M4Bu4jPqbo9y0+wCGW
   kj2T4vJYyzhjSG/HSbrfpvawx+oaDr6aDenJcV/FJmXv0mJoTv1Jty5pu
   0FA/RDS82qrNzSmOxQCKV4fyC5yKoiraLZtWvOoDVRlI9x10qzKt3j9WA
   87/+JtQE/1EdacSI+hVR4xKdUbiB0gpbWjTz24lEVwLGa3+r9wcOXpfWz
   w==;
X-CSE-ConnectionGUID: a+sPX+ecQWONBvXlSn5KmQ==
X-CSE-MsgGUID: WDMp+THbTIauJTKCwzNrsg==
X-IronPort-AV: E=McAfee;i="6600,9927,11047"; a="9185177"
X-IronPort-AV: E=Sophos;i="6.07,212,1708416000"; 
   d="scan'208";a="9185177"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Apr 2024 10:18:48 -0700
X-CSE-ConnectionGUID: JpUf9Sn2RsqisgQsojNnoQ==
X-CSE-MsgGUID: FbQqpfqmS8K432dt/W/soQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,212,1708416000"; 
   d="scan'208";a="46340515"
Received: from unknown (HELO 23c141fc0fd8) ([10.239.97.151])
  by fmviesa002.fm.intel.com with ESMTP; 18 Apr 2024 10:18:45 -0700
Received: from kbuild by 23c141fc0fd8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rxVPG-00090S-0s;
	Thu, 18 Apr 2024 17:18:42 +0000
Date: Fri, 19 Apr 2024 01:17:59 +0800
From: kernel test robot <lkp@intel.com>
To: Lucas Stach <l.stach@pengutronix.de>
Cc: Paul Gazzillo <paul@pgazz.com>,
	Necip Fazil Yildiran <fazilyildiran@gmail.com>,
	oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Vinod Koul <vkoul@kernel.org>,
	Marco Felsch <m.felsch@pengutronix.de>,
	Adam Ford <aford173@gmail.com>
Subject: [linux-next:master 1892/6937] kismet: WARNING: unmet direct
 dependencies detected for PHY_FSL_SAMSUNG_HDMI_PHY when selected by
 DRM_IMX8MP_DW_HDMI_BRIDGE
Message-ID: <202404190103.lLm8LtuP-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   7b4f2bc91c15fdcf948bb2d9741a9d7d54303f8d
commit: 6ad082bee9025fa8e0ef8ee478c5a614b9db9e3d [1892/6937] phy: freescale: add Samsung HDMI PHY
config: arm-kismet-CONFIG_PHY_FSL_SAMSUNG_HDMI_PHY-CONFIG_DRM_IMX8MP_DW_HDMI_BRIDGE-0-0 (https://download.01.org/0day-ci/archive/20240419/202404190103.lLm8LtuP-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20240419/202404190103.lLm8LtuP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404190103.lLm8LtuP-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for PHY_FSL_SAMSUNG_HDMI_PHY when selected by DRM_IMX8MP_DW_HDMI_BRIDGE
   WARNING: unmet direct dependencies detected for SC_GCC_8280XP
     Depends on [n]: COMMON_CLK [=y] && COMMON_CLK_QCOM [=y] && (ARM64 || COMPILE_TEST [=n])
     Selected by [y]:
     - SC_CAMCC_8280XP [=y] && COMMON_CLK [=y] && COMMON_CLK_QCOM [=y]
   
   WARNING: unmet direct dependencies detected for PHY_FSL_SAMSUNG_HDMI_PHY
     Depends on [n]: (ARCH_MXC [=y] && ARM64 || COMPILE_TEST [=n]) && OF [=y] && HAS_IOMEM [=y] && COMMON_CLK [=y]
     Selected by [y]:
     - DRM_IMX8MP_DW_HDMI_BRIDGE [=y] && HAS_IOMEM [=y] && DRM [=y] && DRM_BRIDGE [=y] && (ARCH_MXC [=y] || COMPILE_TEST [=n]) && OF [=y] && COMMON_CLK [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
