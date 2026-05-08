Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DF3F33D506
	for <oe-kbuild-all@lists.linux.dev>; Fri,  8 May 2026 11:26:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778239565; cv=none; b=bYPp3/4be5EZyAbuBUdD7xcRmZHiRjf/XUYmlddApmYnc9imEbDQRjF28yOrbOShIYVVR0lMpkUVcSwgS8Q4VXvYbLYUWjW+wZzFu7yO8f9FqoX2/jWzineAcVVRsWeVg3A7AoeRJzC054jXARLzsPiQBchNoGgwOuEzpr39q9U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778239565; c=relaxed/simple;
	bh=GVPFas6rqHuOMLwqv7Q6/rI5Fe85qKXYd5COX/iH6Ww=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ex6hDxT3p0OJ5G6k6oG11IAmo9/5SE6qkm7v7h5ueZSIpcB+HXT75r0TYk/tO/pkuS8hgxeEyLCKItYloKj4PUzPT/79IUrZsAOcZXmUJLjXEc35C3KKVA/mG80puChpB3eBxbATfbVzMabK9q/7+NRZvgRbHPt18WVbBZ/Kjvs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dNeqjpvM; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dNeqjpvM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778239565; x=1809775565;
  h=date:from:to:cc:subject:message-id;
  bh=GVPFas6rqHuOMLwqv7Q6/rI5Fe85qKXYd5COX/iH6Ww=;
  b=dNeqjpvMo+i78zu10A80riq/hcy0UKa1+uNp+cu5Vxz6Wg4WqO4kF1v+
   MWq5GZlE0oo1/a4luWCkhmGMk24BnbtCxh76216d5x+0Z3vl4wqHuWxVs
   E3ULOfwkqdrRnu8++t0dWQtvp6pbmIjSvfuc7o0A3XE3ZGF0GFxTQaI6i
   j5L9v3OHBD6U7dwjKNQAT7jQUiQUYdlLDN9OuKvyuO1OMQkVHzS8e3eIp
   3+WCY7S3OPVwuiDEmYoby6+qwWV9yKsfNMz+nrdfZs6c5ERRSwq55WHKG
   Oa1YHTH4XdM/FExERSIHhAi5BLUlFkmohVau+mVRmIJuqMwuNNXFZnZcu
   A==;
X-CSE-ConnectionGUID: m0AAB4K8T+G9C5EaYp6UUg==
X-CSE-MsgGUID: cjC0bg/rTz2AJVIQYjxG4g==
X-IronPort-AV: E=McAfee;i="6800,10657,11779"; a="79106261"
X-IronPort-AV: E=Sophos;i="6.23,223,1770624000"; 
   d="scan'208";a="79106261"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 May 2026 04:26:04 -0700
X-CSE-ConnectionGUID: J35YGF7UQoG7dxDdo9KdVA==
X-CSE-MsgGUID: VY+nomgVSHqZ3Sd8GIFMeg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,223,1770624000"; 
   d="scan'208";a="232400838"
Received: from lkp-server01.sh.intel.com (HELO 82327192134e) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 08 May 2026 04:26:02 -0700
Received: from kbuild by 82327192134e with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wLJLD-0000000007N-42td;
	Fri, 08 May 2026 11:25:59 +0000
Date: Fri, 08 May 2026 19:25:04 +0800
From: kernel test robot <lkp@intel.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [axboe:io_uring-io-slots 8/13] ld:
 io_uring/slot.c:212:undefined reference to `bio_uninit'
Message-ID: <202605081909.xCySERu1-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux.git io_uring-io-slots
head:   8cda41fe2d37340341d2ae4bf15368f88b4bd5a2
commit: 520d5352ff2ee5fdb1e705c13a2ac0edd85a43d9 [8/13] io_uring: add registered IO slot infrastructure
config: x86_64-randconfig-016-20260508 (https://download.01.org/0day-ci/archive/20260508/202605081909.xCySERu1-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260508/202605081909.xCySERu1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605081909.xCySERu1-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: vmlinux.o: in function `io_free_io_slot':
   io_uring/slot.c:106:(.text+0xbf1eee): undefined reference to `bio_uninit'
   ld: vmlinux.o: in function `io_slot_submit':
   io_uring/slot.c:314:(.text+0xbf265a): undefined reference to `submit_bio_noacct_fast'
   ld: vmlinux.o: in function `io_slot_bio_end_io':
   io_uring/slot.c:77:(.text+0xbf2761): undefined reference to `blk_status_to_errno'
   ld: vmlinux.o: in function `io_slot_validate_file':
   io_uring/slot.c:119:(.text+0xbf2c41): undefined reference to `file_bdev'
   ld: vmlinux.o: in function `io_register_io_slot':
   io_uring/slot.c:200:(.text+0xbf300b): undefined reference to `bio_init'
>> ld: io_uring/slot.c:212:(.text+0xbf3187): undefined reference to `bio_uninit'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
