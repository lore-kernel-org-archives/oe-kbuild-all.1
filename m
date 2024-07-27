Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 609DE1836FE
	for <oe-kbuild-all@lists.linux.dev>; Sat, 27 Jul 2024 16:05:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722096334; cv=none; b=cWIsLTPms3wL1PEYAu4n7rdCKHtdbifOBw87O3epDFKXiGDVcY+gzNEU0xGM5YnolyZQKLUszm5JUiVJZ5EIkWZhWzBE5PpqifIsCmB5dnVuHGfcjDopiY+EnmaLFR7XA/BIMqZS30NlCCYI+MpIiDravQjmIn5ja1JVHJbK6KM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722096334; c=relaxed/simple;
	bh=3fLUbJjG5RC80bYSYk8E+rlnp7Y1cmlJDfW4+7F1tHA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=aCaK81WoZbkO12czIPu5c2InZXlye8SsdAsWXU1g6ub7ESChyCvRO4WdhGyru6nrabioOhv8NQuBoQENHtANH71C8A1LddtNxdbmpadCvGml7Zk4G76pdIjRNVb6GkR0PJ/b0CD18lwdY9EtyNUA7b4UZwLsA108/NQxUh8bXJs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MGmA/TcD; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MGmA/TcD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1722096332; x=1753632332;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=3fLUbJjG5RC80bYSYk8E+rlnp7Y1cmlJDfW4+7F1tHA=;
  b=MGmA/TcDg/688B07IMjfdbkKN5eiRzx0wBk1O5ODa19D55e+oGVKEnal
   Vrzyg+HT6qGxsoIjJ5JL7gEkgOFvlFwN/0vBuGoDDImTJLtTcz7+8sTyY
   WsFc405vUg9/4vGcWn7JMP0+X9YQSI54t1SnyCs653PkFmAssEhAGYR0K
   2KTkdomXQdiiUmAt0wG/lNcCSOw2v6YwiBNMbYb2smqLYd11p4vH9wA3c
   D2eqW6ias6LPSNgzlEUwF6ZPjUGRVZqo+3wfDyoY68PlF6YWxYjIoL3dk
   /IPKYwMO8oJpI/tY6Z6oe6+Oj0BsrDpGAvtSW0QkoN+qZoVBVUoTZ/kzJ
   Q==;
X-CSE-ConnectionGUID: GH985/eMQB6dCgEIVuFQgA==
X-CSE-MsgGUID: /KAuLiPcQWCxm7AqHgRdzQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11146"; a="31282846"
X-IronPort-AV: E=Sophos;i="6.09,241,1716274800"; 
   d="scan'208";a="31282846"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jul 2024 09:05:30 -0700
X-CSE-ConnectionGUID: /Xj6ma71Q/iu+rfaS+g7eQ==
X-CSE-MsgGUID: md5YjI9iTM6dYPkBcCGAQQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,241,1716274800"; 
   d="scan'208";a="58125136"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 27 Jul 2024 09:05:30 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sXjvD-000q2W-21;
	Sat, 27 Jul 2024 16:05:27 +0000
Date: Sun, 28 Jul 2024 00:04:55 +0800
From: kernel test robot <lkp@intel.com>
To: David Woodhouse <dwmw@amazon.co.uk>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [dwmw2:vmclock 22/22] drivers/ptp/ptp_vmclock.c:470:1: error: stray
 '`' in program
Message-ID: <202407272308.HGmTkSDD-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.infradead.org/users/dwmw2/linux vmclock
head:   54c99ce14ab0f5db82ef9bdfbfcd4c2633c486a8
commit: 54c99ce14ab0f5db82ef9bdfbfcd4c2633c486a8 [22/22] ptp: Add vDSO-style vmclock support
config: x86_64-defconfig (https://download.01.org/0day-ci/archive/20240727/202407272308.HGmTkSDD-lkp@intel.com/config)
compiler: gcc-13 (Ubuntu 13.2.0-4ubuntu3) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240727/202407272308.HGmTkSDD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407272308.HGmTkSDD-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/ptp/ptp_vmclock.c: In function 'vmclock_probe_acpi':
>> drivers/ptp/ptp_vmclock.c:470:1: error: stray '`' in program
     470 | `       status = acpi_walk_resources(adev->handle, METHOD_NAME__CRS,
         | ^


vim +470 drivers/ptp/ptp_vmclock.c

   456	
   457	static int vmclock_probe_acpi(struct device *dev, struct vmclock_state *st)
   458	{
   459		struct acpi_device *adev = ACPI_COMPANION(dev);
   460		acpi_status status;
   461	
   462		/*
   463		 * This should never happen as this function is only called when
   464		 * has_acpi_companion(dev) is true, but the logic is sufficiently
   465		 * complex that Coverity can't see the tautology.
   466		 */
   467		if (!adev)
   468			return -ENODEV;
   469	
 > 470	`       status = acpi_walk_resources(adev->handle, METHOD_NAME__CRS,
   471					     vmclock_acpi_resources, st);
   472		if (ACPI_FAILURE(status) || resource_type(&st->res) != IORESOURCE_MEM) {
   473			dev_err(dev, "failed to get resources\n");
   474			return -ENODEV;
   475		}
   476	
   477		return 0;
   478	}
   479	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
