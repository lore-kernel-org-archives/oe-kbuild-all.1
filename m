Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1837D51D
	for <oe-kbuild-all@lists.linux.dev>; Sat, 21 Oct 2023 15:23:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mF0bxQWh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697901793; x=1729437793;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=T2cQcj0T9iVfWMdZVPZO+y9Av9U6qK1r/Co/eCB9Wc4=;
  b=mF0bxQWhcN0/eke+UMW6Kt1S/ajSmAXGx/UTFPuH44vh1JEEsyaSctbg
   Y6/XWA2g9nk1iD1HY5RS9xu12zvjleWK7T5jSOoB2h8gJeDiIUvxbWUVL
   wuhfn60sZHpO6YdDcIDCLd0Xj3dilQzlhDUmesyV6HI0eBuhMnX8NEUtg
   UDYS7aa6HkGx60lxO/pkL+Rw6CgHNFrEOKAy14GTFg0pCJ/dBwl0HWNHk
   iBzx//UanHIiZfizAes983n4IMO0dXKNG/DfJ5PUgNThlbAiTl7rza/UN
   d+/Mu6gmaP3rd+/xtExgeI2HDif7b87CgpPRZkBIaHgxSqIsd5uIPEMY1
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10870"; a="390526000"
X-IronPort-AV: E=Sophos;i="6.03,241,1694761200"; 
   d="scan'208";a="390526000"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Oct 2023 08:23:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10870"; a="787071849"
X-IronPort-AV: E=Sophos;i="6.03,241,1694761200"; 
   d="scan'208";a="787071849"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 21 Oct 2023 08:23:12 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1quDoj-0004xW-2l;
	Sat, 21 Oct 2023 15:23:09 +0000
Date: Sat, 21 Oct 2023 23:22:53 +0800
From: kernel test robot <lkp@intel.com>
To: Hector Martin <marcan@marcan.st>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [asahilinux:sound/speaker-safety 82/209] checkpatch: WARNING: Block
 comments should align the * on each line
Message-ID: <202310212302.bLZAAMGM-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/AsahiLinux/linux sound/speaker-safety
head:   37f4315008c663a55629554adcfcae4e5d88fdc7
commit: 3aa7598fb35898e04336c9860fd87bf7e54771fc [82/209] arm64: dts: apple: Add j180d (Mac Pro 2023) device tree
reproduce: (https://download.01.org/0day-ci/archive/20231021/202310212302.bLZAAMGM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310212302.bLZAAMGM-lkp@intel.com/

# many are suggestions rather than must-fix

WARNING:BLOCK_COMMENT_STYLE: Block comments should align the * on each line
#523: FILE: arch/arm64/boot/dts/apple/t6022-j180d.dts:506:
+			/*
+			* DANGER ZONE: You can blow your speakers!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
