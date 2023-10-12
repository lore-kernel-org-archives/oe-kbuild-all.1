Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C9927EF
	for <oe-kbuild-all@lists.linux.dev>; Thu, 12 Oct 2023 00:35:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Yw7MAMnE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697070949; x=1728606949;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=a/wtkMOZvwxsDj99r6bZe4jcPa3z0rBrqK9IfCUKHY4=;
  b=Yw7MAMnEd4JbiOW6kHrtBXHr0de0A354Jc4u+9eIDIX/pyH/ppoAX9Kw
   I184JGikpPUnwX4Cp/iqJLqH/cdYWzQojxeynn6gBKkMShcO9oPlMCByR
   g+gvt3I05i3lQB6P1MN4/IeIh9MKQ8yx1Qb4bML8p/foKu6Cf0NkSfyst
   5MF4VZ3vFWKskYc312qXDU1C4PRoeDXd3GyINCYWueQduyrcjwAjmPvw4
   y4QIYpyX6QK9LTyB9d/BRQZhftTVkNYA3rUjSNRaNjXci402ipaSN6jsM
   IM8GpWBPji34kQ40U2UrDoytlM6cmwa7riKITz/S4DjqJUboWOX9QyfVZ
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10860"; a="6352537"
X-IronPort-AV: E=Sophos;i="6.03,217,1694761200"; 
   d="scan'208";a="6352537"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Oct 2023 17:35:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10860"; a="1085458972"
X-IronPort-AV: E=Sophos;i="6.03,217,1694761200"; 
   d="scan'208";a="1085458972"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by fmsmga005.fm.intel.com with ESMTP; 11 Oct 2023 17:35:46 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qqjg0-0002u8-0H;
	Thu, 12 Oct 2023 00:35:44 +0000
Date: Thu, 12 Oct 2023 08:35:42 +0800
From: kernel test robot <lkp@intel.com>
To: "Darrick J. Wong" <darrick.wong@oracle.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [djwong-xfs:inode-refactor 42/269] checkpatch: WARNING: Missing or
 malformed SPDX-License-Identifier tag in line 1
Message-ID: <202310120858.61a0iWw7-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/djwong/xfs-linux.git inode-refactor
head:   5d7848682f41b20567e9d24b7c29a6d3964f0de6
commit: fad5ca479ab9604d5679ae6b90e6dcaea1fd178c [42/269] xfs: allow scrub to hook metadata updates in other writers
reproduce: (https://download.01.org/0day-ci/archive/20231012/202310120858.61a0iWw7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310120858.61a0iWw7-lkp@intel.com/

# many are suggestions rather than must-fix

WARNING:SPDX_LICENSE_TAG: Missing or malformed SPDX-License-Identifier tag in line 1
#179: FILE: fs/xfs/xfs_hooks.h:1:
+// SPDX-License-Identifier: GPL-2.0-or-later

ERROR:COMPLEX_MACRO: Macros with complex values should be enclosed in parentheses
#203: FILE: fs/xfs/xfs_hooks.h:25:
+# define DEFINE_STATIC_XFS_HOOK_SWITCH(name) \
+	static DEFINE_STATIC_KEY_FALSE(name)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
