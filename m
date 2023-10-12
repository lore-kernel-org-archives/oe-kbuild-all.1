Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34A1962A
	for <oe-kbuild-all@lists.linux.dev>; Thu, 12 Oct 2023 03:25:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FrILHplv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697081133; x=1728617133;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=uR2V/dKxh6N24Vsdq2a3/w2y9Qxix/5vtRgAGewqffY=;
  b=FrILHplvAcG4s9EZ+mUdJouiLMYqArawZ4DU9cmTNfzvNjoLae5+O92s
   T7QbjViDXrpEVKldmhDeUS1bL3KDS+nCEuzONXJZAaUnPZFndF1UekZXm
   urDy8FldVx0Wh7PaFXaa9YQbm+TDIHIR/ip07cp9fGAqjUWoN8mYY3qy4
   rF+9XSB+GPEeriNtFP+Dv1oung6cTpjb+J9cNrO5EphQU13JqxvCZRezY
   1cn5JxiHFGUf7bPRdLJw0XXofLjMXXtX8biQu1OSx90zoZnxyKHnMIxce
   VxHac1v+bm1fPERW7h9W8gwuEpOfF/CbMkaVo53CykGgzM/GVgbw1vhdw
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10860"; a="388683255"
X-IronPort-AV: E=Sophos;i="6.03,217,1694761200"; 
   d="scan'208";a="388683255"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Oct 2023 20:25:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10860"; a="747711512"
X-IronPort-AV: E=Sophos;i="6.03,217,1694761200"; 
   d="scan'208";a="747711512"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by orsmga007.jf.intel.com with ESMTP; 11 Oct 2023 20:25:30 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qqmKG-00035r-3D;
	Thu, 12 Oct 2023 03:25:29 +0000
Date: Thu, 12 Oct 2023 11:25:19 +0800
From: kernel test robot <lkp@intel.com>
To: "Darrick J. Wong" <darrick.wong@oracle.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [djwong-xfs:inode-refactor 80/269] checkpatch: WARNING: Prefer
 'unsigned int' to bare use of 'unsigned'
Message-ID: <202310121106.ESR4ia8o-lkp@intel.com>
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
commit: d1124effa3dc2863ea58d06b4e8274b707c1ea98 [80/269] xfs: connect in-memory btrees to xfiles
reproduce: (https://download.01.org/0day-ci/archive/20231012/202310121106.ESR4ia8o-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310121106.ESR4ia8o-lkp@intel.com/

# many are suggestions rather than must-fix

WARNING:UNSPECIFIED_INT: Prefer 'unsigned int' to bare use of 'unsigned'
#297: FILE: fs/xfs/scrub/trace.h:2179:
+		__field(unsigned, lockval)

WARNING:UNSPECIFIED_INT: Prefer 'unsigned int' to bare use of 'unsigned'
#298: FILE: fs/xfs/scrub/trace.h:2180:
+		__field(unsigned, flags)

WARNING:SPLIT_STRING: quoted string split across lines
#310: FILE: fs/xfs/scrub/trace.h:2192:
+	TP_printk("xfino 0x%lx daddr 0x%llx bbcount 0x%x hold %d pincount %d "
+		  "lock %d flags %s",

WARNING:BRACES: braces {} are not necessary for any arm of this statement
#646: FILE: fs/xfs/scrub/xfbtree.c:600:
+	if (error == -ENODATA) {
[...]
+	} else if (error) {
[...]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
