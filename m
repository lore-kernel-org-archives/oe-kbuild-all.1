Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AEDE217F3F
	for <oe-kbuild-all@lists.linux.dev>; Fri, 25 Oct 2024 22:30:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729895437; cv=none; b=De+JiBIZPPBW7mQfv5YihPk8I1/cx9+YpYvwlcwd6VArLV441aQ3d9vzdapvcR/i/NkcxRMrFuUfCpu6EaysjyIdQKsURFD2hgFtPjWopo8dK6jfhCiqKbxUGmlXxRi0dLTam0pOL48FDA6ZqMPUfTxRuR9OxsFyXuFY/eHRp80=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729895437; c=relaxed/simple;
	bh=8PL5e8mtr8DW1DjoQ3NRdAa0Tmeo1V6mcLl6+yuHA6Y=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=uuLbN0/Hgm/IhYu1Jnqov6RiXb4BPeTPUpq4tW26y806gTMnaQRkV7Y4yt6I+YmGCV81Km5OPSO5EKZ2Cv4elTujtwC1YGZbK8KlaSDCTf5+0u+ZvUiTrtSa71FSbNLh5Ra2LZPhzL8DvzQnhASNzTz/SbXuq89JYokIH2o/VNU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VHkR/bZq; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VHkR/bZq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729895435; x=1761431435;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=8PL5e8mtr8DW1DjoQ3NRdAa0Tmeo1V6mcLl6+yuHA6Y=;
  b=VHkR/bZqc0/kjpDhwuwvXGW5mJz/6KGOr3UxzQhXvjF6B1gMRRrUsWLp
   PVhZlpnllzqRkUgDMKCS8AQWqCesQpilec2LpDUJPDHNDRhLOUJmTemrS
   TN2iBfKdV1bhRh6xc/azY34bb/e8ZjfB0H+MPOoLmhv40EVfiqohsBwz+
   lo6qQq8ObpRgRJu2Xjbnx1QDXP1TbyySKqan6oJXHLKr0Vr5DdIWSZM8R
   QuXuu+NM2s2PvcqkwxL39fnZIRRgmkVeKtydanNghwEYxaa/H4SNXpKkP
   ebWXHiVz7ZSFA6nY/NOLTcIntME4+rXkh3qxA2v9W2sbtZdV+o3B2SvF5
   g==;
X-CSE-ConnectionGUID: RlLmkoF3Ry+hicuEgIH4DQ==
X-CSE-MsgGUID: v638XHd6TMmYmK4kEwLeTA==
X-IronPort-AV: E=McAfee;i="6700,10204,11236"; a="40161005"
X-IronPort-AV: E=Sophos;i="6.11,233,1725346800"; 
   d="scan'208";a="40161005"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Oct 2024 15:30:35 -0700
X-CSE-ConnectionGUID: OxS/rHqpQhm6DbHW2tl33A==
X-CSE-MsgGUID: SXxCGy6QQhuUbewSps5WKw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="85824038"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 25 Oct 2024 15:30:33 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t4SpD-000Yz6-0l;
	Fri, 25 Oct 2024 22:30:31 +0000
Date: Sat, 26 Oct 2024 06:29:36 +0800
From: kernel test robot <lkp@intel.com>
To: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Cc: oe-kbuild-all@lists.linux.dev, Maxime Ripard <mripard@kernel.org>,
	Algea Cao <algea.cao@rock-chips.com>
Subject: [linux-next:master 4481/7183]
 .tmp_gl_dw_hdmi_qp-rockchip.o:undefined reference to `__udivdi3'
Message-ID: <202410260625.ARIyt2GI-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   a39230ecf6b3057f5897bc4744a790070cfbe7a8
commit: 128a9bf8ace290d86d2805c06f3b0e4cfab75de0 [4481/7183] drm/rockchip: Add basic RK3588 HDMI output support
config: microblaze-allyesconfig (https://download.01.org/0day-ci/archive/20241026/202410260625.ARIyt2GI-lkp@intel.com/config)
compiler: microblaze-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241026/202410260625.ARIyt2GI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410260625.ARIyt2GI-lkp@intel.com/

All errors (new ones prefixed by >>):

   microblaze-linux-ld: drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.o: in function `dw_hdmi_qp_rockchip_encoder_enable':
>> .tmp_gl_dw_hdmi_qp-rockchip.o:(.text+0x2c4): undefined reference to `__udivdi3'

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for GET_FREE_REGION
   Depends on [n]: SPARSEMEM [=n]
   Selected by [y]:
   - RESOURCE_KUNIT_TEST [=y] && RUNTIME_TESTING_MENU [=y] && KUNIT [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
