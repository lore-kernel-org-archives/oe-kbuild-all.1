Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C1B6EEBB
	for <oe-kbuild-all@lists.linux.dev>; Sun, 13 Apr 2025 19:16:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744571812; cv=none; b=sXvhA6BAjuB5gTe2FXYWdPrKa2iyUAS6v2zBHqhZQNEtJaZmtzmGLBtdMOLvTNsX5zO4/sbWwyyz94Fv2P+aNJQUVrQqGnwYTvIDLFQGA9fUyEXuCqqy3dx3DzkUFQEVk6QtvrMa8uI813M/OTvj84lceZDCL5b/NS2ZoR2g9Z4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744571812; c=relaxed/simple;
	bh=5zezUJCpO/6s6iFGsSDMcI4I/EgbFkdKKjcqiI5VNiE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=hXnvoAjinJ2qIsMvP0LuCMYmd2zStlvXWpcE4Usnrodna+fPa8QyKSSgUeGJDIiq6CLRXJLWZRKEuXmmedMjsJXNa0hBdHftt5TAgv3fXHIkc4VQDsup9LGhB0YrLAdTClB+Mrg+Fm7hXJ8Ke54/JSJOVGThGP7FBIzzC+sE+04=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=L/xn8bZg; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="L/xn8bZg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744571810; x=1776107810;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=5zezUJCpO/6s6iFGsSDMcI4I/EgbFkdKKjcqiI5VNiE=;
  b=L/xn8bZgdl3N9jtSBcgdhwCsAYFNqvACHY5YgWObjRmO+xqN1t3a826C
   nSLXf65N6VxyMGf3sgootFCBep0RJUQ58+gnkM7DBhRxrpPfvzpfiK4kN
   J5E05zQW0DKB/MC9npUsG2R6uqhwBI7oyrlrZCi5WTMldHgC6dyFB37c/
   KuIP0D/1vzTypVHL5DVepOnyGb0zNvVl3lsM4eVB/WF1megx18DEeBE7y
   c8E8bIDJ2fKwHtEtVg+ibrb7+uGKJlTxkS/85Q9OsDAsSHIux4tH1r5rR
   pPrYLfgODVbvCxLMUqW5JWqXXn4V/oXOm4S+uBqZtFcWhD1iJ7U1rmutw
   A==;
X-CSE-ConnectionGUID: htLJDSIeSeWKAY+8in/t9w==
X-CSE-MsgGUID: RANp3GStRsCNRQCmqbCy4A==
X-IronPort-AV: E=McAfee;i="6700,10204,11402"; a="49843458"
X-IronPort-AV: E=Sophos;i="6.15,210,1739865600"; 
   d="scan'208";a="49843458"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Apr 2025 12:16:49 -0700
X-CSE-ConnectionGUID: cuS2gXRrRu6f1IBtSiyH7g==
X-CSE-MsgGUID: QH3ZdwC2SYS4Cke71bTVRQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,210,1739865600"; 
   d="scan'208";a="129635637"
Received: from lkp-server01.sh.intel.com (HELO b207828170a5) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 13 Apr 2025 12:16:48 -0700
Received: from kbuild by b207828170a5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u42ov-000Cps-3B;
	Sun, 13 Apr 2025 19:16:45 +0000
Date: Mon, 14 Apr 2025 03:16:05 +0800
From: kernel test robot <lkp@intel.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [peterz-queue:x86/core 5/6] vmlinux.o: warning: objtool:
 hv_pg_hypercall+0x1b: unreachable instruction
Message-ID: <202504140322.CYod8EYv-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git x86/core
head:   c08c01c51ede1b79b73fe142e4bc9f7bb9d0ea5e
commit: c77df08731a3ac31472a2d10427e2eb5dc9905c9 [5/6] x86_64,hyperv: Use direct call to hypercall-page
config: x86_64-randconfig-102-20250413 (https://download.01.org/0day-ci/archive/20250414/202504140322.CYod8EYv-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250414/202504140322.CYod8EYv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504140322.CYod8EYv-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> vmlinux.o: warning: objtool: hv_pg_hypercall+0x1b: unreachable instruction

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
