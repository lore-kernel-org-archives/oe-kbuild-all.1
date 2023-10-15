Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA3C12F53
	for <oe-kbuild-all@lists.linux.dev>; Sun, 15 Oct 2023 16:07:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SsDTZ2tF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697386041; x=1728922041;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=VnVA8po5vWXUdSKQKRTbfDvTFha8uPdA9jwi3wSBJKg=;
  b=SsDTZ2tFfqb0w3KFCVQoiVuzbJHGpAbgZ3XrD37kWHZNIxA4G2DnxPZf
   pN3ZBDegFWA5JpB2VBYZrE9QH9knvSgU9kfQX3k7e9FXWSlu9yVHDQbXv
   GWvft/I+7dEBlDw2kQFsSRjghR5GMsQsaJtBp83X6OyaMkqVxxwqx5plk
   InqumYL6fFu8cA4s44LKGw+WGZ53N4WDHyxW2ptznCMZWNuDMl2SBqIby
   p2rYQoZO35cnTIrUUnP6vRjmZ4MnlFIcyLy9vzjpnoYziZ1GZTc/TJci6
   /t9emDCZEtsjwrjq7UobP7xty50+OeZ5xZBWtUuCJPGxdvinB5Fxogw13
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10863"; a="375764412"
X-IronPort-AV: E=Sophos;i="6.03,226,1694761200"; 
   d="scan'208";a="375764412"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Oct 2023 09:07:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10863"; a="749010140"
X-IronPort-AV: E=Sophos;i="6.03,226,1694761200"; 
   d="scan'208";a="749010140"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by orsmga007.jf.intel.com with ESMTP; 15 Oct 2023 09:07:19 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qs3e9-0007XV-20;
	Sun, 15 Oct 2023 16:07:17 +0000
Date: Mon, 16 Oct 2023 00:06:45 +0800
From: kernel test robot <lkp@intel.com>
To: "Steven Rostedt (VMware)" <rostedt@goodmis.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [mhiramat:topic/fgraph-multi 3/15] checkpatch: WARNING: braces {}
 are not necessary for single statement blocks
Message-ID: <202310152349.QIeJwc10-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mhiramat/linux.git topic/fgraph-multi
head:   f89a72328944cb3136c9c44850970a9c8cc7021a
commit: 968afbe745f7ac16f8d0e06ee878dd316647b5fb [3/15] function_graph: Add an array structure that will allow multiple callbacks
reproduce: (https://download.01.org/0day-ci/archive/20231015/202310152349.QIeJwc10-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310152349.QIeJwc10-lkp@intel.com/

# many are suggestions rather than must-fix

WARNING:BRACES: braces {} are not necessary for single statement blocks
#104: FILE: kernel/trace/fgraph.c:675:
+		for (i = 0; i < FGRAPH_ARRAY_SIZE; i++) {
+			fgraph_array[i] = &fgraph_stub;
+		}

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
