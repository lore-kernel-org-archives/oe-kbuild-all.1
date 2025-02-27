Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64A952B9B7
	for <oe-kbuild-all@lists.linux.dev>; Thu, 27 Feb 2025 02:57:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740625039; cv=none; b=nhhNCeJ3wCQgnjDRdlxkAfRpWRfA/IEf0feQTZLb13vdRGnMTKphdQ+/A0Kf/dPcZEy2lTuUkokHhphK9xStMH0RWGSRkQXk2TFf08ukS6yZzIMaYVGYQAJ8USRTb+UyapaYlqaqcitlHpTWSsgMicMKG2ugtYqW8cLTJs8Itgk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740625039; c=relaxed/simple;
	bh=JTRIgRfCzvV/T28LQkIN1UCXqLi2mL4MLhGPu5wRyaQ=;
	h=Date:From:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=c5kzDb8xF7Qlr4dw9nVWfHinwz726eIiO3E5tMMCxjBE0cb8If9dkgEGNCJNEwOHqKgXGwODvVoBla9eGd4CqTx9sqwlaSTMF7c46/9WjTMlAwFhI+3JbAG8kp2hbnf04cPQnA5BF70EVQRnZTAr+rllMhvBJ2y/Jx5VEOhmZm4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SnqkP41O; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SnqkP41O"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740625037; x=1772161037;
  h=date:from:cc:subject:message-id:mime-version;
  bh=JTRIgRfCzvV/T28LQkIN1UCXqLi2mL4MLhGPu5wRyaQ=;
  b=SnqkP41OpbEMbKCW3rt68KDQxPfVQAGqfZ0NfUvXVdKhUBzrZ+1Vz0Db
   C+CZN+YiOf/ZrE8QRAmAfKzJP6rWc3/CCsZtDCLsl9WlMS0UYTj34cf58
   beuo+R4dz2Lp+HcrN4qSwqBtItl5OBicE8nasarJOH7dGPYtUT2VRATlV
   fFE0+BnyvZwE9MR+PAElODeRW//SvSv91trnz2Jpg7IaES0Wj1th0kf1W
   Lrb9vm5MIMqkQoQ9HK6EbxwNqRxIRodVk+Q87KiYPkPyOmNqwOcNMl5Vi
   1ayqGiCvW5l0876hAy24RB4DkLt6ZGWPC9VKNTnOExjFsu1ISvrzZt3Ep
   A==;
X-CSE-ConnectionGUID: dIN18OmPTP6DOWuxRuqVpQ==
X-CSE-MsgGUID: lLl8B3V4QRmseQrNfblfdA==
X-IronPort-AV: E=McAfee;i="6700,10204,11357"; a="45412295"
X-IronPort-AV: E=Sophos;i="6.13,319,1732608000"; 
   d="scan'208";a="45412295"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Feb 2025 18:57:15 -0800
X-CSE-ConnectionGUID: ljEvFjKARvipyQNr+sddnA==
X-CSE-MsgGUID: M9HRAgKvTUCsPzSgZtsnaw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="122147586"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by orviesa005.jf.intel.com with ESMTP; 26 Feb 2025 18:57:14 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tnU5H-000ClO-1f
	for oe-kbuild-all@lists.linux.dev;
	Thu, 27 Feb 2025 02:57:11 +0000
Date: Thu, 27 Feb 2025 10:57:06 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [intel-lts:pr/69 1/1]
 drivers/net/ethernet/mellanox/mlxsw/i2c.c:49:19: warning:
 'mlxsw_i2c_driver_name' defined but not used
Message-ID: <202502271024.BXrq2403-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/intel/linux-intel-lts.git pr/69
head:   f36ea6678b4077d9bbb4644e73977fb91d187ab7
commit: 8122e08b1d876b9af605db5ad351961c5ea276ed [1/1] Allow Mellanox switch devices to be configured if only I2C bus is set
config: powerpc64-randconfig-002-20250224 (https://download.01.org/0day-ci/archive/20250227/202502271024.BXrq2403-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250227/202502271024.BXrq2403-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502271024.BXrq2403-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/net/ethernet/mellanox/mlxsw/i2c.c:49:19: warning: 'mlxsw_i2c_driver_name' defined but not used [-Wunused-const-variable=]
    static const char mlxsw_i2c_driver_name[] = "mlxsw_i2c";
                      ^~~~~~~~~~~~~~~~~~~~~


vim +/mlxsw_i2c_driver_name +49 drivers/net/ethernet/mellanox/mlxsw/i2c.c

6882b0aee180f2 Vadim Pasternak 2016-11-16  48  
6882b0aee180f2 Vadim Pasternak 2016-11-16 @49  static const char mlxsw_i2c_driver_name[] = "mlxsw_i2c";
6882b0aee180f2 Vadim Pasternak 2016-11-16  50  

:::::: The code at line 49 was first introduced by commit
:::::: 6882b0aee180f2797b8803bdf699aa45c2e5f2d6 mlxsw: Introduce support for I2C bus

:::::: TO: Vadim Pasternak <vadimp@mellanox.com>
:::::: CC: David S. Miller <davem@davemloft.net>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
