Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A6B51CAB0
	for <oe-kbuild-all@lists.linux.dev>; Thu, 30 May 2024 15:23:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717082626; cv=none; b=Q85f6xRaAxo2t/fCTyqpQeHVFIjN6kN3YjtUbUDLaZXs4ZcZtRDhXan/itrt9QBr/Le9ZZaRWDL1Mc+vSY/f/smOle1Ory5xsB0Gh4CXG/aLp3BDfo0AfwYTNcttXwor4YCCh7vwIofneq/BjYclGdt3j/xlbLSBX7poAb6PGV8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717082626; c=relaxed/simple;
	bh=U+mW+L6f/Twt4uGPzoRCYtWA49CgVsFMfCOgnOwxdC0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=sn3qRQf5krAoEQ07ZqDSZHSaPze73S2+Y0JLXnUMMITV185s8gFVvJUWeBn/MpGMg5ZTFYPnS9+tbrsNtCELbXSXEGuk53CDYHQp3W9Y9NAADRtX6cvt9M6gRwliQjb8jnGaI0jwsVkug6gHgfVDg/SFEAQW3sS+VcrMftzk8V4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GHnc8sG7; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GHnc8sG7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717082624; x=1748618624;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=U+mW+L6f/Twt4uGPzoRCYtWA49CgVsFMfCOgnOwxdC0=;
  b=GHnc8sG7Zn3tMq+VN32nWgcV4P1a7h0AqMml7G2FY+AP0TO530Iul+jG
   xH12NBI8LQesVM1qxfAIdr87UaL2CeWaCLDRggAH7vVL99YBUDtNQKxEv
   6z04hXDazSuEHwi84ZEUZ2mA/QNVTAj/hFYcsLQp5f6ONEX0FAOR+9Hsk
   qEXbeWmeOSYRu8kszhy3Cdr9XLI0ry+v3FrkTWXqzZZBmUGzPSSfMG2yL
   XtpOIHHVoce0cfZVKOB5RO7IrJ61/aDgSdi2zTKUlbo5Xe/Bwe9BCNKYl
   VBGS92qk+O4ZXbHiiWN5dyS4V0nIcc105gHUhmlzYhmiLLTRO8iShHjRc
   g==;
X-CSE-ConnectionGUID: o+lG8jyRQWuvAGLxwNN2nA==
X-CSE-MsgGUID: pZJQ6JkWRLmFjpWQX7Lq4Q==
X-IronPort-AV: E=McAfee;i="6600,9927,11088"; a="24191058"
X-IronPort-AV: E=Sophos;i="6.08,201,1712646000"; 
   d="scan'208";a="24191058"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 May 2024 08:23:43 -0700
X-CSE-ConnectionGUID: kHTftNWnQvmuqoIANWGYGw==
X-CSE-MsgGUID: LET40OjPQ8SyHbGnlQ27oA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,201,1712646000"; 
   d="scan'208";a="35910354"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by fmviesa009.fm.intel.com with ESMTP; 30 May 2024 08:23:37 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sChcf-000Fd7-12;
	Thu, 30 May 2024 15:23:26 +0000
Date: Thu, 30 May 2024 23:23:09 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com,
	Guenter Roeck <groeck@google.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-6.6 37/37] versioncheck:
 ./drivers/gpu/arm/mali/platform/mediatek/mt8183_mali_kbase_runtime_pm.c: 84:
 need linux/version.h
Message-ID: <202405302316.HPJeg1Gr-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-6.6
head:   4cdde2c30d79fba7b0502b267ed571deec8fc684
commit: 4cdde2c30d79fba7b0502b267ed571deec8fc684 [37/37] CHROMIUM: gpu: mali: mt8183: Switch mt8183 clk to auto-reparent
reproduce: (https://download.01.org/0day-ci/archive/20240530/202405302316.HPJeg1Gr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405302316.HPJeg1Gr-lkp@intel.com/

versioncheck warnings: (new ones prefixed by >>)
   INFO PATH=/opt/cross/rustc-1.73.0-bindgen-0.65.1/cargo/bin:/opt/cross/clang-18/bin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
   /usr/bin/timeout -k 100 3h /usr/bin/make KCFLAGS= -Wtautological-compare -Wno-error=return-type -Wreturn-type -Wcast-function-type -funsigned-char -Wundef -fstrict-flex-arrays=3 -Wformat-overflow -Wformat-truncation -Wenum-conversion W=1 --keep-going LLVM=1 -j32 ARCH=x86_64 versioncheck
   find ./* \( -name SCCS -o -name BitKeeper -o -name .svn -o -name CVS -o -name .pc -o -name .hg -o -name .git \) -prune -o \
   	-name '*.[hcS]' -type f -print | sort \
   	| xargs perl -w ./scripts/checkversion.pl
   ./drivers/accessibility/speakup/genmap.c: 13 linux/version.h not needed.
   ./drivers/accessibility/speakup/makemapdata.c: 13 linux/version.h not needed.
   ./drivers/gpu/arm/mali/backend/gpu/mali_kbase_pm_driver.c: 3493: need linux/version.h
   ./drivers/gpu/arm/mali/backend/gpu/mali_kbase_pm_policy.c: 440: need linux/version.h
   ./drivers/gpu/arm/mali/backend/gpu/mali_kbase_time.c: 362: need linux/version.h
   ./drivers/gpu/arm/mali/csf/mali_kbase_csf_firmware.c: 3256: need linux/version.h
   ./drivers/gpu/arm/mali/csf/mali_kbase_csf_firmware_no_mali.c: 1691: need linux/version.h
   ./drivers/gpu/arm/mali/csf/mali_kbase_csf_kcpu.c: 2986: need linux/version.h
   ./drivers/gpu/arm/mali/csf/mali_kbase_csf_kcpu.h: 423: need linux/version.h
   ./drivers/gpu/arm/mali/csf/mali_kbase_csf_kcpu_fence_debugfs.c: 22 linux/version.h not needed.
   ./drivers/gpu/arm/mali/csf/mali_kbase_csf_reset_gpu.c: 640: need linux/version.h
   ./drivers/gpu/arm/mali/csf/mali_kbase_csf_sync_debugfs.c: 878: need linux/version.h
   ./drivers/gpu/arm/mali/csf/mali_kbase_csf_tiler_heap_reclaim.c: 371: need linux/version.h
   ./drivers/gpu/arm/mali/include/priority_control_manager.h: 27 linux/version.h not needed.
   ./drivers/gpu/arm/mali/ipa/mali_kbase_ipa.c: 778: need linux/version.h
   ./drivers/gpu/arm/mali/jm/mali_kbase_jm_defs.h: 875: need linux/version.h
   ./drivers/gpu/arm/mali/mali_kbase.h: 869: need linux/version.h
   ./drivers/gpu/arm/mali/mali_kbase_debug_job_fault.c: 573: need linux/version.h
   ./drivers/gpu/arm/mali/mali_kbase_defs.h: 2255: need linux/version.h
   ./drivers/gpu/arm/mali/mali_kbase_dummy_job_wa.c: 459: need linux/version.h
   ./drivers/gpu/arm/mali/mali_kbase_fence.c: 61: need linux/version.h
   ./drivers/gpu/arm/mali/mali_kbase_fence.h: 252: need linux/version.h
   ./drivers/gpu/arm/mali/mali_kbase_fence_ops.c: 111: need linux/version.h
   ./drivers/gpu/arm/mali/mali_kbase_gpuprops.c: 889: need linux/version.h
   ./drivers/gpu/arm/mali/mali_kbase_gwt.c: 275: need linux/version.h
   ./drivers/gpu/arm/mali/mali_kbase_kinstr_jm.h: 69 linux/version.h not needed.
   ./drivers/gpu/arm/mali/mali_kbase_kinstr_prfcnt.c: 2024: need linux/version.h
   ./drivers/gpu/arm/mali/mali_kbase_mem.h: 2602: need linux/version.h
   ./drivers/gpu/arm/mali/mali_kbase_mem_linux.h: 533: need linux/version.h
   ./drivers/gpu/arm/mali/mali_kbase_mem_migrate.c: 712: need linux/version.h
   ./drivers/gpu/arm/mali/mali_kbase_mem_migrate.h: 118: need linux/version.h
   ./drivers/gpu/arm/mali/mali_kbase_sync.h: 216: need linux/version.h
   ./drivers/gpu/arm/mali/mali_kbase_vinstr.c: 1136: need linux/version.h
   ./drivers/gpu/arm/mali/mali_malisw.h: 29 linux/version.h not needed.
>> ./drivers/gpu/arm/mali/platform/mediatek/mt8183_mali_kbase_runtime_pm.c: 84: need linux/version.h
   ./drivers/gpu/arm/mali/tl/mali_kbase_timeline_io.c: 465: need linux/version.h
   ./drivers/gpu/drm/img-rogue/1.17/cache_km.c: 47 linux/version.h not needed.
   ./drivers/gpu/drm/img-rogue/1.17/mt8173/mt8173_sysconfig.c: 552: need linux/version.h
   ./drivers/gpu/drm/img-rogue/1.17/osfunc_arm64.c: 43 linux/version.h not needed.
   ./drivers/gpu/drm/img-rogue/1.17/osfunc_x86.c: 134: need linux/version.h
   ./drivers/gpu/drm/img-rogue/1.17/pvr_buffer_sync.c: 739: need linux/version.h
   ./drivers/gpu/drm/img-rogue/1.17/pvr_debugfs.c: 624: need linux/version.h
   ./drivers/media/virtio/virtio_video_driver.c: 21 linux/version.h not needed.
   ./drivers/net/wireless/iwl7000/hdrs/config.h: 69: need linux/version.h
   ./drivers/net/wireless/iwl7000/hdrs/kunit/visibility.h: 3 linux/version.h not needed.
   ./drivers/net/wireless/iwl7000/hdrs/linux/acpi_amd_wbrf.h: 3 linux/version.h not needed.
   ./drivers/net/wireless/iwl7000/hdrs/linux/math.h: 4 linux/version.h not needed.
   ./drivers/net/wireless/iwl7000/hdrs/mac80211-bp.h: 2351: need linux/version.h
   ./drivers/net/wireless/iwl7000/hdrs/mac80211-exp.h: 180: need linux/version.h
   ./drivers/net/wireless/iwl7000/iwlwifi/cfg/22000.c: 433: need linux/version.h
   ./drivers/net/wireless/iwl7000/iwlwifi/iwl-nvm-parse.c: 2536: need linux/version.h
   ./drivers/net/wireless/iwl7000/iwlwifi/iwl-nvm-parse.h: 103: need linux/version.h
   ./drivers/net/wireless/iwl7000/iwlwifi/iwl-tm-gnl.c: 1244: need linux/version.h
   ./drivers/net/wireless/iwl7000/iwlwifi/mvm/d3.c: 3693: need linux/version.h
   ./drivers/net/wireless/iwl7000/iwlwifi/mvm/link.c: 1142: need linux/version.h
   ./drivers/net/wireless/iwl7000/iwlwifi/mvm/mac80211.c: 6815: need linux/version.h
   ./drivers/net/wireless/iwl7000/iwlwifi/mvm/mvm.h: 2973: need linux/version.h
   ./drivers/net/wireless/iwl7000/iwlwifi/mvm/ops.c: 2357: need linux/version.h
   ./drivers/net/wireless/iwl7000/iwlwifi/mvm/rxmq.c: 2608: need linux/version.h
   ./drivers/net/wireless/iwl7000/iwlwifi/mvm/scan.c: 3572: need linux/version.h
   ./drivers/net/wireless/iwl7000/iwlwifi/mvm/vendor-cmd.c: 2419: need linux/version.h
   ./drivers/net/wireless/iwl7000/mac80211/backports.c: 559: need linux/version.h
   ./drivers/net/wireless/iwl7000/mac80211/cfg-utils.c: 403: need linux/version.h
   ./drivers/net/wireless/iwl7000/mac80211/cfg.c: 5483: need linux/version.h
   ./drivers/net/wireless/iwl7000/mac80211/debugfs.c: 737: need linux/version.h
   ./drivers/net/wireless/iwl7000/mac80211/driver-ops.h: 1733: need linux/version.h
   ./drivers/net/wireless/iwl7000/mac80211/ethtool.c: 284: need linux/version.h
   ./drivers/net/wireless/iwl7000/mac80211/ieee80211_i.h: 2728: need linux/version.h
   ./drivers/net/wireless/iwl7000/mac80211/iface.c: 2490: need linux/version.h
   ./drivers/net/wireless/iwl7000/mac80211/link.c: 531: need linux/version.h
   ./drivers/net/wireless/iwl7000/mac80211/main.c: 1854: need linux/version.h
   ./drivers/net/wireless/iwl7000/mac80211/mlme.c: 9171: need linux/version.h
   ./drivers/net/wireless/iwl7000/mac80211/parse.c: 959: need linux/version.h
   ./drivers/net/wireless/iwl7000/mac80211/rx.c: 5544: need linux/version.h
   ./drivers/net/wireless/iwl7000/mac80211/scan.c: 1472: need linux/version.h
   ./drivers/net/wireless/iwl7000/mac80211/sta_info.c: 3038: need linux/version.h
   ./drivers/net/wireless/iwl7000/mac80211/status.c: 1302: need linux/version.h
   ./drivers/net/wireless/iwl7000/mac80211/tdls.c: 2080: need linux/version.h
   ./drivers/net/wireless/iwl7000/mac80211/tx.c: 6309: need linux/version.h
   ./drivers/net/wireless/iwl7000/mac80211/util.c: 4392: need linux/version.h
   ./drivers/staging/media/atomisp/include/linux/atomisp.h: 23 linux/version.h not needed.
   ./samples/bpf/spintest.bpf.c: 8 linux/version.h not needed.
   ./samples/trace_events/trace_custom_sched.c: 11 linux/version.h not needed.
   ./sound/soc/codecs/cs42l42.c: 14 linux/version.h not needed.
   ./tools/lib/bpf/bpf_helpers.h: 402: need linux/version.h
   ./tools/testing/selftests/bpf/progs/dev_cgroup.c: 9 linux/version.h not needed.
   ./tools/testing/selftests/bpf/progs/netcnt_prog.c: 3 linux/version.h not needed.
   ./tools/testing/selftests/bpf/progs/test_map_lock.c: 4 linux/version.h not needed.
   ./tools/testing/selftests/bpf/progs/test_send_signal_kern.c: 4 linux/version.h not needed.
   ./tools/testing/selftests/bpf/progs/test_spin_lock.c: 4 linux/version.h not needed.
   ./tools/testing/selftests/bpf/progs/test_tcp_estats.c: 37 linux/version.h not needed.
   ./tools/testing/selftests/wireguard/qemu/init.c: 27 linux/version.h not needed.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
