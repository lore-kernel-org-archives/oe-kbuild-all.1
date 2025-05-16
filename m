Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B71A4229B0E
	for <oe-kbuild-all@lists.linux.dev>; Fri, 16 May 2025 07:48:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747381700; cv=none; b=TCdwQxIziJLBMvkn2oSf06n97XirnyUg8U5r1bnTw71qs8nEndgmnK5HhcXe5DTNzGTK6935jk+mvRQKz3Kn9AsKcqPr3zQNr6OlP1X0VbWBCT5Vd6CymrKKFRyDLn4Ka6+rI//hX5nxSbWBmgMBoJABWBgFwBxO5WnFiZAUAKI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747381700; c=relaxed/simple;
	bh=U5Zl4LDvys3YtAgsuE2Gn+blp85yAuTnjhMgtpjgcsQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=sHt+xk3gMH7HWg2vzDaWctZQckQ/INdi1frxfjV+dQg/QNkYSxh+Lm1Mkjp+mON4eDNzp5NWl9hmgab5C8Nu7LhKlbV492p0aNlCWT3FWPx8SsiHkR4dZOV7GrunzQtgiEHpY7JDgtxFlvffpkWiC0QrK9LwT2mIvwCEykVVQpQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FcSmfKFH; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FcSmfKFH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747381698; x=1778917698;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=U5Zl4LDvys3YtAgsuE2Gn+blp85yAuTnjhMgtpjgcsQ=;
  b=FcSmfKFHVAZP1lQTvgmTWXnRneMY39mu49NY+YjKTEnJizWi+yNafE+o
   mp0xRS1tALSkZ9u9r26BXBsDuv7Ffc0ECipOT06OOMDwtZkQUoP2wvqiB
   Sf4VZnbrf7ZVTJhjYJO/c8swTu5UhKqeDBRnijnkUqJoGc+y1PjWlL1BX
   MjhIOXhdOYFgzEnoLqQF028+xIJff1bwDl27A9+sqV0gLbgA/h3zqOUev
   DV2l1z3RSfo45GRHIE2VLfdUT3TqFyj2hU8NV+8nb89gaNZJuGk4oirPX
   kidFnr3W2aySLK/+y2OLicC1SsPDSziT/tVNdyE5HHhuXV9SWOl2QFy0L
   Q==;
X-CSE-ConnectionGUID: SS4oQ8RoQYupW+6AHHpi+A==
X-CSE-MsgGUID: zQAdYOKlQlqQ0CGINfAY8A==
X-IronPort-AV: E=McAfee;i="6700,10204,11434"; a="71850035"
X-IronPort-AV: E=Sophos;i="6.15,293,1739865600"; 
   d="scan'208";a="71850035"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 May 2025 00:48:16 -0700
X-CSE-ConnectionGUID: 2bhQDSyqQrSJoK5dcqVShA==
X-CSE-MsgGUID: 64s1dvXGQOenaUNbr+jpNQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,293,1739865600"; 
   d="scan'208";a="139009020"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 16 May 2025 00:48:15 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uFpng-000J6l-3B;
	Fri, 16 May 2025 07:48:12 +0000
Date: Fri, 16 May 2025 15:48:06 +0800
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:devel-5.10 5/5] mm/memory.c:3334: warning:
 Excess function parameter 'start' description in 'unmap_mapping_zeropages'
Message-ID: <202505161550.HtndL907-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Kaihao,

FYI, the error/warning still remains.

tree:   https://gitee.com/anolis/intel-cloud-kernel.git devel-5.10
head:   bfc84bc1ba93833ad3fd1e370a33e511711611a6
commit: 09797fd32d329b879a57e99f74d83d5704511ea4 [5/5] anolis: mm: add switch for file zero page
config: x86_64-allnoconfig (https://download.01.org/0day-ci/archive/20250516/202505161550.HtndL907-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250516/202505161550.HtndL907-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505161550.HtndL907-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> mm/memory.c:3334: warning: Excess function parameter 'start' description in 'unmap_mapping_zeropages'
>> mm/memory.c:3334: warning: Excess function parameter 'nr' description in 'unmap_mapping_zeropages'


vim +3334 mm/memory.c

  3323	
  3324	/**
  3325	 * unmap_mapping_zeropages() - Unmap zeropages from processes.
  3326	 * @mapping: The address space containing pages to be unmapped.
  3327	 * @start: Index of first page to be unmapped.
  3328	 * @nr: Number of pages to be unmapped.  0 to unmap to end of file.
  3329	 *
  3330	 * Unmap the zero pages in this address space from any userspace process which
  3331	 * has them mmaped.
  3332	 */
  3333	void unmap_mapping_zeropages(struct address_space *mapping)
> 3334	{
  3335		struct zap_details details = { };
  3336	
  3337		details.check_mapping = mapping;
  3338		details.first_index = 0;
  3339		details.last_index = ULONG_MAX;
  3340		details.flags = ZAP_ZEROPAGE;
  3341	
  3342		i_mmap_lock_write(mapping);
  3343		if (unlikely(!RB_EMPTY_ROOT(&mapping->i_mmap.rb_root)))
  3344			unmap_mapping_range_tree(&mapping->i_mmap, &details);
  3345		i_mmap_unlock_write(mapping);
  3346	}
  3347	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
