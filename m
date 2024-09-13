Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD221186E2C
	for <oe-kbuild-all@lists.linux.dev>; Fri, 13 Sep 2024 09:33:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726220029; cv=none; b=THVw2WzXp77/mYoBm67qCVkW1wmStEvNYiAZeXHxa3Lttq+jSWegSdbhtn5HM7a5K/pWEkcWwyljR3sJF9JtGviv3Zwk1DgH70jxq6LpnKAF10hky3u6mJ35mPWzz0KwLzNByP1ARauLv3DZtcem/r89fHqFMKxcMv6pejZokco=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726220029; c=relaxed/simple;
	bh=pQjq6YP33r46lSN8xSY/ed5wk2bvYhKvwLIfDDwURho=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=eSv+Yy6pBTegv4a0oAVAM9c+0rfRO44XqsKL9OkmrQ+sx84cftA8NfYvnESyTkkTOJgqw92o/BjEAFlezO8pfK1vE+4cIoLY/PnRf5uo0YUXQclLQCtDH8pvTgJlK7wM55kzLRHuAlzvHoctNMfW6DYJOCTIjp3/84vizG8sM4Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=I/cXgSqv; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="I/cXgSqv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726220028; x=1757756028;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=pQjq6YP33r46lSN8xSY/ed5wk2bvYhKvwLIfDDwURho=;
  b=I/cXgSqvoR8Z7cdluU2uufPNMXL3LzJABnG/S/uuH496sUsZhdLlbR8/
   ETrG0zHrn15FhZesFEC8afgr7PYTBWJp/YHTGa90x9d733dNSHjphR7EN
   twpN3Yd8Qf0XvKxIzd9Cj2/BVl9j+qNsqHXpMrzl10VNSu1sF0TZptJdM
   nlsmGA3YyNxQbZwvJge3f6Htbef+WVBXRvn1qP+E4WUKc6o2Ih2zxk9NT
   FHHmA2sW65NlRXjj84eeYCow7QvC46TvurbLZ5tBtO/yhXjAr3H0XM7Vw
   KuD0siHAKWaZM7kAwPMQHQvOWijlT8/kiWTB2Hglf+TikTmgA6eIWho2e
   g==;
X-CSE-ConnectionGUID: OO2V4PJFQQCcGv80BgPJpQ==
X-CSE-MsgGUID: 5+DA2LTWTEimI2YXNVCyRw==
X-IronPort-AV: E=McAfee;i="6700,10204,11193"; a="24603148"
X-IronPort-AV: E=Sophos;i="6.10,225,1719903600"; 
   d="scan'208";a="24603148"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Sep 2024 02:33:47 -0700
X-CSE-ConnectionGUID: lirCRvf5Tj6M6yPuez6xpg==
X-CSE-MsgGUID: 7/68ZflkTPyZg/8HpA5Fcg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,225,1719903600"; 
   d="scan'208";a="68310309"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 13 Sep 2024 02:33:46 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sp2gR-0006Iw-0z;
	Fri, 13 Sep 2024 09:33:43 +0000
Date: Fri, 13 Sep 2024 17:33:31 +0800
From: kernel test robot <lkp@intel.com>
To: Mina Almasry <almasrymina@google.com>
Cc: oe-kbuild-all@lists.linux.dev, Jakub Kicinski <kuba@kernel.org>,
	Willem de Bruijn <willemb@google.com>,
	Kaiyuan Zhang <kaiyuanz@google.com>,
	Pavel Begunkov <asml.silence@gmail.com>
Subject: [wpan-next:staging 20/43] ld: net/core/devmem.o:(__jump_table+0x8):
 undefined reference to `__tracepoint_page_pool_state_hold'
Message-ID: <202409131739.tkiCBWA0-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/wpan/wpan-next.git staging
head:   ace2b533135566227c6a392b15c63a20d68a556e
commit: 0f921404689398943257793f7240db239a23b609 [20/43] memory-provider: dmabuf devmem memory provider
config: i386-randconfig-011-20240913 (https://download.01.org/0day-ci/archive/20240913/202409131739.tkiCBWA0-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240913/202409131739.tkiCBWA0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409131739.tkiCBWA0-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: net/core/devmem.o: in function `trace_page_pool_state_hold':
   include/trace/events/page_pool.h:68: undefined reference to `__tracepoint_page_pool_state_hold'
   ld: include/trace/events/page_pool.h:68: undefined reference to `__SCT__tp_func_page_pool_state_hold'
>> ld: net/core/devmem.o:(__jump_table+0x8): undefined reference to `__tracepoint_page_pool_state_hold'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
