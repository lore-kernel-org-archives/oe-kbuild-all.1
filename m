Received: from mgamail.intel.com (unknown [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BEAA6132
	for <oe-kbuild-all@lists.linux.dev>; Mon, 31 Jul 2023 07:27:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690788446; x=1722324446;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Hj/YZgqiXxGuvywZeAXPivxD0I7VOh/89+Yh9e2bz+U=;
  b=MgC+VCYujldi7h5QSkN+K/luSE6nJNZcKEAFvWC4QoMoabQ34T/h5kD4
   U3vCYw9FXaA+KZypVsXn9hatclf2nNFMfft01/FcopCejl5WuqO3kT7RA
   vsJvKLuMmfw3TTe6YpFgrdgujRssqlG4pYS0u3VdSgM8Oo1BihEVc48Z8
   VvjIE1XH54yhaY/Z+yHPS6mHIH8Ab3rAAPmPaNN6LrfZo+jEMg+mZrOpg
   /MF2Hd3+6B63w2Tu3RnfgsoalvSQGQaSncAyI1YPYmfZ015PUpQAPed+r
   EkwHodwMKuMA4sZnPKQOm9OXWAIPXTgmxQA3C44IsWHUSvY1nX+Zu8qJy
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10787"; a="358979962"
X-IronPort-AV: E=Sophos;i="6.01,244,1684825200"; 
   d="scan'208";a="358979962"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jul 2023 00:27:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10787"; a="757851141"
X-IronPort-AV: E=Sophos;i="6.01,244,1684825200"; 
   d="scan'208";a="757851141"
Received: from lkp-server02.sh.intel.com (HELO 953e8cd98f7d) ([10.239.97.151])
  by orsmga008.jf.intel.com with ESMTP; 31 Jul 2023 00:27:24 -0700
Received: from kbuild by 953e8cd98f7d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qQNJM-0004zn-07;
	Mon, 31 Jul 2023 07:27:24 +0000
Date: Mon, 31 Jul 2023 15:26:37 +0800
From: kernel test robot <lkp@intel.com>
To: Sasha Levin <sashal@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [sashal-stable:pending-6.1 128/145] ERROR: modpost:
 __ex_table+0x1150 references non-executable section '.rodata'
Message-ID: <202307311507.wGzEqXng-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/sashal/linux-stable.git pending-6.1
head:   2fc5cf0483bcf2e366e821aa8cd0f92a4008d5f2
commit: c71552bc3fcdb96305e16c6564b618a13b177cda [128/145] smb3: do not set NTLMSSP_VERSION flag for negotiate not auth request
config: riscv-randconfig-r042-20230731 (https://download.01.org/0day-ci/archive/20230731/202307311507.wGzEqXng-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce: (https://download.01.org/0day-ci/archive/20230731/202307311507.wGzEqXng-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307311507.wGzEqXng-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

WARNING: modpost: vmlinux.o: section mismatch in reference: ipw_priv_handler (section: .data) -> set_reset_devices (section: .init.text)
WARNING: modpost: vmlinux.o: section mismatch in reference: ipw_priv_handler (section: .data) -> set_reset_devices (section: .init.text)
WARNING: modpost: vmlinux.o: section mismatch in reference: t7xx_pci_driver (section: .data) -> set_reset_devices (section: .init.text)
WARNING: modpost: vmlinux.o: section mismatch in reference: t7xx_pci_driver (section: .data) -> set_reset_devices (section: .init.text)
WARNING: modpost: vmlinux.o: section mismatch in reference: atkbd_attr_extra (section: .data) -> set_reset_devices (section: .init.text)
WARNING: modpost: vmlinux.o: section mismatch in reference: zinitix_ts_driver (section: .data) -> set_reset_devices (section: .init.text)
WARNING: modpost: vmlinux.o: section mismatch in reference: hopper_pci_driver (section: .data) -> .LBB23_10 (section: .init.text)
WARNING: modpost: vmlinux.o: section mismatch in reference: gpio_charger_driver (section: .data) -> .LBB0_7 (section: .init.text)
WARNING: modpost: vmlinux.o: section mismatch in reference: lt3651_charger_driver (section: .data) -> .Ltmp2 (section: .init.text)
WARNING: modpost: vmlinux.o: section mismatch in reference: dev_attr_pwm2_enable (section: .data) -> map_benchmark_cleanup (section: .exit.text)
WARNING: modpost: vmlinux.o: section mismatch in reference: sda_temp_input (section: .data) -> map_benchmark_cleanup (section: .exit.text)
WARNING: modpost: vmlinux.o: section mismatch in reference: sda_temp_input (section: .data) -> map_benchmark_cleanup (section: .exit.text)
WARNING: modpost: vmlinux.o: section mismatch in reference: sda_temp_max (section: .data) -> map_benchmark_cleanup (section: .exit.text)
WARNING: modpost: vmlinux.o: section mismatch in reference: sda_temp_max (section: .data) -> map_benchmark_cleanup (section: .exit.text)
WARNING: modpost: vmlinux.o: section mismatch in reference: sda_temp_max_hyst (section: .data) -> map_benchmark_cleanup (section: .exit.text)
WARNING: modpost: vmlinux.o: section mismatch in reference: sda_temp_max_hyst (section: .data) -> map_benchmark_cleanup (section: .exit.text)
WARNING: modpost: vmlinux.o: section mismatch in reference: sensor_dev_attr_in0_min (section: .data) -> sx150x_init (section: .init.text)
WARNING: modpost: vmlinux.o: section mismatch in reference: sensor_dev_attr_in1_alarm (section: .data) -> set_reset_devices (section: .init.text)
WARNING: modpost: vmlinux.o: section mismatch in reference: sensor_dev_attr_in1_input (section: .data) -> set_reset_devices (section: .init.text)
WARNING: modpost: vmlinux.o: section mismatch in reference: sensor_dev_attr_in1_min (section: .data) -> set_reset_devices (section: .init.text)
WARNING: modpost: vmlinux.o: section mismatch in reference: sensor_dev_attr_in2_alarm (section: .data) -> set_reset_devices (section: .init.text)
WARNING: modpost: vmlinux.o: section mismatch in reference: sensor_dev_attr_in2_input (section: .data) -> set_reset_devices (section: .init.text)
WARNING: modpost: vmlinux.o: section mismatch in reference: sensor_dev_attr_in2_max (section: .data) -> set_reset_devices (section: .init.text)
WARNING: modpost: vmlinux.o: section mismatch in reference: sensor_dev_attr_temp1_crit (section: .data) -> map_benchmark_cleanup (section: .exit.text)
WARNING: modpost: vmlinux.o: section mismatch in reference: sensor_dev_attr_temp2_crit (section: .data) -> map_benchmark_cleanup (section: .exit.text)
WARNING: modpost: vmlinux.o: section mismatch in reference: sensor_dev_attr_temp3_crit (section: .data) -> map_benchmark_cleanup (section: .exit.text)
WARNING: modpost: vmlinux.o: section mismatch in reference: sensor_dev_attr_temp4_min_hyst (section: .data) -> map_benchmark_cleanup (section: .exit.text)
WARNING: modpost: vmlinux.o: section mismatch in reference: sensor_dev_attr_temp3_min_hyst (section: .data) -> map_benchmark_cleanup (section: .exit.text)
WARNING: modpost: vmlinux.o: section mismatch in reference: sensor_dev_attr_temp1_min_hyst (section: .data) -> map_benchmark_cleanup (section: .exit.text)
WARNING: modpost: vmlinux.o: section mismatch in reference: sensor_dev_attr_temp2_min_hyst (section: .data) -> map_benchmark_cleanup (section: .exit.text)
WARNING: modpost: vmlinux.o: section mismatch in reference: f71862fg_auto_pwm_attr (section: .data) -> map_benchmark_cleanup (section: .exit.text)
WARNING: modpost: vmlinux.o: section mismatch in reference: f71862fg_auto_pwm_attr (section: .data) -> map_benchmark_cleanup (section: .exit.text)
WARNING: modpost: vmlinux.o: section mismatch in reference: f71862fg_auto_pwm_attr (section: .data) -> map_benchmark_cleanup (section: .exit.text)
WARNING: modpost: vmlinux.o: section mismatch in reference: f71869_auto_pwm_attr (section: .data) -> map_benchmark_cleanup (section: .exit.text)
WARNING: modpost: vmlinux.o: section mismatch in reference: f71869_auto_pwm_attr (section: .data) -> map_benchmark_cleanup (section: .exit.text)
WARNING: modpost: vmlinux.o: section mismatch in reference: f71869_auto_pwm_attr (section: .data) -> map_benchmark_cleanup (section: .exit.text)
WARNING: modpost: vmlinux.o: section mismatch in reference: f8000_auto_pwm_attr (section: .data) -> map_benchmark_cleanup (section: .exit.text)
WARNING: modpost: vmlinux.o: section mismatch in reference: f8000_auto_pwm_attr (section: .data) -> map_benchmark_cleanup (section: .exit.text)
WARNING: modpost: vmlinux.o: section mismatch in reference: f8000_auto_pwm_attr (section: .data) -> map_benchmark_cleanup (section: .exit.text)
WARNING: modpost: vmlinux.o: section mismatch in reference: fxxxx_auto_pwm_attr (section: .data) -> map_benchmark_cleanup (section: .exit.text)
WARNING: modpost: vmlinux.o: section mismatch in reference: fxxxx_auto_pwm_attr (section: .data) -> map_benchmark_cleanup (section: .exit.text)
WARNING: modpost: vmlinux.o: section mismatch in reference: fxxxx_auto_pwm_attr (section: .data) -> map_benchmark_cleanup (section: .exit.text)
WARNING: modpost: vmlinux.o: section mismatch in reference: fxxxx_auto_pwm_attr (section: .data) -> map_benchmark_cleanup (section: .exit.text)
WARNING: modpost: vmlinux.o: section mismatch in reference: dev_attr_pwm1_enable (section: .data) -> set_reset_devices (section: .init.text)
WARNING: modpost: vmlinux.o: section mismatch in reference: lm83_info (section: .data) -> set_reset_devices (section: .init.text)
WARNING: modpost: vmlinux.o: section mismatch in reference: sensor_dev_attr_curr1_highest (section: .data) -> pwm_clk_driver_init (section: .init.text)
WARNING: modpost: vmlinux.o: section mismatch in reference: sensor_dev_attr_curr1_reset_history (section: .data) -> set_reset_devices (section: .init.text)
WARNING: modpost: vmlinux.o: section mismatch in reference: sensor_dev_attr_curr1_min_alarm (section: .data) -> set_reset_devices (section: .init.text)
WARNING: modpost: vmlinux.o: section mismatch in reference: sensor_dev_attr_power1_input (section: .data) -> set_reset_devices (section: .init.text)
WARNING: modpost: vmlinux.o: section mismatch in reference: sensor_dev_attr_power1_min (section: .data) -> set_reset_devices (section: .init.text)
WARNING: modpost: vmlinux.o: section mismatch in reference: sensor_dev_attr_power1_max (section: .data) -> set_reset_devices (section: .init.text)
WARNING: modpost: vmlinux.o: section mismatch in reference: sensor_dev_attr_power1_input_lowest (section: .data) -> set_reset_devices (section: .init.text)
WARNING: modpost: vmlinux.o: section mismatch in reference: sensor_dev_attr_power1_input_highest (section: .data) -> pwm_clk_driver_exit (section: .exit.text)
WARNING: modpost: vmlinux.o: section mismatch in reference: sensor_dev_attr_power1_reset_history (section: .data) -> map_benchmark_cleanup (section: .exit.text)
WARNING: modpost: vmlinux.o: section mismatch in reference: sensor_dev_attr_power1_min_alarm (section: .data) -> map_benchmark_cleanup (section: .exit.text)
WARNING: modpost: vmlinux.o: section mismatch in reference: sensor_dev_attr_power1_max_alarm (section: .data) -> map_benchmark_cleanup (section: .exit.text)
WARNING: modpost: vmlinux.o: section mismatch in reference: sda_in_max (section: .data) -> set_reset_devices (section: .init.text)
WARNING: modpost: vmlinux.o: section mismatch in reference: sda_in_max (section: .data) -> map_benchmark_cleanup (section: .exit.text)
WARNING: modpost: vmlinux.o: section mismatch in reference: sda_in_max (section: .data) -> set_reset_devices (section: .init.text)
WARNING: modpost: vmlinux.o: section mismatch in reference: sda_in_max (section: .data) -> map_benchmark_cleanup (section: .exit.text)
WARNING: modpost: vmlinux.o: section mismatch in reference: sda_in_max (section: .data) -> set_reset_devices (section: .init.text)
WARNING: modpost: vmlinux.o: section mismatch in reference: sda_in_max (section: .data) -> map_benchmark_cleanup (section: .exit.text)
WARNING: modpost: vmlinux.o: section mismatch in reference: cache_target (section: .data) -> set_reset_devices (section: .init.text)
WARNING: modpost: vmlinux.o: section mismatch in reference: cache_target (section: .data) -> .LBB9_19 (section: .init.text)
WARNING: modpost: vmlinux.o: section mismatch in reference: sb_validator (section: .data) -> set_reset_devices (section: .init.text)
WARNING: modpost: vmlinux.o: section mismatch in reference: extcon_attrs (section: .data) -> set_reset_devices (section: .init.text)
WARNING: modpost: vmlinux.o: section mismatch in reference: extcon_attrs (section: .data) -> set_reset_devices (section: .init.text)
WARNING: modpost: vmlinux.o(__ex_table+0xf90): Section mismatch in reference from the (unknown reference) (unknown) to the (unknown reference) .debug_str:(unknown)
ERROR: modpost: __ex_table+0xf90 references non-executable section '.debug_str'
WARNING: modpost: vmlinux.o(__ex_table+0xf94): Section mismatch in reference from the (unknown reference) (unknown) to the (unknown reference) .debug_str:(unknown)
ERROR: modpost: __ex_table+0xf94 references non-executable section '.debug_str'
WARNING: modpost: vmlinux.o(__ex_table+0xf9c): Section mismatch in reference from the (unknown reference) (unknown) to the (unknown reference) .debug_str:(unknown)
ERROR: modpost: __ex_table+0xf9c references non-executable section '.debug_str'
WARNING: modpost: vmlinux.o(__ex_table+0xfa0): Section mismatch in reference from the (unknown reference) (unknown) to the (unknown reference) .debug_str:(unknown)
ERROR: modpost: __ex_table+0xfa0 references non-executable section '.debug_str'
WARNING: modpost: vmlinux.o(__ex_table+0xfa8): Section mismatch in reference from the (unknown reference) (unknown) to the (unknown reference) .debug_str:(unknown)
ERROR: modpost: __ex_table+0xfa8 references non-executable section '.debug_str'
WARNING: modpost: vmlinux.o(__ex_table+0xfac): Section mismatch in reference from the (unknown reference) (unknown) to the (unknown reference) .debug_str:(unknown)
ERROR: modpost: __ex_table+0xfac references non-executable section '.debug_str'
WARNING: modpost: vmlinux.o(__ex_table+0xfb4): Section mismatch in reference from the (unknown reference) (unknown) to the (unknown reference) .debug_str:(unknown)
ERROR: modpost: __ex_table+0xfb4 references non-executable section '.debug_str'
WARNING: modpost: vmlinux.o(__ex_table+0xfb8): Section mismatch in reference from the (unknown reference) (unknown) to the (unknown reference) .debug_str:(unknown)
ERROR: modpost: __ex_table+0xfb8 references non-executable section '.debug_str'
WARNING: modpost: vmlinux.o(__ex_table+0xfc0): Section mismatch in reference from the (unknown reference) (unknown) to the (unknown reference) .debug_str:(unknown)
ERROR: modpost: __ex_table+0xfc0 references non-executable section '.debug_str'
WARNING: modpost: vmlinux.o(__ex_table+0xfc4): Section mismatch in reference from the (unknown reference) (unknown) to the (unknown reference) .debug_str:(unknown)
ERROR: modpost: __ex_table+0xfc4 references non-executable section '.debug_str'
WARNING: modpost: vmlinux.o(__ex_table+0x10b0): Section mismatch in reference from the (unknown reference) (unknown) to the (unknown reference) .debug_str:(unknown)
ERROR: modpost: __ex_table+0x10b0 references non-executable section '.debug_str'
WARNING: modpost: vmlinux.o(__ex_table+0x10b4): Section mismatch in reference from the (unknown reference) (unknown) to the (unknown reference) .debug_str:(unknown)
ERROR: modpost: __ex_table+0x10b4 references non-executable section '.debug_str'
WARNING: modpost: vmlinux.o(__ex_table+0x10c8): Section mismatch in reference from the (unknown reference) (unknown) to the (unknown reference) .debug_str:(unknown)
ERROR: modpost: __ex_table+0x10c8 references non-executable section '.debug_str'
WARNING: modpost: vmlinux.o(__ex_table+0x10cc): Section mismatch in reference from the (unknown reference) (unknown) to the (unknown reference) .debug_str:(unknown)
ERROR: modpost: __ex_table+0x10cc references non-executable section '.debug_str'
WARNING: modpost: vmlinux.o(__ex_table+0x10d4): Section mismatch in reference from the (unknown reference) (unknown) to the (unknown reference) .debug_str:(unknown)
ERROR: modpost: __ex_table+0x10d4 references non-executable section '.debug_str'
WARNING: modpost: vmlinux.o(__ex_table+0x10d8): Section mismatch in reference from the (unknown reference) (unknown) to the (unknown reference) .debug_str:(unknown)
ERROR: modpost: __ex_table+0x10d8 references non-executable section '.debug_str'
WARNING: modpost: vmlinux.o(__ex_table+0x1150): Section mismatch in reference from the (unknown reference) (unknown) to the variable .rodata:trace_raw_output_ext4_get_implied_cluster_alloc_exit.__flags
>> ERROR: modpost: __ex_table+0x1150 references non-executable section '.rodata'
WARNING: modpost: vmlinux.o(__ex_table+0x117c): Section mismatch in reference from the (unknown reference) (unknown) to the (unknown reference) .debug_str:(unknown)
ERROR: modpost: __ex_table+0x117c references non-executable section '.debug_str'
WARNING: modpost: vmlinux.o(__ex_table+0x1180): Section mismatch in reference from the (unknown reference) (unknown) to the (unknown reference) .debug_str:(unknown)
ERROR: modpost: __ex_table+0x1180 references non-executable section '.debug_str'
WARNING: modpost: vmlinux.o(__ex_table+0x1188): Section mismatch in reference from the (unknown reference) (unknown) to the (unknown reference) .debug_str:(unknown)
ERROR: modpost: __ex_table+0x1188 references non-executable section '.debug_str'
WARNING: modpost: vmlinux.o(__ex_table+0x118c): Section mismatch in reference from the (unknown reference) (unknown) to the (unknown reference) .debug_str:(unknown)
ERROR: modpost: __ex_table+0x118c references non-executable section '.debug_str'
WARNING: modpost: vmlinux.o(__ex_table+0x1194): Section mismatch in reference from the (unknown reference) (unknown) to the (unknown reference) .debug_str:(unknown)
ERROR: modpost: __ex_table+0x1194 references non-executable section '.debug_str'
WARNING: modpost: vmlinux.o(__ex_table+0x1198): Section mismatch in reference from the (unknown reference) (unknown) to the (unknown reference) .debug_str:(unknown)
ERROR: modpost: __ex_table+0x1198 references non-executable section '.debug_str'
WARNING: modpost: vmlinux.o(__ex_table+0x11a0): Section mismatch in reference from the (unknown reference) (unknown) to the (unknown reference) .debug_str:(unknown)
ERROR: modpost: __ex_table+0x11a0 references non-executable section '.debug_str'
WARNING: modpost: vmlinux.o(__ex_table+0x11a4): Section mismatch in reference from the (unknown reference) (unknown) to the (unknown reference) .debug_str:(unknown)
ERROR: modpost: __ex_table+0x11a4 references non-executable section '.debug_str'
WARNING: modpost: vmlinux.o(__ex_table+0x11ac): Section mismatch in reference from the (unknown reference) (unknown) to the (unknown reference) .debug_str:(unknown)
ERROR: modpost: __ex_table+0x11ac references non-executable section '.debug_str'
WARNING: modpost: vmlinux.o(__ex_table+0x11b0): Section mismatch in reference from the (unknown reference) (unknown) to the (unknown reference) .debug_str:(unknown)
ERROR: modpost: __ex_table+0x11b0 references non-executable section '.debug_str'
WARNING: modpost: vmlinux.o(__ex_table+0x11b8): Section mismatch in reference from the (unknown reference) (unknown) to the (unknown reference) .debug_str:(unknown)
ERROR: modpost: __ex_table+0x11b8 references non-executable section '.debug_str'
WARNING: modpost: vmlinux.o(__ex_table+0x11bc): Section mismatch in reference from the (unknown reference) (unknown) to the (unknown reference) .debug_str:(unknown)
ERROR: modpost: __ex_table+0x11bc references non-executable section '.debug_str'
WARNING: modpost: vmlinux.o(__ex_table+0x11dc): Section mismatch in reference from the (unknown reference) (unknown) to the (unknown reference) .debug_str:(unknown)
ERROR: modpost: __ex_table+0x11dc references non-executable section '.debug_str'
WARNING: modpost: vmlinux.o(__ex_table+0x11e0): Section mismatch in reference from the (unknown reference) (unknown) to the (unknown reference) .debug_str:(unknown)
ERROR: modpost: __ex_table+0x11e0 references non-executable section '.debug_str'
WARNING: modpost: vmlinux.o(__ex_table+0x11e8): Section mismatch in reference from the (unknown reference) (unknown) to the (unknown reference) .debug_str:(unknown)
ERROR: modpost: __ex_table+0x11e8 references non-executable section '.debug_str'
WARNING: modpost: vmlinux.o(__ex_table+0x11ec): Section mismatch in reference from the (unknown reference) (unknown) to the (unknown reference) .debug_str:(unknown)
ERROR: modpost: __ex_table+0x11ec references non-executable section '.debug_str'
WARNING: modpost: vmlinux.o(__ex_table+0x11f4): Section mismatch in reference from the (unknown reference) (unknown) to the (unknown reference) .debug_str:(unknown)
ERROR: modpost: __ex_table+0x11f4 references non-executable section '.debug_str'
WARNING: modpost: vmlinux.o(__ex_table+0x11f8): Section mismatch in reference from the (unknown reference) (unknown) to the (unknown reference) .debug_str:(unknown)
ERROR: modpost: __ex_table+0x11f8 references non-executable section '.debug_str'
WARNING: modpost: vmlinux.o(__ex_table+0x1218): Section mismatch in reference from the (unknown reference) (unknown) to the (unknown reference) .debug_str:(unknown)
ERROR: modpost: __ex_table+0x1218 references non-executable section '.debug_str'
WARNING: modpost: vmlinux.o(__ex_table+0x121c): Section mismatch in reference from the (unknown reference) (unknown) to the (unknown reference) .debug_str:(unknown)
ERROR: modpost: __ex_table+0x121c references non-executable section '.debug_str'
WARNING: modpost: vmlinux.o(__ex_table+0x1224): Section mismatch in reference from the (unknown reference) (unknown) to the (unknown reference) .debug_str:(unknown)
ERROR: modpost: __ex_table+0x1224 references non-executable section '.debug_str'
WARNING: modpost: vmlinux.o(__ex_table+0x1228): Section mismatch in reference from the (unknown reference) (unknown) to the (unknown reference) .debug_str:(unknown)
ERROR: modpost: __ex_table+0x1228 references non-executable section '.debug_str'
WARNING: modpost: vmlinux.o(__ex_table+0x1230): Section mismatch in reference from the (unknown reference) (unknown) to the (unknown reference) .debug_str:(unknown)
ERROR: modpost: __ex_table+0x1230 references non-executable section '.debug_str'
WARNING: modpost: vmlinux.o(__ex_table+0x1234): Section mismatch in reference from the (unknown reference) (unknown) to the (unknown reference) .debug_str:(unknown)
ERROR: modpost: __ex_table+0x1234 references non-executable section '.debug_str'
WARNING: modpost: vmlinux.o(__ex_table+0x123c): Section mismatch in reference from the (unknown reference) (unknown) to the (unknown reference) .debug_str:(unknown)
ERROR: modpost: __ex_table+0x123c references non-executable section '.debug_str'
WARNING: modpost: vmlinux.o(__ex_table+0x1240): Section mismatch in reference from the (unknown reference) (unknown) to the (unknown reference) .debug_str:(unknown)
ERROR: modpost: __ex_table+0x1240 references non-executable section '.debug_str'
WARNING: modpost: vmlinux.o(__ex_table+0x1254): Section mismatch in reference from the (unknown reference) (unknown) to the variable .rodata.str1.1:.L.str.7
ERROR: modpost: __ex_table+0x1254 references non-executable section '.rodata.str1.1'
WARNING: modpost: vmlinux.o(__ex_table+0x1278): Section mismatch in reference from the (unknown reference) (unknown) to the (unknown reference) .debug_str:(unknown)
ERROR: modpost: __ex_table+0x1278 references non-executable section '.debug_str'
WARNING: modpost: vmlinux.o(__ex_table+0x127c): Section mismatch in reference from the (unknown reference) (unknown) to the (unknown reference) .debug_str:(unknown)
ERROR: modpost: __ex_table+0x127c references non-executable section '.debug_str'
WARNING: modpost: vmlinux.o(__ex_table+0x1284): Section mismatch in reference from the (unknown reference) (unknown) to the (unknown reference) .debug_str:(unknown)
ERROR: modpost: __ex_table+0x1284 references non-executable section '.debug_str'
WARNING: modpost: vmlinux.o(__ex_table+0x1288): Section mismatch in reference from the (unknown reference) (unknown) to the (unknown reference) .debug_str:(unknown)
ERROR: modpost: __ex_table+0x1288 references non-executable section '.debug_str'
WARNING: modpost: vmlinux.o(__ex_table+0x1290): Section mismatch in reference from the (unknown reference) (unknown) to the (unknown reference) .debug_str:(unknown)
ERROR: modpost: __ex_table+0x1290 references non-executable section '.debug_str'
WARNING: modpost: vmlinux.o(__ex_table+0x1294): Section mismatch in reference from the (unknown reference) (unknown) to the (unknown reference) .debug_str:(unknown)
ERROR: modpost: __ex_table+0x1294 references non-executable section '.debug_str'
WARNING: modpost: vmlinux.o(__ex_table+0x129c): Section mismatch in reference from the (unknown reference) (unknown) to the (unknown reference) .debug_str:(unknown)
ERROR: modpost: __ex_table+0x129c references non-executable section '.debug_str'
WARNING: modpost: vmlinux.o(__ex_table+0x12a0): Section mismatch in reference from the (unknown reference) (unknown) to the (unknown reference) .debug_str:(unknown)
ERROR: modpost: __ex_table+0x12a0 references non-executable section '.debug_str'
WARNING: modpost: vmlinux.o(__ex_table+0x12a8): Section mismatch in reference from the (unknown reference) (unknown) to the (unknown reference) .debug_str:(unknown)
ERROR: modpost: __ex_table+0x12a8 references non-executable section '.debug_str'
WARNING: modpost: vmlinux.o(__ex_table+0x12ac): Section mismatch in reference from the (unknown reference) (unknown) to the (unknown reference) .debug_str:(unknown)
ERROR: modpost: __ex_table+0x12ac references non-executable section '.debug_str'
WARNING: modpost: vmlinux.o(__ex_table+0x12b4): Section mismatch in reference from the (unknown reference) (unknown) to the (unknown reference) .debug_str:(unknown)
ERROR: modpost: __ex_table+0x12b4 references non-executable section '.debug_str'
WARNING: modpost: vmlinux.o(__ex_table+0x12b8): Section mismatch in reference from the (unknown reference) (unknown) to the (unknown reference) .debug_str:(unknown)
ERROR: modpost: __ex_table+0x12b8 references non-executable section '.debug_str'
WARNING: modpost: vmlinux.o(__ex_table+0x12c0): Section mismatch in reference from the (unknown reference) (unknown) to the (unknown reference) .debug_str:(unknown)
ERROR: modpost: __ex_table+0x12c0 references non-executable section '.debug_str'
WARNING: modpost: vmlinux.o(__ex_table+0x12c4): Section mismatch in reference from the (unknown reference) (unknown) to the (unknown reference) .debug_str:(unknown)
ERROR: modpost: __ex_table+0x12c4 references non-executable section '.debug_str'
WARNING: modpost: vmlinux.o(__ex_table+0x12cc): Section mismatch in reference from the (unknown reference) (unknown) to the (unknown reference) .debug_str:(unknown)
ERROR: modpost: __ex_table+0x12cc references non-executable section '.debug_str'
WARNING: modpost: vmlinux.o(__ex_table+0x12d0): Section mismatch in reference from the (unknown reference) (unknown) to the (unknown reference) .debug_str:(unknown)
ERROR: modpost: __ex_table+0x12d0 references non-executable section '.debug_str'
WARNING: modpost: vmlinux.o(__ex_table+0x12d8): Section mismatch in reference from the (unknown reference) (unknown) to the (unknown reference) .debug_str:(unknown)
ERROR: modpost: __ex_table+0x12d8 references non-executable section '.debug_str'
WARNING: modpost: vmlinux.o(__ex_table+0x12dc): Section mismatch in reference from the (unknown reference) (unknown) to the (unknown reference) .debug_str:(unknown)
ERROR: modpost: __ex_table+0x12dc references non-executable section '.debug_str'
WARNING: modpost: vmlinux.o(__ex_table+0x12e4): Section mismatch in reference from the (unknown reference) (unknown) to the (unknown reference) .debug_str:(unknown)
ERROR: modpost: __ex_table+0x12e4 references non-executable section '.debug_str'
WARNING: modpost: vmlinux.o(__ex_table+0x12e8): Section mismatch in reference from the (unknown reference) (unknown) to the (unknown reference) .debug_str:(unknown)
ERROR: modpost: __ex_table+0x12e8 references non-executable section '.debug_str'
WARNING: modpost: vmlinux.o(__ex_table+0x12f0): Section mismatch in reference from the (unknown reference) (unknown) to the (unknown reference) .debug_str:(unknown)
ERROR: modpost: __ex_table+0x12f0 references non-executable section '.debug_str'
WARNING: modpost: vmlinux.o(__ex_table+0x12f4): Section mismatch in reference from the (unknown reference) (unknown) to the (unknown reference) .debug_str:(unknown)
ERROR: modpost: __ex_table+0x12f4 references non-executable section '.debug_str'
WARNING: modpost: vmlinux.o(__ex_table+0x12fc): Section mismatch in reference from the (unknown reference) (unknown) to the (unknown reference) .debug_str:(unknown)
ERROR: modpost: __ex_table+0x12fc references non-executable section '.debug_str'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
