Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AB8E28FFF6
	for <oe-kbuild-all@lists.linux.dev>; Thu, 31 Jul 2025 09:12:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753953147; cv=none; b=R6ebMuQDsH8fm3f+a7n+orv2db3zAXNdWDak0vYicxIvdIgWhm+AQTKy2rCbq6eK8UpPdWcUrJMfGv8fQGwReqKme44eODjssmid5U7Uj5YI8Dv2HSj8rj9hxkjHg+JCkxp2Jzv41xzA0qLekE3Q9r5T8YePzovsrwHZE7yGlDI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753953147; c=relaxed/simple;
	bh=kGEGUVcCNoeQp/v0AkhHaE/N/caDeQk6nRfZL83sQDI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=henTGF4SejUGcox73frtoqwT6uvPABRgWn57i6+WvLNlyyURDT890qOeDP5o6ofOussxkZJpE3zAfFOMuA4+2Nrgvx0IOYojfasUC6CbZmSHVc8O8RrZhEnGOSPFm46bfJq00NaHLhYxi6PkIJTC61jT54kkZyc98yio3a/Lw2s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ne+wG0TJ; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ne+wG0TJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1753953146; x=1785489146;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=kGEGUVcCNoeQp/v0AkhHaE/N/caDeQk6nRfZL83sQDI=;
  b=ne+wG0TJDGCabo4KXYSajoGoCe3nmapEZe6Gvjcz8n9A4MjRZ9PntaNP
   5njPgjtYihm2fWSTvO0g+cUOMJCEcx7iCpqJEXCJ84uUaU5msipR9hGF0
   8EqC19x9NC2jZzjV/DFcQuShClRw2gUoeEBTRXvXW1v9G2ZWOBLeiCDAl
   toK/ZToqWhxWB1AMwldItOcjtR9Yu6SRpHH/SAcWTx95eqBeJPEaJnZ0L
   tvhQgAmQCF07a/Oq1UKGDUs7MpYq7oQtHzw8KpyyrzjXlw1mbeHxXFefU
   4kcWKH6Cp94lORNx/ziKQotQloQI8pExGl3gXGDYf9vPm/zW5EpwodKpK
   g==;
X-CSE-ConnectionGUID: 0YlPeiaQTk6P2dzmHtfQFA==
X-CSE-MsgGUID: QiiKM8ulRmy4jlATD8hDcA==
X-IronPort-AV: E=McAfee;i="6800,10657,11507"; a="56419260"
X-IronPort-AV: E=Sophos;i="6.16,353,1744095600"; 
   d="scan'208";a="56419260"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jul 2025 02:12:25 -0700
X-CSE-ConnectionGUID: IB81V79vQdS7xN94MebBig==
X-CSE-MsgGUID: EcCCZO98RhOnYFXU0mQ0ig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,353,1744095600"; 
   d="scan'208";a="167445682"
Received: from lkp-server01.sh.intel.com (HELO 160750d4a34c) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 31 Jul 2025 02:12:24 -0700
Received: from kbuild by 160750d4a34c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uhPKo-0003ai-0T;
	Thu, 31 Jul 2025 09:12:22 +0000
Date: Thu, 31 Jul 2025 17:11:48 +0800
From: kernel test robot <lkp@intel.com>
To: John Ousterhout <ouster@cs.stanford.edu>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC net-next v13 01/15] net: homa: define user-visible API for
 Homa
Message-ID: <202507311715.iCI7cqiE-lkp@intel.com>
References: <20250730234544.4357-2-ouster@cs.stanford.edu>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250730234544.4357-2-ouster@cs.stanford.edu>

Hi John,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on v6.16]
[also build test ERROR on next-20250731]
[cannot apply to net-next/main net/main linus/master horms-ipvs/master]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/John-Ousterhout/net-homa-define-user-visible-API-for-Homa/20250731-074951
base:   v6.16
patch link:    https://lore.kernel.org/r/20250730234544.4357-2-ouster%40cs.stanford.edu
patch subject: [RFC net-next v13 01/15] net: homa: define user-visible API for Homa
config: i386-buildonly-randconfig-001-20250731 (https://download.01.org/0day-ci/archive/20250731/202507311715.iCI7cqiE-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14+deb12u1) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250731/202507311715.iCI7cqiE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507311715.iCI7cqiE-lkp@intel.com/

All errors (new ones prefixed by >>):

>> error: include/uapi/linux/homa.h: missing "WITH Linux-syscall-note" for SPDX-License-Identifier
   make[3]: *** [scripts/Makefile.headersinst:63: usr/include/linux/homa.h] Error 1 shuffle=3826179690
   make[3]: Target '__headers' not remade because of errors.
   make[2]: *** [Makefile:1372: headers] Error 2 shuffle=3826179690
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:248: __sub-make] Error 2 shuffle=3826179690
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:248: __sub-make] Error 2 shuffle=3826179690
   make: Target 'prepare' not remade because of errors.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
