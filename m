Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B30F026E33
	for <oe-kbuild-all@lists.linux.dev>; Thu, 12 Oct 2023 13:00:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kGIi4GSy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697115603; x=1728651603;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=lm50rhsjRU64P7aEQGvjvZyZsvCVAWVVUyDJ+7mvnnM=;
  b=kGIi4GSynxn0pDgsRvuG8vloYSnfnxrvOJ8e9y3XMAHPz5QY66E215NQ
   Y8fXGRwy/e32aSU07dUq/l/aUqkxk5uys7d0rhxok4Ldz9thLbLrWSVzr
   y8PwcZ4pQXM642vElCMwMOe+zER862kiQARoEd09h2FfXhuSTsaorYFJ7
   JPySQc6RTA8OU9gT8W3miXBpZagOVBvI4DsytKFNZC2d5BfjrU5GMNPB7
   OiBAhRLaQ0m9K5Ox9m0uC+G97QheUddgGzY6KvKheWVZppvQ1ctStv0P/
   ZghRnvvqc0yDhSzqJjcfE8nrI/cJkRgI0eku59B6YKHMdp/uBEVgKHG21
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10861"; a="369977115"
X-IronPort-AV: E=Sophos;i="6.03,219,1694761200"; 
   d="scan'208";a="369977115"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Oct 2023 06:00:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10861"; a="704150322"
X-IronPort-AV: E=Sophos;i="6.03,219,1694761200"; 
   d="scan'208";a="704150322"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by orsmga003.jf.intel.com with ESMTP; 12 Oct 2023 06:00:02 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qqvIG-0003SH-0G;
	Thu, 12 Oct 2023 13:00:00 +0000
Date: Thu, 12 Oct 2023 20:59:39 +0800
From: kernel test robot <lkp@intel.com>
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [arm:ktext 12/20] checkpatch: WARNING: please, no spaces at the
 start of a line
Message-ID: <202310122002.zCNhWarq-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.armlinux.org.uk/~rmk/linux-arm.git ktext
head:   7fa946ce05c273d5ff092c814efe64978e5faf45
commit: 07bddeb23d76359cfc76b72f6a8aa17cf40432cb [12/20] arm64: text replication: boot secondary CPUs with appropriate TTBR1
reproduce: (https://download.01.org/0day-ci/archive/20231012/202310122002.zCNhWarq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310122002.zCNhWarq-lkp@intel.com/

# many are suggestions rather than must-fix

WARNING:LEADING_SPACE: please, no spaces at the start of a line
#39: FILE: arch/arm64/kernel/asm-offsets.c:124:
+  DEFINE(CPU_BOOT_TTBR1,^Ioffsetof(struct secondary_data, ttbr1));$

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
