Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58CDDA38
	for <oe-kbuild-all@lists.linux.dev>; Sun, 22 Oct 2023 20:53:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nCEii3aG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698007991; x=1729543991;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=sNSxkfdWsfalnxSSYukz67knR9j3YDhfycEs/mZo9GI=;
  b=nCEii3aGrt7cgiKnUGr+a7sRg+RkO68+XBW/1lQMLifleICPuvy34Ws8
   NXLQI4HDqNF5iL6SjYhT7KzbUGzMD4w6H+azx2Assqp0YrDU4Yhjq8uYQ
   /OW5hZB701+OOgnaHnDoQ1A7/5J+0E0J+RUbmpvNy75k8sm72mLTmFk+y
   tLzX8f/BNJ1k/JnqQ3elxXHCVdcJS7fxoGyFU6bgVo4fhwFjAj8aTxu3t
   qa2TJL3qsqs//arSzPeaisQ+7Vs8CRBT1QeiNX2QPidN+pxh9Xh3cjpEh
   z8jQNN/VKEk1sWFViDyATSEe4k4DxO6cclE6RGAicmBNvrPaPXCr5ZG8r
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10871"; a="371801038"
X-IronPort-AV: E=Sophos;i="6.03,244,1694761200"; 
   d="scan'208";a="371801038"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Oct 2023 13:53:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10871"; a="1005114051"
X-IronPort-AV: E=Sophos;i="6.03,244,1694761200"; 
   d="scan'208";a="1005114051"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 22 Oct 2023 13:53:09 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qufRb-0006Fs-15;
	Sun, 22 Oct 2023 20:53:07 +0000
Date: Mon, 23 Oct 2023 04:52:31 +0800
From: kernel test robot <lkp@intel.com>
To: Ye Bin <yebin10@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [tytso-ext4:dev 23/41] checkpatch: WARNING: quoted string split
 across lines
Message-ID: <202310230457.fWPHucQd-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tytso/ext4.git dev
head:   c388da1dad59dc24801b61bc63539cab6cd83e23
commit: 8b6b562121f1981315e76b6ae1f8a5cbbcf14bd7 [23/41] jbd2: fix printk format type for 'io_block' in do_one_pass()
reproduce: (https://download.01.org/0day-ci/archive/20231023/202310230457.fWPHucQd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310230457.fWPHucQd-lkp@intel.com/

# many are suggestions rather than must-fix

WARNING:SPLIT_STRING: quoted string split across lines
#25: FILE: fs/jbd2/recovery.c:635:
 						"JBD2: IO error %d recovering "
+						"block %lu in log\n",

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
