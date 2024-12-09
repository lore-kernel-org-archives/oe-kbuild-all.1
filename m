Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3525A49652
	for <oe-kbuild-all@lists.linux.dev>; Mon,  9 Dec 2024 20:42:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733776947; cv=none; b=lLlqVjGg/xVIE4Jy93Dc8HkOrtPIlcZmJ6cJYTCSVBbvnbb1wQyXbyRG35JyfYn/mnXRQu6nGJDSkrAgItNDbuX9MmDYkccTzj+47yWoWXZFe6+y673fwq1MaM0/zHoJ0ffjkI7jFIP6W73WXnKp6LfPsNHS14n0e0a12aKwcUE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733776947; c=relaxed/simple;
	bh=W/xkV6sDFmYYVD+vLT43ep5TBZ4c0rf/CthDA5dES/4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=iu4fu89WBUapxu+VPQaQTXx16ky5v2ELoKevawECDYCBQSWom38mTuy/NQ0GN6tdoRCjVmNLiJil4LYo4hLU8PV+0DbBBKFotLFvwRAW8DxruV9JvUJmh4Ij/eWINXa64FgheQu1K0YAELdsfhea5lOONYN0gV6z2eNX4LP5NrA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Sqh0AaMR; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Sqh0AaMR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733776945; x=1765312945;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=W/xkV6sDFmYYVD+vLT43ep5TBZ4c0rf/CthDA5dES/4=;
  b=Sqh0AaMRpzuCPQpQYVO03mww2VAEgkPyPHbMVNBL7c5Rl3RFKo2eVGnl
   MzXflNUbWkEyTDpNPCHauS3F7BTsDeVCBySAP7ebgnENFttvbFfkapN8w
   qw2NIW9pFgmRvrKnBOfxnZOrsrVmTPrp3BgjMtutShlUoAW2R3wYQyr9R
   G8sFfMRkTZimgK+JqP3MuOlgOWQ79+vrTZuPYUmjxFQgdT0g6zGAv5It7
   RzKL9B4UwZvAQBzYY157ESD3vRd1n80LXJVanKYHkr/YYNaOUtfZLcIlN
   qIwn1QmWRxfeUiRTIz7xc5u9ZZ4EvCMoRqHlvKgwiK0WdaG3ZuRN3K0dg
   g==;
X-CSE-ConnectionGUID: u8Q5i+U0SDObEIFsWZnxjw==
X-CSE-MsgGUID: yYJPFuMIRTKGn5wpCO8SAw==
X-IronPort-AV: E=McAfee;i="6700,10204,11281"; a="34022238"
X-IronPort-AV: E=Sophos;i="6.12,220,1728975600"; 
   d="scan'208";a="34022238"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Dec 2024 12:42:25 -0800
X-CSE-ConnectionGUID: gJmTr0jNTpGTEZMfTrKjug==
X-CSE-MsgGUID: 4mOOmzEdRiOep9ZmHtMEIQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,220,1728975600"; 
   d="scan'208";a="126080780"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 09 Dec 2024 12:42:24 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tKkaD-0004nd-28;
	Mon, 09 Dec 2024 20:42:21 +0000
Date: Tue, 10 Dec 2024 04:41:39 +0800
From: kernel test robot <lkp@intel.com>
To: Pavel Begunkov <asml.silence@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [isilence:zcrx/v9-wip 20/22] ERROR: modpost:
 "netdev_rx_queue_restart" [drivers/net/ethernet/broadcom/bnxt/bnxt_en.ko]
 undefined!
Message-ID: <202412100401.mQaYXpDH-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/isilence/linux zcrx/v9-wip
head:   265a57e2057eabebef11b4b533a65ecf75284489
commit: 7224437921cd25a9eb2481390e5e26b37f620182 [20/22] [NOT-FOR-UPSTREAM] bnxt_en: add debugfs file for restarting rx queues
config: x86_64-rhel-9.4 (https://download.01.org/0day-ci/archive/20241210/202412100401.mQaYXpDH-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241210/202412100401.mQaYXpDH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412100401.mQaYXpDH-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "netdev_rx_queue_restart" [drivers/net/ethernet/broadcom/bnxt/bnxt_en.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
