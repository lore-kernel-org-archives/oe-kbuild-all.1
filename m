Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1883821101
	for <oe-kbuild-all@lists.linux.dev>; Mon, 16 Oct 2023 11:09:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NmZk8X06"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697454570; x=1728990570;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=dQ7Mt153eASUQkpWJOoBL7n/RCb9OH9iuErJnrUzlSE=;
  b=NmZk8X06k/FmSm3r646c6+Oc0DMIztNez3nXXeyBwKcg8xZMMPPL7CK+
   FCdqhMIa08mjIRW4sjGFo0G+USoVc1TdISC4z6OpIFRvmIMRo7kPRbeWg
   kDy3EIQl8zu1W25pcv4SaXGSNOLkey3M/6Mp5lV+V/eHBdzfA6vamsLSr
   Q6kETUHKkosnEfzhd/fZViHj/YIFQI0ug4gyDn0pikRvBJnVB48CQTQN4
   ni6PzonRpy7D2Vs0BV5n4IgAoc+bij8S18luZmuew02owUZwpgNZTa0R2
   hGGOW9bIPoXfDxqPifLmJqCwkYNRC7OxZr8dsi5eKQjPf1nbEnzSBRrkz
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10863"; a="364853972"
X-IronPort-AV: E=Sophos;i="6.03,229,1694761200"; 
   d="scan'208";a="364853972"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Oct 2023 04:09:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,229,1694761200"; 
   d="scan'208";a="3585539"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by fmviesa001.fm.intel.com with ESMTP; 16 Oct 2023 04:09:32 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qsLTP-0008Jp-22;
	Mon, 16 Oct 2023 11:09:23 +0000
Date: Mon, 16 Oct 2023 19:08:52 +0800
From: kernel test robot <lkp@intel.com>
To: Jinjie Ruan <ruanjinjie@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [hverkuil-media-tree:for-v6.7p 172/180] checkpatch: WARNING:
 Symbolic permissions 'S_IRUGO | S_IWUSR' are not preferred. Consider using
 octal permissions '0644'.
Message-ID: <202310161958.kSiGlOOs-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://linuxtv.org/hverkuil/media_tree.git for-v6.7p
head:   3df5704d52d7a8077c1813ca553d83965ccd7c47
commit: 8cd08e365153481065eeec684ed00949bc980aff [172/180] media: siano: Drop unnecessary error check for debugfs_create_dir/file()
reproduce: (https://download.01.org/0day-ci/archive/20231016/202310161958.kSiGlOOs-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310161958.kSiGlOOs-lkp@intel.com/

# many are suggestions rather than must-fix

WARNING:SYMBOLIC_PERMS: Symbolic permissions 'S_IRUGO | S_IWUSR' are not preferred. Consider using octal permissions '0644'.
#65: FILE: drivers/media/common/siano/smsdvb-debugfs.c:368:
+	debugfs_create_file("stats", S_IRUGO | S_IWUSR, client->debugfs,

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
