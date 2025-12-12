Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5510E20C463
	for <oe-kbuild-all@lists.linux.dev>; Fri, 12 Dec 2025 22:07:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765577257; cv=none; b=TWfVnlPOlgMo0LqfmX3vLl1WoIP3EoNreyWZREOrLxWw9m+urvurM7h9IjzBKJpTHQkwE96PNt6Y+iT03QkjBCibulKBZN5c8YV3FcfjAzo32NtgFuVBzsNSBNmMiKQ0v36V1t40BOO9yk5bo2pTCEgEmI99giAY35MBt0jvJa0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765577257; c=relaxed/simple;
	bh=dMdScuESrx+Tbz0fuaJmY0DGuaSPg0mbrWLU2mfrSlg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=E1yqnMpcDcTcxFMkIvE1IfFuNWM3nSXA+c8Xw7CoYnjjFYI8UdAHigoVSYARNIuFZV9rUmWMu52FdWRq3uWirkIW/TxjrNyuF/A0OKyYv/E6O88Eaqtr3qPpQbKgUmRkC83/y6/iyNOXbWo/h83MLhY16b21yaT+dda/yU66n70=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bWN0Whp/; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bWN0Whp/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765577256; x=1797113256;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=dMdScuESrx+Tbz0fuaJmY0DGuaSPg0mbrWLU2mfrSlg=;
  b=bWN0Whp/FORUk9TybHczdnp0xit93/sTbSt8nQFinNdV+5NVobCM35ys
   9xnTHy4NIe7pqQM5Obhk4ldk5gCju9Wl7/siHiZPmL3eu2uJnReJOnlzC
   OqF8BYRKT/nfCh7xYQlTIy05Da6C4GiuPBfZYW/QUcib4RpiHWFi4QuEJ
   0e5ycmjQC/E6BPYjnoT4J6Ib5mbG2hd/oJDTpp5KHfxKIgw9tz9/1i9xw
   jKpWfnMzX0JNsaO/U092457e6fSmE1QkZSI8c2aUplw0vTg7GTXGCOngH
   zqRHdQH2e1TbFgPYOwHcfmeBG0GiqrpZ1hjwSdYO03aky8v64eNc7x/4E
   w==;
X-CSE-ConnectionGUID: QJUKugbcTVmicaqXiu3ChQ==
X-CSE-MsgGUID: W41lat6MSrylLOJ2c826/Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11640"; a="78956548"
X-IronPort-AV: E=Sophos;i="6.21,144,1763452800"; 
   d="scan'208";a="78956548"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Dec 2025 14:07:35 -0800
X-CSE-ConnectionGUID: U7QdIcYKRUuaI8eAVJ2OvA==
X-CSE-MsgGUID: v0PK+5uKR7yrdXBBRsAq2g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,144,1763452800"; 
   d="scan'208";a="201372457"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 12 Dec 2025 14:07:34 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vUBIR-000000006gP-0CfL;
	Fri, 12 Dec 2025 22:07:31 +0000
Date: Sat, 13 Dec 2025 06:06:56 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Yang Yingliang <yangyingliang@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1941/1941] mm/ioremap.o: warning:
 objtool: missing symbol for section .text
Message-ID: <202512130605.0REtc4uw-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Nicholas,

First bad commit (maybe != root cause):

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   df8d11fbcbb07177c2500e63d7f5a36063977596
commit: 004cface9c1c0b6351473934a4ce452193e05b07 [1941/1941] mm: Move vmap_range from mm/ioremap.c to mm/vmalloc.c
config: x86_64-buildonly-randconfig-004-20251212 (https://download.01.org/0day-ci/archive/20251213/202512130605.0REtc4uw-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 1335a05ab8bc8339ce24be3a9da89d8c3f4e0571)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251213/202512130605.0REtc4uw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512130605.0REtc4uw-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> mm/ioremap.o: warning: objtool: missing symbol for section .text

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
