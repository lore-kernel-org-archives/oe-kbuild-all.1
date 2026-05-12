Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0697225B08C
	for <oe-kbuild-all@lists.linux.dev>; Tue, 12 May 2026 19:54:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778615645; cv=none; b=E8akkY/3vu59Ey96ZUVQfJvB3JZdtc71Sx/Xv6e6O8O9L2mw0yCAGuXA3hi0Xlzn63cakKNWIgtXY2P7LyCVIv5td6xIgd+TmwPYGVIt5klxVxup5JJJpobk3zQmBUsSuG7wCQqV+j/KakJtC7fUe+SacBdAqgokVPVVYeev/6o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778615645; c=relaxed/simple;
	bh=Us1JCMquS3p1FdaaCqc6eEGDawigSVvMNQ5ZdqlY6mY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=rDXKY3KRUphV3fmzJ8PmI7D1rp4WkHhT9Up3WKKi1QJosDLkw5pw9uLH6laoV+RR86e5SuH71J9e+F+7siH7GbcbkvCl1dvK4bdPUtF025AjObgOn0i+8NDkq+eKus3VPJ7Os9/HJZMzToS52wGfo5bnDVKujruUtHRoi+6WqDc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Gbq5OfeW; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Gbq5OfeW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778615644; x=1810151644;
  h=date:from:to:cc:subject:message-id;
  bh=Us1JCMquS3p1FdaaCqc6eEGDawigSVvMNQ5ZdqlY6mY=;
  b=Gbq5OfeWPzHqIsGJWBTniJk9a4p1H4rv853jbdfoome3Mgi4n2Z5mWq3
   WVrB5Qu7BuwLBzMwdHfKRHtH+QpNItvClFAiYCh6WJalhDu47yfyyRg1P
   ay2fFYQbb3wHw7G+Oi4Rfy5DzEuiI6pYYrIsyuzwnxEV7IMVSWP0bl2g+
   ZSdQTjlpV8XBA/GpOp8Krc7ADVdNhFI0e9XiWR/B+MTIMZX7HwP/3FSHP
   cXcLjjDHnqA6Sk0EYP9mpcGJvXYLGqHRkNHmTbjGNKo40o9NTrGQ/9MRy
   N2PxsdOrUs7fdofKZrkhdaEulZkbhyRsNwqrW3stb0JOx0L6pgoh+Yd4+
   w==;
X-CSE-ConnectionGUID: sN1H+GUjStiPiq/vnygR6g==
X-CSE-MsgGUID: A1zX7BB1QGym2XCVzhT6DQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11784"; a="79518406"
X-IronPort-AV: E=Sophos;i="6.23,231,1770624000"; 
   d="scan'208";a="79518406"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 May 2026 12:54:04 -0700
X-CSE-ConnectionGUID: QGiw/iEMT6Kx+PtG6YYNPA==
X-CSE-MsgGUID: gJ+AJQuMSky/5Ljd5pVCyg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,231,1770624000"; 
   d="scan'208";a="236883763"
Received: from lkp-server01.sh.intel.com (HELO dca79079c3eb) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 12 May 2026 12:54:02 -0700
Received: from kbuild by dca79079c3eb with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wMtB1-000000002ib-0W9x;
	Tue, 12 May 2026 19:53:59 +0000
Date: Wed, 13 May 2026 03:53:01 +0800
From: kernel test robot <lkp@intel.com>
To: Athira Rajeev <atrajeev@linux.ibm.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Madhavan Srinivasan <maddy@linux.ibm.com>
Subject: arch/powerpc/platforms/pseries/htmdump.c:246:25: sparse:
 sparse: cast to restricted __be64
Message-ID: <202605130321.UkddskUP-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   1d5dcaa3bd65f2e8c9baa14a393d3a2dc5db7524
commit: 627cf584f4c36acb52230ffc47403cf9469ec9d0 powerpc/pseries/htmdump: Add htm status support to htmdump module
date:   1 year ago
config: powerpc64-randconfig-r122-20260512 (https://download.01.org/0day-ci/archive/20260513/202605130321.UkddskUP-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 5bac06718f502014fade905512f1d26d578a18f3)
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260513/202605130321.UkddskUP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 627cf584f4c3 ("powerpc/pseries/htmdump: Add htm status support to htmdump module")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605130321.UkddskUP-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> arch/powerpc/platforms/pseries/htmdump.c:246:25: sparse: sparse: cast to restricted __be64

vim +246 arch/powerpc/platforms/pseries/htmdump.c

   208	
   209	static ssize_t htmstatus_read(struct file *filp, char __user *ubuf,
   210				     size_t count, loff_t *ppos)
   211	{
   212		void *htm_status_buf = filp->private_data;
   213		long rc, ret;
   214		u64 *num_entries;
   215		u64 to_copy;
   216		int htmstatus_flag;
   217	
   218		/*
   219		 * Invoke H_HTM call with:
   220		 * - operation as htm status (H_HTM_OP_STATUS)
   221		 * - last three values as addr, size and offset
   222		 */
   223		rc = htm_hcall_wrapper(nodeindex, nodalchipindex, coreindexonchip,
   224					   htmtype, H_HTM_OP_STATUS, virt_to_phys(htm_status_buf),
   225					   PAGE_SIZE, 0);
   226	
   227		ret = htm_return_check(rc);
   228		if (ret <= 0) {
   229			pr_debug("H_HTM hcall failed for op: H_HTM_OP_STATUS, returning %ld\n", ret);
   230			return ret;
   231		}
   232	
   233		/*
   234		 * HTM status buffer, start of buffer + 0x10 gives the
   235		 * number of HTM entries in the buffer. Each nest htm status
   236		 * entry is 0x6 bytes where each core htm status entry is
   237		 * 0x8 bytes.
   238		 * So total count to copy is:
   239		 * 32 bytes (for first 7 fields) + (number of HTM entries * entry size)
   240		 */
   241		num_entries = htm_status_buf + 0x10;
   242		if (htmtype == 0x2)
   243			htmstatus_flag = 0x8;
   244		else
   245			htmstatus_flag = 0x6;
 > 246		to_copy = 32 + (be64_to_cpu(*num_entries) * htmstatus_flag);
   247		return simple_read_from_buffer(ubuf, count, ppos, htm_status_buf, to_copy);
   248	}
   249	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
