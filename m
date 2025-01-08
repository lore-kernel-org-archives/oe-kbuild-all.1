Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4B671F8F0A
	for <oe-kbuild-all@lists.linux.dev>; Wed,  8 Jan 2025 13:55:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736344523; cv=none; b=IrWEpLMvu2MuWOJap/z93EKqA8Q9/gkY9ZdvUnJ6SdS0nwMeJjzZSJUYQVyDS4LkrjMT2H6FVJhJYOcC2/G7dXQDvvKoWq1a0fKbEG6UTsL8pKjpPBUbnYzOlh+E8nFUwfVZakgxQPRFJbiZn1GxsS6tn4BZGKMm4747kLkNbtM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736344523; c=relaxed/simple;
	bh=NkU8XskaG7vS2RIamvVKFD1BWyO/q1T9Sfv/V8pokYk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=L19RwjI6CwBHNCSx/68EbIg5TA3JdTU8tpmWMYMXFSvYyBjgTHd37gqbzVbK+AGcWVKrYh/aEwzxE3MH4Xah1S9HRnw3/Hb3jQcps/VuMuclCTXGdaQytUe0nZx7v6rMTfDtCFMkG1NIrehtBH/EKN5ky9j5/3UL0BtFcujSPVM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=J7kPhbWX; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="J7kPhbWX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736344522; x=1767880522;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=NkU8XskaG7vS2RIamvVKFD1BWyO/q1T9Sfv/V8pokYk=;
  b=J7kPhbWXLZC5QbNLQWlsRDz3X0qZSDr1eRlUuHpaGhauMc7Hjxbg3yb2
   ANGdfF1+JFkNM1qM/5Ev5IEhI5C78/o6LWpMi1P5qUbFW28i5U9GEe2gZ
   tJLB3ZIILBoSsvC39lwgwtqavbODV4JtuoCxOc/WPZB6FUHz+VVgv80z9
   4LvBd1EKD1dZdE7mnxZYbPny6Nw1ET3r3iD8ksnC/oC9eneSLcwdSlQeO
   rrFb1vsBNwSXRQKv3aocCqHQBae0HzXpG5qhykrhw6flDuXues33Qx5ju
   sEL8R5QglMpt2hU+5vMijIhnkjbFfeh7JzrV7eCdjTG4UvRv9PgscKjv1
   g==;
X-CSE-ConnectionGUID: eaav4ZesTwWvd1nfTCXKDg==
X-CSE-MsgGUID: fxAvc2bnRWqiuAoa04HSsQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11309"; a="36731932"
X-IronPort-AV: E=Sophos;i="6.12,298,1728975600"; 
   d="scan'208";a="36731932"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jan 2025 05:55:22 -0800
X-CSE-ConnectionGUID: eA4PW6KxQg6nCPew0IPUlg==
X-CSE-MsgGUID: c4rvaSSCQHGomeTvgo+W6Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,298,1728975600"; 
   d="scan'208";a="103595050"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 08 Jan 2025 05:55:20 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tVWWj-000G9v-2M;
	Wed, 08 Jan 2025 13:55:17 +0000
Date: Wed, 8 Jan 2025 21:54:38 +0800
From: kernel test robot <lkp@intel.com>
To: Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: Paul Gazzillo <paul@pgazz.com>,
	Necip Fazil Yildiran <fazilyildiran@gmail.com>,
	oe-kbuild-all@lists.linux.dev, Mark Brown <broonie@kernel.org>
Subject: [linux-next:master 6614/7110] kismet: WARNING: unmet direct
 dependencies detected for MFD_WM8994 when selected by
 SND_SOC_SAMSUNG_MIDAS_WM1811
Message-ID: <202501082159.zxUt6Gfj-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   4b90165c7d1173e0f65538d25aa718ec7ecdd5d6
commit: fd55c6065bec5268740e944a1800e6fad00974d9 [6614/7110] ASoC: samsung: Add missing selects for MFD_WM8994
config: alpha-kismet-CONFIG_MFD_WM8994-CONFIG_SND_SOC_SAMSUNG_MIDAS_WM1811-0-0 (https://download.01.org/0day-ci/archive/20250108/202501082159.zxUt6Gfj-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20250108/202501082159.zxUt6Gfj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501082159.zxUt6Gfj-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for MFD_WM8994 when selected by SND_SOC_SAMSUNG_MIDAS_WM1811
   WARNING: unmet direct dependencies detected for MFD_WM8994
     Depends on [n]: HAS_IOMEM [=y] && I2C [=n]
     Selected by [y]:
     - SND_SOC_SAMSUNG_MIDAS_WM1811 [=y] && SOUND [=y] && SND [=y] && SND_SOC [=y] && SND_SOC_SAMSUNG [=y] && IIO [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
