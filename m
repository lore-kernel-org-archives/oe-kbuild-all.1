Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7D0E468C22
	for <oe-kbuild-all@lists.linux.dev>; Wed, 26 Aug 2026 16:21:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787761297; cv=none; b=S1HuthS3pvwkrF7Sp8jE2Dc3eHROfsUCLP06Nr7I4ulf/kKoGyNG1G/5OkzQNbTvHiNUgQhtqrTQHajNRtAcSs3E8zkjuW27yu+nLdeH5SBRKkovswqJoUYppDf7h4cVnkzDsFnVyDh4ztUJ8cvLunbhDzVMkTccOZVFhbR2NBI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787761297; c=relaxed/simple;
	bh=ITxnO/cBIeQd0+R47dTK6JsJNMQOeIraZdA2KQ6hgYk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=OUMZrDhftb7eAf41G6ZKNjXw9ceL5pyeKQjPWj/S4pRagkoWNl3qVo8zoD641c6+IB1zQV43m3YatoRtJOFPTCPcSpO0hGHqK/yrD5JiVKKke7x65+JVt6ZHzzBjOpx2Uz1Oa5SV5PR3bTTn60pIt6yxj/2F6utvRCNEzr1jH+E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hoxYjv3+; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hoxYjv3+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787761293; x=1819297293;
  h=date:from:to:cc:subject:message-id;
  bh=ITxnO/cBIeQd0+R47dTK6JsJNMQOeIraZdA2KQ6hgYk=;
  b=hoxYjv3+IGl+b+vbIEwIqQXMSadPqtxLrh+AhJfcbsA8uZGfarQVLRhV
   0HFupLAv6Ta+3uqOfPMfjxO5p62JW8BWUtMs5uLIUYkr/aG3PEKjegSG9
   T6RCn97aiFf0q9+SdMhf5Up/eBHgH5RuxZ2xsDgbHXpaTP5+EGABZ7jRg
   FeHxo+Pk4NICiWsQd1/JOUqBIBb2O2djsDGk2F8zOYfyM37YCQ7OmSZ+5
   g6ZHnJCh2oxbOBFcRJz+XkJAYgaxnhimeonR3wQhUxWmGN/rNAhcNOmeJ
   wdJKBt1yB/0v4MfdyWiutOzOvt+AeLBx2KLEwhO8zNGetQOu8konfIX6w
   A==;
X-CSE-ConnectionGUID: By5ZmRRpSFeSsis/JhaQ2A==
X-CSE-MsgGUID: liGU74b5RlyPILzclvhfNQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11887"; a="98583612"
X-IronPort-AV: E=Sophos;i="6.25,244,1779174000"; 
   d="scan'208";a="98583612"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Aug 2026 09:21:27 -0700
X-CSE-ConnectionGUID: 96+Xd9b1TnS+fGxVVZNsAw==
X-CSE-MsgGUID: 03YKP/XjThWFiFTv+DcBpw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,245,1779174000"; 
   d="scan'208";a="271424884"
Received: from igk-lkp-server01.igk.intel.com (HELO b2f8001b2633) ([10.211.93.152])
  by orviesa004.jf.intel.com with ESMTP; 26 Aug 2026 09:21:26 -0700
Received: from kbuild by b2f8001b2633 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wzGNP-000000000XN-2haH;
	Wed, 26 Aug 2026 16:21:23 +0000
Date: Wed, 26 Aug 2026 18:20:24 +0200
From: kernel test robot <lkp@intel.com>
To: Alexander Usyskin <alexander.usyskin@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, "Baoli.Zhang" <baoli.zhang@intel.com>
Subject: [intel-lts:6.18/linux 0/1] htmldocs:
 Documentation/driver-api/issei/issei.rst: WARNING: document isn't included in
 any toctree [toc.not_included]
Message-ID: <202608261807.zeiSlcwF-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/intel/linux-intel-lts.git 6.18/linux
head:   6589ebb7420106d5db39b84880e040cd907b7143
commit: b50d2a7550d5cf9d63171d44eda4bdc124c0dd1e [0/1] issei: initial driver skeleton
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
docutils: docutils (Docutils 0.21.2, Python 3.13.5, on linux)
reproduce: (https://download.01.org/0day-ci/archive/20260826/202608261807.zeiSlcwF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608261807.zeiSlcwF-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Documentation/tools/rtla/common_options.rst:88: ERROR: Undefined substitution referenced: "thresharg". [docutils]
   Documentation/tools/rtla/common_options.rst:88: ERROR: Undefined substitution referenced: "tracer". [docutils]
   Documentation/tools/rtla/common_options.rst:92: ERROR: Undefined substitution referenced: "tracer". [docutils]
   Documentation/tools/rtla/common_options.rst:98: ERROR: Undefined substitution referenced: "actionsperf". [docutils]
   Documentation/tools/rtla/common_options.rst:113: ERROR: Undefined substitution referenced: "tool". [docutils]
>> Documentation/driver-api/issei/issei.rst: WARNING: document isn't included in any toctree [toc.not_included]

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
