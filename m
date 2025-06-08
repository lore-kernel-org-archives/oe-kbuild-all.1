Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A157749C
	for <oe-kbuild-all@lists.linux.dev>; Sun,  8 Jun 2025 09:26:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749374808; cv=none; b=SIsYAboPq/K6iD6Auw55V9J/Z6WCdWvQedfpjq5v7y/0paAmrl+gEdu6TzpMLkJo04l8gzSOa8897cNFFcobg759ugIh7jqcGH4M2SNX8KELO6OYESnCZY2s44AjNFV3j/fyX3LgqGV1NLvQK+IFxY4qT6tHA8IsGVOuA8dsa1E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749374808; c=relaxed/simple;
	bh=ig8YU5D/S6VEoSZGuiyZxX9UDredM9hIHYFsDEbsHNI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=f0jKxtm72VhSIndHS6ZwRGbry214+FwGVUXhXDglaFLXOf9q3Rdb+V+UHhziXoduwgtvAkqT6fj5IpOwhEj6iAZHT4ZOa3cqNc2wnbn1CnIL2UtAskKvePjlbaf92AhwYkZc+bdr8hHTTNsHnWaqJXje6LQUICjUhggbhR6lhhY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Evo2nXhJ; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Evo2nXhJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749374807; x=1780910807;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ig8YU5D/S6VEoSZGuiyZxX9UDredM9hIHYFsDEbsHNI=;
  b=Evo2nXhJd9edm0ii3YpndaXkNlDQvxBs1quiezWUv5EBf8mayk1FjBWw
   K4NRocmad1PXiCr0MMexzpKgFjH0M0byaEo51T7pFK1cVWKTUYgea6cwY
   rwNJ7PXwzJNElWicJ/+kkpC3bgApndIpLpypAvZUe1yAHkV83ukXsvZVy
   B5/PuwDArIgVzkGcy2jU88Dk9F/12KzAKKnb/TqFsr/EgRrhByT+FWnWG
   HxryrusSdQkeJ/yxX+IBB49cYnB+yV47uxPGa+uUhufH+fesr5bRv6ueC
   PPE5TmS0Pt8y2ckS25dCC6LBzDglTTFYrLLh4KLmhcF/hGoDkyje8LRXN
   A==;
X-CSE-ConnectionGUID: K4ygDEDrR/u7ij2PNn8hgA==
X-CSE-MsgGUID: S/7kfXZwTD+AGoCY6C/DTg==
X-IronPort-AV: E=McAfee;i="6800,10657,11457"; a="51332868"
X-IronPort-AV: E=Sophos;i="6.16,220,1744095600"; 
   d="scan'208";a="51332868"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jun 2025 02:26:47 -0700
X-CSE-ConnectionGUID: cB4XYQiNQCWNRx/lawihTg==
X-CSE-MsgGUID: 0jl3LL21TkiSUYQQCaEk0A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,220,1744095600"; 
   d="scan'208";a="151236324"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 08 Jun 2025 02:26:45 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uOCId-0006It-0T;
	Sun, 08 Jun 2025 09:26:43 +0000
Date: Sun, 8 Jun 2025 17:26:10 +0800
From: kernel test robot <lkp@intel.com>
To: Josh Poimboeuf <jpoimboe@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jpoimboe:klp-build 47/62] drivers/gpu/drm/vmwgfx/vmwgfx_msg.o:
 error: objtool: unexpected relocation symbol type in
 .rela.discard.func_stack_frame_non_standard: 0
Message-ID: <202506081704.mpedL0Qy-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jpoimboe/linux.git klp-build
head:   e751180ffe5aa8f7d0c478c866c8ed4267336bd5
commit: a554e178eeff6b8877c83a9923c3448a2309789a [47/62] objtool: Make STACK_FRAME_NON_STANDARD consistent
config: x86_64-randconfig-121-20250608 (https://download.01.org/0day-ci/archive/20250608/202506081704.mpedL0Qy-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250608/202506081704.mpedL0Qy-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506081704.mpedL0Qy-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/gpu/drm/vmwgfx/vmwgfx_msg.o: error: objtool: unexpected relocation symbol type in .rela.discard.func_stack_frame_non_standard: 0

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
