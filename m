Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66BD417543
	for <oe-kbuild-all@lists.linux.dev>; Mon, 23 Sep 2024 10:51:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727088709; cv=none; b=RGu2UoZLGnppPULTKAvZWUtyW8yem9hKqjrr7Ars3Xt5tVIVNp/l5ERBDe2CVWTAISaHbhZLm1mSVV/GmzPXSfSjB9OykFM1dw1PKKp1JTRwL/dWp5LQrnGsvlMudNFlQQrtQguptiZhM1+prYLmxJBkpp2EcgFP6aO3HMpLrTY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727088709; c=relaxed/simple;
	bh=e2Yaig/iJ1AkGOtc0f6h04krWBM3wR68mWcQbs+0+xg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=rGa79kiNfUDiU7zufJNrxfyEYy3PLRrr+iT+cynHu3TVjicTDVG0lqY41uXXNidsO1hmYTRIwrH9gid5Wi7p0YOyv3V9CSTNDCexociVQ7KpahOw4HpaZEv3JwHeQU4ndmh30jA+/HlrebkJhE7+oczYJ/DkpZQHl68rnFkofXc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JjsVbRIo; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JjsVbRIo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727088707; x=1758624707;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=e2Yaig/iJ1AkGOtc0f6h04krWBM3wR68mWcQbs+0+xg=;
  b=JjsVbRIov7F9YDWDF+U+mtC0bsU3g85pgEV58OOGzBWxsyaqi2vhH2NJ
   eXTGOWwlE8cn6bXoGZXX3mseRDHfshGcstpaF5Hh3HRRkfC4365RgqMzf
   kgU/t8NDpypSKJ186pv9keypuI3tXaFqciQrgwHK01GdwXn+Y7WEkpYVH
   PZ+zWhzdIyNHtkYKNX+1yJjE8PRTA0NPv++KiBXnfDK6WR3omgIFbqx+6
   xP4AOPXMpjHLa3YonQkwjapt/stzUfGT4XbDKO8wpDAtKYa6V/2AhR11S
   wsk3bav7D0w146clRLCe8hqbVzbjmCnBvyhIpmWsgjK5E7JJX2ex5Temy
   w==;
X-CSE-ConnectionGUID: 46YmPqdhTcyUIR+FXiAi0A==
X-CSE-MsgGUID: MFeqjGqcQTOELAxSNmmGag==
X-IronPort-AV: E=McAfee;i="6700,10204,11202"; a="26124698"
X-IronPort-AV: E=Sophos;i="6.10,251,1719903600"; 
   d="scan'208";a="26124698"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2024 03:51:22 -0700
X-CSE-ConnectionGUID: dTRn7zA9RT+aqqg6VCUhoA==
X-CSE-MsgGUID: kI/N9FrMQ4ep2rWYz2nRMQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,251,1719903600"; 
   d="scan'208";a="75971512"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 23 Sep 2024 03:51:20 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ssgf0-000H7q-1T;
	Mon, 23 Sep 2024 10:51:18 +0000
Date: Mon, 23 Sep 2024 18:50:56 +0800
From: kernel test robot <lkp@intel.com>
To: Martin =?utf-8?Q?Povi=C5=A1er?= <povik+lin@cutebit.org>
Cc: Paul Gazzillo <paul@pgazz.com>,
	Necip Fazil Yildiran <fazilyildiran@gmail.com>,
	oe-kbuild-all@lists.linux.dev, Janne Grunau <j@jannau.net>
Subject: [asahilinux:bits/070-audio 11/120] kismet: WARNING: unmet direct
 dependencies detected for APPLE_ADMAC when selected by
 SND_SOC_APPLE_MACAUDIO
Message-ID: <202409231824.lVNIG3hC-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/AsahiLinux/linux bits/070-audio
head:   79e5f455d8c4ad8e5ba25ab4ec5945bdce3d1a91
commit: 5c35f3969b33f8ef71a7a03aa86ea3c285a7552f [11/120] ASoC: apple: Add macaudio machine driver
config: arm64-kismet-CONFIG_APPLE_ADMAC-CONFIG_SND_SOC_APPLE_MACAUDIO-0-0 (https://download.01.org/0day-ci/archive/20240923/202409231824.lVNIG3hC-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20240923/202409231824.lVNIG3hC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409231824.lVNIG3hC-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for APPLE_ADMAC when selected by SND_SOC_APPLE_MACAUDIO
   WARNING: unmet direct dependencies detected for SND_SOC_CS42L83
     Depends on [n]: SOUND [=y] && SND [=y] && SND_SOC [=y] && I2C [=n]
     Selected by [y]:
     - SND_SOC_APPLE_MACAUDIO [=y] && SOUND [=y] && SND [=y] && SND_SOC [=y] && (ARCH_APPLE [=y] || COMPILE_TEST [=n])
   
   WARNING: unmet direct dependencies detected for APPLE_ADMAC
     Depends on [n]: DMADEVICES [=n] && (ARCH_APPLE [=y] || COMPILE_TEST [=n])
     Selected by [y]:
     - SND_SOC_APPLE_MACAUDIO [=y] && SOUND [=y] && SND [=y] && SND_SOC [=y] && (ARCH_APPLE [=y] || COMPILE_TEST [=n])
   
   WARNING: unmet direct dependencies detected for SND_SOC_TAS2764
     Depends on [n]: SOUND [=y] && SND [=y] && SND_SOC [=y] && I2C [=n]
     Selected by [y]:
     - SND_SOC_APPLE_MACAUDIO [=y] && SOUND [=y] && SND [=y] && SND_SOC [=y] && (ARCH_APPLE [=y] || COMPILE_TEST [=n])
   
   WARNING: unmet direct dependencies detected for SND_SOC_TAS2770
     Depends on [n]: SOUND [=y] && SND [=y] && SND_SOC [=y] && I2C [=n]
     Selected by [y]:
     - SND_SOC_APPLE_MACAUDIO [=y] && SOUND [=y] && SND [=y] && SND_SOC [=y] && (ARCH_APPLE [=y] || COMPILE_TEST [=n])

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
