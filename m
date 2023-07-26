Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F1F77C
	for <oe-kbuild-all@lists.linux.dev>; Wed, 26 Jul 2023 01:10:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690333813; x=1721869813;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=yiTw3BTZTwkqnYc1V+RGFZdjmpV//bpD/mXF8IIo2WQ=;
  b=iOgKwPm8aFBQzQPCNVGPLXHR5Dogzw1OpsI9kHkPxADL7NV4X8krTvk6
   F1rxh6ntmFQfCUret9b9qdkb0s7yUYX5VBCe0R+mkqXDB6O+xHNvsdAVj
   X7QA468KGagKylUVobMq3S7TNs5FOY+cB5DoQSYnTakr47YC02lET2hTf
   QaHGbeaDEN388V67HXuluNM7lh7KBI7F3YIwR1KolqZ5a/BfnlcVjrVwU
   +MkxLvwLvJLqs7XxFDl4SIuVExAhs9vdoy9Ymdes4S0vJsu0PXpzFFU0T
   Gf+H0nqPZErdbvyiCvgUKWTL0ozmwGqQFLjzZrvT3NWBfw3DuwVXRaaRR
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10782"; a="398803568"
X-IronPort-AV: E=Sophos;i="6.01,231,1684825200"; 
   d="scan'208";a="398803568"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jul 2023 18:10:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10782"; a="816470805"
X-IronPort-AV: E=Sophos;i="6.01,231,1684825200"; 
   d="scan'208";a="816470805"
Received: from lkp-server02.sh.intel.com (HELO 953e8cd98f7d) ([10.239.97.151])
  by FMSMGA003.fm.intel.com with ESMTP; 25 Jul 2023 18:10:10 -0700
Received: from kbuild by 953e8cd98f7d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qOT21-0000V3-1g;
	Wed, 26 Jul 2023 01:09:49 +0000
Date: Wed, 26 Jul 2023 09:08:42 +0800
From: kernel test robot <lkp@intel.com>
To: John Johansen <john.johansen@canonical.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jon Tourville <jontourville@me.com>
Subject: [stable:linux-6.4.y 574/1151] ERROR: modpost: __ex_table+0x1914
 references non-executable section '.debug_loc'
Message-ID: <202307260920.Wgb3zZbf-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git linux-6.4.y
head:   79562f63d621517795c125092620cf4e5778ad44
commit: ca456dfa515c13989ba25458bc170a56678c879f [574/1151] apparmor: fix: kzalloc perms tables for shared dfas
config: riscv-randconfig-r042-20230725 (https://download.01.org/0day-ci/archive/20230726/202307260920.Wgb3zZbf-lkp@intel.com/config)
compiler: riscv32-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230726/202307260920.Wgb3zZbf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307260920.Wgb3zZbf-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

WARNING: modpost: vmlinux.o: section mismatch in reference: $xrv32i2p1_m2p0_a2p1_c2p0_zicsr2p0_zifencei2p0_zihintpause2p0_zmmul1p0 (section: .text.unlikely) -> .L67 (section: .init.text)
WARNING: modpost: vmlinux.o: section mismatch in reference: mxic_ecc_init_ctx_external (section: .text.unlikely) -> .L67 (section: .init.text)
WARNING: modpost: vmlinux.o: section mismatch in reference: $xrv32i2p1_m2p0_a2p1_c2p0_zicsr2p0_zifencei2p0_zihintpause2p0_zmmul1p0 (section: .text.unlikely) -> .L67 (section: .init.text)
WARNING: modpost: vmlinux.o: section mismatch in reference: rmi_firmware_update (section: .text.unlikely) -> .L67 (section: .init.text)
WARNING: modpost: vmlinux.o: section mismatch in reference: rmi_firmware_update (section: .text.unlikely) -> .L67 (section: .init.text)
WARNING: modpost: vmlinux.o: section mismatch in reference: rmi_firmware_update (section: .text.unlikely) -> .L67 (section: .init.text)
WARNING: modpost: vmlinux.o: section mismatch in reference: rmi_firmware_update (section: .text.unlikely) -> .L67 (section: .init.text)
WARNING: modpost: vmlinux.o: section mismatch in reference: rmi_firmware_update (section: .text.unlikely) -> .L67 (section: .init.text)
WARNING: modpost: vmlinux.o: section mismatch in reference: rmi_firmware_update (section: .text.unlikely) -> .L67 (section: .init.text)
WARNING: modpost: vmlinux.o: section mismatch in reference: $xrv32i2p1_m2p0_a2p1_c2p0_zicsr2p0_zifencei2p0_zihintpause2p0_zmmul1p0 (section: .text.unlikely) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux.o: section mismatch in reference: $xrv32i2p1_m2p0_a2p1_c2p0_zicsr2p0_zifencei2p0_zihintpause2p0_zmmul1p0 (section: .text.unlikely) -> .L67 (section: .init.text)
WARNING: modpost: vmlinux.o: section mismatch in reference: hci_extcap_multilane (section: .text.unlikely) -> .L67 (section: .init.text)
WARNING: modpost: vmlinux.o: section mismatch in reference: hci_extcap_global_DAT (section: .text.unlikely) -> .L67 (section: .init.text)
WARNING: modpost: vmlinux.o: section mismatch in reference: hci_extcap_ccc_resp_conf (section: .text.unlikely) -> .L67 (section: .init.text)
WARNING: modpost: vmlinux.o: section mismatch in reference: hci_extcap_non_curr_master (section: .text.unlikely) -> .L67 (section: .init.text)
WARNING: modpost: vmlinux.o: section mismatch in reference: hci_extcap_scheduled_cmd (section: .text.unlikely) -> .L67 (section: .init.text)
WARNING: modpost: vmlinux.o: section mismatch in reference: hci_extcap_debug (section: .text.unlikely) -> .L67 (section: .init.text)
WARNING: modpost: vmlinux.o: section mismatch in reference: $xrv32i2p1_m2p0_a2p1_c2p0_zicsr2p0_zifencei2p0_zihintpause2p0_zmmul1p0 (section: .text.unlikely) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux.o: section mismatch in reference: pps_echo_client_default (section: .text.unlikely) -> .L67 (section: .init.text)
WARNING: modpost: vmlinux.o: section mismatch in reference: $xrv32i2p1_m2p0_a2p1_c2p0_zicsr2p0_zifencei2p0_zihintpause2p0_zmmul1p0 (section: .text.unlikely) -> .L67 (section: .init.text)
WARNING: modpost: vmlinux.o: section mismatch in reference: $xrv32i2p1_m2p0_a2p1_c2p0_zicsr2p0_zifencei2p0_zihintpause2p0_zmmul1p0 (section: .text.unlikely) -> .L67 (section: .init.text)
WARNING: modpost: vmlinux.o: section mismatch in reference: $xrv32i2p1_m2p0_a2p1_c2p0_zicsr2p0_zifencei2p0_zihintpause2p0_zmmul1p0 (section: .text.unlikely) -> .L67 (section: .init.text)
WARNING: modpost: vmlinux.o: section mismatch in reference: $xrv32i2p1_m2p0_a2p1_c2p0_zicsr2p0_zifencei2p0_zihintpause2p0_zmmul1p0 (section: .text.unlikely) -> .L67 (section: .init.text)
WARNING: modpost: vmlinux.o: section mismatch in reference: $xrv32i2p1_m2p0_a2p1_c2p0_zicsr2p0_zifencei2p0_zihintpause2p0_zmmul1p0 (section: .text.unlikely) -> .L67 (section: .init.text)
WARNING: modpost: vmlinux.o: section mismatch in reference: $xrv32i2p1_m2p0_a2p1_c2p0_zicsr2p0_zifencei2p0_zihintpause2p0_zmmul1p0 (section: .text.unlikely) -> .L67 (section: .init.text)
WARNING: modpost: vmlinux.o: section mismatch in reference: w83627ehf_init_device (section: .text.unlikely) -> .L129 (section: .init.text)
WARNING: modpost: vmlinux.o: section mismatch in reference: w83627ehf_init_device (section: .text.unlikely) -> .L129 (section: .init.text)
WARNING: modpost: vmlinux.o: section mismatch in reference: cs_dsp_parse_wmfw_id_header (section: .text.unlikely) -> .L67 (section: .init.text)
WARNING: modpost: vmlinux.o: section mismatch in reference: cs_dsp_create_control (section: .text.unlikely) -> .L129 (section: .init.text)
WARNING: modpost: vmlinux.o: section mismatch in reference: $xrv32i2p1_m2p0_a2p1_c2p0_zicsr2p0_zifencei2p0_zihintpause2p0_zmmul1p0 (section: .text.unlikely) -> .L67 (section: .init.text)
WARNING: modpost: vmlinux.o: section mismatch in reference: $xrv32i2p1_m2p0_a2p1_c2p0_zicsr2p0_zifencei2p0_zihintpause2p0_zmmul1p0 (section: .text.unlikely) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux.o: section mismatch in reference: $xrv32i2p1_m2p0_a2p1_c2p0_zicsr2p0_zifencei2p0_zihintpause2p0_zmmul1p0 (section: .text.unlikely) -> .L67 (section: .init.text)
WARNING: modpost: vmlinux.o: section mismatch in reference: wiimote_hid_remove (section: .text.unlikely) -> .L67 (section: .init.text)
WARNING: modpost: vmlinux.o: section mismatch in reference: fpga_mgr_unregister (section: .text.unlikely) -> .L67 (section: .init.text)
WARNING: modpost: vmlinux.o: section mismatch in reference: patch_conexant_auto (section: .text.unlikely) -> .L67 (section: .init.text)
WARNING: modpost: vmlinux.o: section mismatch in reference: patch_conexant_auto (section: .text.unlikely) -> .L67 (section: .init.text)
WARNING: modpost: vmlinux.o: section mismatch in reference: mt6358_codec_dai_hw_params (section: .text.unlikely) -> .L67 (section: .init.text)
WARNING: modpost: vmlinux.o: section mismatch in reference: mt6358_amic_enable.isra.0 (section: .text.unlikely) -> .L67 (section: .init.text)
WARNING: modpost: vmlinux.o: section mismatch in reference: headset_volume_ramp (section: .text.unlikely) -> .L67 (section: .init.text)
WARNING: modpost: vmlinux.o: section mismatch in reference: mt6358_amic_disable (section: .text.unlikely) -> .L67 (section: .init.text)
WARNING: modpost: vmlinux.o: section mismatch in reference: mt_aif_in_event (section: .text.unlikely) -> .L67 (section: .init.text)
WARNING: modpost: vmlinux.o: section mismatch in reference: $xrv32i2p1_m2p0_a2p1_c2p0_zicsr2p0_zifencei2p0_zihintpause2p0_zmmul1p0 (section: .text.unlikely) -> .L67 (section: .init.text)
WARNING: modpost: vmlinux.o: section mismatch in reference: custom_hook_pre (section: .text.unlikely) -> .L67 (section: .init.text)
WARNING: modpost: vmlinux.o: section mismatch in reference: custom_c2c (section: .text.unlikely) -> .L67 (section: .init.text)
WARNING: modpost: vmlinux.o: section mismatch in reference: custom_dpcm (section: .text.unlikely) -> .L67 (section: .init.text)
WARNING: modpost: vmlinux.o: section mismatch in reference: custom_normal (section: .text.unlikely) -> .L67 (section: .init.text)
WARNING: modpost: vmlinux.o: section mismatch in reference: custom_card_probe (section: .text.unlikely) -> .L67 (section: .init.text)
WARNING: modpost: vmlinux.o: section mismatch in reference: custom_startup (section: .text.unlikely) -> .L67 (section: .init.text)
WARNING: modpost: vmlinux.o: section mismatch in reference: $xrv32i2p1_m2p0_a2p1_c2p0_zicsr2p0_zifencei2p0_zihintpause2p0_zmmul1p0 (section: .text.unlikely) -> .L67 (section: .init.text)
WARNING: modpost: vmlinux.o: section mismatch in reference: $xrv32i2p1_m2p0_a2p1_c2p0_zicsr2p0_zifencei2p0_zihintpause2p0_zmmul1p0 (section: .text.unlikely) -> .L67 (section: .init.text)
WARNING: modpost: vmlinux.o: section mismatch in reference: $xrv32i2p1_m2p0_a2p1_c2p0_zicsr2p0_zifencei2p0_zihintpause2p0_zmmul1p0 (section: .text.unlikely) -> .L67 (section: .init.text)
WARNING: modpost: vmlinux.o: section mismatch in reference: $xrv32i2p1_m2p0_a2p1_c2p0_zicsr2p0_zifencei2p0_zihintpause2p0_zmmul1p0 (section: .text.unlikely) -> .L67 (section: .init.text)
WARNING: modpost: vmlinux.o: section mismatch in reference: $xrv32i2p1_m2p0_a2p1_c2p0_zicsr2p0_zifencei2p0_zihintpause2p0_zmmul1p0 (section: .text.unlikely) -> .L67 (section: .init.text)
WARNING: modpost: vmlinux.o: section mismatch in reference: $xrv32i2p1_m2p0_a2p1_c2p0_zicsr2p0_zifencei2p0_zihintpause2p0_zmmul1p0 (section: .text.unlikely) -> .L67 (section: .init.text)
WARNING: modpost: vmlinux.o: section mismatch in reference: $xrv32i2p1_m2p0_a2p1_c2p0_zicsr2p0_zifencei2p0_zihintpause2p0_zmmul1p0 (section: .text.unlikely) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux.o: section mismatch in reference: $xrv32i2p1_m2p0_a2p1_c2p0_zicsr2p0_zifencei2p0_zihintpause2p0_zmmul1p0 (section: .exit.text) -> .LBB732 (section: .init.text)
WARNING: modpost: vmlinux.o: section mismatch in reference: $xrv32i2p1_m2p0_a2p1_c2p0_zicsr2p0_zifencei2p0_zihintpause2p0_zmmul1p0 (section: .exit.text) -> .LBB732 (section: .init.text)
WARNING: modpost: vmlinux.o: section mismatch in reference: $xrv32i2p1_m2p0_a2p1_c2p0_zicsr2p0_zifencei2p0_zihintpause2p0_zmmul1p0 (section: .exit.text) -> .LBB732 (section: .init.text)
WARNING: modpost: vmlinux.o: section mismatch in reference: $xrv32i2p1_m2p0_a2p1_c2p0_zicsr2p0_zifencei2p0_zihintpause2p0_zmmul1p0 (section: .exit.text) -> .LBB732 (section: .init.text)
WARNING: modpost: vmlinux.o: section mismatch in reference: $xrv32i2p1_m2p0_a2p1_c2p0_zicsr2p0_zifencei2p0_zihintpause2p0_zmmul1p0 (section: .exit.text) -> .LBB732 (section: .init.text)
WARNING: modpost: vmlinux.o: section mismatch in reference: $xrv32i2p1_m2p0_a2p1_c2p0_zicsr2p0_zifencei2p0_zihintpause2p0_zmmul1p0 (section: .exit.text) -> .LBB732 (section: .init.text)
WARNING: modpost: vmlinux.o: section mismatch in reference: $xrv32i2p1_m2p0_a2p1_c2p0_zicsr2p0_zifencei2p0_zihintpause2p0_zmmul1p0 (section: .exit.text) -> .LBB732 (section: .init.text)
WARNING: modpost: vmlinux.o: section mismatch in reference: $xrv32i2p1_m2p0_a2p1_c2p0_zicsr2p0_zifencei2p0_zihintpause2p0_zmmul1p0 (section: .exit.text) -> .LBB732 (section: .init.text)
WARNING: modpost: vmlinux.o: section mismatch in reference: $xrv32i2p1_m2p0_a2p1_c2p0_zicsr2p0_zifencei2p0_zihintpause2p0_zmmul1p0 (section: .exit.text) -> .LBB732 (section: .init.text)
WARNING: modpost: vmlinux.o: section mismatch in reference: $xrv32i2p1_m2p0_a2p1_c2p0_zicsr2p0_zifencei2p0_zihintpause2p0_zmmul1p0 (section: .exit.text) -> .LBB732 (section: .init.text)
WARNING: modpost: vmlinux.o: section mismatch in reference: $xrv32i2p1_m2p0_a2p1_c2p0_zicsr2p0_zifencei2p0_zihintpause2p0_zmmul1p0 (section: .exit.text) -> .LBB732 (section: .init.text)
WARNING: modpost: vmlinux.o: section mismatch in reference: $xrv32i2p1_m2p0_a2p1_c2p0_zicsr2p0_zifencei2p0_zihintpause2p0_zmmul1p0 (section: .exit.text) -> .LBB732 (section: .init.text)
WARNING: modpost: vmlinux.o: section mismatch in reference: $xrv32i2p1_m2p0_a2p1_c2p0_zicsr2p0_zifencei2p0_zihintpause2p0_zmmul1p0 (section: .exit.text) -> .LBB732 (section: .init.text)
WARNING: modpost: vmlinux.o: section mismatch in reference: $xrv32i2p1_m2p0_a2p1_c2p0_zicsr2p0_zifencei2p0_zihintpause2p0_zmmul1p0 (section: .exit.text) -> .LBB732 (section: .init.text)
WARNING: modpost: vmlinux.o: section mismatch in reference: $xrv32i2p1_m2p0_a2p1_c2p0_zicsr2p0_zifencei2p0_zihintpause2p0_zmmul1p0 (section: .exit.text) -> .LBB732 (section: .init.text)
WARNING: modpost: vmlinux.o: section mismatch in reference: $xrv32i2p1_m2p0_a2p1_c2p0_zicsr2p0_zifencei2p0_zihintpause2p0_zmmul1p0 (section: .exit.text) -> .LBB732 (section: .init.text)
WARNING: modpost: vmlinux.o: section mismatch in reference: $xrv32i2p1_m2p0_a2p1_c2p0_zicsr2p0_zifencei2p0_zihintpause2p0_zmmul1p0 (section: .exit.text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux.o: section mismatch in reference: $xrv32i2p1_m2p0_a2p1_c2p0_zicsr2p0_zifencei2p0_zihintpause2p0_zmmul1p0 (section: .exit.text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux.o: section mismatch in reference: $xrv32i2p1_m2p0_a2p1_c2p0_zicsr2p0_zifencei2p0_zihintpause2p0_zmmul1p0 (section: .exit.text) -> .L67 (section: .init.text)
WARNING: modpost: vmlinux.o: section mismatch in reference: $xrv32i2p1_m2p0_a2p1_c2p0_zicsr2p0_zifencei2p0_zihintpause2p0_zmmul1p0 (section: .exit.text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux.o: section mismatch in reference: $xrv32i2p1_m2p0_a2p1_c2p0_zicsr2p0_zifencei2p0_zihintpause2p0_zmmul1p0 (section: .exit.text) -> .LVL118 (section: .init.text)
WARNING: modpost: vmlinux.o: section mismatch in reference: $xrv32i2p1_m2p0_a2p1_c2p0_zicsr2p0_zifencei2p0_zihintpause2p0_zmmul1p0 (section: .exit.text) -> __setup_reboot_setup (section: .init.setup)
WARNING: modpost: vmlinux.o: section mismatch in reference: io_schedule_timeout (section: .sched.text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux.o: section mismatch in reference: wait_for_common (section: .sched.text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux.o: section mismatch in reference: bit_wait_timeout (section: .sched.text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux.o: section mismatch in reference: ___down_common (section: .sched.text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux.o: section mismatch in reference: schedule_timeout_interruptible (section: .sched.text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux.o: section mismatch in reference: schedule_timeout_killable (section: .sched.text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux.o: section mismatch in reference: schedule_timeout_uninterruptible (section: .sched.text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux.o: section mismatch in reference: schedule_timeout_idle (section: .sched.text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux.o: section mismatch in reference: $xrv32i2p1_m2p0_a2p1_c2p0_zicsr2p0_zifencei2p0_zihintpause2p0_zmmul1p0 (section: .sched.text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux.o: section mismatch in reference: down_write_failed (section: .sched.text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux.o(__ex_table+0x18e4): Section mismatch in reference from the (unknown reference) (unknown) to the variable .debug_str:.LASF4418
ERROR: modpost: __ex_table+0x18e4 references non-executable section '.debug_str'
WARNING: modpost: vmlinux.o(__ex_table+0x18e8): Section mismatch in reference from the (unknown reference) (unknown) to the variable .debug_str:.LASF4420
ERROR: modpost: __ex_table+0x18e8 references non-executable section '.debug_str'
WARNING: modpost: vmlinux.o(__ex_table+0x18f0): Section mismatch in reference from the (unknown reference) (unknown) to the variable .debug_str:.LASF513
ERROR: modpost: __ex_table+0x18f0 references non-executable section '.debug_str'
WARNING: modpost: vmlinux.o(__ex_table+0x18f4): Section mismatch in reference from the (unknown reference) (unknown) to the variable .debug_str:.LASF515
ERROR: modpost: __ex_table+0x18f4 references non-executable section '.debug_str'
WARNING: modpost: vmlinux.o(__ex_table+0x18fc): Section mismatch in reference from the (unknown reference) (unknown) to the variable .debug_str:.LASF4208
ERROR: modpost: __ex_table+0x18fc references non-executable section '.debug_str'
WARNING: modpost: vmlinux.o(__ex_table+0x1908): Section mismatch in reference from the (unknown reference) (unknown) to the variable .debug_str:.LASF4209
ERROR: modpost: __ex_table+0x1908 references non-executable section '.debug_str'
WARNING: modpost: vmlinux.o(__ex_table+0x1914): Section mismatch in reference from the (unknown reference) (unknown) to the variable .debug_loc:.LLST2192
>> ERROR: modpost: __ex_table+0x1914 references non-executable section '.debug_loc'
WARNING: modpost: vmlinux.o(__ex_table+0x1918): Section mismatch in reference from the (unknown reference) (unknown) to the variable .debug_loc:.LLST2195
ERROR: modpost: __ex_table+0x1918 references non-executable section '.debug_loc'
WARNING: modpost: vmlinux.o(__ex_table+0x1924): Section mismatch in reference from the (unknown reference) (unknown) to the variable .debug_loc:.LLST2193
ERROR: modpost: __ex_table+0x1924 references non-executable section '.debug_loc'
WARNING: modpost: vmlinux.o(__ex_table+0x1948): Section mismatch in reference from the (unknown reference) (unknown) to the variable .debug_loc:.LLST2196
ERROR: modpost: __ex_table+0x1948 references non-executable section '.debug_loc'
WARNING: modpost: vmlinux.o: section mismatch in reference: event_rcu_unlock_preempted_task (section: .data) -> .LVL267 (section: .init.text)
WARNING: modpost: vmlinux.o: section mismatch in reference: event_hrtimer_init (section: .data) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux.o: section mismatch in reference: event_writeback_queue (section: .data) -> .LVL13 (section: .init.text)
WARNING: modpost: vmlinux.o: section mismatch in reference: event_writeback_write_inode_start (section: .data) -> .LVL123 (section: .init.text)
WARNING: modpost: vmlinux.o: section mismatch in reference: __i2c_board_lock (section: .data) -> .LVL254 (section: .init.text)
WARNING: modpost: vmlinux.o: section mismatch in reference: __i2c_board_lock (section: .data) -> .LVL254 (section: .init.text)
WARNING: modpost: vmlinux.o: section mismatch in reference: __i2c_board_lock (section: .data) -> .LVL254 (section: .init.text)
WARNING: modpost: vmlinux.o: section mismatch in reference: synth_acntsa (section: .data) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux.o: section mismatch in reference: synth_bns (section: .data) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux.o: section mismatch in reference: synth_ltlk (section: .data) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux.o: section mismatch in reference: synth_spkout (section: .data) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux.o: section mismatch in reference: event_cq_alloc_error (section: .data) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux.o: section mismatch in reference: event_devfreq_frequency (section: .data) -> .LVL102 (section: .init.text)
WARNING: modpost: vmlinux.o: section mismatch in reference: event_fsi_master_rw_result (section: .data) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux.o: section mismatch in reference: event_tcp_bad_csum (section: .data) -> .LVL126 (section: .init.text)
WARNING: modpost: vmlinux.o: section mismatch in reference: llc_sap_inactive_state_trans_1 (section: .data) -> .LVL104 (section: .init.text)
WARNING: modpost: vmlinux.o: section mismatch in reference: genl_sk_destructing_waitq (section: .data) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux.o: section mismatch in reference: genl_sk_destructing_waitq (section: .data) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux.o: section mismatch in reference: pn_proto (section: .data) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux.o: section mismatch in reference: pep_proto (section: .data) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux.o: section mismatch in reference: event_tipc_node_dump (section: .data) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux.o: section mismatch in reference: virtio_transport (section: .data) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux.o: section mismatch in reference: virtio_transport (section: .data) -> .LVL43 (section: .init.text)
WARNING: modpost: vmlinux.o: section mismatch in reference: trace_event_type_funcs_qrtr_ns_service_announce_del (section: .data) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux.o: section mismatch in reference: trace_event_type_funcs_qrtr_ns_service_announce_new (section: .data) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux.o: section mismatch in reference: event_qrtr_ns_message (section: .data) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux.o: section mismatch in reference: event_qrtr_ns_message (section: .data) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux.o: section mismatch in reference: event_qrtr_ns_server_add (section: .data) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux.o: section mismatch in reference: event_qrtr_ns_server_add (section: .data) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux.o: section mismatch in reference: event_qrtr_ns_server_add (section: .data) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux.o: section mismatch in reference: event_qrtr_ns_service_announce_del (section: .data) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux.o: section mismatch in reference: event_qrtr_ns_service_announce_del (section: .data) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux.o: section mismatch in reference: event_qrtr_ns_service_announce_del (section: .data) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux.o: section mismatch in reference: event_qrtr_ns_service_announce_new (section: .data) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux.o: section mismatch in reference: qrtr_tun_miscdev (section: .data) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux.o: section mismatch in reference: mptcp_prot (section: .data) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux.o: section mismatch in reference: mptcp_prot (section: .data) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux.o: section mismatch in reference: mptcp_prot (section: .data) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux.o: section mismatch in reference: mptcp_prot (section: .data) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux.o: section mismatch in reference: mptcp_prot (section: .data) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux.o: section mismatch in reference: mptcp_prot (section: .data) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux.o: section mismatch in reference: mptcp_prot (section: .data) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux.o: section mismatch in reference: mptcp_prot (section: .data) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux.o: section mismatch in reference: mptcp_prot (section: .data) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux.o: section mismatch in reference: mptcp_prot (section: .data) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux.o: section mismatch in reference: mptcp_prot (section: .data) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux.o: section mismatch in reference: mptcp_prot (section: .data) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux.o: section mismatch in reference: mptcp_prot (section: .data) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux.o: section mismatch in reference: mptcp_prot (section: .data) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux.o: section mismatch in reference: mptcp_prot (section: .data) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux.o: section mismatch in reference: mptcp_prot (section: .data) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux.o: section mismatch in reference: mptcp_protosw (section: .data) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux.o: section mismatch in reference: mptcp_protosw (section: .data) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux.o: section mismatch in reference: trace_event_type_funcs_subflow_check_data_avail (section: .data) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux.o: section mismatch in reference: trace_event_type_funcs_ack_update_msk (section: .data) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux.o: section mismatch in reference: trace_event_type_funcs_mptcp_dump_mpext (section: .data) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux.o: section mismatch in reference: trace_event_type_funcs_mptcp_subflow_get_send (section: .data) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux.o: section mismatch in reference: event_subflow_check_data_avail (section: .data) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux.o: section mismatch in reference: event_subflow_check_data_avail (section: .data) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux.o: section mismatch in reference: event_subflow_check_data_avail (section: .data) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux.o: section mismatch in reference: event_ack_update_msk (section: .data) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux.o: section mismatch in reference: event_ack_update_msk (section: .data) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux.o: section mismatch in reference: event_ack_update_msk (section: .data) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux.o: section mismatch in reference: event_get_mapping_status (section: .data) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux.o: section mismatch in reference: event_get_mapping_status (section: .data) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux.o: section mismatch in reference: event_get_mapping_status (section: .data) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux.o: section mismatch in reference: event_mptcp_sendmsg_frag (section: .data) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux.o: section mismatch in reference: event_mptcp_sendmsg_frag (section: .data) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux.o: section mismatch in reference: event_mptcp_sendmsg_frag (section: .data) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux.o: section mismatch in reference: event_mptcp_subflow_get_send (section: .data) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux.o: section mismatch in reference: event_mptcp_subflow_get_send (section: .data) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux.o: section mismatch in reference: event_mptcp_subflow_get_send (section: .data) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux.o: section mismatch in reference: event_ma_write (section: .data) -> .LBB736 (section: .init.text)
WARNING: modpost: vmlinux.o: section mismatch in reference: event_ma_read (section: .data) -> .L0  (section: .init.text)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
