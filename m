Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F391A13AC7
	for <oe-kbuild-all@lists.linux.dev>; Thu, 30 Nov 2023 03:55:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HRPI0Kd8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701316501; x=1732852501;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=d2ZbL3bjz+8GhAc78iCR0FwIewsihj/fH/JD5IjLXb4=;
  b=HRPI0Kd89MRHTITw0QUQd10Djv8mwvYCiBZCNE6yeIpX0zuZUXnUpdNj
   gZtlOa3X1Hf8PGZt7JlEthlviDR+yQRFpvqtdlQ9DG6YYHqt/ZgRMlS/J
   mg/RkW5UpXD+bdSW8VFKj4c3Q8CO5WbE0KbSpWSO9JJ+cMezCYQKcAGVC
   H73ngter+a7aiqiZo5JyI0wh3xEG7Q/z4BQW33c9wnYf7jzts9oHu0Uyl
   Ub4m5WJmsF7knnahSNARhA0b2/iQ9mEH0sqiXU9u0Bpg8NoCCqDNsYCUI
   oxjRTcWv5nwLJL4OpeIrIQ23ggwLCbOWs4IveoVljylMjl+s8qJqLLG8t
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10909"; a="396072717"
X-IronPort-AV: E=Sophos;i="6.04,237,1695711600"; 
   d="scan'208";a="396072717"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Nov 2023 19:55:01 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10909"; a="860054035"
X-IronPort-AV: E=Sophos;i="6.04,237,1695711600"; 
   d="scan'208";a="860054035"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by FMSMGA003.fm.intel.com with ESMTP; 29 Nov 2023 19:55:00 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r8Y8f-0001Iz-2s;
	Thu, 30 Nov 2023 03:54:57 +0000
Date: Thu, 30 Nov 2023 11:54:44 +0800
From: kernel test robot <lkp@intel.com>
To: Song Liu <song@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v14 bpf-next 5/6] selftests/bpf: Add tests for filesystem
 kfuncs
Message-ID: <202311300848.EsuXpyPE-lkp@intel.com>
References: <20231129003656.1165061-6-song@kernel.org>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231129003656.1165061-6-song@kernel.org>

Hi Song,

kernel test robot noticed the following build errors:

[auto build test ERROR on bpf-next/master]

url:    https://github.com/intel-lab-lkp/linux/commits/Song-Liu/bpf-Add-kfunc-bpf_get_file_xattr/20231129-084133
base:   https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next.git master
patch link:    https://lore.kernel.org/r/20231129003656.1165061-6-song%40kernel.org
patch subject: [PATCH v14 bpf-next 5/6] selftests/bpf: Add tests for filesystem kfuncs
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231130/202311300848.EsuXpyPE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311300848.EsuXpyPE-lkp@intel.com/

All errors (new ones prefixed by >>):

>> progs/test_fsverity.c:16:22: error: invalid application of 'sizeof' to an incomplete type 'struct fsverity_digest'
      16 | char expected_digest[sizeof(struct fsverity_digest) + SHA256_DIGEST_SIZE];
         |                      ^     ~~~~~~~~~~~~~~~~~~~~~~~~
   progs/test_fsverity.c:16:36: note: forward declaration of 'struct fsverity_digest'
      16 | char expected_digest[sizeof(struct fsverity_digest) + SHA256_DIGEST_SIZE];
         |                                    ^
   progs/test_fsverity.c:17:13: error: invalid application of 'sizeof' to an incomplete type 'struct fsverity_digest'
      17 | char digest[sizeof(struct fsverity_digest) + SHA256_DIGEST_SIZE];
         |             ^     ~~~~~~~~~~~~~~~~~~~~~~~~
   progs/test_fsverity.c:16:36: note: forward declaration of 'struct fsverity_digest'
      16 | char expected_digest[sizeof(struct fsverity_digest) + SHA256_DIGEST_SIZE];
         |                                    ^
   2 errors generated.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
