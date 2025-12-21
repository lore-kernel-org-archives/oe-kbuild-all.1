Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B4EB2877D2
	for <oe-kbuild-all@lists.linux.dev>; Sun, 21 Dec 2025 19:55:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766346910; cv=none; b=BGz0657rpsurjErgX28/WXz23RSgkqgDLWW2H8qADRVgXX1sgxALL851EpFf6SVczRX2iUjx5k3Sx9F3mzDEkyjtPRXXxFC958vfVtSDN2xpwJz8dst7NHV4xtqOOsMOjmPdzX+dcpeka0Dr3S29J9WHSeVz8/WcX0mQnMAgfnA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766346910; c=relaxed/simple;
	bh=953FF1GLK6wr+Xfh9NQGm6XsvghfM4jpxsHPJIz/Z7A=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=qbTwBPyYhIEgKpwrV6eZkMvD/HpBJ8Yxq/GEbT2xOAuqlJ+AM4Z6Kp65ylJj0xwNERv/57iohIOi3eD1CeGny0WmbYF6aJ+xg+KZqvAjuOI/D9fkMkl/ZAzZPQQSv1QUy3ntOed+m05Hx6XjIXumiQm5WvAJ5SNdT/PFjsWzRz8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Qr71dqtN; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Qr71dqtN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766346908; x=1797882908;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=953FF1GLK6wr+Xfh9NQGm6XsvghfM4jpxsHPJIz/Z7A=;
  b=Qr71dqtNe9c4VoZ7zCm/m7ln3XXaODwJ2wkTKIR0mWy+lgGjix2HsD6i
   WlGZI6qaRzLifws8GOwYX2wGjBSAje1GIVX9OOCH/4zGa4k+gU+lWoL+1
   V+Ki9UGNi5VU5T3oGRqIibneHeCsy3fnMLO8pjRa+k8NwyY3V1gJ3srY1
   gdD0SQZX4fY2j/HQYD+kp/WsGNmSrVsk0jcmGcx6JaQM/upFcr9D/2MpD
   D1F9d1gDvc7At4U+zcnryFS0nOwKaKFDOgn6f7YZAmGuYT71YnrH5NZEN
   4pGx9NbDavZ1Fs3ChRgSreN3BqBZPymEv3CDdkEhzpXcegKmLN2omjeKk
   A==;
X-CSE-ConnectionGUID: hv0DR0a5SPm0AI6wg1R7cA==
X-CSE-MsgGUID: agoliH5BQU2ggtcg3aIpag==
X-IronPort-AV: E=McAfee;i="6800,10657,11649"; a="72065311"
X-IronPort-AV: E=Sophos;i="6.21,166,1763452800"; 
   d="scan'208";a="72065311"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Dec 2025 11:55:08 -0800
X-CSE-ConnectionGUID: 1HskbS/QT9Svp82DM4qj9A==
X-CSE-MsgGUID: PIfQ05E1QKm3q19MLHtbow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,166,1763452800"; 
   d="scan'208";a="204295954"
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a) ([10.211.93.152])
  by fmviesa004.fm.intel.com with ESMTP; 21 Dec 2025 11:55:07 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vXPWD-000000005Dk-0QDM;
	Sun, 21 Dec 2025 19:55:05 +0000
Date: Sun, 21 Dec 2025 20:54:53 +0100
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12-desktop 12/12] kismet: WARNING: unmet
 direct dependencies detected for CRYPTO_ENGINE when selected by
 GKI_HIDDEN_CRYPTO_CONFIGS
Message-ID: <202512212011.reRkSR6U-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android16-6.12-desktop
head:   2141da9e498139ac37a520b62dfdc77db8003146
commit: 77002c324012cf3931a613f828b37abe7ab4392a [12/12] ANDROID: gki_defconfig: Enable req modules in GKI
config: x86_64-kismet-CONFIG_CRYPTO_ENGINE-CONFIG_GKI_HIDDEN_CRYPTO_CONFIGS-0-0 (https://download.01.org/0day-ci/archive/20251221/202512212011.reRkSR6U-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20251221/202512212011.reRkSR6U-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512212011.reRkSR6U-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for CRYPTO_ENGINE when selected by GKI_HIDDEN_CRYPTO_CONFIGS
   WARNING: unmet direct dependencies detected for CRYPTO_ENGINE
     Depends on [n]: CRYPTO [=n]
     Selected by [y]:
     - GKI_HIDDEN_CRYPTO_CONFIGS [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
