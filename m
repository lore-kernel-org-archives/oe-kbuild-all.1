Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6F8F1547D2
	for <oe-kbuild-all@lists.linux.dev>; Sat, 22 Feb 2025 20:58:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740257916; cv=none; b=afgBkrCA1OiIzFR49sb70GCEZjU+pnOvo/zVvDcV2sRIKY7Da9VOMXqYftFrBG3oezLY7ZK6V3N42rLY08URWcsClr1ee5C5WwOQCFFBdBXtQRru2/bv/3U8aA4alDBX1CBr7eHvacXXEZMlvttViUhnaxeVkXT18VK7TGFW7T0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740257916; c=relaxed/simple;
	bh=W+2lnJkBtxeJQQU8xhMFvIDm36UDp4rECT3c01KazyE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=g41NiBOnXHUcZ8NiVhiDz0HlBzUYFiUFqQvbYcoeDmJq1BxbER/CAskO5M+p4WH+xf62l0Ziw3RfCX0tVCC/zRlnqIGsEKqZEXeEG69yS+/Jm8fuCf/a/B3TZBGjCv43XqtAGasq9eZSPd2CwubH6lq9VkzYMeC7XVilYR9brwc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LnZttp1c; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LnZttp1c"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740257914; x=1771793914;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=W+2lnJkBtxeJQQU8xhMFvIDm36UDp4rECT3c01KazyE=;
  b=LnZttp1cVw13TPbp+tb6JDNOyws8mZSf/+619qNu63PZ33YAiw09Awh9
   uQgnUMGwP0wqY/4M/tlYsglBQVVnxKedUT+zJfdiakaiv2CHELPvnBn23
   p2FFv37rm6rhuMvngt4aBH0K9Twr998CBVqun1otQHhkXPc/WJkdVwOsH
   ugSNeNm6A+T1bb9vD0JCxSgpi+JcHP+bnLXiYGTkDGL96jRd40Uv22qhT
   DdzswXt7xWqqn4xINYk+2v6Y0uJj1xHf8OgU8cY4s/HAjsHmOSC2H4qnv
   A9Ex4GjFeXzk1y8EN4X7Dizb1y1iMD/p6zZejVz788TXCCF31hbs1Go10
   w==;
X-CSE-ConnectionGUID: 6Kx/WGqrRB2JOGU2I6DRcA==
X-CSE-MsgGUID: cn0GgO0BS/CZ7zwT/Yfhsg==
X-IronPort-AV: E=McAfee;i="6700,10204,11353"; a="58603774"
X-IronPort-AV: E=Sophos;i="6.13,308,1732608000"; 
   d="scan'208";a="58603774"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Feb 2025 12:58:33 -0800
X-CSE-ConnectionGUID: yxzYcQS7TXCQHU+g5JAtAg==
X-CSE-MsgGUID: ItvCviF6TAazcK1A1gS9ow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="120924392"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by orviesa005.jf.intel.com with ESMTP; 22 Feb 2025 12:58:31 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tlwZx-0006uN-28;
	Sat, 22 Feb 2025 20:58:29 +0000
Date: Sun, 23 Feb 2025 04:57:45 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android11-kiwi-5.4 422/422] ERROR: "sha_transform"
 [crypto/sha1_generic.ko] undefined!
Message-ID: <202502230407.WVqIqH2b-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Jason,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android11-kiwi-5.4
head:   e7df0e6776f0469d11ef3e42afbf2f5c16ea5530
commit: c2f0a89cd1d5a00c5bf48060987cf53ada93d4b0 [422/422] random: use BLAKE2s instead of SHA1 in extraction
config: x86_64-buildonly-randconfig-004-20250222 (https://download.01.org/0day-ci/archive/20250223/202502230407.WVqIqH2b-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250223/202502230407.WVqIqH2b-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502230407.WVqIqH2b-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ERROR: "sha_transform" [crypto/sha1_generic.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
