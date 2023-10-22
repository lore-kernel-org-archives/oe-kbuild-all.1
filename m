Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D878D23BE
	for <oe-kbuild-all@lists.linux.dev>; Sun, 22 Oct 2023 19:58:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PKREs6uX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698004689; x=1729540689;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=eM6hMgzfmr2r/36nRbsU9m8BV2/wgPv8NktCkD5aefs=;
  b=PKREs6uXZk2k/sEHjuZkyGO13Dn25soFizc7cZKu6+XFZQoEoi9EzZT+
   nMBNZF6k8rZimmsDQAO6q0tECnzdEcN7preOxoUQPj4G8eC5isoc0/eW/
   3jX9VJ1h+/OsNbs6iNsQRt7Od5bEOMvPMvXg5egneMVq3anoEQ5jXvA1K
   OeIozu8BVrxb43RM/j+kfGRZ0myzjReoM7KFrkFyNj/pocAFIC8ag4uU4
   4P5qYfft0Rx95cSB9vAAYBJkiWfzhgaAjcJlukq9gOn78hf8H0lR7ojoD
   /XIGsYdoQF4onaSlubhQ+/leAA5Tgqq/O9pes7IG6eKmewtnChV3Az4W2
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10871"; a="366080741"
X-IronPort-AV: E=Sophos;i="6.03,243,1694761200"; 
   d="scan'208";a="366080741"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Oct 2023 12:58:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10871"; a="901612373"
X-IronPort-AV: E=Sophos;i="6.03,243,1694761200"; 
   d="scan'208";a="901612373"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 22 Oct 2023 12:55:52 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1queaM-0006Ec-0L;
	Sun, 22 Oct 2023 19:58:06 +0000
Date: Mon, 23 Oct 2023 03:57:56 +0800
From: kernel test robot <lkp@intel.com>
To: Wang Jianjian <wangjianjian0@foxmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [tytso-ext4:dev 8/41] checkpatch: ERROR: code indent should use tabs
 where possible
Message-ID: <202310230346.FiXvIhvW-lkp@intel.com>
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
commit: ebf6cb7c6e1241984f75f29f1bdbfa2fe7168f88 [8/41] ext4: no need to generate from free list in mballoc
reproduce: (https://download.01.org/0day-ci/archive/20231023/202310230346.FiXvIhvW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310230346.FiXvIhvW-lkp@intel.com/

# many are suggestions rather than must-fix

ERROR:CODE_INDENT: code indent should use tabs where possible
#43: FILE: fs/ext4/mballoc.c:1365:
+^I^I        goto out;$

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
