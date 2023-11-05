Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AA0717E9
	for <oe-kbuild-all@lists.linux.dev>; Sun,  5 Nov 2023 13:53:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HbPNYHLT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699192383; x=1730728383;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=8uQSKG1UfcxNoaOYwIEc4gXgEsj27aowOZb8iAMvg34=;
  b=HbPNYHLT9a1ypLGQoXZRwbUEr0G6Wh87/il1To7FGQuRVSAT4azGtf1E
   OqrOSsZClik9Qu2k7+IKN2NJJ0HxHf4KmCTnzaeviu+aKETDxr5y486TA
   WJe3E9H2wKdWAQKoKYy/HTGZxv+5heOlpthq0q1A9HCIBYnMHFX3fZgwh
   Q8v19XVTotLoBtRZzlZlTurIXXjXojpWfOkvmG0Q0MJMYqSPWKP3hIn1n
   y4wmYU0rsxX0Eeb+hsABqOcbe99Pwla4hRHnRpwt1x1yJ+teg3vdTXuYc
   7RJKPXlpvjnvjWL8UPV7zYG0GLnHlFx8a2alNMxI732hqym2voVHrHAta
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10885"; a="10688663"
X-IronPort-AV: E=Sophos;i="6.03,279,1694761200"; 
   d="scan'208";a="10688663"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2023 05:53:01 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10885"; a="852732308"
X-IronPort-AV: E=Sophos;i="6.03,279,1694761200"; 
   d="scan'208";a="852732308"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 05 Nov 2023 05:53:00 -0800
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qzdYg-0005V5-2a;
	Sun, 05 Nov 2023 13:52:58 +0000
Date: Sun, 5 Nov 2023 21:52:35 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:6.1.x+fslc 4/12]
 drivers/misc/uboot_bootcount.c:70:50: error: incompatible function pointer
 types initializing 'ssize_t (*)(struct device *, struct device_attribute *,
 char *)' (aka 'long (*)(struct device *, struct device_attribute *, char
 *)') with an expression of type...
Message-ID: <202311052139.6xkr1qRZ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Freescale/linux-fslc 6.1.x+fslc
head:   31f80d4a6ba84fe19f7f7c7561798958505fd459
commit: 72237a237e1ae7772ebcef9d5878959a2583e6d7 [4/12] drivers, misc: add U-Boot bootcount driver
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20231105/202311052139.6xkr1qRZ-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231105/202311052139.6xkr1qRZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311052139.6xkr1qRZ-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/misc/uboot_bootcount.c:70:50: error: incompatible function pointer types initializing 'ssize_t (*)(struct device *, struct device_attribute *, char *)' (aka 'long (*)(struct device *, struct device_attribute *, char *)') with an expression of type 'int (struct device *, struct device_attribute *, char *)' [-Wincompatible-function-pointer-types]
   static DEVICE_ATTR(bootcount, S_IWUSR | S_IRUGO, show_str_bootcount,
                                                    ^~~~~~~~~~~~~~~~~~
   include/linux/device.h:127:66: note: expanded from macro 'DEVICE_ATTR'
           struct device_attribute dev_attr_##_name = __ATTR(_name, _mode, _show, _store)
                                                                           ^~~~~
   include/linux/sysfs.h:104:10: note: expanded from macro '__ATTR'
           .show   = _show,                                                \
                     ^~~~~
>> drivers/misc/uboot_bootcount.c:71:3: error: incompatible function pointer types initializing 'ssize_t (*)(struct device *, struct device_attribute *, const char *, size_t)' (aka 'long (*)(struct device *, struct device_attribute *, const char *, unsigned long)') with an expression of type 'int (struct device *, struct device_attribute *, const char *, size_t)' (aka 'int (struct device *, struct device_attribute *, const char *, unsigned long)') [-Wincompatible-function-pointer-types]
                   store_str_bootcount);
                   ^~~~~~~~~~~~~~~~~~~
   include/linux/device.h:127:73: note: expanded from macro 'DEVICE_ATTR'
           struct device_attribute dev_attr_##_name = __ATTR(_name, _mode, _show, _store)
                                                                                  ^~~~~~
   include/linux/sysfs.h:105:11: note: expanded from macro '__ATTR'
           .store  = _store,                                               \
                     ^~~~~~
   2 errors generated.


vim +70 drivers/misc/uboot_bootcount.c

    69	
  > 70	static DEVICE_ATTR(bootcount, S_IWUSR | S_IRUGO, show_str_bootcount,
  > 71			store_str_bootcount);
    72	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
