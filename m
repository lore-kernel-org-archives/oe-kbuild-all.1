Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2DFC1E8332
	for <oe-kbuild-all@lists.linux.dev>; Mon, 25 Aug 2025 03:26:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756092393; cv=none; b=ufuS+LWerazhjD5m9Mc+65GqJ0y9P7SIn7Ao4t8680BBnVkXl7M9yGk+N+wi0ZvijQManwPfFAmoMZzrr6uR3t4HhcUKXnKiDHlYVii53doxwj7hQvf/Llzu0eNytWouGnupORxW2e8g9/BSGUfG4PMMlyg4yZQJj7ljE23NqdY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756092393; c=relaxed/simple;
	bh=bpdT/HbRR6p7L9CW2eMpEPcFw+hM+YBqAT1ecxR9quU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=RPI7PkCNkSOJrfkTQ00UDL+hzuhTR+Sdk6wWig7bydYM/DnIwg8Cgt7F4S4kYckje2HpPMX3uD8Fx0e84r3aqMzsSC8H2mg5RGl+6sPFRED2qMIm9m5HvoXIwJ4uU6LG2PtBMRFUHQgVJvaCGUl6GMmWOYvGTFmZqwil9YFgYoY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hHP6MbVA; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hHP6MbVA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756092391; x=1787628391;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=bpdT/HbRR6p7L9CW2eMpEPcFw+hM+YBqAT1ecxR9quU=;
  b=hHP6MbVAFcL4E5IERiwAooHieh4GGbFu/6WaG936E6GEc/u2eLBigAat
   N6S+EShLmc5wYVcGwQVTXpo5BYmBqWSGCM3U/MkleQYpYwtWVGgxcR+vO
   0BX/igDNNInY+KB1gW67nxTFqVUKxPWI3cCHHW8rE1FaTJAh1EOVx6joL
   Z0RCALcSBlrJI5tKwrFSmOpWloHsvxijfF9jz38eZ8I5esZvc0EThXxJJ
   F+YArErPFONFaWuPAvcz71X8xuRzQd9VDUX2z8tIuBnUWYvOH/ACjHJyl
   L5C2JSWXJhNmGj/iilzPCBs+1e7Y8MPNoSnAbxVVvH69OeSJ6pjkMmO2x
   A==;
X-CSE-ConnectionGUID: oLnmQSb8TtSdB3IK+JlfQA==
X-CSE-MsgGUID: ruQ1zdRwToi/ZVcN32obZw==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="62126871"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="62126871"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Aug 2025 20:26:30 -0700
X-CSE-ConnectionGUID: vmdfJy86SlCEUot8BLowzA==
X-CSE-MsgGUID: 4qIgiw9dSu+mLLzG0KKFaQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="200123826"
Received: from igk-lkp-server01.igk.intel.com (HELO ca260db0ef79) ([10.91.175.65])
  by orviesa002.jf.intel.com with ESMTP; 24 Aug 2025 20:26:30 -0700
Received: from kbuild by ca260db0ef79 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uqNql-0002GZ-08;
	Mon, 25 Aug 2025 03:26:27 +0000
Date: Mon, 25 Aug 2025 05:25:47 +0200
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android12-kiwi-5.10 161/161] mm/swapfile.c:102:26:
 warning: no previous prototype for function 'swap_type_to_swap_info'
Message-ID: <202508250526.PhFwC4Kd-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android12-kiwi-5.10
head:   6c4f5ec4fbbf8b26b10215c34009ad8c2736f46b
commit: 4506bcbba5ec78d8d694fbb43e964cfefe900887 [161/161] ANDROID: mm: export swap_type_to_swap_info
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20250825/202508250526.PhFwC4Kd-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 4f15debe13af14e0fd668ee4861aff6dbc5283df)
rustc: rustc 1.58.0 (02072b482 2022-01-11)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250825/202508250526.PhFwC4Kd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508250526.PhFwC4Kd-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> mm/swapfile.c:102:26: warning: no previous prototype for function 'swap_type_to_swap_info' [-Wmissing-prototypes]
     102 | struct swap_info_struct *swap_type_to_swap_info(int type)
         |                          ^
   mm/swapfile.c:102:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     102 | struct swap_info_struct *swap_type_to_swap_info(int type)
         | ^
         | static 
   1 warning generated.


vim +/swap_type_to_swap_info +102 mm/swapfile.c

   101	
 > 102	struct swap_info_struct *swap_type_to_swap_info(int type)
   103	{
   104		if (type >= READ_ONCE(nr_swapfiles))
   105			return NULL;
   106	
   107		smp_rmb();	/* Pairs with smp_wmb in alloc_swap_info. */
   108		return READ_ONCE(swap_info[type]);
   109	}
   110	EXPORT_SYMBOL_GPL(swap_type_to_swap_info);
   111	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
