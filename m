Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E030721B9FD
	for <oe-kbuild-all@lists.linux.dev>; Sun, 30 Nov 2025 12:27:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764505677; cv=none; b=GzVjS68MuBREQMndf0jzSVV5Tf8isAsteGJYlJlLApncpcrJiSWCvNhU98x9vW5TPBcoo2b3ibfjlZ7oPZcL9mkixGDqBuTE0r8an7OAEjjnN2p4x6X0R6Lm1tUDIY8+sPLhRXWxwK+NsYvAonMpZ4i8Hqp2IXMPavEG1YP1iII=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764505677; c=relaxed/simple;
	bh=Fis/0rsZG6k51+axl/YHiFEHj+YjFSSf4Ix4hSoz7zI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=FQTmBG2fyI0+kx9ELvn2sP6K4pNzZ+w5Jk8vaOSGA4yNPK7Y5HPxAyr50iYOokA8LtwgQEpCfKGXu5kq7lJQzGaOF8dj9dt6lMRON6qoQFSlzxsUBXTDehFVREaMwsEhjw8K5n6+BAdXEfU+AOVGUeUCiusgC3rCNe05RjNZBHQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TWeBnqwx; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TWeBnqwx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764505676; x=1796041676;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Fis/0rsZG6k51+axl/YHiFEHj+YjFSSf4Ix4hSoz7zI=;
  b=TWeBnqwx35cIoXmCjH3i8FqIdeUc6olyvl81KnWTZyiRGZlDWT0dU1mr
   jF4ccyPcBeY10zQP6e8eHaeHBqhhHM2mpRFZJw8aaVnGj5tfGsDkmAOlm
   P7oLX7aY9aQ6KUkiRqS3juXfXCHODfH1CHooFdQCAA7SMHymubgluE021
   Uy+QRsyGNbvNkKuLQwzHFDSCpnOh9d60LMlOXI7zCLZ+qcdd6YLmnWfgw
   vCQ0xDlWDh47YPIj4yANXGY4csexx2c5kidqzh6trMpGzV+SatCmDVTBU
   FupEHDKV9oHub3qUaHeVvvbXkBoGfefN6ZWRyqAnHn6LNQwWzGtRhWZan
   A==;
X-CSE-ConnectionGUID: obtwaoUBThSqowigIqbNCA==
X-CSE-MsgGUID: nBExVP3WQWmAPv6xxBOl/w==
X-IronPort-AV: E=McAfee;i="6800,10657,11628"; a="69048779"
X-IronPort-AV: E=Sophos;i="6.20,238,1758610800"; 
   d="scan'208";a="69048779"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Nov 2025 04:27:55 -0800
X-CSE-ConnectionGUID: JLydha2ARKix9vtLmODeww==
X-CSE-MsgGUID: f2uV+/zJRAiF8NdT0Sc36Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,238,1758610800"; 
   d="scan'208";a="193624468"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 30 Nov 2025 04:27:53 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vPgWt-000000007x7-07ZC;
	Sun, 30 Nov 2025 12:27:51 +0000
Date: Sun, 30 Nov 2025 20:27:13 +0800
From: kernel test robot <lkp@intel.com>
To: Bean Huo <beanhuo@micron.com>
Cc: oe-kbuild-all@lists.linux.dev,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	Can Guo <can.guo@oss.qualcomm.com>,
	Avri Altman <avri.altman@sandisk.com>,
	Bart Van Assche <bvanassche@acm.org>
Subject: [mkp-scsi:queue 448/524] ld.lld: error: undefined symbol:
 ufs_rpmb_remove
Message-ID: <202511302033.mRRx8guR-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mkp/scsi.git queue
head:   82f78acd5a9270370ef4aa3f032ede25f3dc91ee
commit: b06b8c421485e0e96d7fd6aa614fb0b6f2778a03 [448/524] scsi: ufs: core: Add OP-TEE based RPMB driver for UFS devices
config: x86_64-randconfig-123-20251130 (https://download.01.org/0day-ci/archive/20251130/202511302033.mRRx8guR-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251130/202511302033.mRRx8guR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511302033.mRRx8guR-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: ufs_rpmb_remove
   >>> referenced by ufshcd.c:10505 (drivers/ufs/core/ufshcd.c:10505)
   >>>               vmlinux.o:(ufshcd_remove)
--
>> ld.lld: error: undefined symbol: ufs_rpmb_probe
   >>> referenced by ufshcd.c:8950 (drivers/ufs/core/ufshcd.c:8950)
   >>>               vmlinux.o:(ufshcd_async_scan)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
