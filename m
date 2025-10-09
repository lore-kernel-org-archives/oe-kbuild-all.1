Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22D7DB663
	for <oe-kbuild-all@lists.linux.dev>; Thu,  9 Oct 2025 15:02:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760022171; cv=none; b=CAjUVPJfJWJ4Lwic5F3DlaT6N3Tv5VGsMSwGnCtU4FXfYJssZ2J3gZkEeUJgEpJRDxhTMLq/S8A/FKGSVeH0+yIsa5dNJZV8vvLabhJxtndDRZk4hL+ED6U6Erl07+VKRW8QWBHz4JeVsKGctRKbJpggoReKsslxvCt5ZAtBXNo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760022171; c=relaxed/simple;
	bh=Vvd+uQ15TZQZRp2x7CkfO8IjS19BxwdIMaoJgQIfurU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=BvEwDtQ3P+R0WZGFPm20d2GLb++7+YFlGETMk3Eg4srGPUgfJAblnDy6z5zIwO7lRwkT51gFikgXMX8IiXgJ6wgASNA/gVaHFETXOBWsanEkQ7Kv+KuIvemvsUlKfMnWwmwkmnWUL81RZ/lgWovkSFcgRZm6F01N+FmgJWF1Y94=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FCPnofQO; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FCPnofQO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760022169; x=1791558169;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Vvd+uQ15TZQZRp2x7CkfO8IjS19BxwdIMaoJgQIfurU=;
  b=FCPnofQO6nZzZ5zyTDcEV39Ova8wUctqacxI8mXxzyXpeHHCbIMr1MNO
   XrGsu9Xpx2wjd3b7CtEdO/Meh5mGoer4nv6GLDE+PXx9carNOtCVsab3w
   JOnZCDJjxk5igEYPbY9/4qcIx6He6g6g+JkZpQMVdiNx33geIBviZRUrc
   3yOZPk6iHEauo4BD/6Db/hjFh5G/0f2a4OcQLGTsy2TGWprN2/u1yTmj6
   50j5llFMSdEf4IT73HruGZ/CkpPLHtp/KX3UYTg0UBijO6O6q9bumL3yd
   7WY5YKSh+lAvdZW670NQ8m7DGPIdHIEGB6MeQuJ/reUp9qL+mBGhaqQom
   A==;
X-CSE-ConnectionGUID: EwbZJNlxTOGw/rq2tK5KsQ==
X-CSE-MsgGUID: S23QvKlHTfqpse1vh9+Pxw==
X-IronPort-AV: E=McAfee;i="6800,10657,11577"; a="64855785"
X-IronPort-AV: E=Sophos;i="6.19,216,1754982000"; 
   d="scan'208";a="64855785"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2025 08:02:45 -0700
X-CSE-ConnectionGUID: JUGFxcG4SoirrWk9/oc5rw==
X-CSE-MsgGUID: s/yQW75WTE+wLStkX0ktsg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,216,1754982000"; 
   d="scan'208";a="204440396"
Received: from lkp-server01.sh.intel.com (HELO 6a630e8620ab) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 09 Oct 2025 08:02:44 -0700
Received: from kbuild by 6a630e8620ab with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v6sAD-0000s3-3B;
	Thu, 09 Oct 2025 15:02:41 +0000
Date: Thu, 9 Oct 2025 23:01:50 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Yang Yingliang <yangyingliang@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1343/1343] fs/ext4/mballoc.o: warning:
 objtool: ext4_mb_complex_scan_group()+0x11a4: unreachable instruction
Message-ID: <202510092235.vuhTySNB-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Theodore,

First bad commit (maybe != root cause):

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   b0534aa9eeb9c05e780430c051477b8eb5768330
commit: 41298197ead9e85ee2ec1d52122f03fd1863cff2 [1343/1343] ext4: convert BUG_ON's to WARN_ON's in mballoc.c
config: x86_64-randconfig-101-20241223 (https://download.01.org/0day-ci/archive/20251009/202510092235.vuhTySNB-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251009/202510092235.vuhTySNB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510092235.vuhTySNB-lkp@intel.com/

All warnings (new ones prefixed by >>):

   fs/ext4/mballoc.c:4734: warning: Function parameter or member 'bh' not described in 'ext4_free_blocks'
>> fs/ext4/mballoc.o: warning: objtool: ext4_mb_complex_scan_group()+0x11a4: unreachable instruction

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
