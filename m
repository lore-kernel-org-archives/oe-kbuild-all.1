Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D163C7B
	for <oe-kbuild-all@lists.linux.dev>; Fri,  6 Jan 2023 04:56:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1672981012; x=1704517012;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=AsUrsQmTX949A0h9FgA9i4iWXvHhdm2qdg0062JBIso=;
  b=brRBLkiOBVvY0AzmIRzLxk2mr+nU7N2jArG4AwEmjDj2IwWU6o21bh6s
   LJS/pPaljRfvsjziZT/v1lXD2v2eV/qmHtE2xPyYbKFEHkFYM1puDzDjT
   ZxYR6wjsyun3+WblLz2U7QYB5U0NBg/IAsY/emQWwxsCakLRpIMw8f743
   QsT/4ggv+CQf7akLvGeSLvdW+iVTUbUoi5fU0olDHIng9WBLo07JRyBO2
   +G8eJm70LCLYLeh4viq0SlC150Rwv5PtmxX6M9SCAWOHxS2998xneEwKG
   II/Pf/BlNH+8DKg5RCDx+LYbUAzj39hRQj3S7/m18aIg8Ll893NI8BsBG
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10581"; a="321111978"
X-IronPort-AV: E=Sophos;i="5.96,304,1665471600"; 
   d="scan'208";a="321111978"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jan 2023 20:56:49 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10581"; a="633391484"
X-IronPort-AV: E=Sophos;i="5.96,304,1665471600"; 
   d="scan'208";a="633391484"
Received: from lkp-server02.sh.intel.com (HELO f1920e93ebb5) ([10.239.97.151])
  by orsmga006.jf.intel.com with ESMTP; 05 Jan 2023 20:56:46 -0800
Received: from kbuild by f1920e93ebb5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pDemX-0002zY-0H;
	Fri, 06 Jan 2023 04:56:41 +0000
Date: Fri, 6 Jan 2023 12:56:15 +0800
From: kernel test robot <lkp@intel.com>
To: Luciano Coelho <luciano.coelho@intel.com>,
	Golan Ben Ami <golan.ben.ami@intel.com>,
	Michael Golant <michael.golant@intel.com>,
	Johannes Berg <johannes.berg@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [iwlwifi-chromeos:chromeos-5.15__release/core69-51 82/211]
 versioncheck: ./drivers/net/wireless/iwl7000/iwlwifi/mvm/d3.c: 2807: need
 linux/version.h
Message-ID: <202301061219.ctegxCWq-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/iwlwifi/chromeos.git chromeos-5.15__release/core69-51
head:   feff95418258316eddec89980706755ae5f1d94d
commit: 7167b79ee5f4d5cd8c686046db66b51a0ef1d0c2 [82/211] CHROMIUM: iwl7000: mvm: align locking in D3 test debugfs
reproduce:
        make versioncheck

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

versioncheck warnings: (new ones prefixed by >>)
   INFO PATH=/opt/cross/clang/bin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
   /usr/bin/timeout -k 100 3h /usr/bin/make W=1 --keep-going HOSTCC=gcc-11 CC=gcc-11 -j32 ARCH=x86_64 versioncheck
   find ./* \( -name SCCS -o -name BitKeeper -o -name .svn -o -name CVS -o -name .pc -o -name .hg -o -name .git \) -prune -o \
   	-name '*.[hcS]' -type f -print | sort \
   	| xargs perl -w ./scripts/checkversion.pl
   ./arch/csky/include/asm/io.h: 8 linux/version.h not needed.
   ./arch/csky/kernel/process.c: 5 linux/version.h not needed.
   ./arch/csky/mm/dma-mapping.c: 12 linux/version.h not needed.
   ./drivers/gpu/arm/bifrost/backend/gpu/mali_kbase_pm_driver.c: 2879: need linux/version.h
   ./drivers/gpu/arm/bifrost/backend/gpu/mali_kbase_pm_policy.c: 409: need linux/version.h
   ./drivers/gpu/arm/bifrost/backend/gpu/mali_kbase_time.c: 109: need linux/version.h
   ./drivers/gpu/arm/bifrost/csf/mali_kbase_csf.c: 3069: need linux/version.h
   ./drivers/gpu/arm/bifrost/csf/mali_kbase_csf_csg_debugfs.c: 591: need linux/version.h
   ./drivers/gpu/arm/bifrost/csf/mali_kbase_csf_firmware.c: 2337: need linux/version.h
   ./drivers/gpu/arm/bifrost/csf/mali_kbase_csf_firmware_no_mali.c: 1389: need linux/version.h
   ./drivers/gpu/arm/bifrost/csf/mali_kbase_csf_kcpu.c: 2258: need linux/version.h
   ./drivers/gpu/arm/bifrost/csf/mali_kbase_csf_kcpu.h: 356: need linux/version.h
   ./drivers/gpu/arm/bifrost/csf/mali_kbase_csf_kcpu_debugfs.c: 197: need linux/version.h
   ./drivers/gpu/arm/bifrost/csf/mali_kbase_csf_reset_gpu.c: 629: need linux/version.h
   ./drivers/gpu/arm/bifrost/csf/mali_kbase_csf_tl_reader.c: 534: need linux/version.h
   ./drivers/gpu/arm/bifrost/csf/mali_kbase_csf_trace_buffer.c: 688: need linux/version.h
   ./drivers/gpu/arm/bifrost/ipa/mali_kbase_ipa.c: 756: need linux/version.h
   ./drivers/gpu/arm/bifrost/ipa/mali_kbase_ipa_debugfs.c: 322: need linux/version.h
   ./drivers/gpu/arm/bifrost/jm/mali_kbase_jm_defs.h: 854: need linux/version.h
   ./drivers/gpu/arm/bifrost/mali_kbase.h: 639: need linux/version.h
   ./drivers/gpu/arm/bifrost/mali_kbase_bits.h: 31: need linux/version.h
   ./drivers/gpu/arm/bifrost/mali_kbase_debug_job_fault.c: 574: need linux/version.h
   ./drivers/gpu/arm/bifrost/mali_kbase_defs.h: 1931: need linux/version.h
   ./drivers/gpu/arm/bifrost/mali_kbase_dvfs_debugfs.c: 98: need linux/version.h
   ./drivers/gpu/arm/bifrost/mali_kbase_fence.c: 153: need linux/version.h
   ./drivers/gpu/arm/bifrost/mali_kbase_fence.h: 283: need linux/version.h
   ./drivers/gpu/arm/bifrost/mali_kbase_fence_ops.c: 79: need linux/version.h
   ./drivers/gpu/arm/bifrost/mali_kbase_gpuprops.c: 873: need linux/version.h
   ./drivers/gpu/arm/bifrost/mali_kbase_jd_debugfs.c: 248: need linux/version.h
   ./drivers/gpu/arm/bifrost/mali_kbase_mem_linux.h: 474: need linux/version.h
   ./drivers/gpu/arm/bifrost/mali_kbase_mem_pool.c: 29 linux/version.h not needed.
   ./drivers/gpu/arm/bifrost/mali_kbase_mem_pool_debugfs.c: 190: need linux/version.h
   ./drivers/gpu/arm/bifrost/mali_kbase_mem_profile_debugfs.c: 135: need linux/version.h
   ./drivers/gpu/arm/bifrost/mali_kbase_sync.h: 231: need linux/version.h
   ./drivers/gpu/arm/bifrost/mali_kbase_sync_android.c: 35 linux/version.h not needed.
   ./drivers/gpu/arm/bifrost/mali_kbase_utility.h: 52: need linux/version.h
   ./drivers/gpu/arm/bifrost/mali_malisw.h: 29 linux/version.h not needed.
   ./drivers/gpu/arm/bifrost/priority_control_manager.h: 27 linux/version.h not needed.
   ./drivers/gpu/drm/evdi/evdi_platform_drv.c: 11 linux/version.h not needed.
   ./drivers/media/pci/intel/ipu-dma.c: 14 linux/version.h not needed.
   ./drivers/media/pci/intel/ipu-isys-csi2.c: 6 linux/version.h not needed.
   ./drivers/media/pci/intel/ipu-isys-video.c: 10 linux/version.h not needed.
   ./drivers/media/pci/intel/ipu-isys.c: 14 linux/version.h not needed.
   ./drivers/media/pci/intel/ipu-psys.c: 16 linux/version.h not needed.
   ./drivers/media/pci/intel/ipu.h: 10 linux/version.h not needed.
   ./drivers/media/pci/intel/ipu6/ipu6-psys.c: 12 linux/version.h not needed.
   ./drivers/media/platform/s3c-camif/camif-core.c: 26 linux/version.h not needed.
   ./drivers/media/platform/sti/c8sectpfe/c8sectpfe-common.h: 16 linux/version.h not needed.
   ./drivers/media/platform/sti/c8sectpfe/c8sectpfe-core.c: 31 linux/version.h not needed.
   ./drivers/media/platform/sti/c8sectpfe/c8sectpfe-dvb.c: 14 linux/version.h not needed.
   ./drivers/media/usb/uvc/uvc_driver.c: 20 linux/version.h not needed.
   ./drivers/media/virtio/virtio_video_driver.c: 21 linux/version.h not needed.
   ./drivers/net/ethernet/qlogic/qede/qede.h: 10 linux/version.h not needed.
   ./drivers/net/ethernet/qlogic/qede/qede_ethtool.c: 7 linux/version.h not needed.
   ./drivers/net/wireless/iwl7000/hdrs/config.h: 73: need linux/version.h
   ./drivers/net/wireless/iwl7000/hdrs/linux/verification.h: 7 linux/version.h not needed.
   ./drivers/net/wireless/iwl7000/hdrs/mac80211-bp.h: 2745: need linux/version.h
   ./drivers/net/wireless/iwl7000/hdrs/mac80211-exp.h: 197: need linux/version.h
   ./drivers/net/wireless/iwl7000/iwlwifi/cfg/22000.c: 978: need linux/version.h
   ./drivers/net/wireless/iwl7000/iwlwifi/fw/file.h: 1012: need linux/version.h
   ./drivers/net/wireless/iwl7000/iwlwifi/iwl-nvm-parse.c: 2198: need linux/version.h
   ./drivers/net/wireless/iwl7000/iwlwifi/iwl-tm-gnl.c: 1198: need linux/version.h
>> ./drivers/net/wireless/iwl7000/iwlwifi/mvm/d3.c: 2807: need linux/version.h
   ./drivers/net/wireless/iwl7000/iwlwifi/mvm/debugfs-vif.c: 871: need linux/version.h
   ./drivers/net/wireless/iwl7000/iwlwifi/mvm/mac80211.c: 5953: need linux/version.h
   ./drivers/net/wireless/iwl7000/iwlwifi/mvm/mvm.h: 2381: need linux/version.h
   ./drivers/net/wireless/iwl7000/iwlwifi/mvm/ops.c: 2178: need linux/version.h
   ./drivers/net/wireless/iwl7000/iwlwifi/mvm/phy-ctxt.c: 382: need linux/version.h
   ./drivers/net/wireless/iwl7000/iwlwifi/mvm/power.c: 976: need linux/version.h
   ./drivers/net/wireless/iwl7000/iwlwifi/mvm/quota.c: 345: need linux/version.h
   ./drivers/net/wireless/iwl7000/iwlwifi/mvm/rxmq.c: 2254: need linux/version.h
   ./drivers/net/wireless/iwl7000/iwlwifi/mvm/scan.c: 3166: need linux/version.h
   ./drivers/net/wireless/iwl7000/iwlwifi/mvm/vendor-cmd.c: 2523: need linux/version.h
   ./drivers/net/wireless/iwl7000/iwlwifi/pcie/tx-gen2.c: 261: need linux/version.h
   ./drivers/net/wireless/iwl7000/iwlwifi/pcie/tx.c: 1632: need linux/version.h
   ./drivers/net/wireless/iwl7000/iwlwifi/queue/tx.c: 1839: need linux/version.h
   ./drivers/net/wireless/iwl7000/mac80211/backports.c: 861: need linux/version.h
   ./drivers/net/wireless/iwl7000/mac80211/cfg-utils.c: 161: need linux/version.h
   ./drivers/net/wireless/iwl7000/mac80211/cfg.c: 4531: need linux/version.h
   ./drivers/net/wireless/iwl7000/mac80211/chan.c: 1929: need linux/version.h
   ./drivers/net/wireless/iwl7000/mac80211/debugfs.c: 732: need linux/version.h
   ./drivers/net/wireless/iwl7000/mac80211/ieee80211_i.h: 2536: need linux/version.h
   ./drivers/net/wireless/iwl7000/mac80211/iface.c: 2281: need linux/version.h
   ./drivers/net/wireless/iwl7000/mac80211/main.c: 1540: need linux/version.h
   ./drivers/net/wireless/iwl7000/mac80211/mlme.c: 6247: need linux/version.h
   ./drivers/net/wireless/iwl7000/mac80211/offchannel.c: 995: need linux/version.h
   ./drivers/net/wireless/iwl7000/mac80211/reg.c: 720: need linux/version.h
   ./drivers/net/wireless/iwl7000/mac80211/rx.c: 4999: need linux/version.h
   ./drivers/net/wireless/iwl7000/mac80211/scan.c: 1481: need linux/version.h
   ./drivers/net/wireless/iwl7000/mac80211/sta_info.c: 2618: need linux/version.h
   ./drivers/net/wireless/iwl7000/mac80211/status.c: 1296: need linux/version.h
   ./drivers/net/wireless/iwl7000/mac80211/tx.c: 5806: need linux/version.h
   ./drivers/net/wireless/iwl7000/mac80211/util.c: 4903: need linux/version.h
   ./drivers/net/wireless/iwl7000/mac80211/vht.c: 725: need linux/version.h
   ./drivers/scsi/cxgbi/libcxgbi.h: 27 linux/version.h not needed.
   ./drivers/scsi/mpi3mr/mpi3mr.h: 32 linux/version.h not needed.
   ./drivers/scsi/qedi/qedi_dbg.h: 14 linux/version.h not needed.
   ./drivers/staging/media/atomisp/include/linux/atomisp.h: 23 linux/version.h not needed.
   ./init/version.c: 17 linux/version.h not needed.
   ./sound/soc/codecs/cs42l42.c: 14 linux/version.h not needed.
   ./tools/lib/bpf/bpf_helpers.h: 227: need linux/version.h
   ./tools/perf/include/bpf/bpf.h: 70: need linux/version.h
   ./tools/perf/tests/bpf-script-example.c: 49: need linux/version.h
   ./tools/perf/tests/bpf-script-test-kbuild.c: 21: need linux/version.h
   ./tools/perf/tests/bpf-script-test-prologue.c: 47: need linux/version.h
   ./tools/perf/tests/bpf-script-test-relocation.c: 51: need linux/version.h
   ./tools/testing/selftests/bpf/progs/test_map_lock.c: 4 linux/version.h not needed.
   ./tools/testing/selftests/bpf/progs/test_send_signal_kern.c: 4 linux/version.h not needed.
   ./tools/testing/selftests/bpf/progs/test_spin_lock.c: 4 linux/version.h not needed.
   ./tools/testing/selftests/bpf/progs/test_tcp_estats.c: 37 linux/version.h not needed.
   ./tools/testing/selftests/wireguard/qemu/init.c: 25 linux/version.h not needed.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
