Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 539392E6CA8
	for <oe-kbuild-all@lists.linux.dev>; Wed, 10 Dec 2025 22:53:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765407187; cv=none; b=GpqWu4ryGY2DSi1DzZ0747R8Q4FbqQnUPKDb9Y8V8sDzhmnJHSZDZY17b2dnMtJHPRLuuDJ9zXevKe3xaALvOWZQD8kX70ozEGY3ICdiA330YtTR5a6gyOTv8V2nkP/TLQfRuYeJC40IrXe9Cdn015drBCmx66Pf8huZzEf0hSI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765407187; c=relaxed/simple;
	bh=gD2HzMwi7+MuK4kmKGcj62N95kiQvc3Gl1BvxPkbgDs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=l5gV8JZ3wlwI9RYEhMrddWvQauYUbPflnmKcExiT3KIsQD2hqe/ceVdPldzkPtiI27Rs6r8Y8vvWLbpIF64DMTNWPNKZtStiMC9C8Ln9O2b74C12T8bmkL94rDW/zJR4EZztRMYzlLeBL4NyMUHQysuBQa7U3blPjehqc7L5n/k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=S4WKYD0M; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="S4WKYD0M"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765407185; x=1796943185;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=gD2HzMwi7+MuK4kmKGcj62N95kiQvc3Gl1BvxPkbgDs=;
  b=S4WKYD0M53mCrdzX++Df+58o/vRqIKgewdbUB8lp9rADCe0HY4/vGTGo
   7FxL9IxiH3i+XV8AMpFpX1a5EVPfaFhYckW9Irn3BDTSfiOlRR9HbwPvX
   pE+KNB2gPPfk3o68dysSo1RIbRIPjVK3ylvbglQmNr5NMri7Pxrux1zQ+
   +Iw/4wD09WQzIXcnMNhNuExuEgShkGjoFiQNC14OQwxM0W+3czbdl5csc
   cG+T9p5yN0dMHmUw51JLgRj/sz+S/D6o4JPvLk5vqMY3zK4+HnsY/NGWO
   UMYYPf8nRlHbl2rm1OwC5sLm4aWNS4qYxnoWPxOcC1dcir244rBNi9zeM
   w==;
X-CSE-ConnectionGUID: cSk6+jdsQYa3CLO0rnK/1A==
X-CSE-MsgGUID: yAOh6dmJTRq5eqHLCipPuQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11638"; a="84992633"
X-IronPort-AV: E=Sophos;i="6.20,265,1758610800"; 
   d="scan'208";a="84992633"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Dec 2025 14:53:02 -0800
X-CSE-ConnectionGUID: pCMUH0nNRp69BClQ0QeMlw==
X-CSE-MsgGUID: 8e1hdyVcTMWtv4MavHZGfg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,265,1758610800"; 
   d="scan'208";a="201728451"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 10 Dec 2025 14:53:01 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vTT3L-000000003ql-1CWI;
	Wed, 10 Dec 2025 22:52:59 +0000
Date: Thu, 11 Dec 2025 06:52:47 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, xiajingze <xiajingze1@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 3529/3529] fs/reiserfs/reiserfs.o: warning:
 objtool: balance_leaf+0x8160: stack state mismatch: cfa1=4+360 cfa2=4+352
Message-ID: <202512110609.FoW9BdOr-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   d281438782e3c28a3df71a64513a3312d43dcf01
commit: 241ad43fe7e9c24d5ba4cdd1ec22e731cdd22d14 [3529/3529] Compiler: Add clang's PGO support for kernel.
config: x86_64-allmodconfig (https://download.01.org/0day-ci/archive/20251211/202512110609.FoW9BdOr-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251211/202512110609.FoW9BdOr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512110609.FoW9BdOr-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/reiserfs/reiserfs.o: warning: objtool: balance_leaf+0x8160: stack state mismatch: cfa1=4+360 cfa2=4+352

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
