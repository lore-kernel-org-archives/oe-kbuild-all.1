Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28F271547CA
	for <oe-kbuild-all@lists.linux.dev>; Mon, 28 Oct 2024 22:49:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730155776; cv=none; b=JY+IgBL/xy73s/MUY+g5t74QdIPxfEeM4xzaOLmuW/R89f2zFKn43CTndud/QeUP5xnz13aUrx/+xrTxeLWq+jv0Te7CvnL8TkuirNQe7j69qQhBJRg7SUfBKdWAD29TR0HKwlLcdp2eATKOATh2IW1VKN7vOuDXTOOAvbYYOvs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730155776; c=relaxed/simple;
	bh=CsV/Uy82nNZgPw0M2jg7rvAESo1030SsrY0bP5TIFpg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=UnANZXaQ6vZdleHRI/PafUd6EULftu3uyZSFThdF6KEMwzhRgc46atSViPFC6q2UTLHFsztdKGSK1nRGztLZw+24veKigzgLfiunAxvm0sNPC/0mhpGMaHPg0zctOcxdF5QezgEU5uTRwgJKcfKjqEriSM0jfCmGXjW8wIcKNfI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VKAznNBj; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VKAznNBj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730155774; x=1761691774;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=CsV/Uy82nNZgPw0M2jg7rvAESo1030SsrY0bP5TIFpg=;
  b=VKAznNBjbZi2ywiM+QbXbfgvv6BICzEoI8EU46QZq0F3SKN/3WKFD7KB
   gL/ySv6bVVWHywv6MAoTWCgkOR5Ya45wBksa8rU6rLS6+1+9a5BDcNghx
   8XLW2KsrK5raMuDrBT4xpfuIQcBcICmw5lGmLQmCVLr6oC3LPXBsaK4Z9
   L9wZsEHLuc1ng1QLBVBZvuYBmf8yFgxBK7ICyYARhjV5gdrFGjLJqa8X8
   t6xuV7AezvXaDAqaVxAQ1wxlypNVNu6nw9acKgkT4hHDdUvKwqQKF96x8
   6VCmKFJautzjbDjBcl0USK+jQp2O0aWKvBMo9zJSz2l5IDWMT8zxQhQnO
   g==;
X-CSE-ConnectionGUID: xDqgSiFDT9GjdkYwA+yP3g==
X-CSE-MsgGUID: jRTmyXXZQsmLpe2FfTpqiw==
X-IronPort-AV: E=McAfee;i="6700,10204,11239"; a="41170671"
X-IronPort-AV: E=Sophos;i="6.11,240,1725346800"; 
   d="scan'208";a="41170671"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Oct 2024 15:49:30 -0700
X-CSE-ConnectionGUID: YMh1naoMQTiqUWXPnLRjbg==
X-CSE-MsgGUID: thXi0rzHRJCFjnsxz3pz6Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,240,1725346800"; 
   d="scan'208";a="86318940"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 28 Oct 2024 15:49:29 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t5YYB-000cya-0Y;
	Mon, 28 Oct 2024 22:49:27 +0000
Date: Tue, 29 Oct 2024 06:49:11 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android11-5.4 6663/30000] kismet: WARNING: unmet
 direct dependencies detected for DMA_VIRTUAL_CHANNELS when selected by
 GKI_HIDDEN_SND_SOC_CONFIGS
Message-ID: <202410290625.kb5Qwx48-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android11-5.4
head:   ca48ea8b94307a011f58fdc6efa124ff7f5508f8
commit: dd17237d7284a4f7a881bd3c746e299f5b4675da [6663/30000] ANDROID: gki: build-in DMA_VIRTUAL_CHANNELS
config: x86_64-kismet-CONFIG_DMA_VIRTUAL_CHANNELS-CONFIG_GKI_HIDDEN_SND_SOC_CONFIGS-0-0 (https://download.01.org/0day-ci/archive/20241029/202410290625.kb5Qwx48-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20241029/202410290625.kb5Qwx48-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410290625.kb5Qwx48-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for DMA_VIRTUAL_CHANNELS when selected by GKI_HIDDEN_SND_SOC_CONFIGS
   WARNING: unmet direct dependencies detected for SND_SOC_MAX98357A
     Depends on [n]: SOUND [=y] && !UML && SND [=y] && SND_SOC [=y] && GPIOLIB [=n]
     Selected by [y]:
     - SND_SOC_STORM [=y] && SOUND [=y] && !UML && SND [=y] && SND_SOC [=y] && SND_SOC_QCOM [=y]
   
   WARNING: unmet direct dependencies detected for DMA_VIRTUAL_CHANNELS
     Depends on [n]: DMADEVICES [=n]
     Selected by [y]:
     - GKI_HIDDEN_SND_SOC_CONFIGS [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
