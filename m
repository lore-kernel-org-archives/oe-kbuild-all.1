Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAF0537207C
	for <oe-kbuild-all@lists.linux.dev>; Wed, 13 May 2026 10:24:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778667860; cv=none; b=MtVrXT71EyA37p0c6+jxSUACpG8/4SO15Asr8v9QSp8oNKaL52fx9y49k+YBJ3qrujUGQWoO3FnKilmxv95Kza9MKIbr644uP2k+DayilGPLxtYx9V2Bn5Ik57MQJX7H2h3U2KEAHOKFuUCW2Sf28ENot8pJ9y/IuhtumIlZ6EY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778667860; c=relaxed/simple;
	bh=KMiB7S+vpv8C2PKJ88pK8G5aUL9EpeuE9yVUJYHk60c=;
	h=Date:From:To:Cc:Subject:Message-ID; b=BwNXnArSVTnbqTrtMxqm4o0/be0ZT7ya+PF4jefiAziY3LEptspM1AMac4eyZmN/XuGn1fAEAcCg1ntOdNx8jsmGNan1pLn5v5uNxKmgxnlCI5NnH8auap/IReotlH5W/HWyVUUoAVQ77vx4mE/xbopx1Ibnfw6h1RgDhNXFlgM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iOn9X775; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iOn9X775"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778667859; x=1810203859;
  h=date:from:to:cc:subject:message-id;
  bh=KMiB7S+vpv8C2PKJ88pK8G5aUL9EpeuE9yVUJYHk60c=;
  b=iOn9X775skrCwTlWhQloa1YupuaX1Eyd2tlgFheFQJ5445Y5jM3Vh6ft
   v9lIRxQwaoKMhcnFcQasZBJKIRMQ9V/7uuxFfLmMWeeEMaZfOeHAJAgPE
   NThN01GX0SxXYxjUFO+/qKuT8r7linWri3Y5HFpvR8Ri0Glgi2UN8C7hR
   uUEWLOVNi9uW87CEnej3L8+uly0aB2aUuf1I6ZTa7zBZE7kdAF4Ig5GId
   9Y4RVFc5mIxN7h3LFKj8xY5xNeq/Ed8UvlAftn2GA26p9n707dn+dO2d/
   oP76WKIiSiHBFdzgfLo0U28GLJHl1ZHGDavBqMvxtsiNB/x+AlPEwCYmi
   w==;
X-CSE-ConnectionGUID: yaN0mb5QRNqFKTrWmgSeuQ==
X-CSE-MsgGUID: LzIu5ixGTlWUss3CU6gWXQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11784"; a="102257677"
X-IronPort-AV: E=Sophos;i="6.23,232,1770624000"; 
   d="scan'208";a="102257677"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2026 03:24:18 -0700
X-CSE-ConnectionGUID: eG60PmDaT/iuHYT53LaZ6Q==
X-CSE-MsgGUID: ZuJkDmYdRFuFFpHKRiJ3FA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,232,1770624000"; 
   d="scan'208";a="242056396"
Received: from lkp-server01.sh.intel.com (HELO dca79079c3eb) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 13 May 2026 03:24:16 -0700
Received: from kbuild by dca79079c3eb with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wN6lB-000000003vH-36iP;
	Wed, 13 May 2026 10:24:13 +0000
Date: Wed, 13 May 2026 18:24:02 +0800
From: kernel test robot <lkp@intel.com>
To: Athira Rajeev <atrajeev@linux.ibm.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Madhavan Srinivasan <maddy@linux.ibm.com>
Subject: arch/powerpc/platforms/pseries/htmdump.c:246:25: sparse:
 sparse: cast to restricted __be64
Message-ID: <202605131836.vkonGeka-lkp@intel.com>
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
config: powerpc64-randconfig-r122-20260512 (https://download.01.org/0day-ci/archive/20260513/202605131836.vkonGeka-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 5bac06718f502014fade905512f1d26d578a18f3)
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260513/202605131836.vkonGeka-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 627cf584f4c3 ("powerpc/pseries/htmdump: Add htm status support to htmdump module")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605131836.vkonGeka-lkp@intel.com/

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
