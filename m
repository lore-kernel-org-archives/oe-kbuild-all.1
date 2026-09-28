Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E45234F797B
	for <oe-kbuild-all@lists.linux.dev>; Mon, 28 Sep 2026 19:34:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790624096; cv=none; b=Jw3rhjOX4aOvC+9n0Ednjw531EuappFObiAhkihRG3ZMTECOaEZ9N2kJKqNd28Us21olVnuQ3CehzUCc9Md1CjZLxHyZhOqJmIvmWjUl9fIedkXqe3mrIwjiAgF6w0SfC9cW5hhK2kUiPLPefx5z0BWXrEKAyMcZJdnB4UwADxI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790624096; c=relaxed/simple;
	bh=vqUAvF8UB/iBLkXHsciXVpN1XmA3h8oXavoPgvV7Whc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=aPlfmEoykaO3r0txIbT/WLIXdB/kgoNDAWbghfwnlNRb602GrHT4Rj5A8oK1am9lJGEqgcSXsTHRF3ogiImJU54S9QQh4dSh2vMk8rQHWzhrNyb91qUGH6Qa5SwKrt5SRD1PAJDwhXE29XZcmb+aeaZumUYanDDwd4eyRHMi014=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JLZPjkjg; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JLZPjkjg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790624093; x=1822160093;
  h=date:from:to:cc:subject:message-id;
  bh=vqUAvF8UB/iBLkXHsciXVpN1XmA3h8oXavoPgvV7Whc=;
  b=JLZPjkjgTtTFGT+NE0O5KjUcyJVPC0g40nPQgXakWbYfYypqcPVJhwpt
   RPQ2VD7zxj0NBmFHh0WmRfsB3d8bq8tVNUXuXqQJT1IyOINfpZ6DXzCzc
   ABF3aMJXdZNC45pS0q4JZt2b3OCGAJPDe+tAfsmaWSCxT8EC1jB0HkarD
   ERNcQpJbtmt6TVKYFnbJgZAZFX89Sa5+vMvwn82SxYrSjuNPbg03//a9F
   /rm3mXgs/sSMXPIR+avZY/i8tPqqyLH+Ngh7lL2O14hI0I9QTp6krhDAg
   31rXa80fLmIWhSiZUf7qRU8VCwCKjW473Uf8yI5YLJetfHlD2P/oPt8bo
   w==;
X-CSE-ConnectionGUID: IQlINbEeSJ2yCAwfME+7EA==
X-CSE-MsgGUID: UzaGGkTwT++3IGs7XdvnWA==
X-IronPort-AV: E=McAfee;i="6800,10657,11919"; a="101500368"
X-IronPort-AV: E=Sophos;i="6.27,129,1787036400"; 
   d="scan'208";a="101500368"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Sep 2026 12:34:46 -0700
X-CSE-ConnectionGUID: x+2Qz8YrQkOm565YT390qA==
X-CSE-MsgGUID: Jw45NreXSM+K7na+nrxsKw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,129,1787036400"; 
   d="scan'208";a="283229277"
Received: from lkp-server01.sh.intel.com (HELO 462990a40a85) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 28 Sep 2026 12:34:43 -0700
Received: from kbuild by 462990a40a85 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xBH7Y-00000000OP5-3NYb;
	Mon, 28 Sep 2026 19:34:40 +0000
Date: Tue, 29 Sep 2026 03:33:56 +0800
From: kernel test robot <lkp@intel.com>
To: Frank Wunderlich <frank-w@public-files.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [frank-w-bpi-r2-4.14:7.3-rc 154/154]
 drivers/net/pcs/pcs-mtk-usxgmii.c:363:33: warning: unused variable 'mpcs'
Message-ID: <202609290300.8shOlJCJ-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/frank-w/BPI-R2-4.14 7.3-rc
head:   9f3e97a095434cde0e8076b38848505d8d7576f5
commit: c74c17aa6bf0d7cadae286faeda6fffeb8b12771 [154/154] Revert "net: pcs: mtk-usxgmii: check link status and phy ctle before reset"
config: sh-allyesconfig (https://download.01.org/0day-ci/archive/20260929/202609290300.8shOlJCJ-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260929/202609290300.8shOlJCJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609290300.8shOlJCJ-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/net/pcs/pcs-mtk-usxgmii.c: In function 'mtk_usxgmii_pcs_link_up':
>> drivers/net/pcs/pcs-mtk-usxgmii.c:363:33: warning: unused variable 'mpcs' [-Wunused-variable]
     363 |         struct mtk_usxgmii_pcs *mpcs = pcs_to_mtk_usxgmii_pcs(pcs);
         |                                 ^~~~


vim +/mpcs +363 drivers/net/pcs/pcs-mtk-usxgmii.c

f57525000282b1c Daniel Golle 2023-12-12  358  
f57525000282b1c Daniel Golle 2023-12-12  359  static void mtk_usxgmii_pcs_link_up(struct phylink_pcs *pcs, unsigned int neg_mode,
f57525000282b1c Daniel Golle 2023-12-12  360  				    phy_interface_t interface,
f57525000282b1c Daniel Golle 2023-12-12  361  				    int speed, int duplex)
f57525000282b1c Daniel Golle 2023-12-12  362  {
f57525000282b1c Daniel Golle 2023-12-12 @363  	struct mtk_usxgmii_pcs *mpcs = pcs_to_mtk_usxgmii_pcs(pcs);
f57525000282b1c Daniel Golle 2023-12-12  364  
f57525000282b1c Daniel Golle 2023-12-12  365  	/* Reconfiguring USXGMII to ensure the quality of the RX signal
f57525000282b1c Daniel Golle 2023-12-12  366  	 * after the line side link up.
f57525000282b1c Daniel Golle 2023-12-12  367  	 */
f57525000282b1c Daniel Golle 2023-12-12  368  	mtk_usxgmii_pcs_config(pcs, neg_mode, interface, NULL, false);
f57525000282b1c Daniel Golle 2023-12-12  369  }
f57525000282b1c Daniel Golle 2023-12-12  370  

:::::: The code at line 363 was first introduced by commit
:::::: f57525000282b1caada8ed19f710c3f957e8ad69 net: pcs: add driver for MediaTek USXGMII PCS

:::::: TO: Daniel Golle <daniel@makrotopia.org>
:::::: CC: Frank Wunderlich <frank-w@public-files.de>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
