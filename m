Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B26236C
	for <oe-kbuild-all@lists.linux.dev>; Sun, 24 Nov 2024 23:29:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732490970; cv=none; b=BVqhxHCk6kcW2e52bxPyqDCW5ac0ay7BDUw8SRiJ0TO0jQ7j4kyETJwM5j6EsW2YsYTBGKFQptUtbcy/Hlkb5aBSdqRSJFJ2k/g1WQnJy4PLHqPGnJAQVitL+PP+gwsUtvCg6O9YfVZTxbxJLThND8uwlWoQdswrHQxQhew5gwc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732490970; c=relaxed/simple;
	bh=bA3ypoojY1kiebz3VKywrK5CjuBPOXO5krBgSd9Aa80=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=BwZuMlXIP09/DqarHy9OW9p6msbrZ6Bfz8RNAKTMukxii/wubOc+2CUJeWAt4pwbfR9yQq1TGk3qWcGuplLgfbMfHFgS2IEalj0kJdCdoZpGTubucyJn+iwWQS/XHLis5y/BJH14sNrW8s4FpQv7UfRa4K++pLdpCmOoxLSV87c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fK8WP8rV; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fK8WP8rV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732490968; x=1764026968;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=bA3ypoojY1kiebz3VKywrK5CjuBPOXO5krBgSd9Aa80=;
  b=fK8WP8rVIfi77WZy/Fo16TLXUeSLeGnkoAjT01TMI8pDTAVb8yJhz28I
   1lOQeQf7306BfKA/LwXu5J2GnmE9O0NvT7Jnjy+j4mFHuQAWdkxMnLkPt
   91INNhJb8n/0jOagMElC7N0DkUO5F8Q4i6pqdwIIGBxczPcuDbTt/j4Z9
   KJD0nl1m0eIMz6GjclzhAKzXs/baOgVBmfZ3GbrWu5n55Ks8JdRe1vTIf
   BFgL9wyvMeCbpdbCp14aux+GX6HvxPohr44ndavo1AKa8OgtP7FQKeCzP
   6+VwA1IHVMQGYxp44+mk4UDWUQdglDchy9WEYKFcNuGHJ43tLLz6RmEfJ
   Q==;
X-CSE-ConnectionGUID: zOrSW/77Q9yLypE+jVcGfg==
X-CSE-MsgGUID: SvuseefzRKi8fLHMAkuFUA==
X-IronPort-AV: E=McAfee;i="6700,10204,11266"; a="20170569"
X-IronPort-AV: E=Sophos;i="6.12,181,1728975600"; 
   d="scan'208";a="20170569"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Nov 2024 15:29:26 -0800
X-CSE-ConnectionGUID: EVnGdyxSSKaPUHBRzYqXOQ==
X-CSE-MsgGUID: xxfKsmXsSTGu4L1AluKTuQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,181,1728975600"; 
   d="scan'208";a="96158759"
Received: from lkp-server01.sh.intel.com (HELO 8122d2fc1967) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 24 Nov 2024 15:29:25 -0800
Received: from kbuild by 8122d2fc1967 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tFM2d-0005H3-0g;
	Sun, 24 Nov 2024 23:29:23 +0000
Date: Mon, 25 Nov 2024 07:28:26 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android12-5.4 9705/30000] kismet: WARNING: unmet
 direct dependencies detected for CRYPTO_ZSTD when selected by INCREMENTAL_FS
Message-ID: <202411250729.EyrxKVlD-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android12-5.4
head:   3818981c333235449aa71c20848b175571a0c1cb
commit: c3e816a56786096a2f1521a3445a5f6b056af6f9 [9705/30000] ANDROID: Incremental fs: Add zstd compression support
config: x86_64-kismet-CONFIG_CRYPTO_ZSTD-CONFIG_INCREMENTAL_FS-0-0 (https://download.01.org/0day-ci/archive/20241125/202411250729.EyrxKVlD-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20241125/202411250729.EyrxKVlD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411250729.EyrxKVlD-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for CRYPTO_ZSTD when selected by INCREMENTAL_FS
   WARNING: unmet direct dependencies detected for CRYPTO_ZSTD
     Depends on [n]: CRYPTO [=n]
     Selected by [y]:
     - INCREMENTAL_FS [=y] && BLOCK [=y]
   
   WARNING: unmet direct dependencies detected for CRYPTO_SHA256
     Depends on [n]: CRYPTO [=n]
     Selected by [y]:
     - INCREMENTAL_FS [=y] && BLOCK [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
