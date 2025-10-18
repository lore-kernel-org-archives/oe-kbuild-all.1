Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82FDB3B2A0
	for <oe-kbuild-all@lists.linux.dev>; Sat, 18 Oct 2025 21:37:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760823471; cv=none; b=uVSVMelJOkYVB7sAd3Dab7uZPTQgF6FcqYZNeH0OQf29TygLQblv7uH4WtOCVp8ILPUNKqQL2YXwGnoZnjsN0CBf0aQXm5CYBAO49jMBw2xUFhQT7mv/NYYTrcyr09prVPSLIdUK6/DI9OKEP8wTQLezBnxlszJ6zmjWyD0EIZE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760823471; c=relaxed/simple;
	bh=IvTEGoV/2rSFtJ0hI+CB0ql47gWapkY2EGZom9D2XoM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=KZTCv5YPhzafyZWVIwFZZh6/lTvWrDA+F8WpC8mglDvzu1pZIVXfhRqrabKyP92SwA9iOmCzCoZpQsVx5nCkN9uC/q05+Duh6ioTe8qCQNaptQJyWBeHHH7jAL/DjBJ06o52XjjeVx7x8/ZP1UwRNtZO78VKe9z2QVDzX2xIrOs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Km1h1VhM; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Km1h1VhM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760823469; x=1792359469;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=IvTEGoV/2rSFtJ0hI+CB0ql47gWapkY2EGZom9D2XoM=;
  b=Km1h1VhMHr+vbVTHzfZNubHereCvvseZ1ymgkRSdDo5+WVb2FxmiXzRG
   zw6K/vQiiFqZm0KzK2hJ8PYpLaSpT6LHMONmkosVd2NeDtPvl3RqR/RUA
   4KZSypsVWTRJPOnvUMsQ/4wa0erBuM4u4zyGjPNpVgj2IaId7xZ1dQnlZ
   0TidELL1JuDSRAoSJt4bK3md+TWJ3zDrhVYOF2EuKcSbjI0ziNGXgBU7/
   MTtZoFReCPf54UlOY0dnzGsrduvPrkiTOpXb7VqfZ4ic4tRgSvKnOgM9D
   IMgT74unjEoCumrJdGm2vnQ1ZLHtbmUWkpfWaiSJSmWw9Pxw56ekDtmWb
   A==;
X-CSE-ConnectionGUID: XQIi+fthQIKxoNWlz1Gqwg==
X-CSE-MsgGUID: qbg9g5EpQ1SuF8SAYrL8Jg==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="73283237"
X-IronPort-AV: E=Sophos;i="6.19,239,1754982000"; 
   d="scan'208";a="73283237"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Oct 2025 14:37:49 -0700
X-CSE-ConnectionGUID: NPmztDNaR/+vqijKXQzK9w==
X-CSE-MsgGUID: wNJ6U0hNQ0eu7du/A/KCCQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,239,1754982000"; 
   d="scan'208";a="183024703"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa008.jf.intel.com with ESMTP; 18 Oct 2025 14:37:47 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vAEcT-0008cf-1H;
	Sat, 18 Oct 2025 21:37:45 +0000
Date: Sun, 19 Oct 2025 05:36:58 +0800
From: kernel test robot <lkp@intel.com>
To: Jakub Kicinski <kuba@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>
Subject: drivers/net/ethernet/meta/fbnic/fbnic_tlv.h:83:24: warning:
 conversion from 'long unsigned int' to 'short unsigned int' changes value
 from '261632' to '65024'
Message-ID: <202510190541.XNb7ePlI-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   1c64efcb083c48c85227cb4d72ab137feef2cdac
commit: 5df1d0a08483eff13f0da1cc66883e0bc2cf4fcf eth: fbnic: support FW communication for core dump
date:   4 weeks ago
config: powerpc-randconfig-002-20251019 (https://download.01.org/0day-ci/archive/20251019/202510190541.XNb7ePlI-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 10.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251019/202510190541.XNb7ePlI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510190541.XNb7ePlI-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/net/ethernet/meta/fbnic/fbnic_fw.c:13:
>> drivers/net/ethernet/meta/fbnic/fbnic_tlv.h:83:24: warning: conversion from 'long unsigned int' to 'short unsigned int' changes value from '261632' to '65024' [-Woverflow]
      83 | #define TLV_MAX_DATA   (PAGE_SIZE - 512)
         |                        ^
   drivers/net/ethernet/meta/fbnic/fbnic_tlv.h:94:43: note: in expansion of macro 'TLV_MAX_DATA'
      94 | #define FBNIC_TLV_ATTR_RAW_DATA(id) { id, TLV_MAX_DATA, FBNIC_TLV_BINARY }
         |                                           ^~~~~~~~~~~~
   drivers/net/ethernet/meta/fbnic/fbnic_fw.c:927:2: note: in expansion of macro 'FBNIC_TLV_ATTR_RAW_DATA'
     927 |  FBNIC_TLV_ATTR_RAW_DATA(FBNIC_FW_COREDUMP_READ_DATA),
         |  ^~~~~~~~~~~~~~~~~~~~~~~


vim +83 drivers/net/ethernet/meta/fbnic/fbnic_tlv.h

c6203e678cc9a5 Alexander Duyck 2024-07-12  82  
c6203e678cc9a5 Alexander Duyck 2024-07-12 @83  #define TLV_MAX_DATA			(PAGE_SIZE - 512)
c6203e678cc9a5 Alexander Duyck 2024-07-12  84  #define FBNIC_TLV_ATTR_ID_UNKNOWN	USHRT_MAX
c6203e678cc9a5 Alexander Duyck 2024-07-12  85  #define FBNIC_TLV_ATTR_STRING(id, len)	{ id, len, FBNIC_TLV_STRING }
c6203e678cc9a5 Alexander Duyck 2024-07-12  86  #define FBNIC_TLV_ATTR_FLAG(id)		{ id, 0, FBNIC_TLV_FLAG }
c6203e678cc9a5 Alexander Duyck 2024-07-12  87  #define FBNIC_TLV_ATTR_U32(id)		{ id, sizeof(u32), FBNIC_TLV_UNSIGNED }
c6203e678cc9a5 Alexander Duyck 2024-07-12  88  #define FBNIC_TLV_ATTR_U64(id)		{ id, sizeof(u64), FBNIC_TLV_UNSIGNED }
c6203e678cc9a5 Alexander Duyck 2024-07-12  89  #define FBNIC_TLV_ATTR_S32(id)		{ id, sizeof(s32), FBNIC_TLV_SIGNED }
c6203e678cc9a5 Alexander Duyck 2024-07-12  90  #define FBNIC_TLV_ATTR_S64(id)		{ id, sizeof(s64), FBNIC_TLV_SIGNED }
c6203e678cc9a5 Alexander Duyck 2024-07-12  91  #define FBNIC_TLV_ATTR_MAC_ADDR(id)	{ id, ETH_ALEN, FBNIC_TLV_BINARY }
c6203e678cc9a5 Alexander Duyck 2024-07-12  92  #define FBNIC_TLV_ATTR_NESTED(id)	{ id, 0, FBNIC_TLV_NESTED }
c6203e678cc9a5 Alexander Duyck 2024-07-12  93  #define FBNIC_TLV_ATTR_ARRAY(id)	{ id, 0, FBNIC_TLV_ARRAY }
c6203e678cc9a5 Alexander Duyck 2024-07-12  94  #define FBNIC_TLV_ATTR_RAW_DATA(id)	{ id, TLV_MAX_DATA, FBNIC_TLV_BINARY }
c6203e678cc9a5 Alexander Duyck 2024-07-12  95  #define FBNIC_TLV_ATTR_LAST		{ FBNIC_TLV_ATTR_ID_UNKNOWN, 0, 0 }
c6203e678cc9a5 Alexander Duyck 2024-07-12  96  

:::::: The code at line 83 was first introduced by commit
:::::: c6203e678cc9a5bf01ec7ae382851f504870777f eth: fbnic: Add message parsing for FW messages

:::::: TO: Alexander Duyck <alexanderduyck@fb.com>
:::::: CC: Jakub Kicinski <kuba@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
