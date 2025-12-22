Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D52826CE2D
	for <oe-kbuild-all@lists.linux.dev>; Mon, 22 Dec 2025 10:51:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766400680; cv=none; b=sfIIWYniksvU+qfXVzkhSEVXS8Hd9BicTfZEYnXh4CX9mfvr2y6094yMNxIFZlbN9xqzH7Jp4sP03z56pnk2npA03wDEAv8AFTKSUtqV9031RXOU6nBdBGrSQav7Mpld5W5REFXY/WplzYSs3hvNsibq8sqY+JmRx2+CQ82A8lU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766400680; c=relaxed/simple;
	bh=Tn4AIQWEcixUbHbQ897Ik58itunnClsvHMFALrFjhl4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ppYRPCFefd6MwMz8+bjvGEiakbuANUvqfjq2jnuaDSdx421HrVKkv06OIR3188Jnp8xC6qDcVUldD/L4+Y4YQRctsMzhtPv3rjOWPaxyHVV8KW5fFi+gCl1mhz4Ll12OOumAgeTtib5HcSn7Nfsv1Lh7ofsktVl51apxinIUZdE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FeR13fiX; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FeR13fiX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766400679; x=1797936679;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Tn4AIQWEcixUbHbQ897Ik58itunnClsvHMFALrFjhl4=;
  b=FeR13fiXELT09UPhhcmWgn7iI3xHzEaanSdGXjxxi9RcKB33fI0NqAxv
   7kRByZU8jcNL4qxBP79VgXe2tecT9fe2qwF6JdNUtuKwM8XnXjsR3hwm5
   HOx9YgrL/S0fgQKZRUfTxlYAXOnxLVgRtwK7nBaLBlP+SjiQ093zPEBgw
   vS8Uvgo0FIWqRQJkL/sfR5yEQ/BkRUUh/4RO3v7U3OAyZjKmEbES/b/8U
   2mX6KOiie132gyjAGRmYZ5AhsGpIg/ucHpFWHvK0+AWBsiMp634+0xy3h
   DP0LUuZt5I7carKoO3MUoE4p37fUZN2c08yhX4xuDCBiC/VpbmKkvjnBg
   Q==;
X-CSE-ConnectionGUID: hdWMe0CVSlOq03vQnWdyyQ==
X-CSE-MsgGUID: aqT8JFcfRCCcA06Wp7A35A==
X-IronPort-AV: E=McAfee;i="6800,10657,11649"; a="68236793"
X-IronPort-AV: E=Sophos;i="6.21,168,1763452800"; 
   d="scan'208";a="68236793"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Dec 2025 02:51:18 -0800
X-CSE-ConnectionGUID: uzywKkWHTnKg9JNMSPpunQ==
X-CSE-MsgGUID: aDU29xJ3RAuIbhLiwP/E8g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,168,1763452800"; 
   d="scan'208";a="236920656"
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a) ([10.211.93.152])
  by orviesa001.jf.intel.com with ESMTP; 22 Dec 2025 02:51:17 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vXdVS-000000005Qq-3G6k;
	Mon, 22 Dec 2025 10:51:14 +0000
Date: Mon, 22 Dec 2025 11:51:07 +0100
From: kernel test robot <lkp@intel.com>
To: Sasha Levin <sashal@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-doc@vger.kernel.org
Subject: [sashal:spec 38/131] htmldocs:
 Documentation/filesystems/api-summary:47: ./fs/locks.c:2347: WARNING: Block
 quote ends without a blank line; unexpected unindent. [docutils]
Message-ID: <202512221137.JK2URmKe-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/sashal/linux.git spec
head:   d34c22a9d280338fc8a0f12fd5577e62f345503e
commit: 6e2efef314de6b3ba3b41078599a2c5f25f9c1d9 [38/131] kernel/api: add API specification for sys_flock
reproduce: (https://download.01.org/0day-ci/archive/20251222/202512221137.JK2URmKe-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512221137.JK2URmKe-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Documentation/filesystems/api-summary:47: ./fs/locks.c:2256: ERROR: Unexpected indentation. [docutils]
   Documentation/filesystems/api-summary:47: ./fs/locks.c:2311: ERROR: Unexpected indentation. [docutils]
   Documentation/filesystems/api-summary:47: ./fs/locks.c:2322: ERROR: Unexpected indentation. [docutils]
   Documentation/filesystems/api-summary:47: ./fs/locks.c:2331: ERROR: Unexpected indentation. [docutils]
   Documentation/filesystems/api-summary:47: ./fs/locks.c:2343: ERROR: Unexpected indentation. [docutils]
>> Documentation/filesystems/api-summary:47: ./fs/locks.c:2347: WARNING: Block quote ends without a blank line; unexpected unindent. [docutils]
   Documentation/filesystems/api-summary:47: ./fs/locks.c:2354: ERROR: Unexpected indentation. [docutils]
   Documentation/filesystems/api-summary:47: ./fs/locks.c:2356: WARNING: Block quote ends without a blank line; unexpected unindent. [docutils]
   Documentation/filesystems/api-summary:47: ./fs/locks.c:2363: ERROR: Unexpected indentation. [docutils]
   Documentation/filesystems/api-summary:47: ./fs/locks.c:2366: WARNING: Block quote ends without a blank line; unexpected unindent. [docutils]
   Documentation/filesystems/api-summary:47: ./fs/locks.c:2372: ERROR: Unexpected indentation. [docutils]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
