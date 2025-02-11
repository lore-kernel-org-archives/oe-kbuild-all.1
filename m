Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F03C3214
	for <oe-kbuild-all@lists.linux.dev>; Tue, 11 Feb 2025 03:52:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739245926; cv=none; b=HawRKXsHSZpGg5yAKPxmXSuzQC44x02ZOS0pL+c/Q+1z/SF9n+arkqT8/nelrw3qdZ8Qf8Un1e46HNI7xK9Y88zbN61CaohAG/R20rPhaT4t5kmjGAD279LQbTO8y3LKfuT9+sBWAoQTJUN1W+p7rejU6eEOs1URg5fzkGrkiZk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739245926; c=relaxed/simple;
	bh=kWsUFwWUTuf1lDUHtF0R5lysedS502CzKAcF/N9zvq8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Hu7LcULwOGXkHQc3bHq8K5+fjDhpwQYJW2tVKR7sgZLPzufpen3Z6KRFqP7gzNHtkowbZ1MOOsS094XyTx+K1+haq/FAjkXy8OiKF0VavSN4q7swLvpwYPI0f/Bb6Pv9lqe3WHYINUd/dM3ZpWBk6GaFyD0D1QdhzQpF767A0Fg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=joURQAYU; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="joURQAYU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739245925; x=1770781925;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=kWsUFwWUTuf1lDUHtF0R5lysedS502CzKAcF/N9zvq8=;
  b=joURQAYU8bPR7jJU8KmJkrDSmsUZ9nx7/yG6Xutc3elA5FPkwjY6LeGv
   MMD5bUhKPR6LADHVUaPDKvrdcLM3JYa5+OMHB9MoJa8ZHI7ljJoPQYsWK
   XAOqm2sEhdsahbUVV7R3Ze4RFywWz8enfZ7+ItDJ2Pnk01ejvKNAybXCn
   KQjIUIwrIHl5VGyDhOE0yVKWUKEhL3/payOevV8npD4dER41C/5ogPNjS
   2vATWDr/XubKEisUoIXOKaoVKGixQOB6DA1ILwNmpoKRYgiCl1Y7LxC6n
   djHdX093H3EW8gjg7y6eL71a3ZqWdQrZOW6rph/mYPyxmgVNqzp6PN9pz
   Q==;
X-CSE-ConnectionGUID: ZwhBMpTNRSKyhMkNCQ+Weg==
X-CSE-MsgGUID: 2QcjlGDxS42GAPHO6DXWlQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11341"; a="50080364"
X-IronPort-AV: E=Sophos;i="6.13,276,1732608000"; 
   d="scan'208";a="50080364"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Feb 2025 19:52:04 -0800
X-CSE-ConnectionGUID: wwzS4Q1qSvCEkJzPNHO09g==
X-CSE-MsgGUID: I/bRX0mET8OUJDvMccRO5w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="116476684"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 10 Feb 2025 19:52:02 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1thhJY-0013kB-1F;
	Tue, 11 Feb 2025 03:52:00 +0000
Date: Tue, 11 Feb 2025 11:51:54 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android12-5.4 11/11] sdm845.c:undefined reference to
 `cmd_db_read_addr'
Message-ID: <202502111129.7IUkHMp5-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android12-5.4
head:   39762b7a60e9a0f1e5cd736d30163ca936a1ede2
commit: f7589a13de4be2302baa9e54fdf30c1516270557 [11/11] UPSTREAM: soc: qcom: cmd-db: allow loading as a module
config: arm64-randconfig-003-20250211 (https://download.01.org/0day-ci/archive/20250211/202502111129.7IUkHMp5-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250211/202502111129.7IUkHMp5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502111129.7IUkHMp5-lkp@intel.com/

All errors (new ones prefixed by >>):

   aarch64-linux-ld: warning: -z norelro ignored
   aarch64-linux-ld: warning: .tmp_vmlinux.kallsyms1 has a LOAD segment with RWX permissions
   aarch64-linux-ld: drivers/interconnect/qcom/sdm845.o: in function `qnoc_probe':
>> sdm845.c:(.text+0x3f8): undefined reference to `cmd_db_read_addr'
>> aarch64-linux-ld: sdm845.c:(.text+0x414): undefined reference to `cmd_db_read_aux_data'

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for WIRELESS_EXT
   Depends on [n]: NET [=n] && WIRELESS [=n]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for WEXT_SPY
   Depends on [n]: NET [=n] && WIRELESS [=n]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for WEXT_CORE
   Depends on [n]: NET [=n] && WIRELESS [=n] && (CFG80211_WEXT [=n] || WIRELESS_EXT [=y])
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for SND_VMASTER
   Depends on [n]: SOUND [=n] && !UML && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_PCM_IEC958
   Depends on [n]: SOUND [=n] && !UML && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_SOC_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_JACK
   Depends on [n]: SOUND [=n] && !UML && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_JACK_INPUT_DEV
   Depends on [n]: SOUND [=n] && !UML && SND [=n] && SND_JACK [=y]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_PCM_ELD
   Depends on [n]: SOUND [=n] && !UML && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for WEXT_PROC
   Depends on [n]: NET [=n] && WIRELESS [=n] && PROC_FS [=n] && WEXT_CORE [=y]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for WEXT_PRIV
   Depends on [n]: NET [=n] && WIRELESS [=n]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
