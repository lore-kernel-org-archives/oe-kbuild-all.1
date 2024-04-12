Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0EDE8C15
	for <oe-kbuild-all@lists.linux.dev>; Fri, 12 Apr 2024 05:07:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712898453; cv=none; b=ESNCo++E/eLeWr/apqsN4mu7o3R7uzWfDNRTJx5pdrfuwUFk757cwoa3Y9SfEekF57jn8ian/h+RPV/qBqx5yj3WORy2sOWEFVu7I5y7BaUTOP5LQns0mq7qcvfN0ctNQgp2jrOtwJ0QYrBSLtMo4Gs5qMg2eDuAp46l6kc4afw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712898453; c=relaxed/simple;
	bh=Kl843jLpsAxSCsNrS9RrYjgFrveu6PSOMqTohVLG3Yk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=nm47nxqIw0HnHVskqR1ZKlxSEO1aJW/Sh45/6ijH3AVvn8GFJMMDEWny7sF02kOAY2n70sl/WeKmyMTlefMOxgLo7xWFAYU/JCKG7+vQNINkVl7KuchyU7sllZX+s+o1m7ARlGZOP9Ca8A3T5zS4f5FpLrffPlDtSgUwSr6Cnjw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZtFpZa0u; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZtFpZa0u"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712898452; x=1744434452;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Kl843jLpsAxSCsNrS9RrYjgFrveu6PSOMqTohVLG3Yk=;
  b=ZtFpZa0ueUQqtoQb+4EU0BK4qssMuoZyxSIXqyXUpuZopnyHfY/VfmTi
   yr4urg8IFyddN+akkJ8UkEaXj1aKD+57YqL73QGZA1RAJfLfxWQVO/PL2
   oXsKtsteZShfcbSNAYgOPadOgFAQcBkkjFKecb4T1nddXqP5e2aDJRMZ9
   a+RQFrnoqavXZZWyVRQPFOHQ/0vcI7hYQCesvTwWbIV2KhbLwHZYr883/
   TpUVrJr3tvQsWa7367hr8bgHioXnI82mtJGmQInli/nHvtLIKgVmbBvgi
   S6gZ1olzuJqQr9ymCV29lVTsPGMZJhXqcTRN3VQmc3AJePltajmw6meVc
   g==;
X-CSE-ConnectionGUID: 85KEqtcDQBW8JIWFbtyCOA==
X-CSE-MsgGUID: BERvAP05T7uL8ElBwmJ0EA==
X-IronPort-AV: E=McAfee;i="6600,9927,11041"; a="19053402"
X-IronPort-AV: E=Sophos;i="6.07,195,1708416000"; 
   d="scan'208";a="19053402"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Apr 2024 22:07:31 -0700
X-CSE-ConnectionGUID: 427Tes2mTpOiK3yVXHcv/Q==
X-CSE-MsgGUID: GMJqv+vARuOruz5+vgSHUg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,195,1708416000"; 
   d="scan'208";a="52291776"
Received: from lkp-server01.sh.intel.com (HELO e61807b1d151) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 11 Apr 2024 22:07:30 -0700
Received: from kbuild by e61807b1d151 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rv98K-0009Oj-0L;
	Fri, 12 Apr 2024 05:07:28 +0000
Date: Fri, 12 Apr 2024 13:06:44 +0800
From: kernel test robot <lkp@intel.com>
To: Pavel Begunkov <asml.silence@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [isilence:zcrx/next 529/552] devmem.c:undefined reference to
 `__tracepoint_page_pool_state_hold'
Message-ID: <202404121241.mvwfS1Fy-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/isilence/linux zcrx/next
head:   145e80df1ac4e2380f8753660781bdc2c3350206
commit: 5f3dc7a7063de124afcb40cbee6150ee7f0078c2 [529/552] memory-provider: dmabuf devmem memory provider
config: x86_64-defconfig (https://download.01.org/0day-ci/archive/20240412/202404121241.mvwfS1Fy-lkp@intel.com/config)
compiler: gcc-13 (Ubuntu 13.2.0-4ubuntu3) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240412/202404121241.mvwfS1Fy-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404121241.mvwfS1Fy-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: vmlinux.o: in function `mp_dmabuf_devmem_alloc_pages':
>> devmem.c:(.text+0xbfa75b): undefined reference to `__tracepoint_page_pool_state_hold'
>> ld: devmem.c:(.text+0xbfa76f): undefined reference to `__SCT__tp_func_page_pool_state_hold'
>> ld: vmlinux.o:(__jump_table+0x10798): undefined reference to `__tracepoint_page_pool_state_hold'
>> ld: vmlinux.o:(.static_call_sites+0xb73c): undefined reference to `__SCK__tp_func_page_pool_state_hold'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
