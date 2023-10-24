Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D17B63B7A9
	for <oe-kbuild-all@lists.linux.dev>; Tue, 24 Oct 2023 22:18:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZMIWFI4j"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698185915; x=1729721915;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=P2qQb7UeADAfRhbfLCcktqTEIMDWZt6LMAtlkSoJJL0=;
  b=ZMIWFI4jT6ijucerjiAEIPN7mlZ9iIq5c/CY3PxfcaN2GNZvf0fQW+2l
   VFscoAJSfELoBZR3bz7udzAyyzJSunID8muiCfPt3W8Dz7TNRhpiWP9bR
   Qe/t3l0PvaRsQKNwghb9K0V5UrI70czjpHHWA5m/BdR6MF29azS6MDtY1
   hITKaUgZ4x/D72Po50P2W9OjjNed+G9Raf9ozvQECUeXLYPxxDTOyRXQ2
   flRvJIqt8UL5FxfqEzQny8K8Jp6QWlvjLyFPuayMiRz0/4XyDEI8R9DAd
   cP/cZtybW3OTEaJdFIi45JmPomCrDUJNe6bbILY9TNJdH/TxzTJymynF1
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10873"; a="8743965"
X-IronPort-AV: E=Sophos;i="6.03,248,1694761200"; 
   d="scan'208";a="8743965"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Oct 2023 15:18:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10873"; a="735174052"
X-IronPort-AV: E=Sophos;i="6.03,248,1694761200"; 
   d="scan'208";a="735174052"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 24 Oct 2023 15:18:30 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qvPjH-0008Kv-1w;
	Tue, 24 Oct 2023 22:18:27 +0000
Date: Wed, 25 Oct 2023 06:17:37 +0800
From: kernel test robot <lkp@intel.com>
To: Cliff Cai <cliff.cai@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, "Pan, Kris" <kris.pan@intel.com>
Subject: [intel-lts:4.19/android_s 2963/30000]
 security/keystore/applet_read.c:119:5: warning: no previous declaration for
 'read_keystore_applet'
Message-ID: <202310250647.H9iQXSu8-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/intel/linux-intel-lts.git 4.19/android_s
head:   a0b8c3f924aa72ed5d1892e77377d9144287fc35
commit: fbca186d797f471651a8434311815e78975957e4 [2963/30000] security: add keystore driver support
config: i386-randconfig-005-20231014 (https://download.01.org/0day-ci/archive/20231025/202310250647.H9iQXSu8-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231025/202310250647.H9iQXSu8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310250647.H9iQXSu8-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> security/keystore/applet_read.c:119:5: warning: no previous declaration for 'read_keystore_applet' [-Wmissing-declarations]
    int read_keystore_applet(const char *filename, u8 **buf, size_t *len)
        ^~~~~~~~~~~~~~~~~~~~
--
   security/keystore/api_dal.c: In function 'dal_keystore_register_client':
   security/keystore/api_dal.c:122:1: warning: label 'cmd_retry' defined but not used [-Wunused-label]
    cmd_retry:
    ^~~~~~~~~
   security/keystore/api_dal.c: At top level:
>> security/keystore/api_dal.c:206:5: warning: no previous declaration for 'dal_keystore_register' [-Wmissing-declarations]
    int dal_keystore_register(enum keystore_seed_type seed_type,
        ^~~~~~~~~~~~~~~~~~~~~
>> security/keystore/api_dal.c:294:5: warning: no previous declaration for 'dal_keystore_unregister' [-Wmissing-declarations]
    int dal_keystore_unregister(const uint8_t *client_ticket)
        ^~~~~~~~~~~~~~~~~~~~~~~
>> security/keystore/api_dal.c:391:5: warning: no previous declaration for 'dal_keystore_wrapped_key_size' [-Wmissing-declarations]
    int dal_keystore_wrapped_key_size(enum keystore_key_spec keyspec,
        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> security/keystore/api_dal.c:510:5: warning: no previous declaration for 'dal_keystore_wrap_key' [-Wmissing-declarations]
    int dal_keystore_wrap_key(const uint8_t *client_ticket,
        ^~~~~~~~~~~~~~~~~~~~~
>> security/keystore/api_dal.c:575:5: warning: no previous declaration for 'dal_keystore_generate_key' [-Wmissing-declarations]
    int dal_keystore_generate_key(const uint8_t *client_ticket,
        ^~~~~~~~~~~~~~~~~~~~~~~~~
>> security/keystore/api_dal.c:636:5: warning: no previous declaration for 'dal_keystore_load_key' [-Wmissing-declarations]
    int dal_keystore_load_key(const uint8_t *client_ticket,
        ^~~~~~~~~~~~~~~~~~~~~
   security/keystore/api_dal.c: In function 'dal_keystore_load_key':
   security/keystore/api_dal.c:661:2: warning: ISO C90 forbids mixed declarations and code [-Wdeclaration-after-statement]
     uint8_t input[KEYSTORE_MAX_CLIENT_ID_SIZE
     ^~~~~~~
   security/keystore/api_dal.c: At top level:
>> security/keystore/api_dal.c:720:5: warning: no previous declaration for 'dal_keystore_unload_key' [-Wmissing-declarations]
    int dal_keystore_unload_key(const uint8_t *client_ticket, unsigned int slot_id)
        ^~~~~~~~~~~~~~~~~~~~~~~
>> security/keystore/api_dal.c:755:5: warning: no previous declaration for 'dal_keystore_encrypt_size' [-Wmissing-declarations]
    int dal_keystore_encrypt_size(enum keystore_algo_spec algo_spec,
        ^~~~~~~~~~~~~~~~~~~~~~~~~
>> security/keystore/api_dal.c:768:5: warning: no previous declaration for 'dal_keystore_encrypt' [-Wmissing-declarations]
    int dal_keystore_encrypt(const uint8_t *client_ticket, int slot_id,
        ^~~~~~~~~~~~~~~~~~~~
   In file included from include/linux/printk.h:7:0,
                    from include/linux/kernel.h:14,
                    from security/keystore/api_dal.c:18:
   security/keystore/api_dal.c: In function 'dal_keystore_encrypt':
   include/linux/kern_levels.h:5:18: warning: too many arguments for format [-Wformat-extra-args]
    #define KERN_SOH "\001"  /* ASCII Start Of Header */
                     ^
   include/linux/kern_levels.h:11:18: note: in expansion of macro 'KERN_SOH'
    #define KERN_ERR KERN_SOH "3" /* error conditions */
                     ^~~~~~~~
   include/linux/printk.h:308:9: note: in expansion of macro 'KERN_ERR'
     printk(KERN_ERR pr_fmt(fmt), ##__VA_ARGS__)
            ^~~~~~~~
   security/keystore/keystore_debug.h:69:23: note: in expansion of macro 'pr_err'
    #define ks_err(...)   pr_err(__VA_ARGS__)
                          ^~~~~~
   security/keystore/api_dal.c:837:4: note: in expansion of macro 'ks_err'
       ks_err(KBUILD_MODNAME ": %s: Invalid key retrived from wrapped key cache.\n",
       ^~~~~~
   security/keystore/api_dal.c: At top level:
>> security/keystore/api_dal.c:914:5: warning: no previous declaration for 'dal_keystore_decrypt_size' [-Wmissing-declarations]
    int dal_keystore_decrypt_size(enum keystore_algo_spec algo_spec,
        ^~~~~~~~~~~~~~~~~~~~~~~~~
>> security/keystore/api_dal.c:921:5: warning: no previous declaration for 'dal_keystore_decrypt' [-Wmissing-declarations]
    int dal_keystore_decrypt(const uint8_t *client_ticket, int slot_id,
        ^~~~~~~~~~~~~~~~~~~~
   In file included from include/linux/printk.h:7:0,
                    from include/linux/kernel.h:14,
                    from security/keystore/api_dal.c:18:
   security/keystore/api_dal.c: In function 'dal_keystore_decrypt':
   include/linux/kern_levels.h:5:18: warning: too many arguments for format [-Wformat-extra-args]
    #define KERN_SOH "\001"  /* ASCII Start Of Header */
                     ^
   include/linux/kern_levels.h:11:18: note: in expansion of macro 'KERN_SOH'
    #define KERN_ERR KERN_SOH "3" /* error conditions */
                     ^~~~~~~~
   include/linux/printk.h:308:9: note: in expansion of macro 'KERN_ERR'
     printk(KERN_ERR pr_fmt(fmt), ##__VA_ARGS__)
            ^~~~~~~~
   security/keystore/keystore_debug.h:69:23: note: in expansion of macro 'pr_err'
    #define ks_err(...)   pr_err(__VA_ARGS__)
                          ^~~~~~
   security/keystore/api_dal.c:989:4: note: in expansion of macro 'ks_err'
       ks_err(KBUILD_MODNAME ": %s: Invalid key retrived from wrapped key cache.\n",
       ^~~~~~
   At top level:
   security/keystore/api_dal.c:369:12: warning: 'get_cached_key_size' defined but not used [-Wunused-function]
    static int get_cached_key_size(void)
               ^~~~~~~~~~~~~~~~~~~
--
>> security/keystore/keystore_kmod.c:92:5: warning: no previous declaration for 'add_to_blacklist' [-Wmissing-declarations]
    int add_to_blacklist(const char *uuid_str)
        ^~~~~~~~~~~~~~~~
   security/keystore/keystore_kmod.c:62: warning: Function parameter or member 'inode' not described in 'keystore_open'
   security/keystore/keystore_kmod.c:62: warning: Function parameter or member 'file' not described in 'keystore_open'
   security/keystore/keystore_kmod.c:76: warning: Function parameter or member 'inode' not described in 'keystore_release'
   security/keystore/keystore_kmod.c:76: warning: Function parameter or member 'file' not described in 'keystore_release'
--
>> security/keystore/ioctls.c:411:6: warning: no previous declaration for 'keystore_ioctl' [-Wmissing-declarations]
    long keystore_ioctl(struct file *file, unsigned int cmd, unsigned long arg)
         ^~~~~~~~~~~~~~
   security/keystore/ioctls.c: In function 'keystore_ioctl':
   security/keystore/ioctls.c:450:7: warning: this statement may fall through [-Wimplicit-fallthrough=]
      res = version_op(&op.version);
      ~~~~^~~~~~~~~~~~~~~~~~~~~~~~~
   security/keystore/ioctls.c:451:2: note: here
     case KEYSTORE_IOC_REGISTER:
     ^~~~
   security/keystore/ioctls.c:412: warning: Function parameter or member 'file' not described in 'keystore_ioctl'
   security/keystore/ioctls.c:412: warning: Function parameter or member 'cmd' not described in 'keystore_ioctl'
   security/keystore/ioctls.c:412: warning: Function parameter or member 'arg' not described in 'keystore_ioctl'
--
>> security/keystore/rdrand.c:40:5: warning: no previous declaration for 'keystore_get_rdrand' [-Wmissing-declarations]
    int keystore_get_rdrand(uint8_t *buf, int size)
        ^~~~~~~~~~~~~~~~~~~
   security/keystore/rdrand.c:41: warning: Function parameter or member 'buf' not described in 'keystore_get_rdrand'
   security/keystore/rdrand.c:41: warning: Function parameter or member 'size' not described in 'keystore_get_rdrand'


vim +/read_keystore_applet +119 security/keystore/applet_read.c

   118	
 > 119	int read_keystore_applet(const char *filename, u8 **buf, size_t *len)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
