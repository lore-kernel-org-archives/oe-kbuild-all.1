Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 997CD12E6B
	for <oe-kbuild-all@lists.linux.dev>; Thu, 12 Oct 2023 08:34:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="h0u3Vc36"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697099668; x=1728635668;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=O1TqodCGdJSJs3SsICR0xLCFF2+fUVBXAk1YQUOI0R4=;
  b=h0u3Vc367wVCEtIKc7jbZq0T0croctIN3GLH7wdW4lgHanstPLCLA/SC
   mEVbtNZhsqqf/wPbAUQyRbk9H6HvcPZQwYr3DO+rmksPaL8iZkI0ljL/z
   8gJRV6TDBl+W7YnRL7PJBgqiDbXJVKFsVcrJO5KwpbwFxY8Re4lgfR0n7
   M9urtDsZ3vVyFud4xGIZFjm6CDh7fEHRIxapil11sXg88l2PqPiwiPLr1
   AXsQ+2w65mnTf/hF6t1rPNJ+6nRLTBbdLDJalB7YnStoa6NOyFMRySvxV
   bpEf+SgyiulAgY3VGmpqDdeIHFKF05jYhUJp8EXBWbrEFwPNKeuahszZP
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10860"; a="387703204"
X-IronPort-AV: E=Sophos;i="6.03,218,1694761200"; 
   d="scan'208";a="387703204"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Oct 2023 01:34:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10860"; a="783606150"
X-IronPort-AV: E=Sophos;i="6.03,218,1694761200"; 
   d="scan'208";a="783606150"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by orsmga008.jf.intel.com with ESMTP; 12 Oct 2023 01:34:23 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qqr9A-0003KZ-2n;
	Thu, 12 Oct 2023 08:34:20 +0000
Date: Thu, 12 Oct 2023 16:33:27 +0800
From: kernel test robot <lkp@intel.com>
To: Daniel Golle <daniel@makrotopia.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [linusw-pinctrl:ib-no-global-numberspace 2/66] checkpatch: WARNING:
 static const char * array should probably be static const char * const
Message-ID: <202310121648.Zs0yrgUT-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git ib-no-global-numberspace
head:   c341ac65bf2bf297a6e4db61c34c00971876fad6
commit: 01499e51d1a75cd00238828ca58e252c6f9714f1 [2/66] pinctrl: mediatek: mt7981: add additional uart groups
reproduce: (https://download.01.org/0day-ci/archive/20231012/202310121648.Zs0yrgUT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310121648.Zs0yrgUT-lkp@intel.com/

# many are suggestions rather than must-fix

WARNING:STATIC_CONST_CHAR_ARRAY: static const char * array should probably be static const char * const
#65: FILE: drivers/pinctrl/mediatek/pinctrl-mt7981.c:935:
+static const char *mt7981_uart_groups[] = { "net_wo0_uart_txd_0", "net_wo0_uart_txd_1",

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
