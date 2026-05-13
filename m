Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26B733A9DA3
	for <oe-kbuild-all@lists.linux.dev>; Wed, 13 May 2026 22:56:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778713006; cv=none; b=Ul9HxKj9liDR2C5ppDMUM+iZVbTKb5LtMYGCSbSCy3vO6HEIl27iO0NXKNaM9K1jauBfKjdHfywLZO6gQKlQtxApFu+FWBVaE8A56Ji27deHNILp/URvkQLUYvRdt0XROVu7kF1uFYtoSOkionGJWalEnz+J6h7R8vCH2Fy0s1o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778713006; c=relaxed/simple;
	bh=QJNb4ZqKUMMZHskuyhOPRO95boyLz11GCq9xNhT4/nc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=dsLOYtd1TJZqo26fgMEXa1TwaP579aXs4iC5GqF/5QwK0bc/u7/khhRqBTGYd4Sv+T6VAS+mAvhhPVcUtixWP6JcK98uEhspK1Vc0JDvKP607ax3vGStH6D8e1vXfxU2RIXIV61F5RYpVUl2Uotqek4fR/FE6VJSofM2Ibm+9UE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DBgJHLWm; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DBgJHLWm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778713004; x=1810249004;
  h=date:from:to:cc:subject:message-id;
  bh=QJNb4ZqKUMMZHskuyhOPRO95boyLz11GCq9xNhT4/nc=;
  b=DBgJHLWmM53Lex7rN0vYh5j+QohJ4MxY6VzHINkbZZROiT+Rt5qJSrDE
   4eZn3fUf/WLBnwU9COva4lHtIbTQwfMA1tLWqnhDGmrtibcnRj1JcmiFN
   KG/KTcKRG58t3JRME3VZL+wqJE5VPZpN860NvEw3TSwtZgoPR2i4pFTBg
   JzhrHcoif43miaaFTCKWhWfPJzVBXXp9U05eNqjAkg/NTiQwBHHcX0Vq/
   89q0Pb8lkHdFmRojdkw1+EaJk+JErzuK8bHJ8qPoL6KR8xFGBVourLaWy
   psaE3mWLGY/qhQT7/lBaAB0p9r3892AeDIvzGSOa6YfRs1+XCcph4l3gT
   Q==;
X-CSE-ConnectionGUID: HtN703y3QA+r8XeIBCGB9g==
X-CSE-MsgGUID: W7vwYQ3zRUm5gweo3q+ELQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11785"; a="78795718"
X-IronPort-AV: E=Sophos;i="6.23,233,1770624000"; 
   d="scan'208";a="78795718"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2026 15:56:41 -0700
X-CSE-ConnectionGUID: zUMqWoOKRHyAh9nEOkPOLg==
X-CSE-MsgGUID: yNgFQ9BzR0ynOEwRZ8ZekQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,233,1770624000"; 
   d="scan'208";a="238104228"
Received: from lkp-server01.sh.intel.com (HELO dca79079c3eb) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 13 May 2026 15:56:39 -0700
Received: from kbuild by dca79079c3eb with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wNIVI-000000005GF-3EY8;
	Wed, 13 May 2026 22:56:36 +0000
Date: Thu, 14 May 2026 06:56:18 +0800
From: kernel test robot <lkp@intel.com>
To: Josef Bacik <josef@toxicpanda.com>
Cc: oe-kbuild-all@lists.linux.dev, David Sterba <dsterba@suse.com>,
 Daniel Vacek <neelx@suse.com>
Subject: [kdave-btrfs-devel:ext/dv/fscrypt 1/43] Warning:
 fs/crypto/policy.c:821 expecting prototype for fscrypt_set_extent_context().
 Prototype was for fscrypt_context_for_new_extent() instead
Message-ID: <202605140608.mGokLhCV-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/kdave/btrfs-devel.git ext/dv/fscrypt
head:   4c05f02641d57f578a685f7e8d27b9cb18d17cc7
commit: 519fbe9ff1a258b3c0e1ef231718f0394c7ab2ef [1/43] fscrypt: add per-extent encryption support
config: nios2-randconfig-r073-20260514 (https://download.01.org/0day-ci/archive/20260514/202605140608.mGokLhCV-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 8.5.0
smatch: v0.5.0-9185-gbcc58b9c
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260514/202605140608.mGokLhCV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605140608.mGokLhCV-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: fs/crypto/policy.c:821 expecting prototype for fscrypt_set_extent_context(). Prototype was for fscrypt_context_for_new_extent() instead

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
