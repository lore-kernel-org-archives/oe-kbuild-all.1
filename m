Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C75617F7
	for <oe-kbuild-all@lists.linux.dev>; Mon, 16 Oct 2023 02:24:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KMYR9dmT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697423083; x=1728959083;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=1xeJ+RLgYLaMiOYc0lQNGUp164Ohf/CzbsvUFy3gdo0=;
  b=KMYR9dmTWwYSiB3bOXuyZ1fmY2V8pdiIVO01hq7B2J1Qz7i7FhR857re
   NRRhdIvB6Z3+5UMVy34bswTfmtUu4OFb9p+zcONvZ9hzI/U7DrKzIEbFw
   FwTSLubvJCK5FmG0dIEFhKpg8xR+O1rthrV6vRWi86DyXvTHe/yZae0nh
   JOZVYa7RFKBc91AGaB68VafGOHCPxGJmvFhM92p892nKsqS0szwkylXhY
   XbuyVdwu+/gh83iSWVrCLlZ+IccIuD2FnISQ+pCzcMqSUmg7SSPCovQnI
   3X2Vg/nVS/g6aybnsjsdnAPVs6swDtnPMMxcbP9hIZZc/1TU6m5Vi2y5N
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10863"; a="389292660"
X-IronPort-AV: E=Sophos;i="6.03,228,1694761200"; 
   d="scan'208";a="389292660"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Oct 2023 19:24:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10863"; a="899313782"
X-IronPort-AV: E=Sophos;i="6.03,228,1694761200"; 
   d="scan'208";a="899313782"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by fmsmga001.fm.intel.com with ESMTP; 15 Oct 2023 19:22:41 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qsDHY-00081R-2y;
	Mon, 16 Oct 2023 02:24:36 +0000
Date: Mon, 16 Oct 2023 10:23:39 +0800
From: kernel test robot <lkp@intel.com>
To: Martin =?utf-8?Q?Povi=C5=A1er?= <povik+lin@cutebit.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [asahilinux:sound/speaker-safety 169/206] checkpatch: WARNING:
 Consider removing the code enclosed by this #if 0 and its #endif
Message-ID: <202310161041.M2BolY7N-lkp@intel.com>
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
commit: c30c854b2d7cc13b3384b47db23e46aeb54dc677 [169/206] ASoC: macaudio: Do not disable ISENSE/VSENSE switches on j314
reproduce: (https://download.01.org/0day-ci/archive/20231016/202310161041.M2BolY7N-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310161041.M2BolY7N-lkp@intel.com/

# many are suggestions rather than must-fix

WARNING:IF_0: Consider removing the code enclosed by this #if 0 and its #endif
#22: FILE: sound/soc/apple/macaudio.c:927:
+#if 0

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
