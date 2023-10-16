Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1033617EA
	for <oe-kbuild-all@lists.linux.dev>; Mon, 16 Oct 2023 02:24:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AXn+OXuT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697423081; x=1728959081;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=FAz0x8MgRfr3h5PhVFMM803z1fv9/zIOEI54V9E700s=;
  b=AXn+OXuTWeqQPO7TqItSXoAd14PjcOj3LzaJpFdwoTAU9q63pwjhksCq
   kuHXDriT5oTbuPwPn20FOUWcegK2nYq0jrDPGESbpTY4KGtwcjYYEIyiu
   YC7S3m8CXAWG1+X+MtHxlr916GHABx2YITD6z0v6ObAmQmNMoFfBMscxC
   Krbgq3Kpgsq7aZQkJtKkUtoGiV3hq1eXuS6e4cgbFIew7PQDGCYMt+ZQu
   oo1FINiLGHtRYMOWA5+5ehoa5blGGUm6hJRoOHtLExtvxpzPV0Lz487LK
   VNKtsyB2QO0gcN5xoz76XysnbjiRI3xU61FRq9jsNAvnhcxkOziqVDZs1
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10863"; a="389292658"
X-IronPort-AV: E=Sophos;i="6.03,228,1694761200"; 
   d="scan'208";a="389292658"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Oct 2023 19:24:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10863"; a="899313780"
X-IronPort-AV: E=Sophos;i="6.03,228,1694761200"; 
   d="scan'208";a="899313780"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by fmsmga001.fm.intel.com with ESMTP; 15 Oct 2023 19:22:41 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qsDHY-00081P-2s;
	Mon, 16 Oct 2023 02:24:36 +0000
Date: Mon, 16 Oct 2023 10:23:39 +0800
From: kernel test robot <lkp@intel.com>
To: Hector Martin <marcan@marcan.st>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [asahilinux:sound/speaker-safety 171/206] checkpatch: WARNING: else
 is not generally useful after a break or return
Message-ID: <202310161018.sL9AK4G4-lkp@intel.com>
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
commit: b757134f9c7dc5d353d6915eb8468611a84a77b7 [171/206] ASoC: macaudio: Sense improvements
reproduce: (https://download.01.org/0day-ci/archive/20231016/202310161018.sL9AK4G4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310161018.sL9AK4G4-lkp@intel.com/

# many are suggestions rather than must-fix

WARNING:UNNECESSARY_ELSE: else is not generally useful after a break or return
#54: FILE: sound/soc/apple/macaudio.c:506:
+			return 0;
+		} else {

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
