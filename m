Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 845F92D057
	for <oe-kbuild-all@lists.linux.dev>; Mon,  2 Sep 2024 06:28:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725258530; cv=none; b=TDfBvO21aNiGO2iq9TAfB5lWI9oj+1vWDzP2XmBO4NuFrNnUezmQOz8X1d0dqAuSuf/kO4ZVbf1JtWYvfy1o2wc4/igI5w711rEngtHuIGTCULaEn3S8R0DLNDkcC1le2ZIL6MKpccqkbsBSBUpmPYT1OIEIAMeKcxc97StHl04=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725258530; c=relaxed/simple;
	bh=23geomWdItva6KhSjiWjvSNMlu/n4OKyDvMrb27a+CA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Q2tj51dKsUwx8emuoHw4CuRYocqcO67IzEIFr28ndDRfWA+oJcta2GYzACPTdCF3BR5JOQPoiqw/fVKpStVkCT+cRyJX0zKTSaQugbex3tb7tUQFyzxYFgsEbxQR7yFSHHdY4M6AtQ+NHAXMfi7+VeszDaJ2BSjq2IfhqaXmfz4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EdX3gg8+; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EdX3gg8+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725258527; x=1756794527;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=23geomWdItva6KhSjiWjvSNMlu/n4OKyDvMrb27a+CA=;
  b=EdX3gg8+h6sD0bZQaEDzv61Q24nsvdZautCqm6XUAlXRubwLjML94tCa
   OwBON3TQkkAps+PW6pR/o/etFHSMlZHraYDAX45X9MWRRaSnAdxTPinyd
   tO6rVaYXNhhdx9WHGammguUkxgt/YlG45z6XkpstgA+AyTF1i4DNrQ+wu
   o6oOnYXtawogTt8OBxkXJ2XUpnuLUV0BiaR1X1OsW9h0CIamQxccTLiQc
   nSS9NpDiqfd3D1MGySe0jK+I9gCpsXuMDBEuH+CF0UoHxmfNSn6mopY2Q
   f930yqYEsyyLu2kGv85MVIk1YMG9QeB/X3/F7Q4QLesXYSJ4muHKYBYem
   Q==;
X-CSE-ConnectionGUID: OAfxdIjBQAyI/WtPqkSeeA==
X-CSE-MsgGUID: rhYxUsY1QZe6tx/kWWo3pA==
X-IronPort-AV: E=McAfee;i="6700,10204,11182"; a="23632082"
X-IronPort-AV: E=Sophos;i="6.10,195,1719903600"; 
   d="scan'208";a="23632082"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Sep 2024 23:28:44 -0700
X-CSE-ConnectionGUID: ZrGYhzocTeKzfEBMKMWgJA==
X-CSE-MsgGUID: OM9z88GdRpKSQBXwmtEaCQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,195,1719903600"; 
   d="scan'208";a="69305450"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 01 Sep 2024 23:28:43 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sl0YK-0005Be-0G;
	Mon, 02 Sep 2024 06:28:40 +0000
Date: Mon, 2 Sep 2024 14:28:21 +0800
From: kernel test robot <lkp@intel.com>
To: Jens Wiklander <jens.wiklander@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Tomas Winkler <tomas.winkler@intel.com>,
	Alexander Usyskin <alexander.usyskin@intel.com>,
	Linus Walleij <linus.walleij@linaro.org>
Subject: [linux-next:master 5982/8126] ld.lld: error: undefined symbol:
 rpmb_dev_register
Message-ID: <202409021448.RSvcBPzt-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   985bf40edf4343dcb04c33f58b40b4a85c1776d4
commit: 7852028a35f03e04c9cdc92fd26894cca4a8a4de [5982/8126] mmc: block: register RPMB partition with the RPMB subsystem
config: x86_64-randconfig-101-20240902 (https://download.01.org/0day-ci/archive/20240902/202409021448.RSvcBPzt-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240902/202409021448.RSvcBPzt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409021448.RSvcBPzt-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: rpmb_dev_register
   >>> referenced by block.c:3229 (drivers/mmc/core/block.c:3229)
   >>>               vmlinux.o:(mmc_blk_probe)
--
>> ld.lld: error: undefined symbol: rpmb_dev_unregister
   >>> referenced by block.c:2748 (drivers/mmc/core/block.c:2748)
   >>>               vmlinux.o:(mmc_blk_rpmb_device_release)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
