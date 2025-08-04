Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 141372E36ED
	for <oe-kbuild-all@lists.linux.dev>; Mon,  4 Aug 2025 04:38:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754282336; cv=none; b=djwbcUwv+SSvCy6XBYf/T/QBkks0IF5fl1zY2dktoXoECz/ODPwrMGIhebQ9UU9Tin+u3WGPXig6xQHdaqwZfQj6cK9RW71iIhVFI/AazP5R2YvCEviZEEq+cPcbhRDEbs1i7Il1IxSLDs1AEnkmg1HRoLARtXBgiWftQIstRdA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754282336; c=relaxed/simple;
	bh=hCE5IQbnweLhVcMYMvxurSfpObQwz2XdDtzen7+OQ1c=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=mHa0DB2/UEzFfyqknaCO2Vfn3tHSpuODR50iPNkGhIzS+On2ydfUlJy7eN5RFC6CmZkVDScqYpRa1AFGna7GmGzygO6sPAm1gVMl4MNOdrxI09jSXgBf69XWU6NMU6Vn5TSp0B/qcOT2zZqS95kJleVfi50d1REL+IocgFmKcOI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=C5bwOF4T; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="C5bwOF4T"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754282335; x=1785818335;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=hCE5IQbnweLhVcMYMvxurSfpObQwz2XdDtzen7+OQ1c=;
  b=C5bwOF4T0tecL3rzdR56fn63cPhSNPJdyvXQRsn0fKwSwO59H9oK4Bxx
   HtDSNFOMniFAHnSizaeBeMhFRwvRlw1dhhRdCkya0Dc2f+ityf1xyXERk
   DcS8BC4u/tfTlDwc/n7VKG/Ij5Jf46WBd9Uh0TJRrGcH6jX+KRVSRo4jC
   VzYplhKozevmMAX2taZhaYblilxZQnRlQiN78cGaaFqSmPfEbitFbQhfk
   ObRRK+DHxuxqv4FvEd+GxdS3KbzP9vg1fMCk2Qbt5b+5M6HwHgFpi+nev
   DHm1+0BjznBr8FcmU6AH0yvEckF9W0fi7dSlnpKx99UpSbaLTEjKdIOb9
   w==;
X-CSE-ConnectionGUID: mtWqce7bSTm7ul/tvvTUAw==
X-CSE-MsgGUID: 7tSNlW22QuiXu3W37mrDow==
X-IronPort-AV: E=McAfee;i="6800,10657,11511"; a="67102018"
X-IronPort-AV: E=Sophos;i="6.17,258,1747724400"; 
   d="scan'208";a="67102018"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Aug 2025 21:38:54 -0700
X-CSE-ConnectionGUID: laSERmtYR3OY7tVKoGBNDw==
X-CSE-MsgGUID: n+NHaOD0Scmr6Xc9OU28hQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,258,1747724400"; 
   d="scan'208";a="164838966"
Received: from lkp-server01.sh.intel.com (HELO 160750d4a34c) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 03 Aug 2025 21:38:53 -0700
Received: from kbuild by 160750d4a34c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uimyJ-0006nc-0d;
	Mon, 04 Aug 2025 04:38:51 +0000
Date: Mon, 4 Aug 2025 12:38:48 +0800
From: kernel test robot <lkp@intel.com>
To: Janne Grunau <j@jannau.net>
Cc: oe-kbuild-all@lists.linux.dev, Hector Martin <marcan@marcan.st>
Subject: [asahilinux:bits/090-spi-hid 16/19] Warning:
 drivers/hid/spi-hid/spi-hid-apple-core.c:156 struct member 'id' not
 described in 'spihid_msg_hdr'
Message-ID: <202508041200.KWfVxm1H-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Janne,

First bad commit (maybe != root cause):

tree:   https://github.com/AsahiLinux/linux bits/090-spi-hid
head:   17ba359286a86638c4d3a3b5bb2ba3a19db1d898
commit: 345bbf0bb62dbb237dce855e37d4924bdcf393ff [16/19] WIP: HID: transport: spi: add Apple SPI transport
config: sh-allmodconfig (https://download.01.org/0day-ci/archive/20250804/202508041200.KWfVxm1H-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250804/202508041200.KWfVxm1H-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508041200.KWfVxm1H-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: drivers/hid/spi-hid/spi-hid-apple-core.c:156 struct member 'id' not described in 'spihid_msg_hdr'
>> Warning: drivers/hid/spi-hid/spi-hid-apple-core.c:156 Excess struct member 'msgid' description in 'spihid_msg_hdr'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
