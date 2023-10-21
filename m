Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C22A1658
	for <oe-kbuild-all@lists.linux.dev>; Sat, 21 Oct 2023 01:26:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GwLAl24f"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697851602; x=1729387602;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=y9YCYIX46vvptVOHzvkNeBcUEKkgJYkFSI3xxPUZVM4=;
  b=GwLAl24f73RtnsKOX1BJz9/YgNQCD9m2cXk4F1K5fM02LRME4YGyaxXg
   rzUqwvdNhZQO6zaeoUgESJB4GM6E2uLdsCiR5wK16PHNdQxS0RMCXel2h
   /GPK8Hr36oS7/UzrZGfRZZDJOs86RSU7jglW57IMQuvIjxtIVQ+CdNbVH
   e8lFhNoYhhOPd7rurN0ncUGOZznO7SYkgd2nMRGuvrpKN1CgiaJtQ87gR
   1ye79iTGV4J5oXSUrDwSL0uSbDC1zLzcn7IuxiQQcJc0l9GLIjrzGTGh1
   K/lCko4ba4E/4/VNPBZiAeudgOD+iSDi2IqMRNllH4eYU3ceQC5Mzb20b
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10869"; a="472825096"
X-IronPort-AV: E=Sophos;i="6.03,239,1694761200"; 
   d="scan'208";a="472825096"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Oct 2023 18:26:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10869"; a="757628146"
X-IronPort-AV: E=Sophos;i="6.03,239,1694761200"; 
   d="scan'208";a="757628146"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 20 Oct 2023 18:26:40 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qu0lC-0004E4-0I;
	Sat, 21 Oct 2023 01:26:38 +0000
Date: Sat, 21 Oct 2023 09:25:48 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Layton <jlayton@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jlayton:mgtime 4/10] kernel/time/timekeeping.c:64:23: sparse:
 sparse: symbol 'mg_fine_ts' was not declared. Should it be static?
Message-ID: <202310210915.at3COghM-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jlayton/linux.git mgtime
head:   b9269c207dabe042a3f9aab433213c70f8f25445
commit: 2043eb793448f54c9784813c785c27589ad2c4d3 [4/10] timekeeping: add new debugfs file to count multigrain timestamps
config: i386-randconfig-062-20231021 (https://download.01.org/0day-ci/archive/20231021/202310210915.at3COghM-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231021/202310210915.at3COghM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310210915.at3COghM-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> kernel/time/timekeeping.c:64:23: sparse: sparse: symbol 'mg_fine_ts' was not declared. Should it be static?
>> kernel/time/timekeeping.c:65:23: sparse: sparse: symbol 'mg_coarse_ts' was not declared. Should it be static?

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
