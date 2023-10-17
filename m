Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F0D441746
	for <oe-kbuild-all@lists.linux.dev>; Tue, 17 Oct 2023 11:44:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VuVUKprA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697543093; x=1729079093;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=7aOJYSlnWtNGG3JAB53teOVsmcBB83dTAvZiV41attk=;
  b=VuVUKprA46lwymX/ffmC06wYeaL2IeJFUPwv/B37+2OkC+jlzpV2Re6l
   jP09mBMq3T+33mUQOG+V6QNuO5KZoAcPgMpVfmiCv2cH1mGcXLaN8fQHi
   nnQMZ9VU7bJbihiGH1zchlMH+D85/PJHikpiZYrn/8KJn0z0wnwja4LSc
   LBQq+QZy8C1t6JJ8F4lNGGxpdhXpDh/eEkAmp72HoSeCcvjBIVWztE98x
   aj+fda5BL7CrHpeu+13VqJfZxO9mgLS/wNuWhAk1sq6zXswTi9u30g68X
   WgHAh+gqwQSFP5tM01vVj0yOW3n4SalTBGloALxqi6QfMC8y7bULt+wZI
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10865"; a="382985570"
X-IronPort-AV: E=Sophos;i="6.03,232,1694761200"; 
   d="scan'208";a="382985570"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Oct 2023 04:44:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10865"; a="1087478514"
X-IronPort-AV: E=Sophos;i="6.03,232,1694761200"; 
   d="scan'208";a="1087478514"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by fmsmga005.fm.intel.com with ESMTP; 17 Oct 2023 04:44:51 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qsiVF-0009YN-1o;
	Tue, 17 Oct 2023 11:44:49 +0000
Date: Tue, 17 Oct 2023 19:44:38 +0800
From: kernel test robot <lkp@intel.com>
To: Jinjie Ruan <ruanjinjie@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [hverkuil-media-tree:extron 172/183] checkpatch: WARNING: Symbolic
 permissions 'S_IRUGO | S_IWUSR' are not preferred. Consider using octal
 permissions '0644'.
Message-ID: <202310171919.VTEKVoOC-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://linuxtv.org/hverkuil/media_tree.git extron
head:   9cb1cb3ffe4f4d29073ccb03f33323cf9c1afd2f
commit: 8cd08e365153481065eeec684ed00949bc980aff [172/183] media: siano: Drop unnecessary error check for debugfs_create_dir/file()
reproduce: (https://download.01.org/0day-ci/archive/20231017/202310171919.VTEKVoOC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310171919.VTEKVoOC-lkp@intel.com/

# many are suggestions rather than must-fix

WARNING:SYMBOLIC_PERMS: Symbolic permissions 'S_IRUGO | S_IWUSR' are not preferred. Consider using octal permissions '0644'.
#65: FILE: drivers/media/common/siano/smsdvb-debugfs.c:368:
+	debugfs_create_file("stats", S_IRUGO | S_IWUSR, client->debugfs,

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
