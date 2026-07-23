Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC837427FA3
	for <oe-kbuild-all@lists.linux.dev>; Thu, 23 Jul 2026 09:36:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784799404; cv=none; b=RWLFdgFXI1k/VlM9U0iWM7VXgRBFBCPbxuqw/euMDLsgZcSh4kUDJsAkUJZTQjLF/Hboup6U1M7uFKeQy4n8R+NKJv2yYIic7NwaN/WXl2jf7s7tqj8bdYaobk/6bJHxk+T35tzni9t0cHvwqS/AlUAeBRhH6Fofq91sXaPeg5Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784799404; c=relaxed/simple;
	bh=eYADoQyHI9J4iaoisXCXuzcp741fvJUalSX9Xv5cG18=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Hxs2yCRtwVUWxIDD/Neo2l3sZXGGoV2fw+PmM2kuEGGGh8xeBzOlGdqGF4Feh1w0mZeS5fFI64i+e8OSFrI+a8a2kfP++r7CzrhYxGsIXGyrE/2Ao37x0WD7L+iL7/q0fbJku03KhTkgJgT5DZNnMN8FsAgoSVO0EXQ0sizvFE0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HRZ+58Ya; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HRZ+58Ya"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784799401; x=1816335401;
  h=date:from:to:cc:subject:message-id;
  bh=eYADoQyHI9J4iaoisXCXuzcp741fvJUalSX9Xv5cG18=;
  b=HRZ+58Yaojp2eNqg3wQNwKzv8sybQ6iVOnwRqXTQkGS5QKWvTjFaPgzw
   +DTNVGKbgiDLhQiNRmjniBcg7c2bmxQFZjBHXH1vK77jaY1rDVjYduXvH
   /+iIqrp7HJ6yBy5ficTzYasKfVu/tzaatIMuLpz3/ktm3YOMIkt9sd1nN
   LeLuqghIfPEvWjkS/M7oZrP+KoYeTrkqssPnNc+LnWiDKPOtzm55e477r
   Cccgyg1TD9+f6uqyacD9nHDKs5j6DOV1hYcJ3uY4K2lJJLhx7d+Yxi3BX
   1wWjZDTJWSjUQa5oHBuHtVBMEISsrj6LbtcmPK+kAWCeqyaUFZ/HjKpRc
   g==;
X-CSE-ConnectionGUID: r6SpnXo6Q3eay/R328ZZIA==
X-CSE-MsgGUID: 9FLk4AdUQg27KFzO/qw23g==
X-IronPort-AV: E=McAfee;i="6800,10657,11854"; a="102859375"
X-IronPort-AV: E=Sophos;i="6.25,180,1779174000"; 
   d="scan'208";a="102859375"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jul 2026 02:36:38 -0700
X-CSE-ConnectionGUID: rkMeNqVjR3q0hqALllkJ6w==
X-CSE-MsgGUID: FMO+PWm3QLGRMv6BycM0sA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,180,1779174000"; 
   d="scan'208";a="282875518"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa001.fm.intel.com with ESMTP; 23 Jul 2026 02:36:35 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wmpqz-00000000Zeu-1BOK;
	Thu, 23 Jul 2026 09:36:33 +0000
Date: Thu, 23 Jul 2026 17:35:32 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas Gleixner <tglx@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 x86@kernel.org, Jinjie Ruan <ruanjinjie@huawei.com>
Subject: [tip:core/entry 20/23] undefined reference to
 `syscall_enter_audit'
Message-ID: <202607231743.A6KubTAA-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git core/entry
head:   05c033db7e9ad3c34f6968ec568cb6ee01051c57
commit: ff2b9a905930db22494690d219724822db443d7a [20/23] entry: Rework syscall_audit_enter()
config: s390-randconfig-r132-20260723 (https://download.01.org/0day-ci/archive/20260723/202607231743.A6KubTAA-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 8.5.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260723/202607231743.A6KubTAA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607231743.A6KubTAA-lkp@intel.com/

All errors (new ones prefixed by >>):

   s390-linux-ld: arch/s390/kernel/syscall.o: in function `__do_syscall':
>> (.noinstr.text+0x232): undefined reference to `syscall_enter_audit'

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
