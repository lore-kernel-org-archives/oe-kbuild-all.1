Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E7B7218EB9
	for <oe-kbuild-all@lists.linux.dev>; Fri, 24 Jan 2025 19:20:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737746424; cv=none; b=CELxxmu5+tVqMv0iRbPnyF5h32e9cU6jPP8UTxp8BaYzz2jP/CtcVWO+MCMvOZ2+mCgVOmuPCDlF2ZvZucdUzjWE9jnvv7GGlGMJqyiRLUekFqIYxZviRmyl14Y7ML/KNCNdYaA3w/98wuqfjqT9jMg065J44To+N899mkUa/ts=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737746424; c=relaxed/simple;
	bh=LSbWFz1UWLUAuKH6TY7Y5r7axz9/9fx35/UJFu305UY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ibm0t+fJD+6WBnEKOO3eYVbKEtGx4VZwqAYkpKLch3hqEjIb5baqu5PgwWNiDxKHfO9wTW2T7C0i0VOzVO888OqI6IxcNQfb6LNp1m/B96+NX+mw8rfHDtklzk6rTWRpUB+faPSVxYFk2Jg6/z4sRD2LhU1eB9RJaWhWGnZmiAc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JUuf+IoD; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JUuf+IoD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737746423; x=1769282423;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=LSbWFz1UWLUAuKH6TY7Y5r7axz9/9fx35/UJFu305UY=;
  b=JUuf+IoDCq8rtExUhK421nHBhVRVpLmGzKOX5atxZs+RYE2MP/sFxej4
   EqdDJH7YlMP5fx02OqkVt8pB+GwXVsx9w+dGVwC8tGNvHxn9roFUb12ZX
   sS9E9JMgSN/AZk/k6FTg66jQb/gKG0x6SLtTjPRPMZMueGSJHWCITb2Pk
   JNHnP+RbtX8YVGW65qbkEzdYdPm96Z/tY9HPG3tW8mG9x0M0n7UwOJI4D
   ldWwOwZZSgMIm4Km9WTKyQ3OyzNYwc0tjxvvxpIzea24Bl+ol+br2D5PH
   pFuQw76fFkVeHVGN1Wag7HhGk5JrokkhYzbv3VdlrOzEVHxRzPPZ0W3Gi
   A==;
X-CSE-ConnectionGUID: tbBtrAt7Q+SHB1nftLvQlw==
X-CSE-MsgGUID: AkZxc35MRHKGqkq0SSZp+g==
X-IronPort-AV: E=McAfee;i="6700,10204,11325"; a="48953798"
X-IronPort-AV: E=Sophos;i="6.13,232,1732608000"; 
   d="scan'208";a="48953798"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jan 2025 11:20:22 -0800
X-CSE-ConnectionGUID: UM6RcJ92QaWF8czSE82WHA==
X-CSE-MsgGUID: wliyyND1RDq9GLTYYkwC0Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="108765418"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 24 Jan 2025 11:20:21 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tbPE2-000d3f-2a;
	Fri, 24 Jan 2025 19:20:18 +0000
Date: Sat, 25 Jan 2025 03:19:33 +0800
From: kernel test robot <lkp@intel.com>
To: Juergen Gross <jgross@suse.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: arch/x86/kernel/head_64.o: warning: objtool: xen_hypercall_hvm+0x30:
 sibling call from callable instruction with modified stack frame
Message-ID: <202501250304.8hkFCG3K-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Juergen,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   ab18b8fff124c9b76ea12692571ca822dcd92854
commit: b4845bb6383821a9516ce30af3a27dc873e37fd4 x86/xen: add central hypercall functions
date:   6 weeks ago
config: x86_64-randconfig-161-20241019 (https://download.01.org/0day-ci/archive/20250125/202501250304.8hkFCG3K-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250125/202501250304.8hkFCG3K-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501250304.8hkFCG3K-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/x86/kernel/head_64.o: warning: objtool: xen_hypercall_hvm+0x30: sibling call from callable instruction with modified stack frame

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
