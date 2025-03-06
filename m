Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 224AD27453
	for <oe-kbuild-all@lists.linux.dev>; Thu,  6 Mar 2025 02:52:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741229560; cv=none; b=M/lOA9l9fKd+Ilwr1slH8qAgkQF/E9tLxHyNAEM2FjBrHoL52LUbUNY0rBwHr4dysL0kPEJ8tixhvnt7618qdblfPm9eYxTnH2VaGq+QNlaAELbmACD6BVvvIGxBtBABgoJB1pboMkb3XeCkdZwQLh+AijC6vZLW5BGPa6lsYNs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741229560; c=relaxed/simple;
	bh=UooqDtKPjIKQnOP+2etdgfkkJznjb0LxL5uDz3KKo/w=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=kD3Rxs1ysqnXgGqlS+x0fUPrLNS+bnyBFCY5BpiprCnP+rIBvCt2bkAOggkKM/Dv/kz0Sj0ysUHrlNAvogVjytiO+IIsQMeISfU0TX7LWN7QMFwUkppYe+TpN+wCQvi32uq9oWz7VTQfDbP5/iFK428mKQ1EV4wXIcQyw41Cmmk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ersSgSui; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ersSgSui"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741229559; x=1772765559;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=UooqDtKPjIKQnOP+2etdgfkkJznjb0LxL5uDz3KKo/w=;
  b=ersSgSui0sQroEFSVNGp/H8r2CJjhoc+cupWha+XUlTOxefzzs9BRIbA
   cjyn9TjXhBQHLt3/4anWbNINzO9f6t6tBIC7nhW9B4yM2TVjkQC6y1VCg
   5TIqve2bxi/hVETyu9/eU0rHY9FQENFMnNeCF4Lb8mF5lvZIEHThX2PUQ
   nP1vqRSkc+bn6+D+zjlPQ2r10jI8PxDRkLpbqWehnh/tiwWutKV695ZUW
   5TB79MusTkllEBxv9aK+ZBBQuWw25+IcrxpUCd+9QM0bGPlfXeRYU3JEw
   wpRB5MRPSX9JTl19j677JR66rJymjemNr2mSlW84Fi0e/kn1fH4c86WkH
   g==;
X-CSE-ConnectionGUID: mo4Fka+ZRVaKd9FFFm8mkg==
X-CSE-MsgGUID: bW32vquXRBmpC5yjyaslsQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11363"; a="59634672"
X-IronPort-AV: E=Sophos;i="6.14,224,1736841600"; 
   d="scan'208";a="59634672"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Mar 2025 18:52:34 -0800
X-CSE-ConnectionGUID: 1M1Rlc3eTq6eq2swA1ACoQ==
X-CSE-MsgGUID: OL1korkFSc+b9dqBZOm+EA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="118789684"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by orviesa010.jf.intel.com with ESMTP; 05 Mar 2025 18:52:33 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tq1LZ-000MRy-2s;
	Thu, 06 Mar 2025 02:52:29 +0000
Date: Thu, 6 Mar 2025 10:51:38 +0800
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:devel-5.10 1/1] drivers/iommu/ioasid.c:279:
 warning: Cannot understand  * @brief Reserve capacity from the system pool
Message-ID: <202503061023.RAfFTXb2-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/anolis/intel-cloud-kernel.git devel-5.10
head:   3c59fae63abb869e722a6b1d048bd4501e4bc5bf
commit: 7ee0f38cdf9a18c8f6fe075090a3f5105be117d1 [1/1] iommu/ioasid: Support setting system-wide capacity
config: x86_64-anolis-intel-cloud-devel-5.10 (https://download.01.org/0day-ci/archive/20250306/202503061023.RAfFTXb2-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250306/202503061023.RAfFTXb2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503061023.RAfFTXb2-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/iommu/ioasid.c:279: warning: Cannot understand  * @brief Reserve capacity from the system pool
    on line 279 - I thought it was a doc line
>> drivers/iommu/ioasid.c:306: warning: Cannot understand  * @brief Return capacity to the system pool
    on line 306 - I thought it was a doc line
   drivers/iommu/ioasid.c:458: warning: Function parameter or member 'ioasid' not described in 'ioasid_get'


vim +279 drivers/iommu/ioasid.c

   277	
   278	/**
 > 279	 * @brief Reserve capacity from the system pool
   280	 *
   281	 * @param nr_ioasid Number of IOASIDs requested to be reserved, 0 means
   282	 *	reserve all remaining IDs.
   283	 *
   284	 * @return the remaining capacity on success, or errno
   285	 */
   286	int ioasid_reserve_capacity(ioasid_t nr_ioasid)
   287	{
   288		int ret = 0;
   289	
   290		spin_lock(&ioasid_allocator_lock);
   291		if (nr_ioasid > ioasid_capacity_avail) {
   292			ret = -ENOSPC;
   293			goto done_unlock;
   294		}
   295		if (!nr_ioasid)
   296			nr_ioasid = ioasid_capacity_avail;
   297		ioasid_capacity_avail -= nr_ioasid;
   298		ret = nr_ioasid;
   299	done_unlock:
   300		spin_unlock(&ioasid_allocator_lock);
   301		return ret;
   302	}
   303	EXPORT_SYMBOL_GPL(ioasid_reserve_capacity);
   304	
   305	/**
 > 306	 * @brief Return capacity to the system pool
   307	 * 	We trust the caller not to return more than it has reserved, we could
   308	 * 	also track reservation if needed.
   309	 *
   310	 * @param nr_ioasid Number of IOASIDs requested to be returned
   311	 *
   312	 * @return the remaining capacity on success, or errno
   313	 */
   314	int ioasid_cancel_capacity(ioasid_t nr_ioasid)
   315	{
   316		int ret = 0;
   317	
   318		spin_lock(&ioasid_allocator_lock);
   319		if (nr_ioasid + ioasid_capacity_avail > ioasid_capacity) {
   320			ret = -EINVAL;
   321			goto done_unlock;
   322		}
   323		ioasid_capacity_avail += nr_ioasid;
   324		ret = ioasid_capacity_avail;
   325	done_unlock:
   326		spin_unlock(&ioasid_allocator_lock);
   327		return ret;
   328	}
   329	EXPORT_SYMBOL_GPL(ioasid_cancel_capacity);
   330	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
