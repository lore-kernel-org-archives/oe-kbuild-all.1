Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05BFD3A63FB
	for <oe-kbuild-all@lists.linux.dev>; Sat, 15 Aug 2026 15:08:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786806487; cv=none; b=AbW66RhmbYRKSUWF5XWSyszMx21wZVAhOYbjz6AE+hOyRnGvRXH9Qa/oBE3eC/2YrfjwdGoVcZtTDFFUl7GsB0fPexKZ5eAy8QZPi84YZeJgSGq5Nr73m6VruyfZVVhej7+e9biKpNrXFQpXNfSzRevrbcL4SxhDcmd1rP1AMCo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786806487; c=relaxed/simple;
	bh=twAxW5n/UXCzj0B++vZhjHzGjp49kLJYl7xKggtmAy4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=QXtkkjqAZ3PIEBgc7FKRW4kRCH2ohfavSkewm3gve4ugVDu++gg/ZUvyfFmWvdVL9AY+qTNiBrjZNzDcxnXvMe1Cd+qkB/k2wptt88l1wlkukZjXyQ6/p14YnHMs9v9BiBdEQUM1FL3T/lbkRFv5pMLA4d9U8TPFVnwLh24sDDg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jZ1mY8wh; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jZ1mY8wh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786806485; x=1818342485;
  h=date:from:to:cc:subject:message-id;
  bh=twAxW5n/UXCzj0B++vZhjHzGjp49kLJYl7xKggtmAy4=;
  b=jZ1mY8whbGErXW+8F5wKDz6t8ZH2iFJy/PesvfJjfSneaUZUQ+IPqc1x
   MCzN2FyyrIu3PShQ990Pn7og+/FtPOoU9n6ktA2qBWMeidRRrB8DEUd4V
   5j6UgHJi/tuG5Wenl5kQgOwKhiSg7y0kcu3Icy+jjKqTPX1FmOF8bu0rp
   y9nf/+hOIRabCnvZwzhP0EiWpd5x/UeHsv6oeGgw8FZyTlz3dCAQgTGZX
   dbe4BJjnm4EruebL1QN6V+mWd/VTyWkwkcnwbvUl0MePex+1GfXNZHAQh
   5iRZdnxsgOA3vGpJ4vMIg1aFVTYB6LV9/K3VzYmnonArg37+NY/BtzSXG
   w==;
X-CSE-ConnectionGUID: FyZHKfIxRZ6pheh8DeY/Zw==
X-CSE-MsgGUID: 4OntRodASzmRYyhYvgZh4g==
X-IronPort-AV: E=McAfee;i="6800,10657,11876"; a="110140330"
X-IronPort-AV: E=Sophos;i="6.25,225,1779174000"; 
   d="scan'208";a="110140330"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Aug 2026 08:08:05 -0700
X-CSE-ConnectionGUID: QTcH7fgHTtyh6ddpNxkjOw==
X-CSE-MsgGUID: Ik/24vspRn+Qm6+1enXLCA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,225,1779174000"; 
   d="scan'208";a="269681872"
Received: from igk-lkp-server01.igk.intel.com (HELO 3cba2a188a06) ([10.211.93.152])
  by fmviesa005.fm.intel.com with ESMTP; 15 Aug 2026 08:08:03 -0700
Received: from kbuild by 3cba2a188a06 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wvFzM-000000006Q9-356S;
	Sat, 15 Aug 2026 15:08:00 +0000
Date: Sat, 15 Aug 2026 17:07:44 +0200
From: kernel test robot <lkp@intel.com>
To: Yahya Toubali <yahya@yahyatoubali.me>
Cc: oe-kbuild-all@lists.linux.dev, 0day robot <lkp@intel.com>,
 linux-doc@vger.kernel.org
Subject: htmldocs: Documentation/mm/index.rst:5: WARNING: Failed to
 create a cross reference. A title or caption not found: 'memory_allocation'
 [ref.ref]
Message-ID: <202608151736.JJ8BZHX5-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/intel-lab-lkp/linux/commits/Yahya-Toubali/Documentation-admin-guide-fix-trailing-whitespace-in-cgroup-v2-rst/20260813-010402
head:   0d3f96072b83a248728020056de379e818260585
commit: 0d3f96072b83a248728020056de379e818260585 Documentation: add SPDX license identifiers to RST files
date:   3 days ago
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
docutils: docutils (Docutils 0.21.2, Python 3.13.5, on linux)
reproduce: (https://download.01.org/0day-ci/archive/20260815/202608151736.JJ8BZHX5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608151736.JJ8BZHX5-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Documentation/userspace-api/landlock:596: ./include/uapi/linux/landlock.h:58: ERROR: Unknown target name: "network flags". [docutils]
   Documentation/userspace-api/landlock:596: ./include/uapi/linux/landlock.h:63: ERROR: Unknown target name: "scope flags". [docutils]
   Documentation/userspace-api/landlock:596: ./include/uapi/linux/landlock.h:24: ERROR: Unknown target name: "filesystem flags". [docutils]
   Documentation/userspace-api/landlock:605: ./include/uapi/linux/landlock.h:228: ERROR: Unknown target name: "filesystem flags". [docutils]
   Documentation/userspace-api/landlock:605: ./include/uapi/linux/landlock.h:251: ERROR: Unknown target name: "network flags". [docutils]
>> Documentation/mm/index.rst:5: WARNING: Failed to create a cross reference. A title or caption not found: 'memory_allocation' [ref.ref]
   Documentation/networking/checksum-offloads:157: ./include/linux/skbuff.h:181: WARNING: Failed to create a cross reference. A title or caption not found: 'crc' [ref.ref]
>> Documentation/process/1.Intro.rst:32: WARNING: Failed to create a cross reference. A title or caption not found: 'development_posting' [ref.ref]
>> Documentation/translations/pt_BR/process/1.Intro.rst:34: WARNING: Failed to create a cross reference. A title or caption not found: 'development_posting' [ref.ref]


vim +/memory_allocation +5 Documentation/mm/index.rst

82381918c4712b Documentation/vm/index.rst Mike Rapoport           2018-03-21  4  
481cc97349d694 Documentation/vm/index.rst Matthew Wilcox (Oracle  2022-05-07 @5) This is a guide to understanding the memory management subsystem
481cc97349d694 Documentation/vm/index.rst Matthew Wilcox (Oracle  2022-05-07  6) of Linux.  If you are looking for advice on simply allocating memory,
481cc97349d694 Documentation/vm/index.rst Matthew Wilcox (Oracle  2022-05-07  7) see the :ref:`memory_allocation`.  For controlling and tuning guides,
481cc97349d694 Documentation/vm/index.rst Matthew Wilcox (Oracle  2022-05-07  8) see the :doc:`admin guide <../admin-guide/mm/index>`.
481cc97349d694 Documentation/vm/index.rst Matthew Wilcox (Oracle  2022-05-07  9) 

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
