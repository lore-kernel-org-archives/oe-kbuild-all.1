Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 508A353E0B
	for <oe-kbuild-all@lists.linux.dev>; Fri,  3 Jul 2026 00:22:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783038169; cv=none; b=ubGQYzjIjM0KTXmcbCT5n+0xL/9B+fchw/ex9hEvsKYawZhJ41FwXRh4KpGqOlHjNj+8RYZq0J52TRWmdOeCEO+c0dY8HYVKKHrsmZ5+BD0KNch5VG6r3grFf+BBX0Sm8RJJgKW4U2LVfnZ8oDogsdEXy1WsUkqtvpIwlVI7SGI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783038169; c=relaxed/simple;
	bh=66qrLEFJavp9zETXxmmFTMcF9fdfe7Q4dXmXcJRj/Pg=;
	h=Date:From:To:Cc:Subject:Message-ID; b=s/+mbudLq5RY9LtzBq8Dlt+Aa/lFv0eIDhGGXuQg8JZ1FPNy6977nUsHvCPsRxUrdnSfwKGkj9pIrwjchL6dNZ+C5y7fcZYTWbya4vjA4moz3eB1RSwGmuRxmPSPsxwdnLxJRh5QGNhfUZXkSHQ56rerWggFytd20g7z/0ZSjx8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nYCw9B37; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nYCw9B37"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783038167; x=1814574167;
  h=date:from:to:cc:subject:message-id;
  bh=66qrLEFJavp9zETXxmmFTMcF9fdfe7Q4dXmXcJRj/Pg=;
  b=nYCw9B37Jspbxe4ohMGOAyC6ox3nype0rUK6nK4Kzm3K94t0aiEyeUxq
   qplOtssNUnHY7MOUIxlviycFR6OviehqPRTCY7XR6yW7dMwE0YPQvZaK2
   4w3a/gWA7hPCt9VH5Nqc95YOYvKPysveiyZhwMCElV/OA6zUBjYFO9fJX
   C4dagl8kap/QYwpupbtMufVa52aM/Ha1R9EVurFNkfoshTFDXrhjHsxGW
   6Nyap7rkovUs7tEcoYXB9T5PzxFJs5DiExN2B8npMbqK3QZz+azaN5/lY
   j4LniDZTNpHtT74Qn3DSUDVj0AsqUV6kRKFoK0jmVf/JFsFnOIdcGJCIG
   Q==;
X-CSE-ConnectionGUID: 3o9iAWbUTRSAA1ifsI5s1w==
X-CSE-MsgGUID: RNfDH5aURiu0UeQBSwWEDg==
X-IronPort-AV: E=McAfee;i="6800,10657,11835"; a="83921192"
X-IronPort-AV: E=Sophos;i="6.25,144,1779174000"; 
   d="scan'208";a="83921192"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jul 2026 17:22:43 -0700
X-CSE-ConnectionGUID: W/xwLWy1QPm2/wS+Id/rfA==
X-CSE-MsgGUID: ZgHVb4CgQQmLkDjTTeLwGA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,144,1779174000"; 
   d="scan'208";a="257862943"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa005.fm.intel.com with ESMTP; 02 Jul 2026 17:22:42 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wfRfz-00000000BTh-3AOu;
	Fri, 03 Jul 2026 00:22:39 +0000
Date: Fri, 03 Jul 2026 08:21:44 +0800
From: kernel test robot <lkp@intel.com>
To: Sudeep Holla <sudeep.holla@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [sudeep-holla:b4/acpi_scmi_pcc 19/23]
 include/acpi/acpi_bus.h:856:59: error: 'ACPI_STATE_S0' undeclared
Message-ID: <202607030852.Oatm4THt-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/sudeep.holla/linux.git b4/acpi_scmi_pcc
head:   c1daed90f65670f1d0231c3ab8a569b682181b2b
commit: 7a2657c9e1f143ed73c88d292c22c5225720d100 [19/23] firmware: arm_scmi: Fall back to ACPI HID when "compatible" is absent
config: arm64-defconfig (https://download.01.org/0day-ci/archive/20260703/202607030852.Oatm4THt-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260703/202607030852.Oatm4THt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607030852.Oatm4THt-lkp@intel.com/

All errors (new ones prefixed by >>):

      59 | union acpi_object *acpi_evaluate_dsm(acpi_handle handle, const guid_t *guid,
         |                                      ^~~~~~~~~~~
   include/acpi/acpi_bus.h:63:35: error: unknown type name 'acpi_handle'
      63 | acpi_get_physical_device_location(acpi_handle handle, struct acpi_pld_info **pld);
         |                                   ^~~~~~~~~~~
   include/acpi/acpi_bus.h:66:25: error: unknown type name 'acpi_handle'
      66 | acpi_evaluate_dsm_typed(acpi_handle handle, const guid_t *guid, u64 rev,
         |                         ^~~~~~~~~~~
   include/acpi/acpi_bus.h:68:25: error: unknown type name 'acpi_object_type'
      68 |                         acpi_object_type type)
         |                         ^~~~~~~~~~~~~~~~
   include/acpi/acpi_bus.h:301:47: error: 'ACPI_D_STATE_COUNT' undeclared here (not in a function)
     301 |         struct acpi_device_power_state states[ACPI_D_STATE_COUNT];      /* Power states (D0-D3Cold) */
         |                                               ^~~~~~~~~~~~~~~~~~
   include/acpi/acpi_bus.h:307:9: error: unknown type name 'acpi_handle'
     307 |         acpi_handle supplier;
         |         ^~~~~~~~~~~
   include/acpi/acpi_bus.h:308:9: error: unknown type name 'acpi_handle'
     308 |         acpi_handle consumer;
         |         ^~~~~~~~~~~
   include/acpi/acpi_bus.h:349:9: error: unknown type name 'acpi_handle'
     349 |         acpi_handle gpe_device;
         |         ^~~~~~~~~~~
   include/acpi/acpi_bus.h:480:9: error: unknown type name 'acpi_handle'
     480 |         acpi_handle handle;             /* no handle for fixed hardware */
         |         ^~~~~~~~~~~
   include/acpi/acpi_bus.h:509:9: error: unknown type name 'acpi_handle'
     509 |         acpi_handle handle;
         |         ^~~~~~~~~~~
   include/acpi/acpi_bus.h:626:48: error: expected ')' before 'void'
     626 | void acpi_bus_private_data_handler(acpi_handle, void *);
         |                                                ^~~~~
         |                                                )
   include/acpi/acpi_bus.h:627:43: error: expected ')' before 'void'
     627 | int acpi_bus_get_private_data(acpi_handle, void **);
         |                                           ^~~~~
         |                                           )
   include/acpi/acpi_bus.h:628:46: error: expected ')' before 'void'
     628 | int acpi_bus_attach_private_data(acpi_handle, void *);
         |                                              ^~~~~
         |                                              )
   include/acpi/acpi_bus.h:629:1: error: parameter names (without types) in function declaration [-Wdeclaration-missing-parameter-type]
     629 | void acpi_bus_detach_private_data(acpi_handle);
         | ^~~~
   include/acpi/acpi_bus.h:632:37: error: unknown type name 'acpi_notify_handler'
     632 |                                     acpi_notify_handler handler, void *context);
         |                                     ^~~~~~~~~~~~~~~~~~~
   include/acpi/acpi_bus.h:635:37: error: unknown type name 'acpi_notify_handler'
     635 |                                     acpi_notify_handler handler);
         |                                     ^~~~~~~~~~~~~~~~~~~
   include/acpi/acpi_bus.h:637:38: error: unknown type name 'acpi_notify_handler'
     637 |                                      acpi_notify_handler handler, void *context);
         |                                      ^~~~~~~~~~~~~~~~~~~
   include/acpi/acpi_bus.h:647:1: error: unknown type name 'acpi_status'; did you mean 'si_status'?
     647 | acpi_status acpi_bus_get_status_handle(acpi_handle handle,
         | ^~~~~~~~~~~
         | si_status
   include/acpi/acpi_bus.h:647:40: error: unknown type name 'acpi_handle'
     647 | acpi_status acpi_bus_get_status_handle(acpi_handle handle,
         |                                        ^~~~~~~~~~~
   include/acpi/acpi_bus.h:651:24: error: unknown type name 'acpi_handle'
     651 | int acpi_bus_set_power(acpi_handle handle, int state);
         |                        ^~~~~~~~~~~
   include/acpi/acpi_bus.h:658:27: error: unknown type name 'acpi_handle'
     658 | int acpi_bus_update_power(acpi_handle handle, int *state_p);
         |                           ^~~~~~~~~~~
   include/acpi/acpi_bus.h:660:32: error: unknown type name 'acpi_handle'
     660 | bool acpi_bus_power_manageable(acpi_handle handle);
         |                                ^~~~~~~~~~~
   include/acpi/acpi_bus.h:669:26: error: unknown type name 'acpi_handle'
     669 | bool acpi_bus_can_wakeup(acpi_handle handle);
         |                          ^~~~~~~~~~~
   include/acpi/acpi_bus.h:686:19: error: unknown type name 'acpi_handle'
     686 | int acpi_bus_scan(acpi_handle handle);
         |                   ^~~~~~~~~~~
   include/acpi/acpi_bus.h:688:1: error: unknown type name 'acpi_status'; did you mean 'si_status'?
     688 | acpi_status acpi_bus_get_ejd(acpi_handle handle, acpi_handle * ejd);
         | ^~~~~~~~~~~
         | si_status
   include/acpi/acpi_bus.h:688:30: error: unknown type name 'acpi_handle'
     688 | acpi_status acpi_bus_get_ejd(acpi_handle handle, acpi_handle * ejd);
         |                              ^~~~~~~~~~~
   include/acpi/acpi_bus.h:688:50: error: unknown type name 'acpi_handle'
     688 | acpi_status acpi_bus_get_ejd(acpi_handle handle, acpi_handle * ejd);
         |                                                  ^~~~~~~~~~~
   include/acpi/acpi_bus.h:765:1: error: parameter names (without types) in function declaration [-Wdeclaration-missing-parameter-type]
     765 | int acpi_is_root_bridge(acpi_handle);
         | ^~~
   include/acpi/acpi_bus.h:766:42: error: unknown type name 'acpi_handle'
     766 | struct acpi_pci_root *acpi_pci_find_root(acpi_handle handle);
         |                                          ^~~~~~~~~~~
   include/acpi/acpi_bus.h:809:1: error: unknown type name 'acpi_status'; did you mean 'si_status'?
     809 | acpi_status acpi_add_pm_notifier(struct acpi_device *adev, struct device *dev,
         | ^~~~~~~~~~~
         | si_status
   include/acpi/acpi_bus.h:811:1: error: unknown type name 'acpi_status'; did you mean 'si_status'?
     811 | acpi_status acpi_remove_pm_notifier(struct acpi_device *adev);
         | ^~~~~~~~~~~
         | si_status
   include/acpi/acpi_bus.h: In function 'acpi_target_system_state':
>> include/acpi/acpi_bus.h:856:59: error: 'ACPI_STATE_S0' undeclared (first use in this function)
     856 | static inline u32 acpi_target_system_state(void) { return ACPI_STATE_S0; }
         |                                                           ^~~~~~~~~~~~~
   include/acpi/acpi_bus.h:856:59: note: each undeclared identifier is reported only once for each function it appears in
   include/acpi/acpi_bus.h: In function 'acpi_device_can_poweroff':
   include/acpi/acpi_bus.h:871:35: error: 'ACPI_STATE_D3_COLD' undeclared (first use in this function)
     871 |         return adev->power.states[ACPI_STATE_D3_COLD].flags.valid ||
         |                                   ^~~~~~~~~~~~~~~~~~
   include/acpi/acpi_bus.h:872:19: error: 'acpi_gbl_FADT' undeclared (first use in this function)
     872 |                 ((acpi_gbl_FADT.header.revision < 6) &&
         |                   ^~~~~~~~~~~~~
   include/acpi/acpi_bus.h:873:36: error: 'ACPI_STATE_D3_HOT' undeclared (first use in this function)
     873 |                 adev->power.states[ACPI_STATE_D3_HOT].flags.explicit_set);
         |                                    ^~~~~~~~~~~~~~~~~
   include/acpi/acpi_bus.h: At top level:
   include/acpi/acpi_bus.h:989:41: error: unknown type name 'acpi_handle'
     989 | struct acpi_device *acpi_fetch_acpi_dev(acpi_handle handle);
         |                                         ^~~~~~~~~~~
   include/acpi/acpi_bus.h:990:39: error: unknown type name 'acpi_handle'
     990 | struct acpi_device *acpi_get_acpi_dev(acpi_handle handle);
         |                                       ^~~~~~~~~~~
   include/acpi/acpi_bus.h:999:23: error: unknown type name 'acpi_handle'
     999 | int acpi_scan_add_dep(acpi_handle handle, struct acpi_handle_list *dep_devices);
         |                       ^~~~~~~~~~~
   include/acpi/acpi_bus.h:1000:28: error: unknown type name 'acpi_handle'
    1000 | u32 arch_acpi_add_auto_dep(acpi_handle handle);
         |                            ^~~~~~~~~~~
   In file included from drivers/firmware/arm_scmi/common.h:12,
                    from drivers/firmware/arm_scmi/driver.c:42:
   include/linux/acpi.h: In function 'acpi_device_handle':
   include/linux/acpi.h:55:36: error: pointer/integer type mismatch in conditional expression [-Wint-conversion]
      55 |         return adev ? adev->handle : NULL;
         |                                    ^


vim +/ACPI_STATE_S0 +856 include/acpi/acpi_bus.h

ad5a449b707b90 Dexuan Cui     2019-07-04  852  
99926a8cd36b60 David Rientjes 2012-11-10  853  #ifdef CONFIG_ACPI_SLEEP
99926a8cd36b60 David Rientjes 2012-11-10  854  u32 acpi_target_system_state(void);
99926a8cd36b60 David Rientjes 2012-11-10  855  #else
99926a8cd36b60 David Rientjes 2012-11-10 @856  static inline u32 acpi_target_system_state(void) { return ACPI_STATE_S0; }
99926a8cd36b60 David Rientjes 2012-11-10  857  #endif
99926a8cd36b60 David Rientjes 2012-11-10  858  

:::::: The code at line 856 was first introduced by commit
:::::: 99926a8cd36b6088448fec41aed4a3b5b05b3679 ACPI / PM: Fix build problem related to acpi_target_system_state()

:::::: TO: David Rientjes <rientjes@google.com>
:::::: CC: Rafael J. Wysocki <rafael.j.wysocki@intel.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
