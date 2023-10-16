Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94E7A2374B
	for <oe-kbuild-all@lists.linux.dev>; Mon, 16 Oct 2023 11:44:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UBSzyJFy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697456671; x=1728992671;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=gd+wCXYdrFLZN9VmBiii3A0mfAC8wCLfI7Ix4Og8W5o=;
  b=UBSzyJFyj3FyQVAiPuwRn5F/QUXDlbr2ClTnI74quG7JWlbfkOP3Wf2U
   iHVHpzblTDRFKNbqr5lklsBEvsUcYmxY80nRwZ/LvwQz+CnvWnYou0+Qz
   fZmHitaqjfkeVnHtIq26As93CEPVkbhUThUdZHJNi56TFZn7mB9cIPoly
   vJfYFcnuHlHiO3H6XIIImdbkNLBWpjbS5Hi8pE/NwuqGw/6XBe59YYjbA
   vkLctChxJJsep+Wxa7/UNcHsXIdQdiw2/xcxhwrYRB7Ofgiq6F2RJGhuC
   neQ2s/cvyJsmtTBYHN0EEa4Vov4oKxGIgs8nLlQyuEqIxuEPDavv/i4MS
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10863"; a="365763378"
X-IronPort-AV: E=Sophos;i="6.03,229,1694761200"; 
   d="scan'208";a="365763378"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Oct 2023 04:44:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10863"; a="759363956"
X-IronPort-AV: E=Sophos;i="6.03,229,1694761200"; 
   d="scan'208";a="759363956"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by fmsmga007.fm.intel.com with ESMTP; 16 Oct 2023 04:44:29 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qsM1J-0008Lj-2h;
	Mon, 16 Oct 2023 11:44:26 +0000
Date: Mon, 16 Oct 2023 19:43:32 +0800
From: kernel test robot <lkp@intel.com>
To: Amir Goldstein <amir73il@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [amir73il:fuse-backing-fd 14/29] checkpatch: ERROR: Macros with
 complex values should be enclosed in parentheses
Message-ID: <202310161925.hhxjUaLh-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/amir73il/linux fuse-backing-fd
head:   f03ede00336ef2e0770b7b634af07815c476250c
commit: a3ba0ba4040c5dec310c22b384005f08600364db [14/29] ovl: Support escaped overlay.* xattrs
reproduce: (https://download.01.org/0day-ci/archive/20231016/202310161925.hhxjUaLh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310161925.hhxjUaLh-lkp@intel.com/

# many are suggestions rather than must-fix

ERROR:COMPLEX_MACRO: Macros with complex values should be enclosed in parentheses
#46: FILE: fs/overlayfs/overlayfs.h:37:
+#define OVL_XATTR_ESCAPE_TRUSTED_PREFIX OVL_XATTR_TRUSTED_PREFIX OVL_XATTR_ESCAPE_PREFIX

ERROR:COMPLEX_MACRO: Macros with complex values should be enclosed in parentheses
#48: FILE: fs/overlayfs/overlayfs.h:39:
+#define OVL_XATTR_ESCAPE_USER_PREFIX OVL_XATTR_USER_PREFIX OVL_XATTR_ESCAPE_PREFIX

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
