Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCC0F4084E
	for <oe-kbuild-all@lists.linux.dev>; Tue,  2 Jul 2024 19:59:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719950369; cv=none; b=AKTCWlFDHhrWhTt6IEWkXGAj42kh1fvXmD4lpIpGmizUO1+MBzBfpM49c9K11zdsmjjjmxmTowJIm5sicBTWJIT/fTYrjPTL/IxdqYmHTFzSBV9YY4V2KOkjqOVCmfJTUgLbqL6JFQiRy49gUGGE7ZoL+9/nI7mfzOohZiM/Deg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719950369; c=relaxed/simple;
	bh=x/VfC2OM3nzShEFDTdgTp+cHqq4wRN0yH66pptXjlbU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Lee0kXXOfMLAXWbNMvaAnHCosHuTxaUFhsQwJlH/tYmxojmnOd/kWZRiRYI2vaCLyL9gvdswkEZNuZ/W5Dld1m6IKsmjXqrf05cG+VCi7SGrUb4iwdSo0WmNFI4DDJq5V+0DSAtsC7RkeiUqATRQlRO8ndPrMc1PhhAz0E4f1IE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BJVWYh68; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BJVWYh68"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1719950368; x=1751486368;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=x/VfC2OM3nzShEFDTdgTp+cHqq4wRN0yH66pptXjlbU=;
  b=BJVWYh683hIHin1N7QmRujkKrF7SEtR7AzBG24hNmAuMytpS4vb61Lee
   oDMKbHZyXse2tbHtwSfpxtJhVaqbFCnVu1pSXH34B3H3F3u+nBHYakNig
   Qpps4RgQIU9eJPTkjr2EDvPm/zXK/rLG/yXXi9SUvVJqf05IQUkBJZ7cK
   NLJahbt/kSJ9Pq1nV+L1b080XdTaAqWHmUas7MPGztyKm1k1GpYxRBKOP
   1sbcM/zp+fXW46wePH8imlgfiP9hIOWCVr1q6E/UiLtwOnodL0MdR1O5X
   ovs9tvTZl/ZVNoBsCGXDsn0NA5cm/5Fy7vZjldKmKKbJhcsfmyrK4PvhM
   A==;
X-CSE-ConnectionGUID: Rj1Lph8AR6aaqmW06P5fFQ==
X-CSE-MsgGUID: OeMH8CxDT0CNUCBa07wXHA==
X-IronPort-AV: E=McAfee;i="6700,10204,11121"; a="28539390"
X-IronPort-AV: E=Sophos;i="6.09,180,1716274800"; 
   d="scan'208";a="28539390"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jul 2024 12:59:27 -0700
X-CSE-ConnectionGUID: cJYWYcYsSO2ZMDY/A22ixg==
X-CSE-MsgGUID: gCYUezSuQ2+Nsf2NyiY6wg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,180,1716274800"; 
   d="scan'208";a="46749240"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 02 Jul 2024 12:59:27 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sOjeu-000Obr-0U;
	Tue, 02 Jul 2024 19:59:24 +0000
Date: Wed, 3 Jul 2024 03:59:06 +0800
From: kernel test robot <lkp@intel.com>
To: Pavel Begunkov <asml.silence@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [isilence:zcrx/next 28/36] loongarch64-linux-ld: zcrx.c:undefined
 reference to `tcp_recvmsg'
Message-ID: <202407030358.3h9g49xn-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/isilence/linux zcrx/next
head:   daa95af9ac26711b21e20be3c8d512d6de26bb11
commit: db28eb2f9cdc35a6dbf288322fc0da445a78b421 [28/36] io_uring: add io_recvzc request
config: loongarch-randconfig-001-20240702 (https://download.01.org/0day-ci/archive/20240703/202407030358.3h9g49xn-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240703/202407030358.3h9g49xn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407030358.3h9g49xn-lkp@intel.com/

All errors (new ones prefixed by >>):

   loongarch64-linux-ld: io_uring/zcrx.o: in function `io_zcrx_recv':
   zcrx.c:(.text+0x180c): undefined reference to `tcp_recvmsg'
>> loongarch64-linux-ld: zcrx.c:(.text+0x1810): undefined reference to `tcp_recvmsg'
>> loongarch64-linux-ld: zcrx.c:(.text+0x1874): undefined reference to `tcp_read_sock'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
