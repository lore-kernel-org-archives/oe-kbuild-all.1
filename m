Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F213142C0B
	for <oe-kbuild-all@lists.linux.dev>; Thu, 15 May 2025 14:04:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747317895; cv=none; b=qy4+fijbKozNWm8TAqJ96z+2v8YBNsvsLT5X2uXTnUzHIrCT8UBeBhMV9khZbtWiGhuKAsransc3h03rK37VxbmzVmmrLf+wrm9sqpEnyHszKwv5uTOwnSNVlMQMneHRm6cwBpkPRC6ROgiIgUPQJohmlcjsvF9uRLwbFQx6oqk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747317895; c=relaxed/simple;
	bh=tpHldmc4sQAQqowdcWNiO1b4S96dltvj99/rk6lJ0CM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=pqlvOHEMbjL++rC+6qUEH021AVjfWfbVD0N4eS4r8RLGY+mO1JVsRelyByfsi3wOTeK//PBhU+Tb34pGi+p7foh4WvZBQp3GB8vN0pD4rWoa/rhJGna2kklQpY3+b21D7DTaVVeOS0C6iVfEfCJSQ8IDCg+TC08rPVVGBruqbm0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Wgwc+9Rv; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Wgwc+9Rv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747317894; x=1778853894;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=tpHldmc4sQAQqowdcWNiO1b4S96dltvj99/rk6lJ0CM=;
  b=Wgwc+9RvDTSK1PzYpl8fswRJDqox/SRcR8yO4a/ZJ7JKM+Zyi+vTRYSV
   /jEuoBdjjN1vm/86ig2K13i6UI1A17/paiRxv4IdjK9SSRW6eV34IUYn4
   byjo4WFQv5WmHiS826L2kMKQiNUzOLPCf3xoiMTP/Ga6ucznHryXv9PZx
   EcNuED39Ui3MfTtotE/I8D3Yeo7Q42XCr7seZXjm5BStUFzopmPk3s6Ut
   QqPE2jtJf17WjwwKq6HuTh7HO832KpRIKEF00/v1KurOSBg2eMdvBTJ34
   ZpRMrmLctig6lLWMOUWnyBAUsSIFChFUxPswVIsAxq1qoRv9ClNU0dRh6
   w==;
X-CSE-ConnectionGUID: hLcjSzOpR2G51sSPsp0B3Q==
X-CSE-MsgGUID: LPm4sjg9Tz6gsqegXDY+9g==
X-IronPort-AV: E=McAfee;i="6700,10204,11434"; a="48943620"
X-IronPort-AV: E=Sophos;i="6.15,291,1739865600"; 
   d="scan'208";a="48943620"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 May 2025 07:04:52 -0700
X-CSE-ConnectionGUID: mEGKVS77SlKfuGzhBDq0WA==
X-CSE-MsgGUID: t8NhSYodRRSPze0hYjj9oA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,291,1739865600"; 
   d="scan'208";a="138778837"
Received: from igk-lkp-server01.igk.intel.com (HELO a1decbf9c5f9) ([10.211.3.150])
  by fmviesa008.fm.intel.com with ESMTP; 15 May 2025 07:04:50 -0700
Received: from kbuild by a1decbf9c5f9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uFZCa-0000F5-1e;
	Thu, 15 May 2025 14:04:48 +0000
Date: Thu, 15 May 2025 22:04:21 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 2229/2229]
 drivers/crypto/ccp/hygon/csv-dev.c:882: warning: Function parameter or
 member 'api_major' not described in 'user_data_status'
Message-ID: <202505150837.6782gtth-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   a53913bacac4876eee9ce118b3101dff842318ef
commit: 518c81d56c055affc71650b1ad1ba7f86e5ee867 [2229/2229] arch/x86/kvm: Support tkm virtualization
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20250515/202505150837.6782gtth-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
rustc: rustc 1.73.0 (cc66ad468 2023-10-03)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250515/202505150837.6782gtth-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505150837.6782gtth-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/crypto/ccp/hygon/csv-dev.c:882: warning: Function parameter or member 'api_major' not described in 'user_data_status'
>> drivers/crypto/ccp/hygon/csv-dev.c:882: warning: Function parameter or member 'api_minor' not described in 'user_data_status'
>> drivers/crypto/ccp/hygon/csv-dev.c:882: warning: Function parameter or member 'reserved1' not described in 'user_data_status'


vim +882 drivers/crypto/ccp/hygon/csv-dev.c

   851	
   852	/**
   853	 * struct user_data_status - PLATFORM_STATUS command parameters
   854	 *
   855	 * @major: major API version
   856	 * @minor: minor API version
   857	 * @state: platform state
   858	 * @owner: self-owned or externally owned
   859	 * @chip_secure: ES or MP chip
   860	 * @fw_enc: is this FW is encrypted
   861	 * @fw_sign: is this FW is signed
   862	 * @config_es: platform config flags for csv-es
   863	 * @build: Firmware Build ID for this API version
   864	 * @bl_version_debug: Bootloader VERSION_DEBUG field
   865	 * @bl_version_minor: Bootloader VERSION_MINOR field
   866	 * @bl_version_major: Bootloader VERSION_MAJOR field
   867	 * @guest_count: number of active guests
   868	 * @reserved: should set to zero
   869	 */
   870	struct user_data_status {
   871		uint8_t api_major;		/* Out */
   872		uint8_t api_minor;		/* Out */
   873		uint8_t state;			/* Out */
   874		uint8_t owner : 1,		/* Out */
   875			chip_secure : 1,	/* Out */
   876			fw_enc : 1,		/* Out */
   877			fw_sign : 1,		/* Out */
   878			reserved1 : 4;		/*reserved*/
   879		uint32_t config_es : 1,		/* Out */
   880			build : 31;		/* Out */
   881		uint32_t guest_count;		/* Out */
 > 882	} __packed;
   883	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
