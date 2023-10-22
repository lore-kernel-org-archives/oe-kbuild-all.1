Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E57714A81
	for <oe-kbuild-all@lists.linux.dev>; Sun, 22 Oct 2023 21:47:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XyQzscsF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698011232; x=1729547232;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ggrzxziBoXn62tYH0TGbynV+xHCiN1JghBZVgor+7yg=;
  b=XyQzscsFn/iNDAj02V03L8WDGhsuvJO+SrqfS7F8xeqMC92Is0hgXpKu
   YrJRfIMtvQ8KdO6rBmxcTm1J9BwdcywQWQqjkC0ewAn/2/BvxelAchBW+
   04jkRp9q3qYYOZAKieSzQzIQCWjVKa06XX5Zrx6q4Pr0W42k0Lqhn21sI
   RUe3mw/r5ivSRCLbpbDNt79tzjyPAYUpmW3CK2JPk5u2RftsPxV8beYPk
   Y7whTK+/T6YEeBgD9U/x5EhCtVHlyDe3kwnLGMdEKaAJa31xr7thJZi4z
   +yR/ZdRJzKpMVrs2tcZNq7/dvwUDEvq4hf1jwq3aROmM5EJhVjEtu/QeQ
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10871"; a="386554064"
X-IronPort-AV: E=Sophos;i="6.03,244,1694761200"; 
   d="scan'208";a="386554064"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Oct 2023 14:47:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10871"; a="828240345"
X-IronPort-AV: E=Sophos;i="6.03,244,1694761200"; 
   d="scan'208";a="828240345"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 22 Oct 2023 14:47:11 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qugHs-0006Hi-2s;
	Sun, 22 Oct 2023 21:47:08 +0000
Date: Mon, 23 Oct 2023 05:46:43 +0800
From: kernel test robot <lkp@intel.com>
To: Kemeng Shi <shikemeng@huaweicloud.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [tytso-ext4:dev 39/41] checkpatch: WARNING: quoted string split
 across lines
Message-ID: <202310230514.8t49Y7N5-lkp@intel.com>
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
commit: 28b95ee868072f1cd029245bf96cf02844322f37 [39/41] ext4: run mballoc test with different layouts setting
reproduce: (https://download.01.org/0day-ci/archive/20231023/202310230514.8t49Y7N5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310230514.8t49Y7N5-lkp@intel.com/

# many are suggestions rather than must-fix

WARNING:SPLIT_STRING: quoted string split across lines
#85: FILE: fs/ext4/mballoc-test.c:328:
+	snprintf(desc, KUNIT_PARAM_DESC_SIZE, "block_bits=%d cluster_bits=%d "
+		 "blocks_per_group=%d group_count=%d desc_size=%d\n",

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
