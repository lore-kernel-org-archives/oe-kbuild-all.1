Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7F5722A4F8
	for <oe-kbuild-all@lists.linux.dev>; Sat, 30 Aug 2025 19:21:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756581693; cv=none; b=iHTQfRUdFjVBDdMVZE0/swJywIn3+C+Q4xy2S5blCM7ugevwBQpTP1tBgpiaW1c4GUN9OzSDJZFfau8NPmSD8372SsOYQ1vZu1QD4Ol/r6RIJ1iLQXE1Ls1YVfKovBNnnscutoLvajXUMs5nlhMfbwjDnNfldXiRbhreU5CyPTc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756581693; c=relaxed/simple;
	bh=Ht+lju3+ZVgAKN1Zuxa7/0pjbR28lJCao+xRMni+ojY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=jWWQclWvyFpnbBdnPETI3txk91Uhb1MwBWV5proyYQbce3WKErQ9VlwhkyRcLFHUDhDXT3OQj0kKmrIyTvDB5COXYfTq9QIUgtjYviYQJjQq7WQcIYMBiMs5egZroy7XSlb48Ke84fzyhJIL47F5ZRu9cXCH6KHuK5a0bW5iyso=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=T00mTCxh; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="T00mTCxh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756581691; x=1788117691;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Ht+lju3+ZVgAKN1Zuxa7/0pjbR28lJCao+xRMni+ojY=;
  b=T00mTCxh8XBkqxMSeF6FC7I5/fcJ3dK9pVarJEPyWxoqivuKs6w2ggQd
   STbUCYyqR/rX+fG05aQJqkF+ilFzcETjyRqMwk5A1z4qXwhVWHiJ6vXS3
   teBj6Ko78Tv3jbeEWvOhfAa/MZu1p7A3rqa++Hy+/rhQ7eoHZkSJf5KRs
   mWqAmOEg2ZQpqrzZT7TACTjBeqfh+GgHDS/Qu3xd4IpjCG1rINGb4Yo7+
   iQbk20Thi7tujuZE4p7PqA4pUtsbXUELG0Y2TqQ0skHQOJQDh4RwtXLlY
   yZseCfSk5oKDyz5Kx+utoryPjH/0/nZs10ri42heVR9EhfwVVO+FOPWvv
   A==;
X-CSE-ConnectionGUID: /9bm6t5dS3WjPGsV3nzFOw==
X-CSE-MsgGUID: D9yUs7ehTWa+g+Z+AN+NLw==
X-IronPort-AV: E=McAfee;i="6800,10657,11537"; a="58984326"
X-IronPort-AV: E=Sophos;i="6.18,225,1751266800"; 
   d="scan'208";a="58984326"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Aug 2025 12:21:30 -0700
X-CSE-ConnectionGUID: TVl0Xm4iSkCieSbAqSMPUQ==
X-CSE-MsgGUID: EvpL8UBFRAiVtaCE3syYzw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,225,1751266800"; 
   d="scan'208";a="171010127"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by fmviesa008.fm.intel.com with ESMTP; 30 Aug 2025 12:21:28 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1usR8H-000Vdn-1X;
	Sat, 30 Aug 2025 19:21:08 +0000
Date: Sun, 31 Aug 2025 03:20:31 +0800
From: kernel test robot <lkp@intel.com>
To: Sebastian Reichel <sre@kernel.org>
Cc: Paul Gazzillo <paul@pgazz.com>,
	Necip Fazil Yildiran <fazilyildiran@gmail.com>,
	oe-kbuild-all@lists.linux.dev
Subject: [sre-misc:thinkpad-t14s-x1e 19/19] kismet: WARNING: unmet direct
 dependencies detected for LEDS_CLASS when selected by
 EC_LENOVO_THINKPAD_T14S
Message-ID: <202508310333.MNcfJabf-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/sre/linux-misc.git thinkpad-t14s-x1e
head:   0e21f1dbce44bad4bb05c2541344ff3fb9643230
commit: 0e21f1dbce44bad4bb05c2541344ff3fb9643230 [19/19] arm64: dts: qcom: x1e80100-t14s: add EC
config: arc-kismet-CONFIG_LEDS_CLASS-CONFIG_EC_LENOVO_THINKPAD_T14S-0-0 (https://download.01.org/0day-ci/archive/20250831/202508310333.MNcfJabf-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20250831/202508310333.MNcfJabf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508310333.MNcfJabf-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for LEDS_CLASS when selected by EC_LENOVO_THINKPAD_T14S
   WARNING: unmet direct dependencies detected for SND_CTL_LED
     Depends on [n]: SOUND [=n] && SND [=n]
     Selected by [y]:
     - EC_LENOVO_THINKPAD_T14S [=y] && ARM64_PLATFORM_DEVICES [=y] && (ARCH_QCOM || COMPILE_TEST [=y]) && I2C [=y]
   
   WARNING: unmet direct dependencies detected for LEDS_CLASS
     Depends on [n]: NEW_LEDS [=n]
     Selected by [y]:
     - EC_LENOVO_THINKPAD_T14S [=y] && ARM64_PLATFORM_DEVICES [=y] && (ARCH_QCOM || COMPILE_TEST [=y]) && I2C [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
