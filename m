Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6BC0142E62
	for <oe-kbuild-all@lists.linux.dev>; Fri, 26 Apr 2024 10:46:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714128409; cv=none; b=EJmBxkKi1lhVM4zPubDpreX4IjAeNLucRYNU0F9wzFS78Hwknzdo0jqSXGC8otq+hZ8QxqTgrOzanh+O1jFNQngeasxGeNSG3ULjUhbWMrCBezE+8G38YTzcQn7zRI3Y6F/dUFx3mEu+iJ6+AHSGUfZ53WaG7rSSj9drSL8Ga4o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714128409; c=relaxed/simple;
	bh=ucnELXdeNzwT8yxCil4qjkvyXuCRiGMpLwaq/paVCZY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Tqkf9lpB0uygyN5URI39uSksh74svROXM+TlXZpW7N0o/vGv+o3N5pvwsEtIybC76yGMm+SVPmP2m9Xj5vYYPCdvVbVWBEzPV6PYfnmKn4Ax5r27lI+EyjpMEVfZmzeRbwdfpRITGgtQ5Nn7qgIZg+J1hEmPPgpWE1qU4XUEwAs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AIcRdBi/; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AIcRdBi/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714128407; x=1745664407;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ucnELXdeNzwT8yxCil4qjkvyXuCRiGMpLwaq/paVCZY=;
  b=AIcRdBi/rVwe+hDnTgDWFKUFdLa4MWm8thbkCd+FP6GJs81jc6ZOC4Yw
   mO5FFdVZOB3sOtKkNiRa0TfE6ruuxBZTk8TBB5sE7ZlXv+EXLaUrJxViZ
   ZmF2JXjthinJyxTn8Bo2syRACbbhTD/HX7vsdKVoKhbpK9fv7gGUV49eT
   GNV2IsF/asIBwundVDI6C5kny0GQ74+z1maNdM7fwNgPPVdvLvsAJTaFY
   iWkDWUtUw28TnA0U9faMfg9jqUjZy7Og8XxypfdPCMw0OdQBS0Dc8asSn
   E9lX5Oe4JMOUcU1H3yBjiX32mavHwqKQBf/Mdh6hEU/lYecGojc+pTXhc
   A==;
X-CSE-ConnectionGUID: +5D7bKKmRnKoo8shVeZscg==
X-CSE-MsgGUID: a4jUJNFNSK6tFLcrOsF8sg==
X-IronPort-AV: E=McAfee;i="6600,9927,11055"; a="20545785"
X-IronPort-AV: E=Sophos;i="6.07,232,1708416000"; 
   d="scan'208";a="20545785"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Apr 2024 03:46:47 -0700
X-CSE-ConnectionGUID: ZHwpd19OSNGkHTL57QfExA==
X-CSE-MsgGUID: NytU79KsQOGyPz8bhuxETg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,232,1708416000"; 
   d="scan'208";a="26012038"
Received: from lkp-server01.sh.intel.com (HELO e434dd42e5a1) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 26 Apr 2024 03:46:46 -0700
Received: from kbuild by e434dd42e5a1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s0J6J-0003cF-1e;
	Fri, 26 Apr 2024 10:46:43 +0000
Date: Fri, 26 Apr 2024 18:46:42 +0800
From: kernel test robot <lkp@intel.com>
To: Alexei Starovoitov <ast@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [ast-bpf:arena_lock 11/11] helpers.c:undefined reference to
 `__invalid_cmpxchg_size'
Message-ID: <202404261843.hXjmsGtB-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/ast/bpf.git arena_lock
head:   6b295d8fc61bf05eff00e6a833de6cdfc917ceba
commit: 6b295d8fc61bf05eff00e6a833de6cdfc917ceba [11/11] bpf: Remove spin in bpf_lock_release.
config: m68k-allyesconfig (https://download.01.org/0day-ci/archive/20240426/202404261843.hXjmsGtB-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240426/202404261843.hXjmsGtB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404261843.hXjmsGtB-lkp@intel.com/

All errors (new ones prefixed by >>):

   m68k-linux-ld: kernel/bpf/helpers.o: in function `bpf_lock_acquire_impl':
>> helpers.c:(.text+0x3bd2): undefined reference to `__invalid_cmpxchg_size'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
