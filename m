Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 261CB25B090
	for <oe-kbuild-all@lists.linux.dev>; Sun, 12 Jul 2026 05:55:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783835733; cv=none; b=uoy5vvgVyX6BVtHFuj0m3pTuIHVHihKAVuZjvcR8iXAS1hHyv6uMkde3GqJhVhAbKsqzPyin5eCANQnUdT4yaEwS+dXNTGW7eKZA+u+Rr/YZsgmplXMp1t9pG46rTstQMKlR92MQEfdECgPCcRbPWUWhk2HE1mYPzCOJ6lfrsyY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783835733; c=relaxed/simple;
	bh=UViAVnWlDkgtWcSpX0bwXuJUYt/kKaS1PY+r3Zm6qGk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=sSaBRk7LluoyBxDiQD8l6+lNRfYmmzFV0B97v1o6i/et/Fovj2nNcS/J/0UhiY8FS51HqlvakyoZNGMHyE1CxNJhe8ziPg/dzPguOubXB5XZkSwoMXvFVGkHSmUBIuAwpn52PAekdtR17I9/D3m+YcpMafrGzBFQFr7XxLaJFgk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fpYZvUah; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fpYZvUah"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783835731; x=1815371731;
  h=date:from:to:cc:subject:message-id;
  bh=UViAVnWlDkgtWcSpX0bwXuJUYt/kKaS1PY+r3Zm6qGk=;
  b=fpYZvUahJzRPEXyavPfqLtsRfidJHBBdfjP3XkPo+lNw4sSp3TMSV19i
   Dx1xH1IybaPEsd7B4uBbojteR9tBY1uDdorMvjNYGdtKObpttQiRH+PYL
   LWwnQdSbt4ZXzKiRbM4kq/dcSmpda5n5dqYvj05h4WIFRJawZ9Jaz/3pI
   fzCP3VavCqu4lJ6X8sLxXI0lkVxcwLcqk2ffPjiZdcAyJrdFLQJuJNh8H
   Ri7onUuoaVoVm9wqFjxaR+o/wJDm+v179kfYSVInh2uudDZ4T1wTVsy5B
   b6QzPujPQyy4J57WuF7RstjotJHYJeND6S0cD0nevX4jLnziPOc8WTlOG
   Q==;
X-CSE-ConnectionGUID: FvgpcieiR0S0qfWLqcVkvw==
X-CSE-MsgGUID: BFaFk5MgSC+1ewI3rS392g==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="94834427"
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="94834427"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jul 2026 22:55:31 -0700
X-CSE-ConnectionGUID: EmBcwYLCSIKUq/o+bZ08ww==
X-CSE-MsgGUID: Jr6CPhN9QCeIWivSoRD2+g==
X-ExtLoop1: 1
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa003.fm.intel.com with ESMTP; 11 Jul 2026 22:55:30 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1win9z-00000000KjS-1lmV;
	Sun, 12 Jul 2026 05:55:27 +0000
Date: Sun, 12 Jul 2026 13:55:08 +0800
From: kernel test robot <lkp@intel.com>
To: Dave Jiang <dave.jiang@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [djiang:apei-sashiko-fixes 5/5] WARNING: modpost: module
 acpi_extlog uses symbol cxl_cper_post_prot_err from namespace CXL, but does
 not import it.
Message-ID: <202607121304.cJGerpzK-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/djiang/linux.git apei-sashiko-fixes
head:   477881d6ab1d71be7860a41b4979a5d8817d3caa
commit: 477881d6ab1d71be7860a41b4979a5d8817d3caa [5/5] ACPI: extlog: Defer CXL protocol error handling to avoid lock inversion
config: i386-buildonly-randconfig-006-20260711 (https://download.01.org/0day-ci/archive/20260712/202607121304.cJGerpzK-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260712/202607121304.cJGerpzK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607121304.cJGerpzK-lkp@intel.com/

All warnings (new ones prefixed by >>, old ones prefixed by <<):

>> WARNING: modpost: module acpi_extlog uses symbol cxl_cper_post_prot_err from namespace CXL, but does not import it.

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
