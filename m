Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF67D37A829
	for <oe-kbuild-all@lists.linux.dev>; Mon, 19 Oct 2026 02:53:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792378420; cv=none; b=HxZf8hrJy3ji+12Qjxq9nyykYPrB/2C05arvXBkGGRIX9oq4qBLYAJodu3aQpQ/kPFyQv0D8BZQxdiBEpkHQIX9JFamHTEnbFjvbmsm0E3GRc6A/h3O60mg/F/quuSq5+k6AD3xl2cc6y+LdP+uR+ljS7rPJOCRCTuPj0CsCXEQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792378420; c=relaxed/simple;
	bh=gmjBcfs/s6f+nhPLwx1TOfAvMeMEs1OMa8N1wjU5VXc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=NnQpTFiOHrSAuobDwCs0LZAMvRxCMEXzEdhmYno4+8rKJOXSZJ5XbbrJjDuMsdZlhpnUxu2YTuf2fIRZta2G4K9/Q46uONXFuGptBEHGdgJlvI28j/pbton9B1pLPKNPcsI/vTsEA8ZMgTqnReqU9G1BsM2ukp/J1Z4GwoD5oz4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=es57Ctr2; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="es57Ctr2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792378418; x=1823914418;
  h=date:from:to:cc:subject:message-id;
  bh=gmjBcfs/s6f+nhPLwx1TOfAvMeMEs1OMa8N1wjU5VXc=;
  b=es57Ctr2oNpSPzDRq+bqzyYCdEGf70LU+s64YiF7qZEMLL5aN6Cd5u9C
   EpjhU3X5HH/9CwQqfpqZnzH1IMK2KKT6CbIH1rgVvLkQAVQbE8sbYP26J
   vF7hr6WQPalSKuv7ear+x1eX8mo9CEtkGPi34zrKdJZhHO2aYrf4ly43U
   +7gIbKyZ+8TTwZvXpcmPa/cuYb91WLl2RTyqSyaWocYbxSsM203EAEpY8
   eoyu15okJTbTbgzCmjytJ+Y6q6vt0hO4UMNs6T3QgdyONSiQ1fv28tWeD
   jEE17ZpCAE7UrPJaFDYz7uxflnFWkkbGcOjVlq38umFsDiGA1xIfQw2ZA
   Q==;
X-CSE-ConnectionGUID: IvGujTWTSQKGTKARGyp2rg==
X-CSE-MsgGUID: dfhFtyJyR/WJE+cEyWmC+g==
X-IronPort-AV: E=McAfee;i="6800,10657,11939"; a="1078397"
X-IronPort-AV: E=Sophos;i="6.27,166,1787036400"; 
   d="scan'208";a="1078397"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Oct 2026 19:53:38 -0700
X-CSE-ConnectionGUID: QyIkR2+qTS6cpaHJdBLM7w==
X-CSE-MsgGUID: AD2dAfyfQkuqpta8NiGe6Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,166,1787036400"; 
   d="scan'208";a="2818838"
Received: from igk-lkp-server01.igk.intel.com (HELO 3c253b998be3) ([10.211.93.152])
  by fmviesa006.fm.intel.com with ESMTP; 18 Oct 2026 19:53:36 -0700
Received: from kbuild by 3c253b998be3 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xIdVG-000000005S3-11Sv;
	Mon, 19 Oct 2026 02:53:34 +0000
Date: Mon, 19 Oct 2026 04:53:12 +0200
From: kernel test robot <lkp@intel.com>
To: Dave Hansen <dave.hansen@linux.intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [daveh-devel:kss 31/32] arch/x86/kernel/cet.c:204:6:
 warning: no previous prototype for 'regs_set_return_ip'
Message-ID: <202610190401.wGRf89ij-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/daveh/devel.git kss
head:   1b2e2aefa6c7e3d15fac1b25a971b2d2cc3b697d
commit: ca107dce40b82cc491ac08e03e01626956ca5eb4 [31/32] fred-entry-ssp-muck
config: x86_64-rhel-9.4 (https://download.01.org/0day-ci/archive/20261019/202610190401.wGRf89ij-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261019/202610190401.wGRf89ij-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610190401.wGRf89ij-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/x86/kernel/cet.c:204:6: warning: no previous prototype for 'regs_set_return_ip' [-Wmissing-prototypes]
     204 | void regs_set_return_ip(struct pt_regs *regs, unsigned long ip)
         |      ^~~~~~~~~~~~~~~~~~


vim +/regs_set_return_ip +204 arch/x86/kernel/cet.c

   193	
   194	/*
   195	 * Change the return IP of an event. Use this instead of directly
   196	 * manipulating regs->ip.
   197	 *
   198	 * The hardware saves a special FRED entry frame on to the shadow
   199	 * stack. It contains the RIP of the interrupted context. ERETS
   200	 * ensures that this matches regs->ip.
   201	 *
   202	 * Update the FRED entry frame in addition to regs->ip.
   203	 */
 > 204	void regs_set_return_ip(struct pt_regs *regs, unsigned long ip)
   205	{
   206		struct fred_shstk_entry_frame *ssef;
   207	
   208		regs->ip = ip;
   209	
   210		/* Only kernel-mode events save the 'ssef' pointer. */
   211		WARN_ON_ONCE(user_mode(regs));
   212	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
