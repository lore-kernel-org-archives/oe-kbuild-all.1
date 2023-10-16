Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E76B1377
	for <oe-kbuild-all@lists.linux.dev>; Mon, 16 Oct 2023 01:25:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="flS0h4MX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697419542; x=1728955542;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=VWkA0o4JxmeGYPPLjOFac3dgYd7Z2uAxN5JFiW175n8=;
  b=flS0h4MX222GkW/Ocob1quuQ1e5LOJc+4vEGmK2kPpHIM/1HBWqsDuPH
   yquDy18LibvcKgjFOtkumDm0o1PzE6VTGtC6uLoCr6sSTugAoQ5mAlwH+
   TAD2Dd8RsU686xG7BkMvl6rdd9siDhBW1XUq+vTfbApXr3EXNndxXzttM
   mkPIBQ6L/ra/bs27ptVjBMga7WBRlPCgwMnBSqBJ7h1hVfM02MsTwLrte
   Yj2Oad9K5dpPdDhVWFnk+r2D0qxkCAvE+2vkPlRQ5MWrUaK3dtrhQQcww
   DxWDuwTWC/xeGGhAhCoHrx7+W14QgaRaGOBeH/QhVwYPp0Us2Eq4PxFhG
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10863"; a="370501936"
X-IronPort-AV: E=Sophos;i="6.03,228,1694761200"; 
   d="scan'208";a="370501936"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Oct 2023 18:25:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10863"; a="825811580"
X-IronPort-AV: E=Sophos;i="6.03,228,1694761200"; 
   d="scan'208";a="825811580"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by fmsmga004.fm.intel.com with ESMTP; 15 Oct 2023 18:25:36 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qsCMQ-000808-1G;
	Mon, 16 Oct 2023 01:25:34 +0000
Date: Mon, 16 Oct 2023 09:25:27 +0800
From: kernel test robot <lkp@intel.com>
To: Hector Martin <marcan@marcan.st>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [asahilinux:sound/speaker-safety 82/206] checkpatch: WARNING: Block
 comments should align the * on each line
Message-ID: <202310160908.5zXJB8bh-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="6wwmbr1kyZ6wCjNk"
Content-Disposition: inline


--6wwmbr1kyZ6wCjNk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/AsahiLinux/linux sound/speaker-safety
head:   c4c1ca0ec7d6b3dcce7304ea88eaaad52f090d90
commit: 3aa7598fb35898e04336c9860fd87bf7e54771fc [82/206] arm64: dts: apple: Add j180d (Mac Pro 2023) device tree
reproduce:

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310160908.5zXJB8bh-lkp@intel.com/

# many are suggestions rather than must-fix

WARNING:BLOCK_COMMENT_STYLE: Block comments should align the * on each line
#523: FILE: arch/arm64/boot/dts/apple/t6022-j180d.dts:506:
+			/*
+			* DANGER ZONE: You can blow your speakers!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

--6wwmbr1kyZ6wCjNk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename=reproduce

reproduce:
        scripts/checkpatch.pl 0001-arm64-dts-apple-Add-j180d-Mac-Pro-2023-device-tree.patch

--6wwmbr1kyZ6wCjNk--
