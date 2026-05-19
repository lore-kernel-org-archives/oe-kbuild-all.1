Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E18533002A0
	for <oe-kbuild-all@lists.linux.dev>; Tue, 19 May 2026 02:13:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779156797; cv=none; b=nnhClctcgJu28Fk+0KJe7fjJYSOZK340NxsbvH6F7yQRIR5UtpjnXqRhjWMAveAvGdxnQIjftoJ7WyErWKbwDH3tpaAoT1LhVPOxGZhBo5qL5iMmkly6UR6gghtDDenLCqQInyGEmpu2reXNn0gwNH4ZR0Xt8qcZIpzUgB8qsmo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779156797; c=relaxed/simple;
	bh=eXnPr6U61Q0+HVnw0etVfnHuwwmloa1nlX4sIFhFwCg=;
	h=Date:From:To:Cc:Subject:Message-ID; b=c03v9tcQwrQCn733RHmCjMfzC26AgiB7WiRMbYQ9HdKW9cvUDPUN9yogFAYvXGCizwuonJirLPTLyWJc/aCeB/bBQf6MTupApUzWzpfahafJeZjyDDNnq9HNZk9ZFzHtmSN55mMgA02c+cFb30ui/wR6vF56+XP9dPrdp87Nkls=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gw0mCzqr; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gw0mCzqr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779156796; x=1810692796;
  h=date:from:to:cc:subject:message-id;
  bh=eXnPr6U61Q0+HVnw0etVfnHuwwmloa1nlX4sIFhFwCg=;
  b=gw0mCzqrCaQMxBOEoCicwphM0UFOSclrRvnWk8JWnrStLLJaNEoKxkyE
   7VVlusCS7s3KcKm2BuQ76IJf5ZeEjwrl3+i4jWgnAlidf8Qo0v2sdD9kz
   aJuNF698KLJg6fbsZB2lEs6llQ8FWpdBn9HJe+GecCkxSvJEtcHRS3VWV
   WXNZT60LhcSm1fMw9t/mSP51/m9muKBtgTNDfc3v1B4gPkXHwTLrpQAcc
   6JHNC73jAc9xeR7kL3CN6LGD92j3k3w3d6YU1Fed48NBOg9ZeEDZo8j2w
   bkbdTdj6s1KL/iKst1clwuPug3Eiss8SjJ9I6XduRU65WxVyGQUfKd0z2
   w==;
X-CSE-ConnectionGUID: QrWDRs9kSEurmmgmzeNMiw==
X-CSE-MsgGUID: BYQ3V8N+RjuHsRd2TpCmNQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11790"; a="67553780"
X-IronPort-AV: E=Sophos;i="6.23,243,1770624000"; 
   d="scan'208";a="67553780"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 May 2026 19:13:14 -0700
X-CSE-ConnectionGUID: mdN7PpyCRLmMnrnMdulPMg==
X-CSE-MsgGUID: g4m+Gr/UTwqbvDXIKx50Pw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,243,1770624000"; 
   d="scan'208";a="239684814"
Received: from lkp-server02.sh.intel.com (HELO 30e86e9c1927) ([10.239.97.151])
  by orviesa009.jf.intel.com with ESMTP; 18 May 2026 19:13:13 -0700
Received: from kbuild by 30e86e9c1927 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wP9xG-0000000001D-0UgD;
	Tue, 19 May 2026 02:13:10 +0000
Date: Tue, 19 May 2026 09:19:24 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6 2/2]
 drivers/firmware/arm_ffa/driver.c:460:75: warning: unused variable
 'ep_offset'
Message-ID: <202605190953.ewhAPepO-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android15-6.6
head:   6e7cf2b6b9c6036655b461f07ca5e8b1df12fd23
commit: 790f8efa69de5ecdb0429281b1944b18d454b53d [2/2] BACKPORT: FROMLIST: firmware: arm_ffa: Fix Endpoint Memory Access Descriptor offset calculation
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20260519/202605190953.ewhAPepO-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260519/202605190953.ewhAPepO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605190953.ewhAPepO-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/firmware/arm_ffa/driver.c:460:75: warning: unused variable 'ep_offset' [-Wunused-variable]
     460 |         u32 idx, frag_len, length, buf_sz = 0, num_entries = sg_nents(args->sg), ep_offset;
         |                                                                                  ^~~~~~~~~
   1 warning generated.


vim +/ep_offset +460 drivers/firmware/arm_ffa/driver.c

   447	
   448	static int
   449	ffa_setup_and_transmit(u32 func_id, void *buffer, u32 max_fragsize,
   450			       struct ffa_mem_ops_args *args)
   451	{
   452		int rc = 0;
   453		bool first = true;
   454		u32 composite_offset, total_ep_mem, ep_access_offset, args_nattrs = args->nattrs;
   455		phys_addr_t addr = 0;
   456		struct ffa_mem_region *mem_region = buffer;
   457		struct ffa_composite_mem_region *composite;
   458		struct ffa_mem_region_addr_range *constituents;
   459		struct ffa_mem_region_attributes *ep_mem_access;
 > 460		u32 idx, frag_len, length, buf_sz = 0, num_entries = sg_nents(args->sg), ep_offset;
   461	
   462		mem_region->tag = args->tag;
   463		mem_region->flags = args->flags;
   464		mem_region->sender_id = drv_info->vm_id;
   465		mem_region->attributes = ffa_memory_attributes_get(func_id);
   466		if (drv_info->version <= FFA_VERSION_1_0) {
   467			mem_region->ep_mem_size = 0;
   468		} else {
   469			mem_region->ep_mem_size = sizeof(*ep_mem_access);
   470			mem_region->ep_mem_offset = sizeof(*mem_region);
   471			memset(mem_region->reserved, 0, 12);
   472		}
   473	
   474		ep_access_offset = ffa_mem_desc_offset(buffer, 0, drv_info->version);
   475		if (check_mul_overflow(args_nattrs, sizeof(struct ffa_mem_region_attributes), &total_ep_mem))
   476			return -EINVAL;
   477	
   478		if (total_ep_mem > max_fragsize - ep_access_offset)
   479			return -ENOSPC;
   480	
   481		composite_offset = ffa_mem_desc_offset(buffer, args_nattrs,
   482						       drv_info->version);
   483		if (composite_offset > max_fragsize - sizeof(struct ffa_composite_mem_region))
   484			return -ENXIO;
   485	
   486		ep_mem_access = buffer + ep_access_offset;
   487		for (idx = 0; idx < args_nattrs; idx++, ep_mem_access++) {
   488			ep_mem_access->receiver = args->attrs[idx].receiver;
   489			ep_mem_access->attrs = args->attrs[idx].attrs;
   490			ep_mem_access->composite_off = composite_offset;
   491			ep_mem_access->flag = 0;
   492			ep_mem_access->reserved = 0;
   493		}
   494		mem_region->handle = 0;
   495		mem_region->ep_count = args_nattrs;
   496	
   497		composite = buffer + composite_offset;
   498		composite->total_pg_cnt = ffa_get_num_pages_sg(args->sg);
   499		composite->addr_range_cnt = num_entries;
   500		composite->reserved = 0;
   501	
   502		length = composite_offset + CONSTITUENTS_OFFSET(num_entries);
   503		frag_len = composite_offset + CONSTITUENTS_OFFSET(0);
   504		if (frag_len > max_fragsize)
   505			return -ENXIO;
   506	
   507		if (!args->use_txbuf) {
   508			addr = virt_to_phys(buffer);
   509			buf_sz = max_fragsize / FFA_PAGE_SIZE;
   510		}
   511	
   512		constituents = buffer + frag_len;
   513		idx = 0;
   514		do {
   515			if (frag_len == max_fragsize) {
   516				rc = ffa_transmit_fragment(func_id, addr, buf_sz,
   517							   frag_len, length,
   518							   &args->g_handle, first);
   519				if (rc < 0)
   520					return -ENXIO;
   521	
   522				first = false;
   523				idx = 0;
   524				frag_len = 0;
   525				constituents = buffer;
   526			}
   527	
   528			if ((void *)constituents - buffer > max_fragsize) {
   529				pr_err("Memory Region Fragment > Tx Buffer size\n");
   530				return -EFAULT;
   531			}
   532	
   533			constituents->address = sg_phys(args->sg);
   534			constituents->pg_cnt = args->sg->length / FFA_PAGE_SIZE;
   535			constituents->reserved = 0;
   536			constituents++;
   537			frag_len += sizeof(struct ffa_mem_region_addr_range);
   538		} while ((args->sg = sg_next(args->sg)));
   539	
   540		return ffa_transmit_fragment(func_id, addr, buf_sz, frag_len,
   541					     length, &args->g_handle, first);
   542	}
   543	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
