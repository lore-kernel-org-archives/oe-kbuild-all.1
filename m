Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0690528FA
	for <oe-kbuild-all@lists.linux.dev>; Mon, 16 Sep 2024 05:01:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726462918; cv=none; b=XpSB9+ce6JQYgC8K1mVHxzG/SFZOjmaKFgVP6veZ38wGZjXnYJuLj8tUTN/ATUUnr7jTXYFoY9ebvCIY5Dg0xVPEp7flkRkuh+hahA3V2P7STLAgBi1Ly+4Liy1b7J5pQ3A3P/gYD+7W3/evq0YSTxZlMRKYmWgG6SOyQJfRBOc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726462918; c=relaxed/simple;
	bh=ckNie9EHovC8XyGiaMAd7nO/vrcGYq5dRX5Ek72+rRU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=PeGSCX3zkC5Dst6IKpiOaTU99bykYXpowW4q8pN+IaeIbG9G09venwkKpu7TmyBIAQ6vafaijt0wbdkwmRY8hRHBiG4h8XmQdblPwTBOARo1RRoIlJCsU4qoJYeYfFTzOxIF47tkeIl3yY9O/HgI2BpJpeeRW8KjPnciY4uUcV4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GOX49+uW; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GOX49+uW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726462916; x=1757998916;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ckNie9EHovC8XyGiaMAd7nO/vrcGYq5dRX5Ek72+rRU=;
  b=GOX49+uWDbqY7zL8V15K3p5s/uIosytflyl7pJ2r0P31q07hMXr3umeN
   6kDSKRcG9LrM6wy1f+hxaph9RqQJfhlAuaqkCBep/XwdT7fpzLhMt1nol
   X4fN7wg8cs/nplNPvpLVxgQMXk5uzLsBqHsT9Id2TtMBvWDFjNQY75EQi
   Bnn4PvnojeF1c7dYpH6Pf0Ux167D5aeoyYPlvlRCBHOk2oqOxuJd0CsSt
   1/3VVkadK6nXiiYfVyrIEvKCaYLTWiE5fyCU3aa98juorHdJtq8j2aCD7
   OxToBso6HpDydQdg4bAmKXJHBZMSrhSBmVoPbzT9oOjxpeuZ6lTfmOZ0s
   g==;
X-CSE-ConnectionGUID: lipTFZ8HSpKiRZFACIxHwA==
X-CSE-MsgGUID: ewKWVVx/S+mZYiMQ7cNAmQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11196"; a="25155861"
X-IronPort-AV: E=Sophos;i="6.10,232,1719903600"; 
   d="scan'208";a="25155861"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Sep 2024 22:01:56 -0700
X-CSE-ConnectionGUID: RMEMWsAqTxufJKpJRqUDZg==
X-CSE-MsgGUID: TE4LOofjRwyffQWmjIeOmg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,232,1719903600"; 
   d="scan'208";a="72860125"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 15 Sep 2024 22:01:52 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sq3ry-0009PE-1C;
	Mon, 16 Sep 2024 05:01:50 +0000
Date: Mon, 16 Sep 2024 13:01:07 +0800
From: kernel test robot <lkp@intel.com>
To: kaixuxia@tencent.com, frankjpliu@tencent.com, kasong@tencent.com,
	sagazchen@tencent.com, kernelxing@tencent.com,
	aurelianliu@tencent.com, deshengwu@tencent.com,
	flyingpeng@tencent.com, jason.zeng@intel.com, wu.zheng@intel.com,
	yingbao.jia@intel.com, pei.p.jia@intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [opencloudos:next 5503/10952] error: couldn't read
 tools/sched_ext/scx_rusty/src/bpf/.output/rusty.skel.rs: No such file or
 directory (os error 2)
Message-ID: <202409161229.4CaKQU8v-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Dan,

FYI, the error/warning still remains.

tree:   https://gitee.com/OpenCloudOS/OpenCloudOS-Kernel.git next
head:   df2c80fc64e69be0095e3315c470353b01ce0c31
commit: 6bacfda06c7bc4a51d082ec01f02384789695a40 [5503/10952] rue/scx/sched_ext: Add scx_rusty, a rust userspace hybrid scheduler
config: x86_64-rhel-8.3-rust (https://download.01.org/0day-ci/archive/20240916/202409161229.4CaKQU8v-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240916/202409161229.4CaKQU8v-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409161229.4CaKQU8v-lkp@intel.com/

All errors (new ones prefixed by >>):

   Warning: can't set `imports_granularity = Item`, unstable features are only available in nightly channel.
   Warning: can't set `group_imports = StdExternalCrate`, unstable features are only available in nightly channel.
   Warning: can't set `version = Two`, unstable features are only available in nightly channel.
>> error: couldn't read tools/sched_ext/scx_rusty/src/bpf/.output/rusty.skel.rs: No such file or directory (os error 2)
   --> tools/sched_ext/scx_rusty/src/main.rs:6:1
   |
   6 | mod rusty;
   | ^^^^^^^^^^

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
