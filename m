Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A7351E766F
	for <oe-kbuild-all@lists.linux.dev>; Mon,  9 Jun 2025 12:05:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749470760; cv=none; b=PkbZs35BY8MR0XqbAOhZg3518LxupLN2TkxNa/cBCIGJmqjsSXLNwhFzEgdiMOctO5nxRg+iWLx+MBG/E3jJiF1lJoABPeG8+AXZ4AOgJu3iv15S0HnAeplFTbGHFwSkNcYGkFh23vETs/6OIz8a2dNJD5DWm8utsWl8meQgEwc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749470760; c=relaxed/simple;
	bh=5gT0jriGk4MfuoT3RFje+oFF0ecakOXyfzKzuaK3fX4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=T7gGqepoNi/P5RIGBA9a19Xj4AVnOIF6u6NTqaXDXtfJV+v4TlArxTan8g1RmfP40CSDAwPxWb27q+uImcuoJ7t383x5JcFDpmg+T1BzHFAN7Ix/Y4AtkqPP8PJ8vTOF/Q63nHCjOiN9cAoTdNws3jca1fZaMuARcR+ebmaioz0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OJk/vMHS; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OJk/vMHS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749470758; x=1781006758;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=5gT0jriGk4MfuoT3RFje+oFF0ecakOXyfzKzuaK3fX4=;
  b=OJk/vMHSZ2OFMB6HMLxJgKUtCxpRCbiRBcEKn5TaXa9M1trqtLObdS48
   Zl1WeTLiDlvuZ6MmgdfU9ZXfZsSe2yw3sPqa/3F80nrUwXifYdKjpMOmf
   y2eYdwclHOZAKeeaKioS/XcAWRVO9Mt5KU/b3PagHfDlbZH9n+88DeRGU
   iwe9SRvH+63JGZ+qTy31n9AjUsNdncywEAcDILwbva7IVUN+105wECqWy
   6FL/X/v1Qf2Ld9yjamNBcPxffhXFg/XyWFpWxOtQ7zLaueFrDwuE15l1+
   vqKTdIDIx0K7YGekmyy3LRe3HRbi6wQYG3dw1fGtOYbtErg1gs8GFA/JN
   w==;
X-CSE-ConnectionGUID: RAirNLPNTKKjzn/ZwWlvDg==
X-CSE-MsgGUID: lbmznccgQrqiu/z/4XD5Cg==
X-IronPort-AV: E=McAfee;i="6800,10657,11459"; a="39167495"
X-IronPort-AV: E=Sophos;i="6.16,222,1744095600"; 
   d="scan'208";a="39167495"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jun 2025 05:05:57 -0700
X-CSE-ConnectionGUID: moofTon8QWqWzpKcRy9U6w==
X-CSE-MsgGUID: jefjSJ7sQc6f7FNvjCCEkA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,222,1744095600"; 
   d="scan'208";a="147428173"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 09 Jun 2025 05:05:56 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uObGE-00071D-1I;
	Mon, 09 Jun 2025 12:05:54 +0000
Date: Mon, 9 Jun 2025 20:05:32 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Zheng Zengkai <zhengzengkai@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 2953/2953] kernel/locking/lockdep.o: warning:
 objtool: lockdep_unregister_key()+0x2ff: unreachable instruction
Message-ID: <202506092002.S7MmpM4X-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Waiman,

First bad commit (maybe != root cause):

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   dd32d51934d00fd319caec8710bd1a438bd69859
commit: b91170be2b1f1ef673f5e79c7a4beb5673a8f881 [2953/2953] locking/lockdep: Avoid potential access of invalid memory in lock_class
config: x86_64-randconfig-123-20250609 (https://download.01.org/0day-ci/archive/20250609/202506092002.S7MmpM4X-lkp@intel.com/config)
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250609/202506092002.S7MmpM4X-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506092002.S7MmpM4X-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> kernel/locking/lockdep.o: warning: objtool: lockdep_unregister_key()+0x2ff: unreachable instruction

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
