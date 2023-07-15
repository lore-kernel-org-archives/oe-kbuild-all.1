Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 385BE186B
	for <oe-kbuild-all@lists.linux.dev>; Sat, 15 Jul 2023 18:42:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689446527; x=1720982527;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=KtjBI3Rd+hM3/BoGTZr8x+F2mieFfEmW6zPodSxgkGw=;
  b=B9SFguNl3TOCaUUCetzKn8YF45oJjM/sAmMP+JBvEeail5GzheWIBsXq
   QBM6R2DnhgiF4I4ia46H0q6yjSlLIvXfgEd+JPTFLcgB1yO8ovH0Utara
   1jhbnUwWJHAAyC18Ab2hx6eQyKhYwFLGSPlYEojg0aeZAwcOS8P+sr2ho
   BHT7Fx8lwXKAnBSvflqh2HBgJGQcGzNVM8lOaG19xPabOVU8GouzWq4/8
   1iEqP1+/h41DJtypxGblNITlovD/4TrOtDfjRLMirSyn66zQkTjNDUvkx
   EbVslRopPRwQHudO85rJnkma1gcGJFksuEhuxEafXhqQZgZLIQwUwbrTl
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10772"; a="431860457"
X-IronPort-AV: E=Sophos;i="6.01,208,1684825200"; 
   d="scan'208";a="431860457"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jul 2023 11:42:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10772"; a="969366257"
X-IronPort-AV: E=Sophos;i="6.01,208,1684825200"; 
   d="scan'208";a="969366257"
Received: from lkp-server01.sh.intel.com (HELO c544d7fc5005) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 15 Jul 2023 11:42:05 -0700
Received: from kbuild by c544d7fc5005 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qKkDT-0008JR-3B;
	Sat, 15 Jul 2023 18:42:04 +0000
Date: Sun, 16 Jul 2023 02:41:43 +0800
From: kernel test robot <lkp@intel.com>
To: Christian Brauner <brauner@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Christoph Hellwig <hch@lst.de>
Subject: fs/overlayfs/copy_up.o: warning: objtool: .text.unlikely: unexpected
 end of section
Message-ID: <202307160233.UXi0pI5S-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   831fe284d8275987596b7d640518dddba5735f61
commit: abf08576afe31506b812c8c1be9714f78613f300 fs: port vfs_*() helpers to struct mnt_idmap
date:   6 months ago
config: x86_64-buildonly-randconfig-r002-20230716 (https://download.01.org/0day-ci/archive/20230716/202307160233.UXi0pI5S-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230716/202307160233.UXi0pI5S-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307160233.UXi0pI5S-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/overlayfs/copy_up.o: warning: objtool: .text.unlikely: unexpected end of section

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
