Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7959640BCA0
	for <oe-kbuild-all@lists.linux.dev>; Mon, 17 Aug 2026 12:09:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786968575; cv=none; b=db2EHbFJUkTuqkvZmunzE+iMWp5uUzgc5lamZlS93yroExaVYPlshNfs+gOlKAYeZI/4pm0gVHAjLNEGpA/TBRQsBGw2ytbtvs8Zd1UY7sGh72XKpplWTWMP5cZIBQ1wPGMnMzke8cpZIKGm/Fqk44sGrhymuKTpkGp2VM8Q5p4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786968575; c=relaxed/simple;
	bh=AQ0Zn/GSs7VuykUnnbc9Sx9RiPAnRMBKdntf3LGIssg=;
	h=Date:From:To:Cc:Subject:Message-ID; b=J3E0PEGZTrQaCEBpPMT73BvZW2Id4XGwNDsiLSomy3/0vzQUh4olYPzVBOinKcBpJAdZYAxX/Q+6XdJKAXPRdDL7Y+a84CeJQ9hD0j4B6WeeLxwb0GU7V+rlQFCYOtwl0poPwmoJsmikMaQzPD4cZ3iI4kB6kGTh/maJtsDc6Dk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HORzn/O1; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HORzn/O1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786968572; x=1818504572;
  h=date:from:to:cc:subject:message-id;
  bh=AQ0Zn/GSs7VuykUnnbc9Sx9RiPAnRMBKdntf3LGIssg=;
  b=HORzn/O1esVxGPlU6/C1ja6qdsCL1Q/adiy6pSFuj+CbK01SpHt0a0Hm
   uFrT8IwYaskBY6T0DbQXq3KWFaAAbVVbVaHtYhvXTVQWZeH+CF3id51r+
   bZXcgu322kBkM9i2S4E1oKg280J9H4Dmg2+xgbT+TJatqM7S6mpiPXTnW
   EWkTfb4sn4s3g5yE7B7PULHrDcb79ozovrpty+1hDSsjYGuE3pwoTCiBV
   Y4TUvLUbxKez/jfjLRgM23vSWcYfsaC+nC+LH/u4JitLPuqLGowxNngjx
   p02F+AUHu0p8rC+d9dr8BdX2V67TNCEhm9wz83g6TVhb64+6VeP+J7XFX
   Q==;
X-CSE-ConnectionGUID: r4DBqFriTwiErWCYH0FBmQ==
X-CSE-MsgGUID: Vha70RMgRgWQs3J2lXmBOQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11877"; a="86561315"
X-IronPort-AV: E=Sophos;i="6.25,228,1779174000"; 
   d="scan'208";a="86561315"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Aug 2026 05:09:32 -0700
X-CSE-ConnectionGUID: ODjuhsUoQ0i1JpyHytNUxQ==
X-CSE-MsgGUID: 8PhL7xSTT5SCOyRjFG1JBA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,228,1779174000"; 
   d="scan'208";a="268398086"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 17 Aug 2026 05:09:30 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wvw9g-00000000dSG-2CMN;
	Mon, 17 Aug 2026 12:09:28 +0000
Date: Mon, 17 Aug 2026 20:08:43 +0800
From: kernel test robot <lkp@intel.com>
To: Cristian Marussi <cristian.marussi@arm.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [cris:scmi_telemetry_ng_V10 21/24]
 drivers/firmware/arm_scmi/scmi_system_telemetry.c:430:30: sparse: sparse:
 Using plain integer as NULL pointer
Message-ID: <202608172008.fMZdQvug-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/cris/linux.git scmi_telemetry_ng_V10
head:   df0b7741c5c054f77c494b8a0a33fedba6a1a379
commit: 587d35c2f0b836fec2a46729ecd0532d65689921 [21/24] firmware: arm_scmi: Add System Telemetry driver
config: powerpc64-randconfig-r113-20260817 (https://download.01.org/0day-ci/archive/20260817/202608172008.fMZdQvug-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 15.2.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260817/202608172008.fMZdQvug-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608172008.fMZdQvug-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/firmware/arm_scmi/scmi_system_telemetry.c:430:30: sparse: sparse: Using plain integer as NULL pointer

vim +430 drivers/firmware/arm_scmi/scmi_system_telemetry.c

   408	
   409	static int
   410	scmi_tlm_batch_initialize(void __user *uptr, struct scmi_tlm_batch *batch,
   411				  size_t item_sz, unsigned int max_items,
   412				  void **out_items, size_t *out_batch_sz,
   413				  int **out_states, size_t *out_states_sz)
   414	{
   415		size_t batch_sz;
   416	
   417		if (copy_from_user(batch, uptr, sizeof(*batch)))
   418			return -EFAULT;
   419	
   420		if (batch->reserved || batch->item_sz != item_sz ||
   421		    batch->num_items > max_items)
   422			return -EINVAL;
   423	
   424		/* Sanity check on user invocation */
   425		if (!out_items || !out_batch_sz)
   426			return -EINVAL;
   427	
   428		/* Was a size query ? */
   429		if (batch->num_items == 0) {
 > 430			*out_items = 0;
   431			*out_batch_sz = 0;
   432			return 0;
   433		}
   434	
   435		batch_sz = array_size(batch->num_items, batch->item_sz);
   436		if (batch_sz == SIZE_MAX)
   437			return -EOVERFLOW;
   438	
   439		void *items __free(kvfree) = kvzalloc(batch_sz, GFP_KERNEL);
   440		if (!items)
   441			return -ENOMEM;
   442	
   443		/* Read all the requested configs */
   444		if (copy_from_user(items, u64_to_user_ptr(batch->items), batch_sz))
   445			return -EFAULT;
   446	
   447		/* Is per-read status required ? */
   448		if (batch->states) {
   449			size_t states_sz;
   450	
   451			states_sz = array_size(batch->num_items, sizeof(int));
   452			if (states_sz == SIZE_MAX)
   453				return -EOVERFLOW;
   454	
   455			int *states_arr __free(kvfree) = kvzalloc(states_sz, GFP_KERNEL);
   456			if (!states_arr)
   457				return -ENOMEM;
   458	
   459			if (copy_from_user(states_arr, u64_to_user_ptr(batch->states),
   460					   states_sz))
   461				return -EFAULT;
   462	
   463			if (out_states)
   464				*out_states = no_free_ptr(states_arr);
   465			if (out_states_sz)
   466				*out_states_sz = states_sz;
   467		} else {
   468			if (out_states)
   469				*out_states = NULL;
   470			if (out_states_sz)
   471				*out_states_sz = 0;
   472		}
   473	
   474		*out_items = no_free_ptr(items);
   475		*out_batch_sz = batch_sz;
   476	
   477		return 0;
   478	}
   479	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
