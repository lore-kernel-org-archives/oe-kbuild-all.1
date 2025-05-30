Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A0EA22126E
	for <oe-kbuild-all@lists.linux.dev>; Fri, 30 May 2025 11:07:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748603233; cv=none; b=vBwyW9ugqm/y6o+l6UMyHXyp0i4PV3a7ULZUxesAEf4NkIxpgqnkrl+XwtucTNBKGmT6UjcwLnMoseqF5nUVo84yUONaNckq/Zar3mSzES556RONv3JWAv14ZTxb6f0u+bvQQ2sCYk7ozjfw5GTN5nH77BQIJD6mfLsNC4hd5qU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748603233; c=relaxed/simple;
	bh=WJrlFuB4SWFoW2I9GQiBEJCAu+EVsZvWSX5VfgNw/o4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=hqw3iOsHziPSKph2W4Dl/wTiM7Q8uSBWNCOJjYZQXx4PdItcISBtMNCGsyt8Vf7LhkZZe5udee2qVuLa21BhOHOMNZVwxcbIWsMA3FeHt12LdON2bM7PtB6vDvPcamO2nfyLTgk+131pqlnAqXCA+olXDECrZUmqPQJs4tpH3bg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MLnejicK; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MLnejicK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748603232; x=1780139232;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=WJrlFuB4SWFoW2I9GQiBEJCAu+EVsZvWSX5VfgNw/o4=;
  b=MLnejicKgr+GdvFwRmYplvTDGylNNhb2E3dYHpjm2alvqcL8mrPWf0FR
   x5eqyihKgxXKue/8ytoiR/5RlqVI3pehSY+eq5UBIoshs7SzMbgayaDJY
   Lx9M+doAOFVUlcdrHcoBrjXGzTVYMOyJurRXckHVilISMkPA7ZQDtbUh+
   AqxrvY8CW5YnXfoKy/f+nJ2xEyrq9kl4RDeUUDs2JtYa71fHQfoR5pw/X
   +FmgyLyAFG/LV4adj4HsL0PsfpoFlwaQtl0+h9s5437NT5sBAXDeR2Iao
   HOGeubhYN4KgzJ6Teytc/059AeYgbXWls6g2Rsy2D39vf5snihguz1mX2
   w==;
X-CSE-ConnectionGUID: 5mgg6xJ2RwmlukGtlShUOQ==
X-CSE-MsgGUID: 6eU87Nx0RRWrewDdM6H/5A==
X-IronPort-AV: E=McAfee;i="6700,10204,11448"; a="61319345"
X-IronPort-AV: E=Sophos;i="6.16,195,1744095600"; 
   d="scan'208";a="61319345"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 May 2025 04:07:10 -0700
X-CSE-ConnectionGUID: Z5gbG8Y/QXetmImM7hvP5Q==
X-CSE-MsgGUID: nJEgDKLXRhG36GyTmRbRLQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,195,1744095600"; 
   d="scan'208";a="144829936"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 30 May 2025 04:07:09 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uKxZq-000XaG-01;
	Fri, 30 May 2025 11:07:06 +0000
Date: Fri, 30 May 2025 19:06:56 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1654/1654] drivers/ssb/.tmp_main.o:
 warning: objtool: missing symbol for section .exit.text
Message-ID: <202505301912.1CAdzzbQ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Michael,

FYI, the error/warning still remains.

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   8eff3fb546d3baa728542fd40cdbad086cd9227c
commit: b8b6069cf2087545fe53ec920e8353133e9a70bf [1654/1654] ssb: Remove home-grown printk wrappers
config: x86_64-buildonly-randconfig-001-20250530 (https://download.01.org/0day-ci/archive/20250530/202505301912.1CAdzzbQ-lkp@intel.com/config)
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250530/202505301912.1CAdzzbQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505301912.1CAdzzbQ-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/ssb/.tmp_main.o: warning: objtool: missing symbol for section .exit.text

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
