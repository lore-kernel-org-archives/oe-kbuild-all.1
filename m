Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 460ED43F0AA
	for <oe-kbuild-all@lists.linux.dev>; Wed, 29 Jul 2026 08:51:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785315104; cv=none; b=UlI57tdTv3CIucHjuVG7m66lIQFicLK17fe0JNfA+kmFE9Iawoa9iAr4mEMRLb+kp8q+SPAKFXJwfOJF3eB1X9rQ60llOj7Tc768j/Cqj1XXWk1DwEXrzFD6CKXh459QNEqhJTqtRM8FmZQQOKhjo5gHUyBwGpoK5mLpmog9CTk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785315104; c=relaxed/simple;
	bh=MnzVRMYP7baduYqaNi5wcXwzGjBoCOILcMB2T6y4zeM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=bujKiqnoHMo9NZVNQsucLs7eaXx90/l5AQd9tj2IqAuBx0RlHvKklLtycCI/pqUvaoCBDSNi5F/wm9xVAaECRYiCVhOlnk5KXoDKi7kvgQKK8d+TlMuDDbt9h46QNRnYHfwPeLnf+eUooK37RVITdj+S6s2SZFMO08RmOf8ekJs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aqg96LR/; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aqg96LR/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785315101; x=1816851101;
  h=date:from:to:cc:subject:message-id;
  bh=MnzVRMYP7baduYqaNi5wcXwzGjBoCOILcMB2T6y4zeM=;
  b=aqg96LR/o1AY8zNeOXLUtx4I0l3NnChwta1EjHU3POv/VHTLvo6pZP1p
   FvJ5lFhdXjl1PaAvCTVWK3LlCEoyW72UxojqJ8TH3B8Jt0l7ro02HRkf4
   idUiKybNDeHtkXtsgjATRS4gx2Ty3nqKPix6t6wacC9JFNYtadrfA6pQW
   QfSvpY0wT3VrxNnwixoPkcXv3SPPHbpzd5Jzr3KNKYoR8g//pUEK7Nu2A
   TyqBl2cFf0OQgojKTBTLusrB0OkdjvFgb87NP9nZEB0B2dVWpkhdisEh8
   RphAZ18me8k+O3AfTTIBzEna2PzzT0WRazE98dvnhzc/TcAbW0AMXX9mC
   A==;
X-CSE-ConnectionGUID: z86qFJYbTGiE8ZxgPlzazw==
X-CSE-MsgGUID: FBt5aeLPTWyVqRSTd8R9DA==
X-IronPort-AV: E=McAfee;i="6800,10657,11859"; a="85928921"
X-IronPort-AV: E=Sophos;i="6.25,192,1779174000"; 
   d="scan'208";a="85928921"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jul 2026 01:51:40 -0700
X-CSE-ConnectionGUID: TVj5h91OSAimj4wuH7eWlQ==
X-CSE-MsgGUID: LWFCYED5Qc2LSwIKrR3Epw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,192,1779174000"; 
   d="scan'208";a="289901148"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 29 Jul 2026 01:51:39 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wp00b-00000000fDD-3YeE;
	Wed, 29 Jul 2026 08:51:28 +0000
Date: Wed, 29 Jul 2026 16:50:56 +0800
From: kernel test robot <lkp@intel.com>
To: Daniel Palmer <daniel@0x0f.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chenxing:mstar_v6_5_reorder 558/700]
 include/linux/mod_devicetable.h:285:28: error: 'CONFIG_OF_COMPATIBLE_MAX_LEN'
 undeclared here (not in a function)
Message-ID: <202607291612.jtZNCBCk-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/linux-chenxing/linux.git mstar_v6_5_reorder
head:   1a5c60e65ea399670a5384b869c4958338af2799
commit: b7d5076da46c7e185995d14f63385bc05766ff08 [558/700] of: Allow the user to override the maximum length of compatible strings
config: alpha-allnoconfig (https://download.01.org/0day-ci/archive/20260729/202607291612.jtZNCBCk-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260729/202607291612.jtZNCBCk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607291612.jtZNCBCk-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from scripts/mod/devicetable-offsets.c:3:
>> include/linux/mod_devicetable.h:285:28: error: 'CONFIG_OF_COMPATIBLE_MAX_LEN' undeclared here (not in a function)
     285 |         char    compatible[CONFIG_OF_COMPATIBLE_MAX_LEN];
         |                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   make[3]: *** [scripts/Makefile.build:116: scripts/mod/devicetable-offsets.s] Error 1
   make[3]: Target 'scripts/mod/' not remade because of errors.
   make[2]: *** [Makefile:1286: prepare0] Error 2
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:234: __sub-make] Error 2
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:234: __sub-make] Error 2
   make: Target 'prepare' not remade because of errors.


vim +/CONFIG_OF_COMPATIBLE_MAX_LEN +285 include/linux/mod_devicetable.h

   278	
   279	/*
   280	 * Struct used for matching a device
   281	 */
   282	struct of_device_id {
   283		char	name[32];
   284		char	type[32];
 > 285		char	compatible[CONFIG_OF_COMPATIBLE_MAX_LEN];
   286		const void *data;
   287	};
   288	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
