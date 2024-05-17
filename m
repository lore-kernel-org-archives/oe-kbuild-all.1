Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DA853F8D6
	for <oe-kbuild-all@lists.linux.dev>; Fri, 17 May 2024 11:48:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715946500; cv=none; b=qJlBgM0Q2qE5THYF9T5twJvY8JmkQXEOBnJMeogYjmCYoczxtBsp5MhGyLjV9RdMb4RidYzk4crnwouCc04DHFy6F1vplFZcqLvgQUwKQx9owm8ml128lr7of8nUJDwVBBma3AsFmmDS9cLOPQYqaVgauVIuWkiq+fFfPMa1OPo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715946500; c=relaxed/simple;
	bh=nikJ1fsDGO4WnA6h31ZyJKvVmVJAsMLlTOtBrwi/fwk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=NxN4gS36NAc6Yk3JEdF9hkWDait+1KP1644ws4q7V4r45d6t1fAVIIsGJfoMVtdqmVoILB1T0vkO7QyeoCaDvB/BMZSfUkE8Fqc9GnZyX93DP+qX4Lz/OAzDBM9LQeDzn88HCwrx+mV5tzM3kAt6vQMiJ6r+4INJ35JUrzVxSGs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mSyn+nDn; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mSyn+nDn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715946499; x=1747482499;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=nikJ1fsDGO4WnA6h31ZyJKvVmVJAsMLlTOtBrwi/fwk=;
  b=mSyn+nDnQI6JPy6UwgTR2staM8B0nd0z2UAjpBwiicTsU7JwEaRLXwtD
   M7tJnYCBMTygjRQJSBvG7W5Gf6jJLk3R7gWkMUO+crX+pZetzqYH6Zcbv
   m71qziLBbbKLsxtEwqz/DpZMUYw39M5xVbjXa0nbbaxsoyPvZTHh5tQ1L
   9oA1QRoTLSUABUVN+qVXyi1FLewzFytsrovA9oR7d4tcupMrlniPfDI5J
   ddJ+LtPxcGV2V8+9CyNmhd//eZR6cKrxnz6GUribjscbP61cTLExHQ3+z
   PObrKzOBTdXImZuSzd0Vro7sxczuIg5APp+DuRARAnEWzEnU0LCGfrApX
   g==;
X-CSE-ConnectionGUID: ygVYfGInQ9q+ygnc1lrtww==
X-CSE-MsgGUID: GrlDJ2j+TF+gz/8cfEJ42Q==
X-IronPort-AV: E=McAfee;i="6600,9927,11074"; a="12227429"
X-IronPort-AV: E=Sophos;i="6.08,167,1712646000"; 
   d="scan'208";a="12227429"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 May 2024 04:48:18 -0700
X-CSE-ConnectionGUID: KLiAAOsbSqeFeWZeVxqKjw==
X-CSE-MsgGUID: vXsw0FewSSu2k37+KnTwPw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,167,1712646000"; 
   d="scan'208";a="31764208"
Received: from unknown (HELO 108735ec233b) ([10.239.97.151])
  by fmviesa008.fm.intel.com with ESMTP; 17 May 2024 04:48:15 -0700
Received: from kbuild by 108735ec233b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s7w4K-0000cy-2w;
	Fri, 17 May 2024 11:48:12 +0000
Date: Fri, 17 May 2024 19:47:19 +0800
From: kernel test robot <lkp@intel.com>
To: jasperwang@tencent.com, kaixuxia@tencent.com, frankjpliu@tencent.com,
	kasong@tencent.com, sagazchen@tencent.com, kernelxing@tencent.com,
	aurelianliu@tencent.com, jason.zeng@intel.com, wu.zheng@intel.com,
	yingbao.jia@intel.com, pei.p.jia@intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [opencloudos:next 6624/6628] drivers/crypto/ccp/hygon/csv-dev.c:990:
 warning: Function parameter or member 'api_major' not described in
 'user_data_status'
Message-ID: <202405171928.7wsoYdRG-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/OpenCloudOS/OpenCloudOS-Kernel.git next
head:   95dac159be359bc7ba42421426462f1a96f50ee9
commit: fc090cfaabd5c1c45916e41c09a388c254ac9505 [6624/6628] Support tkm virtualization
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20240517/202405171928.7wsoYdRG-lkp@intel.com/config)
compiler: gcc-13 (Ubuntu 13.2.0-4ubuntu3) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240517/202405171928.7wsoYdRG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405171928.7wsoYdRG-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/crypto/ccp/hygon/csv-dev.c:990: warning: Function parameter or member 'api_major' not described in 'user_data_status'
>> drivers/crypto/ccp/hygon/csv-dev.c:990: warning: Function parameter or member 'api_minor' not described in 'user_data_status'
>> drivers/crypto/ccp/hygon/csv-dev.c:990: warning: Function parameter or member 'reserved1' not described in 'user_data_status'


vim +990 drivers/crypto/ccp/hygon/csv-dev.c

   959	
   960	/**
   961	 * struct user_data_status - PLATFORM_STATUS command parameters
   962	 *
   963	 * @major: major API version
   964	 * @minor: minor API version
   965	 * @state: platform state
   966	 * @owner: self-owned or externally owned
   967	 * @chip_secure: ES or MP chip
   968	 * @fw_enc: is this FW is encrypted
   969	 * @fw_sign: is this FW is signed
   970	 * @config_es: platform config flags for csv-es
   971	 * @build: Firmware Build ID for this API version
   972	 * @bl_version_debug: Bootloader VERSION_DEBUG field
   973	 * @bl_version_minor: Bootloader VERSION_MINOR field
   974	 * @bl_version_major: Bootloader VERSION_MAJOR field
   975	 * @guest_count: number of active guests
   976	 * @reserved: should set to zero
   977	 */
   978	struct user_data_status {
   979		uint8_t api_major;		/* Out */
   980		uint8_t api_minor;		/* Out */
   981		uint8_t state;			/* Out */
   982		uint8_t owner : 1,		/* Out */
   983			chip_secure : 1,	/* Out */
   984			fw_enc : 1,		/* Out */
   985			fw_sign : 1,		/* Out */
   986			reserved1 : 4;		/*reserved*/
   987		uint32_t config_es : 1,		/* Out */
   988			build : 31;		/* Out */
   989		uint32_t guest_count;		/* Out */
 > 990	} __packed;
   991	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
