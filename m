Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D7E5262B2
	for <oe-kbuild-all@lists.linux.dev>; Thu, 12 Oct 2023 16:33:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="D6xepH/J"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697128426; x=1728664426;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=koJEGNgTHOLfv6mWn+XSMTQ+9zEB/vGNbUc1Jyw7LUM=;
  b=D6xepH/JbI2PNBkrlOmLnxYjSsmBh72Uu+SFZ8+79tSjs1d+CbWp4vHM
   mipZvTb2NuQctvfTRudbGBL8ttclSWGfq2BtPuWzqsdfU0rZMRSqg/Dga
   peowalNjtsHH1VENGaoABb+WWboalX4gDKb94vl1q3gFOQ7XzVb3/54FK
   fQ2DkD5TBs2A2fTbDKJLNJmkQPAYzOJVnNcPia3oGHScWvFJqLEvNe4ZF
   7IBJqWERZl0IIJamhPTniDzbpYJaTpjqu8ob3ZSG2A6hKQLzeHWqPzYOO
   O0EgJF0NVtusN0Th1g3V5shS7t8kbGEoidMniNwSBfrdR/1Xzuh9r12vG
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10861"; a="451459617"
X-IronPort-AV: E=Sophos;i="6.03,219,1694761200"; 
   d="scan'208";a="451459617"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Oct 2023 09:33:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10861"; a="754359120"
X-IronPort-AV: E=Sophos;i="6.03,219,1694761200"; 
   d="scan'208";a="754359120"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by orsmga002.jf.intel.com with ESMTP; 12 Oct 2023 09:33:43 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qqyd4-0003dj-0v;
	Thu, 12 Oct 2023 16:33:42 +0000
Date: Fri, 13 Oct 2023 00:32:57 +0800
From: kernel test robot <lkp@intel.com>
To: Martin =?utf-8?Q?Povi=C5=A1er?= <povik+lin@cutebit.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [asahilinux:sound/speaker-safety 28/196] checkpatch: WARNING: Block
 comments should align the * on each line
Message-ID: <202310130042.685IuDrW-lkp@intel.com>
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
commit: 422ed2de70b58ed698fcca188eacbdc566d760b8 [28/196] arm64: dts: apple: t600x-jxxx: Put in audio nodes
reproduce: (https://download.01.org/0day-ci/archive/20231013/202310130042.685IuDrW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310130042.685IuDrW-lkp@intel.com/

# many are suggestions rather than must-fix

WARNING:BLOCK_COMMENT_STYLE: Block comments should align the * on each line
#244: FILE: arch/arm64/boot/dts/apple/t600x-j375.dtsi:221:
+			/*
+			* DANGER ZONE: You can blow your speakers!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
