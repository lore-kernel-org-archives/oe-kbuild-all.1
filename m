Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C2AD38FA6
	for <oe-kbuild-all@lists.linux.dev>; Sat, 15 Jun 2024 11:37:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718451447; cv=none; b=YGtzW5UxEqgcddKB4Tf6Fmgog5L20h4wDr+/7CAP6Pp4btsnHfivmQ665li56yHKPrnvoO0F9IvKAMY30eAQL+kV+kIZ6cmzZlh+jrqM/w/MRSsTbJpO0ARx9B8B7sSYvX1tU9Xxaq1TwxX/2kYV71nyCRueUXOMS29a9Eu7BXw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718451447; c=relaxed/simple;
	bh=/Psd58nDKc4r5LxORDT6Mp8rbkkOeeUC15MCScsV1Gc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=YuTD8EncKokHvQnBGcHzCAZE7VtjbHeSmi+lL6rnUeF6O1YDELD4f4Rxgv0nKGb6OV6nFcRH8I+5FuoHXhG0R9//GFnw4canNSlW939/AeY3ZtQX5SW5IS61hVbgdXCOJ5KNcsSbyyY2RQq64ohOtdWuXnXTXq+9PyxqDLndR9I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JryWxcqW; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JryWxcqW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718451446; x=1749987446;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/Psd58nDKc4r5LxORDT6Mp8rbkkOeeUC15MCScsV1Gc=;
  b=JryWxcqWwhJELiD+AFtNbh538tnI9aUItFpwXM8aIb4IADVpqKKdPV8h
   P5Syfpv3CSMBQt0GjmUuEV69IAnpjXFIBVuLlhVVDNF8H5hk5WqTJ29im
   9fPfY+p2xjmuSYheikextW9T+uAdvLIFp12rtYZjJBiTInwHPnk8FHSvY
   UqZCXfAfTqIcihLYQ8/VhPOJ3Baxons/5sAwpeZV1UttWahJ2sAz/CQmt
   xdl9MiQ6SQhPKhwkSjuONTzRCeogZaJ/6O3yGc1MTgA0tdIbUYwOBceTW
   OYzDoIdHyVugQJC1QlAYWX8071CSN3gc2KecxSJvQNjmeUgIWHNP7t5nK
   Q==;
X-CSE-ConnectionGUID: MMJTvMgxS8Wh+lgDikm8ew==
X-CSE-MsgGUID: qj64JDyGQtaeId+KYrHZBQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11103"; a="15568035"
X-IronPort-AV: E=Sophos;i="6.08,240,1712646000"; 
   d="scan'208";a="15568035"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jun 2024 04:37:25 -0700
X-CSE-ConnectionGUID: kHGMo+1eRQWkrQUhKjML/w==
X-CSE-MsgGUID: i7VEbvqlTJymF45KutHUTQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,240,1712646000"; 
   d="scan'208";a="45286671"
Received: from lkp-server01.sh.intel.com (HELO 0bcb674f05cd) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 15 Jun 2024 04:37:24 -0700
Received: from kbuild by 0bcb674f05cd with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sIRik-00007u-2G;
	Sat, 15 Jun 2024 11:37:22 +0000
Date: Sat, 15 Jun 2024 19:36:44 +0800
From: kernel test robot <lkp@intel.com>
To: James Morse <james.morse@arm.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [morse:mpam/move_to_fs/v3 4/38]
 arch/x86/kernel/cpu/resctrl/ctrlmondata.c:215:2-3: Unneeded semicolon
Message-ID: <202406151906.6GeEdpB9-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/morse/linux.git mpam/move_to_fs/v3
head:   c2c2ab59fb75c449b144cd5702b509422f44c4d2
commit: 7ac588ffe3e6b239e6550936cfe5fed4dbad8c68 [4/38] x86/resctrl: Use schema type to determine how to parse schema values
config: x86_64-randconfig-104-20240615 (https://download.01.org/0day-ci/archive/20240615/202406151906.6GeEdpB9-lkp@intel.com/config)
compiler: gcc-11 (Ubuntu 11.4.0-4ubuntu1) 11.4.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406151906.6GeEdpB9-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> arch/x86/kernel/cpu/resctrl/ctrlmondata.c:215:2-3: Unneeded semicolon

vim +215 arch/x86/kernel/cpu/resctrl/ctrlmondata.c

   206	
   207	static ctrlval_parser_t *get_parser(struct rdt_resource *r)
   208	{
   209		switch (r->schema_fmt) {
   210		case RESCTRL_SCHEMA_BITMAP:
   211			return &parse_cbm;
   212		case RESCTRL_SCHEMA_PERCENTAGE:
   213		case RESCTRL_SCHEMA_MBPS:
   214			return &parse_bw;
 > 215		};
   216	
   217		return NULL;
   218	}
   219	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
