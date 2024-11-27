Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83E971BC3F
	for <oe-kbuild-all@lists.linux.dev>; Wed, 27 Nov 2024 02:18:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732673895; cv=none; b=OPp0neKZT/Zo6r+DJS6hd5BC33Hsf2SfCbwATzOZjLatuXDhaxA6veUKZ89C844cEwoX7/vkdF5xLXOFJqsyYHYFt4gNNsVOdOvUOMXF5K/oS64pmKknDu2o0QXDv90g3P9JHufRmX7pLKVGmBAYCZMBUY6W5FCaVbgej+rIaMQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732673895; c=relaxed/simple;
	bh=GUqQpWj7P9DDg39Y8qiRsPgxzyQZhnpiqZ0cykDOA7g=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=jCksgve5c8/cAaByNPh1rxTBtbpfU8MQ9c4Ld8PX1Wg57A2SbbkjoDjcnL7MxRLBDYmy9b/EfdtKfa5avwy3w9rVaC9WUFmqgB9WXCmsKjJG5Liy/GJlSfK11TWJlIx/MinIfhdW8E9d+0mr5c1vJGt6Yssn5v5Vl26bab/+dTM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YlD8GGje; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YlD8GGje"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732673893; x=1764209893;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=GUqQpWj7P9DDg39Y8qiRsPgxzyQZhnpiqZ0cykDOA7g=;
  b=YlD8GGjecwBJSa4dm+KbbeJ225PBH+lssgWgjKOJm2l7xPdX2XgEi8lY
   On3IaiIbC61Jf8AT7/FTYzJoDkaFuowcM789WtJ3bDPUgf6eYCP18kaLd
   ZTl6MGG/Yf+NtOirwxgvMWiBCYmJ47oMss2PnlvB58FXw5E2gmUkHcBzg
   oq7GKi8rtC+WQof+aJwzHv8irr32ypS9pRJaiwXEfgtBTNJhpvIVBr14D
   X1/KgutfixYo+YGjci7A7rCerCWgPUYeC98DZV/1ZzYz+Sfc0FilkTgn0
   qfcRoKR1p2Bp7AObfo9nXp/fV72qMRnPDxfWK5OWictHlW/YDx2e98mS/
   w==;
X-CSE-ConnectionGUID: eYFFFpELR2KCZ7np3+JKaQ==
X-CSE-MsgGUID: lfL6FfdoT7qaPj5PfdsAYQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11268"; a="32801287"
X-IronPort-AV: E=Sophos;i="6.12,188,1728975600"; 
   d="scan'208";a="32801287"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Nov 2024 18:18:13 -0800
X-CSE-ConnectionGUID: Pr1yTpo8RIOTOFXOpqfctA==
X-CSE-MsgGUID: JmpetG6wT9iKayabt4h0xg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,188,1728975600"; 
   d="scan'208";a="92116647"
Received: from lkp-server01.sh.intel.com (HELO 8122d2fc1967) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 26 Nov 2024 18:18:11 -0800
Received: from kbuild by 8122d2fc1967 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tG7d3-0007f4-26;
	Wed, 27 Nov 2024 02:18:09 +0000
Date: Wed, 27 Nov 2024 10:17:15 +0800
From: kernel test robot <lkp@intel.com>
To: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
Cc: oe-kbuild-all@lists.linux.dev,
	"Steven Rostedt (Google)" <rostedt@goodmis.org>
Subject: [trace:trace/for-next 5/7] WARNING: modpost: vmlinux: section
 mismatch in reference: trace_initcall_level+0x38 (section: .text.unlikely)
 -> initcall_level_names (section: .init.data)
Message-ID: <202411271008.fGGCQMZj-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/trace/linux-trace trace/for-next
head:   2bd9b57d04df417f31ef54448477c212fcdd14fc
commit: 98bf0fbb65226809a8df4d1948c5b6cf0c91590f [5/7] tracing: Remove conditional locking from __DO_TRACE()
config: xtensa-randconfig-001-20241127 (https://download.01.org/0day-ci/archive/20241127/202411271008.fGGCQMZj-lkp@intel.com/config)
compiler: xtensa-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241127/202411271008.fGGCQMZj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411271008.fGGCQMZj-lkp@intel.com/

All warnings (new ones prefixed by >>, old ones prefixed by <<):

>> WARNING: modpost: vmlinux: section mismatch in reference: trace_initcall_level+0x38 (section: .text.unlikely) -> initcall_level_names (section: .init.data)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
