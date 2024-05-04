Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 987E6537FF
	for <oe-kbuild-all@lists.linux.dev>; Sat,  4 May 2024 18:11:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714846306; cv=none; b=WvMt6ldbtSDlRg50iO4J2ceOBhyBpY78xgeHcecP3DaDlJqTyHhB7eUATI9r8RwpjsEVIzCVUpYqvQx0/zhCwAlOp4Nc/WLcZUCY9djipPFSco3uwpwWTsTe69hTNUtLV+LmBGXIj+bSs/FN47w76VKKqN5qrB+nmnXnYxyLGuM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714846306; c=relaxed/simple;
	bh=P9mrq9KfI9K1Z+8sKCiLdM8zwfguX2v7iK+2cl/hqIY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=TspJpj2oadOpS8E388CUrcJT4R6L4vGoGl0QZa0UJJFLkm7kJPQvjjmjgaNm1Rv/sChOoke8PImrw1rwirwzcNEUeQ0L5rL2jCNm0HWj6E1GhYj1PQcID+C8jX7tYdvXCeWYW10+c/lQcqfh88yHJML4K+35YUYVwFy5KCcZVuo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=We179m55; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="We179m55"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714846305; x=1746382305;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=P9mrq9KfI9K1Z+8sKCiLdM8zwfguX2v7iK+2cl/hqIY=;
  b=We179m55LiCpDQxNLcGmnWVKjp8vohLM4Ey1LtEwaHS1YcaD2vA4tgJJ
   WjBgSVH7ABLdG/uOLKgkOXZsiWn+i4Hdqzobfl2BQKPdOb6C9b/QlTTwb
   oUOqS46DxGfEO43l+AIpp5W6eJ8RRhujt2YEmcBlIjcdx3lEnhDXgZ0Vh
   fAM7c2Zn04oYrVqgYbBp+vJCiKnU/EzNbg+n0QquZzTW7p0dQ3MFtVigF
   cQlzh7AEY8BXVGDNkDEwYLQYRLLNMCllwcmAgRnALHJ3+zlYuCOidUpSe
   d5YYNzT4zsoQqUjXS8kpLcJuZzbPe0AG5gt7/vjkCF6Hphy55XX4zE/C/
   Q==;
X-CSE-ConnectionGUID: KZXXoP35SV2sPZ5fLxK7kQ==
X-CSE-MsgGUID: KRnEo7ymR3qzxJeIhnKe+A==
X-IronPort-AV: E=McAfee;i="6600,9927,11063"; a="21251087"
X-IronPort-AV: E=Sophos;i="6.07,254,1708416000"; 
   d="scan'208";a="21251087"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 May 2024 11:11:44 -0700
X-CSE-ConnectionGUID: J2WgEO11R/uAswvEOUspeg==
X-CSE-MsgGUID: wKjeRBNkQZ+K/Ky/NC3qCg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,254,1708416000"; 
   d="scan'208";a="32563474"
Received: from lkp-server01.sh.intel.com (HELO e434dd42e5a1) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 04 May 2024 11:11:42 -0700
Received: from kbuild by e434dd42e5a1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s3JrI-000D3E-0y;
	Sat, 04 May 2024 18:11:40 +0000
Date: Sun, 5 May 2024 02:11:29 +0800
From: kernel test robot <lkp@intel.com>
To: Joel Stanley <joel@jms.id.au>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [shenki:aspeed-6.9-rebase 956/1143] drivers/i3c/master.c:2538:9:
 error: request for member 'data' in something not a structure or union
Message-ID: <202405050255.HxHm6oV1-lkp@intel.com>
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
commit: 90ce6cade71976498829f125d82db62bd3509f3d [956/1143] i3c: master: add enable(disable) hot join in sys entry
config: i386-randconfig-004-20240503 (https://download.01.org/0day-ci/archive/20240505/202405050255.HxHm6oV1-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240505/202405050255.HxHm6oV1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405050255.HxHm6oV1-lkp@intel.com/

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
   drivers/i3c/master.c: At top level:
   drivers/i3c/master.c:654:3: error: 'dev_attr_bus_context' undeclared here (not in a function); did you mean 'dev_attr_mode'?
     &dev_attr_bus_context.attr,
      ^~~~~~~~~~~~~~~~~~~~
      dev_attr_mode
   drivers/i3c/master.c: In function 'i3c_master_retrieve_dev_info':
   drivers/i3c/master.c:1403:3: error: implicit declaration of function 'i3c_master_setmrl_locked'; did you mean 'i3c_master_getmrl_locked'? [-Werror=implicit-function-declaration]
      i3c_master_setmrl_locked(master, &dev->info, 128, 128);
      ^~~~~~~~~~~~~~~~~~~~~~~~
      i3c_master_getmrl_locked
   drivers/i3c/master.c:1404:3: error: implicit declaration of function 'i3c_master_setmwl_locked'; did you mean 'i3c_master_getmwl_locked'? [-Werror=implicit-function-declaration]
      i3c_master_setmwl_locked(master, &dev->info, 128);
      ^~~~~~~~~~~~~~~~~~~~~~~~
      i3c_master_getmwl_locked
   drivers/i3c/master.c: In function 'i3c_master_add_i3c_dev_locked':
   drivers/i3c/master.c:2051:19: error: assignment from incompatible pointer type [-Werror=incompatible-pointer-types]
       ibireq.handler = olddev->ibi->handler;
                      ^
   drivers/i3c/master.c: In function 'i3c_master_handle_ibi':
   drivers/i3c/master.c:2536:25: error: storage size of 'payload' isn't known
     struct i3c_ibi_payload payload;
                            ^~~~~~~
>> drivers/i3c/master.c:2538:9: error: request for member 'data' in something not a structure or union
     payload.data = slot->data;
            ^
   drivers/i3c/master.c:2538:2: warning: statement with no effect [-Wunused-value]
     payload.data = slot->data;
     ^~~~~~~
>> drivers/i3c/master.c:2539:9: error: request for member 'len' in something not a structure or union
     payload.len = slot->len;
            ^
   drivers/i3c/master.c:2539:2: warning: statement with no effect [-Wunused-value]
     payload.len = slot->len;
     ^~~~~~~
>> drivers/i3c/master.c:2542:31: error: passing argument 2 of 'dev->ibi->handler' from incompatible pointer type [-Werror=incompatible-pointer-types]
      dev->ibi->handler(dev->dev, &payload);
                                  ^
   drivers/i3c/master.c:2542:31: note: expected 'const struct i3c_ibi_payload *' but argument is of type 'struct attribute * (*)[1]'
   drivers/i3c/master.c:2536:25: warning: unused variable 'payload' [-Wunused-variable]
     struct i3c_ibi_payload payload;
                            ^~~~~~~
   drivers/i3c/master.c: At top level:
   drivers/i3c/master.c:2883:1: error: version control conflict marker in file
    <<<<<<< HEAD
    ^~~~~~~
   drivers/i3c/master.c: In function 'i3c_target_bus_cleanup':
   drivers/i3c/master.c:2892:12: error: 'struct i3c_master_controller' has no member named 'target_ops'
     if (master->target_ops->bus_cleanup)
               ^~
>> drivers/i3c/master.c:2892:24: error: '*(struct attribute **)&<erroneous-expression>' is a pointer; did you mean to use '->'?
     if (master->target_ops->bus_cleanup)
                           ^~
                           ->
   drivers/i3c/master.c:2893:9: error: 'struct i3c_master_controller' has no member named 'target_ops'
      master->target_ops->bus_cleanup(master);
            ^~
   drivers/i3c/master.c:2893:21: error: '*(struct attribute **)&<erroneous-expression>' is a pointer; did you mean to use '->'?
      master->target_ops->bus_cleanup(master);
                        ^~
                        ->
>> drivers/i3c/master.c:2893:3: error: called object is not a function or function pointer
      master->target_ops->bus_cleanup(master);
      ^~~~~~
   drivers/i3c/master.c:2893:3: warning: statement with no effect [-Wunused-value]
   drivers/i3c/master.c: In function 'i3c_target_register_new_i3c_dev':
   drivers/i3c/master.c:2936:25: error: 'i3c_target_device_type' undeclared (first use in this function); did you mean 'i3c_target_device_release'?
     desc->dev->dev.type = &i3c_target_device_type;
                            ^~~~~~~~~~~~~~~~~~~~~~
                            i3c_target_device_release
   drivers/i3c/master.c:2936:25: note: each undeclared identifier is reported only once for each function it appears in
   drivers/i3c/master.c:2936:22: error: assignment from incompatible pointer type [-Werror=incompatible-pointer-types]
     desc->dev->dev.type = &i3c_target_device_type;
                         ^
   drivers/i3c/master.c: At top level:
   drivers/i3c/master.c:2979:46: warning: 'struct i3c_target_ops' declared inside parameter list will not be visible outside of this definition or declaration
    static int i3c_target_check_ops(const struct i3c_target_ops *ops)
                                                 ^~~~~~~~~~~~~~
   drivers/i3c/master.c: In function 'i3c_target_check_ops':
   drivers/i3c/master.c:2981:18: error: dereferencing pointer to incomplete type 'const struct i3c_target_ops'
     if (!ops || !ops->bus_init)
                     ^~
>> drivers/i3c/master.c:2981:18: error: request for member 'bus_init' in something not a structure or union
   drivers/i3c/master.c: At top level:
   drivers/i3c/master.c:2988:17: warning: 'struct i3c_target_ops' declared inside parameter list will not be visible outside of this definition or declaration
       const struct i3c_target_ops *ops)
                    ^~~~~~~~~~~~~~
   drivers/i3c/master.c: In function 'i3c_target_register':
   drivers/i3c/master.c:2994:29: error: passing argument 1 of 'i3c_target_check_ops' from incompatible pointer type [-Werror=incompatible-pointer-types]
     ret = i3c_target_check_ops(ops);
                                ^~~
   drivers/i3c/master.c:2979:12: note: expected 'const struct i3c_target_ops *' but argument is of type 'const struct i3c_target_ops *'
    static int i3c_target_check_ops(const struct i3c_target_ops *ops)
               ^~~~~~~~~~~~~~~~~~~~
   drivers/i3c/master.c:3002:8: error: 'struct i3c_master_controller' has no member named 'target_ops'
     master->target_ops = ops;
           ^~
   drivers/i3c/master.c:3002:2: warning: statement with no effect [-Wunused-value]
     master->target_ops = ops;
     ^~~~~~
   drivers/i3c/master.c:3020:8: error: implicit declaration of function 'i3c_target_bus_init'; did you mean 'i3c_master_bus_init'? [-Werror=implicit-function-declaration]
     ret = i3c_target_bus_init(master);
           ^~~~~~~~~~~~~~~~~~~
           i3c_master_bus_init
   drivers/i3c/master.c: At top level:
   drivers/i3c/master.c:3046:67: warning: 'struct i3c_target_read_setup' declared inside parameter list will not be visible outside of this definition or declaration
    int i3c_target_read_register(struct i3c_device *dev, const struct i3c_target_read_setup *setup)
                                                                      ^~~~~~~~~~~~~~~~~~~~~
   drivers/i3c/master.c: In function 'i3c_target_read_register':
   drivers/i3c/master.c:3048:11: error: 'struct i3c_dev_desc' has no member named 'target_info'
     dev->desc->target_info.read_handler = setup->handler;
              ^~
>> drivers/i3c/master.c:3048:24: error: request for member 'read_handler' in something not a structure or union
     dev->desc->target_info.read_handler = setup->handler;
                           ^
   drivers/i3c/master.c:3048:45: error: dereferencing pointer to incomplete type 'const struct i3c_target_read_setup'
     dev->desc->target_info.read_handler = setup->handler;
                                                ^~
>> drivers/i3c/master.c:3048:45: error: request for member 'handler' in something not a structure or union
   drivers/i3c/master.c:3048:2: warning: statement with no effect [-Wunused-value]
     dev->desc->target_info.read_handler = setup->handler;
     ^~~
   drivers/i3c/master.c: At top level:
   drivers/i3c/master.c:3057:17: warning: 'struct i3c_target_ops' declared inside parameter list will not be visible outside of this definition or declaration
       const struct i3c_target_ops *target_ops,
                    ^~~~~~~~~~~~~~
   drivers/i3c/master.c: In function 'i3c_register':
   drivers/i3c/master.c:3067:9: error: 'struct i3c_master_controller' has no member named 'target'
      master->target = true;
            ^~
   drivers/i3c/master.c:3067:3: warning: statement with no effect [-Wunused-value]
      master->target = true;
      ^~~~~~
   drivers/i3c/master.c:3068:46: error: passing argument 3 of 'i3c_target_register' from incompatible pointer type [-Werror=incompatible-pointer-types]
      return i3c_target_register(master, parent, target_ops);
                                                 ^~~~~~~~~~
   drivers/i3c/master.c:2987:5: note: expected 'const struct i3c_target_ops *' but argument is of type 'const struct i3c_target_ops *'
    int i3c_target_register(struct i3c_master_controller *master, struct device *parent,
        ^~~~~~~~~~~~~~~~~~~
   drivers/i3c/master.c: In function 'i3c_unregister':
   drivers/i3c/master.c:3077:12: error: 'struct i3c_master_controller' has no member named 'target'
     if (master->target)
               ^~
   drivers/i3c/master.c: At top level:
   drivers/i3c/master.c:3086:1: error: version control conflict marker in file
    >>>>>>> i3c: Add BCR and DCR properties
    ^~~~~~~
   drivers/i3c/master.c: In function 'i3c_dev_getstatus_locked':
   drivers/i3c/master.c:3124:6: error: 'struct i3c_device_info' has no member named 'status'
     info->status = getsts->status;
         ^~
   drivers/i3c/master.c:3124:2: warning: statement with no effect [-Wunused-value]
     info->status = getsts->status;
     ^~~~
   drivers/i3c/master.c: In function 'i3c_dev_request_ibi_locked':
   drivers/i3c/master.c:3213:15: error: assignment from incompatible pointer type [-Werror=incompatible-pointer-types]
     ibi->handler = req->handler;
                  ^
   cc1: some warnings being treated as errors


vim +/data +2538 drivers/i3c/master.c

3a379bbcea0af6 Boris Brezillon 2017-07-19  2529  
3a379bbcea0af6 Boris Brezillon 2017-07-19  2530  static void i3c_master_handle_ibi(struct work_struct *work)
3a379bbcea0af6 Boris Brezillon 2017-07-19  2531  {
3a379bbcea0af6 Boris Brezillon 2017-07-19  2532  	struct i3c_ibi_slot *slot = container_of(work, struct i3c_ibi_slot,
3a379bbcea0af6 Boris Brezillon 2017-07-19  2533  						 work);
3a379bbcea0af6 Boris Brezillon 2017-07-19  2534  	struct i3c_dev_desc *dev = slot->dev;
3a379bbcea0af6 Boris Brezillon 2017-07-19  2535  	struct i3c_master_controller *master = i3c_dev_get_master(dev);
3a379bbcea0af6 Boris Brezillon 2017-07-19  2536  	struct i3c_ibi_payload payload;
3a379bbcea0af6 Boris Brezillon 2017-07-19  2537  
3a379bbcea0af6 Boris Brezillon 2017-07-19 @2538  	payload.data = slot->data;
3a379bbcea0af6 Boris Brezillon 2017-07-19 @2539  	payload.len = slot->len;
3a379bbcea0af6 Boris Brezillon 2017-07-19  2540  
3a379bbcea0af6 Boris Brezillon 2017-07-19  2541  	if (dev->dev)
3a379bbcea0af6 Boris Brezillon 2017-07-19 @2542  		dev->ibi->handler(dev->dev, &payload);
3a379bbcea0af6 Boris Brezillon 2017-07-19  2543  
3a379bbcea0af6 Boris Brezillon 2017-07-19  2544  	master->ops->recycle_ibi_slot(dev, slot);
3a379bbcea0af6 Boris Brezillon 2017-07-19  2545  	if (atomic_dec_and_test(&dev->ibi->pending_ibis))
3a379bbcea0af6 Boris Brezillon 2017-07-19  2546  		complete(&dev->ibi->all_ibis_handled);
3a379bbcea0af6 Boris Brezillon 2017-07-19  2547  }
3a379bbcea0af6 Boris Brezillon 2017-07-19  2548  

:::::: The code at line 2538 was first introduced by commit
:::::: 3a379bbcea0af6280e1ca0d1edfcf4e68cde6ee0 i3c: Add core I3C infrastructure

:::::: TO: Boris Brezillon <boris.brezillon@bootlin.com>
:::::: CC: Boris Brezillon <boris.brezillon@bootlin.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
