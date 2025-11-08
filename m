Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F40F12236F7
	for <oe-kbuild-all@lists.linux.dev>; Sat,  8 Nov 2025 18:46:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762627597; cv=none; b=gnvBFesXTeUstS3x3MB6lUF/SgQyKifTQ5BTr+9dMp9W6f7v5y2Go0Sk8Lgr1v8YxXUCUWbjuXyJ+eymkoJTdLjzXXREDEoUO6Pprc1nfPno7DC55Xr8DdzsbFH9KYI4nsecOOk0acdlqbYJG+4d1OVmnNYBeNfswwAprB9bw1w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762627597; c=relaxed/simple;
	bh=FTcczrOArMqB8uBLGQ02kupc2qggOy3aeFqcnK4/bR8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=JiW0+T++NcA5WBzvx4BFZHfthtuqiao4ekMqXp06nKnzzLTQqIP596WEcrq+7qj1P3wFIvvCZuWohDKgMVXsFauvDVfE9j2QhySAJ8UrC2s69PHUBXZh+71nSqPP436yKqH5P4Ru55ga0on/rEbJVKxdkqpLwMkUt5ZqD1HjsNs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Upif+RkD; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Upif+RkD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762627595; x=1794163595;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=FTcczrOArMqB8uBLGQ02kupc2qggOy3aeFqcnK4/bR8=;
  b=Upif+RkDBP4ZEZeisZEZwqYOqeFOg6RY6AKGQwOTyVIvmW/UH4op4S51
   vy5CLEEe7xOaXhYwzVuXkGyBqJO1DFr5+NPhBGDhrm0iFC6OUmKn1tXUc
   u0PATYbIf59gZCMGNkxm2FnDVvuxUXGSzM5Lyuyo4tg/uVpKG6v2oGCHA
   MK6v/sRRAe8xehEyxANfIjMi4qWoVO1mdiinJf93HHBlxnSI9jYc+Eli4
   QwHEe0kMClaMnMbncek0HA6V42o6HZqRlwHbQsB+7PuxMwDsz7tKh3GyI
   cpS5j7yVBtKE3vosrkHn+RZru1bNqNZxQb7ql90Otv7kfm5HC1ZYEi2fg
   A==;
X-CSE-ConnectionGUID: jK5JMI+TTu2OF9VRMSldlw==
X-CSE-MsgGUID: MRS4jxQfQueN2FtMvqSccA==
X-IronPort-AV: E=McAfee;i="6800,10657,11607"; a="75853812"
X-IronPort-AV: E=Sophos;i="6.19,290,1754982000"; 
   d="scan'208";a="75853812"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Nov 2025 10:46:34 -0800
X-CSE-ConnectionGUID: qcY9zttxQOyfrRjlsHsZjQ==
X-CSE-MsgGUID: MKIaoJFwQuivBO5V5edcGg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,290,1754982000"; 
   d="scan'208";a="219054269"
Received: from lkp-server01.sh.intel.com (HELO 6ef82f2de774) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 08 Nov 2025 10:46:33 -0800
Received: from kbuild by 6ef82f2de774 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vHnxG-0001LE-34;
	Sat, 08 Nov 2025 18:46:30 +0000
Date: Sun, 9 Nov 2025 02:46:10 +0800
From: kernel test robot <lkp@intel.com>
To: Dan Williams <dan.j.williams@intel.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Jonathan Cameron <jonathan.cameron@huawei.com>,
	Alexey Kardashevskiy <aik@amd.com>,
	Xu Yilun <yilun.xu@linux.intel.com>
Subject: [linux-next:master 5478/7207] tsm.o:undefined reference to
 `find_tsm_dev'
Message-ID: <202511090229.1XCrmJTr-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   9c0826a5d9aa4d52206dd89976858457a2a8a7ed
commit: 3225f52cde56f46789a4972d3c54df8a4d75f022 [5478/7207] PCI/TSM: Establish Secure Sessions and Link Encryption
config: microblaze-randconfig-r062-20251108 (https://download.01.org/0day-ci/archive/20251109/202511090229.1XCrmJTr-lkp@intel.com/config)
compiler: microblaze-linux-gcc (GCC) 9.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251109/202511090229.1XCrmJTr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511090229.1XCrmJTr-lkp@intel.com/

All errors (new ones prefixed by >>):

   microblaze-linux-ld: drivers/pci/tsm.o: in function `connect_store':
>> tsm.o:(.text+0x984): undefined reference to `find_tsm_dev'

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for TSM
   Depends on [n]: VIRT_DRIVERS [=n]
   Selected by [y]:
   - PCI_TSM [=y] && PCI [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
