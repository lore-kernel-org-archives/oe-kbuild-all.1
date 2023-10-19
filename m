Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBB551EB43
	for <oe-kbuild-all@lists.linux.dev>; Thu, 19 Oct 2023 14:31:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="frh7dXsu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697725879; x=1729261879;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=NW9Jz5OVikflQyY30NLVAwLIGgz3K1B75EKXWc0VIcg=;
  b=frh7dXsurwdMaxX70qCIBRxfxFbjAuW7GNWuWaqNYa9ZjiLYHwVW+1NG
   bsZHRALnx5hJdQbT9ay2P6hKZv+hmz3TAsJFN/MqxVAM91wJyYZzbVF1e
   3FWBbUsRF1uKyw7MfXuY//4j4n1K4JZPiijFRgXdPqd1FaxfzZzCA3K3w
   4RpeBZGQE+1Jr7lLj25/a1UGE7+GuFkfd4Zi7CisHaRxjHEDEAp2jR/Fb
   DbQlgp3GgtpNtdW9/VapiYZw0rCHgKKmRNCvEjNrnSqfxoCCzJpMQ465/
   979PZhM0q0lMdmQ8h9mraPOokUuJSkGYcTM5qUsQ2tSiUy+vJYFhy227B
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10868"; a="417382016"
X-IronPort-AV: E=Sophos;i="6.03,237,1694761200"; 
   d="scan'208";a="417382016"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Oct 2023 07:31:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,237,1694761200"; 
   d="scan'208";a="4769035"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 19 Oct 2023 07:30:04 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qtU3K-0002B4-20;
	Thu, 19 Oct 2023 14:31:10 +0000
Date: Thu, 19 Oct 2023 22:30:22 +0800
From: kernel test robot <lkp@intel.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [axboe-block:for-6.7/io_uring 8/15] checkpatch: WARNING: Prefer
 'unsigned int' to bare use of 'unsigned'
Message-ID: <202310192242.EUEA05UX-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.git for-6.7/io_uring
head:   6ce4a93dbb5bd93bc2bdf14da63f9360a4dcd6a1
commit: f31ecf671ddc498f20219453395794ff2383e06b [8/15] io_uring: add IORING_OP_WAITID support
reproduce: (https://download.01.org/0day-ci/archive/20231019/202310192242.EUEA05UX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310192242.EUEA05UX-lkp@intel.com/

# many are suggestions rather than must-fix

WARNING:UNSPECIFIED_INT: Prefer 'unsigned int' to bare use of 'unsigned'
#444: FILE: io_uring/waitid.c:268:
+static int io_waitid_wait(struct wait_queue_entry *wait, unsigned mode,

WARNING:SPDX_LICENSE_TAG: Missing or malformed SPDX-License-Identifier tag in line 1
#555: FILE: io_uring/waitid.h:1:
+// SPDX-License-Identifier: GPL-2.0

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
