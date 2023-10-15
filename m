Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5156414AA1
	for <oe-kbuild-all@lists.linux.dev>; Sun, 15 Oct 2023 22:22:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fGX6JYN3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697408561; x=1728944561;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=7v73Gfv6AD2qjLULzgLmqGxxNfQQ9Y+FUZ2vGXZm+ys=;
  b=fGX6JYN3+AJ7XrJpqnCCnCMtuRYbcLhm9SDxQul2OQ9R8uOQyh3DcUbV
   ZyKOAt3bdrN+6LHJU3YbT5UcHw0Aom2hRBReEWAG9JV5W5v5ZZeU533UC
   NOlX4MuiqNnf0l9O+EqdnM1eTfsbzFBLEfYBM9zUUIoW4ohlfHf+kP0rS
   ojurvWCZzzo9qpcXGmmJiMvqyGDIRnA+yj408wfxo2N2lzvUqtvG9bUFQ
   ggyBvOzlsV4m6Es+GHkF8Q2RyA3PtcEBCm/Plncsnhl0h8MbXCAxG3US1
   SiPRnULpheJfZB8rjEopxvt8zYJc1Gm+/xRJHckY+1LYsRP/K9eCVF8ia
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10863"; a="385256768"
X-IronPort-AV: E=Sophos;i="6.03,226,1694761200"; 
   d="scan'208";a="385256768"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Oct 2023 15:22:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10863"; a="929142081"
X-IronPort-AV: E=Sophos;i="6.03,226,1694761200"; 
   d="scan'208";a="929142081"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by orsmga005.jf.intel.com with ESMTP; 15 Oct 2023 15:22:39 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qs9VL-0007rT-14;
	Sun, 15 Oct 2023 22:22:36 +0000
Date: Mon, 16 Oct 2023 06:17:48 +0800
From: kernel test robot <lkp@intel.com>
To: Martin =?utf-8?Q?Povi=C5=A1er?= <povik+lin@cutebit.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [asahilinux:sound/speaker-safety 28/206] checkpatch: WARNING: Block
 comments should align the * on each line
Message-ID: <202310160612.CGA1sx12-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/AsahiLinux/linux sound/speaker-safety
head:   c4c1ca0ec7d6b3dcce7304ea88eaaad52f090d90
commit: 422ed2de70b58ed698fcca188eacbdc566d760b8 [28/206] arm64: dts: apple: t600x-jxxx: Put in audio nodes
reproduce: (https://download.01.org/0day-ci/archive/20231016/202310160612.CGA1sx12-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310160612.CGA1sx12-lkp@intel.com/

# many are suggestions rather than must-fix

WARNING:BLOCK_COMMENT_STYLE: Block comments should align the * on each line
#244: FILE: arch/arm64/boot/dts/apple/t600x-j375.dtsi:221:
+			/*
+			* DANGER ZONE: You can blow your speakers!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
