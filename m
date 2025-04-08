Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 950F21C84AD
	for <oe-kbuild-all@lists.linux.dev>; Tue,  8 Apr 2025 05:20:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744089633; cv=none; b=mHjVVAq7sVm2vaVog9CBujKnLuaaFjq73toUxbfTvc0h0jTLRB2+W4xIRAcwBTEcml2WYTYW1MGB0OAycJ8R5Htfp7Z8T6381Tw1LuQ8W+oGZX9ApzmqHHlDn1Ef2lFz4/2vlOs1Qeq+TKvaVJY0CR2TpJjzDxWr0w57ZAWLxI8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744089633; c=relaxed/simple;
	bh=fneD9PlFjfo7wngQWWCxfmo9VeI8t0CCa+ODHT6XNHg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=UpWg6VaD283Rw62v4Svc41lVpDmjN9DWL4HCaSdH3m+ul/VBOQe29i6t9KTO0naVIElgX8PXjsi6dpPGraz/TfykJH4dQjG/J01h2VdBy3xvgi9HfjNKlzKhV3gPhCwNNJZ/IhLgQOVONk/cRFSHkOqP5kcgYwpECzATZP1YaYE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FekTJ9Wg; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FekTJ9Wg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744089631; x=1775625631;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=fneD9PlFjfo7wngQWWCxfmo9VeI8t0CCa+ODHT6XNHg=;
  b=FekTJ9Wg/LNAoEYpVOsIPVq61/5KR2T5PEqop3uApZdtYVx1KN9cveSq
   c13Xk1n0+vxyqVll71HLZDtAEngK/DBgvFLhCxHGr6bDWjMnGGWac6RQ2
   Xu+1JERBWFnxIWRsjvrPu6gYTy2XtWBqMvvRFFRRsXsa8QYVdBpc8U3la
   ZUPtG012VRiZp9zwF6n3yV9+6gIQt7VskVosneRtf8egbRCDO6wKATC2I
   8D04OerPkhvleggnSI1YkOtqKvOA/HtCtJ+dd8RoBzEmMkYCx9DaHuCJ9
   d2fXxKesrtGiL44zOX2RbV1NmFW/5P/Z2IcJWYcHLlW2OP2T1MkRnLzOi
   A==;
X-CSE-ConnectionGUID: VCb9+C6iQSaf3rIGZ/E41Q==
X-CSE-MsgGUID: IPwczMQySDiNFS05sZ0vPA==
X-IronPort-AV: E=McAfee;i="6700,10204,11397"; a="45390082"
X-IronPort-AV: E=Sophos;i="6.15,197,1739865600"; 
   d="scan'208";a="45390082"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2025 22:20:31 -0700
X-CSE-ConnectionGUID: Q5d05hk4SJan5k+M6fldtQ==
X-CSE-MsgGUID: k/sjrDh+QCCgipyOgSYLmg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,197,1739865600"; 
   d="scan'208";a="151343971"
Received: from lkp-server01.sh.intel.com (HELO b207828170a5) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 07 Apr 2025 22:20:30 -0700
Received: from kbuild by b207828170a5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u21Ns-00048b-0g;
	Tue, 08 Apr 2025 05:20:28 +0000
Date: Tue, 8 Apr 2025 13:19:42 +0800
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:devel-5.10 9/9] mm/memory.c:3334: warning:
 Excess function parameter 'start' description in 'unmap_mapping_zeropages'
Message-ID: <202504081336.JPTxlaDM-lkp@intel.com>
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
head:   c55bd07f747cd457f58e5781279fa11a5fc0add1
commit: 09797fd32d329b879a57e99f74d83d5704511ea4 [9/9] anolis: mm: add switch for file zero page
config: x86_64-allnoconfig (https://download.01.org/0day-ci/archive/20250408/202504081336.JPTxlaDM-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250408/202504081336.JPTxlaDM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504081336.JPTxlaDM-lkp@intel.com/

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
