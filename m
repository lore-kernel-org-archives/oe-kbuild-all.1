Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAF7023A98E
	for <oe-kbuild-all@lists.linux.dev>; Mon, 25 Aug 2025 16:47:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756140459; cv=none; b=CLgzS2AU2gDkGDOHT7m0yeAaAkOWJ+53NMzfkR7z17yZ5qSXPe411aFGSs/ROeqBEOOafM2/YtbMdfZTQAolCkujtiuCw0PeXs4vWZ6/2CswdfXbEZLkT8drTqObEz8pI2lBSOns7BdsZPkuR27/WEfistuZPCXj0nVfq+j7xLI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756140459; c=relaxed/simple;
	bh=Mu73N0NkrAtm6bUwI+Y59TxOPFaajOvErmYyAvVnF2A=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=BEL58hFcOpbqUfqrQuRQ+LcC41flFDu3quDw6tcpci2osMBXinqFjLvyIDIlDoZFbYcfLFwCDd7XLs1GD/uPCoP881c5Ux35N+8CmeBm63xsPepCbGp2bGbOJHgh3zLP0wywwb2T619b3nFbqptdVoefZoTl7IydmufBhhyoM1A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=f++4Pgga; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="f++4Pgga"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756140458; x=1787676458;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Mu73N0NkrAtm6bUwI+Y59TxOPFaajOvErmYyAvVnF2A=;
  b=f++4Pgga5GlSV2iY1a7k66wY3r8/MPuohF1o93lLOT8dXCBDWRS9jF3s
   RxEzUx7Q2rQNSowXZX40vMcivtv5Hk2dT/K2YzTECTdOihZZ4UYA4Rcqt
   JqqtvsXj9Npg+c65u0XFv195YEOVlnqqhi5Mjl3BDVQijbnL1a1RbJt4K
   nbKZGlwYuHqxUKLS0uVJsYkEhU35JTPU1c8j9VNHCMAWHpaG8QYjKkVg7
   X0O+1rnIHrxUZF+JC3d7AL4n5an7B2K4cDOkZKjvlYoGFpkPQHVAJ47/B
   CUyNMHMiAuJcE0WHsnwod2sv3j3+fSzlul9BavGg8BFd6qx/opvke2HHn
   Q==;
X-CSE-ConnectionGUID: c7KsmvmaQkme7+d683XZ2A==
X-CSE-MsgGUID: MNbcgUp1RraC9jgmhzAe7Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="62186094"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="62186094"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Aug 2025 09:47:30 -0700
X-CSE-ConnectionGUID: 8E3P/rDsTeu2QKCXU7zh9g==
X-CSE-MsgGUID: vyEIqTCzRVSiz4KHZ/fBPw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,213,1751266800"; 
   d="scan'208";a="173743097"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by orviesa004.jf.intel.com with ESMTP; 25 Aug 2025 09:47:30 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uqaLs-000Nqt-0j;
	Mon, 25 Aug 2025 16:47:25 +0000
Date: Tue, 26 Aug 2025 00:46:32 +0800
From: kernel test robot <lkp@intel.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [linux-next:master 4037/4221] io_uring/io_uring.h:286:25: sparse:
 sparse: restricted io_req_flags_t degrades to integer
Message-ID: <202508260022.8rxNgos4-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   6c68f4c0a147c025ae0b25fab688c7c47964a02f
commit: 05b865d3b2dcfdde37b570b6b437287d77998101 [4037/4221] io_uring: add async data clear/free helpers
config: x86_64-randconfig-r121-20250825 (https://download.01.org/0day-ci/archive/20250826/202508260022.8rxNgos4-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14+deb12u1) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250826/202508260022.8rxNgos4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508260022.8rxNgos4-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   io_uring/waitid.c: note: in included file:
>> io_uring/io_uring.h:286:25: sparse: sparse: restricted io_req_flags_t degrades to integer
>> io_uring/io_uring.h:286:20: sparse: sparse: invalid assignment: &=
   io_uring/io_uring.h:286:20: sparse:    left side has type restricted io_req_flags_t
   io_uring/io_uring.h:286:20: sparse:    right side has type unsigned long long
--
   io_uring/uring_cmd.c:339:59: sparse: sparse: array of flexible structures
   io_uring/uring_cmd.c: note: in included file:
   io_uring/io_uring.h:84:73: sparse: sparse: array of flexible structures
   io_uring/uring_cmd.c: note: in included file:
   io_uring/uring_cmd.h:21:59: sparse: sparse: array of flexible structures
   io_uring/uring_cmd.c: note: in included file:
>> io_uring/io_uring.h:286:25: sparse: sparse: restricted io_req_flags_t degrades to integer
>> io_uring/io_uring.h:286:20: sparse: sparse: invalid assignment: &=
   io_uring/io_uring.h:286:20: sparse:    left side has type restricted io_req_flags_t
   io_uring/io_uring.h:286:20: sparse:    right side has type unsigned long long
--
   io_uring/futex.c: note: in included file:
>> io_uring/io_uring.h:286:25: sparse: sparse: restricted io_req_flags_t degrades to integer
>> io_uring/io_uring.h:286:20: sparse: sparse: invalid assignment: &=
   io_uring/io_uring.h:286:20: sparse:    left side has type restricted io_req_flags_t
   io_uring/io_uring.h:286:20: sparse:    right side has type unsigned long long
>> io_uring/io_uring.h:286:25: sparse: sparse: restricted io_req_flags_t degrades to integer
>> io_uring/io_uring.h:286:20: sparse: sparse: invalid assignment: &=
   io_uring/io_uring.h:286:20: sparse:    left side has type restricted io_req_flags_t
   io_uring/io_uring.h:286:20: sparse:    right side has type unsigned long long
>> io_uring/io_uring.h:286:25: sparse: sparse: restricted io_req_flags_t degrades to integer
>> io_uring/io_uring.h:286:20: sparse: sparse: invalid assignment: &=
   io_uring/io_uring.h:286:20: sparse:    left side has type restricted io_req_flags_t
   io_uring/io_uring.h:286:20: sparse:    right side has type unsigned long long
>> io_uring/io_uring.h:286:25: sparse: sparse: restricted io_req_flags_t degrades to integer
>> io_uring/io_uring.h:286:20: sparse: sparse: invalid assignment: &=
   io_uring/io_uring.h:286:20: sparse:    left side has type restricted io_req_flags_t
   io_uring/io_uring.h:286:20: sparse:    right side has type unsigned long long
--
   io_uring/rw.c: note: in included file:
>> io_uring/io_uring.h:286:25: sparse: sparse: restricted io_req_flags_t degrades to integer
>> io_uring/io_uring.h:286:20: sparse: sparse: invalid assignment: &=
   io_uring/io_uring.h:286:20: sparse:    left side has type restricted io_req_flags_t
   io_uring/io_uring.h:286:20: sparse:    right side has type unsigned long long
--
>> io_uring/net.c:182:46: sparse: sparse: incorrect type in argument 2 (different base types) @@     expected unsigned long long [usertype] extra_flags @@     got restricted io_req_flags_t @@
   io_uring/net.c:182:46: sparse:     expected unsigned long long [usertype] extra_flags
   io_uring/net.c:182:46: sparse:     got restricted io_req_flags_t
   io_uring/net.c: note: in included file:
>> io_uring/io_uring.h:286:25: sparse: sparse: restricted io_req_flags_t degrades to integer
>> io_uring/io_uring.h:286:20: sparse: sparse: invalid assignment: &=
   io_uring/io_uring.h:286:20: sparse:    left side has type restricted io_req_flags_t
   io_uring/io_uring.h:286:20: sparse:    right side has type unsigned long long

vim +286 io_uring/io_uring.h

   283	
   284	static inline void io_req_async_data_clear(struct io_kiocb *req, u64 extra_flags)
   285	{
 > 286		req->flags &= ~(REQ_F_ASYNC_DATA|extra_flags);
   287		req->async_data = NULL;
   288	}
   289	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
