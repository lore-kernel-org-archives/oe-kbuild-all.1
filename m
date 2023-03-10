Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 402F9DAB7
	for <oe-kbuild-all@lists.linux.dev>; Fri, 10 Mar 2023 20:40:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678480832; x=1710016832;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=X5aSf921PHYsGcC17O3UoHBWWgytCW1qbwK7u3RnTP4=;
  b=IEQE7a9WFMZ9X2kuY9ZkTXv5TshptUpajekucs+Jjvk7yQ5A3P6XSm38
   wsngpLjUvmnvBHlLqI13VW3NQ3YfwiJFUI50Q9TC05z64a0wmrMGuP34R
   Fx9VmVRUB92f0EK6RebnJ7RruhzW6dfDw7zMUQkDbRKk3zzGuEAUhqRPD
   hE/fp/XOnd5f5Udipb0WzwFLmVPpbUfBhPqpY2y386DHeunqWL3018pvE
   a2NZbBYqWYi9CWpq8A698DcE3pA6PCWRWWuQf09D/HniIcoOn55V+yShm
   /0fNkuUFceFojY1oSaTa2DviPQNU5lUb3YqVc4zXGVmFMPYwk5NWihhyp
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10645"; a="325180060"
X-IronPort-AV: E=Sophos;i="5.98,250,1673942400"; 
   d="scan'208";a="325180060"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Mar 2023 12:40:30 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10645"; a="852048424"
X-IronPort-AV: E=Sophos;i="5.98,250,1673942400"; 
   d="scan'208";a="852048424"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 10 Mar 2023 12:40:28 -0800
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pajXP-00045B-2d;
	Fri, 10 Mar 2023 20:40:27 +0000
Date: Sat, 11 Mar 2023 04:39:52 +0800
From: kernel test robot <lkp@intel.com>
To: Luciano Coelho <luciano.coelho@intel.com>,
	Golan Ben Ami <golan.ben.ami@intel.com>,
	Michael Golant <michael.golant@intel.com>,
	Johannes Berg <johannes.berg@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [iwlwifi-chromeos:chromeos-6.1__release/core76-47-and-rex-fixes-clean-no-cfg
 1/12] versioncheck: ./drivers/net/wireless/iwl7000/hdrs/config.h: 68: need
 linux/version.h
Message-ID: <202303110439.aR42oq6o-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/iwlwifi/chromeos.git chromeos-6.1__release/core76-47-and-rex-fixes-clean-no-cfg
head:   f548213ef693a97cc6f8fee04412de792e96321e
commit: 04073ce5ea4665f3505a8e9b085d06856f2a81e4 [1/12] CHROMIUM: iwl7000: add driver
reproduce:
        make versioncheck

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303110439.aR42oq6o-lkp@intel.com/

versioncheck warnings: (new ones prefixed by >>)
   INFO PATH=/opt/cross/clang/bin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
   /usr/bin/timeout -k 100 3h /usr/bin/make W=1 --keep-going HOSTCC=gcc-11 CC=gcc-11 -j32 ARCH=x86_64 versioncheck
   find ./* \( -name SCCS -o -name BitKeeper -o -name .svn -o -name CVS -o -name .pc -o -name .hg -o -name .git \) -prune -o \
   	-name '*.[hcS]' -type f -print | sort \
   	| xargs perl -w ./scripts/checkversion.pl
   ./drivers/accessibility/speakup/genmap.c: 13 linux/version.h not needed.
   ./drivers/accessibility/speakup/makemapdata.c: 13 linux/version.h not needed.
   ./drivers/gpu/drm/img-rogue/1.17/cache_km.c: 47 linux/version.h not needed.
   ./drivers/gpu/drm/img-rogue/1.17/mt8173/mt8173_sysconfig.c: 552: need linux/version.h
   ./drivers/gpu/drm/img-rogue/1.17/osfunc_arm64.c: 43 linux/version.h not needed.
   ./drivers/gpu/drm/img-rogue/1.17/osfunc_x86.c: 134: need linux/version.h
   ./drivers/gpu/drm/img-rogue/1.17/pvr_buffer_sync.c: 739: need linux/version.h
   ./drivers/gpu/drm/img-rogue/1.17/pvr_debugfs.c: 624: need linux/version.h
   ./drivers/media/pci/intel/ipu-dma.c: 14 linux/version.h not needed.
   ./drivers/media/pci/intel/ipu-isys-csi2.c: 6 linux/version.h not needed.
   ./drivers/media/pci/intel/ipu-isys-video.c: 10 linux/version.h not needed.
   ./drivers/media/pci/intel/ipu-isys.c: 14 linux/version.h not needed.
   ./drivers/media/pci/intel/ipu-psys.c: 16 linux/version.h not needed.
   ./drivers/media/pci/intel/ipu.h: 10 linux/version.h not needed.
   ./drivers/media/pci/intel/ipu6/ipu6-psys.c: 12 linux/version.h not needed.
   ./drivers/media/virtio/virtio_video_driver.c: 21 linux/version.h not needed.
   ./drivers/net/ethernet/qlogic/qede/qede.h: 10 linux/version.h not needed.
   ./drivers/net/ethernet/qlogic/qede/qede_ethtool.c: 7 linux/version.h not needed.
>> ./drivers/net/wireless/iwl7000/hdrs/config.h: 68: need linux/version.h
>> ./drivers/net/wireless/iwl7000/hdrs/linux/verification.h: 7 linux/version.h not needed.
>> ./drivers/net/wireless/iwl7000/hdrs/mac80211-bp.h: 2405: need linux/version.h
>> ./drivers/net/wireless/iwl7000/hdrs/mac80211-exp.h: 154: need linux/version.h
>> ./drivers/net/wireless/iwl7000/iwlwifi/cfg/22000.c: 1239: need linux/version.h
>> ./drivers/net/wireless/iwl7000/iwlwifi/fw/file.h: 995: need linux/version.h
>> ./drivers/net/wireless/iwl7000/iwlwifi/iwl-nvm-parse.c: 2363: need linux/version.h
>> ./drivers/net/wireless/iwl7000/iwlwifi/iwl-tm-gnl.c: 1225: need linux/version.h
>> ./drivers/net/wireless/iwl7000/iwlwifi/mvm/d3.c: 3173: need linux/version.h
>> ./drivers/net/wireless/iwl7000/iwlwifi/mvm/link.c: 305: need linux/version.h
>> ./drivers/net/wireless/iwl7000/iwlwifi/mvm/mac80211.c: 6572: need linux/version.h
>> ./drivers/net/wireless/iwl7000/iwlwifi/mvm/mvm.h: 2767: need linux/version.h
>> ./drivers/net/wireless/iwl7000/iwlwifi/mvm/ops.c: 2241: need linux/version.h
>> ./drivers/net/wireless/iwl7000/iwlwifi/mvm/phy-ctxt.c: 397: need linux/version.h
>> ./drivers/net/wireless/iwl7000/iwlwifi/mvm/rxmq.c: 2752: need linux/version.h
>> ./drivers/net/wireless/iwl7000/iwlwifi/mvm/scan.c: 3320: need linux/version.h
>> ./drivers/net/wireless/iwl7000/iwlwifi/mvm/vendor-cmd.c: 2312: need linux/version.h
>> ./drivers/net/wireless/iwl7000/mac80211/backports.c: 490: need linux/version.h
>> ./drivers/net/wireless/iwl7000/mac80211/cfg-utils.c: 118: need linux/version.h
>> ./drivers/net/wireless/iwl7000/mac80211/cfg.c: 5373: need linux/version.h
>> ./drivers/net/wireless/iwl7000/mac80211/chan.c: 2067: need linux/version.h
>> ./drivers/net/wireless/iwl7000/mac80211/debugfs.c: 723: need linux/version.h
>> ./drivers/net/wireless/iwl7000/mac80211/ieee80211_i.h: 2589: need linux/version.h
>> ./drivers/net/wireless/iwl7000/mac80211/iface.c: 2539: need linux/version.h
>> ./drivers/net/wireless/iwl7000/mac80211/link.c: 500: need linux/version.h
>> ./drivers/net/wireless/iwl7000/mac80211/main.c: 1607: need linux/version.h
>> ./drivers/net/wireless/iwl7000/mac80211/mlme.c: 7778: need linux/version.h
>> ./drivers/net/wireless/iwl7000/mac80211/rx.c: 5346: need linux/version.h
>> ./drivers/net/wireless/iwl7000/mac80211/scan.c: 1508: need linux/version.h
>> ./drivers/net/wireless/iwl7000/mac80211/sta_info.c: 2997: need linux/version.h
>> ./drivers/net/wireless/iwl7000/mac80211/status.c: 1315: need linux/version.h
>> ./drivers/net/wireless/iwl7000/mac80211/tx.c: 6059: need linux/version.h
>> ./drivers/net/wireless/iwl7000/mac80211/util.c: 5195: need linux/version.h
>> ./drivers/net/wireless/iwl7000/mac80211/vht.c: 768: need linux/version.h
   ./drivers/scsi/cxgbi/libcxgbi.h: 27 linux/version.h not needed.
   ./drivers/scsi/mpi3mr/mpi3mr.h: 32 linux/version.h not needed.
   ./drivers/scsi/qedi/qedi_dbg.h: 14 linux/version.h not needed.
   ./drivers/soc/tegra/cbb/tegra-cbb.c: 19 linux/version.h not needed.
   ./drivers/soc/tegra/cbb/tegra194-cbb.c: 26 linux/version.h not needed.
   ./drivers/soc/tegra/cbb/tegra234-cbb.c: 27 linux/version.h not needed.
   ./drivers/staging/media/atomisp/include/linux/atomisp.h: 23 linux/version.h not needed.
   ./init/version-timestamp.c: 5 linux/version.h not needed.
   ./samples/trace_events/trace_custom_sched.c: 11 linux/version.h not needed.
   ./sound/soc/codecs/cs42l42.c: 14 linux/version.h not needed.
   ./tools/lib/bpf/bpf_helpers.h: 289: need linux/version.h
   ./tools/perf/include/bpf/bpf.h: 70: need linux/version.h
   ./tools/perf/tests/bpf-script-example.c: 60: need linux/version.h
   ./tools/perf/tests/bpf-script-test-kbuild.c: 21: need linux/version.h
   ./tools/perf/tests/bpf-script-test-prologue.c: 47: need linux/version.h
   ./tools/perf/tests/bpf-script-test-relocation.c: 51: need linux/version.h
   ./tools/testing/selftests/bpf/progs/dev_cgroup.c: 9 linux/version.h not needed.
   ./tools/testing/selftests/bpf/progs/netcnt_prog.c: 3 linux/version.h not needed.
   ./tools/testing/selftests/bpf/progs/test_map_lock.c: 4 linux/version.h not needed.
   ./tools/testing/selftests/bpf/progs/test_send_signal_kern.c: 4 linux/version.h not needed.
   ./tools/testing/selftests/bpf/progs/test_spin_lock.c: 4 linux/version.h not needed.
   ./tools/testing/selftests/bpf/progs/test_tcp_estats.c: 37 linux/version.h not needed.
   ./tools/testing/selftests/wireguard/qemu/init.c: 27 linux/version.h not needed.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
