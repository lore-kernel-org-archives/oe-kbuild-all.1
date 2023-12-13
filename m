Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5291565C
	for <oe-kbuild-all@lists.linux.dev>; Wed, 13 Dec 2023 00:05:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LOajBBh+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702425915; x=1733961915;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=9nEVxX/Cw3Nwwjh0zjS/Pu4EHFQBgnXZTIU1wSdxBPY=;
  b=LOajBBh+aWVOdbH0+CT/wKvHFsS3DJyOcy3YNEOX/I88cT0Jvzoz0/9r
   NnVfGIdatVgpQei4Hi6sohktenaQMKFeS58NzPd+KH19oylmddx4Kt71v
   JxOKGjsyqkcsrVjlelnXsaNOpJS1IGS5RqGwihSphvlrR4cJ6XnRdhF7H
   5bTknbceJv08k3BqGauEwe6GniKfrCGHB9dAeH/XbJwpTn9Tfwda5MnJ8
   0fvd1AsTMjO709worNwwy/H8l1vAg1fXmJoNnVKKiPrXPxW++uGlrjn3k
   Hw/cMNVEmzx4Vgt41PX1nOW9yQ5ib8OCHLDqQWveVO59MHu7EJ1bnrnvo
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10922"; a="1746237"
X-IronPort-AV: E=Sophos;i="6.04,271,1695711600"; 
   d="scan'208";a="1746237"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Dec 2023 16:05:14 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10922"; a="777280485"
X-IronPort-AV: E=Sophos;i="6.04,271,1695711600"; 
   d="scan'208";a="777280485"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga007.fm.intel.com with ESMTP; 12 Dec 2023 16:05:13 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rDCkQ-000JsJ-2w;
	Wed, 13 Dec 2023 00:05:10 +0000
Date: Wed, 13 Dec 2023 08:05:08 +0800
From: kernel test robot <lkp@intel.com>
To: Zelong Dong <zelong.dong@amlogic.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Dmitry Rokosov <ddrokosov@sberdevices.ru>
Subject: [linux-next:master 3022/6946]
 arch/arm64/boot/dts/amlogic/amlogic-c3.dtsi:9:10: fatal error:
 dt-bindings/reset/amlogic,c3-reset.h: No such file or directory
Message-ID: <202312130724.qFGaIjW5-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   abb240f7a2bd14567ab53e602db562bb683391e6
commit: a5468f5ea9a01acf29d02745abae7b82482989d4 [3022/6946] arm64: dts: amlogic: add reset controller for Amlogic C3 SoC
config: arm64-defconfig (https://download.01.org/0day-ci/archive/20231213/202312130724.qFGaIjW5-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231213/202312130724.qFGaIjW5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312130724.qFGaIjW5-lkp@intel.com/

Note: the linux-next/master HEAD abb240f7a2bd14567ab53e602db562bb683391e6 builds fine.
      It may have been fixed somewhere.

All errors (new ones prefixed by >>):

   In file included from arch/arm64/boot/dts/amlogic/amlogic-c3-c302x-aw409.dts:8:
>> arch/arm64/boot/dts/amlogic/amlogic-c3.dtsi:9:10: fatal error: dt-bindings/reset/amlogic,c3-reset.h: No such file or directory
       9 | #include <dt-bindings/reset/amlogic,c3-reset.h>
         |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   compilation terminated.


vim +9 arch/arm64/boot/dts/amlogic/amlogic-c3.dtsi

   > 9	#include <dt-bindings/reset/amlogic,c3-reset.h>
    10	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
