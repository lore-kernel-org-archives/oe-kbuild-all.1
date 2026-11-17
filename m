Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.14
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794895750;
	b=yOvD4+z7c2mbsJDJj4TmfnbkHc36GiwcbhaCce2m8vCmYR2UaVcndCtDJ5jtuKjRDqGB
	 TIlibcKPatw1qJ48CnSfZ+JREjODlkOapFhXTFTLn1TVPgtcz7VkRcX9jdcWSn8KyAyY3
	 CrfRvcQOwtL1qTiBnHId3JMZhVoab+FdqweyaEmDM2OH3KK+ksZ6r4Mwb+Ggx1nodPgG7
	 Alo93n1EFpKheeejZ2aXzgesLKKQ3Zo5UEXP+S2bBQdCdSdnFWe7cSinXy3W9fZAIoqPD
	 QmmR3+jlLtS9doujgmRCvrmOvX0XMrFq8cZWTdzxspd9OQ/WKcbdRu9M3u/nhoS6EYg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794895750;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=mnjPTQsIMj7VTjGqbLbpXUo/9Zp9qRTFS5BtXqP6aB0=;
	b=x7x3FhPsNhkFTo+3SJTgBh1DfEEXtD/QXVvlvWPolTeChPAbF+kItuBYtgqaMUltsv/J
	 zwSzlkFEE7SBC9IaNcSL4HKfgh205/eoVnEapk39gxKedB/8Cfv2Md7eDv3zrdPov8eex
	 LH9iTQpn4vvJPheQI0LMsXobpSNaSjTNOUskYrUPlD3g4UVo7rrUuq8/qKPbTz1YbbM26
	 lNPes/BWiJLmpM8D8cZQCRi6negEp28ADbWvRiEMzRXUCtBxCUBc2TdficD5L/TYsuVVC
	 CMjOSZo/aSqtRgLKXL/ay7KRMoCI11dz/atJAtPbqY2SUkcoXFycGN8glOlIPrEoOPw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=eL2wrFNW;
	arc=none smtp.remote-ip=198.175.65.14
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 493AA60A380A
	for <oe-kbuild-all@lists.linux.dev>; Tue, 17 Nov 2026 06:09:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 493AA60A380A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=eL2wrFNW
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794895750; x=1826431750;
  h=date:from:to:cc:subject:message-id;
  bh=4cF8LiGYswfweWbH94125rpkuxvlKMzWgU/iALiZo7c=;
  b=eL2wrFNWNGan9i6HTL1KsnlQntyIiQfvd+dmq5OMSIbOLHjqQHghH5lP
   qeR8jOkYTuevMthPSZaSanmLKlxtlXo/kCSFXtG9Nm3lS5jWr7tzddDTX
   JifYa+DiyFUGV9X5ffR+DmbtptpjUnl/mga270/7OulzuawsqGQTpLNqc
   ez8cwwzALliA4SZDn+xtS/olk52eWEv4mV+lTWFacy32q3v6M+PaXAyKU
   68SzjtJCuz3iLyhKWXy9qs3UBmMb4RUqd/EaVYzBJ7f2uamCRLSbbaI4F
   6SC+9M0CA/ts1mbVyOr9EVAEJH1FessrF9kNPNDGyNZ+xe/X67bZL8bci
   g==;
X-CSE-ConnectionGUID: CGxhr15GT/S9K7EcBJtE5w==
X-CSE-MsgGUID: veZI1MyVSVeyp7oGI3Bnlg==
X-IronPort-AV: E=McAfee;i="6800,10657,11968"; a="3543954"
X-IronPort-AV: E=Sophos;i="6.27,218,1787036400"; 
   d="scan'208";a="3543954"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Nov 2026 22:09:10 -0800
X-CSE-ConnectionGUID: t9nN8MpaRSyjXAoR6CkeFg==
X-CSE-MsgGUID: znVn+c9SQpSfcu1wW4jL8g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,218,1787036400"; 
   d="scan'208";a="10269053"
Received: from igk-lkp-server01.igk.intel.com (HELO 1073a420ae3a) ([10.211.93.152])
  by fmviesa010.fm.intel.com with ESMTP; 16 Nov 2026 22:09:09 -0800
Received: from kbuild by 1073a420ae3a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xTCNL-000000002zO-3xOl;
	Tue, 17 Nov 2026 06:09:03 +0000
Date: Tue, 17 Nov 2026 07:08:05 +0100
From: kernel test robot <lkp@intel.com>
To: Dave Chinner <david@fromorbit.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [dgc-xfs:log-verification-2 18/59]
 fs/xfs/xfs_log_recover.c:1863:25: sparse: sparse: cast truncates bits from
 constant value (5452414e becomes 414e)
Message-ID: <202611170727.5y7BmGn4-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/dgc/linux-xfs.git log-verification-2
head:   0d3a450a0106f1f0c24528591be5ef1d51f37661
commit: 250789ccb8c288d3f8cbb7639853bbdd39a1e788 [18/59] xfs: recover the transaction header as a validated item type
config: nios2-randconfig-r2310-20261117 (https://download.01.org/0day-ci/archive/20261117/202611170727.5y7BmGn4-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 8.5.0
sparse: v0.6.5-rc1-21-g84ec0658
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261117/202611170727.5y7BmGn4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611170727.5y7BmGn4-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> fs/xfs/xfs_log_recover.c:1863:25: sparse: sparse: cast truncates bits from constant value (5452414e becomes 414e)
   fs/xfs/xfs_log_recover.c:1908:35: sparse: sparse: cast truncates bits from constant value (5452414e becomes 414e)

vim +1863 fs/xfs/xfs_log_recover.c

  1855	
  1856	/* Big endian host: type is the high half, count is the low half. */
  1857	static int
  1858	xlog_recover_trans_hdr_nregions_be(
  1859		struct xlog			*log,
  1860		uint16_t			nregions)
  1861	{
  1862		return xlog_recover_trans_hdr_check_half(log, nregions,
> 1863				XLOG_TRANS_HDR_MAGIC_LO);
  1864	}
  1865	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
