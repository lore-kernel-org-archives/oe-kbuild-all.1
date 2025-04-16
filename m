Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CF9F22D787
	for <oe-kbuild-all@lists.linux.dev>; Wed, 16 Apr 2025 08:27:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744792034; cv=none; b=C5van/R/+MDQaekDMbHSl9bYDhoAEBe0ToywAssNvH9b0JNe/eTN+eaRJui/E6O6AThd8pfezuYmt5aSxHeEXkGhu0z0H2oo+ND+JbV4nY0np+Ef/F/qeBIq5PIBorbW18tFUXUP2AEOK7vbt9wXlIzdP9g/8ch2S3VUhljoKt0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744792034; c=relaxed/simple;
	bh=Fj9f/9Ok8gUezfWTC1z26+7pGkySxlU9xuBw3R0bTeo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=cwD6dl8Xz1E6bkPyswV7tE12hx1CXj9KpgRmVWhYK2zdWtoJ1ueVWdE+EEM2IyQVr3GgUOsbYl8JmaYiAW6RuWV306KEpY/BgIFwhhjQ0Xks6oU54p8qWO5wP32exdGUmbBu5VB/SYGFHftVEvtavUYxcLMBzK1S6PWLRttXCns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=H6jJE7vm; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="H6jJE7vm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744792032; x=1776328032;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Fj9f/9Ok8gUezfWTC1z26+7pGkySxlU9xuBw3R0bTeo=;
  b=H6jJE7vmVDsWAuOen42JJmACxgzoXqJZY3rxJu0Ud8fhJUCQZPmRJE2F
   OfN/LeMi7jmUXGqllS6QQLJfAMydt7p4YThc/heWjOmsBKx4/krvUH9Nl
   brK+GmbzPwi1mMnplw1+EogBnNIINelIR+Kl4G6VHL638ldwngtgwzIZG
   fkAuAMwbwU7FBC7SohI2fDPboyvShD7Cha9ZJ16+Oj5Gd3PAUxLgFchS4
   QNOMS6aNooX121y7wtVnMGRoH93UuAIlw0rgecjMQoTvda+A1xV0L05Xa
   dvJYl5RQtgDfonk8erlZLfIJrEdLh5KKC/z+vn//E+Be6zkbR4OGzExxJ
   Q==;
X-CSE-ConnectionGUID: eSmExxE5QROE3TURNb3UpQ==
X-CSE-MsgGUID: F15haaX5TaONNqqaSoYqYQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11404"; a="57716935"
X-IronPort-AV: E=Sophos;i="6.15,215,1739865600"; 
   d="scan'208";a="57716935"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2025 01:27:11 -0700
X-CSE-ConnectionGUID: wf51LTliSlGslciouqlWeg==
X-CSE-MsgGUID: 1h0xwdY1SdCNAmL3pxlPqg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,215,1739865600"; 
   d="scan'208";a="131348302"
Received: from lkp-server01.sh.intel.com (HELO b207828170a5) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 16 Apr 2025 01:27:11 -0700
Received: from kbuild by b207828170a5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u4y6t-000JKG-31;
	Wed, 16 Apr 2025 08:27:07 +0000
Date: Wed, 16 Apr 2025 16:26:57 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12 0/3]
 drivers/base/power/wakeup.c:1219:5: warning: no previous prototype for
 'wakeup_sources_stats_open'
Message-ID: <202504161654.52JA2LHP-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android16-6.12
head:   0c9b4e9891173f6f40b280656c01d50c2dbf9840
commit: 5df128deb8f2e04a46acb77df6aec44b1d343583 [0/3] ANDROID: Allow vendor modules to get wakeup sources data.
config: i386-buildonly-randconfig-002-20250416 (https://download.01.org/0day-ci/archive/20250416/202504161654.52JA2LHP-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250416/202504161654.52JA2LHP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504161654.52JA2LHP-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/base/power/wakeup.c:1219:5: warning: no previous prototype for 'wakeup_sources_stats_open' [-Wmissing-prototypes]
    1219 | int wakeup_sources_stats_open(struct inode *inode, struct file *file)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for DRM_MIPI_DSI
   Depends on [n]: HAS_IOMEM [=y] && DRM [=n]
   Selected by [y]:
   - GKI_HIDDEN_DRM_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_COMPRESS_ACCEL
   Depends on [n]: SOUND [=y] && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_JACK
   Depends on [n]: SOUND [=y] && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_VMASTER
   Depends on [n]: SOUND [=y] && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for CAN_RX_OFFLOAD
   Depends on [n]: NETDEVICES [=y] && CAN_DEV [=y] && CAN_NETLINK [=n]
   Selected by [y]:
   - GKI_HIDDEN_MCP251XFD_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_JACK_INPUT_DEV
   Depends on [n]: SOUND [=y] && SND [=n] && SND_JACK [=y]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_PCM_ELD
   Depends on [n]: SOUND [=y] && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]


vim +/wakeup_sources_stats_open +1219 drivers/base/power/wakeup.c

  1218	
> 1219	int wakeup_sources_stats_open(struct inode *inode, struct file *file)
  1220	{
  1221		return seq_open_private(file, &wakeup_sources_stats_seq_ops, sizeof(int));
  1222	}
  1223	EXPORT_SYMBOL_GPL(wakeup_sources_stats_open);
  1224	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
