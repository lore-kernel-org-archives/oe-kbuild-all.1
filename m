Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B21322616
	for <oe-kbuild-all@lists.linux.dev>; Thu, 25 Apr 2024 11:23:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714044239; cv=none; b=U0iNb+CN8P0hYPt8GnosCg9mXPuV1ZyqGXoaY7uFiNHAxL/aX9aYEu/ZkHMJIRyctDM8oV925ph2eq+nGVAngdlecafHnwYPCCi80ta9o6xqXuF/UoKVSW/7z9K/fYcOqWBqvwM+hzysmf6O5keM8dHxgijhdBmY3UwD4XYEzC8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714044239; c=relaxed/simple;
	bh=IaJ7+ePZDLlWe9hEuM59H3H2pQ0ZKtyOydRUcXHDEZw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=jPWwqwy9l2f30NyQ1njq0YZHQt8zI1Ow0aIZQ6QUlslHj/yooHmtqPizOB7AnRvextZ1G5DZ+/INFfEuxV/Y9aMcxs6G8XHBkjeLpCxYZsL9I/aRHNLk5L51Jx+5ufdNvS0RiUiaRec1UkswHpDi9GSg5OfYA4Rgo46aQT+wv0E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZXM4MTH3; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZXM4MTH3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714044236; x=1745580236;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=IaJ7+ePZDLlWe9hEuM59H3H2pQ0ZKtyOydRUcXHDEZw=;
  b=ZXM4MTH3s9Q8Q7zcQgnWWlp5GmcYhNyMRU1gfPEpmKDoWwLxlWKV3jgf
   ECJRXV5VZo5XuNqGHocWyykHPUbj/Hmee7S4bprsXGoncbu61mbI28d/8
   gX7vnLn6GtqD44daAUOPN6/gJLCE5M/SL066dTP9gWzl65ccu+6xcXho0
   kr7H/9MwQRVxuTO+U78ADuRAmxjHduA/ayAhg/xdbzlD/Q9ygfUDbOM2S
   ihB/8BasbopeASTQFA20JBHpK/3qXM0hgq45qMU0o69crU5diEcbuM7sp
   TIBnQZDVhnonACzx8JQUCPqwM/UYhZL3Ff2h6qaDgBobl4PBJnVEoQUok
   A==;
X-CSE-ConnectionGUID: AQG5COc5TJulbNRvN2Xvmw==
X-CSE-MsgGUID: TL6sv5hTTX+n7DxCRUPDDA==
X-IronPort-AV: E=McAfee;i="6600,9927,11054"; a="12657394"
X-IronPort-AV: E=Sophos;i="6.07,229,1708416000"; 
   d="scan'208";a="12657394"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Apr 2024 04:23:55 -0700
X-CSE-ConnectionGUID: 1Ex/5uxrSmCGGpszD622oQ==
X-CSE-MsgGUID: QTwaY/EXT8SpgaE9lqoBJw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,229,1708416000"; 
   d="scan'208";a="29663143"
Received: from lkp-server01.sh.intel.com (HELO e434dd42e5a1) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 25 Apr 2024 04:23:54 -0700
Received: from kbuild by e434dd42e5a1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rzxCi-0002IQ-27;
	Thu, 25 Apr 2024 11:23:52 +0000
Date: Thu, 25 Apr 2024 19:23:15 +0800
From: kernel test robot <lkp@intel.com>
To: Pablo Neira Ayuso <pablo@netfilter.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [pablo-gtp:main 5/12] drivers/net/gtp.c:139:43: sparse: sparse:
 incorrect type in argument 1 (different base types)
Message-ID: <202404251943.SyUDNEIS-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/pablo/gtp.git main
head:   1c0b778c54746b870a5297339ca36a43ed8fc701
commit: e97b19f501aaa49c0f420b0a9e0a7943adf2abd3 [5/12] gtp: use IPv6 address /64 prefix for UE/MS
config: loongarch-randconfig-r122-20240425 (https://download.01.org/0day-ci/archive/20240425/202404251943.SyUDNEIS-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20240425/202404251943.SyUDNEIS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404251943.SyUDNEIS-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/net/gtp.c:139:43: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int [usertype] a @@     got restricted __be32 const @@
   drivers/net/gtp.c:139:43: sparse:     expected unsigned int [usertype] a
   drivers/net/gtp.c:139:43: sparse:     got restricted __be32 const
>> drivers/net/gtp.c:139:62: sparse: sparse: incorrect type in argument 2 (different base types) @@     expected unsigned int [usertype] b @@     got restricted __be32 const @@
   drivers/net/gtp.c:139:62: sparse:     expected unsigned int [usertype] b
   drivers/net/gtp.c:139:62: sparse:     got restricted __be32 const
   drivers/net/gtp.c: note: in included file (through include/linux/module.h):
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
>> drivers/net/gtp.c:139:43: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int [usertype] a @@     got restricted __be32 const @@
   drivers/net/gtp.c:139:43: sparse:     expected unsigned int [usertype] a
   drivers/net/gtp.c:139:43: sparse:     got restricted __be32 const
>> drivers/net/gtp.c:139:62: sparse: sparse: incorrect type in argument 2 (different base types) @@     expected unsigned int [usertype] b @@     got restricted __be32 const @@
   drivers/net/gtp.c:139:62: sparse:     expected unsigned int [usertype] b
   drivers/net/gtp.c:139:62: sparse:     got restricted __be32 const

vim +139 drivers/net/gtp.c

   136	
   137	static inline u32 ipv6_hashfn(const struct in6_addr *ip6)
   138	{
 > 139		return jhash_2words(ip6->s6_addr32[0], ip6->s6_addr32[1], gtp_h_initval);
   140	}
   141	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
