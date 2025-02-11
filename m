Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92F481F55FB
	for <oe-kbuild-all@lists.linux.dev>; Tue, 11 Feb 2025 10:41:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739270516; cv=none; b=Q29ObQ/sndbFjuwtTKRf2peGWevmtlD+w1OCQ+tnarD0c5hVXby22ckRpQ3r+VNjJU+xF+5M/49OICbKOezrb4rgLtuHx1KM8/wqJP6CfP+bi3/+ajAiGClEjmjrC0pmPQgLsWB1+i1DjWx+OOjl8UiZdHrxemGoObZxNtJV+Wk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739270516; c=relaxed/simple;
	bh=7s1fU+veOrMbK2tmRwtLwCEtP6i2NCIMaCVX+omg7+Y=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=m5IzcvX7PjYkebnJl3HiWwk252KexdCCdXiZYGzgk4IoHQhRx0L64+o6PMPRCZ4GW8eCLE3t46p28/lRu3yA4aRFOhnQHm7Sn0S0kftOjRFppOAwbUgNw84DoqTK1HeFbsylXPvU+KvX7JNelc3WFserauETPoPod8Yx4aBX7dk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=I0cqMmqA; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="I0cqMmqA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739270515; x=1770806515;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=7s1fU+veOrMbK2tmRwtLwCEtP6i2NCIMaCVX+omg7+Y=;
  b=I0cqMmqATEh32iWJwqZb+EFpIg1hEPAmM+P+uQ6oC8isQTSlWFDwPRh0
   hv3UYOYmg/F0osYEUgsUBxXcxv0XhLUQZidxjmKl1dnwPRj+xUfKLdilD
   V9umvMDjScNEBwiLsEMD2o8Eo21HiVx1rUUQcbD+JOnG7B38LxnUcHpYX
   4qs8bBlXjgHir9gNI1rq4JTV0Y6obcFMB3G4Si5pIuDKUAkh3u0gYOd5l
   Evz87N94F9HOlpuE4PdlnysG47J8lVP3TSFdzK96ypJQTScRmvMmj2v0Y
   RiZ1aOv9hVyLkUtl1eq7H4nhLvXhLnvmcXTGaage1KrvN4E/Ru3WA2nAx
   w==;
X-CSE-ConnectionGUID: vp4Y6E2fSgeufozLK1Vcbg==
X-CSE-MsgGUID: rTkKnIATQRqwNa8Tqpc7jw==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="40001307"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; 
   d="scan'208";a="40001307"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Feb 2025 02:41:54 -0800
X-CSE-ConnectionGUID: mgXBLGz/SL6bp0pIQRIvKg==
X-CSE-MsgGUID: J8xoZdDESuK6cAna9CxuwQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="117091077"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 11 Feb 2025 02:41:53 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1thniA-00142Z-2s;
	Tue, 11 Feb 2025 10:41:50 +0000
Date: Tue, 11 Feb 2025 18:41:02 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1423/1423] net/netfilter/nft_tunnel.o:
 warning: objtool: missing symbol for section .init.text
Message-ID: <202502111842.FBwS9pbo-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Pablo,

FYI, the error/warning still remains.

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   6a6cc2b6b95dc80ae01221670e21a8059229a023
commit: af308b94a2a4a5a27bec9028354c4df444a7c8ba [1423/1423] netfilter: nf_tables: add tunnel support
config: x86_64-buildonly-randconfig-001-20250211 (https://download.01.org/0day-ci/archive/20250211/202502111842.FBwS9pbo-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250211/202502111842.FBwS9pbo-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502111842.FBwS9pbo-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> net/netfilter/nft_tunnel.o: warning: objtool: missing symbol for section .init.text

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
