Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A62864431
	for <oe-kbuild-all@lists.linux.dev>; Mon, 23 Sep 2024 03:19:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727061580; cv=none; b=I758CYpIMTIpU6gX37EInjapWWa6DQZphZoaNYEcaNVPKuu1rOFTlTs2eRgyyGAz1xjBG0FEFFG+ogU+/GKf135OQTLfvM4EE9VkMR33xWwzV/RaoQYDTWBzSNuu45nEJ3O/BoHRLp7AS8Vzl4QnqiVyFDLTH0ZAEeqHOYauPd4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727061580; c=relaxed/simple;
	bh=jxcaJyze9qcR5OdsUCpkyv0HHeT2S3zhHGC459sH3AY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=FatK1I+tIXkqgOjpGdtkD2ykHJRTtQ6C5ALWh6Z1k9Z5orhEPrwEGN3klNNN6iOaMvEi/5fBWaxXMFcVCuDL6rH3TiZUCbiu7Ew3+rsPd92JCPJMQU+Dg7EkN0FiuAXmhZG/Jmf2rDBei6yinUeqt/dkXeQIFpCm2aGQu42VKk8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ausiz1TU; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ausiz1TU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727061579; x=1758597579;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=jxcaJyze9qcR5OdsUCpkyv0HHeT2S3zhHGC459sH3AY=;
  b=ausiz1TUYlSAjn3Yc7sZmXHlLu7W3wbvQdtTqdAsa3dTt2preIHA9nxL
   SHgBUEwg5Suw7vEynx1QZFpIe6B0s7n0lA/dSBf69BL/W0YrI8cdAep3U
   aQQY346lBA20x5dqu/tzFaxcaQD2Ua1eTXGzk70Vrs26xaAyHimcJUHGg
   nHNXkKg9dPN0q9SydULI2vwvCIC9VN5El8Hwm74QB4lFFbICsXvohCDLQ
   lmvBeZh1feGWW8HGOeJvFd/h9XHGC647kVyvlbgSoeEffy/55NowooDlm
   Q0Mjaf66BOf+kdD3U6ecuOqUoCLLIcktxXOzdN1t+tnDfitiKwNREM/8N
   g==;
X-CSE-ConnectionGUID: pazFGyxpTYGu+NrGYiVwkw==
X-CSE-MsgGUID: pfld7TTtQVSiUot2X6RSxQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11202"; a="37363193"
X-IronPort-AV: E=Sophos;i="6.10,250,1719903600"; 
   d="scan'208";a="37363193"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Sep 2024 20:19:36 -0700
X-CSE-ConnectionGUID: Mshl01+bTou1Zef9Inmjzg==
X-CSE-MsgGUID: I1qtWH3sRVueX86iAIikwg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,250,1719903600"; 
   d="scan'208";a="70526097"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 22 Sep 2024 20:19:35 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ssZbo-000GrT-2A;
	Mon, 23 Sep 2024 03:19:32 +0000
Date: Mon, 23 Sep 2024 11:19:03 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, fanyizhen1995 <en_0015767@163.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 19323/30000]
 drivers/ub/urma/ubcore/ubcore_tp.c:40:17: warning: no previous prototype for
 'ubcore_get_mtu'
Message-ID: <202409231141.HzIwAaRi-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   108b9a92793f61e1abf94d341c676515421e57a2
commit: 832e9fe8cf1ed02211ff43bd4f3f16ddc2d69969 [19323/30000] ub: ubcore add create/delete tp table api
config: arm64-randconfig-004-20240912 (https://download.01.org/0day-ci/archive/20240923/202409231141.HzIwAaRi-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240923/202409231141.HzIwAaRi-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409231141.HzIwAaRi-lkp@intel.com/

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

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for PGP_KEY_PARSER
   Depends on [n]: CRYPTO [=y] && ASYMMETRIC_KEY_TYPE [=y] && ASYMMETRIC_PUBLIC_KEY_SUBTYPE [=n]
   Selected by [y]:
   - PGP_PRELOAD [=y] && CRYPTO [=y] && ASYMMETRIC_KEY_TYPE [=y]


vim +/ubcore_get_mtu +40 drivers/ub/urma/ubcore/ubcore_tp.c

c75b0bccca7777 Yizhen Fan 2023-09-14  39  
c75b0bccca7777 Yizhen Fan 2023-09-14 @40  enum ubcore_mtu ubcore_get_mtu(int mtu)
c75b0bccca7777 Yizhen Fan 2023-09-14  41  {
c75b0bccca7777 Yizhen Fan 2023-09-14  42  	mtu = mtu - UB_PROTOCOL_HEAD_BYTES;
c75b0bccca7777 Yizhen Fan 2023-09-14  43  
c75b0bccca7777 Yizhen Fan 2023-09-14  44  	if (mtu >= ubcore_mtu_enum_to_int(UBCORE_MTU_8192))
c75b0bccca7777 Yizhen Fan 2023-09-14  45  		return UBCORE_MTU_8192;
c75b0bccca7777 Yizhen Fan 2023-09-14  46  	if (mtu >= ubcore_mtu_enum_to_int(UBCORE_MTU_4096))
c75b0bccca7777 Yizhen Fan 2023-09-14  47  		return UBCORE_MTU_4096;
c75b0bccca7777 Yizhen Fan 2023-09-14  48  	else if (mtu >= ubcore_mtu_enum_to_int(UBCORE_MTU_2048))
c75b0bccca7777 Yizhen Fan 2023-09-14  49  		return UBCORE_MTU_2048;
c75b0bccca7777 Yizhen Fan 2023-09-14  50  	else if (mtu >= ubcore_mtu_enum_to_int(UBCORE_MTU_1024))
c75b0bccca7777 Yizhen Fan 2023-09-14  51  		return UBCORE_MTU_1024;
c75b0bccca7777 Yizhen Fan 2023-09-14  52  	else if (mtu >= ubcore_mtu_enum_to_int(UBCORE_MTU_512))
c75b0bccca7777 Yizhen Fan 2023-09-14  53  		return UBCORE_MTU_512;
c75b0bccca7777 Yizhen Fan 2023-09-14  54  	else if (mtu >= ubcore_mtu_enum_to_int(UBCORE_MTU_256))
c75b0bccca7777 Yizhen Fan 2023-09-14  55  		return UBCORE_MTU_256;
c75b0bccca7777 Yizhen Fan 2023-09-14  56  	else
c75b0bccca7777 Yizhen Fan 2023-09-14  57  		return 0;
c75b0bccca7777 Yizhen Fan 2023-09-14  58  }
c75b0bccca7777 Yizhen Fan 2023-09-14  59  EXPORT_SYMBOL(ubcore_get_mtu);
c75b0bccca7777 Yizhen Fan 2023-09-14  60  

:::::: The code at line 40 was first introduced by commit
:::::: c75b0bccca77778d5663004cb19d3dd31ef71f0a ub: ubcore add get_mtu and other APIs that will be used by the driver.

:::::: TO: Yizhen Fan <fanyizhen@huawei.com>
:::::: CC: fanyizhen1995 <en_0015767@163.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
