Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 809A152F85
	for <oe-kbuild-all@lists.linux.dev>; Fri, 15 Mar 2024 19:41:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710531692; cv=none; b=pxeOfaloCpDpDE5wPbOWAyzx2buN7Wbo5Xh9A2J2H83QsZ4bOomOL8euMcKa06TR+oeCnGxlPla5NH9f9PMSrxKR0KUa2I8CPgG4PYZsF4kntl+B8ro+bSN3LLd9PikoQxD4oZw0Svuq1+6rVpKzmjX0DVXIhgrL/hNfaTSBSJI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710531692; c=relaxed/simple;
	bh=bjfz3i0PCuYXGNHmgjRzy5qTkTv9UbhRTez6LeBXgbU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=r5NKaCUtfCXyhNLHonPGuo/Ei3UjqaeoUtZA8QVy3LrHsbi1+RVI5wLIK9h+/qGpLqxYRvydHwP8a4wYCrjtTIurP5FrKWw2gKcCsmvrNuLLNKtDT7E4jfIyEYmAtbqoBexCwWXueMuJkaiDWFLVQFTY1piJJE9FAj9py+ayPXQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AFY5n057; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AFY5n057"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1710531690; x=1742067690;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=bjfz3i0PCuYXGNHmgjRzy5qTkTv9UbhRTez6LeBXgbU=;
  b=AFY5n057KtKAiQVf3vUSB12M6TKoTG/CPyBgCKLcTfWih5ikP9RndwQ7
   drDNQ6cUzgC9R+J2QkrJHDXZ2ml+UgL6oPihUiDrffVym7JM9UTENrtJz
   iVJYzJy6YsML6SFVec3FD6ab0iJevUxFvLVQN/qy2RQtgStwOlOcUkpro
   TyE5ISZZyGECAotn0gSXLwMTuYuBbHAoVFQ48GzbyjVNqpCLNa9oNZIIa
   rgeK4CMqE47QxdDQV54Oj0ynO9LpVkJVznNmZzAoBdbZ0WS6Z0JX1Vpc1
   OWBYnh4vSWioDk8xeEXYiHwco041Qwrq9cMI8Rg/93F8ro6baN65x9mga
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11014"; a="5551376"
X-IronPort-AV: E=Sophos;i="6.07,129,1708416000"; 
   d="scan'208";a="5551376"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Mar 2024 12:41:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,129,1708416000"; 
   d="scan'208";a="13238021"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 15 Mar 2024 12:41:22 -0700
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rlDQd-000Ekt-1T;
	Fri, 15 Mar 2024 19:41:19 +0000
Date: Sat, 16 Mar 2024 03:40:41 +0800
From: kernel test robot <lkp@intel.com>
To: jasperwang@tencent.com, kaixuxia@tencent.com, frankjpliu@tencent.com,
	kasong@tencent.com, sagazchen@tencent.com, kernelxing@tencent.com,
	aurelianliu@tencent.com, jason.zeng@intel.com, wu.zheng@intel.com,
	yingbao.jia@intel.com, pei.p.jia@intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [opencloudos:next 4553/4562] ld:
 drivers/crypto/zhaoxin-aes.o:(.discard+0x0): multiple definition of
 `__pcpu_unique_paes_last_cword';
 drivers/crypto/padlock-aes.o:(.discard+0x0): first defined here
Message-ID: <202403160314.9KiGOavJ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/OpenCloudOS/OpenCloudOS-Kernel.git next
head:   7fd7e231b2cffd5368835287bbced3767eb96241
commit: 5f755256c8daa280c3d0626e166942a9e85f532f [4553/4562] crypto: Add support for Zhaoxin AES algorithm
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20240316/202403160314.9KiGOavJ-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240316/202403160314.9KiGOavJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403160314.9KiGOavJ-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld: drivers/crypto/zhaoxin-aes.o:(.discard+0x0): multiple definition of `__pcpu_unique_paes_last_cword'; drivers/crypto/padlock-aes.o:(.discard+0x0): first defined here

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
