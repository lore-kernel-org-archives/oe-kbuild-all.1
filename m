Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 122ED437130
	for <oe-kbuild-all@lists.linux.dev>; Thu, 17 Sep 2026 08:42:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.6
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789634578; cv=none; b=bzT1++crTT7CeZVNv/ISVrG0Y5UfXLcq6wXBgBCJymdokqJBYxClKpfEuk62zKxgMHx0XaMe2/W7pzIT+kiTpiBzKxCvF0En5M+vJolkGTIna0sCTv3ZfMCOvxhtHt7gqe85pJFjGvx13ESBKg+8ubOYHTpHhW1ItONMmrPuCEw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789634578; c=relaxed/simple;
	bh=F3/Q2GYqx2KmXgutDept/ZWiHNURaiC52ZmCn/X8H1c=;
	h=Date:From:To:Cc:Subject:Message-ID; b=RYvtOWUBDCJLx6ebzNlVT5ynsYt726aSVdzAtOGT5R2uslciq1AzlXWtQPV2LCZ3O/KHkEOSDCjhw2XYqJ2JQaUMvWbcOKCp1NGesy080GMQAaQ+NQqymkOL48AK9tnxxwYjoMNWCbQxSD6v37ENGH+FgXpbbiXNtP2iyDJwb7c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QVjkimCg; arc=none smtp.client-ip=192.198.163.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QVjkimCg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789634564; x=1821170564;
  h=date:from:to:cc:subject:message-id;
  bh=F3/Q2GYqx2KmXgutDept/ZWiHNURaiC52ZmCn/X8H1c=;
  b=QVjkimCg8EhtoWXk/A+k7rYBJd2UweYbtTJmWmUsSkq9V+TlYC4FnoJl
   V+zBM76l1TLtOtRv+m9zSk84rf45uCJ5GXhcz+/coG716Z4nGHZ4zswp7
   AKwyD35eZsbsTyxJZlfg75rwAosrUSi77u6ndFzkCsr78cL8bKYwEp3PN
   gX1+sX1WJJkxGFav8eR5DlEZarRDjukAVSf8eVLQH3ejHyoobvnZUeSc7
   h+Q1Cwglyou36M0F0kpEpePOp5FuII6i/5KlP5u5QjUrTKBtwi+LwzF/T
   qO3/jIcdbb/h8ABC9qK/dJJ3easCmUVkpH9r5jHnqGUjRT3pX3AyDmkO0
   w==;
X-CSE-ConnectionGUID: +7LZsvXJRrOjCSkyxqraxQ==
X-CSE-MsgGUID: lNJnRmtnS5imYQ8zy8RvEQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="542999"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="542999"
Received: from fmviesa012.fm.intel.com ([10.60.135.152])
  by fmvoesa116.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Sep 2026 01:42:39 -0700
X-CSE-ConnectionGUID: cfX21zjETVibbUj7PW8Jhw==
X-CSE-MsgGUID: Bgjvy3rdST25A4CTydwneg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="1874272"
Received: from lkp-server01.sh.intel.com (HELO 462990a40a85) ([10.239.97.150])
  by fmviesa012.fm.intel.com with ESMTP; 17 Sep 2026 01:42:37 -0700
Received: from kbuild by 462990a40a85 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x77hT-000000007Pf-1IGe;
	Thu, 17 Sep 2026 08:42:35 +0000
Date: Thu, 17 Sep 2026 16:41:46 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android17-6.18-2026-06 3/3] Warning:
 drivers/ufs/core/ufshcd.c:2811 function parameter 'iid' not described in
 'ufshcd_prepare_utp_scsi_cmd_upiu'
Message-ID: <202609171631.vMfqQPFH-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Konstantin,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android17-6.18-2026-06
head:   96f1f21b29368b67d4c59c32f87a20e2b965f76e
commit: 28c108aa56a37d8dbc634378b7bc828bb3465f88 [3/3] ANDROID: scsi: ufs: Add UFSHCD_ANDROID_QUIRK_SET_IID_TO_ONE
config: x86_64-randconfig-1013-20260916 (https://download.01.org/0day-ci/archive/20260917/202609171631.vMfqQPFH-lkp@intel.com/config)
compiler: clang version 22.1.3 (https://github.com/llvm/llvm-project e9846648fd6183ee6d8cbdb4502213fcf902a211)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260917/202609171631.vMfqQPFH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609171631.vMfqQPFH-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: drivers/ufs/core/ufshcd.c:2811 function parameter 'iid' not described in 'ufshcd_prepare_utp_scsi_cmd_upiu'
>> Warning: drivers/ufs/core/ufshcd.c:2843 function parameter 'iid' not described in 'ufshcd_prepare_utp_query_req_upiu'

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
