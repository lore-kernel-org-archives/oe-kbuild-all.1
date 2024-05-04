Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BAE717F8
	for <oe-kbuild-all@lists.linux.dev>; Sat,  4 May 2024 01:42:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714786935; cv=none; b=iLbCqksD6geN0adk7HDiuXSE/nYEHyrN2a4tZrVj0AcpQvzRJdy/GKhiN7P231KCJQr0AkwcBQT476lohugu4cDc0uTvekQdMdTBtC1CilAMNsHQVWnb1DA7pgSebzG13wtJhLaz0mRUBYBqkjwMGe2KTBbg/OUeSlAZKrO1Jpg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714786935; c=relaxed/simple;
	bh=dMG+X1Tz/eDqyBi4NZTDYFN0FmtoHoWHjQfn4qzVoOQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=bF/lw7Yh9jjxugjNzuVBVpeSwKL8bwYUqvqCdJqOoBucNZrgKz5ipr+ABlRksY9RJ6O+iax0BZm7CdLDZnAN3hinXVeSFxE5KGHU1PH7xKlLgsRSh+k+v3m2nK5V8G0avgLF02ii1CxXVsbBkwZgTImX3W56QB6zacyKld4swGY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EZAARkGP; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EZAARkGP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714786933; x=1746322933;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=dMG+X1Tz/eDqyBi4NZTDYFN0FmtoHoWHjQfn4qzVoOQ=;
  b=EZAARkGPKFCPmoBigVmn0DfG64Z9sFId85u6JfrW0ubVYBttRAnL74ZN
   0Wxtsf6re4+ElYHYLG41HGNz1ISsjNI078u/tHf7PhGLqbpn0SThBzpu3
   Qa4zRTnxyfS107lY8QKbcQ4gjQaLDw3r0JB2uNZQ4Czk4SPru+mthME+u
   ZawGzIiti7LKVJeEZEiBJD/PqLTPBOR0WKZScVp6bcz9lspr4C4+OQZ22
   Azvxw8BJPzOS/HoqZEVFk0fArZbx8wULAxOy4Kh8P9h0Wig0nwh6NyrIY
   6JOTcM73B1m7zDX3UtEZtOO11X3SV9RoUuvgiVCZ11jHlppgLJ6HxrryA
   Q==;
X-CSE-ConnectionGUID: 6nqCZlaTRxmb58ZZsFEPMQ==
X-CSE-MsgGUID: KjS+kSq5S/yPg+N/bnszuQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11063"; a="10488195"
X-IronPort-AV: E=Sophos;i="6.07,252,1708416000"; 
   d="scan'208";a="10488195"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 May 2024 18:42:10 -0700
X-CSE-ConnectionGUID: nWvJWSrbQ66hHxi/ncwutg==
X-CSE-MsgGUID: 6pMNhGFmTl6wjO+H2myAgw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,252,1708416000"; 
   d="scan'208";a="28019455"
Received: from lkp-server01.sh.intel.com (HELO e434dd42e5a1) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 03 May 2024 18:42:09 -0700
Received: from kbuild by e434dd42e5a1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s34Pe-000CJ2-23;
	Sat, 04 May 2024 01:42:06 +0000
Date: Sat, 4 May 2024 09:41:20 +0800
From: kernel test robot <lkp@intel.com>
To: Joel Stanley <joel@jms.id.au>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [shenki:aspeed-6.9-rebase 740/1143] drivers/i3c/master.c:2037:19:
 error: assignment from incompatible pointer type
Message-ID: <202405040905.VmafzoRJ-lkp@intel.com>
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
config: i386-randconfig-004-20240503 (https://download.01.org/0day-ci/archive/20240504/202405040905.VmafzoRJ-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240504/202405040905.VmafzoRJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405040905.VmafzoRJ-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/i3c/ccc.h:12:0,
                    from include/linux/i3c/master.h:15,
                    from drivers/i3c/internals.h:11,
                    from drivers/i3c/master.c:20:
   include/linux/i3c/device.h:320:1: error: version control conflict marker in file
    <<<<<<< HEAD
    ^~~~~~~
   include/linux/i3c/device.h:322:1: error: version control conflict marker in file
    =======
    ^~~~~~~
   include/linux/i3c/device.h:328:1: error: version control conflict marker in file
    >>>>>>> i3c: master: Implement CCC GETSTATUS function
    ^~~~~~~
   include/linux/i3c/device.h:358:17: warning: 'struct i3c_ibi_payload' declared inside parameter list will not be visible outside of this definition or declaration
       const struct i3c_ibi_payload *payload);
                    ^~~~~~~~~~~~~~~
   In file included from drivers/i3c/internals.h:11:0,
                    from drivers/i3c/master.c:20:
   include/linux/i3c/master.h:162:17: warning: 'struct i3c_ibi_payload' declared inside parameter list will not be visible outside of this definition or declaration
       const struct i3c_ibi_payload *payload);
                    ^~~~~~~~~~~~~~~
   drivers/i3c/master.c: In function 'i3c_device_uevent':
   drivers/i3c/master.c:284:22: warning: passing argument 1 of 'i3c_device_get_info' discards 'const' qualifier from pointer target type [-Wdiscarded-qualifiers]
     i3c_device_get_info(i3cdev, &devinfo);
                         ^~~~~~
   In file included from include/linux/i3c/ccc.h:12:0,
                    from include/linux/i3c/master.h:15,
                    from drivers/i3c/internals.h:11,
                    from drivers/i3c/master.c:20:
   include/linux/i3c/device.h:327:6: note: expected 'struct i3c_device *' but argument is of type 'const struct i3c_device *'
    void i3c_device_get_info(struct i3c_device *dev, struct i3c_device_info *info);
         ^~~~~~~~~~~~~~~~~~~
   drivers/i3c/master.c: In function 'i3c_master_add_i3c_dev_locked':
>> drivers/i3c/master.c:2037:19: error: assignment from incompatible pointer type [-Werror=incompatible-pointer-types]
       ibireq.handler = olddev->ibi->handler;
                      ^
   drivers/i3c/master.c: In function 'i3c_master_handle_ibi':
   drivers/i3c/master.c:2522:25: error: storage size of 'payload' isn't known
     struct i3c_ibi_payload payload;
                            ^~~~~~~
   drivers/i3c/master.c:2522:25: warning: unused variable 'payload' [-Wunused-variable]
   drivers/i3c/master.c: At top level:
   drivers/i3c/master.c:2869:1: error: version control conflict marker in file
    <<<<<<< HEAD
    ^~~~~~~
   drivers/i3c/master.c: In function 'i3c_target_bus_cleanup':
   drivers/i3c/master.c:2878:12: error: 'struct i3c_master_controller' has no member named 'target_ops'
     if (master->target_ops->bus_cleanup)
               ^~
   drivers/i3c/master.c:2879:9: error: 'struct i3c_master_controller' has no member named 'target_ops'
      master->target_ops->bus_cleanup(master);
            ^~
   drivers/i3c/master.c: In function 'i3c_target_register_new_i3c_dev':
   drivers/i3c/master.c:2922:25: error: 'i3c_target_device_type' undeclared (first use in this function); did you mean 'i3c_target_device_release'?
     desc->dev->dev.type = &i3c_target_device_type;
                            ^~~~~~~~~~~~~~~~~~~~~~
                            i3c_target_device_release
   drivers/i3c/master.c:2922:25: note: each undeclared identifier is reported only once for each function it appears in
   drivers/i3c/master.c: At top level:
   drivers/i3c/master.c:2965:46: warning: 'struct i3c_target_ops' declared inside parameter list will not be visible outside of this definition or declaration
    static int i3c_target_check_ops(const struct i3c_target_ops *ops)
                                                 ^~~~~~~~~~~~~~
   drivers/i3c/master.c: In function 'i3c_target_check_ops':
   drivers/i3c/master.c:2967:18: error: dereferencing pointer to incomplete type 'const struct i3c_target_ops'
     if (!ops || !ops->bus_init)
                     ^~
   drivers/i3c/master.c: At top level:
   drivers/i3c/master.c:2974:17: warning: 'struct i3c_target_ops' declared inside parameter list will not be visible outside of this definition or declaration
       const struct i3c_target_ops *ops)
                    ^~~~~~~~~~~~~~
   drivers/i3c/master.c: In function 'i3c_target_register':
   drivers/i3c/master.c:2980:29: error: passing argument 1 of 'i3c_target_check_ops' from incompatible pointer type [-Werror=incompatible-pointer-types]
     ret = i3c_target_check_ops(ops);
                                ^~~
   drivers/i3c/master.c:2965:12: note: expected 'const struct i3c_target_ops *' but argument is of type 'const struct i3c_target_ops *'
    static int i3c_target_check_ops(const struct i3c_target_ops *ops)
               ^~~~~~~~~~~~~~~~~~~~
   drivers/i3c/master.c:2988:8: error: 'struct i3c_master_controller' has no member named 'target_ops'
     master->target_ops = ops;
           ^~
   drivers/i3c/master.c:3006:8: error: implicit declaration of function 'i3c_target_bus_init'; did you mean 'i3c_master_bus_init'? [-Werror=implicit-function-declaration]
     ret = i3c_target_bus_init(master);
           ^~~~~~~~~~~~~~~~~~~
           i3c_master_bus_init
   drivers/i3c/master.c: At top level:
   drivers/i3c/master.c:3032:67: warning: 'struct i3c_target_read_setup' declared inside parameter list will not be visible outside of this definition or declaration
    int i3c_target_read_register(struct i3c_device *dev, const struct i3c_target_read_setup *setup)
                                                                      ^~~~~~~~~~~~~~~~~~~~~
   drivers/i3c/master.c: In function 'i3c_target_read_register':
   drivers/i3c/master.c:3034:11: error: 'struct i3c_dev_desc' has no member named 'target_info'
     dev->desc->target_info.read_handler = setup->handler;
              ^~
   drivers/i3c/master.c:3034:45: error: dereferencing pointer to incomplete type 'const struct i3c_target_read_setup'
     dev->desc->target_info.read_handler = setup->handler;
                                                ^~
   drivers/i3c/master.c: At top level:
   drivers/i3c/master.c:3043:17: warning: 'struct i3c_target_ops' declared inside parameter list will not be visible outside of this definition or declaration
       const struct i3c_target_ops *target_ops,
                    ^~~~~~~~~~~~~~
   drivers/i3c/master.c: In function 'i3c_register':
   drivers/i3c/master.c:3053:9: error: 'struct i3c_master_controller' has no member named 'target'
      master->target = true;
            ^~
   drivers/i3c/master.c:3054:46: error: passing argument 3 of 'i3c_target_register' from incompatible pointer type [-Werror=incompatible-pointer-types]
      return i3c_target_register(master, parent, target_ops);
                                                 ^~~~~~~~~~
   drivers/i3c/master.c:2973:5: note: expected 'const struct i3c_target_ops *' but argument is of type 'const struct i3c_target_ops *'
    int i3c_target_register(struct i3c_master_controller *master, struct device *parent,
        ^~~~~~~~~~~~~~~~~~~
   drivers/i3c/master.c: In function 'i3c_unregister':
   drivers/i3c/master.c:3063:12: error: 'struct i3c_master_controller' has no member named 'target'
     if (master->target)
               ^~
   drivers/i3c/master.c: At top level:
   drivers/i3c/master.c:3072:1: error: version control conflict marker in file
    >>>>>>> i3c: Add BCR and DCR properties
    ^~~~~~~
   drivers/i3c/master.c: In function 'i3c_dev_getstatus_locked':
   drivers/i3c/master.c:3110:6: error: 'struct i3c_device_info' has no member named 'status'
     info->status = getsts->status;
         ^~
   drivers/i3c/master.c: In function 'i3c_dev_request_ibi_locked':
   drivers/i3c/master.c:3199:15: error: assignment from incompatible pointer type [-Werror=incompatible-pointer-types]
     ibi->handler = req->handler;
                  ^
   cc1: some warnings being treated as errors
--
   In file included from include/linux/i3c/ccc.h:12:0,
                    from include/linux/i3c/master.h:15,
                    from drivers/i3c/internals.h:11,
                    from drivers/i3c/device.c:15:
   include/linux/i3c/device.h:320:1: error: version control conflict marker in file
    <<<<<<< HEAD
    ^~~~~~~
   include/linux/i3c/device.h:322:1: error: version control conflict marker in file
    =======
    ^~~~~~~
   include/linux/i3c/device.h:328:1: error: version control conflict marker in file
    >>>>>>> i3c: master: Implement CCC GETSTATUS function
    ^~~~~~~
   include/linux/i3c/device.h:358:17: warning: 'struct i3c_ibi_payload' declared inside parameter list will not be visible outside of this definition or declaration
       const struct i3c_ibi_payload *payload);
                    ^~~~~~~~~~~~~~~
   In file included from drivers/i3c/internals.h:11:0,
                    from drivers/i3c/device.c:15:
   include/linux/i3c/master.h:162:17: warning: 'struct i3c_ibi_payload' declared inside parameter list will not be visible outside of this definition or declaration
       const struct i3c_ibi_payload *payload);
                    ^~~~~~~~~~~~~~~
>> drivers/i3c/device.c:105:6: error: conflicting types for 'i3c_device_get_info'
    void i3c_device_get_info(const struct i3c_device *dev,
         ^~~~~~~~~~~~~~~~~~~
   In file included from include/linux/i3c/ccc.h:12:0,
                    from include/linux/i3c/master.h:15,
                    from drivers/i3c/internals.h:11,
                    from drivers/i3c/device.c:15:
   include/linux/i3c/device.h:327:6: note: previous declaration of 'i3c_device_get_info' was here
    void i3c_device_get_info(struct i3c_device *dev, struct i3c_device_info *info);
         ^~~~~~~~~~~~~~~~~~~
   In file included from include/linux/linkage.h:7:0,
                    from include/linux/printk.h:8,
                    from include/asm-generic/bug.h:22,
                    from arch/x86/include/asm/bug.h:87,
                    from include/linux/bug.h:5,
                    from drivers/i3c/device.c:9:
   drivers/i3c/device.c:116:19: error: conflicting types for 'i3c_device_get_info'
    EXPORT_SYMBOL_GPL(i3c_device_get_info);
                      ^
   include/linux/export.h:56:21: note: in definition of macro '__EXPORT_SYMBOL'
     extern typeof(sym) sym;     \
                        ^~~
   include/linux/export.h:69:33: note: in expansion of macro '_EXPORT_SYMBOL'
    #define EXPORT_SYMBOL_GPL(sym)  _EXPORT_SYMBOL(sym, "GPL")
                                    ^~~~~~~~~~~~~~
   drivers/i3c/device.c:116:1: note: in expansion of macro 'EXPORT_SYMBOL_GPL'
    EXPORT_SYMBOL_GPL(i3c_device_get_info);
    ^~~~~~~~~~~~~~~~~
   In file included from include/linux/i3c/ccc.h:12:0,
                    from include/linux/i3c/master.h:15,
                    from drivers/i3c/internals.h:11,
                    from drivers/i3c/device.c:15:
   include/linux/i3c/device.h:327:6: note: previous declaration of 'i3c_device_get_info' was here
    void i3c_device_get_info(struct i3c_device *dev, struct i3c_device_info *info);
         ^~~~~~~~~~~~~~~~~~~


vim +2037 drivers/i3c/master.c

3a379bbcea0af62 Boris Brezillon    2017-07-19  1979  
3a379bbcea0af62 Boris Brezillon    2017-07-19  1980  /**
3a379bbcea0af62 Boris Brezillon    2017-07-19  1981   * i3c_master_add_i3c_dev_locked() - add an I3C slave to the bus
3a379bbcea0af62 Boris Brezillon    2017-07-19  1982   * @master: master used to send frames on the bus
3a379bbcea0af62 Boris Brezillon    2017-07-19  1983   * @addr: I3C slave dynamic address assigned to the device
3a379bbcea0af62 Boris Brezillon    2017-07-19  1984   *
3a379bbcea0af62 Boris Brezillon    2017-07-19  1985   * This function is instantiating an I3C device object and adding it to the
3a379bbcea0af62 Boris Brezillon    2017-07-19  1986   * I3C device list. All device information are automatically retrieved using
3a379bbcea0af62 Boris Brezillon    2017-07-19  1987   * standard CCC commands.
3a379bbcea0af62 Boris Brezillon    2017-07-19  1988   *
3a379bbcea0af62 Boris Brezillon    2017-07-19  1989   * The I3C device object is returned in case the master wants to attach
3a379bbcea0af62 Boris Brezillon    2017-07-19  1990   * private data to it using i3c_dev_set_master_data().
3a379bbcea0af62 Boris Brezillon    2017-07-19  1991   *
3a379bbcea0af62 Boris Brezillon    2017-07-19  1992   * This function must be called with the bus lock held in write mode.
3a379bbcea0af62 Boris Brezillon    2017-07-19  1993   *
3a379bbcea0af62 Boris Brezillon    2017-07-19  1994   * Return: a 0 in case of success, an negative error code otherwise.
3a379bbcea0af62 Boris Brezillon    2017-07-19  1995   */
3a379bbcea0af62 Boris Brezillon    2017-07-19  1996  int i3c_master_add_i3c_dev_locked(struct i3c_master_controller *master,
3a379bbcea0af62 Boris Brezillon    2017-07-19  1997  				  u8 addr)
3a379bbcea0af62 Boris Brezillon    2017-07-19  1998  {
3a379bbcea0af62 Boris Brezillon    2017-07-19  1999  	struct i3c_device_info info = { .dyn_addr = addr };
3a379bbcea0af62 Boris Brezillon    2017-07-19  2000  	struct i3c_dev_desc *newdev, *olddev;
3a379bbcea0af62 Boris Brezillon    2017-07-19  2001  	u8 old_dyn_addr = addr, expected_dyn_addr;
3a379bbcea0af62 Boris Brezillon    2017-07-19  2002  	struct i3c_ibi_setup ibireq = { };
3a379bbcea0af62 Boris Brezillon    2017-07-19  2003  	bool enable_ibi = false;
3a379bbcea0af62 Boris Brezillon    2017-07-19  2004  	int ret;
3a379bbcea0af62 Boris Brezillon    2017-07-19  2005  
3a379bbcea0af62 Boris Brezillon    2017-07-19  2006  	if (!master)
3a379bbcea0af62 Boris Brezillon    2017-07-19  2007  		return -EINVAL;
3a379bbcea0af62 Boris Brezillon    2017-07-19  2008  
3a379bbcea0af62 Boris Brezillon    2017-07-19  2009  	newdev = i3c_master_alloc_i3c_dev(master, &info);
3a379bbcea0af62 Boris Brezillon    2017-07-19  2010  	if (IS_ERR(newdev))
3a379bbcea0af62 Boris Brezillon    2017-07-19  2011  		return PTR_ERR(newdev);
3a379bbcea0af62 Boris Brezillon    2017-07-19  2012  
3a379bbcea0af62 Boris Brezillon    2017-07-19  2013  	ret = i3c_master_attach_i3c_dev(master, newdev);
840414ae59d8858 Dan Carpenter      2018-11-23  2014  	if (ret)
3a379bbcea0af62 Boris Brezillon    2017-07-19  2015  		goto err_free_dev;
3a379bbcea0af62 Boris Brezillon    2017-07-19  2016  
3a379bbcea0af62 Boris Brezillon    2017-07-19  2017  	ret = i3c_master_retrieve_dev_info(newdev);
3a379bbcea0af62 Boris Brezillon    2017-07-19  2018  	if (ret)
093c61b6a0d5768 Jisheng Zhang      2019-01-25  2019  		goto err_detach_dev;
3a379bbcea0af62 Boris Brezillon    2017-07-19  2020  
9da36a7ec421354 Parshuram Thombare 2020-05-21  2021  	i3c_master_attach_boardinfo(newdev);
9da36a7ec421354 Parshuram Thombare 2020-05-21  2022  
3a379bbcea0af62 Boris Brezillon    2017-07-19  2023  	olddev = i3c_master_search_i3c_dev_duplicate(newdev);
3a379bbcea0af62 Boris Brezillon    2017-07-19  2024  	if (olddev) {
3a379bbcea0af62 Boris Brezillon    2017-07-19  2025  		newdev->dev = olddev->dev;
3a379bbcea0af62 Boris Brezillon    2017-07-19  2026  		if (newdev->dev)
3a379bbcea0af62 Boris Brezillon    2017-07-19  2027  			newdev->dev->desc = newdev;
3a379bbcea0af62 Boris Brezillon    2017-07-19  2028  
3a379bbcea0af62 Boris Brezillon    2017-07-19  2029  		/*
3a379bbcea0af62 Boris Brezillon    2017-07-19  2030  		 * We need to restore the IBI state too, so let's save the
3a379bbcea0af62 Boris Brezillon    2017-07-19  2031  		 * IBI information and try to restore them after olddev has
3a379bbcea0af62 Boris Brezillon    2017-07-19  2032  		 * been detached+released and its IBI has been stopped and
3a379bbcea0af62 Boris Brezillon    2017-07-19  2033  		 * the associated resources have been freed.
3a379bbcea0af62 Boris Brezillon    2017-07-19  2034  		 */
3a379bbcea0af62 Boris Brezillon    2017-07-19  2035  		mutex_lock(&olddev->ibi_lock);
3a379bbcea0af62 Boris Brezillon    2017-07-19  2036  		if (olddev->ibi) {
3a379bbcea0af62 Boris Brezillon    2017-07-19 @2037  			ibireq.handler = olddev->ibi->handler;
3a379bbcea0af62 Boris Brezillon    2017-07-19  2038  			ibireq.max_payload_len = olddev->ibi->max_payload_len;
3a379bbcea0af62 Boris Brezillon    2017-07-19  2039  			ibireq.num_slots = olddev->ibi->num_slots;
3a379bbcea0af62 Boris Brezillon    2017-07-19  2040  
3a379bbcea0af62 Boris Brezillon    2017-07-19  2041  			if (olddev->ibi->enabled) {
3a379bbcea0af62 Boris Brezillon    2017-07-19  2042  				enable_ibi = true;
3a379bbcea0af62 Boris Brezillon    2017-07-19  2043  				i3c_dev_disable_ibi_locked(olddev);
3a379bbcea0af62 Boris Brezillon    2017-07-19  2044  			}
3a379bbcea0af62 Boris Brezillon    2017-07-19  2045  
3a379bbcea0af62 Boris Brezillon    2017-07-19  2046  			i3c_dev_free_ibi_locked(olddev);
3a379bbcea0af62 Boris Brezillon    2017-07-19  2047  		}
3a379bbcea0af62 Boris Brezillon    2017-07-19  2048  		mutex_unlock(&olddev->ibi_lock);
3a379bbcea0af62 Boris Brezillon    2017-07-19  2049  
3a379bbcea0af62 Boris Brezillon    2017-07-19  2050  		old_dyn_addr = olddev->info.dyn_addr;
3a379bbcea0af62 Boris Brezillon    2017-07-19  2051  
3a379bbcea0af62 Boris Brezillon    2017-07-19  2052  		i3c_master_detach_i3c_dev(olddev);
3a379bbcea0af62 Boris Brezillon    2017-07-19  2053  		i3c_master_free_i3c_dev(olddev);
3a379bbcea0af62 Boris Brezillon    2017-07-19  2054  	}
3a379bbcea0af62 Boris Brezillon    2017-07-19  2055  
3a379bbcea0af62 Boris Brezillon    2017-07-19  2056  	/*
3a379bbcea0af62 Boris Brezillon    2017-07-19  2057  	 * Depending on our previous state, the expected dynamic address might
3a379bbcea0af62 Boris Brezillon    2017-07-19  2058  	 * differ:
3a379bbcea0af62 Boris Brezillon    2017-07-19  2059  	 * - if the device already had a dynamic address assigned, let's try to
3a379bbcea0af62 Boris Brezillon    2017-07-19  2060  	 *   re-apply this one
3a379bbcea0af62 Boris Brezillon    2017-07-19  2061  	 * - if the device did not have a dynamic address and the firmware
3a379bbcea0af62 Boris Brezillon    2017-07-19  2062  	 *   requested a specific address, pick this one
3a379bbcea0af62 Boris Brezillon    2017-07-19  2063  	 * - in any other case, keep the address automatically assigned by the
3a379bbcea0af62 Boris Brezillon    2017-07-19  2064  	 *   master
3a379bbcea0af62 Boris Brezillon    2017-07-19  2065  	 */
3a379bbcea0af62 Boris Brezillon    2017-07-19  2066  	if (old_dyn_addr && old_dyn_addr != newdev->info.dyn_addr)
3a379bbcea0af62 Boris Brezillon    2017-07-19  2067  		expected_dyn_addr = old_dyn_addr;
3a379bbcea0af62 Boris Brezillon    2017-07-19  2068  	else if (newdev->boardinfo && newdev->boardinfo->init_dyn_addr)
3a379bbcea0af62 Boris Brezillon    2017-07-19  2069  		expected_dyn_addr = newdev->boardinfo->init_dyn_addr;
3a379bbcea0af62 Boris Brezillon    2017-07-19  2070  	else
3a379bbcea0af62 Boris Brezillon    2017-07-19  2071  		expected_dyn_addr = newdev->info.dyn_addr;
3a379bbcea0af62 Boris Brezillon    2017-07-19  2072  
3a379bbcea0af62 Boris Brezillon    2017-07-19  2073  	if (newdev->info.dyn_addr != expected_dyn_addr) {
3a379bbcea0af62 Boris Brezillon    2017-07-19  2074  		/*
3a379bbcea0af62 Boris Brezillon    2017-07-19  2075  		 * Try to apply the expected dynamic address. If it fails, keep
3a379bbcea0af62 Boris Brezillon    2017-07-19  2076  		 * the address assigned by the master.
3a379bbcea0af62 Boris Brezillon    2017-07-19  2077  		 */
3a379bbcea0af62 Boris Brezillon    2017-07-19  2078  		ret = i3c_master_setnewda_locked(master,
3a379bbcea0af62 Boris Brezillon    2017-07-19  2079  						 newdev->info.dyn_addr,
3a379bbcea0af62 Boris Brezillon    2017-07-19  2080  						 expected_dyn_addr);
3a379bbcea0af62 Boris Brezillon    2017-07-19  2081  		if (!ret) {
3a379bbcea0af62 Boris Brezillon    2017-07-19  2082  			old_dyn_addr = newdev->info.dyn_addr;
3a379bbcea0af62 Boris Brezillon    2017-07-19  2083  			newdev->info.dyn_addr = expected_dyn_addr;
3a379bbcea0af62 Boris Brezillon    2017-07-19  2084  			i3c_master_reattach_i3c_dev(newdev, old_dyn_addr);
3a379bbcea0af62 Boris Brezillon    2017-07-19  2085  		} else {
3a379bbcea0af62 Boris Brezillon    2017-07-19  2086  			dev_err(&master->dev,
3a379bbcea0af62 Boris Brezillon    2017-07-19  2087  				"Failed to assign reserved/old address to device %d%llx",
3a379bbcea0af62 Boris Brezillon    2017-07-19  2088  				master->bus.id, newdev->info.pid);
3a379bbcea0af62 Boris Brezillon    2017-07-19  2089  		}
3a379bbcea0af62 Boris Brezillon    2017-07-19  2090  	}
3a379bbcea0af62 Boris Brezillon    2017-07-19  2091  
3a379bbcea0af62 Boris Brezillon    2017-07-19  2092  	/*
3a379bbcea0af62 Boris Brezillon    2017-07-19  2093  	 * Now is time to try to restore the IBI setup. If we're lucky,
3a379bbcea0af62 Boris Brezillon    2017-07-19  2094  	 * everything works as before, otherwise, all we can do is complain.
3a379bbcea0af62 Boris Brezillon    2017-07-19  2095  	 * FIXME: maybe we should add callback to inform the driver that it
3a379bbcea0af62 Boris Brezillon    2017-07-19  2096  	 * should request the IBI again instead of trying to hide that from
3a379bbcea0af62 Boris Brezillon    2017-07-19  2097  	 * him.
3a379bbcea0af62 Boris Brezillon    2017-07-19  2098  	 */
3a379bbcea0af62 Boris Brezillon    2017-07-19  2099  	if (ibireq.handler) {
3a379bbcea0af62 Boris Brezillon    2017-07-19  2100  		mutex_lock(&newdev->ibi_lock);
3a379bbcea0af62 Boris Brezillon    2017-07-19  2101  		ret = i3c_dev_request_ibi_locked(newdev, &ibireq);
3a379bbcea0af62 Boris Brezillon    2017-07-19  2102  		if (ret) {
3a379bbcea0af62 Boris Brezillon    2017-07-19  2103  			dev_err(&master->dev,
3a379bbcea0af62 Boris Brezillon    2017-07-19  2104  				"Failed to request IBI on device %d-%llx",
3a379bbcea0af62 Boris Brezillon    2017-07-19  2105  				master->bus.id, newdev->info.pid);
3a379bbcea0af62 Boris Brezillon    2017-07-19  2106  		} else if (enable_ibi) {
3a379bbcea0af62 Boris Brezillon    2017-07-19  2107  			ret = i3c_dev_enable_ibi_locked(newdev);
3a379bbcea0af62 Boris Brezillon    2017-07-19  2108  			if (ret)
3a379bbcea0af62 Boris Brezillon    2017-07-19  2109  				dev_err(&master->dev,
3a379bbcea0af62 Boris Brezillon    2017-07-19  2110  					"Failed to re-enable IBI on device %d-%llx",
3a379bbcea0af62 Boris Brezillon    2017-07-19  2111  					master->bus.id, newdev->info.pid);
3a379bbcea0af62 Boris Brezillon    2017-07-19  2112  		}
3a379bbcea0af62 Boris Brezillon    2017-07-19  2113  		mutex_unlock(&newdev->ibi_lock);
3a379bbcea0af62 Boris Brezillon    2017-07-19  2114  	}
3a379bbcea0af62 Boris Brezillon    2017-07-19  2115  
3a379bbcea0af62 Boris Brezillon    2017-07-19  2116  	return 0;
3a379bbcea0af62 Boris Brezillon    2017-07-19  2117  
3a379bbcea0af62 Boris Brezillon    2017-07-19  2118  err_detach_dev:
3a379bbcea0af62 Boris Brezillon    2017-07-19  2119  	if (newdev->dev && newdev->dev->desc)
3a379bbcea0af62 Boris Brezillon    2017-07-19  2120  		newdev->dev->desc = NULL;
3a379bbcea0af62 Boris Brezillon    2017-07-19  2121  
3a379bbcea0af62 Boris Brezillon    2017-07-19  2122  	i3c_master_detach_i3c_dev(newdev);
3a379bbcea0af62 Boris Brezillon    2017-07-19  2123  
3a379bbcea0af62 Boris Brezillon    2017-07-19  2124  err_free_dev:
3a379bbcea0af62 Boris Brezillon    2017-07-19  2125  	i3c_master_free_i3c_dev(newdev);
3a379bbcea0af62 Boris Brezillon    2017-07-19  2126  
3a379bbcea0af62 Boris Brezillon    2017-07-19  2127  	return ret;
3a379bbcea0af62 Boris Brezillon    2017-07-19  2128  }
3a379bbcea0af62 Boris Brezillon    2017-07-19  2129  EXPORT_SYMBOL_GPL(i3c_master_add_i3c_dev_locked);
3a379bbcea0af62 Boris Brezillon    2017-07-19  2130  

:::::: The code at line 2037 was first introduced by commit
:::::: 3a379bbcea0af6280e1ca0d1edfcf4e68cde6ee0 i3c: Add core I3C infrastructure

:::::: TO: Boris Brezillon <boris.brezillon@bootlin.com>
:::::: CC: Boris Brezillon <boris.brezillon@bootlin.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
