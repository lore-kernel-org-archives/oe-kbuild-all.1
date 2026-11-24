Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.16
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795549087;
	b=zF1eKD0ihTXfl1wdSCoLqAksA8pbFCCPj6R5scfT6h/DjWxyAxIHuvF0gUQG0btyPY9I
	 oEb8wWDuq6DqMv9WcaDB9/T1UMqCI4PmbsTFlVLmYtkrnmvCfBTVHo3ilUu2L9ZJNXt1o
	 86tB7icJtZLijbd2U2QB0mXOpJAcISdgalobnnaBzJlO3uKoy/t2QolfveFd7ICwI67EV
	 9PLtjQLygvw9MlAQBU3k6RSD35pN1h8NUO6gImoO1iYdR6KiINUkh8m6KJlRRzMtHGIFc
	 0Fu2/WwScs7EVmN4UyqjIJOUzi/3oYMckzuUKD9noa3tNqi3R61MFAt7rtkP2/x246g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795549087;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=7w2aDAAV/9FtBjws8Kq68VWJW7RYLhY7cO3zDPAXeVE=;
	b=LMPrNvgNLoLju00cBWwWwQ1xRsnAEIDrAb8NwAkiQcF0BkmwLOnmczMYdav7KduqB++A
	 JJl3oKvNQQkdXnNkN8tZsUVNOmTFP1dpcS9MDPBpnHmE7vBVH/givF3o1KqfoAfvNZ7t1
	 uF0jmHwpq+vkojN8VtrN103B4DzceSQfIgETGybsiu2zJ/mf2e1Lvo9aBA6BfhHLzo0/y
	 LnCxrBSTwv7j01n4ZV+z1Chni9JFfOq4BoN8eVHQ5eOStRC31VMVY92fMTGW51bMHfENI
	 w+YD6ah+ApA4zd52Xfj9s5VWl0wTgFMY6/0kR0s5n44qmmVlviPzPaLA+VF+i8CC8Gw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=jvTb3++2;
	arc=none smtp.remote-ip=198.175.65.16
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3814A606A323
	for <oe-kbuild-all@lists.linux.dev>; Tue, 24 Nov 2026 19:38:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3814A606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=jvTb3++2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795549086; x=1827085086;
  h=date:from:to:cc:subject:message-id;
  bh=hXRhqvkmnQhh0eUoJJQenrUXe3UiC7tS4uixMawqSE0=;
  b=jvTb3++2YdSYk2/QrgsvxbpsnCz+PdMHdhPso7OL9vyn6LxWEQIZTzkl
   wQhuUbgJc1wOr8Iz8+h27hVF090IXm42zadVQcGNiq1tQV0D/CIgnKLz9
   7Twzm9Qxg5/ez0jXPDw74khzRvfXgNilFPcRGRFMHkOEgYnAWr2NPFojR
   v/6nr1BDCPv6a2OmgKuyWYZgP2zimjZefQ/Ngwmq/31opWKnXJChAanFq
   X51kxK/fw5NefT6XcWc08FeMfXNWX5pf6yx1pOeLg4LQbnDWZJh3ZsDGF
   P/lrmxJ8rB3To5/eR1ATvkwg7UTCUV9vDq8TXiadjSyEiiYBHE4l65F03
   A==;
X-CSE-ConnectionGUID: LzCXfc7RRIy0mWgkTwkPtw==
X-CSE-MsgGUID: G+YZ3J6pQFWcvMz4gNloDw==
X-IronPort-AV: E=McAfee;i="6800,10657,11976"; a="4337581"
X-IronPort-AV: E=Sophos;i="6.27,231,1787036400"; 
   d="scan'208";a="4337581"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Nov 2026 11:38:06 -0800
X-CSE-ConnectionGUID: POxJbFrLR4CZIAlIAzlDBA==
X-CSE-MsgGUID: 9R00VVb+ThW24xEK9X/Eng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,231,1787036400"; 
   d="scan'208";a="12107286"
Received: from igk-lkp-server01.igk.intel.com (HELO 1073a420ae3a) ([10.211.93.152])
  by fmviesa001.fm.intel.com with ESMTP; 24 Nov 2026 11:38:05 -0800
Received: from kbuild by 1073a420ae3a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xVwL4-000000005Fx-0NVy;
	Tue, 24 Nov 2026 19:38:02 +0000
Date: Tue, 24 Nov 2026 20:37:34 +0100
From: kernel test robot <lkp@intel.com>
To: Christian Brauner <brauner@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: WARNING: modpost: vmlinux: section mismatch in reference:
 run_init_process+0x30 (section: .text.unlikely) -> initcall_level_names
 (section: .init.data)
Message-ID: <20261124203048.gGV9q1RN-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

Hi Christian,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   8d7fe9885c62fc9a95bf55d9db244d9672a8aadc
commit: 9a8e296958884b807a02759975170b6559901242 fs: make userspace_init_fs a dynamically-initialized pointer
date:   5 months ago
config: xtensa-randconfig-r2311-20261124 (https://download.01.org/0day-ci/archive/20261124/20261124203048.gGV9q1RN-lkp@intel.com/config)
compiler: xtensa-linux-gcc (GCC) 9.5.0
sparse: v0.6.5-rc1-21-g84ec0658
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261124/20261124203048.gGV9q1RN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 9a8e29695888 ("fs: make userspace_init_fs a dynamically-initialized pointer")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/20261124203048.gGV9q1RN-lkp@intel.com/

All warnings (new ones prefixed by >>, old ones prefixed by <<):

>> WARNING: modpost: vmlinux: section mismatch in reference: run_init_process+0x30 (section: .text.unlikely) -> initcall_level_names (section: .init.data)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
