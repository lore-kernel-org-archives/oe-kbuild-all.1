Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64D9CEBE
	for <oe-kbuild-all@lists.linux.dev>; Wed, 26 Mar 2025 02:39:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742956746; cv=none; b=WuOT+EEAkKsBpnURFDESa1Lj1Bi2AEwUOl0oGWE2c2PBXl9uugcd/X8MZ9EX4nphgpCbUqkSl62Taj3Ip4OhYJVZ8uiEJFojc+MtYahNQFOfA0KAbNcDj5E9N1bXhWm69d+SoS/MTARJp7PVFzy6qLYyPX2rO/Cr5KFLvYMRrIU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742956746; c=relaxed/simple;
	bh=S0RRY+ABd9eTxrrHljt6VYsHq9mBRvYq5uFKalhH1S8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=rdvmZFOhJCQG2yhD6VQfrK+8FkiTWUclI8IieZXw4lnG3nKPWEFIx5G5x+rY96OOG6tt7RsFJoK2HgPd/RP0Dn0m4oWKc2UIMT6pf7FBdxEuarB+b8sErFxPiaqfYAvgx5mm3pLjzyVZFdOEknucIrnXGQghVF9qKQdlp4IxBDk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=b9jeJJnI; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="b9jeJJnI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1742956743; x=1774492743;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=S0RRY+ABd9eTxrrHljt6VYsHq9mBRvYq5uFKalhH1S8=;
  b=b9jeJJnIHeYEe8LFXHOgRYAu5N2Kurcrbdzt7HnxL5Zoo9L9PStdsdRo
   zwAd/jhTdA0bCu/KBwscPHg22LfpsoPPp2hOYTsc/AAZ+EjCKNNldZZ2R
   FcRm1w5+oysuokIr9jTaXgw1HO+QJszT1OmYrsKkJcztb52YoZJ2LkTER
   r98kJ0SvNEEjATMs4djeZhdIq5u1Gh13OaxRlT4IY97lvqyTcfWbXtkPS
   S1ygDTxVWfcCXtGN1I+bLnISsYWso5nfZtKT+u318sMGavi83elh6CsZv
   d0Sz7rVXssaUMLSd+me3zw1s9kkndEOMSzzGbS0etpzNThW0eY+bO1N0t
   Q==;
X-CSE-ConnectionGUID: mBZ5n1OvSi+yF+CxYAerNA==
X-CSE-MsgGUID: /aGrucJER6OI6doeg722Wg==
X-IronPort-AV: E=McAfee;i="6700,10204,11384"; a="44329646"
X-IronPort-AV: E=Sophos;i="6.14,276,1736841600"; 
   d="scan'208";a="44329646"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Mar 2025 19:39:03 -0700
X-CSE-ConnectionGUID: hl0oTXjxTFybTUpoAn9r1A==
X-CSE-MsgGUID: fFRPjrHpTpyjnbRJ2v5FTg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,276,1736841600"; 
   d="scan'208";a="147746351"
Received: from lkp-server02.sh.intel.com (HELO e98e3655d6d2) ([10.239.97.151])
  by fmviesa002.fm.intel.com with ESMTP; 25 Mar 2025 19:39:02 -0700
Received: from kbuild by e98e3655d6d2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1txGfT-0005Ot-38;
	Wed, 26 Mar 2025 02:38:59 +0000
Date: Wed, 26 Mar 2025 10:38:45 +0800
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:devel-6.6 32/32] fs/resctrl/monitor.c:629:6:
 warning: no previous prototype for 'is_rdt_domain_valid'
Message-ID: <202503261039.EzZRFsGs-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/anolis/intel-cloud-kernel.git devel-6.6
head:   1355a80cc32f9ae2fdcf9aefa7c97c6eee9149a9
commit: c98d9a79845a3f07c5608d8665164a087bcb5a7b [32/32] anolis: resctrl: fix UAF when domain offline
config: x86_64-anolis-intel-cloud-devel-6.6 (https://download.01.org/0day-ci/archive/20250326/202503261039.EzZRFsGs-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250326/202503261039.EzZRFsGs-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503261039.EzZRFsGs-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/resctrl/monitor.c:629:6: warning: no previous prototype for 'is_rdt_domain_valid' [-Wmissing-prototypes]
     629 | bool is_rdt_domain_valid(struct rdt_resource *r, struct rdt_domain *d)
         |      ^~~~~~~~~~~~~~~~~~~


vim +/is_rdt_domain_valid +629 fs/resctrl/monitor.c

   628	
 > 629	bool is_rdt_domain_valid(struct rdt_resource *r, struct rdt_domain *d)
   630	{
   631		int i;
   632	
   633		for (i = 0; i < NR_CPUS; i++)
   634			if (r->rdt_domain_list[i] == d)
   635				return true;
   636		return false;
   637	}
   638	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
