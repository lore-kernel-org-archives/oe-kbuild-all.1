Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9D7F28DCC
	for <oe-kbuild-all@lists.linux.dev>; Mon, 16 Oct 2023 15:17:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Eei2lHhr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697469449; x=1729005449;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=l2PsfIayZ4iCIemFywFcevtqDMB1sbAFlXnJ7U6rV/0=;
  b=Eei2lHhr9Z1dcJQtRfigi6+st++72iJwye44vUXrRblp2+rLQd6dvW3D
   JkyfvO7ZswCNRbV+YxBpes0s3N3/fVzFIgtAxX+P1T9xUKFb+Iw9vSX4Y
   iK18V+9mT5I7tNROM4WfgPzKdNcQJ7TUmfWHSPsv3ysfzuRHEIJKiDcG8
   xzfXAw2Go+VkI5Dpz7uwaCJG1GNBwTn00jD6Xt6US5UeZmI3oSldnsmTb
   4nevmEduJ8VwaSesvKJpXNyrqfMiD5jPLO9JezUSRwiKUmJ8LumuCR8xT
   v7u6cW7vSjMZBsfiWv2kvGa+zgwjK4Cex6U6D7Q8U/++0SXfiRk3a51kP
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10863"; a="365811064"
X-IronPort-AV: E=Sophos;i="6.03,229,1694761200"; 
   d="scan'208";a="365811064"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Oct 2023 08:17:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10863"; a="785113626"
X-IronPort-AV: E=Sophos;i="6.03,229,1694761200"; 
   d="scan'208";a="785113626"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by orsmga008.jf.intel.com with ESMTP; 16 Oct 2023 08:17:27 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qsPLP-0008RH-0i;
	Mon, 16 Oct 2023 15:17:23 +0000
Date: Mon, 16 Oct 2023 23:17:20 +0800
From: kernel test robot <lkp@intel.com>
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [arm:ktext 20/20] checkpatch: ERROR: space prohibited before that
 '++' (ctx:WxB)
Message-ID: <202310162336.8eoVbUee-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.armlinux.org.uk/~rmk/linux-arm.git ktext
head:   a0e73f24a420d793732e6adcddca0ca1337d1ea6
commit: a0e73f24a420d793732e6adcddca0ca1337d1ea6 [20/20] arm64: text replication: verify kernel text
reproduce: (https://download.01.org/0day-ci/archive/20231016/202310162336.8eoVbUee-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310162336.8eoVbUee-lkp@intel.com/

# many are suggestions rather than must-fix

ERROR:SPACING: space prohibited before that '++' (ctx:WxB)
#43: FILE: arch/arm64/mm/ktext.c:147:
+			for (i = n = 0; i < size / 4; i ++) {
 			                                ^

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
