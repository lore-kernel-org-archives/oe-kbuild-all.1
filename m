Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C2EEDDA6
	for <oe-kbuild-all@lists.linux.dev>; Wed,  6 Mar 2024 01:48:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709689693; cv=none; b=ub3unlm3T5MZn2MbUP4sMGBwUWuQL2M3JVOH48VauG+DxylhXGNadhiTTGNS/vtGXWusWJdsFzbVd3Ai8JByRBtnwYrZb0KR3GzsQffM9aNdvidvzri5wQawOlPCa0j5DzrQRvLz+rQpbVuRXK5SHTVgAfLnpmqA6p+rykUyrrk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709689693; c=relaxed/simple;
	bh=82h4O2zmqUx14BY09vRC6vJqnKjCnasx1P2TkFB0nrk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=JH139Dqbg2A3BvqkFcfk4jqy5G819Xn81h9vXZXQiwykOtKaXKDgwFJp8Us3ObgGU271YReF0fkL23vUlH7J3EM6N6cfyIsz5KJ04cOQvlGShj5uvqCIqBZtJqLN9zeRtDm8IRRanrd4nv9I3XohVHvbysAbsoqU5wN6KaiIwS4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=S54QG3tS; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="S54QG3tS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709689692; x=1741225692;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=82h4O2zmqUx14BY09vRC6vJqnKjCnasx1P2TkFB0nrk=;
  b=S54QG3tS5OPews988mAfjaXWqoLZ/xxqYetIkWzT7QECBfaXfFNq0ydi
   Z/D5mWNKpYogjLGdn4qroyHuIy/MZJwr9xqLwOkc+UE2dgvwkKfx3K6ug
   tQICjh2AzJyiBao2jutkpJu/fWz06DeHx7Y+O8XsEPkNrA0DpQiL2KcSA
   HSBzDJ7tqKoCw5PEWdVYxUiv+REbYWLOS4bjBS/uK+149aKXgkUOaTeSF
   i9VemnQNr1aS0K0lxceSmwfTfXSSPRFeaAjLvBAEi4AisRrOeADLEMi7W
   KF+2B2jGrnZJQY2ymUDHmMSwB0ffFeoxrtzpIDNHfpOmJGtJ4a7dwSstK
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11004"; a="4207047"
X-IronPort-AV: E=Sophos;i="6.06,207,1705392000"; 
   d="scan'208";a="4207047"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Mar 2024 17:48:11 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,207,1705392000"; 
   d="scan'208";a="14240641"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 05 Mar 2024 17:48:07 -0800
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rhgO4-0003ph-05;
	Wed, 06 Mar 2024 01:48:04 +0000
Date: Wed, 6 Mar 2024 09:47:57 +0800
From: kernel test robot <lkp@intel.com>
To: jasperwang@tencent.com, kaixuxia@tencent.com, frankjpliu@tencent.com,
	kasong@tencent.com, sagazchen@tencent.com, kernelxing@tencent.com,
	aurelianliu@tencent.com, jason.zeng@intel.com, wu.zheng@intel.com,
	yingbao.jia@intel.com, pei.p.jia@intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [opencloudos:linux-5.4/next 27259/27434]
 drivers/i2c/busses/i2c-xgene-slimpro.c:96: warning: "PCC_SIGNATURE"
 redefined
Message-ID: <202403060942.MuVGlHNs-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/OpenCloudOS/OpenCloudOS-Kernel.git linux-5.4/next
head:   0e88d1c26496999d1b2e37f3393b602d28b03faf
commit: 89c467101f1a19edad32a28c584c49243739313f [27259/27434] ACPI: PCC: Add PCC shared memory region command and status bitfields
config: arm64-randconfig-004-20240305 (https://download.01.org/0day-ci/archive/20240306/202403060942.MuVGlHNs-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240306/202403060942.MuVGlHNs-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403060942.MuVGlHNs-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/i2c/busses/i2c-xgene-slimpro.c:96: warning: "PCC_SIGNATURE" redefined
      96 | #define PCC_SIGNATURE                   0x50424300
         | 
   In file included from drivers/i2c/busses/i2c-xgene-slimpro.c:12:
   include/acpi/pcc.h:22: note: this is the location of the previous definition
      22 | #define PCC_SIGNATURE                   0x50434300
         | 


vim +/PCC_SIGNATURE +96 drivers/i2c/busses/i2c-xgene-slimpro.c

df5da47fe722e3 Hoan Tran 2017-04-24   94  
df5da47fe722e3 Hoan Tran 2017-04-24   95  /* PCC related defines */
df5da47fe722e3 Hoan Tran 2017-04-24  @96  #define PCC_SIGNATURE			0x50424300
df5da47fe722e3 Hoan Tran 2017-04-24   97  #define PCC_STS_CMD_COMPLETE		BIT(0)
df5da47fe722e3 Hoan Tran 2017-04-24   98  #define PCC_STS_SCI_DOORBELL		BIT(1)
df5da47fe722e3 Hoan Tran 2017-04-24   99  #define PCC_STS_ERR			BIT(2)
df5da47fe722e3 Hoan Tran 2017-04-24  100  #define PCC_STS_PLAT_NOTIFY		BIT(3)
df5da47fe722e3 Hoan Tran 2017-04-24  101  #define PCC_CMD_GENERATE_DB_INT		BIT(15)
df5da47fe722e3 Hoan Tran 2017-04-24  102  

:::::: The code at line 96 was first introduced by commit
:::::: df5da47fe722e36055b97134e6bb9df58c12495c i2c: xgene-slimpro: Add ACPI support by using PCC mailbox

:::::: TO: Hoan Tran <hotran@apm.com>
:::::: CC: Wolfram Sang <wsa@the-dreams.de>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
