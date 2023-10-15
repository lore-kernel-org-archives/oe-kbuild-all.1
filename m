Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A422215D4
	for <oe-kbuild-all@lists.linux.dev>; Sun, 15 Oct 2023 22:20:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lzN2lE5P"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697408431; x=1728944431;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=mSrFJuvGDY25D1eXGeo/4TobByuArBgpEyotpuxvr38=;
  b=lzN2lE5PXpUo9e5lktSLWeAG7dHmzfIbPcEF3e1fYU5rrwjuVpHWcSLb
   a9LI603W+PaiTxMqxYqTZCnHU1JXGSL9FyNF2+v1LwA5lDHT8W7S0Iar3
   zjV6OpxVbDrhgvrwpHuPgyxSpaOSeXJeTX7fE+O+BqDupO5NnaltCRXFf
   84F4wDLIKgARO+K+Ina0NT7cmXxvhCz6WJXiUhHuDbj2hNr66pje5Kic+
   05koB477ear9OKjIRPwW/Pd90ZIMEbOoHL6l0R8kE0/6fSz84riOS8EUE
   MWfGA5qmEgIwFlSrjT2OFnA0PsbXOHoFlSFMg2W6xpIER+9hiuoBNfM5W
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10863"; a="6987717"
X-IronPort-AV: E=Sophos;i="6.03,226,1694761200"; 
   d="scan'208";a="6987717"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Oct 2023 15:20:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10863"; a="879221495"
X-IronPort-AV: E=Sophos;i="6.03,226,1694761200"; 
   d="scan'208";a="879221495"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by orsmga004.jf.intel.com with ESMTP; 15 Oct 2023 15:20:28 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qs9Qm-0007r5-1E;
	Sun, 15 Oct 2023 22:18:34 +0000
Date: Mon, 16 Oct 2023 06:17:05 +0800
From: kernel test robot <lkp@intel.com>
To: Janne Grunau <j@jannau.net>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [asahilinux:sound/speaker-safety 21/206] checkpatch: WARNING: Block
 comments should align the * on each line
Message-ID: <202310160620.x8eD8xM0-lkp@intel.com>
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
reproduce: (https://download.01.org/0day-ci/archive/20231016/202310160620.x8eD8xM0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310160620.x8eD8xM0-lkp@intel.com/

# many are suggestions rather than must-fix

WARNING:BLOCK_COMMENT_STYLE: Block comments should align the * on each line
#34: FILE: arch/arm64/boot/dts/apple/t600x-j314-j316.dtsi:121:
+		 * best guess is they are cumulative.
+		*/

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
