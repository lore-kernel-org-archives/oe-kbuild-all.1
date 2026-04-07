Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAC2833688C
	for <oe-kbuild-all@lists.linux.dev>; Tue,  7 Apr 2026 03:51:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775533884; cv=none; b=PDsVe+LuMEygNSaNmf7pvgNatLgyHNa07jzCFAOj2oIRj9wzHc3pTvNoYfJFgEP+R2Wq0iOAS196G6Offt1H0yn2vvPJdlYmM9EkSXoqqbdJeLpyMny56Wv4RqJ7/aX+4OiQGoTzJu6B1JTWLslSn+DggEn5YLkj9QhviHpjT/g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775533884; c=relaxed/simple;
	bh=IXhAvt24Au6MviouhUCkYtLqlNWJXOhRwBRD/ekGIz8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=f+Fcgm0nPZ2Nlra8/tOig1BsTN7lTKdBevY7+f1xlL4RdpBMjU60zCdI1WwCaaLkN37zCSo/2Xay6aOUkJbuq3rhY1gx4Wj+DAE8o27zzzdE++03na5Ol+GVkdDPbxiZitjarOQa7uRwcxAprLHWpNV/oyeBTQK/Fz5wCirG0Hg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=W5qTExRe; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="W5qTExRe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775533883; x=1807069883;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=IXhAvt24Au6MviouhUCkYtLqlNWJXOhRwBRD/ekGIz8=;
  b=W5qTExReBXzaJ/a48xqnxz8sS2Kx4ziBQTejbx/JwUwggRJJYouUqdHw
   8FZ+OJSFupSV58EPn/A9DcGCOLCJEUIVLRogIvVrB2/MJpF+xhulENpnR
   4/f+g2De6N94fm0PyuuAis1hOaE2PAv/oxe9Z3YJbsC8ZB2PUjaFNgxMK
   KLYI+ek36FAkBWRzYj6MpHOvFukrNhwR9r6sypujUxL2Oh1knNiIznicR
   tsTV1ivo4pJWXFGMYmEbbT/4PDEGfxZ42KuAUwBN4Aw9e5cn+aVYXlJks
   TbmVFvFLgelK78bc8YTX9tQ0gxubhsXLuXjsMz/7CQN15V9fsKvLzunRq
   w==;
X-CSE-ConnectionGUID: SKhPs0DsQgiWmV3EpbxP1g==
X-CSE-MsgGUID: m7YKMCW2ReiVzlzFYL1KHg==
X-IronPort-AV: E=McAfee;i="6800,10657,11751"; a="76203944"
X-IronPort-AV: E=Sophos;i="6.23,164,1770624000"; 
   d="scan'208";a="76203944"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Apr 2026 20:51:23 -0700
X-CSE-ConnectionGUID: iEQOBKq2SymuHQ5B8dz4eQ==
X-CSE-MsgGUID: qybWo6pwQ8+5hk0pJEZesQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,164,1770624000"; 
   d="scan'208";a="251332686"
Received: from lkp-server01.sh.intel.com (HELO d00eb8a6782a) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 06 Apr 2026 20:51:21 -0700
Received: from kbuild by d00eb8a6782a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w9xTC-0000000002H-2IQ8;
	Tue, 07 Apr 2026 03:51:18 +0000
Date: Tue, 07 Apr 2026 11:50:18 +0800
From: kernel test robot <lkp@intel.com>
To: "Thomas =?utf-8?Q?Wei=C3=9Fschuh"?= <linux@weissschuh.net>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [thomas-weissschuh:b4/b4-sysfs-const-attr-device_attr 15/21]
 arch/powerpc/perf/hv-24x7.c:464:25: error: assignment to 'ssize_t (*)(struct
 device *, struct device_attribute *, char *)' {aka 'long int (*)(struct
 device *, struct device_attribute *, char *)'} from incompatible pointer type
 'ssize_t (*)(struct device *...
Message-ID: <202604040309.wwvKyW4x-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/thomas.weissschuh/linux.git b4/b4-sysfs-const-attr-device_attr
head:   9ea6d09f6e27145f7dfee08143bf35902ebe2615
commit: e2c1721e9b806f48323d5a3105b15223403076a9 [15/21] device_string
config: powerpc-allmodconfig (https://download.01.org/0day-ci/archive/20260404/202604040309.wwvKyW4x-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260404/202604040309.wwvKyW4x-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604040309.wwvKyW4x-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/powerpc/perf/hv-24x7.c: In function 'device_str_attr_create_':
>> arch/powerpc/perf/hv-24x7.c:464:25: error: assignment to 'ssize_t (*)(struct device *, struct device_attribute *, char *)' {aka 'long int (*)(struct device *, struct device_attribute *, char *)'} from incompatible pointer type 'ssize_t (*)(struct device *, const struct device_attribute *, char *)' {aka 'long int (*)(struct device *, const struct device_attribute *, char *)'} [-Wincompatible-pointer-types]
     464 |         attr->attr.show = device_show_string;
         |                         ^
   In file included from arch/powerpc/include/asm/perf_event_server.h:10,
                    from arch/powerpc/include/asm/perf_event.h:14,
                    from include/linux/perf_event.h:25,
                    from arch/powerpc/perf/hv-24x7.c:11:
   include/linux/device.h:143:9: note: 'device_show_string' declared here
     143 | ssize_t device_show_string(struct device *dev, const struct device_attribute *attr,
         |         ^~~~~~~~~~~~~~~~~~
   arch/powerpc/perf/hv-24x7.c: At top level:
   include/linux/device.h:157:27: warning: initialized field overwritten [-Woverride-init]
     157 |         .show_const     = _Generic(_show,                                               \
         |                           ^~~~~~~~
   include/linux/device.h:175:9: note: in expansion of macro '__DEVICE_ATTR_SHOW_STORE'
     175 |         __DEVICE_ATTR_SHOW_STORE(_show, _store)                         \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/device.h:179:9: note: in expansion of macro '__DEVICE_ATTR'
     179 |         __DEVICE_ATTR(_name, _mode, _name##_show, NULL)
         |         ^~~~~~~~~~~~~
   include/linux/device.h:182:9: note: in expansion of macro '__DEVICE_ATTR_RO_MODE'
     182 |         __DEVICE_ATTR_RO_MODE(_name, 0444)
         |         ^~~~~~~~~~~~~~~~~~~~~
   include/linux/device.h:251:52: note: in expansion of macro '__DEVICE_ATTR_RO'
     251 |         struct device_attribute dev_attr_##_name = __DEVICE_ATTR_RO(_name)
         |                                                    ^~~~~~~~~~~~~~~~
   arch/powerpc/perf/hv-24x7.c:1103:8: note: in expansion of macro 'DEVICE_ATTR_RO'
    1103 | static DEVICE_ATTR_RO(_name)
         |        ^~~~~~~~~~~~~~
   arch/powerpc/perf/hv-24x7.c:1105:1: note: in expansion of macro 'PAGE_0_ATTR'
    1105 | PAGE_0_ATTR(catalog_version, "%lld\n",
         | ^~~~~~~~~~~
   include/linux/device.h:157:27: note: (near initialization for 'dev_attr_catalog_version.<anonymous>.show_const')
     157 |         .show_const     = _Generic(_show,                                               \
         |                           ^~~~~~~~
   include/linux/device.h:175:9: note: in expansion of macro '__DEVICE_ATTR_SHOW_STORE'
     175 |         __DEVICE_ATTR_SHOW_STORE(_show, _store)                         \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/device.h:179:9: note: in expansion of macro '__DEVICE_ATTR'
     179 |         __DEVICE_ATTR(_name, _mode, _name##_show, NULL)
         |         ^~~~~~~~~~~~~
   include/linux/device.h:182:9: note: in expansion of macro '__DEVICE_ATTR_RO_MODE'
     182 |         __DEVICE_ATTR_RO_MODE(_name, 0444)
         |         ^~~~~~~~~~~~~~~~~~~~~
   include/linux/device.h:251:52: note: in expansion of macro '__DEVICE_ATTR_RO'
     251 |         struct device_attribute dev_attr_##_name = __DEVICE_ATTR_RO(_name)
         |                                                    ^~~~~~~~~~~~~~~~
   arch/powerpc/perf/hv-24x7.c:1103:8: note: in expansion of macro 'DEVICE_ATTR_RO'
    1103 | static DEVICE_ATTR_RO(_name)
         |        ^~~~~~~~~~~~~~
   arch/powerpc/perf/hv-24x7.c:1105:1: note: in expansion of macro 'PAGE_0_ATTR'
    1105 | PAGE_0_ATTR(catalog_version, "%lld\n",
         | ^~~~~~~~~~~
   include/linux/device.h:166:27: warning: initialized field overwritten [-Woverride-init]
     166 |         .store_const    = _Generic(_store,                                              \
         |                           ^~~~~~~~
   include/linux/device.h:175:9: note: in expansion of macro '__DEVICE_ATTR_SHOW_STORE'
     175 |         __DEVICE_ATTR_SHOW_STORE(_show, _store)                         \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/device.h:179:9: note: in expansion of macro '__DEVICE_ATTR'
     179 |         __DEVICE_ATTR(_name, _mode, _name##_show, NULL)
         |         ^~~~~~~~~~~~~
   include/linux/device.h:182:9: note: in expansion of macro '__DEVICE_ATTR_RO_MODE'
     182 |         __DEVICE_ATTR_RO_MODE(_name, 0444)
         |         ^~~~~~~~~~~~~~~~~~~~~
   include/linux/device.h:251:52: note: in expansion of macro '__DEVICE_ATTR_RO'
     251 |         struct device_attribute dev_attr_##_name = __DEVICE_ATTR_RO(_name)
         |                                                    ^~~~~~~~~~~~~~~~
   arch/powerpc/perf/hv-24x7.c:1103:8: note: in expansion of macro 'DEVICE_ATTR_RO'
    1103 | static DEVICE_ATTR_RO(_name)
         |        ^~~~~~~~~~~~~~
   arch/powerpc/perf/hv-24x7.c:1105:1: note: in expansion of macro 'PAGE_0_ATTR'
    1105 | PAGE_0_ATTR(catalog_version, "%lld\n",
         | ^~~~~~~~~~~
   include/linux/device.h:166:27: note: (near initialization for 'dev_attr_catalog_version.<anonymous>.store_const')
     166 |         .store_const    = _Generic(_store,                                              \
         |                           ^~~~~~~~
   include/linux/device.h:175:9: note: in expansion of macro '__DEVICE_ATTR_SHOW_STORE'
     175 |         __DEVICE_ATTR_SHOW_STORE(_show, _store)                         \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/device.h:179:9: note: in expansion of macro '__DEVICE_ATTR'
     179 |         __DEVICE_ATTR(_name, _mode, _name##_show, NULL)
         |         ^~~~~~~~~~~~~
   include/linux/device.h:182:9: note: in expansion of macro '__DEVICE_ATTR_RO_MODE'
     182 |         __DEVICE_ATTR_RO_MODE(_name, 0444)
         |         ^~~~~~~~~~~~~~~~~~~~~
   include/linux/device.h:251:52: note: in expansion of macro '__DEVICE_ATTR_RO'
     251 |         struct device_attribute dev_attr_##_name = __DEVICE_ATTR_RO(_name)
         |                                                    ^~~~~~~~~~~~~~~~
   arch/powerpc/perf/hv-24x7.c:1103:8: note: in expansion of macro 'DEVICE_ATTR_RO'
    1103 | static DEVICE_ATTR_RO(_name)
         |        ^~~~~~~~~~~~~~
   arch/powerpc/perf/hv-24x7.c:1105:1: note: in expansion of macro 'PAGE_0_ATTR'
    1105 | PAGE_0_ATTR(catalog_version, "%lld\n",
         | ^~~~~~~~~~~
   include/linux/device.h:157:27: warning: initialized field overwritten [-Woverride-init]
     157 |         .show_const     = _Generic(_show,                                               \
         |                           ^~~~~~~~
   include/linux/device.h:175:9: note: in expansion of macro '__DEVICE_ATTR_SHOW_STORE'
     175 |         __DEVICE_ATTR_SHOW_STORE(_show, _store)                         \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~


vim +464 arch/powerpc/perf/hv-24x7.c

60beb65da1efd4 Kajol Jain          2020-05-25  451  
5c5cd7b502595f Cody P Schafer      2015-01-30  452  static struct attribute *device_str_attr_create_(char *name, char *str)
5c5cd7b502595f Cody P Schafer      2015-01-30  453  {
bf4afc53b77aea Linus Torvalds      2026-02-21  454  	struct dev_ext_attribute *attr = kzalloc_obj(*attr);
5c5cd7b502595f Cody P Schafer      2015-01-30  455  
5c5cd7b502595f Cody P Schafer      2015-01-30  456  	if (!attr)
5c5cd7b502595f Cody P Schafer      2015-01-30  457  		return NULL;
5c5cd7b502595f Cody P Schafer      2015-01-30  458  
442053e57a4fc5 Sukadev Bhattiprolu 2015-07-07  459  	sysfs_attr_init(&attr->attr.attr);
442053e57a4fc5 Sukadev Bhattiprolu 2015-07-07  460  
5c5cd7b502595f Cody P Schafer      2015-01-30  461  	attr->var = str;
5c5cd7b502595f Cody P Schafer      2015-01-30  462  	attr->attr.attr.name = name;
5c5cd7b502595f Cody P Schafer      2015-01-30  463  	attr->attr.attr.mode = 0444;
5c5cd7b502595f Cody P Schafer      2015-01-30 @464  	attr->attr.show = device_show_string;
3ca4ea71cb27b4 Sukadev Bhattiprolu 2015-03-30  465  
5c5cd7b502595f Cody P Schafer      2015-01-30  466  	return &attr->attr.attr;
5c5cd7b502595f Cody P Schafer      2015-01-30  467  }
5c5cd7b502595f Cody P Schafer      2015-01-30  468  

:::::: The code at line 464 was first introduced by commit
:::::: 5c5cd7b502595f6b90509b8aa4bba6f81b69315c powerpc/perf/hv-24x7: parse catalog and populate sysfs with events

:::::: TO: Cody P Schafer <cody@linux.vnet.ibm.com>
:::::: CC: Michael Ellerman <mpe@ellerman.id.au>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
