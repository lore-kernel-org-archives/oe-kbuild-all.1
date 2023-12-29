Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAD2F12B66
	for <oe-kbuild-all@lists.linux.dev>; Fri, 29 Dec 2023 18:19:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="j8p3mvkA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1703873980; x=1735409980;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=kTQMd/IW5Aj6FBZSjNHYMFwZIJXRPi57JDyPgpKMZlg=;
  b=j8p3mvkAxkDdoG3a/lw8WXOj//BHuVAiswWyiVpS0af03WYYEN9LeH7c
   8KAjE/uwGDidcyyRbZN74O03gOfYhM4XSJ0Lt5tek5fubCfaT8wfRiOsW
   8JrPU1WOb6yLUUZBnGRTN+1S5YVJBP8Q4l2cTlazVYX3yPcOqMDGsIdic
   nS0reAQ3t9i501VWSZefmhEGyEpogAyQznwKiyDKWWHf9EJxEyiMEDQrK
   L15cVJwTfNILdhDwKm7ecXML76/X5Mzd8YrR6s1BaBmnneSFbBsBPHwnt
   i9gddlwdbEdDpdn9VSq0izugmeQFy39en/NKt52bSngSPvWpRoH90/TsE
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10938"; a="399443910"
X-IronPort-AV: E=Sophos;i="6.04,315,1695711600"; 
   d="scan'208";a="399443910"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Dec 2023 10:19:39 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10938"; a="1110227236"
X-IronPort-AV: E=Sophos;i="6.04,315,1695711600"; 
   d="scan'208";a="1110227236"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga005.fm.intel.com with ESMTP; 29 Dec 2023 10:19:38 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rJHSK-000Hgx-2G;
	Fri, 29 Dec 2023 18:19:36 +0000
Date: Sat, 30 Dec 2023 02:19:04 +0800
From: kernel test robot <lkp@intel.com>
To: Jim Cromie <jim.cromie@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jimc:lukas-v3.1 9/32] net/ipv6/netfilter/ip6t_frag.c:27:9: sparse:
 sparse: Initializer entry defined twice
Message-ID: <202312300213.SzJ6lbVC-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/jimc/linux.git lukas-v3.1
head:   9ff27e73d42873cb5a9aab6839b1eed870f41788
commit: da57303ad20564945fe168b6ee05d43d12dbe7ca [9/32] dyndbg: move flags field to a new structure
config: x86_64-randconfig-122-20231229 (https://download.01.org/0day-ci/archive/20231230/202312300213.SzJ6lbVC-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231230/202312300213.SzJ6lbVC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312300213.SzJ6lbVC-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> net/ipv6/netfilter/ip6t_frag.c:27:9: sparse: sparse: Initializer entry defined twice
   net/ipv6/netfilter/ip6t_frag.c:27:9: sparse:   also defined here
   net/ipv6/netfilter/ip6t_frag.c:30:9: sparse: sparse: Initializer entry defined twice
   net/ipv6/netfilter/ip6t_frag.c:30:9: sparse:   also defined here
--
>> net/ipv6/netfilter/ip6t_ah.c:29:9: sparse: sparse: Initializer entry defined twice
   net/ipv6/netfilter/ip6t_ah.c:29:9: sparse:   also defined here
   net/ipv6/netfilter/ip6t_ah.c:32:9: sparse: sparse: Initializer entry defined twice
   net/ipv6/netfilter/ip6t_ah.c:32:9: sparse:   also defined here
--
   drivers/usb/atm/ueagle-atm.c:2060:9: sparse: sparse: restricted __be16 degrades to integer
   drivers/usb/atm/ueagle-atm.c:2060:9: sparse: sparse: restricted __be16 degrades to integer
>> drivers/usb/atm/ueagle-atm.c:1089:9: sparse: sparse: Initializer entry defined twice
   drivers/usb/atm/ueagle-atm.c:1089:9: sparse:   also defined here
>> drivers/usb/atm/ueagle-atm.c:1089:9: sparse: sparse: Initializer entry defined twice
   drivers/usb/atm/ueagle-atm.c:1089:9: sparse:   also defined here

vim +27 net/ipv6/netfilter/ip6t_frag.c

^1da177e4c3f41 Linus Torvalds  2005-04-16  21  
^1da177e4c3f41 Linus Torvalds  2005-04-16  22  /* Returns 1 if the id is matched by the range, 0 otherwise */
1d93a9cbad608f Jan Engelhardt  2007-07-07  23  static inline bool
1d93a9cbad608f Jan Engelhardt  2007-07-07  24  id_match(u_int32_t min, u_int32_t max, u_int32_t id, bool invert)
^1da177e4c3f41 Linus Torvalds  2005-04-16  25  {
1d93a9cbad608f Jan Engelhardt  2007-07-07  26  	bool r;
ff67e4e42bd178 Jan Engelhardt  2010-03-19 @27  	pr_debug("id_match:%c 0x%x <= 0x%x <= 0x%x\n", invert ? '!' : ' ',
^1da177e4c3f41 Linus Torvalds  2005-04-16  28  		 min, id, max);
^1da177e4c3f41 Linus Torvalds  2005-04-16  29  	r = (id >= min && id <= max) ^ invert;
0d53778e81ac7a Patrick McHardy 2007-07-07  30  	pr_debug(" result %s\n", r ? "PASS" : "FAILED");
^1da177e4c3f41 Linus Torvalds  2005-04-16  31  	return r;
^1da177e4c3f41 Linus Torvalds  2005-04-16  32  }
^1da177e4c3f41 Linus Torvalds  2005-04-16  33  

:::::: The code at line 27 was first introduced by commit
:::::: ff67e4e42bd178b1179c4d8e5c1fde18758ce84f netfilter: xt extensions: use pr_<level> (2)

:::::: TO: Jan Engelhardt <jengelh@medozas.de>
:::::: CC: Jan Engelhardt <jengelh@medozas.de>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
