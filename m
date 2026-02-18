Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0305831D74C
	for <oe-kbuild-all@lists.linux.dev>; Wed, 18 Feb 2026 12:57:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771419476; cv=none; b=ETGyxJPg1ztr/yEFzcLHyhq/iBf3jnRtlOCKEUwFWcILFBRB6vr7EWoCd1+s5UIadpZkA87kAoDBRkKsqmXSNRMBMFaSQKd0B9w4Bf2QRuM44fOvMjQKqJWyOVBRbj3prvlJStjqytdatjynRKkz71JRgaILlwpuoS0Uv5qaW6A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771419476; c=relaxed/simple;
	bh=lq29dweUsDulwOyJe86GNAg7RQXT7CR0zM9WR9Es8rU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=WlQMTiYwwvbDcPAqmyLpB+nLF9d+3VpXYejIj7DwpT0hDVls4dN/ID0t4KkcuEdaJlB4lslVUsbUxXMrvkbpAdWq8Li+ORp3IdPEE+iu5o18dwr+gRUkWXJfQVbFMrAAvuA8JNyLkLSJU32nSVMAYQ8inlK8BEY3HxJERDZYAyA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=a/ACB8wY; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="a/ACB8wY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771419475; x=1802955475;
  h=date:from:to:cc:subject:message-id;
  bh=lq29dweUsDulwOyJe86GNAg7RQXT7CR0zM9WR9Es8rU=;
  b=a/ACB8wY4n6ZDiT1mj/8wT7w0CArIiDXRvTw2EmfjJC5zFoNB9YtlWDV
   +7cpz4zfwzVyToCOWzzH+ax9fBglDz/844L2byItBdM89IpzRtpnmEvrw
   VLAKLssakVruf/g91RiYOHQWg3fmlWa2lG0JrL8rOzNwUsec0ZMVradvT
   fUJLTl9ub969T2vzm1pQeu0ssGdprRWxooJKHrc1wmnj4xORVXluKh3rV
   t/8pqnIfrQeh2mHn722q6IPor6tRsNbrq29pMn++zdDWdx07iYuIFCFBp
   jdXjGGDtgWTmVJ0xUVBCDxJA6Z/zdhGp3jT7bmZx/wZ9Y+cjwFdS2ASoi
   Q==;
X-CSE-ConnectionGUID: oCdi4B1fSXiKQ1AFRmxDLg==
X-CSE-MsgGUID: qoFdn/GKTXaBQ37Ufe12Gw==
X-IronPort-AV: E=McAfee;i="6800,10657,11704"; a="72583014"
X-IronPort-AV: E=Sophos;i="6.21,298,1763452800"; 
   d="scan'208";a="72583014"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Feb 2026 04:57:53 -0800
X-CSE-ConnectionGUID: L0g5vyaTTBSQSkPs+uApbQ==
X-CSE-MsgGUID: 8CcmXftBQm+c1M6Y9X+/Fg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,298,1763452800"; 
   d="scan'208";a="213384349"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 18 Feb 2026 04:57:51 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vsh7l-000000012M0-1Wuf;
	Wed, 18 Feb 2026 12:57:49 +0000
Date: Wed, 18 Feb 2026 20:56:57 +0800
From: kernel test robot <lkp@intel.com>
To: Jarkko Sakkinen <jarkko@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jarkko-tpmdd:container 10/18] <stdin>:1636:2: warning:
 #warning syscall container_enter not implemented
Message-ID: <202602182040.LLf75ekt-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jarkko/linux-tpmdd.git container
head:   c9d7b30aee6e85e849373b80fb5e4ace5fd890ed
commit: e8d2efa78c5d0d25517279fad58fee78cd05fcc3 [10/18] containers: Implement container_enter()
config: alpha-allnoconfig (https://download.01.org/0day-ci/archive/20260218/202602182040.LLf75ekt-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260218/202602182040.LLf75ekt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602182040.LLf75ekt-lkp@intel.com/

All warnings (new ones prefixed by >>):

   <stdin>:1627:2: warning: #warning syscall container_create not implemented [-Wcpp]
   <stdin>:1630:2: warning: #warning syscall container_wait not implemented [-Wcpp]
   <stdin>:1633:2: warning: #warning syscall container_kill not implemented [-Wcpp]
>> <stdin>:1636:2: warning: #warning syscall container_enter not implemented [-Wcpp]
--
   <stdin>:1627:2: warning: #warning syscall container_create not implemented [-Wcpp]
   <stdin>:1630:2: warning: #warning syscall container_wait not implemented [-Wcpp]
   <stdin>:1633:2: warning: #warning syscall container_kill not implemented [-Wcpp]
>> <stdin>:1636:2: warning: #warning syscall container_enter not implemented [-Wcpp]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
