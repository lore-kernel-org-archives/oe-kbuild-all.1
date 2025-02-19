Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 954181DED73
	for <oe-kbuild-all@lists.linux.dev>; Wed, 19 Feb 2025 21:17:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739999834; cv=none; b=awC8esPueOEk2EfrdIb5IvUQ+j4WrSeSWenYB6xjT/aR8vehEgmZhqPb6BxW5D0XO8wOGjvyZ4Vy65bitUlW0dq5NR1iLtSEilO2/D8Gc5hYOEALDH3FHY8gUZbk0q+Zv/PWcD4iv5z4qwtTHhkAVjkOEQck2kkPAPHJ7HobSBw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739999834; c=relaxed/simple;
	bh=EW1uVIXy6lFl4PYUSkHEJOUeH7Z60dRgrjBJEBzjLUE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=oiAIPxXa9mBJp/08uDdfoRLJFtMuzZ63I5ygFQ5CIMLhEnvSO1FaA4mjSkTqXAirlKqy0LhtJmUWua3jPmbK6SWAtnbSUAkuqt4KA+MzORJ+nB/i1Y5e0EUYZhwz2U5otIT8PpYJbKDWdyJ1M7o8sfVVOgqXN7nz/Sza5HmJ2MY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bjXxfKNX; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bjXxfKNX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739999832; x=1771535832;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=EW1uVIXy6lFl4PYUSkHEJOUeH7Z60dRgrjBJEBzjLUE=;
  b=bjXxfKNXADS8Kc87EG3pP3vaGG3w8d651xfec+RKcJVSJfImVbblroHG
   RhTDGO2JDvhBLJYScPF6Qs4Fu8WD3owfhN3MlEyfdN9UjF6mc/Y7d8C9o
   40xTvQD1eo4qAKED4gTFGM0QPnJ63OXueoMAimcgOrJFXxL339baHQHYI
   53Sfki/v9W27CaT5w/mMfT1ia9r+g8gzFyq7VO4hrExQXI7LZhrN5Badu
   fSEkFVR191ki/UCIhb8Y65piGACwHenY8rVnHe72GxIrOrk+/1YmRYEbu
   3W0UjCyD3+pleMgQfYpLSoJYs52iUpssamoXhA4OmJj/YieEH8iV+yIUC
   g==;
X-CSE-ConnectionGUID: Yz9gMt0YQlSj+YADYTjxmw==
X-CSE-MsgGUID: uOZhZiggQ6S4obrT/lr5xg==
X-IronPort-AV: E=McAfee;i="6700,10204,11350"; a="41016704"
X-IronPort-AV: E=Sophos;i="6.13,299,1732608000"; 
   d="scan'208";a="41016704"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Feb 2025 13:17:11 -0800
X-CSE-ConnectionGUID: yQR5z4QST5qQg34HuuoYgg==
X-CSE-MsgGUID: 4kOgC2CgTJSL4zFoCu4LEw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,299,1732608000"; 
   d="scan'208";a="114777452"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by orviesa006.jf.intel.com with ESMTP; 19 Feb 2025 13:17:08 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tkrRJ-0003UH-1T;
	Wed, 19 Feb 2025 21:17:05 +0000
Date: Thu, 20 Feb 2025 05:16:22 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Yang Yingliang <yangyingliang@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1425/1425]
 net/can/j1939/.tmp_address-claim.o: warning: objtool: missing symbol for
 section .text
Message-ID: <202502200504.7mJvGz8E-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi The,

FYI, the error/warning still remains.

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   c9c0a907584f518c3979020529d23b6ab7bcb47f
commit: e0c2ee9edcacfdda0e806166eaec1310cdf9e324 [1425/1425] can: add support of SAE J1939 protocol
config: x86_64-buildonly-randconfig-005-20250218 (https://download.01.org/0day-ci/archive/20250220/202502200504.7mJvGz8E-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250220/202502200504.7mJvGz8E-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502200504.7mJvGz8E-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> net/can/j1939/.tmp_address-claim.o: warning: objtool: missing symbol for section .text

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
