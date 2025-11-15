Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 172FB75809
	for <oe-kbuild-all@lists.linux.dev>; Sat, 15 Nov 2025 21:40:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763242858; cv=none; b=pKIt5OVaY9rMjpUGjiRFcAJRHZkeBGd6HCTcLLY61VDbZ42otiI8vbj88+jYzgYYBeiJoDzycLtlBwZqjD4tPmB1c3P66alU7UmtPaqdfJZ2p41hrmhQE4bX0DWQnZTuGrQW65tKpJAtSu4ifBANXuk7J3WKAzBGj3zxiooHdpM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763242858; c=relaxed/simple;
	bh=/CZfLW/9f15QY+zRXDaZr78ZiwmEpjLMcD5QO0STg4k=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=sai28ha/jEGDGfaQbwIC6iifsyBv5wcaFx9xollWQLAEUuFWSVDGOZlQo6A3H6VS5QVuy6yl1QbA3n34LLHTAPBhDUoDPEda8X08hZhuOlYPRVE2BJ0zUm1n4uY9awtJ1Wbc1b7GOBO/hp80NI/lwUEluQPaNAFTaXtqr5ahTQY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SuoWDcLZ; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SuoWDcLZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763242856; x=1794778856;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/CZfLW/9f15QY+zRXDaZr78ZiwmEpjLMcD5QO0STg4k=;
  b=SuoWDcLZlixn0p04v2cVWfsohzjuHxXfQgvv7v5JLTSi3mD7JMD+aDjJ
   wi+zfrvl3ZwGFCAQa3NbzmvKDrLz8z3Yo7WzbEKNzdvjpaAlMLw44iyLc
   mdhCARE1P0zpMkhCasj7gOg0VJ9OhPgBgJezVcO5zwG/0yvlUvn7uSFdI
   PJecb1Va12uTDDjnHOUWbFN8sxIG/0TEiO37tmxMjhBz89jOUX8pCwCMW
   vgkR51lH3Gfw81AQrNkW8ut2BajIpyzrutv7W4TF0fxxJLoPGDHzWqBeO
   pShlbc7ehSPOvaxDLN3KkTAEzGZZL5kRDRJGzoXztSN5ts922+btfNWHe
   g==;
X-CSE-ConnectionGUID: OWMGS6oES/meB65ZhEbozQ==
X-CSE-MsgGUID: W5ION2XrS8qTEvQ4bTSrFQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11614"; a="65451439"
X-IronPort-AV: E=Sophos;i="6.19,308,1754982000"; 
   d="scan'208";a="65451439"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Nov 2025 13:40:55 -0800
X-CSE-ConnectionGUID: UYReY6RrS52NOR+VTjERUA==
X-CSE-MsgGUID: YqJKYU4NSLeYszRlIfzq6g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,308,1754982000"; 
   d="scan'208";a="189355637"
Received: from lkp-server01.sh.intel.com (HELO 7b01c990427b) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 15 Nov 2025 13:40:55 -0800
Received: from kbuild by 7b01c990427b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vKO0q-0008HB-1F;
	Sat, 15 Nov 2025 21:40:52 +0000
Date: Sun, 16 Nov 2025 05:39:57 +0800
From: kernel test robot <lkp@intel.com>
To: Christoph Hellwig <hch@lst.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [hch-misc:inode-time-nowait.2 14/14] ERROR: modpost:
 "mark_inode_dirty_time" [fs/xfs/xfs.ko] undefined!
Message-ID: <202511160550.h7lXLH9s-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.infradead.org/users/hch/misc.git inode-time-nowait.2
head:   284c3f77293c64c13b07c0eb6469ac95ca520060
commit: 284c3f77293c64c13b07c0eb6469ac95ca520060 [14/14] xfs: enable non-blocking timestamp updates
config: sparc-randconfig-002-20251116 (https://download.01.org/0day-ci/archive/20251116/202511160550.h7lXLH9s-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251116/202511160550.h7lXLH9s-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511160550.h7lXLH9s-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "mark_inode_dirty_time" [fs/xfs/xfs.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
