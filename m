Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BB3E2737E3
	for <oe-kbuild-all@lists.linux.dev>; Sun,  1 Mar 2026 03:56:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772337404; cv=none; b=bWiddGAqXoQ+099vYVbOof6ZKwWh1yda6AqWBIe1ZcxrBQl90vFb7SjPbH9Semo/GXTYM7yMtUGZgf933oW9SbINhDtfm52D3VLGzdYWWDXlKLBBbdkrFmQqyGjuzxAQ/nwBVHF+AH1igKDqW8xzS1U2SwhD+NLGBZmOi2/qjy4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772337404; c=relaxed/simple;
	bh=Q6yBbHSknLXvM6tB6t9to0DDMY9KpH3zzOz3TZnQp+8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=IZyHAcrH8zlX071KsM3q7cDXVohAo7VRIZKOX2Fti5VvG2kp9REKZXxwCzICRIdq7rH58UAmeV9PJVFXdEJE7eUQnVYbhACJwZav7zK42W41NsNJ6BETfMh7hHk0bOfExfU6lDLZ1Li4SwNoAmhaFVFEEAMHnWyU4N4EfcXDesE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mvYifIFW; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mvYifIFW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772337402; x=1803873402;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Q6yBbHSknLXvM6tB6t9to0DDMY9KpH3zzOz3TZnQp+8=;
  b=mvYifIFWKheia8rtPhuNqr4gBQJV1v2UtSd40hNEcCh5pEy0lw3MKcbu
   22qvXvg9M4UalUEPzy5i3uOOwB5RBqnnpYs7CDw/HOcaiBunimtBvoobF
   K/bW69qgihWczrIEnS0gqoNKt1D0CtNsRfc8n2DVzku3vZS/8eQd7mLgb
   QMcr+gp4zT0XGEy/dhHATkyvMBXB8Hb0FwIeooHPQ9m+Wz7pM/rQ5colN
   v5W1POCvESS7m17VFrHahZUMQeuTtUE9GRv13DGA1oXGxpDDjPX1XaSZa
   x0DZVwNcnRbfNkI6j+wpslMVILvrfwgB4fHio2Z0jj4f3dHXTDCZrZrgs
   g==;
X-CSE-ConnectionGUID: SN37KPs6QnWAi9wINDTFfQ==
X-CSE-MsgGUID: 6iPpsBxETNOFzCnCKymOlA==
X-IronPort-AV: E=McAfee;i="6800,10657,11715"; a="72407581"
X-IronPort-AV: E=Sophos;i="6.21,317,1763452800"; 
   d="scan'208";a="72407581"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Feb 2026 19:56:41 -0800
X-CSE-ConnectionGUID: aNfz3YP4SQ+zZ8AM8Z+Vjg==
X-CSE-MsgGUID: aasa7mO9S6aD9BqWTyrx7g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,317,1763452800"; 
   d="scan'208";a="214590981"
Received: from lkp-server01.sh.intel.com (HELO 59784f1c7b2a) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 28 Feb 2026 19:56:40 -0800
Received: from kbuild by 59784f1c7b2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vwXv3-000000001Fp-3GdC;
	Sun, 01 Mar 2026 03:56:37 +0000
Date: Sun, 01 Mar 2026 11:55:48 +0800
From: kernel test robot <lkp@intel.com>
To: "Thomas =?utf-8?Q?Wei=C3=9Fschuh"?= <linux@weissschuh.net>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [thomas-weissschuh:b4/cros_kbd_led-cleanup 3/8]
 drivers/media/usb/go7007/snd-go7007.c:24:12: warning: 'index' defined but not
 used
Message-ID: <202603011149.0BX84L3l-lkp@intel.com>
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
config: csky-allmodconfig (https://download.01.org/0day-ci/archive/20260301/202603011149.0BX84L3l-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260301/202603011149.0BX84L3l-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603011149.0BX84L3l-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/i2c.h:13,
                    from drivers/media/usb/go7007/snd-go7007.c:14:
   include/linux/acpi.h:809:20: error: static declaration of 'acpi_dev_found' follows non-static declaration
     809 | static inline bool acpi_dev_found(const char *hid)
         |                    ^~~~~~~~~~~~~~
   In file included from include/linux/acpi.h:29:
   include/acpi/acpi_bus.h:87:6: note: previous declaration of 'acpi_dev_found' with type 'bool(const char *)' {aka '_Bool(const char *)'}
      87 | bool acpi_dev_found(const char *hid);
         |      ^~~~~~~~~~~~~~
   include/linux/acpi.h:814:20: error: static declaration of 'acpi_dev_present' follows non-static declaration
     814 | static inline bool acpi_dev_present(const char *hid, const char *uid, s64 hrv)
         |                    ^~~~~~~~~~~~~~~~
   include/acpi/acpi_bus.h:88:6: note: previous declaration of 'acpi_dev_present' with type 'bool(const char *, const char *, s64)' {aka '_Bool(const char *, const char *, long long int)'}
      88 | bool acpi_dev_present(const char *hid, const char *uid, s64 hrv);
         |      ^~~~~~~~~~~~~~~~
   include/linux/acpi.h:832:20: error: static declaration of 'acpi_reduced_hardware' follows non-static declaration
     832 | static inline bool acpi_reduced_hardware(void)
         |                    ^~~~~~~~~~~~~~~~~~~~~
   include/acpi/acpi_bus.h:89:6: note: previous declaration of 'acpi_reduced_hardware' with type 'bool(void)' {aka '_Bool(void)'}
      89 | bool acpi_reduced_hardware(void);
         |      ^~~~~~~~~~~~~~~~~~~~~
   include/linux/acpi.h:979:20: error: static declaration of 'acpi_check_dsm' follows non-static declaration
     979 | static inline bool acpi_check_dsm(acpi_handle handle, const guid_t *guid,
         |                    ^~~~~~~~~~~~~~
   include/acpi/acpi_bus.h:56:6: note: previous declaration of 'acpi_check_dsm' with type 'bool(void *, const guid_t *, u64,  u64)' {aka '_Bool(void *, const guid_t *, long long unsigned int,  long long unsigned int)'}
      56 | bool acpi_check_dsm(acpi_handle handle, const guid_t *guid, u64 rev, u64 funcs);
         |      ^~~~~~~~~~~~~~
   include/linux/acpi.h:985:34: error: static declaration of 'acpi_evaluate_dsm' follows non-static declaration
     985 | static inline union acpi_object *acpi_evaluate_dsm(acpi_handle handle,
         |                                  ^~~~~~~~~~~~~~~~~
   include/acpi/acpi_bus.h:57:20: note: previous declaration of 'acpi_evaluate_dsm' with type 'union acpi_object *(void *, const guid_t *, u64,  u64,  union acpi_object *)' {aka 'union acpi_object *(void *, const guid_t *, long long unsigned int,  long long unsigned int,  union acpi_object *)'}
      57 | union acpi_object *acpi_evaluate_dsm(acpi_handle handle, const guid_t *guid,
         |                    ^~~~~~~~~~~~~~~~~
   In file included from include/linux/array_size.h:5,
                    from include/linux/kernel.h:16,
                    from drivers/media/usb/go7007/snd-go7007.c:6:
   include/linux/compiler.h:203:82: error: expression in static assertion is not an integer
     203 | #define __BUILD_BUG_ON_ZERO_MSG(e, msg, ...) ((int)sizeof(struct {_Static_assert(!(e), msg);}))
         |                                                                                  ^
   include/linux/compiler.h:208:33: note: in expansion of macro '__BUILD_BUG_ON_ZERO_MSG'
     208 | #define __must_be_array(a)      __BUILD_BUG_ON_ZERO_MSG(!__is_array(a), \
         |                                 ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/array_size.h:11:59: note: in expansion of macro '__must_be_array'
      11 | #define ARRAY_SIZE(arr) (sizeof(arr) / sizeof((arr)[0]) + __must_be_array(arr))
         |                                                           ^~~~~~~~~~~~~~~
   include/linux/moduleparam.h:550:20: note: in expansion of macro 'ARRAY_SIZE'
     550 |         = { .max = ARRAY_SIZE(array), .num = nump,                      \
         |                    ^~~~~~~~~~
   include/linux/moduleparam.h:534:9: note: in expansion of macro 'module_param_array_named'
     534 |         module_param_array_named(name, name, type, nump, perm)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/usb/go7007/snd-go7007.c:28:1: note: in expansion of macro 'module_param_array'
      28 | module_param_array(index, int, NULL, 0444);
         | ^~~~~~~~~~~~~~~~~~
>> drivers/media/usb/go7007/snd-go7007.c:24:12: warning: 'index' defined but not used [-Wunused-variable]
      24 | static int index[SNDRV_CARDS] = SNDRV_DEFAULT_IDX;
         |            ^~~~~
--
   In file included from include/linux/i2c.h:13,
                    from drivers/media/pci/cx25821/cx25821.h:14,
                    from drivers/media/pci/cx25821/cx25821-alsa.c:29:
   include/linux/acpi.h:809:20: error: static declaration of 'acpi_dev_found' follows non-static declaration
     809 | static inline bool acpi_dev_found(const char *hid)
         |                    ^~~~~~~~~~~~~~
   In file included from include/linux/acpi.h:29:
   include/acpi/acpi_bus.h:87:6: note: previous declaration of 'acpi_dev_found' with type 'bool(const char *)' {aka '_Bool(const char *)'}
      87 | bool acpi_dev_found(const char *hid);
         |      ^~~~~~~~~~~~~~
   include/linux/acpi.h:814:20: error: static declaration of 'acpi_dev_present' follows non-static declaration
     814 | static inline bool acpi_dev_present(const char *hid, const char *uid, s64 hrv)
         |                    ^~~~~~~~~~~~~~~~
   include/acpi/acpi_bus.h:88:6: note: previous declaration of 'acpi_dev_present' with type 'bool(const char *, const char *, s64)' {aka '_Bool(const char *, const char *, long long int)'}
      88 | bool acpi_dev_present(const char *hid, const char *uid, s64 hrv);
         |      ^~~~~~~~~~~~~~~~
   include/linux/acpi.h:832:20: error: static declaration of 'acpi_reduced_hardware' follows non-static declaration
     832 | static inline bool acpi_reduced_hardware(void)
         |                    ^~~~~~~~~~~~~~~~~~~~~
   include/acpi/acpi_bus.h:89:6: note: previous declaration of 'acpi_reduced_hardware' with type 'bool(void)' {aka '_Bool(void)'}
      89 | bool acpi_reduced_hardware(void);
         |      ^~~~~~~~~~~~~~~~~~~~~
   include/linux/acpi.h:979:20: error: static declaration of 'acpi_check_dsm' follows non-static declaration
     979 | static inline bool acpi_check_dsm(acpi_handle handle, const guid_t *guid,
         |                    ^~~~~~~~~~~~~~
   include/acpi/acpi_bus.h:56:6: note: previous declaration of 'acpi_check_dsm' with type 'bool(void *, const guid_t *, u64,  u64)' {aka '_Bool(void *, const guid_t *, long long unsigned int,  long long unsigned int)'}
      56 | bool acpi_check_dsm(acpi_handle handle, const guid_t *guid, u64 rev, u64 funcs);
         |      ^~~~~~~~~~~~~~
   include/linux/acpi.h:985:34: error: static declaration of 'acpi_evaluate_dsm' follows non-static declaration
     985 | static inline union acpi_object *acpi_evaluate_dsm(acpi_handle handle,
         |                                  ^~~~~~~~~~~~~~~~~
   include/acpi/acpi_bus.h:57:20: note: previous declaration of 'acpi_evaluate_dsm' with type 'union acpi_object *(void *, const guid_t *, u64,  u64,  union acpi_object *)' {aka 'union acpi_object *(void *, const guid_t *, long long unsigned int,  long long unsigned int,  union acpi_object *)'}
      57 | union acpi_object *acpi_evaluate_dsm(acpi_handle handle, const guid_t *guid,
         |                    ^~~~~~~~~~~~~~~~~
   In file included from include/linux/build_bug.h:5,
                    from include/linux/container_of.h:5,
                    from include/linux/list.h:5,
                    from include/linux/module.h:12,
                    from drivers/media/pci/cx25821/cx25821-alsa.c:12:
   include/linux/compiler.h:203:82: error: expression in static assertion is not an integer
     203 | #define __BUILD_BUG_ON_ZERO_MSG(e, msg, ...) ((int)sizeof(struct {_Static_assert(!(e), msg);}))
         |                                                                                  ^
   include/linux/compiler.h:208:33: note: in expansion of macro '__BUILD_BUG_ON_ZERO_MSG'
     208 | #define __must_be_array(a)      __BUILD_BUG_ON_ZERO_MSG(!__is_array(a), \
         |                                 ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/array_size.h:11:59: note: in expansion of macro '__must_be_array'
      11 | #define ARRAY_SIZE(arr) (sizeof(arr) / sizeof((arr)[0]) + __must_be_array(arr))
         |                                                           ^~~~~~~~~~~~~~~
   include/linux/moduleparam.h:550:20: note: in expansion of macro 'ARRAY_SIZE'
     550 |         = { .max = ARRAY_SIZE(array), .num = nump,                      \
         |                    ^~~~~~~~~~
   include/linux/moduleparam.h:534:9: note: in expansion of macro 'module_param_array_named'
     534 |         module_param_array_named(name, name, type, nump, perm)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/pci/cx25821/cx25821-alsa.c:97:1: note: in expansion of macro 'module_param_array'
      97 | module_param_array(index, int, NULL, 0444);
         | ^~~~~~~~~~~~~~~~~~
>> drivers/media/pci/cx25821/cx25821-alsa.c:90:12: warning: 'index' defined but not used [-Wunused-variable]
      90 | static int index[SNDRV_CARDS] = SNDRV_DEFAULT_IDX;      /* Index 0-MAX */
         |            ^~~~~
--
   In file included from include/linux/i2c.h:13,
                    from drivers/media/pci/cx88/cx88.h:14,
                    from drivers/media/pci/cx88/cx88-alsa.c:13:
   include/linux/acpi.h:809:20: error: static declaration of 'acpi_dev_found' follows non-static declaration
     809 | static inline bool acpi_dev_found(const char *hid)
         |                    ^~~~~~~~~~~~~~
   In file included from include/linux/acpi.h:29:
   include/acpi/acpi_bus.h:87:6: note: previous declaration of 'acpi_dev_found' with type 'bool(const char *)' {aka '_Bool(const char *)'}
      87 | bool acpi_dev_found(const char *hid);
         |      ^~~~~~~~~~~~~~
   include/linux/acpi.h:814:20: error: static declaration of 'acpi_dev_present' follows non-static declaration
     814 | static inline bool acpi_dev_present(const char *hid, const char *uid, s64 hrv)
         |                    ^~~~~~~~~~~~~~~~
   include/acpi/acpi_bus.h:88:6: note: previous declaration of 'acpi_dev_present' with type 'bool(const char *, const char *, s64)' {aka '_Bool(const char *, const char *, long long int)'}
      88 | bool acpi_dev_present(const char *hid, const char *uid, s64 hrv);
         |      ^~~~~~~~~~~~~~~~
   include/linux/acpi.h:832:20: error: static declaration of 'acpi_reduced_hardware' follows non-static declaration
     832 | static inline bool acpi_reduced_hardware(void)
         |                    ^~~~~~~~~~~~~~~~~~~~~
   include/acpi/acpi_bus.h:89:6: note: previous declaration of 'acpi_reduced_hardware' with type 'bool(void)' {aka '_Bool(void)'}
      89 | bool acpi_reduced_hardware(void);
         |      ^~~~~~~~~~~~~~~~~~~~~
   include/linux/acpi.h:979:20: error: static declaration of 'acpi_check_dsm' follows non-static declaration
     979 | static inline bool acpi_check_dsm(acpi_handle handle, const guid_t *guid,
         |                    ^~~~~~~~~~~~~~
   include/acpi/acpi_bus.h:56:6: note: previous declaration of 'acpi_check_dsm' with type 'bool(void *, const guid_t *, u64,  u64)' {aka '_Bool(void *, const guid_t *, long long unsigned int,  long long unsigned int)'}
      56 | bool acpi_check_dsm(acpi_handle handle, const guid_t *guid, u64 rev, u64 funcs);
         |      ^~~~~~~~~~~~~~
   include/linux/acpi.h:985:34: error: static declaration of 'acpi_evaluate_dsm' follows non-static declaration
     985 | static inline union acpi_object *acpi_evaluate_dsm(acpi_handle handle,
         |                                  ^~~~~~~~~~~~~~~~~
   include/acpi/acpi_bus.h:57:20: note: previous declaration of 'acpi_evaluate_dsm' with type 'union acpi_object *(void *, const guid_t *, u64,  u64,  union acpi_object *)' {aka 'union acpi_object *(void *, const guid_t *, long long unsigned int,  long long unsigned int,  union acpi_object *)'}
      57 | union acpi_object *acpi_evaluate_dsm(acpi_handle handle, const guid_t *guid,
         |                    ^~~~~~~~~~~~~~~~~
   In file included from include/linux/array_size.h:5,
                    from include/linux/string.h:6,
                    from include/linux/uuid.h:11,
                    from include/linux/mod_devicetable.h:14,
                    from include/linux/pci.h:27,
                    from drivers/media/pci/cx88/cx88.h:13:
   include/linux/compiler.h:203:82: error: expression in static assertion is not an integer
     203 | #define __BUILD_BUG_ON_ZERO_MSG(e, msg, ...) ((int)sizeof(struct {_Static_assert(!(e), msg);}))
         |                                                                                  ^
   include/linux/compiler.h:208:33: note: in expansion of macro '__BUILD_BUG_ON_ZERO_MSG'
     208 | #define __must_be_array(a)      __BUILD_BUG_ON_ZERO_MSG(!__is_array(a), \
         |                                 ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/array_size.h:11:59: note: in expansion of macro '__must_be_array'
      11 | #define ARRAY_SIZE(arr) (sizeof(arr) / sizeof((arr)[0]) + __must_be_array(arr))
         |                                                           ^~~~~~~~~~~~~~~
   include/linux/moduleparam.h:550:20: note: in expansion of macro 'ARRAY_SIZE'
     550 |         = { .max = ARRAY_SIZE(array), .num = nump,                      \
         |                    ^~~~~~~~~~
   include/linux/moduleparam.h:534:9: note: in expansion of macro 'module_param_array_named'
     534 |         module_param_array_named(name, name, type, nump, perm)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/pci/cx88/cx88-alsa.c:88:1: note: in expansion of macro 'module_param_array'
      88 | module_param_array(index, int, NULL, 0444);
         | ^~~~~~~~~~~~~~~~~~
>> drivers/media/pci/cx88/cx88-alsa.c:81:12: warning: 'index' defined but not used [-Wunused-variable]
      81 | static int index[SNDRV_CARDS] = SNDRV_DEFAULT_IDX;      /* Index 0-MAX */
         |            ^~~~~
--
   In file included from include/linux/i2c.h:13,
                    from drivers/media/pci/ivtv/ivtv-driver.h:35,
                    from drivers/media/pci/ivtv/ivtv-alsa-main.c:11:
   include/linux/acpi.h:809:20: error: static declaration of 'acpi_dev_found' follows non-static declaration
     809 | static inline bool acpi_dev_found(const char *hid)
         |                    ^~~~~~~~~~~~~~
   In file included from include/linux/acpi.h:29:
   include/acpi/acpi_bus.h:87:6: note: previous declaration of 'acpi_dev_found' with type 'bool(const char *)' {aka '_Bool(const char *)'}
      87 | bool acpi_dev_found(const char *hid);
         |      ^~~~~~~~~~~~~~
   include/linux/acpi.h:814:20: error: static declaration of 'acpi_dev_present' follows non-static declaration
     814 | static inline bool acpi_dev_present(const char *hid, const char *uid, s64 hrv)
         |                    ^~~~~~~~~~~~~~~~
   include/acpi/acpi_bus.h:88:6: note: previous declaration of 'acpi_dev_present' with type 'bool(const char *, const char *, s64)' {aka '_Bool(const char *, const char *, long long int)'}
      88 | bool acpi_dev_present(const char *hid, const char *uid, s64 hrv);
         |      ^~~~~~~~~~~~~~~~
   include/linux/acpi.h:832:20: error: static declaration of 'acpi_reduced_hardware' follows non-static declaration
     832 | static inline bool acpi_reduced_hardware(void)
         |                    ^~~~~~~~~~~~~~~~~~~~~
   include/acpi/acpi_bus.h:89:6: note: previous declaration of 'acpi_reduced_hardware' with type 'bool(void)' {aka '_Bool(void)'}
      89 | bool acpi_reduced_hardware(void);
         |      ^~~~~~~~~~~~~~~~~~~~~
   include/linux/acpi.h:979:20: error: static declaration of 'acpi_check_dsm' follows non-static declaration
     979 | static inline bool acpi_check_dsm(acpi_handle handle, const guid_t *guid,
         |                    ^~~~~~~~~~~~~~
   include/acpi/acpi_bus.h:56:6: note: previous declaration of 'acpi_check_dsm' with type 'bool(void *, const guid_t *, u64,  u64)' {aka '_Bool(void *, const guid_t *, long long unsigned int,  long long unsigned int)'}
      56 | bool acpi_check_dsm(acpi_handle handle, const guid_t *guid, u64 rev, u64 funcs);
         |      ^~~~~~~~~~~~~~
   include/linux/acpi.h:985:34: error: static declaration of 'acpi_evaluate_dsm' follows non-static declaration
     985 | static inline union acpi_object *acpi_evaluate_dsm(acpi_handle handle,
         |                                  ^~~~~~~~~~~~~~~~~
   include/acpi/acpi_bus.h:57:20: note: previous declaration of 'acpi_evaluate_dsm' with type 'union acpi_object *(void *, const guid_t *, u64,  u64,  union acpi_object *)' {aka 'union acpi_object *(void *, const guid_t *, long long unsigned int,  long long unsigned int,  union acpi_object *)'}
      57 | union acpi_object *acpi_evaluate_dsm(acpi_handle handle, const guid_t *guid,
         |                    ^~~~~~~~~~~~~~~~~
   In file included from include/linux/build_bug.h:5,
                    from include/linux/container_of.h:5,
                    from include/linux/list.h:5,
                    from include/linux/module.h:12,
                    from drivers/media/pci/ivtv/ivtv-driver.h:27:
   include/linux/compiler.h:203:82: error: expression in static assertion is not an integer
     203 | #define __BUILD_BUG_ON_ZERO_MSG(e, msg, ...) ((int)sizeof(struct {_Static_assert(!(e), msg);}))
         |                                                                                  ^
   include/linux/compiler.h:208:33: note: in expansion of macro '__BUILD_BUG_ON_ZERO_MSG'
     208 | #define __must_be_array(a)      __BUILD_BUG_ON_ZERO_MSG(!__is_array(a), \
         |                                 ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/array_size.h:11:59: note: in expansion of macro '__must_be_array'
      11 | #define ARRAY_SIZE(arr) (sizeof(arr) / sizeof((arr)[0]) + __must_be_array(arr))
         |                                                           ^~~~~~~~~~~~~~~
   include/linux/moduleparam.h:550:20: note: in expansion of macro 'ARRAY_SIZE'
     550 |         = { .max = ARRAY_SIZE(array), .num = nump,                      \
         |                    ^~~~~~~~~~
   include/linux/moduleparam.h:534:9: note: in expansion of macro 'module_param_array_named'
     534 |         module_param_array_named(name, name, type, nump, perm)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/pci/ivtv/ivtv-alsa-main.c:35:1: note: in expansion of macro 'module_param_array'
      35 | module_param_array(index, int, NULL, 0444);
         | ^~~~~~~~~~~~~~~~~~
>> drivers/media/pci/ivtv/ivtv-alsa-main.c:20:12: warning: 'index' defined but not used [-Wunused-variable]
      20 | static int index[SNDRV_CARDS] = SNDRV_DEFAULT_IDX;
         |            ^~~~~
--
   In file included from include/linux/i2c.h:13,
                    from drivers/media/pci/saa7134/saa7134.h:14,
                    from drivers/media/pci/saa7134/saa7134-alsa.c:6:
   include/linux/acpi.h:809:20: error: static declaration of 'acpi_dev_found' follows non-static declaration
     809 | static inline bool acpi_dev_found(const char *hid)
         |                    ^~~~~~~~~~~~~~
   In file included from include/linux/acpi.h:29:
   include/acpi/acpi_bus.h:87:6: note: previous declaration of 'acpi_dev_found' with type 'bool(const char *)' {aka '_Bool(const char *)'}
      87 | bool acpi_dev_found(const char *hid);
         |      ^~~~~~~~~~~~~~
   include/linux/acpi.h:814:20: error: static declaration of 'acpi_dev_present' follows non-static declaration
     814 | static inline bool acpi_dev_present(const char *hid, const char *uid, s64 hrv)
         |                    ^~~~~~~~~~~~~~~~
   include/acpi/acpi_bus.h:88:6: note: previous declaration of 'acpi_dev_present' with type 'bool(const char *, const char *, s64)' {aka '_Bool(const char *, const char *, long long int)'}
      88 | bool acpi_dev_present(const char *hid, const char *uid, s64 hrv);
         |      ^~~~~~~~~~~~~~~~
   include/linux/acpi.h:832:20: error: static declaration of 'acpi_reduced_hardware' follows non-static declaration
     832 | static inline bool acpi_reduced_hardware(void)
         |                    ^~~~~~~~~~~~~~~~~~~~~
   include/acpi/acpi_bus.h:89:6: note: previous declaration of 'acpi_reduced_hardware' with type 'bool(void)' {aka '_Bool(void)'}
      89 | bool acpi_reduced_hardware(void);
         |      ^~~~~~~~~~~~~~~~~~~~~
   include/linux/acpi.h:979:20: error: static declaration of 'acpi_check_dsm' follows non-static declaration
     979 | static inline bool acpi_check_dsm(acpi_handle handle, const guid_t *guid,
         |                    ^~~~~~~~~~~~~~
   include/acpi/acpi_bus.h:56:6: note: previous declaration of 'acpi_check_dsm' with type 'bool(void *, const guid_t *, u64,  u64)' {aka '_Bool(void *, const guid_t *, long long unsigned int,  long long unsigned int)'}
      56 | bool acpi_check_dsm(acpi_handle handle, const guid_t *guid, u64 rev, u64 funcs);
         |      ^~~~~~~~~~~~~~
   include/linux/acpi.h:985:34: error: static declaration of 'acpi_evaluate_dsm' follows non-static declaration
     985 | static inline union acpi_object *acpi_evaluate_dsm(acpi_handle handle,
         |                                  ^~~~~~~~~~~~~~~~~
   include/acpi/acpi_bus.h:57:20: note: previous declaration of 'acpi_evaluate_dsm' with type 'union acpi_object *(void *, const guid_t *, u64,  u64,  union acpi_object *)' {aka 'union acpi_object *(void *, const guid_t *, long long unsigned int,  long long unsigned int,  union acpi_object *)'}
      57 | union acpi_object *acpi_evaluate_dsm(acpi_handle handle, const guid_t *guid,
         |                    ^~~~~~~~~~~~~~~~~
   In file included from include/linux/array_size.h:5,
                    from include/linux/string.h:6,
                    from include/linux/uuid.h:11,
                    from include/linux/mod_devicetable.h:14,
                    from include/linux/pci.h:27,
                    from drivers/media/pci/saa7134/saa7134.h:13:
   include/linux/compiler.h:203:82: error: expression in static assertion is not an integer
     203 | #define __BUILD_BUG_ON_ZERO_MSG(e, msg, ...) ((int)sizeof(struct {_Static_assert(!(e), msg);}))
         |                                                                                  ^
   include/linux/compiler.h:208:33: note: in expansion of macro '__BUILD_BUG_ON_ZERO_MSG'
     208 | #define __must_be_array(a)      __BUILD_BUG_ON_ZERO_MSG(!__is_array(a), \
         |                                 ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/array_size.h:11:59: note: in expansion of macro '__must_be_array'
      11 | #define ARRAY_SIZE(arr) (sizeof(arr) / sizeof((arr)[0]) + __must_be_array(arr))
         |                                                           ^~~~~~~~~~~~~~~
   include/linux/moduleparam.h:550:20: note: in expansion of macro 'ARRAY_SIZE'
     550 |         = { .max = ARRAY_SIZE(array), .num = nump,                      \
         |                    ^~~~~~~~~~
   include/linux/moduleparam.h:534:9: note: in expansion of macro 'module_param_array_named'
     534 |         module_param_array_named(name, name, type, nump, perm)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/pci/saa7134/saa7134-alsa.c:38:1: note: in expansion of macro 'module_param_array'
      38 | module_param_array(index, int, NULL, 0444);
         | ^~~~~~~~~~~~~~~~~~
>> drivers/media/pci/saa7134/saa7134-alsa.c:34:12: warning: 'index' defined but not used [-Wunused-variable]
      34 | static int index[SNDRV_CARDS] = SNDRV_DEFAULT_IDX;      /* Index 0-MAX */
         |            ^~~~~


vim +/index +24 drivers/media/usb/go7007/snd-go7007.c

866b8695d67e83 drivers/staging/go7007/snd-go7007.c       Greg Kroah-Hartman 2008-02-15  23  
866b8695d67e83 drivers/staging/go7007/snd-go7007.c       Greg Kroah-Hartman 2008-02-15 @24  static int index[SNDRV_CARDS] = SNDRV_DEFAULT_IDX;
866b8695d67e83 drivers/staging/go7007/snd-go7007.c       Greg Kroah-Hartman 2008-02-15  25  static char *id[SNDRV_CARDS] = SNDRV_DEFAULT_STR;
90ab5ee94171b3 drivers/staging/media/go7007/snd-go7007.c Rusty Russell      2012-01-13  26  static bool enable[SNDRV_CARDS] = SNDRV_DEFAULT_ENABLE_PNP;
866b8695d67e83 drivers/staging/go7007/snd-go7007.c       Greg Kroah-Hartman 2008-02-15  27  

:::::: The code at line 24 was first introduced by commit
:::::: 866b8695d67e83f47194731d3a7ba55826a7ec70 Staging: add the go7007 video driver

:::::: TO: Greg Kroah-Hartman <gregkh@suse.de>
:::::: CC: Greg Kroah-Hartman <gregkh@suse.de>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
