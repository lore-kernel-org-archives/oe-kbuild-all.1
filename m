Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BC931CDA18
	for <oe-kbuild-all@lists.linux.dev>; Thu, 31 Oct 2024 21:06:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730408814; cv=none; b=KsW8vcnpKyFCJxfm2b5OjHmg5efETpGfiD4q1IaGSBaU2GHZNR7fnV1BF8ipcJaUALHldehIaDSfR1KCIQiO+MlVZxxmt41TPEB20MvXJdEwiX8lJzmfvojjX/2LA6psQxcFgGfl6W0bn76aVTqVqTHRtQiWP/VaTBU8yZYD3Wk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730408814; c=relaxed/simple;
	bh=h3JpmVdh07ZINiMdPmxJOT91rtcSGA5gaCQnZy9sJ78=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=h6cxJcuGHMa1mBdyl5G0WgzK12XXCwzFUrpFtYTrvFrpFRHKHmLW40R3JwtkqT0xU3zK9amMptpY6ex3pPNnav+RP/ljkRSww9PFGVAbppN5xY1WczZjxT7t0H+++Smnkif3Z/WWqBHcE3ct1B0OW9IxtFPxCOg3aWCpOC6ODHE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GuT1iFVY; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GuT1iFVY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730408809; x=1761944809;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=h3JpmVdh07ZINiMdPmxJOT91rtcSGA5gaCQnZy9sJ78=;
  b=GuT1iFVYxb6Qy9fMmF84J0lNe5jDuwlLAy1+mIB1R6f5o+QVPGQxGy51
   D6Dt7+u5znzZfc+Q84+60B48/BZLQ/Z9N/Vjqf/j325UZIr8uyb8LIcdA
   S8Yvsgv1f33hpqgkp2wC+hek3VvEtT+kuMwVgv9xbos07FLYe8TfmvvkR
   aAbPqMZw+jAr+EOkl9N0LMzZppk8yqMH3W2G2Xcg03/snkDtVRac9n4ld
   ucCqIy3U/MK9XuNFHaXugp/C0mBpSXZ9ZA10Gnf9PSZ7WZYUdcTvwaoVA
   FvuoJB1RX9miT4DsuDFUkqsK2gnMJ4/4oSphU17xd4K/zsYMJYXWTqWr1
   Q==;
X-CSE-ConnectionGUID: S0r1I2+/Q9my1DIVvmSKoA==
X-CSE-MsgGUID: 666S6RWDRTuhfyhYK1wNBA==
X-IronPort-AV: E=McAfee;i="6700,10204,11242"; a="17811029"
X-IronPort-AV: E=Sophos;i="6.11,247,1725346800"; 
   d="scan'208";a="17811029"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Oct 2024 14:06:48 -0700
X-CSE-ConnectionGUID: O+xkVIhiR0iD9CFoCHchMg==
X-CSE-MsgGUID: wpSKIrejSiGmBAY8BaH5ag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,247,1725346800"; 
   d="scan'208";a="87886034"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 31 Oct 2024 14:06:47 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t6cNQ-000gii-1c;
	Thu, 31 Oct 2024 21:06:44 +0000
Date: Fri, 1 Nov 2024 05:06:29 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, fanyizhen1995 <en_0015767@163.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 18663/30000]
 drivers/ub/urma/ubcore/ubcore_tp.c:40:17: warning: no previous prototype for
 'ubcore_get_mtu'
Message-ID: <202411010411.aKWhEHwD-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Yizhen,

FYI, the error/warning still remains.

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   c78205e40443cde6028b0539f30a00fda4167edd
commit: 832e9fe8cf1ed02211ff43bd4f3f16ddc2d69969 [18663/30000] ub: ubcore add create/delete tp table api
config: arm64-randconfig-003-20241029 (https://download.01.org/0day-ci/archive/20241101/202411010411.aKWhEHwD-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241101/202411010411.aKWhEHwD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411010411.aKWhEHwD-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/ub/urma/ubcore/ubcore_tp.c:40:17: warning: no previous prototype for 'ubcore_get_mtu' [-Wmissing-prototypes]
      40 | enum ubcore_mtu ubcore_get_mtu(int mtu)
         |                 ^~~~~~~~~~~~~~
   drivers/ub/urma/ubcore/ubcore_tp.c:75:19: warning: no previous prototype for 'ubcore_create_vtp' [-Wmissing-prototypes]
      75 | struct ubcore_tp *ubcore_create_vtp(struct ubcore_device *dev, const union ubcore_eid *remote_eid,
         |                   ^~~~~~~~~~~~~~~~~
   drivers/ub/urma/ubcore/ubcore_tp.c:83:5: warning: no previous prototype for 'ubcore_destroy_vtp' [-Wmissing-prototypes]
      83 | int ubcore_destroy_vtp(struct ubcore_tp *vtp)
         |     ^~~~~~~~~~~~~~~~~~


vim +/ubcore_get_mtu +40 drivers/ub/urma/ubcore/ubcore_tp.c

c75b0bccca77778 Yizhen Fan 2023-09-14  39  
c75b0bccca77778 Yizhen Fan 2023-09-14 @40  enum ubcore_mtu ubcore_get_mtu(int mtu)
c75b0bccca77778 Yizhen Fan 2023-09-14  41  {
c75b0bccca77778 Yizhen Fan 2023-09-14  42  	mtu = mtu - UB_PROTOCOL_HEAD_BYTES;
c75b0bccca77778 Yizhen Fan 2023-09-14  43  
c75b0bccca77778 Yizhen Fan 2023-09-14  44  	if (mtu >= ubcore_mtu_enum_to_int(UBCORE_MTU_8192))
c75b0bccca77778 Yizhen Fan 2023-09-14  45  		return UBCORE_MTU_8192;
c75b0bccca77778 Yizhen Fan 2023-09-14  46  	if (mtu >= ubcore_mtu_enum_to_int(UBCORE_MTU_4096))
c75b0bccca77778 Yizhen Fan 2023-09-14  47  		return UBCORE_MTU_4096;
c75b0bccca77778 Yizhen Fan 2023-09-14  48  	else if (mtu >= ubcore_mtu_enum_to_int(UBCORE_MTU_2048))
c75b0bccca77778 Yizhen Fan 2023-09-14  49  		return UBCORE_MTU_2048;
c75b0bccca77778 Yizhen Fan 2023-09-14  50  	else if (mtu >= ubcore_mtu_enum_to_int(UBCORE_MTU_1024))
c75b0bccca77778 Yizhen Fan 2023-09-14  51  		return UBCORE_MTU_1024;
c75b0bccca77778 Yizhen Fan 2023-09-14  52  	else if (mtu >= ubcore_mtu_enum_to_int(UBCORE_MTU_512))
c75b0bccca77778 Yizhen Fan 2023-09-14  53  		return UBCORE_MTU_512;
c75b0bccca77778 Yizhen Fan 2023-09-14  54  	else if (mtu >= ubcore_mtu_enum_to_int(UBCORE_MTU_256))
c75b0bccca77778 Yizhen Fan 2023-09-14  55  		return UBCORE_MTU_256;
c75b0bccca77778 Yizhen Fan 2023-09-14  56  	else
c75b0bccca77778 Yizhen Fan 2023-09-14  57  		return 0;
c75b0bccca77778 Yizhen Fan 2023-09-14  58  }
c75b0bccca77778 Yizhen Fan 2023-09-14  59  EXPORT_SYMBOL(ubcore_get_mtu);
c75b0bccca77778 Yizhen Fan 2023-09-14  60  

:::::: The code at line 40 was first introduced by commit
:::::: c75b0bccca77778d5663004cb19d3dd31ef71f0a ub: ubcore add get_mtu and other APIs that will be used by the driver.

:::::: TO: Yizhen Fan <fanyizhen@huawei.com>
:::::: CC: fanyizhen1995 <en_0015767@163.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
