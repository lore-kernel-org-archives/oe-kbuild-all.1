Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4F1849A3C0
	for <oe-kbuild-all@lists.linux.dev>; Thu, 17 Sep 2026 21:09:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789679360; cv=none; b=LAcEL4DuWxosIOrL7ug1MnJ5I6eWrK1h7ucorAG5jzVgeewt+ssxrUM5prfPMEFAJsOIYDhDBqvcjHDxCSLbiB7jFrh3hVtM+d8SRnM1rU/WRZLKusSx59mtMgY9YuXyZ/vcMogz5HhTZ4n+ujB/3ECZ3gdM5qIv3HIMIXQp9Gs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789679360; c=relaxed/simple;
	bh=8GcjXcmizQWyhW7/ZPnXSYhyFd38xtJYv0eN5tmVwF4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=rsaEvtgMQxDMid7qv73wvUPA69SzjQ2VbOhbAX4CdfdpGRJC4wWs5Pg1XG3KNckxbCp3/17swS0TJVoPOHtxUQjR/Cyy+8czuF8upxL+0KgF4i7TYMBQID2aEZ0C4NyXNYpEddMDOqnd6BeMCVSkU/aukUguvbF+ZdV106YFnl8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XNHXGmDA; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XNHXGmDA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789679358; x=1821215358;
  h=date:from:to:cc:subject:message-id;
  bh=8GcjXcmizQWyhW7/ZPnXSYhyFd38xtJYv0eN5tmVwF4=;
  b=XNHXGmDAFNVA11WFUnoioJ5dFfqZQxuSY5jzns0l7F2xUebmz6UA2JBU
   aRCbRO8Ie6CX0KTjGa1TP3xy9SHzH5hwctPeq/OZGGLnamt3pGj7hhK65
   xjf7Byd2lruxG+4CPPpYKy/UG9Nc4ZVcKCgSAYrxpwZUPZEpnBsmFWeIn
   5FjYlDNxEMS3BX2ZkwzefgbLsJ6SEMP7i99yjX6MtrZ+tRrRSYeagV65U
   99jWtq3sB0sLq7rngIaZ4M3TzHm+ddR4MvELCmbaqPzeHqUNHFb52Pc/o
   osgsTC2W1B/y+eAiBT9SG8nefxVv5fMY2h6pcIZncD2NJSHOMQ9xKu7bs
   g==;
X-CSE-ConnectionGUID: dFe5wuJMTy6xhu0+lCeLmg==
X-CSE-MsgGUID: wYQvB47PQRSCpzZXo5+BCg==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="107650382"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="107650382"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Sep 2026 14:09:17 -0700
X-CSE-ConnectionGUID: IXRMVua6RzKan/pPabM5oA==
X-CSE-MsgGUID: L3KAwYCFTRW16ONBs4Sf9A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="270327087"
Received: from lkp-server01.sh.intel.com (HELO 462990a40a85) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 17 Sep 2026 14:09:16 -0700
Received: from kbuild by 462990a40a85 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x7JM1-000000008W5-1uHS;
	Thu, 17 Sep 2026 21:09:13 +0000
Date: Fri, 18 Sep 2026 05:08:12 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12-2026-06 1/1]
 security/apparmor/apparmorfs.c:177:28: warning: 'get_loaddata_common_ref'
 defined but not used
Message-ID: <202609180449.7Dh0nFyk-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android16-6.12-2026-06
head:   9502f9af7772f796d474c821526ac09e4dfea914
commit: eecce026399917f6efa532c56bc7a3e9dd6ee68b [1/1] apparmor: fix race between freeing data and fs accessing it
config: arm64-randconfig-1001-20260917 (https://download.01.org/0day-ci/archive/20260918/202609180449.7Dh0nFyk-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260918/202609180449.7Dh0nFyk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609180449.7Dh0nFyk-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> security/apparmor/apparmorfs.c:177:28: warning: 'get_loaddata_common_ref' defined but not used [-Wunused-function]
    static struct aa_loaddata *get_loaddata_common_ref(struct aa_common_ref *ref)
                               ^~~~~~~~~~~~~~~~~~~~~~~


vim +/get_loaddata_common_ref +177 security/apparmor/apparmorfs.c

   176	
 > 177	static struct aa_loaddata *get_loaddata_common_ref(struct aa_common_ref *ref)
   178	{
   179		if (ref)
   180			return aa_get_i_loaddata(container_of(ref, struct aa_loaddata,
   181							      count));
   182		return NULL;
   183	}
   184	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
