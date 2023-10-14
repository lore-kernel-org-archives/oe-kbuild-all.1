Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06C41539E
	for <oe-kbuild-all@lists.linux.dev>; Sat, 14 Oct 2023 07:23:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Rir7jGKk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697268197; x=1728804197;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=POkscZJMnm5QguvO6QnI5KgTTbT06eAAdAvKzY1NDPA=;
  b=Rir7jGKkERXQxgGFSMVRdHQ6CnGQ2c5JytoJYbNOKgsL0dfJva4JvWqv
   2s5dW2FME9Qvn7r+2K3G8OouxAgKnIMcSS76P52sBAqUgE9xe8T/JkVw6
   kUMlJnC/R3uHBQubp2K84wwKyz2/SKNysUIAnalsZbutNnEkLRiKG6ITk
   8g257P/MFaz1/iK1RaQzt8zAAe/Iq2lSdSzLhYKGhdCt1mAb7yChuR2Ch
   3bWSIHB1ZRLT07+puWDhSuuByxqGZcXxdKARCZx3Xxy+cZlCiy6YJ57nn
   /SmSuwbuZlyQphfYMQI+kFuMJRbJTBh4Ioja2ir4NHTBZw4u/0wSBglYr
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10862"; a="471539364"
X-IronPort-AV: E=Sophos;i="6.03,224,1694761200"; 
   d="scan'208";a="471539364"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2023 00:23:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10862"; a="784416666"
X-IronPort-AV: E=Sophos;i="6.03,224,1694761200"; 
   d="scan'208";a="784416666"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by orsmga008.jf.intel.com with ESMTP; 14 Oct 2023 00:23:09 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qrYzL-0005od-0D;
	Sat, 14 Oct 2023 07:23:07 +0000
Date: Sat, 14 Oct 2023 15:22:13 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:pr/642 12070/30000]
 drivers/gpu/drm/panel/panel-wks-101wx001.c:216:25: error:
 'platform_of_match' undeclared here (not in a function)
Message-ID: <202310141540.RnoWUdT0-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Freescale/linux-fslc pr/642
head:   c8b7cf62c7fea8456dec789d550b8006d73b8f04
commit: e15e046b8fceb6ae7c94d0ad78ef00a7432efb7b [12070/30000] MLK-24334-1: drm/panel: Add support for WKS-101WX001-WCT parallel display
config: sh-allmodconfig (https://download.01.org/0day-ci/archive/20231014/202310141540.RnoWUdT0-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231014/202310141540.RnoWUdT0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310141540.RnoWUdT0-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/gfp.h:6,
                    from include/linux/umh.h:4,
                    from include/linux/kmod.h:9,
                    from include/linux/module.h:13,
                    from drivers/gpu/drm/panel/panel-wks-101wx001.c:10:
   include/linux/mmzone.h: In function '__nr_to_section':
   include/linux/mmzone.h:1241:13: warning: the comparison will always evaluate as 'true' for the address of 'mem_section' will never be NULL [-Waddress]
    1241 |         if (!mem_section[SECTION_NR_TO_ROOT(nr)])
         |             ^
   include/linux/mmzone.h:1227:27: note: 'mem_section' declared here
    1227 | extern struct mem_section mem_section[NR_SECTION_ROOTS][SECTIONS_PER_ROOT];
         |                           ^~~~~~~~~~~
   drivers/gpu/drm/panel/panel-wks-101wx001.c: At top level:
>> drivers/gpu/drm/panel/panel-wks-101wx001.c:216:25: error: 'platform_of_match' undeclared here (not in a function)
     216 | MODULE_DEVICE_TABLE(of, platform_of_match);
         |                         ^~~~~~~~~~~~~~~~~
   include/linux/module.h:227:15: note: in definition of macro 'MODULE_DEVICE_TABLE'
     227 | extern typeof(name) __mod_##type##__##name##_device_table               \
         |               ^~~~
>> include/linux/module.h:227:21: error: '__mod_of__platform_of_match_device_table' aliased to undefined symbol 'platform_of_match'
     227 | extern typeof(name) __mod_##type##__##name##_device_table               \
         |                     ^~~~~~
   drivers/gpu/drm/panel/panel-wks-101wx001.c:216:1: note: in expansion of macro 'MODULE_DEVICE_TABLE'
     216 | MODULE_DEVICE_TABLE(of, platform_of_match);
         | ^~~~~~~~~~~~~~~~~~~


vim +/platform_of_match +216 drivers/gpu/drm/panel/panel-wks-101wx001.c

   211	
   212	static const struct of_device_id wks_of_match[] = {
   213		{ .compatible = "wks,101wx001", },
   214		{ /* sentinel */ }
   215	};
 > 216	MODULE_DEVICE_TABLE(of, platform_of_match);
   217	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
