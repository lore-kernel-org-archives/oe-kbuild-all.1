Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8254F364CF
	for <oe-kbuild-all@lists.linux.dev>; Sat, 24 Feb 2024 13:04:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708779893; cv=none; b=EHroAsd5UrxQOC9RrcaLMAeQYWo8RFAaJIZXgXDo+HVgEvbFUz85oz2ByhgUDJext1awrO1PvBdeqXH/XnGVpotc0AP8PYw6wcFIZOUugGqMJ9yxRBU1+LpSADZpUf4qfbP97JOBV7R/rlIR06/wT/86jW6tS07Tv/8t83x/V5g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708779893; c=relaxed/simple;
	bh=4k7ruRO8IL74riviJDvMCCl+RMNQP0OnHenYJaOk9k4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=KoRTVvQ/0Pn0t4M9uDee28pEnsPxuvbme4pFd+DxZ1Sf8X+2JOrW1jQAtPfPW2lBESTW7tPI4whk8QPXx1mrf6Dg70zdqvCdQyl2KiaC+kpifwjKDQ9FOjlsQCSOPiFtnXVXebcuyWyFxOTSVwXPCfCWHFFLahuX6ropBcYra9Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=imsV40Iq; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="imsV40Iq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1708779892; x=1740315892;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=4k7ruRO8IL74riviJDvMCCl+RMNQP0OnHenYJaOk9k4=;
  b=imsV40Iq+39U5+jV3x92Ukb+sViME7lDrp9UzQIcGtKs3sSXAZXdiDvJ
   oC6MkVpQq4Ub7IrZgbAWRca8v8rKf4jFzlRkcIcgj72ugV08MPa0BZTaO
   MIss4RgHa01uWZUc3zFAI7bqVmB5H/EhXkz8nq98gyc+dDp6/ALGsNsOd
   eb+0vq3R32KG4lOAuuCfFxDSOFBtsZTqyamx8+s72eABvqCBoSz3ytyom
   TIu1BF68OBrqSrQR3VrK/aRPnZzwWEpxn75SXTPtoWrmfk6BNVRSGuEBr
   0Z+tk36jocD13DoglCwcZ2CyOYqmS5wyX5uBLrfNxGsev2FW+ZEfL8XO9
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10993"; a="6922412"
X-IronPort-AV: E=Sophos;i="6.06,181,1705392000"; 
   d="scan'208";a="6922412"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Feb 2024 05:04:51 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,181,1705392000"; 
   d="scan'208";a="6192928"
Received: from lkp-server02.sh.intel.com (HELO 3c78fa4d504c) ([10.239.97.151])
  by fmviesa010.fm.intel.com with ESMTP; 24 Feb 2024 05:04:49 -0800
Received: from kbuild by 3c78fa4d504c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rdrhv-0008XC-0l;
	Sat, 24 Feb 2024 13:04:47 +0000
Date: Sat, 24 Feb 2024 21:03:36 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, WenChen <chenwen54@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 29649/30000]
 drivers/ub/urma/ubcore/ubcore_device.c:393:23: warning: no previous
 prototype for function 'ubcore_find_tpf_device_legacy'
Message-ID: <202402242102.SLiva8Ut-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   4fee6fdef7d687d6ce43289fd7e7f96fde039af0
commit: 329bf7f331286ee5d571d374e31ed50d2877b110 [29649/30000] ubcore: fix the bug of tp negotiation concurrency
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20240224/202402242102.SLiva8Ut-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240224/202402242102.SLiva8Ut-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402242102.SLiva8Ut-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/ub/urma/ubcore/ubcore_device.c:306:6: warning: no previous prototype for function 'ubcore_destroy_upi_list' [-Wmissing-prototypes]
     306 | void ubcore_destroy_upi_list(void)
         |      ^
   drivers/ub/urma/ubcore/ubcore_device.c:306:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     306 | void ubcore_destroy_upi_list(void)
         | ^
         | static 
>> drivers/ub/urma/ubcore/ubcore_device.c:393:23: warning: no previous prototype for function 'ubcore_find_tpf_device_legacy' [-Wmissing-prototypes]
     393 | struct ubcore_device *ubcore_find_tpf_device_legacy(void)
         |                       ^
   drivers/ub/urma/ubcore/ubcore_device.c:393:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     393 | struct ubcore_device *ubcore_find_tpf_device_legacy(void)
         | ^
         | static 
   2 warnings generated.
--
   drivers/ub/urma/ubcore/ubcore_tp.c:66:17: warning: no previous prototype for function 'ubcore_get_mtu' [-Wmissing-prototypes]
      66 | enum ubcore_mtu ubcore_get_mtu(int mtu)
         |                 ^
   drivers/ub/urma/ubcore/ubcore_tp.c:66:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      66 | enum ubcore_mtu ubcore_get_mtu(int mtu)
         | ^
         | static 
>> drivers/ub/urma/ubcore/ubcore_tp.c:392:5: warning: no previous prototype for function 'ubcore_modify_tp_state' [-Wmissing-prototypes]
     392 | int ubcore_modify_tp_state(struct ubcore_device *dev, struct ubcore_tp *tp,
         |     ^
   drivers/ub/urma/ubcore/ubcore_tp.c:392:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     392 | int ubcore_modify_tp_state(struct ubcore_device *dev, struct ubcore_tp *tp,
         | ^
         | static 
   drivers/ub/urma/ubcore/ubcore_tp.c:894:19: warning: no previous prototype for function 'ubcore_create_vtp' [-Wmissing-prototypes]
     894 | struct ubcore_tp *ubcore_create_vtp(struct ubcore_device *dev, union ubcore_eid *remote_eid,
         |                   ^
   drivers/ub/urma/ubcore/ubcore_tp.c:894:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     894 | struct ubcore_tp *ubcore_create_vtp(struct ubcore_device *dev, union ubcore_eid *remote_eid,
         | ^
         | static 
   drivers/ub/urma/ubcore/ubcore_tp.c:920:5: warning: no previous prototype for function 'ubcore_destroy_vtp' [-Wmissing-prototypes]
     920 | int ubcore_destroy_vtp(struct ubcore_tp *vtp)
         |     ^
   drivers/ub/urma/ubcore/ubcore_tp.c:920:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     920 | int ubcore_destroy_vtp(struct ubcore_tp *vtp)
         | ^
         | static 
   4 warnings generated.
--
>> drivers/ub/urma/uburma/uburma_main.c:640:6: warning: no previous prototype for function 'uburma_dev_accessible_by_ns' [-Wmissing-prototypes]
     640 | bool uburma_dev_accessible_by_ns(struct uburma_device *ubu_dev, struct net *net)
         |      ^
   drivers/ub/urma/uburma/uburma_main.c:640:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     640 | bool uburma_dev_accessible_by_ns(struct uburma_device *ubu_dev, struct net *net)
         | ^
         | static 
>> drivers/ub/urma/uburma/uburma_main.c:665:5: warning: no previous prototype for function 'uburma_set_dev_ns' [-Wmissing-prototypes]
     665 | int uburma_set_dev_ns(char *device_name, int ns_fd)
         |     ^
   drivers/ub/urma/uburma/uburma_main.c:665:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     665 | int uburma_set_dev_ns(char *device_name, int ns_fd)
         | ^
         | static 
>> drivers/ub/urma/uburma/uburma_main.c:723:5: warning: no previous prototype for function 'uburma_set_ns_mode' [-Wmissing-prototypes]
     723 | int uburma_set_ns_mode(bool shared)
         |     ^
   drivers/ub/urma/uburma/uburma_main.c:723:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     723 | int uburma_set_ns_mode(bool shared)
         | ^
         | static 
   3 warnings generated.


vim +/ubcore_find_tpf_device_legacy +393 drivers/ub/urma/ubcore/ubcore_device.c

   392	
 > 393	struct ubcore_device *ubcore_find_tpf_device_legacy(void)
   394	{
   395		if (g_tpf == NULL)
   396			ubcore_log_err("tpf is not registered yet");
   397	
   398		ubcore_get_device(g_tpf);
   399		return g_tpf;
   400	}
   401	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
