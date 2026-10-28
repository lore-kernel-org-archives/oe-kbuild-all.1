Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.12
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793166231;
	b=1mI1pUAycrqEADbhS8LNzZ24tVmKb1CabRsAL7+sFPxw9l2cLhl9gNiVf05O3Bhl9C8C
	 7IZJkvBoP+/xo7ujrCRNGrOP+bJK/+IEpgleOKtEOFDFQ5ATYc/65I2qPbd7aErfyfBud
	 Fy0ecmBDRQy+35K85I6ZcUvDWbvzWOlpAOtgdXw3dVuArqrkdYk9/ovg3Ab1eThWXfx6a
	 +KW0rtSIlsdSg//Ymap6pDjqyxi2PsbufpUmxVyE3C3TyKsgaLmhvB1YuFI7KHNlAAbAY
	 sjbrcw/8O2IawKm/edaMxe4AE9+Z7vOsduYaxun7vKyg49NN07bBitMqdzg/E/qKlVw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793166231;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=9gMNYLfmtuesxU14YhsiOvJOEhrqFE/wH5vrHRpzBls=;
	b=i4r6qcw7nkIol5lTBWGsF88I4OxGxhE9ZgghYNSO0zd2UxlAakXmeXqz/xSR8J9n8z9l
	 SBxgcYnTE+jBK1SKpGIboibSiOQCnvYcXRBwOohb1KSzX0WgKYaf50/yc/B5nGxJqvRwE
	 HKulJqw2FbWs2KBVZHT5w37HsdqNF4stv4ox71AOpYvLIM3e7ULJcMxZPIEVfuTl/A//R
	 OWl8hqFUJ1yETg1HntNoUFesQlO7mvfpAnhn99enMJ+oR06k5Wf3Co2CVMVThXRBwGVrv
	 AhYtLxldIFQHDtHdoGq/0RRc5KdhoorWniS6fthSSoaCEfuq3NLGdQz8jvizDMQe4JA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Fz4A3liN;
	arc=none smtp.remote-ip=192.198.163.12
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 857E2606A31A
	for <oe-kbuild-all@lists.linux.dev>; Wed, 28 Oct 2026 05:43:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 857E2606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Fz4A3liN
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793166231; x=1824702231;
  h=date:from:to:cc:subject:message-id;
  bh=sKuw+lRA60BT1LnJAbj46eIOugri5zRVMrxBXKFGxWs=;
  b=Fz4A3liN63OEPAKs1QjtYAY0isljX/XRqNewJ34w6CMidfc/hf5xiPnw
   w81jk1N7mkbozci3xI3pAOiAuLEYEBVb0X+lNlpl0vwGQ7Bi0JqP1BT5B
   qsQ897SJpapcipD7sFIyFHz5H6MTPQffcP7lY0qiwnLBHIvbCY6sjXtnl
   pPKI7FoUy+lhYKnIpCeOn2IKVNlUOg8aIaAU92C+gTiFCrMiIdnI7K+/l
   oM32bh36+Q4vAJfrKiSQgBHZBefqsQVNcmoENHJzHiae/OESRYFT/dqXp
   SRj7Lhj3AIe8XCWRRUyM60i++H+uZLCJ4hmwSiRFL3QUxCKm1aDsoChKN
   A==;
X-CSE-ConnectionGUID: 7wkxNU3BRguXS+1NpSuxVg==
X-CSE-MsgGUID: 67e07tz2Sfy4tDSm+GHUvQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11948"; a="1776226"
X-IronPort-AV: E=Sophos;i="6.27,182,1787036400"; 
   d="scan'208";a="1776226"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Oct 2026 22:43:50 -0700
X-CSE-ConnectionGUID: k5cdsQhgTNWAoN3SrqfhVQ==
X-CSE-MsgGUID: buTuwQvJS0yjUGyg5IUs2w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,182,1787036400"; 
   d="scan'208";a="4715532"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 27 Oct 2026 22:43:49 -0700
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xLwRu-00000000YKG-1OtW;
	Wed, 28 Oct 2026 05:43:46 +0000
Date: Wed, 28 Oct 2026 13:43:36 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android14-5.15-2026-10 0/1]
 drivers/platform/x86/hp/hp-wmi.c:342:24: warning: cast to smaller integer
 type 'enum hp_wmi_radio' from 'void *'
Message-ID: <202610281328.MX4ePzzC-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

Hi Jorge,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android14-5.15-2026-10
head:   e3d5b6f9a1ddf140aa63e90d13891a73306ffebd
commit: a832a43fdd95bc689bc23862326a114579aa025b [0/1] platform/x86: Move existing HP drivers to a new hp subdir
config: x86_64-randconfig-1002-20261028 (https://download.01.org/0day-ci/archive/20261028/202610281328.MX4ePzzC-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 1da436a23e613c425fc9b868fc8deb979ede47a4)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261028/202610281328.MX4ePzzC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610281328.MX4ePzzC-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from <built-in>:3:
   In file included from include/linux/compiler_types.h:80:
   include/linux/compiler-clang.h:24:9: warning: '__SANITIZE_ADDRESS__' macro redefined [-Wmacro-redefined]
      24 | #define __SANITIZE_ADDRESS__
         |         ^
   <built-in>:357:9: note: previous definition is here
     357 | #define __SANITIZE_ADDRESS__ 1
         |         ^
>> drivers/platform/x86/hp/hp-wmi.c:342:24: warning: cast to smaller integer type 'enum hp_wmi_radio' from 'void *' [-Wvoid-pointer-to-enum-cast]
     342 |         enum hp_wmi_radio r = (enum hp_wmi_radio) data;
         |                               ^~~~~~~~~~~~~~~~~~~~~~~~
   2 warnings generated.


vim +342 drivers/platform/x86/hp/hp-wmi.c

f82bdd0d77b6bf0 drivers/platform/x86/hp-wmi.c Kyle Evans           2014-06-09  339  
19d337dff95cbf7 drivers/platform/x86/hp-wmi.c Johannes Berg        2009-06-02  340  static int hp_wmi_set_block(void *data, bool blocked)
62ec30d45ecbb85 drivers/misc/hp-wmi.c         Matthew Garrett      2008-07-25  341  {
e5fbba85a7acc26 drivers/platform/x86/hp-wmi.c Alan Jenkins         2009-07-21 @342  	enum hp_wmi_radio r = (enum hp_wmi_radio) data;
e5fbba85a7acc26 drivers/platform/x86/hp-wmi.c Alan Jenkins         2009-07-21  343  	int query = BIT(r + 8) | ((!blocked) << r);
6d96e00cef35036 drivers/platform/x86/hp-wmi.c Thomas Renninger     2010-05-21  344  	int ret;
62ec30d45ecbb85 drivers/misc/hp-wmi.c         Matthew Garrett      2008-07-25  345  
d8193cff33906e2 drivers/platform/x86/hp-wmi.c Darren Hart (VMware  2017-04-19  346) 	ret = hp_wmi_perform_query(HPWMI_WIRELESS_QUERY, HPWMI_WRITE,
c3021ea1beeeb1a drivers/platform/x86/hp-wmi.c Anssi Hannula        2011-02-20  347  				   &query, sizeof(query), 0);
527376c89caf595 drivers/platform/x86/hp-wmi.c Darren Hart (VMware  2017-04-19  348) 
527376c89caf595 drivers/platform/x86/hp-wmi.c Darren Hart (VMware  2017-04-19  349) 	return ret <= 0 ? ret : -EINVAL;
62ec30d45ecbb85 drivers/misc/hp-wmi.c         Matthew Garrett      2008-07-25  350  }
62ec30d45ecbb85 drivers/misc/hp-wmi.c         Matthew Garrett      2008-07-25  351  

:::::: The code at line 342 was first introduced by commit
:::::: e5fbba85a7acc2626d4fe14501816811d702f3e9 hp-wmi: improve rfkill support

:::::: TO: Alan Jenkins <alan-jenkins@tuffmail.co.uk>
:::::: CC: Len Brown <len.brown@intel.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
