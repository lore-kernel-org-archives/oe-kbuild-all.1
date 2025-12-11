Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEC93298CBC
	for <oe-kbuild-all@lists.linux.dev>; Thu, 11 Dec 2025 06:42:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765435369; cv=none; b=TP1Ve82v0eteY3YDB8wUEIoMGqmyvrobWqdtddqEnfg+Q6qwtvZcdXDc3fCHPzgcz9ySDQvdaShX56KDG0s0YiakKj9HkUoyYpUJTO1B6Ea1jhTH+RP9fHCISaYSK/pp9UkD1lntyT+OjlD+qNt43RHyY//rRH3rG9+NmfsKVu0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765435369; c=relaxed/simple;
	bh=HHoqj5wTUFohMKluBHZlGiUqGKl0EF7lQdiIKpfT+YU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=OnB1TaFon61qZB/ZbyOws1m5ENxPLAPfIqZeIHDNrTnmIGVrIfvMZkqJsHlxrWrLAF2CrJMy9TJ6tHgIGwrkbug0sowHm8rQO79hkyAPtoVIG/5WQHKuTY7fS3HoWj9C+PPDYW/Z3DNLvt+na2E8Mrbl7empg6jQb+4Mkk7LKMM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Rq5ZaIB8; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Rq5ZaIB8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765435367; x=1796971367;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=HHoqj5wTUFohMKluBHZlGiUqGKl0EF7lQdiIKpfT+YU=;
  b=Rq5ZaIB8c3XY1sBKp6eCm/9BTxK09dy1+5DQlnclgmkWYONWP+ThMVsq
   chGcOQXzBxpMW0WGd0/Ok2B7FclCC9MYiQ1YmrkT4T9gHg0iGH2YaCLsp
   CnBg6BiGwQUVZkZZ5ENTx+sxSHBTKp8lZY6/16NzDXysLoU2uiwZVVk0X
   AxOrREKiGTABHTExtulO+MFf6Zf8YHr+OwbLWboMRiYuF+PDjeypc3Rg/
   OrM8+3Rme717sChOW24OwXpwKH6CYjpcDdFYMsVw79csliKAaoQbzKSuM
   EFd7DzmIO9jabChWhIt0wly7/8ArVrLsEkVr8iToslx3SUk2/0dE/0Wio
   w==;
X-CSE-ConnectionGUID: RXBrfJ9YSfSIbf0YlG7pJg==
X-CSE-MsgGUID: br4G4JleTxCSu0wKbAbPqQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11638"; a="67451076"
X-IronPort-AV: E=Sophos;i="6.20,265,1758610800"; 
   d="scan'208";a="67451076"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Dec 2025 22:42:45 -0800
X-CSE-ConnectionGUID: i7dahVcRR36Obv//ryl48w==
X-CSE-MsgGUID: 3hyfq6s1SU2rlgwNN5b6oQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,265,1758610800"; 
   d="scan'208";a="196619957"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 10 Dec 2025 22:42:44 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vTaNt-000000004Jp-3VwW;
	Thu, 11 Dec 2025 06:42:41 +0000
Date: Thu, 11 Dec 2025 14:42:35 +0800
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:intel-6.6-CWF-RDT-ANBZ24559 25/25]
 fs/resctrl/monitor.c:629:6: warning: no previous prototype for
 'is_rdt_domain_valid'
Message-ID: <202512111452.yaLi3E90-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/anolis/intel-cloud-kernel.git intel-6.6-CWF-RDT-ANBZ24559
head:   443d7ee63a13180e69479cd694f03a167a87da2e
commit: f6c5c597bd5049d769f00d5db667d77f23a3618c [25/25] anolis: resctrl: fix UAF when domain offline
config: x86_64-anolis-intel-cloud-devel-6.6 (https://download.01.org/0day-ci/archive/20251211/202512111452.yaLi3E90-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.4.0-5) 12.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251211/202512111452.yaLi3E90-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512111452.yaLi3E90-lkp@intel.com/

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
