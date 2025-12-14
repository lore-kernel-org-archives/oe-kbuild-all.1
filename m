Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BD2F3FC9
	for <oe-kbuild-all@lists.linux.dev>; Sun, 14 Dec 2025 23:01:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765753314; cv=none; b=gJvzcTpAYQn3JBvsbwqO+Ni8lho6OZjG4jJrql5rurLQYjwZ5Cu7s83gaIGixhnYV2+I9kumd9P+4WeniXvjUVX2P8qWhR9CayLSE0V//NPCYISmVHf1QeHyMkrEjBwTcl9J+oZUL9fidSM0ZUdGeKTsBkX1Sk0owHzAa7kyZB4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765753314; c=relaxed/simple;
	bh=jb9mvP1JvxS2yloT1QPRp1P+tBPhUYV3JfIw3EGkuUw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eCxRVfZnSaAT21P0mUb7Eup8d3GlB5WBIc+tGQRTL3se4u8e+aJofI/HlazX2i4FBYSMoRRBHb4bjMO5HfshqkXiajZcmigq4QluqhwTcHbOUXo4I1YvV7UTNa30YRpWwMtLxg9vUW0t39h1N2R2825kQc74POm7pJQldBjlsz0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jaoJWoSk; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jaoJWoSk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765753312; x=1797289312;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=jb9mvP1JvxS2yloT1QPRp1P+tBPhUYV3JfIw3EGkuUw=;
  b=jaoJWoSkUrdccf6yfkUjSwW7ECEy653EyIBmT9hJI/34kus1yYo/ujPl
   ZhVavQdX3lJ8sPVqkKsJvRJ5ZzILBYL8Co+V/tCDHyj4p0z9uglTXUezt
   /Q5w1RetNPVJz7bO40C59z+RnqWaXReE79EAqH1FJljiaOulDgNs5e1J2
   X4Ao7+5fmHYk8Wz6ygoFb8yIIGn0Mj2NVCPs2O9PcmGSTSqi0cu5EeogJ
   My3H3njK/gQADGPdzpZysxw9TISnnZz1V0z2Rh7UhEx/dFqlYHV46qhHj
   A7AjCaMn6PiV45wazDHYOJ7gcp6ttVa3yVJBysKt7KYtxIPKcZvxDl0FD
   w==;
X-CSE-ConnectionGUID: kOVDH2KiSwSSxlkYv2z0yw==
X-CSE-MsgGUID: JYuVx02oRwCAPdppNKnGSw==
X-IronPort-AV: E=McAfee;i="6800,10657,11642"; a="70238937"
X-IronPort-AV: E=Sophos;i="6.21,148,1763452800"; 
   d="scan'208";a="70238937"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Dec 2025 15:01:51 -0800
X-CSE-ConnectionGUID: Ze4ocdacRPq04BQrrvIaoA==
X-CSE-MsgGUID: 7JAoPMglQbOfowAwfS2kDw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,148,1763452800"; 
   d="scan'208";a="196656120"
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a) ([10.211.93.152])
  by orviesa006.jf.intel.com with ESMTP; 14 Dec 2025 15:01:49 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vUv63-000000002UO-2Udr;
	Sun, 14 Dec 2025 23:01:47 +0000
Date: Mon, 15 Dec 2025 00:00:52 +0100
From: kernel test robot <lkp@intel.com>
To: Oder Chiou <oder_chiou@realtek.com>
Cc: Paul Gazzillo <paul@pgazz.com>,
	Necip Fazil Yildiran <fazilyildiran@gmail.com>,
	oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v9 2/2] ASoC: rt5575: Add the codec driver for the ALC5575
Message-ID: <202512150010.v3tY6v3H-lkp@intel.com>
References: <20251211110130.2925541-3-oder_chiou@realtek.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251211110130.2925541-3-oder_chiou@realtek.com>

Hi Oder,

kernel test robot noticed the following build warnings:

[auto build test WARNING on broonie-sound/for-next]
[also build test WARNING on linus/master v6.16-rc1 next-20251212]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Oder-Chiou/ASoC-dt-bindings-realtek-rt5575-add-support-for-ALC5575/20251211-190355
base:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next
patch link:    https://lore.kernel.org/r/20251211110130.2925541-3-oder_chiou%40realtek.com
patch subject: [PATCH v9 2/2] ASoC: rt5575: Add the codec driver for the ALC5575
config: arc-kismet-CONFIG_SND_SOC_RT5575-CONFIG_SND_SOC_RT5575_SPI-0-0 (https://download.01.org/0day-ci/archive/20251215/202512150010.v3tY6v3H-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20251215/202512150010.v3tY6v3H-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512150010.v3tY6v3H-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for SND_SOC_RT5575 when selected by SND_SOC_RT5575_SPI
   WARNING: unmet direct dependencies detected for SND_SOC_RT5575
     Depends on [n]: SOUND [=y] && SND [=y] && SND_SOC [=y] && I2C [=n]
     Selected by [y]:
     - SND_SOC_RT5575_SPI [=y] && SOUND [=y] && SND [=y] && SND_SOC [=y] && SPI_MASTER [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
