Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FA7913CFA6
	for <oe-kbuild-all@lists.linux.dev>; Thu,  6 Mar 2025 14:59:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741273144; cv=none; b=ZLW/rrZMF4eY01PLoK2z3CjmGg4jbANNHnt93HteDp749WcBrioOCwNqOo2si9xUPyDzm55oSKqeKgGE4dXRkwptp/jvtNa9L+KyewW+MRlWbJLv5ebKSqY0mAxY72AeX7+UiRKrnDYs2475zb5TdbdCp0HoAFuaArg4yO4ZSqI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741273144; c=relaxed/simple;
	bh=eMCkshhe56U4wfg3U41c9QKmNCNp2GAre8XNQr3XSRQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ef920F3sDc4fYutNjOw4j9g2irfst5ARQQMhlEcCYvtyfDWm6i3LK6VxizLc1jfpTUPX/aTLRO6fE18k3X+ObfLZggnjfrLEhvBlsK6i1H3SNSsK9ecVSLtPgt4H242bO+OYzIeeV8duL6grqHiRfiNySvShxDBrybG1XWgVOlM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BIhtdLsZ; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BIhtdLsZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741273142; x=1772809142;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=eMCkshhe56U4wfg3U41c9QKmNCNp2GAre8XNQr3XSRQ=;
  b=BIhtdLsZk97LsrePD93d80Q4eeeR8fGVA5cHCXEkzcGMKCy5I24pwyWU
   09M85T6YyBbXjfobvDe74EiPf278+gSK37mheoaDBlftgS1e+bOmycEdZ
   kQVIit4zipSTdP2An6tDjUswgWa1vtV/dZAsgUYSShFLfv3RFqUuRZAcJ
   WSYPIUx5uOpUTrgawwE31wp6bd3KZdbWlUDbvtgH7gLB0cc8o1yQzHujB
   qtFLmQY4GOYIrhGAJtOroaZUwlnAy4a/MZf5car6BF+OYnzpaFUo+64/g
   9LiJDv359CFgJtstUInvcazfDwH0mXt6KcWdOSMJSU19eLIIXJ5/R6B/0
   g==;
X-CSE-ConnectionGUID: YVFrR5gaTRaes2V/dF3nSA==
X-CSE-MsgGUID: 7hpdb9eCSfyAvXRKiHM/7Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11365"; a="59832287"
X-IronPort-AV: E=Sophos;i="6.14,226,1736841600"; 
   d="scan'208";a="59832287"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Mar 2025 06:59:02 -0800
X-CSE-ConnectionGUID: mSZ0xvmwSFmTRfk5W4eCBQ==
X-CSE-MsgGUID: 3LZdtYB3QLeCRR2UZmEMoA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,226,1736841600"; 
   d="scan'208";a="119053451"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by fmviesa007.fm.intel.com with ESMTP; 06 Mar 2025 06:59:00 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tqCgc-000NBk-2Z;
	Thu, 06 Mar 2025 14:58:58 +0000
Date: Thu, 6 Mar 2025 22:58:16 +0800
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:devel-5.10 1/1] drivers/iommu/ioasid.c:527:
 warning: Cannot understand  * @brief Free an ioasid_set if empty. Restore
 pending notification list.
Message-ID: <202503062241.096BOuSV-lkp@intel.com>
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
commit: 32ba18e34ef885b61c3ce41ece3205b8c30689d1 [1/1] iommu/ioasid: Redefine IOASID set and allocation APIs
config: x86_64-anolis-intel-cloud-devel-5.10 (https://download.01.org/0day-ci/archive/20250306/202503062241.096BOuSV-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250306/202503062241.096BOuSV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503062241.096BOuSV-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/iommu/ioasid.c:280: warning: Cannot understand  * @brief Reserve capacity from the system pool
    on line 280 - I thought it was a doc line
   drivers/iommu/ioasid.c:307: warning: Cannot understand  * @brief Return capacity to the system pool
    on line 307 - I thought it was a doc line
>> drivers/iommu/ioasid.c:527: warning: Cannot understand  * @brief Free an ioasid_set if empty. Restore pending notification list.
    on line 527 - I thought it was a doc line


vim +527 drivers/iommu/ioasid.c

   525	
   526	/**
 > 527	 * @brief Free an ioasid_set if empty. Restore pending notification list.
   528	 *
   529	 * @param set to be freed
   530	 * @return
   531	 */
   532	int ioasid_set_free(struct ioasid_set *set)
   533	{
   534		int ret = 0;
   535	
   536		spin_lock(&ioasid_allocator_lock);
   537		ret = ioasid_set_free_locked(set);
   538		spin_unlock(&ioasid_allocator_lock);
   539		return ret;
   540	}
   541	EXPORT_SYMBOL_GPL(ioasid_set_free);
   542	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
