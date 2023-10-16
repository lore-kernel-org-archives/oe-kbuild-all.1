Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDA16A2D
	for <oe-kbuild-all@lists.linux.dev>; Mon, 16 Oct 2023 01:03:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FW+AbqEO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697418202; x=1728954202;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ynF+vX67S2hd72F9GQuhlJsqd6BjpQqjqQvR5Tyt+Xs=;
  b=FW+AbqEOXTRaHwNAAXMazmizebLbrOw0NvuEV7/EazkrMl2he2Itz1gh
   KrUtn5o8AEjBqJxjtJ1lodoUSBpeLT2Ms+6UGbFFa3jnGp3IcVrsMlurF
   dIzsTHITY8IxP2ARIMFg6xY71Gf6BLBkGyfgrvL5LU6bJ040c6w+6OTRN
   FnJCrPVx75aHEAUIJCWa21Jbs4WtlQyvrU5X1KLgyZ/MIw6SO/NZrvmv9
   PxTt6wNmMGN83Aiuqp+oTVMZrucXbBdNNE27rsK383m0suGHqvmfX2vVZ
   4ZANo9mR6H9pA7kMZ6bLCDy1DZpRraCO1NMaznZu/MfXNQFTsQvJ27xfw
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10863"; a="385264813"
X-IronPort-AV: E=Sophos;i="6.03,228,1694761200"; 
   d="scan'208";a="385264813"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Oct 2023 18:03:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10863"; a="825807569"
X-IronPort-AV: E=Sophos;i="6.03,228,1694761200"; 
   d="scan'208";a="825807569"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by fmsmga004.fm.intel.com with ESMTP; 15 Oct 2023 18:03:19 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qsC0r-0007zH-2m;
	Mon, 16 Oct 2023 01:03:17 +0000
Date: Mon, 16 Oct 2023 09:03:00 +0800
From: kernel test robot <lkp@intel.com>
To: Martin =?utf-8?Q?Povi=C5=A1er?= <povik+lin@cutebit.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [asahilinux:sound/speaker-safety 28/206] checkpatch: WARNING: Block
 comments should align the * on each line
Message-ID: <202310160837.3Ru0ZtbE-lkp@intel.com>
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
commit: 422ed2de70b58ed698fcca188eacbdc566d760b8 [28/206] arm64: dts: apple: t600x-jxxx: Put in audio nodes
reproduce: (https://download.01.org/0day-ci/archive/20231016/202310160837.3Ru0ZtbE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310160837.3Ru0ZtbE-lkp@intel.com/

# many are suggestions rather than must-fix

WARNING:BLOCK_COMMENT_STYLE: Block comments should align the * on each line
#244: FILE: arch/arm64/boot/dts/apple/t600x-j375.dtsi:221:
+			/*
+			* DANGER ZONE: You can blow your speakers!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
