Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E8153FF1
	for <oe-kbuild-all@lists.linux.dev>; Sun, 30 Nov 2025 00:48:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764463723; cv=none; b=QNtmttTF9nqEFPwlICnJ8/M2wpWIxavRp9sfFbSW6L5Aay0Mt0GUtEOrI/0EBa/MsFDyOp8ln4YU2GiybGiiFOSvCVYmIuYm26rqbl36CgsNLHDUpxbeYDRko5ibFk92RrsqbR2jLEcgOSiQ3Y1LJdJdM8obN5r5+6tUf8koe+M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764463723; c=relaxed/simple;
	bh=b9MJEMNER/RQYc5vZDUMgCilQoR0TBwuj1054jlF9Uo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=l4a9mK0yPw2bJICnsN56gYPKMftbBA4hWVF7bXKBL21zc4H15IbsvrgMg8aix99czLGgeRMElJUoR9c2WQ58vAh7TDzWICKYdsIMquwld4eCgbVpgml4daQneuvS5egLWcUB55uP7hqHXvdYmOce86pl1fAL8QYIKl+rAhdHRlY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PuCEbWxX; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PuCEbWxX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764463720; x=1795999720;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=b9MJEMNER/RQYc5vZDUMgCilQoR0TBwuj1054jlF9Uo=;
  b=PuCEbWxXOkzzMpRlqyaZlvh3O0Qnw+CEgYs2fiNf2l5CHjHad20WAFRM
   W/4rW+I63Rm1LpMP49olREXBa3u6uoQv0Tx0sb3xZ0rusvl0BE3wURSwv
   gIVJJ6phcH7bVa7Xx7tPNkuCUVfQ0jQfzRygFMar0MGxsWNm5hTkZGIIf
   LFVOVSJ7wziPwDtXQG2Z4y8G9gYsFXNdc9xjVSu7CjG4gIQny0FpK6yEp
   uRFyFjHhVPwrHRwIegvOpMagNc7zaw+9dKRCxDAtMtWBOZQ782Cki5puo
   kkR++nGhQWLhhdmPaCYgkaFXbhukfaYyiFyxZ5dx0/9HDYDDR6TfI2Qpf
   g==;
X-CSE-ConnectionGUID: mjRFV3fETFmOSM7iefKd6g==
X-CSE-MsgGUID: Xzh2nYcnRvC8yQ1bXNv8rw==
X-IronPort-AV: E=McAfee;i="6800,10657,11628"; a="66468315"
X-IronPort-AV: E=Sophos;i="6.20,237,1758610800"; 
   d="scan'208";a="66468315"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Nov 2025 16:48:40 -0800
X-CSE-ConnectionGUID: ry2S3vR0QoamlNzx0UhR/Q==
X-CSE-MsgGUID: wMVcf7GPRAKQ81AnbEV0Ag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,237,1758610800"; 
   d="scan'208";a="192862400"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 29 Nov 2025 16:48:39 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vPVcC-000000007h9-0mRE;
	Sun, 30 Nov 2025 00:48:36 +0000
Date: Sun, 30 Nov 2025 08:47:52 +0800
From: kernel test robot <lkp@intel.com>
To: Alice Ryhl <aliceryhl@google.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: error[E0560]: struct `bindings::file_operations` has no field named
 `compat_ioctl`
Message-ID: <202511300859.35d9m0hj-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   6bda50f4333fa61c07f04f790fdd4e2c9f4ca610
commit: f893691e742688ae21ad597c5bba13bef54706cd rust: miscdevice: add base miscdevice abstraction
date:   1 year, 2 months ago
config: arm64-randconfig-r073-20251130 (https://download.01.org/0day-ci/archive/20251130/202511300859.35d9m0hj-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project b3428bb966f1de8aa48375ffee0eba04ede133b7)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251130/202511300859.35d9m0hj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511300859.35d9m0hj-lkp@intel.com/

All errors (new ones prefixed by >>):

>> error[E0560]: struct `bindings::file_operations` has no field named `compat_ioctl`
   --> rust/kernel/miscdevice.rs:161:13
   |
   161 |             compat_ioctl: if T::HAS_COMPAT_IOCTL {
   |             ^^^^^^^^^^^^ `bindings::file_operations` does not have this field
   |
   = note: available fields are: `_address`

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
