Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78E271BDD0
	for <oe-kbuild-all@lists.linux.dev>; Fri, 13 Oct 2023 15:44:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Fkw3YIgA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697211887; x=1728747887;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=xSh3i+wgFBqvVcFl2mkAjU9ni1WSOiJ/kjTA5Sjdqco=;
  b=Fkw3YIgA4uqju2+UTGn/X4XWa4gfJr8Cwq4JHRY0L0XasuX1Qf6gYarr
   lSpzuMVjpYryM1TmvReyFYEJLyF4GYN2iQOuYNTK3Ey2yeZGMKkJPCo0q
   JuHsSfnX7gjcBTclFvD6iDpioPlKQSkwXauN1SX9ofmNU0wqk7AhRJs10
   kNUChO6F5mYbux1dZqZvHxKd+3CRweVVqPz0XIpDbF2WgDjf9FI7CaJpY
   b/3UeT4MSfhFnMtL26CKPys/ezRcswNa/0PFyB33pnOaUU6H+U7MvtpWz
   SiJDmdgn+CoXr/fbxlqm9crZ1C2qjnVKS3DdxGcc+LsyUwSXJ1WVYLV+l
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10862"; a="385046288"
X-IronPort-AV: E=Sophos;i="6.03,222,1694761200"; 
   d="scan'208";a="385046288"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Oct 2023 08:44:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10862"; a="789902868"
X-IronPort-AV: E=Sophos;i="6.03,222,1694761200"; 
   d="scan'208";a="789902868"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by orsmga001.jf.intel.com with ESMTP; 13 Oct 2023 08:44:44 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qrKLC-00052f-1r;
	Fri, 13 Oct 2023 15:44:42 +0000
Date: Fri, 13 Oct 2023 23:44:33 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:pr/642 14046/30000]
 drivers/net/wireless/nxp/mxm_wifiex/wlan_src/mlinux/moal_pcie.h:133:27:
 error: array type has incomplete element type 'struct msix_entry'
Message-ID: <202310132303.7CjEApkG-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Freescale/linux-fslc pr/642
head:   c8b7cf62c7fea8456dec789d550b8006d73b8f04
commit: f186a4e65f54a28973c743f8c007b18c1ce95be6 [14046/30000] MLK-24962 net: wireless: nxp: mxm_wifiex: upgrade to mxm5x16203 release
config: um-allyesconfig (https://download.01.org/0day-ci/archive/20231013/202310132303.7CjEApkG-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231013/202310132303.7CjEApkG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310132303.7CjEApkG-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   cc1: warning: arch/um/include/uapi: No such file or directory [-Wmissing-include-dirs]
   cc1: warning: /mlan: No such file or directory [-Wmissing-include-dirs]
   In file included from include/linux/kernel.h:11,
                    from drivers/net/wireless/nxp/mxm_wifiex/wlan_src/mlinux/moal_main.h:37,
                    from drivers/net/wireless/nxp/mxm_wifiex/wlan_src/mlinux/moal_main.c:29:
   include/asm-generic/fixmap.h: In function 'fix_to_virt':
   include/asm-generic/fixmap.h:32:26: warning: comparison of unsigned expression in '>= 0' is always true [-Wtype-limits]
      32 |         BUILD_BUG_ON(idx >= __end_of_fixed_addresses);
         |                          ^~
   include/linux/compiler.h:330:23: note: in definition of macro '__compiletime_assert'
     330 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   include/linux/compiler.h:350:9: note: in expansion of macro '_compiletime_assert'
     350 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:39:37: note: in expansion of macro 'compiletime_assert'
      39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:50:9: note: in expansion of macro 'BUILD_BUG_ON_MSG'
      50 |         BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
         |         ^~~~~~~~~~~~~~~~
   include/asm-generic/fixmap.h:32:9: note: in expansion of macro 'BUILD_BUG_ON'
      32 |         BUILD_BUG_ON(idx >= __end_of_fixed_addresses);
         |         ^~~~~~~~~~~~
   In file included from include/linux/uaccess.h:11,
                    from include/linux/sched/task.h:11,
                    from include/linux/sched/signal.h:9,
                    from include/linux/ptrace.h:7,
                    from drivers/net/wireless/nxp/mxm_wifiex/wlan_src/mlinux/moal_main.h:53:
   arch/um/include/asm/uaccess.h: In function '__access_ok':
   arch/um/include/asm/uaccess.h:17:36: warning: comparison of unsigned expression in '>= 0' is always true [-Wtype-limits]
      17 |           (((unsigned long) (addr) >= FIXADDR_USER_START) && \
         |                                    ^~
   arch/um/include/asm/uaccess.h:45:17: note: in expansion of macro '__access_ok_vsyscall'
      45 |                 __access_ok_vsyscall(addr, size) ||
         |                 ^~~~~~~~~~~~~~~~~~~~
   In file included from drivers/net/wireless/nxp/mxm_wifiex/wlan_src/mlinux/moal_main.c:37:
   drivers/net/wireless/nxp/mxm_wifiex/wlan_src/mlinux/moal_pcie.h: At top level:
>> drivers/net/wireless/nxp/mxm_wifiex/wlan_src/mlinux/moal_pcie.h:133:27: error: array type has incomplete element type 'struct msix_entry'
     133 |         struct msix_entry msix_entries[PCIE_NUM_MSIX_VECTORS];
         |                           ^~~~~~~~~~~~
   drivers/net/wireless/nxp/mxm_wifiex/wlan_src/mlinux/moal_main.c: In function 'woal_get_mode':
   drivers/net/wireless/nxp/mxm_wifiex/wlan_src/mlinux/moal_main.c:990:13: warning: variable 'ret' set but not used [-Wunused-but-set-variable]
     990 |         int ret = 0;
         |             ^~~
   drivers/net/wireless/nxp/mxm_wifiex/wlan_src/mlinux/moal_main.c: At top level:
   drivers/net/wireless/nxp/mxm_wifiex/wlan_src/mlinux/moal_main.c:2150:6: warning: no previous prototype for 'woal_request_init_user_conf_callback' [-Wmissing-prototypes]
    2150 | void woal_request_init_user_conf_callback(const struct firmware *firmware,
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/wireless/nxp/mxm_wifiex/wlan_src/mlinux/moal_main.c:2650:13: warning: no previous prototype for 'woal_add_card_dpc' [-Wmissing-prototypes]
    2650 | mlan_status woal_add_card_dpc(moal_handle *handle)
         |             ^~~~~~~~~~~~~~~~~
   drivers/net/wireless/nxp/mxm_wifiex/wlan_src/mlinux/moal_main.c:3355:6: warning: no previous prototype for 'woal_fill_mlan_buffer' [-Wmissing-prototypes]
    3355 | void woal_fill_mlan_buffer(moal_private *priv, mlan_buffer *pmbuf,
         |      ^~~~~~~~~~~~~~~~~~~~~
   drivers/net/wireless/nxp/mxm_wifiex/wlan_src/mlinux/moal_main.c:4283:6: warning: no previous prototype for 'woal_flush_evt_queue' [-Wmissing-prototypes]
    4283 | void woal_flush_evt_queue(moal_handle *handle)
         |      ^~~~~~~~~~~~~~~~~~~~
   drivers/net/wireless/nxp/mxm_wifiex/wlan_src/mlinux/moal_main.c:4866:6: warning: no previous prototype for 'woal_ioctl_timeout' [-Wmissing-prototypes]
    4866 | void woal_ioctl_timeout(moal_handle *handle)
         |      ^~~~~~~~~~~~~~~~~~
   drivers/net/wireless/nxp/mxm_wifiex/wlan_src/mlinux/moal_main.c:5172:6: warning: no previous prototype for 'woal_tcp_ack_timer_func' [-Wmissing-prototypes]
    5172 | void woal_tcp_ack_timer_func(void *context)
         |      ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/wireless/nxp/mxm_wifiex/wlan_src/mlinux/moal_main.c:5239:6: warning: no previous prototype for 'woal_send_tcp_ack' [-Wmissing-prototypes]
    5239 | void woal_send_tcp_ack(moal_private *priv, struct tcp_sess *tcp_session)
         |      ^~~~~~~~~~~~~~~~~
   drivers/net/wireless/nxp/mxm_wifiex/wlan_src/mlinux/moal_main.c:5296:5: warning: no previous prototype for 'woal_process_tcp_ack' [-Wmissing-prototypes]
    5296 | int woal_process_tcp_ack(moal_private *priv, mlan_buffer *pmbuf)
         |     ^~~~~~~~~~~~~~~~~~~~
   drivers/net/wireless/nxp/mxm_wifiex/wlan_src/mlinux/moal_main.c:8025:5: warning: no previous prototype for 'woal_netdev_poll_rx' [-Wmissing-prototypes]
    8025 | int woal_netdev_poll_rx(struct napi_struct *napi, int budget)
         |     ^~~~~~~~~~~~~~~~~~~
   drivers/net/wireless/nxp/mxm_wifiex/wlan_src/mlinux/moal_main.c:8908:6: warning: no previous prototype for 'woal_pre_reset' [-Wmissing-prototypes]
    8908 | void woal_pre_reset(moal_handle *handle)
         |      ^~~~~~~~~~~~~~
   drivers/net/wireless/nxp/mxm_wifiex/wlan_src/mlinux/moal_main.c:8926:6: warning: no previous prototype for 'woal_post_reset' [-Wmissing-prototypes]
    8926 | void woal_post_reset(moal_handle *handle)
         |      ^~~~~~~~~~~~~~~
   drivers/net/wireless/nxp/mxm_wifiex/wlan_src/mlinux/moal_main.c: In function 'woal_request_fw_reload':
>> drivers/net/wireless/nxp/mxm_wifiex/wlan_src/mlinux/moal_main.c:9019:17: error: implicit declaration of function 'pci_reset_function' [-Werror=implicit-function-declaration]
    9019 |                 pci_reset_function(pdev);
         |                 ^~~~~~~~~~~~~~~~~~
   drivers/net/wireless/nxp/mxm_wifiex/wlan_src/mlinux/moal_main.c: In function 'mfg_mode_setup':
   drivers/net/wireless/nxp/mxm_wifiex/wlan_src/mlinux/moal_main.c:9387:17: error: 'mfg_mode' undeclared (first use in this function)
    9387 |                 mfg_mode = 1;
         |                 ^~~~~~~~
   drivers/net/wireless/nxp/mxm_wifiex/wlan_src/mlinux/moal_main.c:9387:17: note: each undeclared identifier is reported only once for each function it appears in
   In file included from drivers/net/wireless/nxp/mxm_wifiex/wlan_src/mlinux/moal_main.h:130:
   drivers/net/wireless/nxp/mxm_wifiex/wlan_src/mlinux/moal_priv.h: At top level:
   drivers/net/wireless/nxp/mxm_wifiex/wlan_src/mlinux/moal_priv.h:282:34: warning: 'woal_private_args' defined but not used [-Wunused-const-variable=]
     282 | static const struct iw_priv_args woal_private_args[] = {
         |                                  ^~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors
--
   cc1: warning: arch/um/include/uapi: No such file or directory [-Wmissing-include-dirs]
   cc1: warning: /mlan: No such file or directory [-Wmissing-include-dirs]
   In file included from include/linux/kernel.h:11,
                    from drivers/net/wireless/nxp/mxm_wifiex/wlan_src/mlinux/moal_main.h:37,
                    from drivers/net/wireless/nxp/mxm_wifiex/wlan_src/mlinux/moal_shim.c:28:
   include/asm-generic/fixmap.h: In function 'fix_to_virt':
   include/asm-generic/fixmap.h:32:26: warning: comparison of unsigned expression in '>= 0' is always true [-Wtype-limits]
      32 |         BUILD_BUG_ON(idx >= __end_of_fixed_addresses);
         |                          ^~
   include/linux/compiler.h:330:23: note: in definition of macro '__compiletime_assert'
     330 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   include/linux/compiler.h:350:9: note: in expansion of macro '_compiletime_assert'
     350 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:39:37: note: in expansion of macro 'compiletime_assert'
      39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:50:9: note: in expansion of macro 'BUILD_BUG_ON_MSG'
      50 |         BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
         |         ^~~~~~~~~~~~~~~~
   include/asm-generic/fixmap.h:32:9: note: in expansion of macro 'BUILD_BUG_ON'
      32 |         BUILD_BUG_ON(idx >= __end_of_fixed_addresses);
         |         ^~~~~~~~~~~~
   In file included from include/linux/uaccess.h:11,
                    from include/linux/sched/task.h:11,
                    from include/linux/sched/signal.h:9,
                    from include/linux/ptrace.h:7,
                    from drivers/net/wireless/nxp/mxm_wifiex/wlan_src/mlinux/moal_main.h:53:
   arch/um/include/asm/uaccess.h: In function '__access_ok':
   arch/um/include/asm/uaccess.h:17:36: warning: comparison of unsigned expression in '>= 0' is always true [-Wtype-limits]
      17 |           (((unsigned long) (addr) >= FIXADDR_USER_START) && \
         |                                    ^~
   arch/um/include/asm/uaccess.h:45:17: note: in expansion of macro '__access_ok_vsyscall'
      45 |                 __access_ok_vsyscall(addr, size) ||
         |                 ^~~~~~~~~~~~~~~~~~~~
   In file included from drivers/net/wireless/nxp/mxm_wifiex/wlan_src/mlinux/moal_shim.c:36:
   drivers/net/wireless/nxp/mxm_wifiex/wlan_src/mlinux/moal_pcie.h: At top level:
>> drivers/net/wireless/nxp/mxm_wifiex/wlan_src/mlinux/moal_pcie.h:133:27: error: array type has incomplete element type 'struct msix_entry'
     133 |         struct msix_entry msix_entries[PCIE_NUM_MSIX_VECTORS];
         |                           ^~~~~~~~~~~~
   drivers/net/wireless/nxp/mxm_wifiex/wlan_src/mlinux/moal_shim.c: In function 'moal_print':
   drivers/net/wireless/nxp/mxm_wifiex/wlan_src/mlinux/moal_shim.c:3005:25: warning: function 'moal_print' might be a candidate for 'gnu_printf' format attribute [-Wsuggest-attribute=format]
    3005 |                         vprintk(pformat, args);
         |                         ^~~~~~~
   In file included from drivers/net/wireless/nxp/mxm_wifiex/wlan_src/mlinux/moal_main.h:130:
   drivers/net/wireless/nxp/mxm_wifiex/wlan_src/mlinux/moal_priv.h: At top level:
   drivers/net/wireless/nxp/mxm_wifiex/wlan_src/mlinux/moal_priv.h:282:34: warning: 'woal_private_args' defined but not used [-Wunused-const-variable=]
     282 | static const struct iw_priv_args woal_private_args[] = {
         |                                  ^~~~~~~~~~~~~~~~~
--
   cc1: warning: arch/um/include/uapi: No such file or directory [-Wmissing-include-dirs]
   cc1: warning: /mlan: No such file or directory [-Wmissing-include-dirs]
   In file included from include/linux/kernel.h:11,
                    from drivers/net/wireless/nxp/mxm_wifiex/wlan_src/mlinux/moal_main.h:37,
                    from drivers/net/wireless/nxp/mxm_wifiex/wlan_src/mlinux/moal_eth_ioctl.c:28:
   include/asm-generic/fixmap.h: In function 'fix_to_virt':
   include/asm-generic/fixmap.h:32:26: warning: comparison of unsigned expression in '>= 0' is always true [-Wtype-limits]
      32 |         BUILD_BUG_ON(idx >= __end_of_fixed_addresses);
         |                          ^~
   include/linux/compiler.h:330:23: note: in definition of macro '__compiletime_assert'
     330 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   include/linux/compiler.h:350:9: note: in expansion of macro '_compiletime_assert'
     350 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:39:37: note: in expansion of macro 'compiletime_assert'
      39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:50:9: note: in expansion of macro 'BUILD_BUG_ON_MSG'
      50 |         BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
         |         ^~~~~~~~~~~~~~~~
   include/asm-generic/fixmap.h:32:9: note: in expansion of macro 'BUILD_BUG_ON'
      32 |         BUILD_BUG_ON(idx >= __end_of_fixed_addresses);
         |         ^~~~~~~~~~~~
   In file included from include/linux/uaccess.h:11,
                    from include/linux/sched/task.h:11,
                    from include/linux/sched/signal.h:9,
                    from include/linux/ptrace.h:7,
                    from drivers/net/wireless/nxp/mxm_wifiex/wlan_src/mlinux/moal_main.h:53:
   arch/um/include/asm/uaccess.h: In function '__access_ok':
   arch/um/include/asm/uaccess.h:17:36: warning: comparison of unsigned expression in '>= 0' is always true [-Wtype-limits]
      17 |           (((unsigned long) (addr) >= FIXADDR_USER_START) && \
         |                                    ^~
   arch/um/include/asm/uaccess.h:45:17: note: in expansion of macro '__access_ok_vsyscall'
      45 |                 __access_ok_vsyscall(addr, size) ||
         |                 ^~~~~~~~~~~~~~~~~~~~
   In file included from drivers/net/wireless/nxp/mxm_wifiex/wlan_src/mlinux/moal_eth_ioctl.c:48:
   drivers/net/wireless/nxp/mxm_wifiex/wlan_src/mlinux/moal_pcie.h: At top level:
>> drivers/net/wireless/nxp/mxm_wifiex/wlan_src/mlinux/moal_pcie.h:133:27: error: array type has incomplete element type 'struct msix_entry'
     133 |         struct msix_entry msix_entries[PCIE_NUM_MSIX_VECTORS];
         |                           ^~~~~~~~~~~~
   drivers/net/wireless/nxp/mxm_wifiex/wlan_src/mlinux/moal_eth_ioctl.c:130:13: warning: no previous prototype for 'parse_arguments' [-Wmissing-prototypes]
     130 | mlan_status parse_arguments(t_u8 *pos, int *data, int datalen,
         |             ^~~~~~~~~~~~~~~
   drivers/net/wireless/nxp/mxm_wifiex/wlan_src/mlinux/moal_eth_ioctl.c:190:5: warning: no previous prototype for 'string2raw' [-Wmissing-prototypes]
     190 | int string2raw(unsigned char *str, unsigned char *raw, int raw_size)
         |     ^~~~~~~~~~
   drivers/net/wireless/nxp/mxm_wifiex/wlan_src/mlinux/moal_eth_ioctl.c:293:13: warning: no previous prototype for 'woal_set_miracast_mode' [-Wmissing-prototypes]
     293 | mlan_status woal_set_miracast_mode(moal_private *priv, t_u8 *pdata, size_t len)
         |             ^~~~~~~~~~~~~~~~~~~~~~
   drivers/net/wireless/nxp/mxm_wifiex/wlan_src/mlinux/moal_eth_ioctl.c:341:5: warning: no previous prototype for 'woal_get_priv_driver_version' [-Wmissing-prototypes]
     341 | int woal_get_priv_driver_version(moal_private *priv, t_u8 *respbuf,
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/wireless/nxp/mxm_wifiex/wlan_src/mlinux/moal_eth_ioctl.c:570:5: warning: no previous prototype for 'woal_priv_customie' [-Wmissing-prototypes]
     570 | int woal_priv_customie(moal_private *priv, t_u8 *respbuf, t_u32 respbuflen)
         |     ^~~~~~~~~~~~~~~~~~
   drivers/net/wireless/nxp/mxm_wifiex/wlan_src/mlinux/moal_eth_ioctl.c:633:5: warning: no previous prototype for 'woal_setget_priv_bandcfg' [-Wmissing-prototypes]
     633 | int woal_setget_priv_bandcfg(moal_private *priv, t_u8 *respbuf,
         |     ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/wireless/nxp/mxm_wifiex/wlan_src/mlinux/moal_eth_ioctl.c:760:5: warning: no previous prototype for 'woal_setget_priv_httxcfg' [-Wmissing-prototypes]
     760 | int woal_setget_priv_httxcfg(moal_private *priv, t_u8 *respbuf,
         |     ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/wireless/nxp/mxm_wifiex/wlan_src/mlinux/moal_eth_ioctl.c:859:5: warning: no previous prototype for 'woal_setget_priv_htcapinfo' [-Wmissing-prototypes]
     859 | int woal_setget_priv_htcapinfo(moal_private *priv, t_u8 *respbuf,
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/wireless/nxp/mxm_wifiex/wlan_src/mlinux/moal_eth_ioctl.c:961:5: warning: no previous prototype for 'woal_setget_priv_addbapara' [-Wmissing-prototypes]
     961 | int woal_setget_priv_addbapara(moal_private *priv, t_u8 *respbuf,
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/wireless/nxp/mxm_wifiex/wlan_src/mlinux/moal_eth_ioctl.c:1067:5: warning: no previous prototype for 'woal_priv_delba' [-Wmissing-prototypes]
    1067 | int woal_priv_delba(moal_private *priv, t_u8 *respbuf, t_u32 respbuflen)
         |     ^~~~~~~~~~~~~~~
   drivers/net/wireless/nxp/mxm_wifiex/wlan_src/mlinux/moal_eth_ioctl.c:1163:5: warning: no previous prototype for 'woal_priv_rejectaddbareq' [-Wmissing-prototypes]
    1163 | int woal_priv_rejectaddbareq(moal_private *priv, t_u8 *respbuf,
         |     ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/wireless/nxp/mxm_wifiex/wlan_src/mlinux/moal_eth_ioctl.c:1243:13: warning: no previous prototype for 'woal_ioctl_addba_reject' [-Wmissing-prototypes]
    1243 | mlan_status woal_ioctl_addba_reject(moal_private *priv, t_u32 action,
         |             ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/wireless/nxp/mxm_wifiex/wlan_src/mlinux/moal_eth_ioctl.c:1344:13: warning: no previous prototype for 'woal_ioctl_addba_param' [-Wmissing-prototypes]
    1344 | mlan_status woal_ioctl_addba_param(moal_private *priv, t_u32 action,
         |             ^~~~~~~~~~~~~~~~~~~~~~
   drivers/net/wireless/nxp/mxm_wifiex/wlan_src/mlinux/moal_eth_ioctl.c:1393:5: warning: no previous prototype for 'woal_set_rx_ba_winsize' [-Wmissing-prototypes]
    1393 | int woal_set_rx_ba_winsize(moal_private *priv, t_u8 *respbuf, int respbuflen)
         |     ^~~~~~~~~~~~~~~~~~~~~~
   drivers/net/wireless/nxp/mxm_wifiex/wlan_src/mlinux/moal_eth_ioctl.c:1472:5: warning: no previous prototype for 'woal_set_tx_ba_winsize' [-Wmissing-prototypes]
    1472 | int woal_set_tx_ba_winsize(moal_private *priv, t_u8 *respbuf, int respbuflen)
         |     ^~~~~~~~~~~~~~~~~~~~~~
   drivers/net/wireless/nxp/mxm_wifiex/wlan_src/mlinux/moal_eth_ioctl.c:1557:5: warning: no previous prototype for 'woal_setget_priv_aggrpriotbl' [-Wmissing-prototypes]
    1557 | int woal_setget_priv_aggrpriotbl(moal_private *priv, t_u8 *respbuf,
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/wireless/nxp/mxm_wifiex/wlan_src/mlinux/moal_eth_ioctl.c:1645:5: warning: no previous prototype for 'woal_setget_priv_addbareject' [-Wmissing-prototypes]
    1645 | int woal_setget_priv_addbareject(moal_private *priv, t_u8 *respbuf,
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/wireless/nxp/mxm_wifiex/wlan_src/mlinux/moal_eth_ioctl.c:1728:5: warning: no previous prototype for 'woal_setget_priv_vhtcfg' [-Wmissing-prototypes]
    1728 | int woal_setget_priv_vhtcfg(moal_private *priv, t_u8 *respbuf, t_u32 respbuflen)
         |     ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/wireless/nxp/mxm_wifiex/wlan_src/mlinux/moal_eth_ioctl.c:1883:5: warning: no previous prototype for 'woal_setget_priv_opermodecfg' [-Wmissing-prototypes]
    1883 | int woal_setget_priv_opermodecfg(moal_private *priv, t_u8 *respbuf,
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/wireless/nxp/mxm_wifiex/wlan_src/mlinux/moal_eth_ioctl.c:1966:5: warning: no previous prototype for 'woal_get_priv_datarate' [-Wmissing-prototypes]
    1966 | int woal_get_priv_datarate(moal_private *priv, t_u8 *respbuf, t_u32 respbuflen)
         |     ^~~~~~~~~~~~~~~~~~~~~~
   drivers/net/wireless/nxp/mxm_wifiex/wlan_src/mlinux/moal_eth_ioctl.c:2016:5: warning: no previous prototype for 'woal_setget_priv_txratecfg' [-Wmissing-prototypes]
    2016 | int woal_setget_priv_txratecfg(moal_private *priv, t_u8 *respbuf,
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/wireless/nxp/mxm_wifiex/wlan_src/mlinux/moal_eth_ioctl.c: In function 'woal_get_stats_info':
   drivers/net/wireless/nxp/mxm_wifiex/wlan_src/mlinux/moal_eth_ioctl.c:2229:13: warning: variable 'ret' set but not used [-Wunused-but-set-variable]
    2229 |         int ret = 0;
         |             ^~~
   drivers/net/wireless/nxp/mxm_wifiex/wlan_src/mlinux/moal_eth_ioctl.c: At top level:
   drivers/net/wireless/nxp/mxm_wifiex/wlan_src/mlinux/moal_eth_ioctl.c:2281:5: warning: no previous prototype for 'woal_get_priv_getlog' [-Wmissing-prototypes]
    2281 | int woal_get_priv_getlog(moal_private *priv, t_u8 *respbuf, t_u32 respbuflen)
         |     ^~~~~~~~~~~~~~~~~~~~
   drivers/net/wireless/nxp/mxm_wifiex/wlan_src/mlinux/moal_eth_ioctl.c:2321:5: warning: no previous prototype for 'woal_setget_priv_esuppmode' [-Wmissing-prototypes]
    2321 | int woal_setget_priv_esuppmode(moal_private *priv, t_u8 *respbuf,
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/wireless/nxp/mxm_wifiex/wlan_src/mlinux/moal_eth_ioctl.c:2411:5: warning: no previous prototype for 'woal_setget_priv_passphrase' [-Wmissing-prototypes]
    2411 | int woal_setget_priv_passphrase(moal_private *priv, t_u8 *respbuf,
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/wireless/nxp/mxm_wifiex/wlan_src/mlinux/moal_eth_ioctl.c:2616:5: warning: no previous prototype for 'woal_priv_deauth' [-Wmissing-prototypes]
    2616 | int woal_priv_deauth(moal_private *priv, t_u8 *respbuf, t_u32 respbuflen)
         |     ^~~~~~~~~~~~~~~~
   drivers/net/wireless/nxp/mxm_wifiex/wlan_src/mlinux/moal_eth_ioctl.c:2833:5: warning: no previous prototype for 'woal_priv_bssrole' [-Wmissing-prototypes]
    2833 | int woal_priv_bssrole(moal_private *priv, t_u8 *respbuf, t_u32 respbuflen)
         |     ^~~~~~~~~~~~~~~~~
   drivers/net/wireless/nxp/mxm_wifiex/wlan_src/mlinux/moal_eth_ioctl.c:2914:5: warning: no previous prototype for 'woal_priv_setuserscan' [-Wmissing-prototypes]
    2914 | int woal_priv_setuserscan(moal_private *priv, t_u8 *respbuf, t_u32 respbuflen)
         |     ^~~~~~~~~~~~~~~~~~~~~
   drivers/net/wireless/nxp/mxm_wifiex/wlan_src/mlinux/moal_eth_ioctl.c:2948:5: warning: no previous prototype for 'woal_priv_get_chanstats' [-Wmissing-prototypes]
    2948 | int woal_priv_get_chanstats(moal_private *priv, t_u8 *respbuf, t_u32 respbuflen)
         |     ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/wireless/nxp/mxm_wifiex/wlan_src/mlinux/moal_eth_ioctl.c:2988:5: warning: no previous prototype for 'moal_ret_get_scan_table_ioctl' [-Wmissing-prototypes]
    2988 | int moal_ret_get_scan_table_ioctl(t_u8 *respbuf, t_u32 respbuflen,
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/wireless/nxp/mxm_wifiex/wlan_src/mlinux/moal_eth_ioctl.c:3065:5: warning: no previous prototype for 'woal_priv_getscantable' [-Wmissing-prototypes]
    3065 | int woal_priv_getscantable(moal_private *priv, t_u8 *respbuf, t_u32 respbuflen)
         |     ^~~~~~~~~~~~~~~~~~~~~~
   drivers/net/wireless/nxp/mxm_wifiex/wlan_src/mlinux/moal_eth_ioctl.c:3126:5: warning: no previous prototype for 'woal_priv_extcapcfg' [-Wmissing-prototypes]
    3126 | int woal_priv_extcapcfg(moal_private *priv, t_u8 *respbuf, t_u32 respbuflen)
         |     ^~~~~~~~~~~~~~~~~~~
--
   cc1: warning: arch/um/include/uapi: No such file or directory [-Wmissing-include-dirs]
   cc1: warning: /mlan: No such file or directory [-Wmissing-include-dirs]
   In file included from include/linux/firmware.h:6,
                    from drivers/net/wireless/nxp/mxm_wifiex/wlan_src/mlinux/moal_pcie.c:29:
   include/asm-generic/fixmap.h: In function 'fix_to_virt':
   include/asm-generic/fixmap.h:32:26: warning: comparison of unsigned expression in '>= 0' is always true [-Wtype-limits]
      32 |         BUILD_BUG_ON(idx >= __end_of_fixed_addresses);
         |                          ^~
   include/linux/compiler.h:330:23: note: in definition of macro '__compiletime_assert'
     330 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   include/linux/compiler.h:350:9: note: in expansion of macro '_compiletime_assert'
     350 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:39:37: note: in expansion of macro 'compiletime_assert'
      39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:50:9: note: in expansion of macro 'BUILD_BUG_ON_MSG'
      50 |         BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
         |         ^~~~~~~~~~~~~~~~
   include/asm-generic/fixmap.h:32:9: note: in expansion of macro 'BUILD_BUG_ON'
      32 |         BUILD_BUG_ON(idx >= __end_of_fixed_addresses);
         |         ^~~~~~~~~~~~
   In file included from include/linux/uaccess.h:11,
                    from include/linux/sched/task.h:11,
                    from include/linux/sched/signal.h:9,
                    from include/linux/ptrace.h:7,
                    from drivers/net/wireless/nxp/mxm_wifiex/wlan_src/mlinux/moal_main.h:53,
                    from drivers/net/wireless/nxp/mxm_wifiex/wlan_src/mlinux/moal_pcie.h:62,
                    from drivers/net/wireless/nxp/mxm_wifiex/wlan_src/mlinux/moal_pcie.c:31:
   arch/um/include/asm/uaccess.h: In function '__access_ok':
   arch/um/include/asm/uaccess.h:17:36: warning: comparison of unsigned expression in '>= 0' is always true [-Wtype-limits]
      17 |           (((unsigned long) (addr) >= FIXADDR_USER_START) && \
         |                                    ^~
   arch/um/include/asm/uaccess.h:45:17: note: in expansion of macro '__access_ok_vsyscall'
      45 |                 __access_ok_vsyscall(addr, size) ||
         |                 ^~~~~~~~~~~~~~~~~~~~
   drivers/net/wireless/nxp/mxm_wifiex/wlan_src/mlinux/moal_pcie.h: At top level:
>> drivers/net/wireless/nxp/mxm_wifiex/wlan_src/mlinux/moal_pcie.h:133:27: error: array type has incomplete element type 'struct msix_entry'
     133 |         struct msix_entry msix_entries[PCIE_NUM_MSIX_VECTORS];
         |                           ^~~~~~~~~~~~
   drivers/net/wireless/nxp/mxm_wifiex/wlan_src/mlinux/moal_pcie.c:394:5: warning: no previous prototype for 'woal_pcie_probe' [-Wmissing-prototypes]
     394 | int woal_pcie_probe(struct pci_dev *pdev, const struct pci_device_id *id)
         |     ^~~~~~~~~~~~~~~
   drivers/net/wireless/nxp/mxm_wifiex/wlan_src/mlinux/moal_pcie.c: In function 'woal_pcie_probe':
>> drivers/net/wireless/nxp/mxm_wifiex/wlan_src/mlinux/moal_pcie.c:441:13: error: implicit declaration of function 'pci_is_enabled'; did you mean 'pci_acs_enabled'? [-Werror=implicit-function-declaration]
     441 |         if (pci_is_enabled(pdev))
         |             ^~~~~~~~~~~~~~
         |             pci_acs_enabled
   drivers/net/wireless/nxp/mxm_wifiex/wlan_src/mlinux/moal_pcie.c: At top level:
   drivers/net/wireless/nxp/mxm_wifiex/wlan_src/mlinux/moal_pcie.c:896:13: warning: no previous prototype for 'woal_pcie_write_data_sync' [-Wmissing-prototypes]
     896 | mlan_status woal_pcie_write_data_sync(moal_handle *handle, mlan_buffer *pmbuf,
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/wireless/nxp/mxm_wifiex/wlan_src/mlinux/moal_pcie.c:912:13: warning: no previous prototype for 'woal_pcie_read_data_sync' [-Wmissing-prototypes]
     912 | mlan_status woal_pcie_read_data_sync(moal_handle *handle, mlan_buffer *pmbuf,
         |             ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/wireless/nxp/mxm_wifiex/wlan_src/mlinux/moal_pcie.c: In function 'woal_pcie_init':
>> drivers/net/wireless/nxp/mxm_wifiex/wlan_src/mlinux/moal_pcie.c:1089:15: error: implicit declaration of function 'pci_request_region'; did you mean 'pci_request_regions'? [-Werror=implicit-function-declaration]
    1089 |         ret = pci_request_region(pdev, 0, DRV_NAME);
         |               ^~~~~~~~~~~~~~~~~~
         |               pci_request_regions
>> drivers/net/wireless/nxp/mxm_wifiex/wlan_src/mlinux/moal_pcie.c:1118:9: error: implicit declaration of function 'pci_release_region'; did you mean 'pci_release_regions'? [-Werror=implicit-function-declaration]
    1118 |         pci_release_region(pdev, 2);
         |         ^~~~~~~~~~~~~~~~~~
         |         pci_release_regions
   drivers/net/wireless/nxp/mxm_wifiex/wlan_src/mlinux/moal_pcie.c: In function 'woal_pcie_register_dev':
>> drivers/net/wireless/nxp/mxm_wifiex/wlan_src/mlinux/moal_pcie.c:1174:23: error: implicit declaration of function 'pci_enable_msix_exact' [-Werror=implicit-function-declaration]
    1174 |                 ret = pci_enable_msix_exact(pdev, card->msix_entries, nvec);
         |                       ^~~~~~~~~~~~~~~~~~~~~
>> drivers/net/wireless/nxp/mxm_wifiex/wlan_src/mlinux/moal_pcie.c:1197:41: error: implicit declaration of function 'pci_disable_msix'; did you mean 'pci_disable_sriov'? [-Werror=implicit-function-declaration]
    1197 |                                         pci_disable_msix(pdev);
         |                                         ^~~~~~~~~~~~~~~~
         |                                         pci_disable_sriov
>> drivers/net/wireless/nxp/mxm_wifiex/wlan_src/mlinux/moal_pcie.c:1209:23: error: implicit declaration of function 'pci_enable_msi'; did you mean 'pci_enable_ats'? [-Werror=implicit-function-declaration]
    1209 |                 ret = pci_enable_msi(pdev);
         |                       ^~~~~~~~~~~~~~
         |                       pci_enable_ats
>> drivers/net/wireless/nxp/mxm_wifiex/wlan_src/mlinux/moal_pcie.c:1216:33: error: implicit declaration of function 'pci_disable_msi'; did you mean 'pci_disable_ats'? [-Werror=implicit-function-declaration]
    1216 |                                 pci_disable_msi(pdev);
         |                                 ^~~~~~~~~~~~~~~
         |                                 pci_disable_ats
   drivers/net/wireless/nxp/mxm_wifiex/wlan_src/mlinux/moal_pcie.c: At top level:
   drivers/net/wireless/nxp/mxm_wifiex/wlan_src/mlinux/moal_pcie.c:1418:5: warning: no previous prototype for 'woal_pcie_dump_reg_info' [-Wmissing-prototypes]
    1418 | int woal_pcie_dump_reg_info(moal_handle *phandle, t_u8 *buffer)
         |     ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/wireless/nxp/mxm_wifiex/wlan_src/mlinux/moal_pcie.c:1752:13: warning: no previous prototype for 'woal_read_reg_eight_bit' [-Wmissing-prototypes]
    1752 | mlan_status woal_read_reg_eight_bit(moal_handle *handle, t_u32 reg, t_u8 *data)
         |             ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/wireless/nxp/mxm_wifiex/wlan_src/mlinux/moal_pcie.c:1767:13: warning: no previous prototype for 'woal_pcie_rdwr_firmware' [-Wmissing-prototypes]
    1767 | rdwr_status woal_pcie_rdwr_firmware(moal_handle *phandle, t_u8 doneflag)
         |             ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/wireless/nxp/mxm_wifiex/wlan_src/mlinux/moal_pcie.c:2013:6: warning: no previous prototype for 'woal_pcie_dump_fw_info_v2' [-Wmissing-prototypes]
    2013 | void woal_pcie_dump_fw_info_v2(moal_handle *phandle)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/wireless/nxp/mxm_wifiex/wlan_src/mlinux/moal_pcie.c:2192:6: warning: no previous prototype for 'woal_pcie_dump_fw_info' [-Wmissing-prototypes]
    2192 | void woal_pcie_dump_fw_info(moal_handle *phandle)
         |      ^~~~~~~~~~~~~~~~~~~~~~
>> drivers/net/wireless/nxp/mxm_wifiex/wlan_src/mlinux/moal_pcie.c:587:12: warning: 'woal_pcie_resume' defined but not used [-Wunused-function]
     587 | static int woal_pcie_resume(struct pci_dev *pdev)
         |            ^~~~~~~~~~~~~~~~
>> drivers/net/wireless/nxp/mxm_wifiex/wlan_src/mlinux/moal_pcie.c:491:12: warning: 'woal_pcie_suspend' defined but not used [-Wunused-function]
     491 | static int woal_pcie_suspend(struct pci_dev *pdev, pm_message_t state)
         |            ^~~~~~~~~~~~~~~~~
   In file included from drivers/net/wireless/nxp/mxm_wifiex/wlan_src/mlinux/moal_main.h:130:
   drivers/net/wireless/nxp/mxm_wifiex/wlan_src/mlinux/moal_priv.h:282:34: warning: 'woal_private_args' defined but not used [-Wunused-const-variable=]
     282 | static const struct iw_priv_args woal_private_args[] = {
         |                                  ^~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors
..


vim +133 drivers/net/wireless/nxp/mxm_wifiex/wlan_src/mlinux/moal_pcie.h

688b67b2c7220b Fugang Duan 2020-04-19  121  
688b67b2c7220b Fugang Duan 2020-04-19  122  /** Structure: PCIE service card */
688b67b2c7220b Fugang Duan 2020-04-19  123  typedef struct _pcie_service_card {
688b67b2c7220b Fugang Duan 2020-04-19  124  	/** pci_dev structure pointer */
688b67b2c7220b Fugang Duan 2020-04-19  125  	struct pci_dev *dev;
688b67b2c7220b Fugang Duan 2020-04-19  126  	/** moal_handle structure pointer */
688b67b2c7220b Fugang Duan 2020-04-19  127  	moal_handle *handle;
688b67b2c7220b Fugang Duan 2020-04-19  128  	/** I/O memory regions pointer to the bus */
688b67b2c7220b Fugang Duan 2020-04-19  129  	void __iomem *pci_mmap;
688b67b2c7220b Fugang Duan 2020-04-19  130  	/** I/O memory regions pointer to the bus */
688b67b2c7220b Fugang Duan 2020-04-19  131  	void __iomem *pci_mmap1;
688b67b2c7220b Fugang Duan 2020-04-19  132  #if defined(PCIE)
688b67b2c7220b Fugang Duan 2020-04-19 @133  	struct msix_entry msix_entries[PCIE_NUM_MSIX_VECTORS];
688b67b2c7220b Fugang Duan 2020-04-19  134  	msix_context msix_contexts[PCIE_NUM_MSIX_VECTORS];
688b67b2c7220b Fugang Duan 2020-04-19  135  #endif
688b67b2c7220b Fugang Duan 2020-04-19  136  } pcie_service_card, *ppcie_service_card;
688b67b2c7220b Fugang Duan 2020-04-19  137  

:::::: The code at line 133 was first introduced by commit
:::::: 688b67b2c7220b01521ffe560da7eee33042c7bd MLK-23806-01 net: wireless: nxp: mxm_wifiex: add initial MxM wifi driver

:::::: TO: Fugang Duan <fugang.duan@nxp.com>
:::::: CC: Fugang Duan <fugang.duan@nxp.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
