Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E85EB20F16
	for <oe-kbuild-all@lists.linux.dev>; Wed, 23 Aug 2023 04:28:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692764896; x=1724300896;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=hTpmgPzhJ3qgVGddJ7ik+CibKZOU8qv6ipz7YfLRrIo=;
  b=PQIBoxUlGRYb6qyZo/9T2WyZdjL3XxHQzu2FEC8QtqcxYvge/sCr1a3U
   vy2yapzer4FFBod1EP834IIyDS/FwWnSpU3vsDiYiA342dloik92gT4nP
   XWsWGSn9xIJtOTVUPCvffIE893RFDzICu97lIudwfquCZrCuIXxVOsGNr
   /1jSyXNB9ZnS7tsUFMwRKXW5qkMlZ0c9OkMAqZmQqHXFiZYLdGYDmkr5V
   0V4Cmgt+Qvuay2AR0Fpb/rGxr5K7q1WUswDOzPn0B2B0Db77oak+x0nBl
   87E/T9VOjrKcBHAqMA986n5JQVCEcCBY+mKFsbwvFyM7Rts2Hoi2JOSDr
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10810"; a="374038965"
X-IronPort-AV: E=Sophos;i="6.01,194,1684825200"; 
   d="scan'208";a="374038965"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Aug 2023 21:28:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10810"; a="983124170"
X-IronPort-AV: E=Sophos;i="6.01,194,1684825200"; 
   d="scan'208";a="983124170"
Received: from lkp-server02.sh.intel.com (HELO daf8bb0a381d) ([10.239.97.151])
  by fmsmga006.fm.intel.com with ESMTP; 22 Aug 2023 21:28:15 -0700
Received: from kbuild by daf8bb0a381d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qYfTa-0000qG-1Q;
	Wed, 23 Aug 2023 04:28:14 +0000
Date: Wed, 23 Aug 2023 12:28:00 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android13-5.15-2023-07 2449/21385]
 kernel/tracepoint.c:699:5: warning: no previous declaration for
 'android_rvh_probe_register'
Message-ID: <202308231235.NFg0WlzF-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android13-5.15-2023-07
head:   f38d1c0e1d3aa95f660453439197e35b9e094245
commit: e0cfc5fd8c9358c2d85fa65167794c2657f7656e [2449/21385] ANDROID: vendor_hooks: Allow multiple attachments to restricted hooks
config: i386-randconfig-r026-20230823 (https://download.01.org/0day-ci/archive/20230823/202308231235.NFg0WlzF-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
reproduce: (https://download.01.org/0day-ci/archive/20230823/202308231235.NFg0WlzF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308231235.NFg0WlzF-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> kernel/tracepoint.c:699:5: warning: no previous declaration for 'android_rvh_probe_register' [-Wmissing-declarations]
    int android_rvh_probe_register(struct tracepoint *tp, void *probe, void *data)
        ^~~~~~~~~~~~~~~~~~~~~~~~~~

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for SND_JACK
   Depends on [n]: SOUND [=n] && !UML && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_VMASTER
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
   WARNING: unmet direct dependencies detected for SND_INTEL_NHLT
   Depends on [n]: SOUND [=n] && !UML && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y] && ACPI [=y]


vim +/android_rvh_probe_register +699 kernel/tracepoint.c

   698	
 > 699	int android_rvh_probe_register(struct tracepoint *tp, void *probe, void *data)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
