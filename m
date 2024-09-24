Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EFB11B85D6
	for <oe-kbuild-all@lists.linux.dev>; Tue, 24 Sep 2024 02:43:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727145839; cv=none; b=ccgMTGgL5GQcjXfSauabGF7JXHgfqwj+4/11HENv7OPgsY+NYEc84YIpJ4W1OfLueXp3E4eb3QjOuc6Tz34PXXpW20vBjKbs1VA6N6enCONVe6hmsF6uvrJNEGbZEtFiP7jOGEZMFf4AKT0ySQxeo6nOzwfc4r6mhNdbgsv8Hh4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727145839; c=relaxed/simple;
	bh=Jdt254b4XGb7dQcMn41ojkWPoC39l5mlR2xsI0s+kLE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=V5lmLXU7Se4ar1w2aT9ZBLuAhTOBWvGsI9EpQ59MvW5pWFct67ngpco3mB0sJqPPdMll/GwvKXdqNk4ZrcYYHxOKSWhDk+07hglifwLoShcYGEnc2XNOcogJCrpPZ/BGDvK16j/TpeR9x3mFo3m/8Yvw/55yV7nt2HdZExoFL4E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fq8VGgOy; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fq8VGgOy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727145837; x=1758681837;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Jdt254b4XGb7dQcMn41ojkWPoC39l5mlR2xsI0s+kLE=;
  b=fq8VGgOyymTQppSc/ceNcn8yCv0dRRBJlWX+Kr5vjaZb97EdyfWJrw/1
   dPvT88Lmy1yYlqSPVc6BVyaB1WPT28+cpENGmSxW7+hD4l/n/Eq51/syi
   zIxNB3yDsLLZ7ft1sIvRa+w/hJyh+7fnBUtPR8H2GmGD9/O5KJHg8tYJl
   IePXCaCe75VZlXqnSHPa5eiUQQ/+cOuq4ZRLkseQ6X+prO05BdZLh9cPu
   T4jpj31sRe4hzBFsE33GheWi5I8BQaBOXaJJI+J2FZIfbTESIx4h4wIqx
   t8L7RU4CJT7GN+BPtlFghN8ELmH7RCJbrV4RTt00wumu24Zu89LB5ATAy
   w==;
X-CSE-ConnectionGUID: eVBfhyFlQ4qxQnzrYs8eoA==
X-CSE-MsgGUID: 7gbIS14LTnumYA8iDvutfg==
X-IronPort-AV: E=McAfee;i="6700,10204,11204"; a="51538600"
X-IronPort-AV: E=Sophos;i="6.10,253,1719903600"; 
   d="scan'208";a="51538600"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2024 19:43:56 -0700
X-CSE-ConnectionGUID: bhHy0ZXVSdaCnpXHECB8Kw==
X-CSE-MsgGUID: K3PyHoWzQt6OgfUQB+aoew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,253,1719903600"; 
   d="scan'208";a="71701200"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 23 Sep 2024 19:43:55 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ssvWq-000Hph-1Q;
	Tue, 24 Sep 2024 02:43:52 +0000
Date: Tue, 24 Sep 2024 10:43:31 +0800
From: kernel test robot <lkp@intel.com>
To: Martin =?utf-8?Q?Povi=C5=A1er?= <povik+lin@cutebit.org>
Cc: Paul Gazzillo <paul@pgazz.com>,
	Necip Fazil Yildiran <fazilyildiran@gmail.com>,
	oe-kbuild-all@lists.linux.dev, Janne Grunau <j@jannau.net>
Subject: [asahilinux:bits/070-audio 11/120] kismet: WARNING: unmet direct
 dependencies detected for SND_SOC_TAS2764 when selected by
 SND_SOC_APPLE_MACAUDIO
Message-ID: <202409241026.Z6j4dUMu-lkp@intel.com>
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
config: arm64-kismet-CONFIG_SND_SOC_TAS2764-CONFIG_SND_SOC_APPLE_MACAUDIO-0-0 (https://download.01.org/0day-ci/archive/20240924/202409241026.Z6j4dUMu-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20240924/202409241026.Z6j4dUMu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409241026.Z6j4dUMu-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for SND_SOC_TAS2764 when selected by SND_SOC_APPLE_MACAUDIO
   WARNING: unmet direct dependencies detected for SND_SOC_CS42L83
     Depends on [n]: SOUND [=y] && SND [=y] && SND_SOC [=y] && I2C [=n]
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
