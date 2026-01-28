Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B545354AD0
	for <oe-kbuild-all@lists.linux.dev>; Wed, 28 Jan 2026 13:52:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769608363; cv=none; b=D+dpSLxyussam0nz4W17lKxyT/yWa6WxSBG6AUouPYenHjoMmlU77F1RBTnm2nJqdDLgdqHHk/L4gsNdDa3w7QkQolt8eBNse5G9I8cRpWtYtg+QM+Sbn6fMNHjgw/nEeC2DjdcmGg8/eUsoYoDvAQTXbvy69L4904BzbjJW75g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769608363; c=relaxed/simple;
	bh=XQ436YnilgCme4LGcrBSHSTH2nrijNYUZN6Cu9Yx6Is=;
	h=Date:From:To:Cc:Subject:Message-ID; b=kQPC7mu5bXALC9LkFvpCtH7IhQbOE7wSYhn5oiMiaU2GTibpSez5px3oD5h8NPD3uuAtZC4fg3nRtvjmVwhHCa99Kr67whOw8znB5IHE1HvsOi7fiIR8n/Xn19M0du2Eod2KzCdiKw7sjVEEzi1CCc28iJwtD0j5HELEqSiTASk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=e81s5iOc; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="e81s5iOc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769608361; x=1801144361;
  h=date:from:to:cc:subject:message-id;
  bh=XQ436YnilgCme4LGcrBSHSTH2nrijNYUZN6Cu9Yx6Is=;
  b=e81s5iOctpPxt82/uqVrtkzHDz+uI+DumoBMPMt9Uu2/9pnAto+xlyk7
   tmqJkPw1NE8sW6XQUc/Gme5DskwkG87w2a/g44x+07eitR8jpU0AAvJRW
   BdS6jd/3GPEgm5xaFNivZGpyFPCg42y7AzNivnV+inkfdlxu/G6TtZpT3
   u2QTHrmI+WjZNo4F8mLwmt5qdzmiHsryaxgiu/0mdLk8V9SgWcbXI5kbk
   pu4jG9eFD43vWSV2ipFQp54yyfcGq/jS96egQQ990V+vn2QMTueWzKu7E
   +N8RH1JBKULCg6QCZVH9FpJ5xXuJqMsXjfHvg3sX8wiNl/JVKiDAMoybB
   g==;
X-CSE-ConnectionGUID: iU7kEhfcSlO8eovbcLd9KQ==
X-CSE-MsgGUID: Xo1tzxxWTbWYCMEksSBhdQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11684"; a="81542864"
X-IronPort-AV: E=Sophos;i="6.21,258,1763452800"; 
   d="scan'208";a="81542864"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jan 2026 05:52:41 -0800
X-CSE-ConnectionGUID: ZxlMml7ORo+SvktsxeIJCQ==
X-CSE-MsgGUID: ILxWpQWpSZyzXT66usc3tw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,258,1763452800"; 
   d="scan'208";a="208645996"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 28 Jan 2026 05:52:40 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vl5yH-00000000Zj4-3F4f;
	Wed, 28 Jan 2026 13:52:37 +0000
Date: Wed, 28 Jan 2026 21:52:15 +0800
From: kernel test robot <lkp@intel.com>
To: Jarkko Sakkinen <jarkko@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jarkko-tpmdd:vcam 5/5] ./usr/include/linux/vcam.h:11:10:
 fatal error: linux/bitops.h: No such file or directory
Message-ID: <202601282136.OZpFyQCU-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jarkko/linux-tpmdd.git vcam
head:   0eaa98db49713b6cf0b621c8d0bbfa8ff2e75566
commit: 0eaa98db49713b6cf0b621c8d0bbfa8ff2e75566 [5/5] media: Virtual camera driver
config: i386-buildonly-randconfig-001-20260128 (https://download.01.org/0day-ci/archive/20260128/202601282136.OZpFyQCU-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260128/202601282136.OZpFyQCU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601282136.OZpFyQCU-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from <command-line>:
>> ./usr/include/linux/vcam.h:11:10: fatal error: linux/bitops.h: No such file or directory
      11 | #include <linux/bitops.h>
         |          ^~~~~~~~~~~~~~~~
   compilation terminated.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
