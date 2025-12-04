Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A90E33BBA0
	for <oe-kbuild-all@lists.linux.dev>; Thu,  4 Dec 2025 22:59:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764889186; cv=none; b=A6vhiS42ft62powg1b/h99GSVh4ByWayOWS2z1nXVNxZTy/mO3fJW+HsAkIDNlsL0GDWcFZbXTBAkfZgFpyAZ7i7/kb/9bCEe7Ed0ZawQLa9wlAYehJvKuL9gGMjx4WdpW0tu4vOhlyCjnCaX+5S0+sv1zZHYbnz/iq2ZXLP050=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764889186; c=relaxed/simple;
	bh=bX/q26f0A4kZyq06GQpJqJvy+TWCz0En8n2ZIw5PvqA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=g3CgJSUJAQZaOezptyeJ+aBceD6R11BJiryVsHfEM2ScMA9cp2bB+ZJEJDHCeioRqxgvFqoc1VCy61xyzUg204/v58H/h7LQdOMMbNUfUzQzpAnLb36maj/NNmBr9bcktb+h0hxO0lv5ZUYb+XSnG5Ag+/k1EXNxKhZvrTOyr/0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UmlJPhA/; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UmlJPhA/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764889183; x=1796425183;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=bX/q26f0A4kZyq06GQpJqJvy+TWCz0En8n2ZIw5PvqA=;
  b=UmlJPhA/CWtMlaThyI8D6PO4F+dhhB6yiC8XRKeAFIAcR0PY2lqoDRVH
   SaXe8IXlezbfWtyEvoImsDQsxObjIXaOxCo8WDDVPRa+8vuGfiBMzzUHI
   tBtG9PZeDJ8THfbxgt5/1BlA/a/ONSl5vs9WZ748TvGcSyPHyEH4Ebs/j
   lbR1KRO6JuyzcqKbmisQ2OPEafZT9JaWmmh4jBsG/D7JZ4b7Ui11nQSrk
   TS+wPvp+OxEpyp6jiZemNbj75ds6FYLGKznPKw/Na4AzccU7imSa8sC8V
   g8ZHy4M7XUXX4FCNI15SOji1Fgp/LgyD2YpcJhTztstbyHVZuOFliFfcZ
   g==;
X-CSE-ConnectionGUID: uv+rzcQbStS765yMXnaPEg==
X-CSE-MsgGUID: T7zGpYfsS8yawPdA6fS9Fg==
X-IronPort-AV: E=McAfee;i="6800,10657,11632"; a="66815924"
X-IronPort-AV: E=Sophos;i="6.20,250,1758610800"; 
   d="scan'208";a="66815924"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Dec 2025 14:59:41 -0800
X-CSE-ConnectionGUID: vj2+xdEQRf2HIIaweu/DRg==
X-CSE-MsgGUID: aLD2zaT/QTOvzqCcAZTTfQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,250,1758610800"; 
   d="scan'208";a="225775586"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 04 Dec 2025 14:59:40 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vRIIU-00000000EKl-0lkS;
	Thu, 04 Dec 2025 22:59:38 +0000
Date: Fri, 5 Dec 2025 06:59:07 +0800
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:devel-6.6 45/45] mm/vmalloc.c:2490:14: warning:
 no previous prototype for 'get_vm_area_page_order'
Message-ID: <202512050655.POu34LmP-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/anolis/intel-cloud-kernel.git devel-6.6
head:   01971ee6f581b7711da045de9e6d85ce8e0638a4
commit: c331f3e9d0bb0872f05c4e55269bac3b27418062 [45/45] kho: add support for preserving vmalloc allocations
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20251205/202512050655.POu34LmP-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251205/202512050655.POu34LmP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512050655.POu34LmP-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> mm/vmalloc.c:2490:14: warning: no previous prototype for 'get_vm_area_page_order' [-Wmissing-prototypes]
    2490 | unsigned int get_vm_area_page_order(struct vm_struct *vm)
         |              ^~~~~~~~~~~~~~~~~~~~~~


vim +/get_vm_area_page_order +2490 mm/vmalloc.c

  2489	
> 2490	unsigned int get_vm_area_page_order(struct vm_struct *vm)
  2491	{
  2492		return vm_area_page_order(vm);
  2493	}
  2494	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
