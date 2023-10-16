Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8AB9EA8
	for <oe-kbuild-all@lists.linux.dev>; Mon, 16 Oct 2023 01:03:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AdONa7zX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697418207; x=1728954207;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=BfcCRnVLE4Cr9l9C4SruTc976XQj6s/gyPpGGKLrNdQ=;
  b=AdONa7zXVBeFYOxM/tNXw+LZ/pGedS68JvpAQVYwv47NbP4jUtY1499I
   HZAgAr6TT4moMqJj9ZjKc9xXgQER0hI6nkKOyeJ55StaVrU6gXuG+0JGY
   oz82y7z/6Mvz97RsBXu/j9dy8xBgsGBQKesAPsLInKXQ87zn/D9RqTqVM
   XCNThlBaSDE8KORoq/oQmjz0DVb4BUXbqBPWjrK8RRpHiW98ydRJhjWmn
   VMwR9D56Uoq2OuPOzzwUEeBp8VC0J0pKEnCKkR7/lXfg8Yj/KsLKNae5j
   mcJ0zU6HBn/SnwrzIUenKmGfZu+EMItmdHc5jy8QxZlhD7hNX6o/tJX5o
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10863"; a="388291329"
X-IronPort-AV: E=Sophos;i="6.03,228,1694761200"; 
   d="scan'208";a="388291329"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Oct 2023 18:03:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10863"; a="879247112"
X-IronPort-AV: E=Sophos;i="6.03,228,1694761200"; 
   d="scan'208";a="879247112"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by orsmga004.jf.intel.com with ESMTP; 15 Oct 2023 18:03:20 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qsC0r-0007zM-2u;
	Mon, 16 Oct 2023 01:03:17 +0000
Date: Mon, 16 Oct 2023 09:02:59 +0800
From: kernel test robot <lkp@intel.com>
To: Janne Grunau <j@jannau.net>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [asahilinux:sound/speaker-safety 21/206] checkpatch: WARNING: Block
 comments should align the * on each line
Message-ID: <202310160859.TuIVttgL-lkp@intel.com>
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
commit: e0861b512d7e5cb7441ea92e5063376370585224 [21/206] arm64: dts: apple: j31[46]: Add keyboard nodes
reproduce: (https://download.01.org/0day-ci/archive/20231016/202310160859.TuIVttgL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310160859.TuIVttgL-lkp@intel.com/

# many are suggestions rather than must-fix

WARNING:BLOCK_COMMENT_STYLE: Block comments should align the * on each line
#34: FILE: arch/arm64/boot/dts/apple/t600x-j314-j316.dtsi:121:
+		 * best guess is they are cumulative.
+		*/

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
