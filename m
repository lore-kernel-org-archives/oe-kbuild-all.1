Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F888E56E
	for <oe-kbuild-all@lists.linux.dev>; Tue,  1 Oct 2024 02:13:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727748831; cv=none; b=L8VJcZX39SE8JguEI80zyz0rCrZgx0YFAdyeOna43lMW26HsuHIvphpVLCi96sIi9e1nbL+trjpaE7lhtbQGt8YVv3HEaIA7+h9LC89KagXc8NuPa2zMwSNkIlHOpXgnx5t3kvVZ3kgBJ+PlVTWs+sBk2bjw5d3AnzkCwaBzsts=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727748831; c=relaxed/simple;
	bh=nlBpKFqon5IIy4Oa08FmVPSuHFUtu6LfMsfd0hzYrtY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=P3W1+JomDvcyE8C8rmFgtu4bG2opEzsn4avsGMRnKUis8O7jvUIDfdCPZXrjdDGSrBy6kX37gu46zduz31JJd9s/AQr32qwGVIZC+JcWnySaZZ96IScdOSaB8TAearBQJPxnbc9SIKO1NTSBwtyXwjYEP4JeZpFjn+jDsdHWuGs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=J9TbyXbW; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="J9TbyXbW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727748829; x=1759284829;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=nlBpKFqon5IIy4Oa08FmVPSuHFUtu6LfMsfd0hzYrtY=;
  b=J9TbyXbWuMrMjCohKCv+Yn4fcm6t3je++lprVsrM8IVILEw8o/q38FC1
   Jxig2EbpemzjCGllD41edVHoQ/9Zt1ooMLyH0r8sx/UXEETBcIgEUTY/m
   8AY/saL//ojYAqkmIVWwhW4N8tCaS/aBl3DRPFNKxm6sI+sdqfhFOJaj+
   u7nAaqe/lRQtClQV1zbupgYw/YWK/tBeysTe0sUJc4bHE11nzTYvF5Vxf
   NmmAdwl5wVGcYWA091mAn3aqyJOITSa4pk8MLLtjbbsqCq9ibbUgE5Txb
   L585ZIau2rbccjXB+1jYN9eRm6VA6LNrzBytHGL61WD9Ac7GJGSE95kjL
   w==;
X-CSE-ConnectionGUID: rH5msXFYQAKbm1J2OD+EgQ==
X-CSE-MsgGUID: 5ozKqP2jQhi9aYauV+fX0A==
X-IronPort-AV: E=McAfee;i="6700,10204,11211"; a="26370505"
X-IronPort-AV: E=Sophos;i="6.11,167,1725346800"; 
   d="scan'208";a="26370505"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Sep 2024 19:13:49 -0700
X-CSE-ConnectionGUID: ZT7fX9IQQsaeFuQ9yHWsVQ==
X-CSE-MsgGUID: 3tv989KjRu2CxgQs1jBEMQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,167,1725346800"; 
   d="scan'208";a="110981087"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 30 Sep 2024 19:13:47 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1svSOX-000Q9B-1r;
	Tue, 01 Oct 2024 02:13:45 +0000
Date: Tue, 1 Oct 2024 10:13:44 +0800
From: kernel test robot <lkp@intel.com>
To: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, Mike Rapoport <rppt@kernel.org>
Subject: [rppt:execmem/x86-rox/v4 5/8] include/linux/set_memory.h:38:1:
 error: expected identifier or '(' before '{' token
Message-ID: <202410011023.hbCAbCMM-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/rppt/linux.git execmem/x86-rox/v4
head:   c90f89d40fd21ce040b5cf1485ec6913d1b4ea5d
commit: 394ca992d5179367add42d631858f72a3bf4870d [5/8] arch: introduce set_direct_map_valid_noflush()
config: alpha-allmodconfig (https://download.01.org/0day-ci/archive/20241001/202410011023.hbCAbCMM-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 13.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241001/202410011023.hbCAbCMM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410011023.hbCAbCMM-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from mm/vmalloc.c:21:
>> include/linux/set_memory.h:38:1: error: expected identifier or '(' before '{' token
      38 | {
         | ^


vim +38 include/linux/set_memory.h

    36	
    37	int set_direct_map_valid_noflush(struct page *page, unsigned nr, bool valid);
  > 38	{
    39		return 0;
    40	}
    41	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
