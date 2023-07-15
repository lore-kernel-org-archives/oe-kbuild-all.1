Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C525186B
	for <oe-kbuild-all@lists.linux.dev>; Sat, 15 Jul 2023 21:49:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689457749; x=1720993749;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=LVl92eJqs/aVh/AcMU6/7R2tjtdqZhU0TPe12YIhE2o=;
  b=UgVRC9S2WuRcJL8LVcxvLfSs8fNJPjGfresPQcADziaFMmquvBSgIjbS
   ZeXvzXXFJ5rkAoso/eONF5j5t+SxME3Sp4qnwAQVKIVVkrwoNOYokRkQ6
   buMJlBCWn9b6T4/YOBGvYEkYhmE517D49j4rlW3jdLuMti4m5n8A4vsYw
   EXTZNsfbWR/GvmmUSZlUPw/0s4bCnWvWcHlk6V4Z4LkhHYbWZMWfwMqzL
   EK3aoSKSyxmDmLIq90e4fZ2S1wqXSB07etoKOsY9zoB3OodDVX0W8gvjP
   1SMgNW0mk9Uv013cgF27W/AsRCqAvEnkupteFgV1JOiN1KnJ2XUmP3gXv
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10772"; a="364573667"
X-IronPort-AV: E=Sophos;i="6.01,209,1684825200"; 
   d="scan'208";a="364573667"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jul 2023 14:49:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10772"; a="896766367"
X-IronPort-AV: E=Sophos;i="6.01,209,1684825200"; 
   d="scan'208";a="896766367"
Received: from lkp-server01.sh.intel.com (HELO c544d7fc5005) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 15 Jul 2023 14:49:07 -0700
Received: from kbuild by c544d7fc5005 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qKn8U-0008Nb-0I;
	Sat, 15 Jul 2023 21:49:06 +0000
Date: Sun, 16 Jul 2023 05:48:28 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android12-kiwi-5.10 4/4]
 drivers/virtio/virtio_pvclock.c:77: undefined reference to
 `timekeeping_inject_sleeptime64'
Message-ID: <202307160504.U5SPi2kQ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android12-kiwi-5.10
head:   d975a2ab5587eedf4ac4e034ecf34935634aa83f
commit: 029865ac9555743665dd106b4bbefb2f371849e9 [4/4] ANDROID: virtio: virtio_pvclock: initial driver impl
config: x86_64-randconfig-x054-20230716 (https://download.01.org/0day-ci/archive/20230716/202307160504.U5SPi2kQ-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230716/202307160504.U5SPi2kQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307160504.U5SPi2kQ-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: warning: arch/x86/lib/retpoline.o: missing .note.GNU-stack section implies executable stack
   ld: NOTE: This behaviour is deprecated and will be removed in a future version of the linker
   ld: warning: arch/x86/lib/retpoline.o: missing .note.GNU-stack section implies executable stack
   ld: NOTE: This behaviour is deprecated and will be removed in a future version of the linker
   ld: warning: .tmp_vmlinux.kallsyms1 has a LOAD segment with RWX permissions
   ld: drivers/virtio/virtio_pvclock.o: in function `update_suspend_time':
>> drivers/virtio/virtio_pvclock.c:77: undefined reference to `timekeeping_inject_sleeptime64'

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
   WARNING: unmet direct dependencies detected for SND_INTEL_NHLT
   Depends on [n]: SOUND [=n] && !UML && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y] && ACPI [=y]


vim +77 drivers/virtio/virtio_pvclock.c

    48	
    49	void update_suspend_time(struct work_struct *work)
    50	{
    51		u64 suspend_ns, suspend_time_delta = 0;
    52		struct timespec64 inject_time;
    53		struct virtio_pvclock *vp;
    54	
    55		vp = container_of(work, struct virtio_pvclock,
    56				  update_suspend_time_work);
    57	
    58		virtio_cread(vp->vdev, struct virtio_pvclock_config, suspend_time_ns,
    59			     &suspend_ns);
    60	
    61		mutex_lock(&vp->inject_suspend_lock);
    62		if (suspend_ns > vp->injected_suspend_ns) {
    63			suspend_time_delta = suspend_ns - vp->injected_suspend_ns;
    64			vp->injected_suspend_ns = suspend_ns;
    65		}
    66		mutex_unlock(&vp->inject_suspend_lock);
    67	
    68		if (suspend_time_delta == 0) {
    69			dev_err(&vp->vdev->dev,
    70				"%s: suspend_time_ns is less than injected_suspend_ns\n",
    71				__func__);
    72			return;
    73		}
    74	
    75		inject_time = ns_to_timespec64(suspend_time_delta);
    76	
  > 77		timekeeping_inject_sleeptime64(&inject_time);
    78	
    79		dev_info(&vp->vdev->dev, "injected sleeptime: %llu ns\n",
    80			 suspend_time_delta);
    81	}
    82	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
