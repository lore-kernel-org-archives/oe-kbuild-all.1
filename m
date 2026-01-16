Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C9E435BDDB
	for <oe-kbuild-all@lists.linux.dev>; Fri, 16 Jan 2026 10:09:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768558196; cv=none; b=LN+zAOaql0M8X4JVQB/Z2dbwR/a0UiKoUpO2fox+sWMkLBAzIkGWZeAPRH9F1KmPWwicinVZnuZTORd23++myqeBh7Kr1vDyS4DfeTyHVkkGR4lOl8pTvUg6x+NvaoDLlwUB5OfxjuNwyNTE8Fr3i0utA1aSKVwCO0J4sgJQr9E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768558196; c=relaxed/simple;
	bh=x84Hfpw/HctoJzA3i4IasNZb45ircOxny52aRDNVaVM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=mfxm6lQPx3IyQBEY5DOMd0wPBmpGWfefdeOZgUuFjng9Y+A7n3iz3JxJnG59++Jl9mO+J+1ygCh7BQ9CBLuWcKgfhgryu5XAN4zm+Slov7R3QFVdVd2Mq3FU2nkYw4k0Qv74xfN1GByDsNe5ttEr/F2G2t7u3uxXS6E6+W65df0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hUnyJCY/; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hUnyJCY/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768558194; x=1800094194;
  h=date:from:to:cc:subject:message-id;
  bh=x84Hfpw/HctoJzA3i4IasNZb45ircOxny52aRDNVaVM=;
  b=hUnyJCY/UlymPAj4LROMFkSLHtPj64gPkDbkLZE77LB1TtK4oTI+P2O2
   3Ox4SELeZ4msfgJwXRX/l+kuCKhEbU+8FOW7k82qxSvExn/0EZygUxYJ7
   KMOefOAYeJOXwiWVW9+r1nOsXOwIiHxTjpj85HauFAsK482OALREBjmld
   tO9Fob1OrGlI0joEtBtsw50a8OOJy7Me931e5DFttAIBGxm+cX3wwotQg
   e5vwFijdaFKa9hHGU4oynzhElsl5dGp9PZyqDLZrmjzT0dYSG+9zOhvgJ
   Fvsd3F6ftf3ba6E7EdnUvAmyuFdfVLpZ5rN6GQjaA3vC2ISGwm8YgKGix
   Q==;
X-CSE-ConnectionGUID: CtDCwFOATDC9e7lDyVcLtQ==
X-CSE-MsgGUID: KSyHmhotRPS1JW4kMNhnyw==
X-IronPort-AV: E=McAfee;i="6800,10657,11672"; a="70038091"
X-IronPort-AV: E=Sophos;i="6.21,230,1763452800"; 
   d="scan'208";a="70038091"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jan 2026 02:09:54 -0800
X-CSE-ConnectionGUID: dYxPV2gkRqytPphzIoD3UA==
X-CSE-MsgGUID: Q9J8PQs7QmOnAnLaDzUXSA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,230,1763452800"; 
   d="scan'208";a="204415107"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 16 Jan 2026 02:09:53 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vggm6-00000000KhI-1OFB;
	Fri, 16 Jan 2026 10:09:50 +0000
Date: Fri, 16 Jan 2026 18:09:06 +0800
From: kernel test robot <lkp@intel.com>
To: "Darrick J. Wong" <darrick.wong@oracle.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [djwong-xfs:fuse-service-container 39/91]
 fs/fuse/file_iomap.o: warning: objtool:
 fuse_iomap_begin_validate.isra.0+0x148: stack state mismatch: reg1[26]=-1+0
 reg2[26]=-2-40
Message-ID: <202601161700.0cR5VFie-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/djwong/xfs-linux.git fuse-service-container
head:   29f63541e7b320ea938a422f2476fd6e15ebcc7d
commit: 6854e534eed228f002546b568da9fc94d2ef7976 [39/91] fuse: make debugging configurable at runtime
config: loongarch-randconfig-001-20260116 (https://download.01.org/0day-ci/archive/20260116/202601161700.0cR5VFie-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260116/202601161700.0cR5VFie-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601161700.0cR5VFie-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/fuse/file_iomap.o: warning: objtool: fuse_iomap_begin_validate.isra.0+0x148: stack state mismatch: reg1[26]=-1+0 reg2[26]=-2-40

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
