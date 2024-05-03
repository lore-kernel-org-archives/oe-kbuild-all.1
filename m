Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF8BF153BCB
	for <oe-kbuild-all@lists.linux.dev>; Fri,  3 May 2024 15:38:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714750731; cv=none; b=Om6+2BTyDFZsd0H3sRkMy2dDzVnLZudIg18HWZ1X1pIWpVhl/v6toJClirIQrIfImFcTqW1skGDwU1Yp4z0p/Vc3IaWMQzvPXVaeDKLcPZZproOsSOzH11NJ0BQ1e9cXs4NOQ8v/PrUzVtHN4VqoikczwG/7hwnuV+YAbbShKpo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714750731; c=relaxed/simple;
	bh=e4tLR678qbvjDZiTtuPRanXrySM6rgh0CR+JpVWovOo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=UF09OHilK8xtwG4zekflaIxb7YvOL25Ogah3vrt8WV39VXDAILT3ximfeMJquWwNwETG0RAO1uvEno5WYQ3nLyws7FXsXdpsNwr+CLVq/pRB/2u4DaCjy8/93Qpq3KOq3K2OU7lnxd93aWp5LskA7SOGMtb2KyArOwfZx4GOkjM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=F05YejPA; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="F05YejPA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714750729; x=1746286729;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=e4tLR678qbvjDZiTtuPRanXrySM6rgh0CR+JpVWovOo=;
  b=F05YejPA1pD5EZ+wrZpM5FcoFKRUaIHAZbB45L/x6hDJ0v5w7/kivnat
   Yjwe2ib3ZtdbIqX90Ud7PUy7W/r5hFm7CI+EiqsUX4VhussQ/YLIV+2QD
   UH7eU1sjWnieTxSUciTsawRjMYujY28BTZdhhPHP5fp/pCu07LXBP6UDA
   d1kLND1hL9P89alQE5GjTfIrjc7bUJd2btWACPEGW1e4v63Lv9yVszRsW
   xEq8qjEKhclALVvRz20uv0nnOo2eVyh65h5bjv68sOI1RF8A7grNtFM7A
   93381vL4gNtQmBeUeTHNEXDrmBsP+/JBSR0d2PG7tu+sO46O4UqYBFG4Y
   w==;
X-CSE-ConnectionGUID: fkVPyCDYRwKxjOTooF38iA==
X-CSE-MsgGUID: VAD/hk21T1mSCY7Qv76oQA==
X-IronPort-AV: E=McAfee;i="6600,9927,11063"; a="21247391"
X-IronPort-AV: E=Sophos;i="6.07,251,1708416000"; 
   d="scan'208";a="21247391"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 May 2024 08:38:39 -0700
X-CSE-ConnectionGUID: rECW8xKrTjypYMPxDRmpZw==
X-CSE-MsgGUID: PHweRaHWSmKhcQO9xeB2/g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,251,1708416000"; 
   d="scan'208";a="27992370"
Received: from lkp-server01.sh.intel.com (HELO e434dd42e5a1) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 03 May 2024 08:38:37 -0700
Received: from kbuild by e434dd42e5a1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s2uzb-000BoK-0V;
	Fri, 03 May 2024 15:38:35 +0000
Date: Fri, 3 May 2024 23:37:51 +0800
From: kernel test robot <lkp@intel.com>
To: Joel Stanley <joel@jms.id.au>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [shenki:aspeed-6.9-rebase 740/1143]
 include/linux/i3c/device.h:358:38: warning: 'struct i3c_ibi_payload'
 declared inside parameter list will not be visible outside of this
 definition or declaration
Message-ID: <202405032300.bA9cA7YX-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/shenki/linux aspeed-6.9-rebase
head:   9bdcee91eb5d9149678acb9d066e9dafbd026721
commit: 25b964218f873fa25639e22bde2ac5e02f317b05 [740/1143] i3c: master: Implement CCC GETSTATUS function
config: arc-randconfig-002-20240503 (https://download.01.org/0day-ci/archive/20240503/202405032300.bA9cA7YX-lkp@intel.com/config)
compiler: arc-elf-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240503/202405032300.bA9cA7YX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405032300.bA9cA7YX-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/i3c/ccc.h:12,
                    from include/linux/i3c/master.h:15,
                    from drivers/i3c/internals.h:11,
                    from drivers/i3c/device.c:15:
   include/linux/i3c/device.h:320:1: error: version control conflict marker in file
     320 | <<<<<<< HEAD
         | ^~~~~~~
   include/linux/i3c/device.h:322:1: error: version control conflict marker in file
     322 | =======
         | ^~~~~~~
   include/linux/i3c/device.h:328:1: error: version control conflict marker in file
     328 | >>>>>>> i3c: master: Implement CCC GETSTATUS function
         | ^~~~~~~
>> include/linux/i3c/device.h:358:38: warning: 'struct i3c_ibi_payload' declared inside parameter list will not be visible outside of this definition or declaration
     358 |                         const struct i3c_ibi_payload *payload);
         |                                      ^~~~~~~~~~~~~~~
>> include/linux/i3c/master.h:162:38: warning: 'struct i3c_ibi_payload' declared inside parameter list will not be visible outside of this definition or declaration
     162 |                         const struct i3c_ibi_payload *payload);
         |                                      ^~~~~~~~~~~~~~~
>> drivers/i3c/device.c:84:5: warning: no previous prototype for 'i3c_device_getstatus_ccc' [-Wmissing-prototypes]
      84 | int i3c_device_getstatus_ccc(struct i3c_device *dev, struct i3c_device_info *info)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/i3c/device.c:105:6: error: conflicting types for 'i3c_device_get_info'; have 'void(const struct i3c_device *, struct i3c_device_info *)'
     105 | void i3c_device_get_info(const struct i3c_device *dev,
         |      ^~~~~~~~~~~~~~~~~~~
   include/linux/i3c/device.h:327:6: note: previous declaration of 'i3c_device_get_info' with type 'void(struct i3c_device *, struct i3c_device_info *)'
     327 | void i3c_device_get_info(struct i3c_device *dev, struct i3c_device_info *info);
         |      ^~~~~~~~~~~~~~~~~~~
   In file included from include/linux/linkage.h:7,
                    from include/linux/printk.h:8,
                    from include/asm-generic/bug.h:22,
                    from arch/arc/include/asm/bug.h:30,
                    from include/linux/bug.h:5,
                    from drivers/i3c/device.c:9:
   drivers/i3c/device.c:116:19: error: conflicting types for 'i3c_device_get_info'; have 'void(const struct i3c_device *, struct i3c_device_info *)'
     116 | EXPORT_SYMBOL_GPL(i3c_device_get_info);
         |                   ^~~~~~~~~~~~~~~~~~~
   include/linux/export.h:56:28: note: in definition of macro '__EXPORT_SYMBOL'
      56 |         extern typeof(sym) sym;                                 \
         |                            ^~~
   include/linux/export.h:69:41: note: in expansion of macro '_EXPORT_SYMBOL'
      69 | #define EXPORT_SYMBOL_GPL(sym)          _EXPORT_SYMBOL(sym, "GPL")
         |                                         ^~~~~~~~~~~~~~
   drivers/i3c/device.c:116:1: note: in expansion of macro 'EXPORT_SYMBOL_GPL'
     116 | EXPORT_SYMBOL_GPL(i3c_device_get_info);
         | ^~~~~~~~~~~~~~~~~
   include/linux/i3c/device.h:327:6: note: previous declaration of 'i3c_device_get_info' with type 'void(struct i3c_device *, struct i3c_device_info *)'
     327 | void i3c_device_get_info(struct i3c_device *dev, struct i3c_device_info *info);
         |      ^~~~~~~~~~~~~~~~~~~
--
   In file included from include/linux/i3c/ccc.h:12,
                    from include/linux/i3c/master.h:15,
                    from drivers/i3c/internals.h:11,
                    from drivers/i3c/master.c:20:
   include/linux/i3c/device.h:320:1: error: version control conflict marker in file
     320 | <<<<<<< HEAD
         | ^~~~~~~
   include/linux/i3c/device.h:322:1: error: version control conflict marker in file
     322 | =======
         | ^~~~~~~
   include/linux/i3c/device.h:328:1: error: version control conflict marker in file
     328 | >>>>>>> i3c: master: Implement CCC GETSTATUS function
         | ^~~~~~~
>> include/linux/i3c/device.h:358:38: warning: 'struct i3c_ibi_payload' declared inside parameter list will not be visible outside of this definition or declaration
     358 |                         const struct i3c_ibi_payload *payload);
         |                                      ^~~~~~~~~~~~~~~
>> include/linux/i3c/master.h:162:38: warning: 'struct i3c_ibi_payload' declared inside parameter list will not be visible outside of this definition or declaration
     162 |                         const struct i3c_ibi_payload *payload);
         |                                      ^~~~~~~~~~~~~~~
   drivers/i3c/master.c: In function 'i3c_device_uevent':
>> drivers/i3c/master.c:284:29: warning: passing argument 1 of 'i3c_device_get_info' discards 'const' qualifier from pointer target type [-Wdiscarded-qualifiers]
     284 |         i3c_device_get_info(i3cdev, &devinfo);
         |                             ^~~~~~
   include/linux/i3c/device.h:327:45: note: expected 'struct i3c_device *' but argument is of type 'const struct i3c_device *'
     327 | void i3c_device_get_info(struct i3c_device *dev, struct i3c_device_info *info);
         |                          ~~~~~~~~~~~~~~~~~~~^~~
   drivers/i3c/master.c: In function 'i3c_master_add_i3c_dev_locked':
   drivers/i3c/master.c:2037:40: error: assignment to 'void (*)(struct i3c_device *, const struct i3c_ibi_payload *)' from incompatible pointer type 'void (*)(struct i3c_device *, const struct i3c_ibi_payload *)' [-Werror=incompatible-pointer-types]
    2037 |                         ibireq.handler = olddev->ibi->handler;
         |                                        ^
   drivers/i3c/master.c: In function 'i3c_master_handle_ibi':
   drivers/i3c/master.c:2522:32: error: storage size of 'payload' isn't known
    2522 |         struct i3c_ibi_payload payload;
         |                                ^~~~~~~
>> drivers/i3c/master.c:2522:32: warning: unused variable 'payload' [-Wunused-variable]
   drivers/i3c/master.c: At top level:
   drivers/i3c/master.c:2869:1: error: version control conflict marker in file
    2869 | <<<<<<< HEAD
         | ^~~~~~~
   drivers/i3c/master.c: In function 'i3c_target_bus_cleanup':
   drivers/i3c/master.c:2878:19: error: 'struct i3c_master_controller' has no member named 'target_ops'
    2878 |         if (master->target_ops->bus_cleanup)
         |                   ^~
   drivers/i3c/master.c:2879:23: error: 'struct i3c_master_controller' has no member named 'target_ops'
    2879 |                 master->target_ops->bus_cleanup(master);
         |                       ^~
   drivers/i3c/master.c: In function 'i3c_target_register_new_i3c_dev':
   drivers/i3c/master.c:2922:32: error: 'i3c_target_device_type' undeclared (first use in this function); did you mean 'i3c_target_device_release'?
    2922 |         desc->dev->dev.type = &i3c_target_device_type;
         |                                ^~~~~~~~~~~~~~~~~~~~~~
         |                                i3c_target_device_release
   drivers/i3c/master.c:2922:32: note: each undeclared identifier is reported only once for each function it appears in
   drivers/i3c/master.c: At top level:
   drivers/i3c/master.c:2965:46: warning: 'struct i3c_target_ops' declared inside parameter list will not be visible outside of this definition or declaration
    2965 | static int i3c_target_check_ops(const struct i3c_target_ops *ops)
         |                                              ^~~~~~~~~~~~~~
   drivers/i3c/master.c: In function 'i3c_target_check_ops':
   drivers/i3c/master.c:2967:25: error: invalid use of undefined type 'const struct i3c_target_ops'
    2967 |         if (!ops || !ops->bus_init)
         |                         ^~
   drivers/i3c/master.c: At top level:
   drivers/i3c/master.c:2974:38: warning: 'struct i3c_target_ops' declared inside parameter list will not be visible outside of this definition or declaration
    2974 |                         const struct i3c_target_ops *ops)
         |                                      ^~~~~~~~~~~~~~
   drivers/i3c/master.c:2973:5: warning: no previous prototype for 'i3c_target_register' [-Wmissing-prototypes]
    2973 | int i3c_target_register(struct i3c_master_controller *master, struct device *parent,
         |     ^~~~~~~~~~~~~~~~~~~
   drivers/i3c/master.c: In function 'i3c_target_register':
   drivers/i3c/master.c:2980:36: error: passing argument 1 of 'i3c_target_check_ops' from incompatible pointer type [-Werror=incompatible-pointer-types]
    2980 |         ret = i3c_target_check_ops(ops);
         |                                    ^~~
         |                                    |
         |                                    const struct i3c_target_ops *
   drivers/i3c/master.c:2965:62: note: expected 'const struct i3c_target_ops *' but argument is of type 'const struct i3c_target_ops *'
    2965 | static int i3c_target_check_ops(const struct i3c_target_ops *ops)
         |                                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~
   drivers/i3c/master.c:2988:15: error: 'struct i3c_master_controller' has no member named 'target_ops'
    2988 |         master->target_ops = ops;
         |               ^~
   drivers/i3c/master.c:3006:15: error: implicit declaration of function 'i3c_target_bus_init'; did you mean 'i3c_master_bus_init'? [-Werror=implicit-function-declaration]
    3006 |         ret = i3c_target_bus_init(master);
         |               ^~~~~~~~~~~~~~~~~~~
         |               i3c_master_bus_init
   drivers/i3c/master.c: At top level:
   drivers/i3c/master.c:3022:5: warning: no previous prototype for 'i3c_target_unregister' [-Wmissing-prototypes]
    3022 | int i3c_target_unregister(struct i3c_master_controller *master)
         |     ^~~~~~~~~~~~~~~~~~~~~
   drivers/i3c/master.c:3032:67: warning: 'struct i3c_target_read_setup' declared inside parameter list will not be visible outside of this definition or declaration
    3032 | int i3c_target_read_register(struct i3c_device *dev, const struct i3c_target_read_setup *setup)
         |                                                                   ^~~~~~~~~~~~~~~~~~~~~
   drivers/i3c/master.c:3032:5: warning: no previous prototype for 'i3c_target_read_register' [-Wmissing-prototypes]
    3032 | int i3c_target_read_register(struct i3c_device *dev, const struct i3c_target_read_setup *setup)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/i3c/master.c: In function 'i3c_target_read_register':
   drivers/i3c/master.c:3034:18: error: 'struct i3c_dev_desc' has no member named 'target_info'
    3034 |         dev->desc->target_info.read_handler = setup->handler;
         |                  ^~
   drivers/i3c/master.c:3034:52: error: invalid use of undefined type 'const struct i3c_target_read_setup'
    3034 |         dev->desc->target_info.read_handler = setup->handler;
         |                                                    ^~
   drivers/i3c/master.c: At top level:
   drivers/i3c/master.c:3043:31: warning: 'struct i3c_target_ops' declared inside parameter list will not be visible outside of this definition or declaration
    3043 |                  const struct i3c_target_ops *target_ops,
         |                               ^~~~~~~~~~~~~~
   drivers/i3c/master.c:3040:5: warning: no previous prototype for 'i3c_register' [-Wmissing-prototypes]
    3040 | int i3c_register(struct i3c_master_controller *master,
         |     ^~~~~~~~~~~~
   drivers/i3c/master.c: In function 'i3c_register':
   drivers/i3c/master.c:3053:23: error: 'struct i3c_master_controller' has no member named 'target'
    3053 |                 master->target = true;
         |                       ^~
   drivers/i3c/master.c:3054:60: error: passing argument 3 of 'i3c_target_register' from incompatible pointer type [-Werror=incompatible-pointer-types]
    3054 |                 return i3c_target_register(master, parent, target_ops);
         |                                                            ^~~~~~~~~~
         |                                                            |
         |                                                            const struct i3c_target_ops *
   drivers/i3c/master.c:2974:54: note: expected 'const struct i3c_target_ops *' but argument is of type 'const struct i3c_target_ops *'
    2974 |                         const struct i3c_target_ops *ops)
         |                         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~
   drivers/i3c/master.c: At top level:
   drivers/i3c/master.c:3061:5: warning: no previous prototype for 'i3c_unregister' [-Wmissing-prototypes]
    3061 | int i3c_unregister(struct i3c_master_controller *master)
         |     ^~~~~~~~~~~~~~
   drivers/i3c/master.c: In function 'i3c_unregister':
   drivers/i3c/master.c:3063:19: error: 'struct i3c_master_controller' has no member named 'target'
    3063 |         if (master->target)
         |                   ^~
   drivers/i3c/master.c: At top level:
   drivers/i3c/master.c:3072:1: error: version control conflict marker in file
    3072 | >>>>>>> i3c: Add BCR and DCR properties
         | ^~~~~~~
   drivers/i3c/master.c: In function 'i3c_dev_getstatus_locked':
   drivers/i3c/master.c:3110:13: error: 'struct i3c_device_info' has no member named 'status'
    3110 |         info->status = getsts->status;
         |             ^~
--
   In file included from include/linux/i3c/ccc.h:12,
                    from include/linux/i3c/master.h:15,
                    from drivers/i3c/master/i3c-master-cdns.c:12:
   include/linux/i3c/device.h:320:1: error: version control conflict marker in file
     320 | <<<<<<< HEAD
         | ^~~~~~~
   include/linux/i3c/device.h:322:1: error: version control conflict marker in file
     322 | =======
         | ^~~~~~~
   include/linux/i3c/device.h:328:1: error: version control conflict marker in file
     328 | >>>>>>> i3c: master: Implement CCC GETSTATUS function
         | ^~~~~~~
>> include/linux/i3c/device.h:358:38: warning: 'struct i3c_ibi_payload' declared inside parameter list will not be visible outside of this definition or declaration
     358 |                         const struct i3c_ibi_payload *payload);
         |                                      ^~~~~~~~~~~~~~~
>> include/linux/i3c/master.h:162:38: warning: 'struct i3c_ibi_payload' declared inside parameter list will not be visible outside of this definition or declaration
     162 |                         const struct i3c_ibi_payload *payload);
         |                                      ^~~~~~~~~~~~~~~
--
   In file included from include/linux/i3c/ccc.h:12,
                    from include/linux/i3c/master.h:15,
                    from drivers/i3c/master/dw-i3c-master.c:14:
   include/linux/i3c/device.h:320:1: error: version control conflict marker in file
     320 | <<<<<<< HEAD
         | ^~~~~~~
   include/linux/i3c/device.h:322:1: error: version control conflict marker in file
     322 | =======
         | ^~~~~~~
   include/linux/i3c/device.h:328:1: error: version control conflict marker in file
     328 | >>>>>>> i3c: master: Implement CCC GETSTATUS function
         | ^~~~~~~
>> include/linux/i3c/device.h:358:38: warning: 'struct i3c_ibi_payload' declared inside parameter list will not be visible outside of this definition or declaration
     358 |                         const struct i3c_ibi_payload *payload);
         |                                      ^~~~~~~~~~~~~~~
>> include/linux/i3c/master.h:162:38: warning: 'struct i3c_ibi_payload' declared inside parameter list will not be visible outside of this definition or declaration
     162 |                         const struct i3c_ibi_payload *payload);
         |                                      ^~~~~~~~~~~~~~~
   drivers/i3c/master/dw-i3c-master.c:15:10: fatal error: linux/i3c/target.h: No such file or directory
      15 | #include <linux/i3c/target.h>
         |          ^~~~~~~~~~~~~~~~~~~~
   compilation terminated.
--
   In file included from include/linux/i3c/ccc.h:12,
                    from include/linux/i3c/master.h:15,
                    from drivers/i3c/master/mipi-i3c-hci/cmd_v1.c:11:
   include/linux/i3c/device.h:320:1: error: version control conflict marker in file
     320 | <<<<<<< HEAD
         | ^~~~~~~
   include/linux/i3c/device.h:322:1: error: version control conflict marker in file
     322 | =======
         | ^~~~~~~
   include/linux/i3c/device.h:328:1: error: version control conflict marker in file
     328 | >>>>>>> i3c: master: Implement CCC GETSTATUS function
         | ^~~~~~~
>> include/linux/i3c/device.h:358:38: warning: 'struct i3c_ibi_payload' declared inside parameter list will not be visible outside of this definition or declaration
     358 |                         const struct i3c_ibi_payload *payload);
         |                                      ^~~~~~~~~~~~~~~
>> include/linux/i3c/master.h:162:38: warning: 'struct i3c_ibi_payload' declared inside parameter list will not be visible outside of this definition or declaration
     162 |                         const struct i3c_ibi_payload *payload);
         |                                      ^~~~~~~~~~~~~~~
   drivers/i3c/master/mipi-i3c-hci/cmd_v1.c:386:13: warning: 'i3c_aspeed_set_daa_index' defined but not used [-Wunused-function]
     386 | static void i3c_aspeed_set_daa_index(struct i3c_hci *hci, u8 addr)
         |             ^~~~~~~~~~~~~~~~~~~~~~~~
--
   In file included from drivers/net/mctp/mctp-i3c.c:13:
   include/linux/i3c/device.h:320:1: error: version control conflict marker in file
     320 | <<<<<<< HEAD
         | ^~~~~~~
   include/linux/i3c/device.h:322:1: error: version control conflict marker in file
     322 | =======
         | ^~~~~~~
   include/linux/i3c/device.h:328:1: error: version control conflict marker in file
     328 | >>>>>>> i3c: master: Implement CCC GETSTATUS function
         | ^~~~~~~
>> include/linux/i3c/device.h:358:38: warning: 'struct i3c_ibi_payload' declared inside parameter list will not be visible outside of this definition or declaration
     358 |                         const struct i3c_ibi_payload *payload);
         |                                      ^~~~~~~~~~~~~~~
   In file included from drivers/net/mctp/mctp-i3c.c:14:
>> include/linux/i3c/master.h:162:38: warning: 'struct i3c_ibi_payload' declared inside parameter list will not be visible outside of this definition or declaration
     162 |                         const struct i3c_ibi_payload *payload);
         |                                      ^~~~~~~~~~~~~~~
>> drivers/net/mctp/mctp-i3c.c:176:47: warning: 'struct i3c_ibi_payload' declared inside parameter list will not be visible outside of this definition or declaration
     176 |                                  const struct i3c_ibi_payload *payload)
         |                                               ^~~~~~~~~~~~~~~
   drivers/net/mctp/mctp-i3c.c: In function 'mctp_i3c_ibi_handler':
   drivers/net/mctp/mctp-i3c.c:184:28: error: invalid use of undefined type 'const struct i3c_ibi_payload'
     184 |                 if (payload->len > 0) {
         |                            ^~
   drivers/net/mctp/mctp-i3c.c:185:43: error: invalid use of undefined type 'const struct i3c_ibi_payload'
     185 |                         if (((u8 *)payload->data)[0] != I3C_MDB_MCTP) {
         |                                           ^~
   drivers/net/mctp/mctp-i3c.c: In function 'mctp_i3c_setup':
   drivers/net/mctp/mctp-i3c.c:205:28: error: initialization of 'void (*)(struct i3c_device *, const struct i3c_ibi_payload *)' from incompatible pointer type 'void (*)(struct i3c_device *, const struct i3c_ibi_payload *)' [-Werror=incompatible-pointer-types]
     205 |                 .handler = mctp_i3c_ibi_handler,
         |                            ^~~~~~~~~~~~~~~~~~~~
   drivers/net/mctp/mctp-i3c.c:205:28: note: (near initialization for 'ibi.handler')
   cc1: some warnings being treated as errors


vim +358 include/linux/i3c/device.h

672825cd2823a0 Jack Chen            2022-12-07  319  
25b964218f873f Oleksandr Shulzhenko 2022-01-27 @320  <<<<<<< HEAD
162736b0d71a96 Greg Kroah-Hartman   2023-01-11  321  void i3c_device_get_info(const struct i3c_device *dev, struct i3c_device_info *info);
25b964218f873f Oleksandr Shulzhenko 2022-01-27  322  =======
25b964218f873f Oleksandr Shulzhenko 2022-01-27  323  int i3c_device_getstatus_ccc(struct i3c_device *dev, struct i3c_device_info *info);
25b964218f873f Oleksandr Shulzhenko 2022-01-27  324  
25b964218f873f Oleksandr Shulzhenko 2022-01-27  325  int i3c_device_generate_ibi(struct i3c_device *dev, const u8 *data, int len);
25b964218f873f Oleksandr Shulzhenko 2022-01-27  326  
25b964218f873f Oleksandr Shulzhenko 2022-01-27  327  void i3c_device_get_info(struct i3c_device *dev, struct i3c_device_info *info);
25b964218f873f Oleksandr Shulzhenko 2022-01-27  328  >>>>>>> i3c: master: Implement CCC GETSTATUS function
3a379bbcea0af6 Boris Brezillon      2017-07-19  329  
3a379bbcea0af6 Boris Brezillon      2017-07-19  330  struct i3c_ibi_payload {
3a379bbcea0af6 Boris Brezillon      2017-07-19  331  	unsigned int len;
3a379bbcea0af6 Boris Brezillon      2017-07-19  332  	const void *data;
3a379bbcea0af6 Boris Brezillon      2017-07-19  333  };
3a379bbcea0af6 Boris Brezillon      2017-07-19  334  
3a379bbcea0af6 Boris Brezillon      2017-07-19  335  /**
3a379bbcea0af6 Boris Brezillon      2017-07-19  336   * struct i3c_ibi_setup - IBI setup object
3a379bbcea0af6 Boris Brezillon      2017-07-19  337   * @max_payload_len: maximum length of the payload associated to an IBI. If one
3a379bbcea0af6 Boris Brezillon      2017-07-19  338   *		     IBI appears to have a payload that is bigger than this
3a379bbcea0af6 Boris Brezillon      2017-07-19  339   *		     number, the IBI will be rejected.
3a379bbcea0af6 Boris Brezillon      2017-07-19  340   * @num_slots: number of pre-allocated IBI slots. This should be chosen so that
3a379bbcea0af6 Boris Brezillon      2017-07-19  341   *	       the system never runs out of IBI slots, otherwise you'll lose
3a379bbcea0af6 Boris Brezillon      2017-07-19  342   *	       IBIs.
3a379bbcea0af6 Boris Brezillon      2017-07-19  343   * @handler: IBI handler, every time an IBI is received. This handler is called
3a379bbcea0af6 Boris Brezillon      2017-07-19  344   *	     in a workqueue context. It is allowed to sleep and send new
3a379bbcea0af6 Boris Brezillon      2017-07-19  345   *	     messages on the bus, though it's recommended to keep the
3a379bbcea0af6 Boris Brezillon      2017-07-19  346   *	     processing done there as fast as possible to avoid delaying
3a379bbcea0af6 Boris Brezillon      2017-07-19  347   *	     processing of other queued on the same workqueue.
3a379bbcea0af6 Boris Brezillon      2017-07-19  348   *
3a379bbcea0af6 Boris Brezillon      2017-07-19  349   * Temporary structure used to pass information to i3c_device_request_ibi().
3a379bbcea0af6 Boris Brezillon      2017-07-19  350   * This object can be allocated on the stack since i3c_device_request_ibi()
3a379bbcea0af6 Boris Brezillon      2017-07-19  351   * copies every bit of information and do not use it after
3a379bbcea0af6 Boris Brezillon      2017-07-19  352   * i3c_device_request_ibi() has returned.
3a379bbcea0af6 Boris Brezillon      2017-07-19  353   */
3a379bbcea0af6 Boris Brezillon      2017-07-19  354  struct i3c_ibi_setup {
3a379bbcea0af6 Boris Brezillon      2017-07-19  355  	unsigned int max_payload_len;
3a379bbcea0af6 Boris Brezillon      2017-07-19  356  	unsigned int num_slots;
3a379bbcea0af6 Boris Brezillon      2017-07-19  357  	void (*handler)(struct i3c_device *dev,
3a379bbcea0af6 Boris Brezillon      2017-07-19 @358  			const struct i3c_ibi_payload *payload);
3a379bbcea0af6 Boris Brezillon      2017-07-19  359  };
3a379bbcea0af6 Boris Brezillon      2017-07-19  360  

:::::: The code at line 358 was first introduced by commit
:::::: 3a379bbcea0af6280e1ca0d1edfcf4e68cde6ee0 i3c: Add core I3C infrastructure

:::::: TO: Boris Brezillon <boris.brezillon@bootlin.com>
:::::: CC: Boris Brezillon <boris.brezillon@bootlin.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
