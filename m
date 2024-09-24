Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDA5941C6E
	for <oe-kbuild-all@lists.linux.dev>; Tue, 24 Sep 2024 06:21:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727158869; cv=none; b=HAHKG3DPQbqwJyGyoV7wH8BcCP4fyDYOlWlteCuAMGsWI7FzSv0vmJ3RSjuAw0IKIm/CB1mYTPnKEGXd7bLd2tqMo0GFYcPCQ858DcZBUulTAgtzYHF5Ypby2g+K58v4aUcJWXwedmVkLWDrFHYaRYEow+GAGCYpl9mUgCfB1/c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727158869; c=relaxed/simple;
	bh=KpBU+VPjDJ6U5TwCtnxjGn5eo+a61fBnCw7mfQl88VU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=LACz3aSko7umnkfW2FvlmiuiVTYDSK1ycJl/9V6vAOpfpIQp6x4CwdZDGGcbYeW1M821SsevUMNuSAE6NnJQHqHPWSAMemAFTsbQY6DpPwJ/++bTmU1kuzjjpeovtY0SZ7OZca1b4/gxq83XsmzwVgcqL9Grr93WYdpES1JKWTA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VFn/LSDM; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VFn/LSDM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727158867; x=1758694867;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=KpBU+VPjDJ6U5TwCtnxjGn5eo+a61fBnCw7mfQl88VU=;
  b=VFn/LSDMEUmvNzFHs6jhzUQFKE4f4RgNfRYSmnCgcEA1YcCka66V4IlC
   1F6fig3fm9lLpAH/a7q2lAIcst64dWhjXdmGr6AXxFZ9YNBf6noY1mzdV
   9IfpYpego9CtmuES/bLD5WzSqI5FR5ajYrJgKDH2/pfmlw1G2/gZG8SYP
   7TrZzgd383L2MEMv+MzC9wDS9k69VddwPB/nNC1O+PWWbPl1ZA+ODXoxO
   yOXyz8XR86tdHlWq9HVeCOdlbM1kfs88K93U2Ve5tawbe70qRZzl8DmWn
   JihY920diIgAZi+TFCP6nGWH9WT19naV6D+Nwe/z1XtwQzml+vuOvtrAQ
   w==;
X-CSE-ConnectionGUID: kbPr/jbxQka3ssvP9ueCzg==
X-CSE-MsgGUID: xIJqRn+2Re2MFcbKN/koGA==
X-IronPort-AV: E=McAfee;i="6700,10204,11204"; a="48666014"
X-IronPort-AV: E=Sophos;i="6.10,253,1719903600"; 
   d="scan'208";a="48666014"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2024 23:21:07 -0700
X-CSE-ConnectionGUID: x9VbajZRQ3+ZxFm8vLjN1A==
X-CSE-MsgGUID: u97N0qPLRmqICizaEfvuHw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,253,1719903600"; 
   d="scan'208";a="76233209"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 23 Sep 2024 23:21:03 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ssyuy-000I0L-1U;
	Tue, 24 Sep 2024 06:21:00 +0000
Date: Tue, 24 Sep 2024 14:20:50 +0800
From: kernel test robot <lkp@intel.com>
To: kaixuxia@tencent.com, frankjpliu@tencent.com, kasong@tencent.com,
	sagazchen@tencent.com, kernelxing@tencent.com,
	aurelianliu@tencent.com, deshengwu@tencent.com,
	flyingpeng@tencent.com, jason.zeng@intel.com, wu.zheng@intel.com,
	yingbao.jia@intel.com, pei.p.jia@intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [opencloudos:linux-5.4/lts/5.4.119-20.0009.spr 1432/2441]
 drivers/iommu/ioasid.c:279: warning: Cannot understand  * @brief Reserve
 capacity from the system pool
Message-ID: <202409241446.lsCjCiWq-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/OpenCloudOS/OpenCloudOS-Kernel.git linux-5.4/lts/5.4.119-20.0009.spr
head:   63759dec7a1be60e43e98e4257de936b546e4656
commit: a440e5d3877a2eca9e48abbbec799292de4b849b [1432/2441] iommu/ioasid: Support setting system-wide capacity
config: x86_64-defconfig (https://download.01.org/0day-ci/archive/20240924/202409241446.lsCjCiWq-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240924/202409241446.lsCjCiWq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409241446.lsCjCiWq-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/iommu/ioasid.c:279: warning: Cannot understand  * @brief Reserve capacity from the system pool
    on line 279 - I thought it was a doc line
>> drivers/iommu/ioasid.c:306: warning: Cannot understand  * @brief Return capacity to the system pool
    on line 306 - I thought it was a doc line


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
