Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2811A46
	for <oe-kbuild-all@lists.linux.dev>; Fri, 13 Oct 2023 00:04:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dlgY4oAX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697155464; x=1728691464;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=x7N/JdA61GqsRJl+dd7YfLkMnqGQnxHnjkpAMsAEHUQ=;
  b=dlgY4oAX9qjfqyTeCIVDImWklzsLi4PpnhEhKXckydk3ZNMSnY176F3i
   goqpV7YK5SIbZ/6zUycRaG3L2iZq61QC3xWknbh06IWJ2+KZ8voi00eaZ
   y8VJEtQOPGEjWAXnBX8zofL+HqHA7y2Xb4tpCi3MgYNROGwlBBWepFhBm
   XoJYqx383cPLikftMQ3JIbiiy+nrT/1ephPccqkS6b7T7Hdh4YgBLWsYc
   Q2HsCT0S5+uifDR87grogoUWSlW/f5IER5O4VKub5k+uwub60uUJTmhrC
   TBj3ZtXxnvdeT7+TvHPP2+WOaUC39yDyDhdE6WjZUmkiCcEUb0/yBvK51
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10861"; a="387922525"
X-IronPort-AV: E=Sophos;i="6.03,219,1694761200"; 
   d="scan'208";a="387922525"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Oct 2023 17:04:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10861"; a="1001713784"
X-IronPort-AV: E=Sophos;i="6.03,219,1694761200"; 
   d="scan'208";a="1001713784"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by fmsmga006.fm.intel.com with ESMTP; 12 Oct 2023 17:04:17 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qr5f4-00045x-1y;
	Fri, 13 Oct 2023 00:04:14 +0000
Date: Fri, 13 Oct 2023 08:03:48 +0800
From: kernel test robot <lkp@intel.com>
To: John Watts <contact@jookia.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [broonie-ci:20231012_pierre_louis_bossart_asoc_codecs_rt715_update_misleading_error_log
 39/106] checkpatch: WARNING: static const char * array should probably be
 static const char * const
Message-ID: <202310130849.gpul9zOS-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/ci.git 20231012_pierre_louis_bossart_asoc_codecs_rt715_update_misleading_error_log
head:   078d3a4b120f82d57778466de62929bb8824b664
commit: 00524a8415aa400567538c0e75a463d517cded7f [39/106] ASoC: wm8782: Constrain maximum audio rate at runtime
reproduce: (https://download.01.org/0day-ci/archive/20231013/202310130849.gpul9zOS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310130849.gpul9zOS-lkp@intel.com/

# many are suggestions rather than must-fix

WARNING:STATIC_CONST_CHAR_ARRAY: static const char * array should probably be static const char * const
#27: FILE: sound/soc/codecs/wm8782.c:27:
+static const char *supply_names[] = {

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
