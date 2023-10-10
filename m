Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DF5E24C6E
	for <oe-kbuild-all@lists.linux.dev>; Tue, 10 Oct 2023 14:01:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JiVgV8nW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696946501; x=1728482501;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=l5SyIW9eLJwPMUYiI2uX8lmnd3IWkMEFBfitK5qSkUE=;
  b=JiVgV8nWeT9mkBl4P9dUdbPZEQnx7AkyrB7ZGpAQJGfBVQ9glaNnKfxO
   tfihnbeKPr6/aziOQpYV9w8OqvP4Y7hHHF6sjyPrJW5HWfMjqfyKlXJpJ
   GGrXUkjmhIBLFX/0E36DsdUvYlDafcH3+TU+f5P4NKUQRozUN3fKRhYVW
   DaGzkJ+A1d2uW3M7vTYQBNuzUTl6RKg0pGNUTyC6Ka8aUQvnT/4xDhlFC
   F/i8lGf/Bvvu+weJNU+XGEOxaAxaf90CE8V2oKacKihe2fjYVnLnJYK7d
   7kFYQkE+tkIIyTYDPR1c3IWp9fm9u9zaXwNCu91NoE9XmEeWaFZdYGQeQ
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10859"; a="415414700"
X-IronPort-AV: E=Sophos;i="6.03,212,1694761200"; 
   d="scan'208";a="415414700"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Oct 2023 07:01:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10859"; a="844141090"
X-IronPort-AV: E=Sophos;i="6.03,212,1694761200"; 
   d="scan'208";a="844141090"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by FMSMGA003.fm.intel.com with ESMTP; 10 Oct 2023 07:01:31 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qqDIf-0000XK-2Y;
	Tue, 10 Oct 2023 14:01:29 +0000
Date: Tue, 10 Oct 2023 22:00:37 +0800
From: kernel test robot <lkp@intel.com>
To: Max Filippov <jcmvbkbc@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jcmvbkbc-xtensa:xtensa-6.6-rc5-esp32 33/38] checkpatch: WARNING:
 Consider removing the code enclosed by this #if 0 and its #endif
Message-ID: <202310102111.OB2WbvTh-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/jcmvbkbc/linux-xtensa xtensa-6.6-rc5-esp32
head:   224f43124c24326eb21de553984a58d8528a48d0
commit: fb7809bdb7754d0034ab2295d32e592c1c2b2e2d [33/38] WIP: perf: support mmapping event on noMMU
reproduce: (https://download.01.org/0day-ci/archive/20231010/202310102111.OB2WbvTh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310102111.OB2WbvTh-lkp@intel.com/

# many are suggestions rather than must-fix

WARNING:IF_0: Consider removing the code enclosed by this #if 0 and its #endif
#32: FILE: kernel/events/core.c:6529:
+#if 0

WARNING:UNSPECIFIED_INT: Prefer 'unsigned int' to bare use of 'unsigned'
#108: FILE: kernel/events/core.c:6639:
+static unsigned perf_mmap_capabilities(struct file *file)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
