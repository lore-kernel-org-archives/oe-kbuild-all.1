Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 079EA12E45
	for <oe-kbuild-all@lists.linux.dev>; Thu, 12 Oct 2023 13:01:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JZZYEYsl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697115669; x=1728651669;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=JHRu+V1Nj9wkB13D2Z1mdu5RA81WY7IhIg0eKsSvP6Q=;
  b=JZZYEYsl6J6gXsJbVrmVvAWy0qYlE9Ihu3XnWqy/dWHrDs2DZXfdbaw2
   F3jJ3BeIWYk+mePi+guBNg4Kn3JO8TZQ5ODNJSXJrE0WuqjuqlqWbF6Ev
   CNFP7EmXR6heAAE66sALtm7ouXuQtl9X49zHo4JzOm0R5HdLuWf/bjcM7
   4lIHlPyHlYZXPDoFqV/pNjnMM/sOPz93Kv+JgbzV+Z+9Q8XDwsXmCrV3/
   XXpAi71QAPJugpH86IyFE+FuvJ6JEGAi2K/fivYMIKE41FVKW7u+B+hPS
   OVsvdjIlQDyNNmwz4BLf39FpTTkYRHgHnukwU67J2/WwB0PzM2qsIQ0sB
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10861"; a="388769667"
X-IronPort-AV: E=Sophos;i="6.03,219,1694761200"; 
   d="scan'208";a="388769667"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Oct 2023 06:01:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10861"; a="758010795"
X-IronPort-AV: E=Sophos;i="6.03,219,1694761200"; 
   d="scan'208";a="758010795"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by fmsmga007.fm.intel.com with ESMTP; 12 Oct 2023 06:01:02 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qqvJE-0003SU-0h;
	Thu, 12 Oct 2023 13:01:00 +0000
Date: Thu, 12 Oct 2023 21:00:01 +0800
From: kernel test robot <lkp@intel.com>
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [arm:ktext 19/20] checkpatch: WARNING: externs should be avoided in
 .c files
Message-ID: <202310122013.uCVW9KnF-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.armlinux.org.uk/~rmk/linux-arm.git ktext
head:   7fa946ce05c273d5ff092c814efe64978e5faf45
commit: 460488c7f4c09ae8257b056945e0dd375fe6794b [19/20] arm64: text replication: add test module
reproduce: (https://download.01.org/0day-ci/archive/20231012/202310122013.uCVW9KnF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310122013.uCVW9KnF-lkp@intel.com/

# many are suggestions rather than must-fix

WARNING:AVOID_EXTERNS: externs should be avoided in .c files
#109: FILE: arch/arm64/mm/ktext-test.c:40:
+extern const char ktext_nid[32];

WARNING:SYMBOLIC_PERMS: Symbolic permissions 'S_IRUSR' are not preferred. Consider using octal permissions '0400'.
#145: FILE: arch/arm64/mm/ktext-test.c:76:
+	if (!proc_create("ttbr1", S_IRUSR, dir, &ttbr1_fops) ||

WARNING:SYMBOLIC_PERMS: Symbolic permissions 'S_IRUSR' are not preferred. Consider using octal permissions '0400'.
#146: FILE: arch/arm64/mm/ktext-test.c:77:
+	    !proc_create("text_nid", S_IRUSR, dir, &nid_fops)) {

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
