Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94A971494D9
	for <oe-kbuild-all@lists.linux.dev>; Thu,  5 Sep 2024 19:27:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725564467; cv=none; b=Btd1FZkqdG8VnJ6AqCQQNwsevqpPuZAQD5BbukK9azpo4RJLfkJIHoiPubp/Fod9ZsnhXQIctH0vjuctHMhWMdJ2tgFac+BnAnrgPg5IMGIRTDxkql5bAbmzNg3toEBkbVPGv6itExvDzC36UOUgI1cpNs+fjXOLI5jScZN4I4Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725564467; c=relaxed/simple;
	bh=2CLigFi3g4XI7KQdo5zTEtylAzd+1MkZJb90m1ODMbc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=n2GM2mQNRdPMN0LKgWmPo3Ma1Oj6Vr9D9ywNGz3pbmVnmFwrL/ykX/mGPVRMcrYrlKtdv7rDt7XJMRYLMLecegCxEuQv2c9LoqsYrKejc6UDTr+nSDuUNRf5P7s0fiL3Q9riH85uu5Wr+4h/7yVUg7ATX2Lz5o8SQkwraMYOQ98=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=k7xgASrG; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="k7xgASrG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725564466; x=1757100466;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=2CLigFi3g4XI7KQdo5zTEtylAzd+1MkZJb90m1ODMbc=;
  b=k7xgASrGHDsNZE2xlJwvJAMQc2QuXQPx1TgdVCSSEgJDen//cvhzOVHN
   VQgxAYgg2/8fXSCGrnS7RFPBVtWtkBMRVZmle2/Lv+pm71ycayD8VIefq
   fwtQ1sSNnlXt9CG0ZwpLYESyX7oZ1zDIOSWs1gGABLVOdp1+tS1Bwxz39
   f6HonKowRGMPC24N1Prso5FUcgxSYyXAuMI+8b1xYkhPMenensXG9uJi1
   6ANKuXX5i2kkb4pzTcn3F8hnpUW2+ImFiTcvbgojDYVV0LjO8ZZ4zMfHL
   FiBVbGocmsMn7NMCltzc17IjOeNHlFtB7vY75VGnSbQZVBiRa77H+e7pO
   Q==;
X-CSE-ConnectionGUID: Tj2yH/VDREqbHTVR3K5vBQ==
X-CSE-MsgGUID: MM4761sERtO7SFIgrHPJIg==
X-IronPort-AV: E=McAfee;i="6700,10204,11186"; a="27229854"
X-IronPort-AV: E=Sophos;i="6.10,205,1719903600"; 
   d="scan'208";a="27229854"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Sep 2024 12:27:45 -0700
X-CSE-ConnectionGUID: Cwy0Wh7zSxaBwLBhJTGCZg==
X-CSE-MsgGUID: AMoEBi2gQ2quBQCoC+M/+Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,205,1719903600"; 
   d="scan'208";a="65730469"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 05 Sep 2024 12:27:44 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1smI8p-000AFi-1s;
	Thu, 05 Sep 2024 19:27:39 +0000
Date: Fri, 6 Sep 2024 03:27:13 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:6.6.x+fslc 4/8155]
 drivers/misc/uboot_bootcount.c:70:50: error: initialization of 'ssize_t
 (*)(struct device *, struct device_attribute *, char *)' {aka 'long int
 (*)(struct device *, struct device_attribute *, char *)'} from incompatible
 pointer type 'int (*)(struct device...
Message-ID: <202409060338.8WKA7oVV-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Freescale/linux-fslc 6.6.x+fslc
head:   602cccacdc27b9bd403a8173fc09420c173f9125
commit: 921cd57b50e849ea6ab78043559447f6521c7aad [4/8155] drivers, misc: add U-Boot bootcount driver
config: loongarch-allmodconfig (https://download.01.org/0day-ci/archive/20240906/202409060338.8WKA7oVV-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240906/202409060338.8WKA7oVV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409060338.8WKA7oVV-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/kobject.h:20,
                    from include/linux/energy_model.h:7,
                    from include/linux/device.h:16,
                    from include/linux/miscdevice.h:7,
                    from drivers/misc/uboot_bootcount.c:17:
>> drivers/misc/uboot_bootcount.c:70:50: error: initialization of 'ssize_t (*)(struct device *, struct device_attribute *, char *)' {aka 'long int (*)(struct device *, struct device_attribute *, char *)'} from incompatible pointer type 'int (*)(struct device *, struct device_attribute *, char *)' [-Wincompatible-pointer-types]
      70 | static DEVICE_ATTR(bootcount, S_IWUSR | S_IRUGO, show_str_bootcount,
         |                                                  ^~~~~~~~~~~~~~~~~~
   include/linux/sysfs.h:104:19: note: in definition of macro '__ATTR'
     104 |         .show   = _show,                                                \
         |                   ^~~~~
   drivers/misc/uboot_bootcount.c:70:8: note: in expansion of macro 'DEVICE_ATTR'
      70 | static DEVICE_ATTR(bootcount, S_IWUSR | S_IRUGO, show_str_bootcount,
         |        ^~~~~~~~~~~
   drivers/misc/uboot_bootcount.c:70:50: note: (near initialization for 'dev_attr_bootcount.show')
      70 | static DEVICE_ATTR(bootcount, S_IWUSR | S_IRUGO, show_str_bootcount,
         |                                                  ^~~~~~~~~~~~~~~~~~
   include/linux/sysfs.h:104:19: note: in definition of macro '__ATTR'
     104 |         .show   = _show,                                                \
         |                   ^~~~~
   drivers/misc/uboot_bootcount.c:70:8: note: in expansion of macro 'DEVICE_ATTR'
      70 | static DEVICE_ATTR(bootcount, S_IWUSR | S_IRUGO, show_str_bootcount,
         |        ^~~~~~~~~~~
>> drivers/misc/uboot_bootcount.c:71:17: error: initialization of 'ssize_t (*)(struct device *, struct device_attribute *, const char *, size_t)' {aka 'long int (*)(struct device *, struct device_attribute *, const char *, long unsigned int)'} from incompatible pointer type 'int (*)(struct device *, struct device_attribute *, const char *, size_t)' {aka 'int (*)(struct device *, struct device_attribute *, const char *, long unsigned int)'} [-Wincompatible-pointer-types]
      71 |                 store_str_bootcount);
         |                 ^~~~~~~~~~~~~~~~~~~
   include/linux/sysfs.h:105:19: note: in definition of macro '__ATTR'
     105 |         .store  = _store,                                               \
         |                   ^~~~~~
   drivers/misc/uboot_bootcount.c:70:8: note: in expansion of macro 'DEVICE_ATTR'
      70 | static DEVICE_ATTR(bootcount, S_IWUSR | S_IRUGO, show_str_bootcount,
         |        ^~~~~~~~~~~
   drivers/misc/uboot_bootcount.c:71:17: note: (near initialization for 'dev_attr_bootcount.store')
      71 |                 store_str_bootcount);
         |                 ^~~~~~~~~~~~~~~~~~~
   include/linux/sysfs.h:105:19: note: in definition of macro '__ATTR'
     105 |         .store  = _store,                                               \
         |                   ^~~~~~
   drivers/misc/uboot_bootcount.c:70:8: note: in expansion of macro 'DEVICE_ATTR'
      70 | static DEVICE_ATTR(bootcount, S_IWUSR | S_IRUGO, show_str_bootcount,
         |        ^~~~~~~~~~~


vim +70 drivers/misc/uboot_bootcount.c

    69	
  > 70	static DEVICE_ATTR(bootcount, S_IWUSR | S_IRUGO, show_str_bootcount,
  > 71			store_str_bootcount);
    72	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
