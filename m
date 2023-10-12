Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABF69273CA
	for <oe-kbuild-all@lists.linux.dev>; Thu, 12 Oct 2023 16:33:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UzyVm+iv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697128426; x=1728664426;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=whBp0Y0o5h2h6Slf5P4LOzr8VhijaxKfSld4PVZndlY=;
  b=UzyVm+ivX+/EYlN0KMd8hU+gjAmyer9Xe9X6BchoxYoQLe+WZ3HGfMsP
   yBsXQZsyWC1qIjINDfXshaCDXpV8x0O6pZrwMhukDzz7d9r/Fxb58IkXq
   GYYUupWGIZ8/fjSadOblHVXlVqMddAz34TjFK/ZQQ+Q0LM4TwbNXIMZiy
   1W35dVPhEuyLp8s9hsNlmwZaaiig6frdo8bVw9MMhRe28l4MvFYwA5iXh
   +8YcX+3avymnlGApnXIwU4DE2XdZ9pYoEkvLIQ4W4fAFBXMkuJapyYBD5
   pS3LNmDHoP9ubH8UM+xArbYyeydFrkB/4ONIa/qZQ86WBcvk2z8UpI0A7
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10861"; a="384812951"
X-IronPort-AV: E=Sophos;i="6.03,219,1694761200"; 
   d="scan'208";a="384812951"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Oct 2023 09:33:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10861"; a="1001590472"
X-IronPort-AV: E=Sophos;i="6.03,219,1694761200"; 
   d="scan'208";a="1001590472"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by fmsmga006.fm.intel.com with ESMTP; 12 Oct 2023 09:33:45 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qqyd4-0003dn-16;
	Thu, 12 Oct 2023 16:33:42 +0000
Date: Fri, 13 Oct 2023 00:32:56 +0800
From: kernel test robot <lkp@intel.com>
To: Janne Grunau <j@jannau.net>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [asahilinux:sound/speaker-safety 21/196] checkpatch: WARNING: Block
 comments should align the * on each line
Message-ID: <202310130052.KDjJnFdW-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/AsahiLinux/linux sound/speaker-safety
head:   899711ed1c90b438d31e322d1b0638b328435963
commit: e0861b512d7e5cb7441ea92e5063376370585224 [21/196] arm64: dts: apple: j31[46]: Add keyboard nodes
reproduce: (https://download.01.org/0day-ci/archive/20231013/202310130052.KDjJnFdW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310130052.KDjJnFdW-lkp@intel.com/

# many are suggestions rather than must-fix

WARNING:BLOCK_COMMENT_STYLE: Block comments should align the * on each line
#34: FILE: arch/arm64/boot/dts/apple/t600x-j314-j316.dtsi:121:
+		 * best guess is they are cumulative.
+		*/

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
