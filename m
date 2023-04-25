Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6A667B
	for <oe-kbuild-all@lists.linux.dev>; Tue, 25 Apr 2023 11:29:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1682422176; x=1713958176;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=YkLG//Fvm+EmmAwbenVOXMKUHgEirtQG+vzBOMPVpkI=;
  b=R+g6fhfZl5ucdWIc2wKLGcQ8ZfrSmSEckjr81Zg5eCUwLTiDDeLu4L9o
   UBLyegB69dFqUHg9B0zBJWVaO32bsXxubl3C64+uuswrMQqD5D3fFodjg
   XHKneK9gmXJN4CY0zf6EVTGd5rmObVHvw+qLgDrRF3xUL5DX8f9fD/NMt
   oViN8+CX1iuGcGgoyOExzjDZrZ8BlsHllDAUj9FVqYDq1i396tbp5Xy6P
   cbsNp2VFWa4XaDF0OMG4xiqjvljEFv5ZDIN8tX6d8JjBCigiOdi4Yof8T
   cbuNpfAYF+Ye7cVrEBG54/SwKrxWpOb0xAWr3fEJwF4XoyUbXVnm4RjYQ
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10690"; a="409683809"
X-IronPort-AV: E=Sophos;i="5.99,225,1677571200"; 
   d="scan'208";a="409683809"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Apr 2023 04:29:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10690"; a="867846429"
X-IronPort-AV: E=Sophos;i="5.99,225,1677571200"; 
   d="scan'208";a="867846429"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 25 Apr 2023 04:29:33 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1prGrV-000jMK-0P;
	Tue, 25 Apr 2023 11:29:33 +0000
Date: Tue, 25 Apr 2023 19:29:19 +0800
From: kernel test robot <lkp@intel.com>
To: Lino Sanfilippo <l.sanfilippo@kunbus.com>
Cc: oe-kbuild-all@lists.linux.dev, Jarkko Sakkinen <jarkko@kernel.org>
Subject: [jarkko-tpmdd:tis-irq 74/75] vmlinux.o: warning: objtool:
 ___ksymtab_gpl+tpm_chip_startup+0x0: data relocation to !ENDBR:
 tpm_chip_startup+0x0
Message-ID: <202304251925.HQ2uDNkW-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/jarkko/linux-tpmdd.git tis-irq
head:   6cea73a6f10e7c9d07f77bb894d6aa4a29ed7bd8
commit: 240237f7c90799c19666553c762eab1b80bd5552 [74/75] tpm, tpm_tis: startup chip before testing for interrupts
config: x86_64-rhel-8.3 (https://download.01.org/0day-ci/archive/20230425/202304251925.HQ2uDNkW-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce (this is a W=1 build):
        # https://git.kernel.org/pub/scm/linux/kernel/git/jarkko/linux-tpmdd.git/commit/?id=240237f7c90799c19666553c762eab1b80bd5552
        git remote add jarkko-tpmdd git://git.kernel.org/pub/scm/linux/kernel/git/jarkko/linux-tpmdd.git
        git fetch --no-tags jarkko-tpmdd tis-irq
        git checkout 240237f7c90799c19666553c762eab1b80bd5552
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=x86_64 olddefconfig
        make W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304251925.HQ2uDNkW-lkp@intel.com/

All warnings (new ones prefixed by >>):

   vmlinux.o: warning: objtool: ___ksymtab_gpl+uart_set_options+0x0: data relocation to !ENDBR: uart_set_options+0x0
   vmlinux.o: warning: objtool: ___ksymtab+uart_suspend_port+0x0: data relocation to !ENDBR: uart_suspend_port+0x0
   vmlinux.o: warning: objtool: ___ksymtab+uart_resume_port+0x0: data relocation to !ENDBR: uart_resume_port+0x0
   vmlinux.o: warning: objtool: ___ksymtab+uart_register_driver+0x0: data relocation to !ENDBR: uart_register_driver+0x0
   vmlinux.o: warning: objtool: ___ksymtab+uart_unregister_driver+0x0: data relocation to !ENDBR: uart_unregister_driver+0x0
   vmlinux.o: warning: objtool: ___ksymtab_gpl+uart_console_device+0x0: data relocation to !ENDBR: uart_console_device+0x0
   vmlinux.o: warning: objtool: ___ksymtab+uart_add_one_port+0x0: data relocation to !ENDBR: uart_add_one_port+0x0
   vmlinux.o: warning: objtool: ___ksymtab+uart_remove_one_port+0x0: data relocation to !ENDBR: uart_remove_one_port+0x0
   vmlinux.o: warning: objtool: ___ksymtab+uart_match_port+0x0: data relocation to !ENDBR: uart_match_port+0x0
   vmlinux.o: warning: objtool: ___ksymtab_gpl+uart_handle_dcd_change+0x0: data relocation to !ENDBR: uart_handle_dcd_change+0x0
   vmlinux.o: warning: objtool: ___ksymtab_gpl+uart_handle_cts_change+0x0: data relocation to !ENDBR: uart_handle_cts_change+0x0
   vmlinux.o: warning: objtool: ___ksymtab_gpl+uart_insert_char+0x0: data relocation to !ENDBR: uart_insert_char+0x0
   vmlinux.o: warning: objtool: ___ksymtab_gpl+uart_try_toggle_sysrq+0x0: data relocation to !ENDBR: uart_try_toggle_sysrq+0x0
   vmlinux.o: warning: objtool: ___ksymtab_gpl+uart_get_rs485_mode+0x0: data relocation to !ENDBR: uart_get_rs485_mode+0x0
   vmlinux.o: warning: objtool: ___ksymtab_gpl+serial8250_get_port+0x0: data relocation to !ENDBR: serial8250_get_port+0x0
   vmlinux.o: warning: objtool: ___ksymtab+serial8250_set_isa_configurator+0x0: data relocation to !ENDBR: serial8250_set_isa_configurator+0x0
   vmlinux.o: warning: objtool: ___ksymtab+serial8250_suspend_port+0x0: data relocation to !ENDBR: serial8250_suspend_port+0x0
   vmlinux.o: warning: objtool: ___ksymtab+serial8250_resume_port+0x0: data relocation to !ENDBR: serial8250_resume_port+0x0
   vmlinux.o: warning: objtool: ___ksymtab+serial8250_register_8250_port+0x0: data relocation to !ENDBR: serial8250_register_8250_port+0x0
   vmlinux.o: warning: objtool: ___ksymtab+serial8250_unregister_port+0x0: data relocation to !ENDBR: serial8250_unregister_port+0x0
   vmlinux.o: warning: objtool: ___ksymtab_gpl+serial8250_clear_and_reinit_fifos+0x0: data relocation to !ENDBR: serial8250_clear_and_reinit_fifos+0x0
   vmlinux.o: warning: objtool: ___ksymtab_gpl+serial8250_rpm_get+0x0: data relocation to !ENDBR: serial8250_rpm_get+0x0
   vmlinux.o: warning: objtool: ___ksymtab_gpl+serial8250_rpm_put+0x0: data relocation to !ENDBR: serial8250_rpm_put+0x0
   vmlinux.o: warning: objtool: ___ksymtab_gpl+serial8250_em485_destroy+0x0: data relocation to !ENDBR: serial8250_em485_destroy+0x0
   vmlinux.o: warning: objtool: ___ksymtab_gpl+serial8250_em485_config+0x0: data relocation to !ENDBR: serial8250_em485_config+0x0
   vmlinux.o: warning: objtool: ___ksymtab_gpl+serial8250_rpm_get_tx+0x0: data relocation to !ENDBR: serial8250_rpm_get_tx+0x0
   vmlinux.o: warning: objtool: ___ksymtab_gpl+serial8250_rpm_put_tx+0x0: data relocation to !ENDBR: serial8250_rpm_put_tx+0x0
   vmlinux.o: warning: objtool: ___ksymtab_gpl+serial8250_em485_stop_tx+0x0: data relocation to !ENDBR: serial8250_em485_stop_tx+0x0
   vmlinux.o: warning: objtool: ___ksymtab_gpl+serial8250_em485_start_tx+0x0: data relocation to !ENDBR: serial8250_em485_start_tx+0x0
   vmlinux.o: warning: objtool: ___ksymtab_gpl+serial8250_read_char+0x0: data relocation to !ENDBR: serial8250_read_char+0x0
   vmlinux.o: warning: objtool: ___ksymtab_gpl+serial8250_rx_chars+0x0: data relocation to !ENDBR: serial8250_rx_chars+0x0
   vmlinux.o: warning: objtool: ___ksymtab_gpl+serial8250_tx_chars+0x0: data relocation to !ENDBR: serial8250_tx_chars+0x0
   vmlinux.o: warning: objtool: ___ksymtab_gpl+serial8250_modem_status+0x0: data relocation to !ENDBR: serial8250_modem_status+0x0
   vmlinux.o: warning: objtool: ___ksymtab_gpl+serial8250_handle_irq+0x0: data relocation to !ENDBR: serial8250_handle_irq+0x0
   vmlinux.o: warning: objtool: ___ksymtab_gpl+serial8250_do_get_mctrl+0x0: data relocation to !ENDBR: serial8250_do_get_mctrl+0x0
   vmlinux.o: warning: objtool: ___ksymtab_gpl+serial8250_do_set_mctrl+0x0: data relocation to !ENDBR: serial8250_do_set_mctrl+0x0
   vmlinux.o: warning: objtool: ___ksymtab_gpl+serial8250_do_startup+0x0: data relocation to !ENDBR: serial8250_do_startup+0x0
   vmlinux.o: warning: objtool: ___ksymtab_gpl+serial8250_do_shutdown+0x0: data relocation to !ENDBR: serial8250_do_shutdown+0x0
   vmlinux.o: warning: objtool: ___ksymtab_gpl+serial8250_do_set_divisor+0x0: data relocation to !ENDBR: serial8250_do_set_divisor+0x0
   vmlinux.o: warning: objtool: ___ksymtab_gpl+serial8250_update_uartclk+0x0: data relocation to !ENDBR: serial8250_update_uartclk+0x0
   vmlinux.o: warning: objtool: ___ksymtab+serial8250_do_set_termios+0x0: data relocation to !ENDBR: serial8250_do_set_termios+0x0
   vmlinux.o: warning: objtool: ___ksymtab_gpl+serial8250_do_set_ldisc+0x0: data relocation to !ENDBR: serial8250_do_set_ldisc+0x0
   vmlinux.o: warning: objtool: ___ksymtab+serial8250_do_pm+0x0: data relocation to !ENDBR: serial8250_do_pm+0x0
   vmlinux.o: warning: objtool: ___ksymtab_gpl+serial8250_init_port+0x0: data relocation to !ENDBR: serial8250_init_port+0x0
   vmlinux.o: warning: objtool: ___ksymtab_gpl+serial8250_set_defaults+0x0: data relocation to !ENDBR: serial8250_set_defaults+0x0
   vmlinux.o: warning: objtool: ___ksymtab_gpl+serial8250_rx_dma_flush+0x0: data relocation to !ENDBR: serial8250_rx_dma_flush+0x0
   vmlinux.o: warning: objtool: ___ksymtab_gpl+serial8250_request_dma+0x0: data relocation to !ENDBR: serial8250_request_dma+0x0
   vmlinux.o: warning: objtool: ___ksymtab_gpl+serial8250_release_dma+0x0: data relocation to !ENDBR: serial8250_release_dma+0x0
   vmlinux.o: warning: objtool: ___ksymtab_gpl+dw8250_do_set_termios+0x0: data relocation to !ENDBR: dw8250_do_set_termios+0x0
   vmlinux.o: warning: objtool: ___ksymtab_gpl+dw8250_setup_port+0x0: data relocation to !ENDBR: dw8250_setup_port+0x0
   vmlinux.o: warning: objtool: ___ksymtab_gpl+serial8250_pci_setup_port+0x0: data relocation to !ENDBR: serial8250_pci_setup_port+0x0
   vmlinux.o: warning: objtool: ___ksymtab_gpl+pciserial_init_ports+0x0: data relocation to !ENDBR: pciserial_init_ports+0x0
   vmlinux.o: warning: objtool: ___ksymtab_gpl+pciserial_remove_ports+0x0: data relocation to !ENDBR: pciserial_remove_ports+0x0
   vmlinux.o: warning: objtool: ___ksymtab_gpl+pciserial_suspend_ports+0x0: data relocation to !ENDBR: pciserial_suspend_ports+0x0
   vmlinux.o: warning: objtool: ___ksymtab_gpl+pciserial_resume_ports+0x0: data relocation to !ENDBR: pciserial_resume_ports+0x0
   vmlinux.o: warning: objtool: __UNIQUE_ID___earlycon_uart250+0x90: data relocation to !ENDBR: early_serial8250_setup+0x0
   vmlinux.o: warning: objtool: __UNIQUE_ID___earlycon_uart249+0x90: data relocation to !ENDBR: early_serial8250_setup+0x0
   vmlinux.o: warning: objtool: __UNIQUE_ID___earlycon_ns16550a248+0x90: data relocation to !ENDBR: early_serial8250_setup+0x0
   vmlinux.o: warning: objtool: __UNIQUE_ID___earlycon_ns16550247+0x90: data relocation to !ENDBR: early_serial8250_setup+0x0
   vmlinux.o: warning: objtool: __UNIQUE_ID___earlycon_uart246+0x90: data relocation to !ENDBR: early_serial8250_setup+0x0
   vmlinux.o: warning: objtool: __UNIQUE_ID___earlycon_uart8250245+0x90: data relocation to !ENDBR: early_serial8250_setup+0x0
   vmlinux.o: warning: objtool: __UNIQUE_ID___earlycon_efifb249+0x90: data relocation to !ENDBR: efi_earlycon_setup+0x0
   vmlinux.o: warning: objtool: ___ksymtab_gpl+mctrl_gpio_set+0x0: data relocation to !ENDBR: mctrl_gpio_set+0x0
   vmlinux.o: warning: objtool: ___ksymtab_gpl+mctrl_gpio_to_gpiod+0x0: data relocation to !ENDBR: mctrl_gpio_to_gpiod+0x0
   vmlinux.o: warning: objtool: ___ksymtab_gpl+mctrl_gpio_get+0x0: data relocation to !ENDBR: mctrl_gpio_get+0x0
   vmlinux.o: warning: objtool: ___ksymtab_gpl+mctrl_gpio_get_outputs+0x0: data relocation to !ENDBR: mctrl_gpio_get_outputs+0x0
   vmlinux.o: warning: objtool: ___ksymtab_gpl+mctrl_gpio_init_noauto+0x0: data relocation to !ENDBR: mctrl_gpio_init_noauto+0x0
   vmlinux.o: warning: objtool: ___ksymtab_gpl+mctrl_gpio_init+0x0: data relocation to !ENDBR: mctrl_gpio_init+0x0
   vmlinux.o: warning: objtool: ___ksymtab_gpl+mctrl_gpio_free+0x0: data relocation to !ENDBR: mctrl_gpio_free+0x0
   vmlinux.o: warning: objtool: ___ksymtab_gpl+mctrl_gpio_enable_ms+0x0: data relocation to !ENDBR: mctrl_gpio_enable_ms+0x0
   vmlinux.o: warning: objtool: ___ksymtab_gpl+mctrl_gpio_disable_ms+0x0: data relocation to !ENDBR: mctrl_gpio_disable_ms+0x0
   vmlinux.o: warning: objtool: ___ksymtab_gpl+mctrl_gpio_enable_irq_wake+0x0: data relocation to !ENDBR: mctrl_gpio_enable_irq_wake+0x0
   vmlinux.o: warning: objtool: ___ksymtab_gpl+mctrl_gpio_disable_irq_wake+0x0: data relocation to !ENDBR: mctrl_gpio_disable_irq_wake+0x0
   vmlinux.o: warning: objtool: ___ksymtab+rng_is_initialized+0x0: data relocation to !ENDBR: rng_is_initialized+0x0
   vmlinux.o: warning: objtool: ___ksymtab+wait_for_random_bytes+0x0: data relocation to !ENDBR: wait_for_random_bytes+0x0
   vmlinux.o: warning: objtool: ___ksymtab+get_random_bytes+0x0: data relocation to !ENDBR: get_random_bytes+0x0
   vmlinux.o: warning: objtool: ___ksymtab+get_random_u8+0x0: data relocation to !ENDBR: get_random_u8+0x0
   vmlinux.o: warning: objtool: ___ksymtab+get_random_u16+0x0: data relocation to !ENDBR: get_random_u16+0x0
   vmlinux.o: warning: objtool: ___ksymtab+get_random_u32+0x0: data relocation to !ENDBR: get_random_u32+0x0
   vmlinux.o: warning: objtool: ___ksymtab+get_random_u64+0x0: data relocation to !ENDBR: get_random_u64+0x0
   vmlinux.o: warning: objtool: ___ksymtab+__get_random_u32_below+0x0: data relocation to !ENDBR: __get_random_u32_below+0x0
   vmlinux.o: warning: objtool: ___ksymtab+add_device_randomness+0x0: data relocation to !ENDBR: add_device_randomness+0x0
   vmlinux.o: warning: objtool: ___ksymtab_gpl+add_hwgenerator_randomness+0x0: data relocation to !ENDBR: add_hwgenerator_randomness+0x0
   vmlinux.o: warning: objtool: ___ksymtab_gpl+add_interrupt_randomness+0x0: data relocation to !ENDBR: add_interrupt_randomness+0x0
   vmlinux.o: warning: objtool: ___ksymtab_gpl+add_input_randomness+0x0: data relocation to !ENDBR: add_input_randomness+0x0
   vmlinux.o: warning: objtool: ___ksymtab_gpl+add_disk_randomness+0x0: data relocation to !ENDBR: add_disk_randomness+0x0
   vmlinux.o: warning: objtool: ___ksymtab+misc_register+0x0: data relocation to !ENDBR: misc_register+0x0
   vmlinux.o: warning: objtool: ___ksymtab+misc_deregister+0x0: data relocation to !ENDBR: misc_deregister+0x0
   vmlinux.o: warning: objtool: ___ksymtab_gpl+hwrng_register+0x0: data relocation to !ENDBR: hwrng_register+0x0
   vmlinux.o: warning: objtool: ___ksymtab_gpl+hwrng_unregister+0x0: data relocation to !ENDBR: hwrng_unregister+0x0
   vmlinux.o: warning: objtool: ___ksymtab_gpl+devm_hwrng_register+0x0: data relocation to !ENDBR: devm_hwrng_register+0x0
   vmlinux.o: warning: objtool: ___ksymtab_gpl+devm_hwrng_unregister+0x0: data relocation to !ENDBR: devm_hwrng_unregister+0x0
   vmlinux.o: warning: objtool: ___ksymtab_gpl+hwrng_msleep+0x0: data relocation to !ENDBR: hwrng_msleep+0x0
   vmlinux.o: warning: objtool: ___ksymtab_gpl+tpm_chip_start+0x0: data relocation to !ENDBR: tpm_chip_start+0x0
   vmlinux.o: warning: objtool: ___ksymtab_gpl+tpm_chip_stop+0x0: data relocation to !ENDBR: tpm_chip_stop+0x0
   vmlinux.o: warning: objtool: ___ksymtab_gpl+tpm_try_get_ops+0x0: data relocation to !ENDBR: tpm_try_get_ops+0x0
   vmlinux.o: warning: objtool: ___ksymtab_gpl+tpm_put_ops+0x0: data relocation to !ENDBR: tpm_put_ops+0x0
   vmlinux.o: warning: objtool: ___ksymtab_gpl+tpm_default_chip+0x0: data relocation to !ENDBR: tpm_default_chip+0x0
   vmlinux.o: warning: objtool: ___ksymtab_gpl+tpm_chip_alloc+0x0: data relocation to !ENDBR: tpm_chip_alloc+0x0
   vmlinux.o: warning: objtool: ___ksymtab_gpl+tpmm_chip_alloc+0x0: data relocation to !ENDBR: tpmm_chip_alloc+0x0
>> vmlinux.o: warning: objtool: ___ksymtab_gpl+tpm_chip_startup+0x0: data relocation to !ENDBR: tpm_chip_startup+0x0
   vmlinux.o: warning: objtool: ___ksymtab_gpl+tpm_chip_register+0x0: data relocation to !ENDBR: tpm_chip_register+0x0
   vmlinux.o: warning: objtool: ___ksymtab_gpl+tpm_chip_unregister+0x0: data relocation to !ENDBR: tpm_chip_unregister+0x0
   vmlinux.o: warning: objtool: ___ksymtab_gpl+tpm_calc_ordinal_duration+0x0: data relocation to !ENDBR: tpm_calc_ordinal_duration+0x0
   vmlinux.o: warning: objtool: ___ksymtab_gpl+tpm_transmit_cmd+0x0: data relocation to !ENDBR: tpm_transmit_cmd+0x0
   vmlinux.o: warning: objtool: ___ksymtab_gpl+tpm_get_timeouts+0x0: data relocation to !ENDBR: tpm_get_timeouts+0x0
   vmlinux.o: warning: objtool: ___ksymtab_gpl+tpm_is_tpm2+0x0: data relocation to !ENDBR: tpm_is_tpm2+0x0
   vmlinux.o: warning: objtool: ___ksymtab_gpl+tpm_pcr_read+0x0: data relocation to !ENDBR: tpm_pcr_read+0x0
   vmlinux.o: warning: objtool: ___ksymtab_gpl+tpm_pcr_extend+0x0: data relocation to !ENDBR: tpm_pcr_extend+0x0
   vmlinux.o: warning: objtool: ___ksymtab_gpl+tpm_send+0x0: data relocation to !ENDBR: tpm_send+0x0
   vmlinux.o: warning: objtool: ___ksymtab_gpl+tpm_pm_suspend+0x0: data relocation to !ENDBR: tpm_pm_suspend+0x0
   vmlinux.o: warning: objtool: ___ksymtab_gpl+tpm_pm_resume+0x0: data relocation to !ENDBR: tpm_pm_resume+0x0
   vmlinux.o: warning: objtool: ___ksymtab_gpl+tpm_get_random+0x0: data relocation to !ENDBR: tpm_get_random+0x0
   vmlinux.o: warning: objtool: ___ksymtab_gpl+tpm1_getcap+0x0: data relocation to !ENDBR: tpm1_getcap+0x0
   vmlinux.o: warning: objtool: ___ksymtab_gpl+tpm1_do_selftest+0x0: data relocation to !ENDBR: tpm1_do_selftest+0x0
   vmlinux.o: warning: objtool: ___ksymtab_gpl+tpm2_flush_context+0x0: data relocation to !ENDBR: tpm2_flush_context+0x0
   vmlinux.o: warning: objtool: ___ksymtab_gpl+tpm2_get_tpm_pt+0x0: data relocation to !ENDBR: tpm2_get_tpm_pt+0x0
   vmlinux.o: warning: objtool: ___ksymtab_gpl+tpm2_probe+0x0: data relocation to !ENDBR: tpm2_probe+0x0
   vmlinux.o: warning: objtool: ___ksymtab_gpl+tpm2_get_cc_attrs_tbl+0x0: data relocation to !ENDBR: tpm2_get_cc_attrs_tbl+0x0
   vmlinux.o: warning: objtool: ___ksymtab_gpl+tpm_tis_remove+0x0: data relocation to !ENDBR: tpm_tis_remove+0x0
   vmlinux.o: warning: objtool: ___ksymtab_gpl+tpm_tis_core_init+0x0: data relocation to !ENDBR: tpm_tis_core_init+0x0
   vmlinux.o: warning: objtool: ___ksymtab_gpl+tpm_tis_resume+0x0: data relocation to !ENDBR: tpm_tis_resume+0x0
   vmlinux.o: warning: objtool: ___ksymtab_gpl+dmar_platform_optin+0x0: data relocation to !ENDBR: dmar_platform_optin+0x0
   vmlinux.o: warning: objtool: ___ksymtab_gpl+iommu_device_register+0x0: data relocation to !ENDBR: iommu_device_register+0x0
   vmlinux.o: warning: objtool: ___ksymtab_gpl+iommu_device_unregister+0x0: data relocation to !ENDBR: iommu_device_unregister+0x0
   vmlinux.o: warning: objtool: ___ksymtab_gpl+iommu_get_group_resv_regions+0x0: data relocation to !ENDBR: iommu_get_group_resv_regions+0x0
   vmlinux.o: warning: objtool: ___ksymtab_gpl+iommu_group_alloc+0x0: data relocation to !ENDBR: iommu_group_alloc+0x0
   vmlinux.o: warning: objtool: ___ksymtab_gpl+iommu_group_get_by_id+0x0: data relocation to !ENDBR: iommu_group_get_by_id+0x0
   vmlinux.o: warning: objtool: ___ksymtab_gpl+iommu_group_get_iommudata+0x0: data relocation to !ENDBR: iommu_group_get_iommudata+0x0
   vmlinux.o: warning: objtool: ___ksymtab_gpl+iommu_group_set_iommudata+0x0: data relocation to !ENDBR: iommu_group_set_iommudata+0x0
   vmlinux.o: warning: objtool: ___ksymtab_gpl+iommu_group_set_name+0x0: data relocation to !ENDBR: iommu_group_set_name+0x0
   vmlinux.o: warning: objtool: ___ksymtab_gpl+iommu_group_add_device+0x0: data relocation to !ENDBR: iommu_group_add_device+0x0
   vmlinux.o: warning: objtool: ___ksymtab_gpl+iommu_group_remove_device+0x0: data relocation to !ENDBR: iommu_group_remove_device+0x0
   vmlinux.o: warning: objtool: ___ksymtab_gpl+iommu_group_for_each_dev+0x0: data relocation to !ENDBR: iommu_group_for_each_dev+0x0
   vmlinux.o: warning: objtool: ___ksymtab_gpl+iommu_group_get+0x0: data relocation to !ENDBR: iommu_group_get+0x0
   vmlinux.o: warning: objtool: ___ksymtab_gpl+iommu_group_ref_get+0x0: data relocation to !ENDBR: iommu_group_ref_get+0x0
   vmlinux.o: warning: objtool: ___ksymtab_gpl+iommu_group_put+0x0: data relocation to !ENDBR: iommu_group_put+0x0
   vmlinux.o: warning: objtool: ___ksymtab_gpl+iommu_register_device_fault_handler+0x0: data relocation to !ENDBR: iommu_register_device_fault_handler+0x0
   vmlinux.o: warning: objtool: ___ksymtab_gpl+iommu_unregister_device_fault_handler+0x0: data relocation to !ENDBR: iommu_unregister_device_fault_handler+0x0
   vmlinux.o: warning: objtool: ___ksymtab_gpl+iommu_report_device_fault+0x0: data relocation to !ENDBR: iommu_report_device_fault+0x0
   vmlinux.o: warning: objtool: ___ksymtab_gpl+iommu_page_response+0x0: data relocation to !ENDBR: iommu_page_response+0x0
   vmlinux.o: warning: objtool: ___ksymtab_gpl+iommu_group_id+0x0: data relocation to !ENDBR: iommu_group_id+0x0
   vmlinux.o: warning: objtool: ___ksymtab_gpl+generic_device_group+0x0: data relocation to !ENDBR: generic_device_group+0x0
   vmlinux.o: warning: objtool: ___ksymtab_gpl+pci_device_group+0x0: data relocation to !ENDBR: pci_device_group+0x0
   vmlinux.o: warning: objtool: ___ksymtab_gpl+fsl_mc_device_group+0x0: data relocation to !ENDBR: fsl_mc_device_group+0x0
   vmlinux.o: warning: objtool: ___ksymtab_gpl+iommu_present+0x0: data relocation to !ENDBR: iommu_present+0x0
   vmlinux.o: warning: objtool: ___ksymtab_gpl+device_iommu_capable+0x0: data relocation to !ENDBR: device_iommu_capable+0x0
   vmlinux.o: warning: objtool: ___ksymtab_gpl+iommu_group_has_isolated_msi+0x0: data relocation to !ENDBR: iommu_group_has_isolated_msi+0x0
   vmlinux.o: warning: objtool: ___ksymtab_gpl+iommu_set_fault_handler+0x0: data relocation to !ENDBR: iommu_set_fault_handler+0x0
   vmlinux.o: warning: objtool: ___ksymtab_gpl+iommu_domain_alloc+0x0: data relocation to !ENDBR: iommu_domain_alloc+0x0
   vmlinux.o: warning: objtool: ___ksymtab_gpl+iommu_domain_free+0x0: data relocation to !ENDBR: iommu_domain_free+0x0
   vmlinux.o: warning: objtool: ___ksymtab_gpl+iommu_attach_device+0x0: data relocation to !ENDBR: iommu_attach_device+0x0
   vmlinux.o: warning: objtool: ___ksymtab_gpl+iommu_detach_device+0x0: data relocation to !ENDBR: iommu_detach_device+0x0
   vmlinux.o: warning: objtool: ___ksymtab_gpl+iommu_get_domain_for_dev+0x0: data relocation to !ENDBR: iommu_get_domain_for_dev+0x0
   vmlinux.o: warning: objtool: ___ksymtab_gpl+iommu_attach_group+0x0: data relocation to !ENDBR: iommu_attach_group+0x0
   vmlinux.o: warning: objtool: ___ksymtab_gpl+iommu_detach_group+0x0: data relocation to !ENDBR: iommu_detach_group+0x0
   vmlinux.o: warning: objtool: ___ksymtab_gpl+iommu_iova_to_phys+0x0: data relocation to !ENDBR: iommu_iova_to_phys+0x0
   vmlinux.o: warning: objtool: ___ksymtab_gpl+iommu_map+0x0: data relocation to !ENDBR: iommu_map+0x0
   vmlinux.o: warning: objtool: ___ksymtab_gpl+iommu_unmap+0x0: data relocation to !ENDBR: iommu_unmap+0x0
   vmlinux.o: warning: objtool: ___ksymtab_gpl+iommu_unmap_fast+0x0: data relocation to !ENDBR: iommu_unmap_fast+0x0
   vmlinux.o: warning: objtool: ___ksymtab_gpl+iommu_map_sg+0x0: data relocation to !ENDBR: iommu_map_sg+0x0
   vmlinux.o: warning: objtool: ___ksymtab_gpl+report_iommu_fault+0x0: data relocation to !ENDBR: report_iommu_fault+0x0
   vmlinux.o: warning: objtool: ___ksymtab_gpl+iommu_enable_nesting+0x0: data relocation to !ENDBR: iommu_enable_nesting+0x0
   vmlinux.o: warning: objtool: ___ksymtab_gpl+iommu_set_pgtable_quirks+0x0: data relocation to !ENDBR: iommu_set_pgtable_quirks+0x0
   vmlinux.o: warning: objtool: ___ksymtab+iommu_put_resv_regions+0x0: data relocation to !ENDBR: iommu_put_resv_regions+0x0
   vmlinux.o: warning: objtool: ___ksymtab_gpl+iommu_alloc_resv_region+0x0: data relocation to !ENDBR: iommu_alloc_resv_region+0x0
   vmlinux.o: warning: objtool: ___ksymtab_gpl+iommu_default_passthrough+0x0: data relocation to !ENDBR: iommu_default_passthrough+0x0
   vmlinux.o: warning: objtool: ___ksymtab_gpl+iommu_fwspec_init+0x0: data relocation to !ENDBR: iommu_fwspec_init+0x0
   vmlinux.o: warning: objtool: ___ksymtab_gpl+iommu_fwspec_free+0x0: data relocation to !ENDBR: iommu_fwspec_free+0x0
   vmlinux.o: warning: objtool: ___ksymtab_gpl+iommu_fwspec_add_ids+0x0: data relocation to !ENDBR: iommu_fwspec_add_ids+0x0
   vmlinux.o: warning: objtool: ___ksymtab_gpl+iommu_dev_enable_feature+0x0: data relocation to !ENDBR: iommu_dev_enable_feature+0x0
   vmlinux.o: warning: objtool: ___ksymtab_gpl+iommu_dev_disable_feature+0x0: data relocation to !ENDBR: iommu_dev_disable_feature+0x0
   vmlinux.o: warning: objtool: ___ksymtab_gpl+iommu_group_claim_dma_owner+0x0: data relocation to !ENDBR: iommu_group_claim_dma_owner+0x0
   vmlinux.o: warning: objtool: ___ksymtab_gpl+iommu_device_claim_dma_owner+0x0: data relocation to !ENDBR: iommu_device_claim_dma_owner+0x0
   vmlinux.o: warning: objtool: ___ksymtab_gpl+iommu_group_release_dma_owner+0x0: data relocation to !ENDBR: iommu_group_release_dma_owner+0x0
   vmlinux.o: warning: objtool: ___ksymtab_gpl+iommu_device_release_dma_owner+0x0: data relocation to !ENDBR: iommu_device_release_dma_owner+0x0
   vmlinux.o: warning: objtool: ___ksymtab_gpl+iommu_group_dma_owner_claimed+0x0: data relocation to !ENDBR: iommu_group_dma_owner_claimed+0x0
   vmlinux.o: warning: objtool: ___ksymtab_gpl+iommu_attach_device_pasid+0x0: data relocation to !ENDBR: iommu_attach_device_pasid+0x0
   vmlinux.o: warning: objtool: ___ksymtab_gpl+iommu_detach_device_pasid+0x0: data relocation to !ENDBR: iommu_detach_device_pasid+0x0
   vmlinux.o: warning: objtool: ___ksymtab_gpl+iommu_get_domain_for_dev_pasid+0x0: data relocation to !ENDBR: iommu_get_domain_for_dev_pasid+0x0
   vmlinux.o: warning: objtool: ___ksymtab_gpl+__traceiter_add_device_to_group+0x0: data relocation to !ENDBR: __traceiter_add_device_to_group+0x0
   vmlinux.o: warning: objtool: ___ksymtab_gpl+__traceiter_remove_device_from_group+0x0: data relocation to !ENDBR: __traceiter_remove_device_from_group+0x0
   vmlinux.o: warning: objtool: ___ksymtab_gpl+__traceiter_attach_device_to_domain+0x0: data relocation to !ENDBR: __traceiter_attach_device_to_domain+0x0
   vmlinux.o: warning: objtool: ___ksymtab_gpl+__traceiter_map+0x0: data relocation to !ENDBR: __traceiter_map+0x0
   vmlinux.o: warning: objtool: ___ksymtab_gpl+__traceiter_unmap+0x0: data relocation to !ENDBR: __traceiter_unmap+0x0
   vmlinux.o: warning: objtool: ___ksymtab_gpl+__traceiter_io_page_fault+0x0: data relocation to !ENDBR: __traceiter_io_page_fault+0x0
   vmlinux.o: warning: objtool: ___ksymtab_gpl+iommu_device_sysfs_add+0x0: data relocation to !ENDBR: iommu_device_sysfs_add+0x0
   vmlinux.o: warning: objtool: ___ksymtab_gpl+iommu_device_sysfs_remove+0x0: data relocation to !ENDBR: iommu_device_sysfs_remove+0x0
   vmlinux.o: warning: objtool: ___ksymtab_gpl+iommu_device_link+0x0: data relocation to !ENDBR: iommu_device_link+0x0
   vmlinux.o: warning: objtool: ___ksymtab_gpl+iommu_device_unlink+0x0: data relocation to !ENDBR: iommu_device_unlink+0x0
   vmlinux.o: warning: objtool: ___ksymtab+iommu_get_msi_cookie+0x0: data relocation to !ENDBR: iommu_get_msi_cookie+0x0
   vmlinux.o: warning: objtool: ___ksymtab+iommu_dma_get_resv_regions+0x0: data relocation to !ENDBR: iommu_dma_get_resv_regions+0x0
   vmlinux.o: warning: objtool: ___ksymtab_gpl+iommu_setup_dma_ops+0x0: data relocation to !ENDBR: iommu_setup_dma_ops+0x0
   vmlinux.o: warning: objtool: ___ksymtab_gpl+ioasid_register_allocator+0x0: data relocation to !ENDBR: ioasid_register_allocator+0x0
   vmlinux.o: warning: objtool: ___ksymtab_gpl+ioasid_unregister_allocator+0x0: data relocation to !ENDBR: ioasid_unregister_allocator+0x0
   vmlinux.o: warning: objtool: ___ksymtab_gpl+ioasid_set_data+0x0: data relocation to !ENDBR: ioasid_set_data+0x0
   vmlinux.o: warning: objtool: ___ksymtab_gpl+ioasid_alloc+0x0: data relocation to !ENDBR: ioasid_alloc+0x0
   vmlinux.o: warning: objtool: ___ksymtab_gpl+ioasid_free+0x0: data relocation to !ENDBR: ioasid_free+0x0
   vmlinux.o: warning: objtool: ___ksymtab_gpl+ioasid_find+0x0: data relocation to !ENDBR: ioasid_find+0x0
   vmlinux.o: warning: objtool: ___ksymtab_gpl+init_iova_domain+0x0: data relocation to !ENDBR: init_iova_domain+0x0
   vmlinux.o: warning: objtool: ___ksymtab_gpl+iova_cache_get+0x0: data relocation to !ENDBR: iova_cache_get+0x0


objdump-func vmlinux.o ___ksymtab_gpl:

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
