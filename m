Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67BE92454A
	for <oe-kbuild-all@lists.linux.dev>; Thu, 24 Aug 2023 12:10:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692879037; x=1724415037;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=mtYIaNYyMMV6VDkJVMij+6J4VasdtFm2LaL651kkv2I=;
  b=mBYe8J93noS3HL4aGMnO8Rv+wwz+z8Qll4849UQOGU/WbOMGESBw1JWT
   fvQFHrqO++iZNoF//3uHl2+loJYTkJ+pPmYTLjPvCiqAHFykF7t0B4qhp
   vM7PEWLphhLkxKfMG+o79ucx5oabmgeeAUaA4lnQ4v5F3kjWUlQtOHLFI
   8rgRLgnhZWimCJfjxsRaPfC7FEyBhrJvn89yiwOWX8elznfMEu4kTVJom
   7Drhz/L9i/1QSljaHtUySbwvdxiWQKxdgyBE/NmJZpcJWZWkT+r65pm4C
   hR76ZuHFEBIajbvPtpqdYDp7kKEqJw/J1xplJZxNRQgnYNAO+XTStlZ7/
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10811"; a="438354465"
X-IronPort-AV: E=Sophos;i="6.02,195,1688454000"; 
   d="scan'208";a="438354465"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Aug 2023 05:10:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10811"; a="860678581"
X-IronPort-AV: E=Sophos;i="6.02,195,1688454000"; 
   d="scan'208";a="860678581"
Received: from lkp-server02.sh.intel.com (HELO daf8bb0a381d) ([10.239.97.151])
  by orsmga004.jf.intel.com with ESMTP; 24 Aug 2023 05:10:35 -0700
Received: from kbuild by daf8bb0a381d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qZ9AU-0002Nw-1k;
	Thu, 24 Aug 2023 12:10:32 +0000
Date: Thu, 24 Aug 2023 20:09:31 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android-mainline 2/5] ERROR: modpost:
 "v4l2_m2m_release" [drivers/media/platform/m2m-deinterlace.ko] undefined!
Message-ID: <202308242021.1H6Petea-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android-mainline
head:   6e4d51f1848e57d93a7d36cb8f7f2dfa9d6d089b
commit: 558762106d6e6e046ab9af372b9cadf4222893d7 [2/5] Merge 8afc66e8d43b ("Merge tag 'kbuild-v6.1' of git://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild") into android-mainline
config: i386-randconfig-051-20230824 (https://download.01.org/0day-ci/archive/20230824/202308242021.1H6Petea-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
reproduce: (https://download.01.org/0day-ci/archive/20230824/202308242021.1H6Petea-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308242021.1H6Petea-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "v4l2_m2m_release" [drivers/media/platform/m2m-deinterlace.ko] undefined!
>> ERROR: modpost: "v4l2_m2m_job_finish" [drivers/media/platform/m2m-deinterlace.ko] undefined!
>> ERROR: modpost: "v4l2_m2m_buf_remove" [drivers/media/platform/m2m-deinterlace.ko] undefined!
>> ERROR: modpost: "v4l2_m2m_next_buf" [drivers/media/platform/m2m-deinterlace.ko] undefined!
>> ERROR: modpost: "v4l2_m2m_streamon" [drivers/media/platform/m2m-deinterlace.ko] undefined!
>> ERROR: modpost: "v4l2_m2m_ctx_release" [drivers/media/platform/m2m-deinterlace.ko] undefined!
>> ERROR: modpost: "v4l2_m2m_buf_queue" [drivers/media/platform/m2m-deinterlace.ko] undefined!
>> ERROR: modpost: "v4l2_m2m_ctx_init" [drivers/media/platform/m2m-deinterlace.ko] undefined!
>> ERROR: modpost: "v4l2_m2m_get_vq" [drivers/media/platform/m2m-deinterlace.ko] undefined!
>> ERROR: modpost: "v4l2_m2m_init" [drivers/media/platform/m2m-deinterlace.ko] undefined!
WARNING: modpost: suppressed 9 unresolved symbol warnings because there were too many)

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for SND_JACK
   Depends on [n]: SOUND [=n] && !UML && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_VMASTER
   Depends on [n]: SOUND [=n] && !UML && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for CAN_RX_OFFLOAD
   Depends on [n]: NETDEVICES [=y] && CAN_DEV [=n] && CAN_NETLINK [=n]
   Selected by [y]:
   - GKI_HIDDEN_MCP251XFD_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_PCM_IEC958
   Depends on [n]: SOUND [=n] && !UML && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_SOC_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_JACK_INPUT_DEV
   Depends on [n]: SOUND [=n] && !UML && SND [=n] && SND_JACK [=y]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_PCM_ELD
   Depends on [n]: SOUND [=n] && !UML && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_INTEL_NHLT
   Depends on [n]: SOUND [=n] && !UML && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y] && ACPI [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
