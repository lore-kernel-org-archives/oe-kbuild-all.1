Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5785DA21
	for <oe-kbuild-all@lists.linux.dev>; Sat, 16 Mar 2024 12:30:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710592251; cv=none; b=uCqVIkdK9bvWc0UxCTdYJU8XYwL0j4T5Mh3ZAJTqPECIPX3uRk/2kO3MZHjSZokfpbv7xl15/03b/gbQMN03/eXH16kSasA7mDGCo3fpKKCbhiQGCr3flf7OUvzNR+Pa+os965aVFG3o7Cb1VTOXGeYLksuC37rflYpujXjCBcI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710592251; c=relaxed/simple;
	bh=bDhP6dcMtxvxFVa7UsKcZDTlzv/wcR0fxJ5029wumsk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=DYzqQ5xLHnNP/QIJ7auj7RdJKWaiNLxzLJwwysB+tXcHqJ8z8VgB3PPsRhl/CJPhJFMTuheFVrMgQFKQ+MOFTLlOfFLe88qVf6IXx0NzM/S5sAFdnAp97CuDfnB1P98kBJwor5/Bp19QrZAAoF2UxTuRi5oZsftU1ofsot9H0og=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NpEcXhbv; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NpEcXhbv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1710592248; x=1742128248;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=bDhP6dcMtxvxFVa7UsKcZDTlzv/wcR0fxJ5029wumsk=;
  b=NpEcXhbvQsxd5XYy88j33JvCWi5jeEpl7/kc2lFv5AR9SPfcoag1cZr5
   jllbqoLLygnvGmGAC2d3ijuQBgsg9M/Z1JlgwM5kq13CMTWs4ge4NqmLd
   JpN3QlBuegq6H0G4hUbh9Q01PNV3Oa7wSYMqszQhUMbB5J74iVh95hps0
   AIc5urEs3Bcd0Lpp6PVHLJsyUbAOQvcf5AewruHEWS6aGHfqkzA0BqRCl
   lc4FUTI2NDX+W9Rii9azG5PpyM/LQEVFmtgtL9YJjncJg6liAY7y4Ctzc
   xLoFkwH/2grtOzgSzQkeD5P2KME8iIc73mKCpVch8+fapNTIUtyKpvg5U
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11014"; a="5320525"
X-IronPort-AV: E=Sophos;i="6.07,130,1708416000"; 
   d="scan'208";a="5320525"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Mar 2024 05:30:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,130,1708416000"; 
   d="scan'208";a="12897840"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 16 Mar 2024 05:30:47 -0700
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rlTBU-000FPh-1Q;
	Sat, 16 Mar 2024 12:30:44 +0000
Date: Sat, 16 Mar 2024 20:29:59 +0800
From: kernel test robot <lkp@intel.com>
To: David Howells <dhowells@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [dhowells-fs:netfs-writeback 11/12] /usr/bin/ld: client.c:undefined
 reference to `netfs_write_subrequest_terminated'
Message-ID: <202403162022.9UmqZK71-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git netfs-writeback
head:   be938ad004e7a8f28cc6fc8500c120c7687339f7
commit: 489782b46f83f343c2449bbc797ef390816163bd [11/12] netfs: Use writeback_iter() and improve the writeback algorithm
config: um-randconfig-002-20240316 (https://download.01.org/0day-ci/archive/20240316/202403162022.9UmqZK71-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240316/202403162022.9UmqZK71-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403162022.9UmqZK71-lkp@intel.com/

All errors (new ones prefixed by >>):

   /usr/bin/ld: net/9p/client.o: in function `p9_client_write_subreq':
   client.c:(.text+0x43e7): undefined reference to `netfs_write_subrequest_terminated'
>> /usr/bin/ld: client.c:(.text+0x44bb): undefined reference to `netfs_write_subrequest_terminated'
   /usr/bin/ld: client.c:(.text+0x44f3): undefined reference to `netfs_write_subrequest_terminated'
   collect2: error: ld returned 1 exit status

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
