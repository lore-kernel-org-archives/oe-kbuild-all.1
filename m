Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 853292E36F8
	for <oe-kbuild-all@lists.linux.dev>; Mon,  4 Aug 2025 01:16:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754270191; cv=none; b=B8eO65TR03wsXM5acG8YJSLYfSUqtyO/P6Hm9hC9+x5FBYNWQ+D6XNfcZJgef5V+oOQ/vsd5o4Rgq/JaZrWEfDGhR5pxb60WiwZl7EQcWims7Uic0FM8HCVDkc1D5bKX6T09mxZHqq1nIXXpU4Ifug6OgJ1IjdQydeWsRTVgOPg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754270191; c=relaxed/simple;
	bh=6Tf9F1ccDAJS4PCrSg2KXuXp7Tp7l8r5OWiz7nwydNY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=kjlJsarxw4ACzS3KqDja+M8sFVG6/b/SZ54HB+KcYfsvteMOllEuvJv7Ym8rLy6m9mx9SFkZ/+FEhxFOE1S5hGReTXKn4uAX0xQKQWxnaKtb8hTjxswIjuqxzn4lKtmmSnsKJcbQPUuBRDhpI1PZY+cNLWCV3S9Hfe17hr2fZp4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nzS0Ww/F; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nzS0Ww/F"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754270190; x=1785806190;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=6Tf9F1ccDAJS4PCrSg2KXuXp7Tp7l8r5OWiz7nwydNY=;
  b=nzS0Ww/FGSlCmcS8UpO1V5DBnM+/Sj1uVwG77aik6lG1xLzKSBC31Xm7
   SfzmAHbdXiEfl5Av2CRUcfq3bPpf99E483b0uerOlsnrQvt73NbEsVswN
   bLJocBIEazSyfUDxos/F5DPV7klyMo6dnO4E1bks4YfCBsPwwg6vV6Ylw
   54CKACIQOHQ4MsZ3Po4OVWLRjUQiCCNpkJoZhz4r8LSLjWz4ZoDsHHTSX
   e46VKH68qTUS6YQZRb9K6V7Ip5WH86BU4EtafgKljJvEi/JvDoaJqvFSf
   1aWfNOgaKA/HNu7QWZ6E/FxSvIZtOXKC/vkpJ+NCGhJFueqNVrrmatEG4
   w==;
X-CSE-ConnectionGUID: S3FsRWrmRFKUTJv6VcRyjw==
X-CSE-MsgGUID: cPZybO3oTuqt2xZHctqzeQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11511"; a="60337574"
X-IronPort-AV: E=Sophos;i="6.17,258,1747724400"; 
   d="scan'208";a="60337574"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Aug 2025 18:16:29 -0700
X-CSE-ConnectionGUID: 85yNbSWESxC6o+p1O4L7JA==
X-CSE-MsgGUID: S4/yifdOTgWTpRvwKmiaLg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,258,1747724400"; 
   d="scan'208";a="168487431"
Received: from igk-lkp-server01.igk.intel.com (HELO b3b7d4258b7c) ([10.91.175.65])
  by orviesa004.jf.intel.com with ESMTP; 03 Aug 2025 18:16:28 -0700
Received: from kbuild by b3b7d4258b7c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uijoP-0001iF-27;
	Mon, 04 Aug 2025 01:16:25 +0000
Date: Mon, 4 Aug 2025 03:15:51 +0200
From: kernel test robot <lkp@intel.com>
To: Asahi Lina <lina@asahilina.net>
Cc: oe-kbuild-all@lists.linux.dev, Janne Grunau <j@jannau.net>
Subject: [asahilinux:bits/250-aop 62/85] warning: length comparison to zero
Message-ID: <202508040331.MqmdoiaU-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/AsahiLinux/linux bits/250-aop
head:   800be80e4ce2e4872e0d8f2716b2b7c79a0511ef
commit: 6fd37522db75e57a269d63a7230133f86f8018d6 [62/85] Rust: io: Add memcpy_fromio wrapper
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20250804/202508040331.MqmdoiaU-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250804/202508040331.MqmdoiaU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508040331.MqmdoiaU-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> warning: length comparison to zero
   --> rust/kernel/io.rs:255:12
   |
   255 |         if buffer.len() == 0 || !Self::length_valid(offset, buffer.len(), self.maxsize()) {
   |            ^^^^^^^^^^^^^^^^^ help: using `is_empty` is clearer and more explicit: `buffer.is_empty()`
   |
   = help: for further information visit https://rust-lang.github.io/rust-clippy/master/index.html#len_zero
   = note: `-W clippy::len-zero` implied by `-W clippy::all`
   = help: to override `-W clippy::all` add `#[allow(clippy::len_zero)]`

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
