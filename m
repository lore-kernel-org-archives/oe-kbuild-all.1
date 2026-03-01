Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B7AF1CEADB
	for <oe-kbuild-all@lists.linux.dev>; Sun,  1 Mar 2026 03:45:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772336746; cv=none; b=XulbfOnQQM51QMxoyAQgYq+rGcnTqCOX+PvSmUDnmo0bz/3OWZjLbXGn2WT+q7cVZ2EMSQnjPVJUQeCxU0QCt8MzDVjkKxa1ru5Ry/MbLBxBIucBzreoP4WyArRz7SlXUsZ1H9HJrb3s5ZrQIBvsvC2Lkz+rTjwsOvckUXafSLU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772336746; c=relaxed/simple;
	bh=wZ8P6A4P9kme0mghxMXeGPeR4TaQC+fF7Y+/RGp4Jak=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=GLt+Gnqaiu63Z90KSZQbO01y8JiVqpSyklzcJXych4enGAVIkBBLsfl7beFJGvbnp6YSOYOUGyn1M8A4W4AcK8g06C2Z+1TrJzc2To0/l3wtgA1jOP5awETjdQGGrevBsjrioMyvXCTAFyc8jrtM4JILV95jVPUxsoTXqLRXA5M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AebzOUfI; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AebzOUfI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772336743; x=1803872743;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=wZ8P6A4P9kme0mghxMXeGPeR4TaQC+fF7Y+/RGp4Jak=;
  b=AebzOUfIkXk89TYIlimRiji4pHo25tTzyI28nFNtUPv2BphAHL3dukSA
   VqXg11B5uQkNK7bJ+VFplzP0ALWHviXZltuzMGI6isOMTtde8oVY167+4
   EndilHrmzK8sLwyAOtJ6WPZx98WN3X2CN5reDFYi5h6Ykwd9BlMnI+vR0
   aFH5mYkyVxDKE2yCR+Sx1A68e0DCwuXU+QQBK4MuOpNz/YW3LeHPyBdRa
   8IZLi0J8NoOqtttTWoVjAKeFpro9RAAlN5wxaiPKu2puXiVpbiSo6PJPG
   5ScEqxUL3Ch3X7RjCmkKLuBd1WQpXuKxzQOONJVP/dCVHbEvGZpDoXE5v
   Q==;
X-CSE-ConnectionGUID: JFIZOzTjRkS9drXCUDCXlw==
X-CSE-MsgGUID: 315iPklATcSqhR4gqZhinA==
X-IronPort-AV: E=McAfee;i="6800,10657,11715"; a="73489747"
X-IronPort-AV: E=Sophos;i="6.21,317,1763452800"; 
   d="scan'208";a="73489747"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Feb 2026 19:45:42 -0800
X-CSE-ConnectionGUID: Aer/Y7trSUulFBR9eNUJgg==
X-CSE-MsgGUID: jroRMwodQ5K2cZjLtmpkSA==
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO 59784f1c7b2a) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 28 Feb 2026 19:45:40 -0800
Received: from kbuild by 59784f1c7b2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vwXkP-000000001FR-2YAn;
	Sun, 01 Mar 2026 03:45:37 +0000
Date: Sun, 01 Mar 2026 11:45:25 +0800
From: kernel test robot <lkp@intel.com>
To: "Thomas =?utf-8?Q?Wei=C3=9Fschuh"?= <linux@weissschuh.net>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [thomas-weissschuh:b4/cros_kbd_led-cleanup 3/8]
 include/linux/acpi.h:809:20: error: static declaration of 'acpi_dev_found'
 follows non-static declaration
Message-ID: <202603011153.Pg0vUqs0-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/thomas.weissschuh/linux.git b4/cros_kbd_led-cleanup
head:   1f8a06bba34bbd4d190a7c78f4f81d6a58f7489d
commit: 2b182d193bb941d68d765d0e973c8494338794f0 [3/8] incl
config: arm64-randconfig-002-20260301 (https://download.01.org/0day-ci/archive/20260301/202603011153.Pg0vUqs0-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 10.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260301/202603011153.Pg0vUqs0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603011153.Pg0vUqs0-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/acpi/apei.h:9,
                    from include/acpi/ghes.h:5,
                    from include/linux/arm_sdei.h:8,
                    from arch/arm64/kernel/asm-offsets.c:11:
>> include/linux/acpi.h:809:20: error: static declaration of 'acpi_dev_found' follows non-static declaration
     809 | static inline bool acpi_dev_found(const char *hid)
         |                    ^~~~~~~~~~~~~~
   In file included from include/linux/acpi.h:29,
                    from include/acpi/apei.h:9,
                    from include/acpi/ghes.h:5,
                    from include/linux/arm_sdei.h:8,
                    from arch/arm64/kernel/asm-offsets.c:11:
   include/acpi/acpi_bus.h:87:6: note: previous declaration of 'acpi_dev_found' was here
      87 | bool acpi_dev_found(const char *hid);
         |      ^~~~~~~~~~~~~~
   In file included from include/acpi/apei.h:9,
                    from include/acpi/ghes.h:5,
                    from include/linux/arm_sdei.h:8,
                    from arch/arm64/kernel/asm-offsets.c:11:
>> include/linux/acpi.h:814:20: error: static declaration of 'acpi_dev_present' follows non-static declaration
     814 | static inline bool acpi_dev_present(const char *hid, const char *uid, s64 hrv)
         |                    ^~~~~~~~~~~~~~~~
   In file included from include/linux/acpi.h:29,
                    from include/acpi/apei.h:9,
                    from include/acpi/ghes.h:5,
                    from include/linux/arm_sdei.h:8,
                    from arch/arm64/kernel/asm-offsets.c:11:
   include/acpi/acpi_bus.h:88:6: note: previous declaration of 'acpi_dev_present' was here
      88 | bool acpi_dev_present(const char *hid, const char *uid, s64 hrv);
         |      ^~~~~~~~~~~~~~~~
   In file included from include/acpi/apei.h:9,
                    from include/acpi/ghes.h:5,
                    from include/linux/arm_sdei.h:8,
                    from arch/arm64/kernel/asm-offsets.c:11:
>> include/linux/acpi.h:832:20: error: static declaration of 'acpi_reduced_hardware' follows non-static declaration
     832 | static inline bool acpi_reduced_hardware(void)
         |                    ^~~~~~~~~~~~~~~~~~~~~
   In file included from include/linux/acpi.h:29,
                    from include/acpi/apei.h:9,
                    from include/acpi/ghes.h:5,
                    from include/linux/arm_sdei.h:8,
                    from arch/arm64/kernel/asm-offsets.c:11:
   include/acpi/acpi_bus.h:89:6: note: previous declaration of 'acpi_reduced_hardware' was here
      89 | bool acpi_reduced_hardware(void);
         |      ^~~~~~~~~~~~~~~~~~~~~
   In file included from include/acpi/apei.h:9,
                    from include/acpi/ghes.h:5,
                    from include/linux/arm_sdei.h:8,
                    from arch/arm64/kernel/asm-offsets.c:11:
>> include/linux/acpi.h:979:20: error: static declaration of 'acpi_check_dsm' follows non-static declaration
     979 | static inline bool acpi_check_dsm(acpi_handle handle, const guid_t *guid,
         |                    ^~~~~~~~~~~~~~
   In file included from include/linux/acpi.h:29,
                    from include/acpi/apei.h:9,
                    from include/acpi/ghes.h:5,
                    from include/linux/arm_sdei.h:8,
                    from arch/arm64/kernel/asm-offsets.c:11:
   include/acpi/acpi_bus.h:56:6: note: previous declaration of 'acpi_check_dsm' was here
      56 | bool acpi_check_dsm(acpi_handle handle, const guid_t *guid, u64 rev, u64 funcs);
         |      ^~~~~~~~~~~~~~
   In file included from include/acpi/apei.h:9,
                    from include/acpi/ghes.h:5,
                    from include/linux/arm_sdei.h:8,
                    from arch/arm64/kernel/asm-offsets.c:11:
>> include/linux/acpi.h:985:34: error: static declaration of 'acpi_evaluate_dsm' follows non-static declaration
     985 | static inline union acpi_object *acpi_evaluate_dsm(acpi_handle handle,
         |                                  ^~~~~~~~~~~~~~~~~
   In file included from include/linux/acpi.h:29,
                    from include/acpi/apei.h:9,
                    from include/acpi/ghes.h:5,
                    from include/linux/arm_sdei.h:8,
                    from arch/arm64/kernel/asm-offsets.c:11:
   include/acpi/acpi_bus.h:57:20: note: previous declaration of 'acpi_evaluate_dsm' was here
      57 | union acpi_object *acpi_evaluate_dsm(acpi_handle handle, const guid_t *guid,
         |                    ^~~~~~~~~~~~~~~~~
   make[3]: *** [scripts/Makefile.build:184: arch/arm64/kernel/asm-offsets.s] Error 1 shuffle=750680562
   make[3]: Target 'prepare' not remade because of errors.
   make[2]: *** [Makefile:1333: prepare0] Error 2 shuffle=750680562
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:248: __sub-make] Error 2 shuffle=750680562
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:248: __sub-make] Error 2 shuffle=750680562
   make: Target 'prepare' not remade because of errors.


vim +/acpi_dev_found +809 include/linux/acpi.h

8a0662d9ed2968e Rafael J. Wysocki 2014-11-04  808  
6eb17e0df74c036 Kejian Yan        2016-06-03 @809  static inline bool acpi_dev_found(const char *hid)
6eb17e0df74c036 Kejian Yan        2016-06-03  810  {
6eb17e0df74c036 Kejian Yan        2016-06-03  811  	return false;
6eb17e0df74c036 Kejian Yan        2016-06-03  812  }
6eb17e0df74c036 Kejian Yan        2016-06-03  813  
8661423eea1a1b5 Hans de Goede     2017-04-19 @814  static inline bool acpi_dev_present(const char *hid, const char *uid, s64 hrv)
8661423eea1a1b5 Hans de Goede     2017-04-19  815  {
8661423eea1a1b5 Hans de Goede     2017-04-19  816  	return false;
8661423eea1a1b5 Hans de Goede     2017-04-19  817  }
8661423eea1a1b5 Hans de Goede     2017-04-19  818  
35009c807488ccd Andy Shevchenko   2019-10-01  819  struct acpi_device;
35009c807488ccd Andy Shevchenko   2019-10-01  820  
5db72fdb74983a1 Andy Shevchenko   2022-09-13  821  static inline int acpi_dev_uid_to_integer(struct acpi_device *adev, u64 *integer)
5db72fdb74983a1 Andy Shevchenko   2022-09-13  822  {
5db72fdb74983a1 Andy Shevchenko   2022-09-13  823  	return -ENODEV;
5db72fdb74983a1 Andy Shevchenko   2022-09-13  824  }
5db72fdb74983a1 Andy Shevchenko   2022-09-13  825  
817b4d64da036f5 Andy Shevchenko   2019-03-18  826  static inline struct acpi_device *
817b4d64da036f5 Andy Shevchenko   2019-03-18  827  acpi_dev_get_first_match_dev(const char *hid, const char *uid, s64 hrv)
817b4d64da036f5 Andy Shevchenko   2019-03-18  828  {
817b4d64da036f5 Andy Shevchenko   2019-03-18  829  	return NULL;
817b4d64da036f5 Andy Shevchenko   2019-03-18  830  }
817b4d64da036f5 Andy Shevchenko   2019-03-18  831  
8eb99e9a64a07ea Hans de Goede     2021-04-07 @832  static inline bool acpi_reduced_hardware(void)
8eb99e9a64a07ea Hans de Goede     2021-04-07  833  {
8eb99e9a64a07ea Hans de Goede     2021-04-07  834  	return false;
8eb99e9a64a07ea Hans de Goede     2021-04-07  835  }
8eb99e9a64a07ea Hans de Goede     2021-04-07  836  
fe066621c7966fe YueHaibing        2019-04-12  837  static inline void acpi_dev_put(struct acpi_device *adev) {}
fe066621c7966fe YueHaibing        2019-04-12  838  
ff70784ab9f89e7 Andy Shevchenko   2021-03-02  839  static inline bool is_acpi_node(const struct fwnode_handle *fwnode)
8a0662d9ed2968e Rafael J. Wysocki 2014-11-04  840  {
8a0662d9ed2968e Rafael J. Wysocki 2014-11-04  841  	return false;
8a0662d9ed2968e Rafael J. Wysocki 2014-11-04  842  }
8a0662d9ed2968e Rafael J. Wysocki 2014-11-04  843  
ff70784ab9f89e7 Andy Shevchenko   2021-03-02  844  static inline bool is_acpi_device_node(const struct fwnode_handle *fwnode)
3a7a2ab839ad18c Rafael J. Wysocki 2015-08-27  845  {
3a7a2ab839ad18c Rafael J. Wysocki 2015-08-27  846  	return false;
3a7a2ab839ad18c Rafael J. Wysocki 2015-08-27  847  }
3a7a2ab839ad18c Rafael J. Wysocki 2015-08-27  848  
5c1a72a0fbe1b02 Andy Shevchenko   2021-06-04  849  static inline struct acpi_device *to_acpi_device_node(const struct fwnode_handle *fwnode)
3a7a2ab839ad18c Rafael J. Wysocki 2015-08-27  850  {
3a7a2ab839ad18c Rafael J. Wysocki 2015-08-27  851  	return NULL;
3a7a2ab839ad18c Rafael J. Wysocki 2015-08-27  852  }
3a7a2ab839ad18c Rafael J. Wysocki 2015-08-27  853  
ff70784ab9f89e7 Andy Shevchenko   2021-03-02  854  static inline bool is_acpi_data_node(const struct fwnode_handle *fwnode)
3a7a2ab839ad18c Rafael J. Wysocki 2015-08-27  855  {
3a7a2ab839ad18c Rafael J. Wysocki 2015-08-27  856  	return false;
3a7a2ab839ad18c Rafael J. Wysocki 2015-08-27  857  }
3a7a2ab839ad18c Rafael J. Wysocki 2015-08-27  858  
5c1a72a0fbe1b02 Andy Shevchenko   2021-06-04  859  static inline struct acpi_data_node *to_acpi_data_node(const struct fwnode_handle *fwnode)
8a0662d9ed2968e Rafael J. Wysocki 2014-11-04  860  {
8a0662d9ed2968e Rafael J. Wysocki 2014-11-04  861  	return NULL;
8a0662d9ed2968e Rafael J. Wysocki 2014-11-04  862  }
8a0662d9ed2968e Rafael J. Wysocki 2014-11-04  863  
5c1a72a0fbe1b02 Andy Shevchenko   2021-06-04  864  static inline bool acpi_data_node_match(const struct fwnode_handle *fwnode,
613e97218ccbd7f Adam Thomson      2016-06-21  865  					const char *name)
613e97218ccbd7f Adam Thomson      2016-06-21  866  {
613e97218ccbd7f Adam Thomson      2016-06-21  867  	return false;
613e97218ccbd7f Adam Thomson      2016-06-21  868  }
613e97218ccbd7f Adam Thomson      2016-06-21  869  
8a0662d9ed2968e Rafael J. Wysocki 2014-11-04  870  static inline struct fwnode_handle *acpi_fwnode_handle(struct acpi_device *adev)
8a0662d9ed2968e Rafael J. Wysocki 2014-11-04  871  {
8a0662d9ed2968e Rafael J. Wysocki 2014-11-04  872  	return NULL;
8a0662d9ed2968e Rafael J. Wysocki 2014-11-04  873  }
8a0662d9ed2968e Rafael J. Wysocki 2014-11-04  874  
7d3707bbbbb1dc8 Ricardo Ribalda   2024-12-16  875  static inline acpi_handle acpi_device_handle(struct acpi_device *adev)
7d3707bbbbb1dc8 Ricardo Ribalda   2024-12-16  876  {
7d3707bbbbb1dc8 Ricardo Ribalda   2024-12-16  877  	return NULL;
7d3707bbbbb1dc8 Ricardo Ribalda   2024-12-16  878  }
7d3707bbbbb1dc8 Ricardo Ribalda   2024-12-16  879  
ca5b74d2675a44f Rafael J. Wysocki 2015-03-16  880  static inline bool has_acpi_companion(struct device *dev)
ca5b74d2675a44f Rafael J. Wysocki 2015-03-16  881  {
ca5b74d2675a44f Rafael J. Wysocki 2015-03-16  882  	return false;
ca5b74d2675a44f Rafael J. Wysocki 2015-03-16  883  }
ca5b74d2675a44f Rafael J. Wysocki 2015-03-16  884  
c0e5c4450494d74 Dustin Byford     2015-10-23  885  static inline void acpi_preset_companion(struct device *dev,
c0e5c4450494d74 Dustin Byford     2015-10-23  886  					 struct acpi_device *parent, u64 addr)
c0e5c4450494d74 Dustin Byford     2015-10-23  887  {
c0e5c4450494d74 Dustin Byford     2015-10-23  888  }
c0e5c4450494d74 Dustin Byford     2015-10-23  889  
45c42a7f582cc07 Jarkko Nikula     2013-11-14  890  static inline const char *acpi_dev_name(struct acpi_device *adev)
45c42a7f582cc07 Jarkko Nikula     2013-11-14  891  {
45c42a7f582cc07 Jarkko Nikula     2013-11-14  892  	return NULL;
45c42a7f582cc07 Jarkko Nikula     2013-11-14  893  }
45c42a7f582cc07 Jarkko Nikula     2013-11-14  894  
daae45caf5a042a Lukas Wunner      2016-07-28  895  static inline struct device *acpi_get_first_physical_node(struct acpi_device *adev)
daae45caf5a042a Lukas Wunner      2016-07-28  896  {
daae45caf5a042a Lukas Wunner      2016-07-28  897  	return NULL;
daae45caf5a042a Lukas Wunner      2016-07-28  898  }
daae45caf5a042a Lukas Wunner      2016-07-28  899  
4a7a16dc061e4c5 Len Brown         2009-06-12  900  static inline void acpi_early_init(void) { }
b064a8fa77dfead Rafael J. Wysocki 2015-06-10  901  static inline void acpi_subsystem_init(void) { }
53de49f52e305e9 Andrew Morton     2005-07-30  902  
cbf9bd603ab1fc4 Yinghai Lu        2008-02-19  903  static inline int early_acpi_boot_init(void)
cbf9bd603ab1fc4 Yinghai Lu        2008-02-19  904  {
cbf9bd603ab1fc4 Yinghai Lu        2008-02-19  905  	return 0;
cbf9bd603ab1fc4 Yinghai Lu        2008-02-19  906  }
53de49f52e305e9 Andrew Morton     2005-07-30  907  static inline int acpi_boot_init(void)
53de49f52e305e9 Andrew Morton     2005-07-30  908  {
53de49f52e305e9 Andrew Morton     2005-07-30  909  	return 0;
53de49f52e305e9 Andrew Morton     2005-07-30  910  }
53de49f52e305e9 Andrew Morton     2005-07-30  911  
1a1c130ab757549 Rafael J. Wysocki 2021-03-23  912  static inline void acpi_boot_table_prepare(void)
1a1c130ab757549 Rafael J. Wysocki 2021-03-23  913  {
1a1c130ab757549 Rafael J. Wysocki 2021-03-23  914  }
1a1c130ab757549 Rafael J. Wysocki 2021-03-23  915  
8558e3943df1c51 Len Brown         2010-01-06  916  static inline void acpi_boot_table_init(void)
53de49f52e305e9 Andrew Morton     2005-07-30  917  {
53de49f52e305e9 Andrew Morton     2005-07-30  918  }
53de49f52e305e9 Andrew Morton     2005-07-30  919  
3c999f142665265 Yinghai Lu        2008-06-20  920  static inline int acpi_mps_check(void)
3c999f142665265 Yinghai Lu        2008-06-20  921  {
3c999f142665265 Yinghai Lu        2008-06-20  922  	return 0;
3c999f142665265 Yinghai Lu        2008-06-20  923  }
3c999f142665265 Yinghai Lu        2008-06-20  924  
443dea72d5f4281 Thomas Renninger  2008-02-04  925  static inline int acpi_check_resource_conflict(struct resource *res)
443dea72d5f4281 Thomas Renninger  2008-02-04  926  {
443dea72d5f4281 Thomas Renninger  2008-02-04  927  	return 0;
443dea72d5f4281 Thomas Renninger  2008-02-04  928  }
443dea72d5f4281 Thomas Renninger  2008-02-04  929  
df92e695998e1bc Thomas Renninger  2008-02-04  930  static inline int acpi_check_region(resource_size_t start, resource_size_t n,
df92e695998e1bc Thomas Renninger  2008-02-04  931  				    const char *name)
df92e695998e1bc Thomas Renninger  2008-02-04  932  {
df92e695998e1bc Thomas Renninger  2008-02-04  933  	return 0;
df92e695998e1bc Thomas Renninger  2008-02-04  934  }
df92e695998e1bc Thomas Renninger  2008-02-04  935  
e55a5999ffcf72d Feng Tang         2009-07-28  936  struct acpi_table_header;
e55a5999ffcf72d Feng Tang         2009-07-28  937  static inline int acpi_table_parse(char *id,
e55a5999ffcf72d Feng Tang         2009-07-28  938  				int (*handler)(struct acpi_table_header *))
e55a5999ffcf72d Feng Tang         2009-07-28  939  {
f8a571b2a128a16 tangchen          2014-01-06  940  	return -ENODEV;
e55a5999ffcf72d Feng Tang         2009-07-28  941  }
6fed05c9c9812b5 Rafael J. Wysocki 2011-01-12  942  
b54ac6d2a250846 Ying Huang        2011-12-08  943  static inline int acpi_nvs_register(__u64 start, __u64 size)
6fed05c9c9812b5 Rafael J. Wysocki 2011-01-12  944  {
6fed05c9c9812b5 Rafael J. Wysocki 2011-01-12  945  	return 0;
6fed05c9c9812b5 Rafael J. Wysocki 2011-01-12  946  }
b54ac6d2a250846 Ying Huang        2011-12-08  947  
b54ac6d2a250846 Ying Huang        2011-12-08  948  static inline int acpi_nvs_for_each_region(int (*func)(__u64, __u64, void *),
b54ac6d2a250846 Ying Huang        2011-12-08  949  					   void *data)
b54ac6d2a250846 Ying Huang        2011-12-08  950  {
b54ac6d2a250846 Ying Huang        2011-12-08  951  	return 0;
b54ac6d2a250846 Ying Huang        2011-12-08  952  }
b54ac6d2a250846 Ying Huang        2011-12-08  953  
cf761af9ee0f2c1 Mika Westerberg   2012-10-31  954  struct acpi_device_id;
cf761af9ee0f2c1 Mika Westerberg   2012-10-31  955  
2b5ae9604949391 Andy Shevchenko   2023-07-03  956  static inline const struct acpi_device_id *acpi_match_acpi_device(
2b5ae9604949391 Andy Shevchenko   2023-07-03  957  	const struct acpi_device_id *ids, const struct acpi_device *adev)
2b5ae9604949391 Andy Shevchenko   2023-07-03  958  {
2b5ae9604949391 Andy Shevchenko   2023-07-03  959  	return NULL;
2b5ae9604949391 Andy Shevchenko   2023-07-03  960  }
2b5ae9604949391 Andy Shevchenko   2023-07-03  961  
cf761af9ee0f2c1 Mika Westerberg   2012-10-31  962  static inline const struct acpi_device_id *acpi_match_device(
cf761af9ee0f2c1 Mika Westerberg   2012-10-31  963  	const struct acpi_device_id *ids, const struct device *dev)
80212a162329e59 Sinan Kaya        2017-12-13  964  {
80212a162329e59 Sinan Kaya        2017-12-13  965  	return NULL;
80212a162329e59 Sinan Kaya        2017-12-13  966  }
80212a162329e59 Sinan Kaya        2017-12-13  967  
67dcc26d208ca55 Andy Shevchenko   2018-02-09  968  static inline const void *acpi_device_get_match_data(const struct device *dev)
cf761af9ee0f2c1 Mika Westerberg   2012-10-31  969  {
cf761af9ee0f2c1 Mika Westerberg   2012-10-31  970  	return NULL;
cf761af9ee0f2c1 Mika Westerberg   2012-10-31  971  }
cf761af9ee0f2c1 Mika Westerberg   2012-10-31  972  
cf761af9ee0f2c1 Mika Westerberg   2012-10-31  973  static inline bool acpi_driver_match_device(struct device *dev,
cf761af9ee0f2c1 Mika Westerberg   2012-10-31  974  					    const struct device_driver *drv)
cf761af9ee0f2c1 Mika Westerberg   2012-10-31  975  {
cf761af9ee0f2c1 Mika Westerberg   2012-10-31  976  	return false;
cf761af9ee0f2c1 Mika Westerberg   2012-10-31  977  }
cf761af9ee0f2c1 Mika Westerberg   2012-10-31  978  
1b94ad7ccc21c00 Andy Shevchenko   2023-01-19 @979  static inline bool acpi_check_dsm(acpi_handle handle, const guid_t *guid,
1b94ad7ccc21c00 Andy Shevchenko   2023-01-19  980  				  u64 rev, u64 funcs)
1b94ad7ccc21c00 Andy Shevchenko   2023-01-19  981  {
1b94ad7ccc21c00 Andy Shevchenko   2023-01-19  982  	return false;
1b94ad7ccc21c00 Andy Shevchenko   2023-01-19  983  }
1b94ad7ccc21c00 Andy Shevchenko   2023-01-19  984  
4ae399241adba66 Kejian Yan        2016-06-03 @985  static inline union acpi_object *acpi_evaluate_dsm(acpi_handle handle,
94116f8126de976 Andy Shevchenko   2017-06-05  986  						   const guid_t *guid,
1e0cb59d5f0a41d John Garry        2020-09-30  987  						   u64 rev, u64 func,
4ae399241adba66 Kejian Yan        2016-06-03  988  						   union acpi_object *argv4)
4ae399241adba66 Kejian Yan        2016-06-03  989  {
4ae399241adba66 Kejian Yan        2016-06-03  990  	return NULL;
4ae399241adba66 Kejian Yan        2016-06-03  991  }
4ae399241adba66 Kejian Yan        2016-06-03  992  

:::::: The code at line 809 was first introduced by commit
:::::: 6eb17e0df74c036eba7548915b37f009403fe09e ACPI: bus: add stub acpi_dev_found() to linux/acpi.h

:::::: TO: Kejian Yan <yankejian@huawei.com>
:::::: CC: David S. Miller <davem@davemloft.net>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
