Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 325132AB39
	for <oe-kbuild-all@lists.linux.dev>; Thu, 12 Oct 2023 19:00:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cxmLA1CE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697137222; x=1728673222;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=QgV0pJpRiqFjMw/yQDMpsoklsGqKs1b9kRn5KU3b+lw=;
  b=cxmLA1CEYnYxkhDBKrVbeBge5ChEmHN0m34mXk2RROH2wXD1Vk5X7BwY
   8GBwwFsdveToP1r9uS6re/5CZnhNWJFftAiRN/NicY1FXSvekj4afyqC6
   XJXlkv5XrMRD0mr3iVAKUULgWtL1bY5tZTSGyZTWC9DGzes+JW+nCTho0
   rVuKRO4c5yDWHQZ9aV4qR1MX51G+WOVY57E3wXrsf0+ZdorJjBq5bzjfT
   pXBnBU//pTxRvnC3cMk9uPcva8Oor9YIC2D2ApyI6PeEED0cA1ie3FBa1
   OxnS8lYCCFK7T0cjkylXm4qFf7ZpMAqdsCCNCq474PA11+Td0tMly+3x7
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10861"; a="471254757"
X-IronPort-AV: E=Sophos;i="6.03,219,1694761200"; 
   d="scan'208";a="471254757"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Oct 2023 12:00:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10861"; a="878209761"
X-IronPort-AV: E=Sophos;i="6.03,219,1694761200"; 
   d="scan'208";a="878209761"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by orsmga004.jf.intel.com with ESMTP; 12 Oct 2023 12:00:20 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qr0uv-0003lZ-2q;
	Thu, 12 Oct 2023 19:00:17 +0000
Date: Fri, 13 Oct 2023 02:59:10 +0800
From: kernel test robot <lkp@intel.com>
To: Martin =?utf-8?Q?Povi=C5=A1er?= <povik+lin@cutebit.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [asahilinux:sound/speaker-safety 146/196] checkpatch: WARNING:
 Missing a blank line after declarations
Message-ID: <202310130216.jP2sAdqy-lkp@intel.com>
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
commit: 989b30915d5051edf01eb2d6936e97160784882d [146/196] ASoC: apple: mca: Support FEs being clock consumers
reproduce: (https://download.01.org/0day-ci/archive/20231013/202310130216.jP2sAdqy-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310130216.jP2sAdqy-lkp@intel.com/

# many are suggestions rather than must-fix

WARNING:LINE_SPACING: Missing a blank line after declarations
#95: FILE: sound/soc/apple/mca.c:392:
+		int port = mca_fe_get_port(substream);
+		writel_relaxed(port + 6 + 1,

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
