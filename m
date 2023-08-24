Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1636B2454A
	for <oe-kbuild-all@lists.linux.dev>; Thu, 24 Aug 2023 10:51:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692874316; x=1724410316;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=k6Xc+QX1wcKslecdfxQ7XpLx00Sl3oMjF5/XZkprmyI=;
  b=Ylm1iMfxNQk9bBbWWbGNgEkxTesxqFxPuysVlWggcOMLGjSGr6DAEvot
   mfBh/yTW3JYsdyu9UnN2XLJuBw9aR4QsO5n5ScB+HAmpOohoGmFaZpNyP
   KJUvtYLZN0tLE0xdiQyKdPs+CV+8+QDSYbHtz+X3lC4NqPv1OrbcvZk7+
   VL5+2UwJSIKMzSyyK/yFz81w9e7u3JFjTWHdzkl+WZhz3B2rOHhUZcZXR
   kugKrpIAqb3LZoIBWr6uas/i5pCMbkmBUHSB5i8d49Aw+wZTrYnz9/FRf
   F29v58rpSlo2kjG0+N2GQCtPg9Ilp//YECImaY8qMl6pMBKFnYjSmE9SB
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10811"; a="405412500"
X-IronPort-AV: E=Sophos;i="6.01,195,1684825200"; 
   d="scan'208";a="405412500"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Aug 2023 03:51:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10811"; a="807086359"
X-IronPort-AV: E=Sophos;i="6.01,195,1684825200"; 
   d="scan'208";a="807086359"
Received: from lkp-server02.sh.intel.com (HELO daf8bb0a381d) ([10.239.97.151])
  by fmsmga004.fm.intel.com with ESMTP; 24 Aug 2023 03:51:48 -0700
Received: from kbuild by daf8bb0a381d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qZ7wK-0001xM-0e;
	Thu, 24 Aug 2023 10:51:48 +0000
Date: Thu, 24 Aug 2023 18:51:17 +0800
From: kernel test robot <lkp@intel.com>
To: Maximilian Luz <luzmaximilian@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, Steev Klimaszewski <steev@kali.org>,
	Johan Hovold <johan+linaro@kernel.org>
Subject: [steev:lenovo-x13s-v6.5-rc7 64/129] qcom_qseecom.c:undefined
 reference to `qcom_scm_qseecom_app_get_id'
Message-ID: <202308241803.B1JiVfOX-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/steev/linux lenovo-x13s-v6.5-rc7
head:   68f425346397c1806f828d4ee58e9468c924f408
commit: e54a5193d61abc174dff575a57c7530d0b62863f [64/129] firmware: Add support for Qualcomm UEFI Secure Application
config: nios2-allmodconfig (https://download.01.org/0day-ci/archive/20230824/202308241803.B1JiVfOX-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230824/202308241803.B1JiVfOX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308241803.B1JiVfOX-lkp@intel.com/

All errors (new ones prefixed by >>):

   nios2-linux-ld: drivers/firmware/qcom_qseecom.o: in function `qcom_qseecom_probe':
>> qcom_qseecom.c:(.text+0x80): undefined reference to `qcom_scm_qseecom_app_get_id'
   qcom_qseecom.c:(.text+0x80): relocation truncated to fit: R_NIOS2_CALL26 against `qcom_scm_qseecom_app_get_id'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
