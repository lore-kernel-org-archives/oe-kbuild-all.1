Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BB92263F5B
	for <oe-kbuild-all@lists.linux.dev>; Mon, 24 Feb 2025 17:40:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740418834; cv=none; b=LmWB/Nu3zZ2jDKi6RS/l8lAhLX1vxMneXh+e3w9l0RAAGcVdxCOnI4mofTmLTHbtNAFHxXUZlhWrvLacwK04Iqw+kFILmhLfDBH0oFtWUv7qwsHJFVbv0EIGiFIHM8MGJYU3CFxCqThLcPC3ifuthqoAN4kZT+BI9NHd/5JxCtA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740418834; c=relaxed/simple;
	bh=g5pu6tntt1y2qSYQEx2MQwYycSTqHVOm5EqNOUMmPXY=;
	h=Date:From:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=gCPNyueOoQ+g+gmZxU5aQYB3mXx+i0zA9927Z5nXJF1FGtg6HIZM/ypA94cmUF+yMLebQctRbpmBP2AUa9COOFq+QgZmrlfSEb2MMGW1YKsE0CRjqbLRb++GPolaMguTqZbt28+TSen2Hwa9l1iLIjQPlXo6pOzBNX31Bm1xIz8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TWwV3U17; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TWwV3U17"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740418832; x=1771954832;
  h=date:from:cc:subject:message-id:mime-version;
  bh=g5pu6tntt1y2qSYQEx2MQwYycSTqHVOm5EqNOUMmPXY=;
  b=TWwV3U17KRmWAZj7HnnAeKlDM4q81xUaM0u47HvzDEJtfsHex1ym1fAc
   bYo14ZM/asxtoYr22vAbV9OyZsXX2hCEENzw8ml60HrhJnTB90uI2aHOZ
   6luR7ZIBcbMMvmD0bJldX3HRNb7m97Z1mEZZOkjEynqlfucz85jJ2Y2T4
   lT9vyKsWJITSzBtPTdFO+fQNvfsFZNBgOA+RLSf6TnkBchgn9ax0t42ZO
   c7qdj5cQ0ZZZDaq55D9lmF2f4GVW5oeV9gzp154WjMfSdtjiU37oclETx
   pEWtWNVzKjhNQq1EfiTHuWBF/o29ZNJrO+RcIONAduyVL6SIaawIn8Su/
   A==;
X-CSE-ConnectionGUID: /3GKZTQoQsauoTEscSMMRw==
X-CSE-MsgGUID: 1+3HePF0QlqrdFETdgtSMg==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="52614572"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; 
   d="scan'208";a="52614572"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Feb 2025 09:40:32 -0800
X-CSE-ConnectionGUID: obFGet3GS5aEmChj4Wzk7g==
X-CSE-MsgGUID: kXhPwwGqTlmR6TAt6Bhb/g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,312,1732608000"; 
   d="scan'208";a="120749732"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by fmviesa005.fm.intel.com with ESMTP; 24 Feb 2025 09:40:31 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tmcRR-00099P-0l
	for oe-kbuild-all@lists.linux.dev;
	Mon, 24 Feb 2025 17:40:29 +0000
Date: Tue, 25 Feb 2025 01:39:49 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [intel-lts:pr/69 1/1] net/ipv4/route.c:136:12: warning:
 'ip_min_valid_pmtu' defined but not used
Message-ID: <202502250158.kLWt10hc-lkp@intel.com>
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
commit: 3bcf69f8e7869e00babd3cc11f8c3acca9f79cc9 [1/1] net: ipv4: don't allow setting net.ipv4.route.min_pmtu below 68
config: s390-randconfig-001-20250224 (https://download.01.org/0day-ci/archive/20250225/202502250158.kLWt10hc-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250225/202502250158.kLWt10hc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502250158.kLWt10hc-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> net/ipv4/route.c:136:12: warning: 'ip_min_valid_pmtu' defined but not used [-Wunused-variable]
    static int ip_min_valid_pmtu __read_mostly = IPV4_MIN_MTU;
               ^~~~~~~~~~~~~~~~~


vim +/ip_min_valid_pmtu +136 net/ipv4/route.c

   135	
 > 136	static int ip_min_valid_pmtu __read_mostly	= IPV4_MIN_MTU;
   137	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
