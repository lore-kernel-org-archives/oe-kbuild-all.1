Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84E5B386C3E
	for <oe-kbuild-all@lists.linux.dev>; Tue,  3 Mar 2026 08:19:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772525986; cv=none; b=ZojKzaNV1onUbXLi69oTC5cCBEF44EGTW5YHSOfRfqO6mRVeikn7dItF/Cmi6+15xxMWf0fLSN3oNlR7kem4NkTHqLaFpy5dS8jGNrmhX7pgF4HWHUwGAUdexgb/VDVuxDVdekfDg/L489SH2W+fll1oFgROBTvUoOTOtEMOKWw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772525986; c=relaxed/simple;
	bh=oXZ7vuDE50fRFK4vt4UsU2EVEgAdRMtQwoqI6Tsh4P4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=AsiBP17C4MyfKaSR7hgGDheoftvyL8FMgddCV4EUb7UK+M8jvZUas/EINOD0a0wodhDdCtMaK36URazdmtqzANmv01Z0pEqyYmT80j1f6V9mDrx/GY1WZr8YY+rvPV2Sdo4sS+BksJvqxToqR74IZzPlMgS8aNDRefD/SN1etNA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OfHU5HSa; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OfHU5HSa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772525982; x=1804061982;
  h=date:from:to:cc:subject:message-id;
  bh=oXZ7vuDE50fRFK4vt4UsU2EVEgAdRMtQwoqI6Tsh4P4=;
  b=OfHU5HSaq5b+B3FGyqx/zHkz0rVgEtqXYcZ5VqsaPD49Uxb1U9wXmCPQ
   2PaXNZhuVg/PL59BwfmgP1jPwW+y4OsljnaiMFu9Ei8KO0XyCsRC/A4yo
   AnNx6JK/R2MUUqgW+d58uuCkX0UeexLoUcC+8XrIqlMl4yWGFeohqpbG9
   DXGmXGq2K8tEkwWh62sTObV+IuT031QnVL234fcJsSv5NpA9WTe/uXt1C
   Poo5oveirdAYvKduzew91ZWR4u9xIoX2brC8bOWMGG6Ufaf6Ud8PuPmM8
   VSswfth2jI2WcOf1ZvbnePAcvJ1Ec3QJxKCHABB5TzQP5aqmUZEquQGT6
   w==;
X-CSE-ConnectionGUID: 9bB6MPxoSwG+0iQopmv3QQ==
X-CSE-MsgGUID: MGuhh6A+REK40NFU0Box7w==
X-IronPort-AV: E=McAfee;i="6800,10657,11717"; a="83892961"
X-IronPort-AV: E=Sophos;i="6.21,321,1763452800"; 
   d="scan'208";a="83892961"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Mar 2026 00:18:53 -0800
X-CSE-ConnectionGUID: oLkZPhv8RC69+X0g9dz73w==
X-CSE-MsgGUID: Y3fK5o3WR/aClZ0cc8E+bQ==
X-Ironport-Invalid-End-Of-Message: True
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,321,1763452800"; 
   d="scan'208";a="217912231"
Received: from lkp-server01.sh.intel.com (HELO f27a57aa7a36) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 03 Mar 2026 00:18:52 -0800
Received: from kbuild by f27a57aa7a36 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vxKxt-000000001s7-0q4D;
	Tue, 03 Mar 2026 08:18:49 +0000
Date: Tue, 03 Mar 2026 16:18:06 +0800
From: kernel test robot <lkp@intel.com>
To: Athira Rajeev <atrajeev@linux.ibm.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Madhavan Srinivasan <maddy@linux.ibm.com>
Subject: arch/powerpc/platforms/pseries/htmdump.c:246:25: sparse:
 sparse: cast to restricted __be64
Message-ID: <202603031641.FGuPoHh0-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   af4e9ef3d78420feb8fe58cd9a1ab80c501b3c08
commit: 627cf584f4c36acb52230ffc47403cf9469ec9d0 powerpc/pseries/htmdump: Add htm status support to htmdump module
date:   10 months ago
config: powerpc64-randconfig-r122-20260303 (https://download.01.org/0day-ci/archive/20260303/202603031641.FGuPoHh0-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 8.5.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260303/202603031641.FGuPoHh0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603031641.FGuPoHh0-lkp@intel.com/

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
