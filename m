Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8ABC1474BA
	for <oe-kbuild-all@lists.linux.dev>; Thu, 11 Apr 2024 11:13:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712834009; cv=none; b=FGZlMTYkALymcMWMAw9SMreIUxtlbVOZbtS7mPQyteDLohPQ0ZJH7vmHO3DtJMdw7J3kNcgXuUyhY6FadNWkDv+GpVRq8ruGEt/u1W6DqmF05N7F0THamBVq6e3tiL+28anfseKqdhRtRqEck8/u39nmnIuhwQ5LN0Em6ZMlV/c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712834009; c=relaxed/simple;
	bh=Hc8TDJAJSUkUXX9GrDxV7kpEGHwyKBjYSpZ2z55aDeY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=unCShfdfH/EeS0VcSite+Cyq/E8CsxdGkF4u0QywSXXTCb8f4xBo/vYW+UyTwv20p76ytuchkMM9Lt97Gs46Mwrh4XiQz1toGEhtX0GIbZ/vLt+XCsJVIVEJc0u6IC4Ui7e+7/XWodlFewTH3di+flx7FqO8gKvq+gsSHGwAvMg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=B+jwbR15; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="B+jwbR15"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712834007; x=1744370007;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Hc8TDJAJSUkUXX9GrDxV7kpEGHwyKBjYSpZ2z55aDeY=;
  b=B+jwbR15cZYR57i4X0xRob6xXzP8hK+ZkEdH7stq0wLH24uorJ1kuxC+
   EewKV6OeeRsAwD18hBNyBhxoJ2FGEsk7lMppsd0gpiUPYI/0LO3b1z1jY
   TlN/LZBYfbhtPhn4iaqxi3FniscR1gk7KcuY6Vz6TfVKKNY8oaREjJItv
   XKqqIPUt5M8Y8mrPZNg/qQU/rAzJx5mkesli9syMlC8rjmvCEHkCFBBjZ
   LhSpkzNPkI6TO9MTeFTtQrBD1dXippxVjnaNufS1fhKkbr0fIYOFXtHSi
   /+UONLDc1GcpO/eRJXYfZGMVHYr1fUguTILGBRdKULXZ7aw2sPVaHQCKd
   w==;
X-CSE-ConnectionGUID: qYokQBbzSyutuBjcm7MLqg==
X-CSE-MsgGUID: rqv9jo6WTY+0hLGXPFhhyA==
X-IronPort-AV: E=McAfee;i="6600,9927,11039"; a="8796827"
X-IronPort-AV: E=Sophos;i="6.07,193,1708416000"; 
   d="scan'208";a="8796827"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Apr 2024 04:13:27 -0700
X-CSE-ConnectionGUID: MBzv4PWeQXe4tAlFalDLkQ==
X-CSE-MsgGUID: BoBzDVN+Q5O6pkS5ODfJpw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,193,1708416000"; 
   d="scan'208";a="21304110"
Received: from lkp-server01.sh.intel.com (HELO e61807b1d151) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 11 Apr 2024 04:13:25 -0700
Received: from kbuild by e61807b1d151 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rusMt-0008Xp-00;
	Thu, 11 Apr 2024 11:13:23 +0000
Date: Thu, 11 Apr 2024 19:12:36 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:6.1-2.2.x-imx 16083/18110]
 drivers/tee/crypto/tee_skcipher.c:466:5: warning: no previous prototype for
 'tee_crypt_algapi_init'
Message-ID: <202404111949.7bOGXiEH-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Freescale/linux-fslc 6.1-2.2.x-imx
head:   2bfda7392e6621dd9060f87d7f9d601bb1906dbf
commit: 870b422ad2a9ff02bd142262e4d7845159682c52 [16083/18110] tee: crypto: enable support for skcipher
config: arm64-defconfig (https://download.01.org/0day-ci/archive/20240411/202404111949.7bOGXiEH-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240411/202404111949.7bOGXiEH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404111949.7bOGXiEH-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/tee/crypto/tee_skcipher.c:466:5: warning: no previous prototype for 'tee_crypt_algapi_init' [-Wmissing-prototypes]
     466 | int tee_crypt_algapi_init(void)
         |     ^~~~~~~~~~~~~~~~~~~~~
>> drivers/tee/crypto/tee_skcipher.c:493:6: warning: no previous prototype for 'tee_crypt_algapi_exit' [-Wmissing-prototypes]
     493 | void tee_crypt_algapi_exit(void)
         |      ^~~~~~~~~~~~~~~~~~~~~


vim +/tee_crypt_algapi_init +466 drivers/tee/crypto/tee_skcipher.c

   465	
 > 466	int tee_crypt_algapi_init(void)
   467	{
   468		int i = 0, ret = 0;
   469		bool registered = false;
   470	
   471		for (i = 0; i < ARRAY_SIZE(driver_algs); i++) {
   472			struct tee_crypt_skcipher_alg *t_alg = driver_algs + i;
   473	
   474			tee_crypt_skcipher_alg_init(t_alg);
   475	
   476			ret = crypto_register_skcipher(&t_alg->skcipher);
   477			if (ret) {
   478				pr_warn("%s alg registration failed\n",
   479					t_alg->skcipher.base.cra_driver_name);
   480				continue;
   481			}
   482	
   483			t_alg->registered = true;
   484			registered = true;
   485		}
   486	
   487		if (registered)
   488			pr_info("tee_crypt algorithms registered in /proc/crypto\n");
   489	
   490		return ret;
   491	}
   492	
 > 493	void tee_crypt_algapi_exit(void)
   494	{
   495		int i;
   496	
   497		for (i = 0; i < ARRAY_SIZE(driver_algs); i++) {
   498			struct tee_crypt_skcipher_alg *t_alg = driver_algs + i;
   499	
   500			if (t_alg->registered)
   501				crypto_unregister_skcipher(&t_alg->skcipher);
   502		}
   503	}
   504	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
