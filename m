Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CEB44A2E39
	for <oe-kbuild-all@lists.linux.dev>; Thu,  2 Jul 2026 13:30:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782999015; cv=none; b=L66TMiDrcBBWCx/TvOUC8MREU0Gi0krPGpL0g/uVWXf326hIZLtxxVsFoFqKCjDU4njA23NJ1/QuZ8BNzksmcKY48E5urhQWu2cNu1aWtj7Mh9qr4buTX7hxt61Y34gl9lh2htJ70WhCzpcbf6CmmRRgpOeRbPH8TRg7PSp2rFg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782999015; c=relaxed/simple;
	bh=Ej1AB+VUbqh3KUNq8lZoWVt3q/kQ0LpmDqyrk+DDBOA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=nvchMNPkNh/Q1INBDegpMBmykxhgO9PNz+SF/kXas2g1zLjFx6JcyarPngcaJg1t18JAZjV2a5eXLNU+2fMNGA7adIui3osaVjyF9GhsJPW09tXAIRfLSMKipdSoNeHxfZzohdHQ3aSEPMpfuTs7WQVw79/HgeUwNDUUiINdgeQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SK69W946; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SK69W946"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782999013; x=1814535013;
  h=date:from:to:cc:subject:message-id;
  bh=Ej1AB+VUbqh3KUNq8lZoWVt3q/kQ0LpmDqyrk+DDBOA=;
  b=SK69W946BJHn6u18gc0rwuiNlqk111UrpOuSXhouRog68iBy2xQP9Bar
   rgzDbW0/gzPgXskBveYmkmIoOuFIopPg90FCrplm6F9rskUqEaGx2UpnS
   Fp7++2ejTheIg90ECbL+s733/NT7/OlxypWU7UWnJZWJW2s7vJts24mkb
   uOkAq/Ch0w3nGDQ8zmy0ethfdeD5vryczQCXMOaxx0LG6brNZyacO4BUp
   7NWb6XZUumx100bUiKwEqGGKbPS28akKueJGHu03IlUYNEdvfYE2HYjvv
   d04GgjRgryek9lxgRfnQNzwVFjyGcHNduaBoLAtGZ1FSDxLY/zhy0eOyo
   g==;
X-CSE-ConnectionGUID: f7S1TuRrQVyk0IXUqvQejQ==
X-CSE-MsgGUID: Fv7CQx5NSauEor/Uu7zZ9w==
X-IronPort-AV: E=McAfee;i="6800,10657,11835"; a="95258337"
X-IronPort-AV: E=Sophos;i="6.25,143,1779174000"; 
   d="scan'208";a="95258337"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jul 2026 06:30:13 -0700
X-CSE-ConnectionGUID: sNIQE7rbRtap0BF9dPA/mA==
X-CSE-MsgGUID: WvdVMeA5Tx6PsSHvwTwQ2w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,143,1779174000"; 
   d="scan'208";a="248416311"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa006.fm.intel.com with ESMTP; 02 Jul 2026 06:30:11 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wfHUX-00000000AoR-1sob;
	Thu, 02 Jul 2026 13:30:09 +0000
Date: Thu, 02 Jul 2026 21:29:42 +0800
From: kernel test robot <lkp@intel.com>
To: Sudeep Holla <sudeep.holla@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [sudeep-holla:b4/acpi_scmi_pcc 19/23]
 include/acpi/acpi_bus.h:30:29: warning: 'struct acpi_buffer' declared inside
 parameter list will not be visible outside of this definition or declaration
Message-ID: <202607022144.feONwEYL-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/sudeep.holla/linux.git b4/acpi_scmi_pcc
head:   c1daed90f65670f1d0231c3ab8a569b682181b2b
commit: 7a2657c9e1f143ed73c88d292c22c5225720d100 [19/23] firmware: arm_scmi: Fall back to ACPI HID when "compatible" is absent
config: sh-allyesconfig (https://download.01.org/0day-ci/archive/20260702/202607022144.feONwEYL-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260702/202607022144.feONwEYL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607022144.feONwEYL-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/firmware/arm_scmi/driver.c:19:
   include/acpi/acpi_bus.h:24:9: error: unknown type name 'acpi_handle'
      24 |         acpi_handle *handles;
         |         ^~~~~~~~~~~
   include/acpi/acpi_bus.h:28:1: error: unknown type name 'acpi_status'; did you mean 'si_status'?
      28 | acpi_status
         | ^~~~~~~~~~~
         | si_status
>> include/acpi/acpi_bus.h:30:29: warning: 'struct acpi_buffer' declared inside parameter list will not be visible outside of this definition or declaration
      30 |                      struct acpi_buffer *format, struct acpi_buffer *buffer);
         |                             ^~~~~~~~~~~
>> include/acpi/acpi_bus.h:29:28: warning: 'union acpi_object' declared inside parameter list will not be visible outside of this definition or declaration
      29 | acpi_extract_package(union acpi_object *package,
         |                            ^~~~~~~~~~~
   include/acpi/acpi_bus.h:31:1: error: unknown type name 'acpi_status'; did you mean 'si_status'?
      31 | acpi_status
         | ^~~~~~~~~~~
         | si_status
   include/acpi/acpi_bus.h:32:23: error: unknown type name 'acpi_handle'
      32 | acpi_evaluate_integer(acpi_handle handle,
         |                       ^~~~~~~~~~~
   include/acpi/acpi_bus.h:33:23: error: unknown type name 'acpi_string'
      33 |                       acpi_string pathname,
         |                       ^~~~~~~~~~~
   include/acpi/acpi_bus.h:35:30: error: unknown type name 'acpi_handle'
      35 | bool acpi_evaluate_reference(acpi_handle handle, acpi_string pathname,
         |                              ^~~~~~~~~~~
   include/acpi/acpi_bus.h:35:50: error: unknown type name 'acpi_string'
      35 | bool acpi_evaluate_reference(acpi_handle handle, acpi_string pathname,
         |                                                  ^~~~~~~~~~~
   include/acpi/acpi_bus.h:43:22: error: unknown type name 'acpi_handle'
      43 | bool acpi_device_dep(acpi_handle target, acpi_handle match);
         |                      ^~~~~~~~~~~
   include/acpi/acpi_bus.h:43:42: error: unknown type name 'acpi_handle'
      43 | bool acpi_device_dep(acpi_handle target, acpi_handle match);
         |                                          ^~~~~~~~~~~
   include/acpi/acpi_bus.h:44:1: error: unknown type name 'acpi_status'; did you mean 'si_status'?
      44 | acpi_status
         | ^~~~~~~~~~~
         | si_status
   include/acpi/acpi_bus.h:45:19: error: unknown type name 'acpi_handle'
      45 | acpi_evaluate_ost(acpi_handle handle, u32 source_event, u32 status_code,
         |                   ^~~~~~~~~~~
   include/acpi/acpi_bus.h:48:22: error: unknown type name 'acpi_handle'
      48 | bool acpi_has_method(acpi_handle handle, char *name);
         |                      ^~~~~~~~~~~
   include/acpi/acpi_bus.h:49:1: error: unknown type name 'acpi_status'; did you mean 'si_status'?
      49 | acpi_status acpi_execute_simple_method(acpi_handle handle, char *method,
         | ^~~~~~~~~~~
         | si_status
   include/acpi/acpi_bus.h:49:40: error: unknown type name 'acpi_handle'
      49 | acpi_status acpi_execute_simple_method(acpi_handle handle, char *method,
         |                                        ^~~~~~~~~~~
   include/acpi/acpi_bus.h:51:1: error: unknown type name 'acpi_status'; did you mean 'si_status'?
      51 | acpi_status acpi_evaluate_ej0(acpi_handle handle);
         | ^~~~~~~~~~~
         | si_status
   include/acpi/acpi_bus.h:51:31: error: unknown type name 'acpi_handle'
      51 | acpi_status acpi_evaluate_ej0(acpi_handle handle);
         |                               ^~~~~~~~~~~
   include/acpi/acpi_bus.h:52:1: error: unknown type name 'acpi_status'; did you mean 'si_status'?
      52 | acpi_status acpi_evaluate_lck(acpi_handle handle, int lock);
         | ^~~~~~~~~~~
         | si_status
   include/acpi/acpi_bus.h:52:31: error: unknown type name 'acpi_handle'
      52 | acpi_status acpi_evaluate_lck(acpi_handle handle, int lock);
         |                               ^~~~~~~~~~~
   include/acpi/acpi_bus.h:53:1: error: unknown type name 'acpi_status'; did you mean 'si_status'?
      53 | acpi_status acpi_evaluate_reg(acpi_handle handle, u8 space_id, u32 function);
         | ^~~~~~~~~~~
         | si_status
   include/acpi/acpi_bus.h:53:31: error: unknown type name 'acpi_handle'
      53 | acpi_status acpi_evaluate_reg(acpi_handle handle, u8 space_id, u32 function);
         |                               ^~~~~~~~~~~
   include/acpi/acpi_bus.h:54:21: error: unknown type name 'acpi_handle'
      54 | bool acpi_ata_match(acpi_handle handle);
         |                     ^~~~~~~~~~~
   include/acpi/acpi_bus.h:55:21: error: unknown type name 'acpi_handle'
      55 | bool acpi_bay_match(acpi_handle handle);
         |                     ^~~~~~~~~~~
   include/acpi/acpi_bus.h:56:22: error: unknown type name 'acpi_handle'
      56 | bool acpi_dock_match(acpi_handle handle);
         |                      ^~~~~~~~~~~
   include/acpi/acpi_bus.h:58:21: error: unknown type name 'acpi_handle'
      58 | bool acpi_check_dsm(acpi_handle handle, const guid_t *guid, u64 rev, u64 funcs);
         |                     ^~~~~~~~~~~
   include/acpi/acpi_bus.h:58:47: error: unknown type name 'guid_t'; did you mean 'kuid_t'?
      58 | bool acpi_check_dsm(acpi_handle handle, const guid_t *guid, u64 rev, u64 funcs);
         |                                               ^~~~~~
         |                                               kuid_t
   include/acpi/acpi_bus.h:59:38: error: unknown type name 'acpi_handle'
      59 | union acpi_object *acpi_evaluate_dsm(acpi_handle handle, const guid_t *guid,
         |                                      ^~~~~~~~~~~
   include/acpi/acpi_bus.h:59:64: error: unknown type name 'guid_t'; did you mean 'kuid_t'?
      59 | union acpi_object *acpi_evaluate_dsm(acpi_handle handle, const guid_t *guid,
         |                                                                ^~~~~~
         |                                                                kuid_t
   include/acpi/acpi_bus.h:1021:35: error: unknown type name 'acpi_handle'
    1021 | acpi_get_physical_device_location(acpi_handle handle, struct acpi_pld_info **pld)
         |                                   ^~~~~~~~~~~
   In file included from drivers/firmware/arm_scmi/common.h:12,
                    from drivers/firmware/arm_scmi/driver.c:42:
   include/linux/acpi.h:830:20: error: static declaration of 'acpi_dev_found' follows non-static declaration
     830 | static inline bool acpi_dev_found(const char *hid)
         |                    ^~~~~~~~~~~~~~
   include/acpi/acpi_bus.h:89:6: note: previous declaration of 'acpi_dev_found' with type 'bool(const char *)' {aka '_Bool(const char *)'}
      89 | bool acpi_dev_found(const char *hid);
         |      ^~~~~~~~~~~~~~
   include/linux/acpi.h:835:20: error: static declaration of 'acpi_dev_present' follows non-static declaration
     835 | static inline bool acpi_dev_present(const char *hid, const char *uid, s64 hrv)
         |                    ^~~~~~~~~~~~~~~~
   include/acpi/acpi_bus.h:90:6: note: previous declaration of 'acpi_dev_present' with type 'bool(const char *, const char *, s64)' {aka '_Bool(const char *, const char *, long long int)'}


vim +30 include/acpi/acpi_bus.h

ea216d3ae7305ad Bartosz Golaszewski 2026-04-27  21  
^1da177e4c3f415 Linus Torvalds      2005-04-16  22  struct acpi_handle_list {
^1da177e4c3f415 Linus Torvalds      2005-04-16  23  	u32 count;
2e57d10a6591560 Rafael J. Wysocki   2023-09-27 @24  	acpi_handle *handles;
^1da177e4c3f415 Linus Torvalds      2005-04-16  25  };
^1da177e4c3f415 Linus Torvalds      2005-04-16  26  
^1da177e4c3f415 Linus Torvalds      2005-04-16  27  /* acpi_utils.h */
^1da177e4c3f415 Linus Torvalds      2005-04-16 @28  acpi_status
4be44fcd3bf648b Len Brown           2005-08-05 @29  acpi_extract_package(union acpi_object *package,
4be44fcd3bf648b Len Brown           2005-08-05 @30  		     struct acpi_buffer *format, struct acpi_buffer *buffer);
^1da177e4c3f415 Linus Torvalds      2005-04-16  31  acpi_status
4be44fcd3bf648b Len Brown           2005-08-05  32  acpi_evaluate_integer(acpi_handle handle,
^1da177e4c3f415 Linus Torvalds      2005-04-16  33  		      acpi_string pathname,
27663c5855b10af Matthew Wilcox      2008-10-10  34  		      struct acpi_object_list *arguments, unsigned long long *data);
6909e0f322b0527 Rafael J. Wysocki   2023-12-08  35  bool acpi_evaluate_reference(acpi_handle handle, acpi_string pathname,
^1da177e4c3f415 Linus Torvalds      2005-04-16  36  			     struct acpi_object_list *arguments,
^1da177e4c3f415 Linus Torvalds      2005-04-16  37  			     struct acpi_handle_list *list);
2e57d10a6591560 Rafael J. Wysocki   2023-09-27  38  bool acpi_handle_list_equal(struct acpi_handle_list *list1,
2e57d10a6591560 Rafael J. Wysocki   2023-09-27  39  			    struct acpi_handle_list *list2);
2e57d10a6591560 Rafael J. Wysocki   2023-09-27  40  void acpi_handle_list_replace(struct acpi_handle_list *dst,
2e57d10a6591560 Rafael J. Wysocki   2023-09-27  41  			      struct acpi_handle_list *src);
2e57d10a6591560 Rafael J. Wysocki   2023-09-27  42  void acpi_handle_list_free(struct acpi_handle_list *list);
d70d141bb15f328 Rafael J. Wysocki   2023-12-14  43  bool acpi_device_dep(acpi_handle target, acpi_handle match);
275c58d77062bbb Toshi Kani          2012-05-23  44  acpi_status
05730c1952787fa Jiang Liu           2014-02-19  45  acpi_evaluate_ost(acpi_handle handle, u32 source_event, u32 status_code,
05730c1952787fa Jiang Liu           2014-02-19  46  		  struct acpi_buffer *status_buf);
^1da177e4c3f415 Linus Torvalds      2005-04-16  47  

:::::: The code at line 30 was first introduced by commit
:::::: 4be44fcd3bf648b782f4460fd06dfae6c42ded4b [ACPI] Lindent all ACPI files

:::::: TO: Len Brown <len.brown@intel.com>
:::::: CC: Len Brown <len.brown@intel.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
