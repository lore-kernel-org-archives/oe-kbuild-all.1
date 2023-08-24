Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66C4D288EC
	for <oe-kbuild-all@lists.linux.dev>; Thu, 24 Aug 2023 14:38:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692887913; x=1724423913;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=RV4wpFLvySfVoQ44zCOd4MDVI+cxMEWm3B7p+TFUuaA=;
  b=Xq74VcK1zZYj6Pk5Xuq4M24JfCUHudNeAhtvH1rbwiTpZMgh1sNZEELT
   S22ScPlBOhKEebiDua9n5MhoOjU63s1TSd3NkNcpRtMO7yM99LypvXQBX
   6kE/ElggwcEQG1WXul5D5DBDC9pVHJSVe26zcefhCcAMgDz2JvLmERoS8
   75XRWPMnJVocrV8W5gzcqNixaOe+JM95iogezJba/msmvtwoNDLUHpdOt
   fJHrXy8U/wSJIZJFJYv3/rZi835To55MqMpe3b72IoDAn0gkxXJnH+orC
   oqyWUI2vCqmVnGoCbaixzN/4ADtNK5Nh4x5dDr+pS00yHYFQfA1N2x8+e
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10812"; a="374422071"
X-IronPort-AV: E=Sophos;i="6.02,195,1688454000"; 
   d="scan'208";a="374422071"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Aug 2023 07:38:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10812"; a="983732509"
X-IronPort-AV: E=Sophos;i="6.02,195,1688454000"; 
   d="scan'208";a="983732509"
Received: from lkp-server02.sh.intel.com (HELO daf8bb0a381d) ([10.239.97.151])
  by fmsmga006.fm.intel.com with ESMTP; 24 Aug 2023 07:38:30 -0700
Received: from kbuild by daf8bb0a381d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qZBTi-0002mC-0R;
	Thu, 24 Aug 2023 14:38:30 +0000
Date: Thu, 24 Aug 2023 22:38:02 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android12-5.10 2047/28386] ERROR: modpost:
 "virtio_dma_buf_attach" [drivers/gpu/drm/virtio/virtio-gpu.ko] undefined!
Message-ID: <202308242233.Bok0jbOs-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Alistair,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://android.googlesource.com/kernel/common android12-5.10
head:   8001debfc11998c8d6ea9695f5062b2839468ea3
commit: e03a3cf3cc429a2770817a1721bda8946a8c3989 [2047/28386] ANDROID: GKI: Unhide VIRTIO_DMA_SHARED_BUFFER
config: x86_64-buildonly-randconfig-001-20230824 (https://download.01.org/0day-ci/archive/20230824/202308242233.Bok0jbOs-lkp@intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230824/202308242233.Bok0jbOs-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308242233.Bok0jbOs-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "virtio_dma_buf_attach" [drivers/gpu/drm/virtio/virtio-gpu.ko] undefined!
>> ERROR: modpost: "virtio_dma_buf_export" [drivers/gpu/drm/virtio/virtio-gpu.ko] undefined!

Kconfig warnings: (for reference only)
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
   Depends on [n]: NET [=y] && WIRELESS [=y] && PROC_FS [=n] && WEXT_CORE [=y]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
