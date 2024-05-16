Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38E642C68C
	for <oe-kbuild-all@lists.linux.dev>; Thu, 16 May 2024 23:04:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715900691; cv=none; b=HKbHwS3pK+//cGX93LIjOFpRXTimmdx+DHj/NWpKcxhwSUdsjYUGyXh70DUmDF3LLDXzQZ6fxDbmfSR4Z6xhKGdepe13zjZUNQcP663eQG92FGsQZzKjNxjd+my7rGBcuKt6AtuOPejl2byF9pjvRYpmwtWj3t7yzB2C1oeENPI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715900691; c=relaxed/simple;
	bh=eZ/C27MLW8rHBXjqOV7oJnbPlPcGPV/8QPT4lKUaFHs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=WXtMX2DUzUyp+DPoFjY/fUBGCpIy7wYaQ/Yg9xsigwFWXS/ODRryFwjfUqoa8mxNovs/x6WIPRfUQ20snz/3mbI+q3kNTY5zYdCP7y+Rn6x8O4SnXybLF2rQnXz6BS2/KcqKz18AXJLCFVoGVBqMY9RvEafBnFjMCcXGeNx1kuA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=T0a2ffhb; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="T0a2ffhb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715900689; x=1747436689;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=eZ/C27MLW8rHBXjqOV7oJnbPlPcGPV/8QPT4lKUaFHs=;
  b=T0a2ffhbRPdQJYDM8j20cdpY9R/ZAgmi5157AJ8TduakzcCvt0Xguvqa
   lihjmgPQT7cQwekq8TbOssNQLkVXh6ClAB3T6xWES7HgLouuU2OAb8R6n
   AjkjRLKeIhmt0SB1Kt63k4fOufTrQ7aTAiHG633Oy9EZ5hGyalA1/blD6
   rnXLO4ZpbaZXd3HIU2bpq50MTWbbQM40Voxyp8x54x70kC5TYpaepC20b
   7wqmC4e6KNgwmu5YjoMnuqp5rmQdsCI/EWS7DNN+I4MmB683Qrwav8smQ
   +6Reiznt3itL5aiwXTbifS6rRYg+Wf2yWQW2ttqraLpe8riSDdmKrIh9N
   Q==;
X-CSE-ConnectionGUID: tdVdi5FpR5a2UKnz/6GCYA==
X-CSE-MsgGUID: vEeABGfoSW6pqo6QL81rWw==
X-IronPort-AV: E=McAfee;i="6600,9927,11074"; a="22729714"
X-IronPort-AV: E=Sophos;i="6.08,165,1712646000"; 
   d="scan'208";a="22729714"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 May 2024 16:04:46 -0700
X-CSE-ConnectionGUID: bp8tECwGR/ahAcDSCmSXdA==
X-CSE-MsgGUID: QrAAhHDqSvyBi7Q2Tst4gg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,165,1712646000"; 
   d="scan'208";a="36329878"
Received: from lkp-server01.sh.intel.com (HELO f8b243fe6e68) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 16 May 2024 16:04:45 -0700
Received: from kbuild by f8b243fe6e68 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s7k9S-000Exn-1o;
	Thu, 16 May 2024 23:04:42 +0000
Date: Fri, 17 May 2024 07:03:45 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android12-kiwi-5.10 7/16] ld.lld: error: undefined
 symbol: timekeeping_inject_sleeptime64
Message-ID: <202405170614.Lj1goV6V-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android12-kiwi-5.10
head:   1e272f0a57ae4536d21583ed447fea237a2c9212
commit: b250ea799dc57f803534ec66bdc46d0c9f12e807 [7/16] ANDROID: 16K: madvise_vma_pad_pages: Remove filemap_fault check am: 162de86e24
config: i386-buildonly-randconfig-001-20240517 (https://download.01.org/0day-ci/archive/20240517/202405170614.Lj1goV6V-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240517/202405170614.Lj1goV6V-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405170614.Lj1goV6V-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: timekeeping_inject_sleeptime64
   >>> referenced by virtio_pvclock.c
   >>>               virtio/virtio_pvclock.o:(update_suspend_time) in archive drivers/built-in.a

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for PHYLINK
   Depends on [n]: NETDEVICES [=n]
   Selected by [y]:
   - GKI_HIDDEN_ETHERNET_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for BALLOON_COMPACTION
   Depends on [n]: COMPACTION [=n] && MEMORY_BALLOON [=y]
   Selected by [y]:
   - GKI_HIDDEN_MM_CONFIGS [=y]
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
   WARNING: unmet direct dependencies detected for HVC_DRIVER
   Depends on [n]: TTY [=n]
   Selected by [y]:
   - GKI_HIDDEN_VIRTUAL_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for WEXT_PROC
   Depends on [n]: NET [=y] && WIRELESS [=y] && PROC_FS [=n] && WEXT_CORE [=y]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for SND_INTEL_NHLT
   Depends on [n]: SOUND [=n] && !UML && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y] && ACPI [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
