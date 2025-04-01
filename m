Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B135D2163B9
	for <oe-kbuild-all@lists.linux.dev>; Tue,  1 Apr 2025 21:34:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743543267; cv=none; b=m+ULFGJW5yKjenWi4swAi9qGvZMUZ49/ZgMs7g5Ee101oLyy1eXM5c40vnuHh+YrylzZSdM9UWMK3ipA/Zud8u/pLb1RAjTsSKdJox/MdYZNZvhfr2/hH6w8lBKVAnhl1bV0gy2gq7RHoKgncvWHU/GkoicTbjPXlXq+qn4Ht1E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743543267; c=relaxed/simple;
	bh=UESztIlvserQgwGb1fb6p9kCBtDm6Hp+MzKsy6M6q88=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ft7I2de1nH+HechCLsLiCf8XRdjM+TRg+hDe+ZsqddVAMrSLHqliYzhHF2Z4Z3aSgSBNmGdNnfjfSg+4Ir+B4e6Iebz9RIja87U7i297x6UmBw6ef0gXsboZ4wt98nmeHR07YSTGwFdJ+8HG+OT8K60TgYkP8Fi53g1n4RAhq70=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eIdX+kqo; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eIdX+kqo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743543264; x=1775079264;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=UESztIlvserQgwGb1fb6p9kCBtDm6Hp+MzKsy6M6q88=;
  b=eIdX+kqoJUOAs576j/6EyXyI/8icoGiGFb29HtXvXhcvjB9IDrlmKmPl
   jTQ1Li3jsBFRE/AMBrjzEYkykN7RbiW9UeeIthLIA8b4l92dHXLdSFXO3
   F1CbmMorayEnN2xKPGp3nCA6/+efaxrBxvVGUrkH8fkYhNm6Nsbfbyyrm
   h8iBpeeZy9vxidElCOQt5l+q0FqI55H8U/SV9EmLyaITnxFff34GyBIf2
   gRDkav+ZZC/EcH6geEVwWGmTBiiCT8Li9R4qyE42oPDeIwWl5yKEcrRm4
   Jl1Q5gyvDxiyr6wZvB3Jv+px53rfcS7y8mdxz3eAvGJd0SjQpLPSGypMc
   A==;
X-CSE-ConnectionGUID: qZ1DK0lXS62jwGCCZnxD6A==
X-CSE-MsgGUID: LVbOTWD4TVeZCkUVJp2+yg==
X-IronPort-AV: E=McAfee;i="6700,10204,11391"; a="48677765"
X-IronPort-AV: E=Sophos;i="6.14,294,1736841600"; 
   d="scan'208";a="48677765"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Apr 2025 14:34:24 -0700
X-CSE-ConnectionGUID: V0giIXLTTXKC0gE+1jS43A==
X-CSE-MsgGUID: fgPYweNESEePVRk5QoPh9A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,294,1736841600"; 
   d="scan'208";a="126397917"
Received: from lkp-server02.sh.intel.com (HELO e98e3655d6d2) ([10.239.97.151])
  by orviesa010.jf.intel.com with ESMTP; 01 Apr 2025 14:34:21 -0700
Received: from kbuild by e98e3655d6d2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tzjFQ-000A9J-00;
	Tue, 01 Apr 2025 21:34:16 +0000
Date: Wed, 2 Apr 2025 05:33:50 +0800
From: kernel test robot <lkp@intel.com>
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [paulmckrcu:dev.2025.03.25a 45/45] fs/btrfs/extent-io-tree.c:71:17:
 sparse: sparse: Initializer entry defined twice
Message-ID: <202504020500.Svb9JN2H-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/paulmckrcu/linux dev.2025.03.25a
head:   cedfad9ced72fc8c873e11a4c6a089a415489166
commit: cedfad9ced72fc8c873e11a4c6a089a415489166 [45/45] ratelimit: Reduce ratelimit's false-positive misses
config: nios2-randconfig-r122-20250402 (https://download.01.org/0day-ci/archive/20250402/202504020500.Svb9JN2H-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 10.5.0
reproduce: (https://download.01.org/0day-ci/archive/20250402/202504020500.Svb9JN2H-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504020500.Svb9JN2H-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> fs/btrfs/extent-io-tree.c:71:17: sparse: sparse: Initializer entry defined twice
   fs/btrfs/extent-io-tree.c:71:17: sparse:   also defined here
>> fs/btrfs/extent-io-tree.c:71:17: sparse: sparse: Initializer entry defined twice
   fs/btrfs/extent-io-tree.c:71:17: sparse:   also defined here
>> fs/btrfs/extent-io-tree.c:71:17: sparse: sparse: Initializer entry defined twice
   fs/btrfs/extent-io-tree.c:71:17: sparse:   also defined here
--
   drivers/hid/hid-cherry.c: note: in included file:
>> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined twice
   include/linux/hid.h:1079:17: sparse:   also defined here
>> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined twice
   include/linux/hid.h:1079:17: sparse:   also defined here
--
   drivers/hid/hid-ezkey.c: note: in included file:
>> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined twice
   include/linux/hid.h:1079:17: sparse:   also defined here
>> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined twice
   include/linux/hid.h:1079:17: sparse:   also defined here
--
   drivers/hid/hid-monterey.c: note: in included file:
>> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined twice
   include/linux/hid.h:1079:17: sparse:   also defined here
>> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined twice
   include/linux/hid.h:1079:17: sparse:   also defined here
>> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined twice
   include/linux/hid.h:1079:17: sparse:   also defined here
--
   drivers/hid/hid-dr.c: note: in included file:
>> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined twice
   include/linux/hid.h:1079:17: sparse:   also defined here
--
   drivers/hid/hid-apple.c: note: in included file:
>> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined twice
   include/linux/hid.h:1079:17: sparse:   also defined here
>> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined twice
   include/linux/hid.h:1079:17: sparse:   also defined here
>> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined twice
   include/linux/hid.h:1079:17: sparse:   also defined here
--
   drivers/hid/hid-ite.c: note: in included file:
>> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined twice
   include/linux/hid.h:1079:17: sparse:   also defined here
--
   drivers/hid/hid-lcpower.c: note: in included file:
>> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined twice
   include/linux/hid.h:1079:17: sparse:   also defined here
>> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined twice
   include/linux/hid.h:1079:17: sparse:   also defined here
>> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined twice
   include/linux/hid.h:1079:17: sparse:   also defined here
>> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined twice
   include/linux/hid.h:1079:17: sparse:   also defined here
>> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined twice
   include/linux/hid.h:1079:17: sparse:   also defined here
>> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined twice
   include/linux/hid.h:1079:17: sparse:   also defined here
>> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined twice
   include/linux/hid.h:1079:17: sparse:   also defined here
--
   drivers/hid/hid-microsoft.c: note: in included file:
>> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined twice
   include/linux/hid.h:1079:17: sparse:   also defined here
>> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined twice
   include/linux/hid.h:1079:17: sparse:   also defined here
>> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined twice
   include/linux/hid.h:1079:17: sparse:   also defined here
>> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined twice
   include/linux/hid.h:1079:17: sparse:   also defined here
>> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined twice
   include/linux/hid.h:1079:17: sparse:   also defined here
>> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined twice
   include/linux/hid.h:1079:17: sparse:   also defined here
>> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined twice
   include/linux/hid.h:1079:17: sparse:   also defined here
>> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined twice
   include/linux/hid.h:1079:17: sparse:   also defined here
>> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined twice
   include/linux/hid.h:1079:17: sparse:   also defined here
>> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined twice
   include/linux/hid.h:1079:17: sparse:   also defined here
>> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined twice
   include/linux/hid.h:1079:17: sparse:   also defined here
--
   drivers/hid/hid-gyration.c: note: in included file:
>> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined twice
   include/linux/hid.h:1079:17: sparse:   also defined here
>> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined twice
   include/linux/hid.h:1079:17: sparse:   also defined here
>> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined twice
   include/linux/hid.h:1079:17: sparse:   also defined here
>> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined twice
   include/linux/hid.h:1079:17: sparse:   also defined here
>> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined twice
   include/linux/hid.h:1079:17: sparse:   also defined here
>> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined twice
   include/linux/hid.h:1079:17: sparse:   also defined here
>> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined twice
   include/linux/hid.h:1079:17: sparse:   also defined here
>> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined twice
   include/linux/hid.h:1079:17: sparse:   also defined here
>> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined twice
   include/linux/hid.h:1079:17: sparse:   also defined here
>> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined twice
   include/linux/hid.h:1079:17: sparse:   also defined here
>> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined twice
   include/linux/hid.h:1079:17: sparse:   also defined here
>> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined twice
   include/linux/hid.h:1079:17: sparse:   also defined here
--
   drivers/hid/hid-lenovo.c:786:58: sparse: sparse: cast to restricted __le32
   drivers/hid/hid-lenovo.c: note: in included file:
>> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined twice
   include/linux/hid.h:1079:17: sparse:   also defined here
>> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined twice
   include/linux/hid.h:1079:17: sparse:   also defined here
>> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined twice
   include/linux/hid.h:1079:17: sparse:   also defined here
>> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined twice
   include/linux/hid.h:1079:17: sparse:   also defined here
>> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined twice
   include/linux/hid.h:1079:17: sparse:   also defined here
>> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined twice
   include/linux/hid.h:1079:17: sparse:   also defined here
>> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined twice
   include/linux/hid.h:1079:17: sparse:   also defined here
>> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined twice
   include/linux/hid.h:1079:17: sparse:   also defined here
>> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined twice
   include/linux/hid.h:1079:17: sparse:   also defined here
>> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined twice
   include/linux/hid.h:1079:17: sparse:   also defined here
>> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined twice
   include/linux/hid.h:1079:17: sparse:   also defined here
>> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined twice
   include/linux/hid.h:1079:17: sparse:   also defined here
>> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined twice
   include/linux/hid.h:1079:17: sparse:   also defined here
>> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined twice
   include/linux/hid.h:1079:17: sparse:   also defined here
>> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined twice
   include/linux/hid.h:1079:17: sparse:   also defined here
>> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined twice
   include/linux/hid.h:1079:17: sparse:   also defined here
>> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined twice
   include/linux/hid.h:1079:17: sparse:   also defined here
>> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined twice
   include/linux/hid.h:1079:17: sparse:   also defined here
>> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined twice
   include/linux/hid.h:1079:17: sparse:   also defined here
>> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined twice
   include/linux/hid.h:1079:17: sparse:   also defined here
>> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined twice
   include/linux/hid.h:1079:17: sparse:   also defined here
>> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined twice
   include/linux/hid.h:1079:17: sparse:   also defined here
>> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined twice
   include/linux/hid.h:1079:17: sparse:   also defined here
>> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined twice
   include/linux/hid.h:1079:17: sparse:   also defined here
>> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined twice
   include/linux/hid.h:1079:17: sparse:   also defined here
>> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined twice
   include/linux/hid.h:1079:17: sparse:   also defined here
>> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined twice
   include/linux/hid.h:1079:17: sparse:   also defined here
>> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined twice
   include/linux/hid.h:1079:17: sparse:   also defined here
>> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined twice
   include/linux/hid.h:1079:17: sparse:   also defined here
>> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined twice
   include/linux/hid.h:1079:17: sparse:   also defined here
>> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined twice
   include/linux/hid.h:1079:17: sparse:   also defined here
>> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined twice
   include/linux/hid.h:1079:17: sparse:   also defined here
>> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined twice
   include/linux/hid.h:1079:17: sparse:   also defined here
>> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined twice
   include/linux/hid.h:1079:17: sparse:   also defined here
>> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined twice
   include/linux/hid.h:1079:17: sparse:   also defined here
>> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined twice
   include/linux/hid.h:1079:17: sparse:   also defined here
>> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined twice
   include/linux/hid.h:1079:17: sparse:   also defined here
>> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined twice
   include/linux/hid.h:1079:17: sparse:   also defined here
>> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined twice
   include/linux/hid.h:1079:17: sparse:   also defined here
>> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined twice
   include/linux/hid.h:1079:17: sparse:   also defined here
>> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined twice
   include/linux/hid.h:1079:17: sparse:   also defined here
>> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined twice
   include/linux/hid.h:1079:17: sparse:   also defined here
--
   drivers/hid/hid-input.c: note: in included file:
>> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined twice
   include/linux/hid.h:1079:17: sparse:   also defined here
>> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined twice
   include/linux/hid.h:1079:17: sparse:   also defined here
>> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined twice
   include/linux/hid.h:1079:17: sparse:   also defined here
>> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined twice
   include/linux/hid.h:1079:17: sparse:   also defined here
>> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined twice
   include/linux/hid.h:1079:17: sparse:   also defined here
>> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined twice
   include/linux/hid.h:1079:17: sparse:   also defined here
>> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined twice
   include/linux/hid.h:1079:17: sparse:   also defined here
>> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined twice
   include/linux/hid.h:1079:17: sparse:   also defined here
>> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined twice
   include/linux/hid.h:1079:17: sparse:   also defined here
>> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined twice
   include/linux/hid.h:1079:17: sparse:   also defined here
>> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined twice
   include/linux/hid.h:1079:17: sparse:   also defined here
>> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined twice
   include/linux/hid.h:1079:17: sparse:   also defined here
>> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined twice
   include/linux/hid.h:1079:17: sparse:   also defined here
>> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined twice
   include/linux/hid.h:1079:17: sparse:   also defined here
>> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined twice
   include/linux/hid.h:1079:17: sparse:   also defined here
>> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined twice
   include/linux/hid.h:1079:17: sparse:   also defined here
>> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined twice
   include/linux/hid.h:1079:17: sparse:   also defined here
>> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined twice
   include/linux/hid.h:1079:17: sparse:   also defined here
>> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined twice
   include/linux/hid.h:1079:17: sparse:   also defined here
>> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined twice
   include/linux/hid.h:1079:17: sparse:   also defined here
>> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined twice
   include/linux/hid.h:1079:17: sparse:   also defined here
>> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined twice
   include/linux/hid.h:1079:17: sparse:   also defined here
>> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined twice
   include/linux/hid.h:1079:17: sparse:   also defined here
>> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined twice
   include/linux/hid.h:1079:17: sparse:   also defined here
>> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined twice
   include/linux/hid.h:1079:17: sparse:   also defined here
>> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined twice
   include/linux/hid.h:1079:17: sparse:   also defined here
>> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined twice
   include/linux/hid.h:1079:17: sparse:   also defined here
>> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined twice
   include/linux/hid.h:1079:17: sparse:   also defined here
>> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined twice
   include/linux/hid.h:1079:17: sparse:   also defined here
>> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined twice
   include/linux/hid.h:1079:17: sparse:   also defined here
>> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined twice
   include/linux/hid.h:1079:17: sparse:   also defined here
>> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined twice
   include/linux/hid.h:1079:17: sparse:   also defined here
>> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined twice
   include/linux/hid.h:1079:17: sparse:   also defined here
>> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined twice
   include/linux/hid.h:1079:17: sparse:   also defined here
>> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined twice
   include/linux/hid.h:1079:17: sparse:   also defined here
>> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined twice
   include/linux/hid.h:1079:17: sparse:   also defined here
>> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined twice
   include/linux/hid.h:1079:17: sparse:   also defined here
>> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined twice
   include/linux/hid.h:1079:17: sparse:   also defined here
>> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined twice
   include/linux/hid.h:1079:17: sparse:   also defined here
>> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined twice
   include/linux/hid.h:1079:17: sparse:   also defined here
>> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined twice
   include/linux/hid.h:1079:17: sparse:   also defined here
>> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined twice
   include/linux/hid.h:1079:17: sparse:   also defined here
>> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined twice
   include/linux/hid.h:1079:17: sparse:   also defined here
>> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined twice
   include/linux/hid.h:1079:17: sparse:   also defined here
>> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined twice
   include/linux/hid.h:1079:17: sparse:   also defined here
>> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined twice
   include/linux/hid.h:1079:17: sparse:   also defined here
>> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined twice
   include/linux/hid.h:1079:17: sparse:   also defined here
>> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined twice
   include/linux/hid.h:1079:17: sparse:   also defined here
>> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined twice
   include/linux/hid.h:1079:17: sparse:   also defined here
>> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined twice
   include/linux/hid.h:1079:17: sparse:   also defined here
>> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined twice
   include/linux/hid.h:1079:17: sparse:   also defined here
>> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined twice
   include/linux/hid.h:1079:17: sparse:   also defined here
>> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined twice
   include/linux/hid.h:1079:17: sparse:   also defined here
>> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined twice
   include/linux/hid.h:1079:17: sparse:   also defined here
>> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined twice
   include/linux/hid.h:1079:17: sparse:   also defined here
>> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined twice
   include/linux/hid.h:1079:17: sparse:   also defined here
>> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined twice
   include/linux/hid.h:1079:17: sparse:   also defined here
>> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined twice
   include/linux/hid.h:1079:17: sparse:   also defined here
>> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined twice
   include/linux/hid.h:1079:17: sparse:   also defined here
>> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined twice
   include/linux/hid.h:1079:17: sparse:   also defined here
>> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined twice
   include/linux/hid.h:1079:17: sparse:   also defined here
>> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined twice
   include/linux/hid.h:1079:17: sparse:   also defined here
>> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined twice
   include/linux/hid.h:1079:17: sparse:   also defined here
>> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined twice
   include/linux/hid.h:1079:17: sparse:   also defined here
>> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined twice
   include/linux/hid.h:1079:17: sparse:   also defined here
>> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined twice
   include/linux/hid.h:1079:17: sparse:   also defined here
>> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined twice
   include/linux/hid.h:1079:17: sparse:   also defined here
>> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined twice
   include/linux/hid.h:1079:17: sparse:   also defined here
>> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined twice
   include/linux/hid.h:1079:17: sparse:   also defined here
>> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined twice
   include/linux/hid.h:1079:17: sparse:   also defined here
>> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined twice
   include/linux/hid.h:1079:17: sparse:   also defined here
>> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined twice
   include/linux/hid.h:1079:17: sparse:   also defined here
>> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined twice
   include/linux/hid.h:1079:17: sparse:   also defined here
>> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined twice
   include/linux/hid.h:1079:17: sparse:   also defined here
>> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined twice
   include/linux/hid.h:1079:17: sparse:   also defined here
>> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined twice
   include/linux/hid.h:1079:17: sparse:   also defined here
>> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined twice
   include/linux/hid.h:1079:17: sparse:   also defined here
>> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined twice
   include/linux/hid.h:1079:17: sparse:   also defined here
>> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined twice
   include/linux/hid.h:1079:17: sparse:   also defined here
>> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined twice
   include/linux/hid.h:1079:17: sparse:   also defined here
>> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined twice
   include/linux/hid.h:1079:17: sparse:   also defined here
>> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined twice
   include/linux/hid.h:1079:17: sparse:   also defined here
>> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined twice
   include/linux/hid.h:1079:17: sparse:   also defined here
>> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined twice
   include/linux/hid.h:1079:17: sparse:   also defined here
>> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined twice
   include/linux/hid.h:1079:17: sparse:   also defined here
>> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined twice
   include/linux/hid.h:1079:17: sparse:   also defined here
>> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined twice
   include/linux/hid.h:1079:17: sparse:   also defined here
>> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined twice
   include/linux/hid.h:1079:17: sparse:   also defined here
>> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined twice
   include/linux/hid.h:1079:17: sparse:   also defined here
>> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined twice
   include/linux/hid.h:1079:17: sparse:   also defined here
>> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined twice
   include/linux/hid.h:1079:17: sparse:   also defined here
>> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined twice
   include/linux/hid.h:1079:17: sparse:   also defined here
>> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined twice
   include/linux/hid.h:1079:17: sparse:   also defined here
>> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined twice
   include/linux/hid.h:1079:17: sparse:   also defined here
>> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined twice
   include/linux/hid.h:1079:17: sparse:   also defined here
>> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined twice
   include/linux/hid.h:1079:17: sparse:   also defined here
>> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined twice
   include/linux/hid.h:1079:17: sparse:   also defined here
>> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined twice
   include/linux/hid.h:1079:17: sparse:   also defined here
>> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined twice
   include/linux/hid.h:1079:17: sparse:   also defined here
>> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined twice
   include/linux/hid.h:1079:17: sparse:   also defined here
>> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined twice
   include/linux/hid.h:1079:17: sparse:   also defined here
>> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined twice
   include/linux/hid.h:1079:17: sparse:   also defined here
>> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined twice
   include/linux/hid.h:1079:17: sparse:   also defined here
>> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined twice
   include/linux/hid.h:1079:17: sparse:   also defined here
>> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined twice
   include/linux/hid.h:1079:17: sparse:   also defined here
>> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined twice
   include/linux/hid.h:1079:17: sparse:   also defined here
>> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined twice
   include/linux/hid.h:1079:17: sparse:   also defined here
>> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined twice
   include/linux/hid.h:1079:17: sparse:   also defined here
>> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined twice
   include/linux/hid.h:1079:17: sparse:   also defined here
>> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined twice
   include/linux/hid.h:1079:17: sparse:   also defined here
>> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined twice
   include/linux/hid.h:1079:17: sparse:   also defined here
>> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined twice
   include/linux/hid.h:1079:17: sparse:   also defined here
>> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined twice
   include/linux/hid.h:1079:17: sparse:   also defined here
>> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined twice
   include/linux/hid.h:1079:17: sparse:   also defined here
>> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined twice
   include/linux/hid.h:1079:17: sparse:   also defined here
>> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined twice
   include/linux/hid.h:1079:17: sparse:   also defined here
>> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined twice
   include/linux/hid.h:1079:17: sparse:   also defined here
>> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined twice
   include/linux/hid.h:1079:17: sparse:   also defined here
>> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined twice
   include/linux/hid.h:1079:17: sparse:   also defined here
>> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined twice
   include/linux/hid.h:1079:17: sparse:   also defined here
>> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined twice
   include/linux/hid.h:1079:17: sparse:   also defined here
>> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined twice
   include/linux/hid.h:1079:17: sparse:   also defined here
>> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined twice
   include/linux/hid.h:1079:17: sparse:   also defined here
>> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined twice
   include/linux/hid.h:1079:17: sparse:   also defined here
>> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined twice
   include/linux/hid.h:1079:17: sparse:   also defined here
>> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined twice
   include/linux/hid.h:1079:17: sparse:   also defined here
>> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined twice
   include/linux/hid.h:1079:17: sparse:   also defined here
>> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined twice
   include/linux/hid.h:1079:17: sparse:   also defined here
>> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined twice
   include/linux/hid.h:1079:17: sparse:   also defined here
>> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined twice
   include/linux/hid.h:1079:17: sparse:   also defined here
>> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined twice
   include/linux/hid.h:1079:17: sparse:   also defined here
>> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined twice
   include/linux/hid.h:1079:17: sparse:   also defined here
>> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined twice
   include/linux/hid.h:1079:17: sparse:   also defined here
>> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined twice
   include/linux/hid.h:1079:17: sparse:   also defined here
>> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined twice
   include/linux/hid.h:1079:17: sparse:   also defined here
>> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined twice
   include/linux/hid.h:1079:17: sparse:   also defined here
>> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined twice
   include/linux/hid.h:1079:17: sparse:   also defined here
>> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined twice
   include/linux/hid.h:1079:17: sparse:   also defined here
>> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined twice
   include/linux/hid.h:1079:17: sparse:   also defined here
>> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined twice
   include/linux/hid.h:1079:17: sparse:   also defined here
>> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined twice
   include/linux/hid.h:1079:17: sparse:   also defined here
>> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined twice
   include/linux/hid.h:1079:17: sparse:   also defined here
>> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined twice
   include/linux/hid.h:1079:17: sparse:   also defined here
>> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined twice
   include/linux/hid.h:1079:17: sparse:   also defined here
>> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined twice
   include/linux/hid.h:1079:17: sparse:   also defined here
>> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined twice
   include/linux/hid.h:1079:17: sparse:   also defined here
>> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined twice
   include/linux/hid.h:1079:17: sparse:   also defined here
>> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined twice
   include/linux/hid.h:1079:17: sparse:   also defined here
>> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined twice
   include/linux/hid.h:1079:17: sparse:   also defined here
>> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined twice
   include/linux/hid.h:1079:17: sparse:   also defined here
>> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined twice
   include/linux/hid.h:1079:17: sparse:   also defined here
>> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined twice
   include/linux/hid.h:1079:17: sparse:   also defined here
>> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined twice
   include/linux/hid.h:1079:17: sparse:   also defined here
>> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined twice
   include/linux/hid.h:1079:17: sparse:   also defined here
>> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined twice
   include/linux/hid.h:1079:17: sparse:   also defined here
>> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined twice
   include/linux/hid.h:1079:17: sparse:   also defined here
>> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined twice
   include/linux/hid.h:1079:17: sparse:   also defined here
>> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined twice
   include/linux/hid.h:1079:17: sparse:   also defined here
>> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined twice
   include/linux/hid.h:1079:17: sparse:   also defined here
>> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined twice
   include/linux/hid.h:1079:17: sparse:   also defined here
>> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined twice
   include/linux/hid.h:1079:17: sparse:   also defined here
>> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined twice
   include/linux/hid.h:1079:17: sparse:   also defined here
>> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined twice
   include/linux/hid.h:1079:17: sparse:   also defined here
>> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined twice
   include/linux/hid.h:1079:17: sparse:   also defined here
>> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined twice
   include/linux/hid.h:1079:17: sparse:   also defined here
>> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined twice
   include/linux/hid.h:1079:17: sparse:   also defined here
>> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined twice
   include/linux/hid.h:1079:17: sparse:   also defined here
>> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined twice
   include/linux/hid.h:1079:17: sparse:   also defined here
>> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined twice
   include/linux/hid.h:1079:17: sparse:   also defined here
>> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined twice
   include/linux/hid.h:1079:17: sparse:   also defined here
>> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined twice
   include/linux/hid.h:1079:17: sparse:   also defined here
>> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined twice
   include/linux/hid.h:1079:17: sparse:   also defined here
>> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined twice
   include/linux/hid.h:1079:17: sparse:   also defined here
>> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined twice
   include/linux/hid.h:1079:17: sparse:   also defined here
>> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined twice
   include/linux/hid.h:1079:17: sparse:   also defined here
>> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined twice
   include/linux/hid.h:1079:17: sparse:   also defined here
>> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined twice
   include/linux/hid.h:1079:17: sparse:   also defined here
>> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined twice
   include/linux/hid.h:1079:17: sparse:   also defined here
>> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined twice
   include/linux/hid.h:1079:17: sparse:   also defined here
>> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined twice
   include/linux/hid.h:1079:17: sparse:   also defined here
>> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined twice
   include/linux/hid.h:1079:17: sparse:   also defined here
>> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined twice
   include/linux/hid.h:1079:17: sparse:   also defined here
>> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined twice
   include/linux/hid.h:1079:17: sparse:   also defined here
>> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined twice
   include/linux/hid.h:1079:17: sparse:   also defined here
>> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined twice
   include/linux/hid.h:1079:17: sparse:   also defined here
>> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined twice
   include/linux/hid.h:1079:17: sparse:   also defined here
>> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined twice
   include/linux/hid.h:1079:17: sparse:   also defined here
>> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined twice
   include/linux/hid.h:1079:17: sparse:   also defined here
>> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined twice
   include/linux/hid.h:1079:17: sparse:   also defined here
>> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined twice
   include/linux/hid.h:1079:17: sparse:   also defined here
>> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined twice
   include/linux/hid.h:1079:17: sparse:   also defined here
>> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined twice
   include/linux/hid.h:1079:17: sparse:   also defined here
>> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined twice
   include/linux/hid.h:1079:17: sparse:   also defined here
>> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined twice
   include/linux/hid.h:1079:17: sparse:   also defined here
>> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined twice
   include/linux/hid.h:1079:17: sparse:   also defined here
>> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined twice
   include/linux/hid.h:1079:17: sparse:   also defined here
>> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined twice
   include/linux/hid.h:1079:17: sparse:   also defined here
>> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined twice
   include/linux/hid.h:1079:17: sparse:   also defined here
>> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined twice
   include/linux/hid.h:1079:17: sparse:   also defined here
>> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined twice
   include/linux/hid.h:1079:17: sparse:   also defined here
>> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined twice
   include/linux/hid.h:1079:17: sparse:   also defined here
>> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined twice
   include/linux/hid.h:1079:17: sparse:   also defined here
>> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined twice
   include/linux/hid.h:1079:17: sparse:   also defined here
>> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined twice
   include/linux/hid.h:1079:17: sparse:   also defined here
>> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined twice
   include/linux/hid.h:1079:17: sparse:   also defined here
>> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined twice
   include/linux/hid.h:1079:17: sparse:   also defined here
>> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined twice
   include/linux/hid.h:1079:17: sparse:   also defined here
>> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined twice
   include/linux/hid.h:1079:17: sparse:   also defined here
>> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined twice
   include/linux/hid.h:1079:17: sparse:   also defined here
>> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined twice
   include/linux/hid.h:1079:17: sparse:   also defined here
>> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined twice
   include/linux/hid.h:1079:17: sparse:   also defined here
>> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined twice
   include/linux/hid.h:1079:17: sparse:   also defined here
>> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined twice
   include/linux/hid.h:1079:17: sparse:   also defined here
>> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined twice
   include/linux/hid.h:1079:17: sparse:   also defined here
>> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined twice
   include/linux/hid.h:1079:17: sparse:   also defined here
>> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined twice
   include/linux/hid.h:1079:17: sparse:   also defined here
>> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined twice
   include/linux/hid.h:1079:17: sparse:   also defined here
>> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined twice
   include/linux/hid.h:1079:17: sparse:   also defined here
>> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined twice
   include/linux/hid.h:1079:17: sparse:   also defined here
>> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined twice
   include/linux/hid.h:1079:17: sparse:   also defined here
>> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined twice
   include/linux/hid.h:1079:17: sparse:   also defined here
>> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined twice
   include/linux/hid.h:1079:17: sparse:   also defined here
>> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined twice
   include/linux/hid.h:1079:17: sparse:   also defined here
>> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined twice
   include/linux/hid.h:1079:17: sparse:   also defined here
>> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined twice
   include/linux/hid.h:1079:17: sparse:   also defined here
>> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined twice
   include/linux/hid.h:1079:17: sparse:   also defined here
>> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined twice
   include/linux/hid.h:1079:17: sparse:   also defined here
>> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined twice
   include/linux/hid.h:1079:17: sparse:   also defined here
>> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined twice
   include/linux/hid.h:1079:17: sparse:   also defined here
>> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined twice
   include/linux/hid.h:1079:17: sparse:   also defined here
>> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined twice
   include/linux/hid.h:1079:17: sparse:   also defined here
>> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined twice
   include/linux/hid.h:1079:17: sparse:   also defined here
>> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined twice
   include/linux/hid.h:1079:17: sparse:   also defined here
>> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined twice
   include/linux/hid.h:1079:17: sparse:   also defined here
>> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined twice
   include/linux/hid.h:1079:17: sparse:   also defined here
>> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined twice
   include/linux/hid.h:1079:17: sparse:   also defined here
>> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined twice
   include/linux/hid.h:1079:17: sparse:   also defined here
>> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined twice
   include/linux/hid.h:1079:17: sparse:   also defined here
>> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined twice
   include/linux/hid.h:1079:17: sparse:   also defined here
>> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined twice
   include/linux/hid.h:1079:17: sparse:   also defined here
>> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined twice
   include/linux/hid.h:1079:17: sparse:   also defined here
>> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined twice
   include/linux/hid.h:1079:17: sparse:   also defined here
>> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined twice
   include/linux/hid.h:1079:17: sparse:   also defined here
>> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined twice
   include/linux/hid.h:1079:17: sparse:   also defined here
>> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined twice
   include/linux/hid.h:1079:17: sparse:   also defined here
>> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined twice
   include/linux/hid.h:1079:17: sparse:   also defined here
>> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined twice
   include/linux/hid.h:1079:17: sparse:   also defined here
>> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined twice
   include/linux/hid.h:1079:17: sparse:   also defined here
>> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined twice
   include/linux/hid.h:1079:17: sparse:   also defined here
>> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined twice
   include/linux/hid.h:1079:17: sparse:   also defined here
>> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined twice
   include/linux/hid.h:1079:17: sparse:   also defined here
>> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined twice
   include/linux/hid.h:1079:17: sparse:   also defined here
>> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined twice
   include/linux/hid.h:1079:17: sparse:   also defined here
>> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined twice
   include/linux/hid.h:1079:17: sparse:   also defined here
>> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined twice
   include/linux/hid.h:1079:17: sparse:   also defined here
>> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined twice
   include/linux/hid.h:1079:17: sparse:   also defined here
>> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined twice
   include/linux/hid.h:1079:17: sparse:   also defined here
>> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined twice
   include/linux/hid.h:1079:17: sparse:   also defined here
>> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined twice
   include/linux/hid.h:1079:17: sparse:   also defined here
>> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined twice
   include/linux/hid.h:1079:17: sparse:   also defined here
>> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined twice
   include/linux/hid.h:1079:17: sparse:   also defined here
>> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined twice
   include/linux/hid.h:1079:17: sparse:   also defined here
>> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined twice
   include/linux/hid.h:1079:17: sparse:   also defined here
>> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined twice
   include/linux/hid.h:1079:17: sparse:   also defined here
>> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined twice
   include/linux/hid.h:1079:17: sparse:   also defined here
>> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined twice
   include/linux/hid.h:1079:17: sparse:   also defined here
>> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined twice
   include/linux/hid.h:1079:17: sparse:   also defined here
>> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined twice
   include/linux/hid.h:1079:17: sparse:   also defined here
>> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined twice
   include/linux/hid.h:1079:17: sparse:   also defined here
--
   drivers/hid/hid-petalynx.c: note: in included file:
>> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined twice
   include/linux/hid.h:1079:17: sparse:   also defined here
>> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined twice
   include/linux/hid.h:1079:17: sparse:   also defined here
>> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined twice
   include/linux/hid.h:1079:17: sparse:   also defined here
>> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined twice
   include/linux/hid.h:1079:17: sparse:   also defined here
>> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined twice
   include/linux/hid.h:1079:17: sparse:   also defined here
>> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined twice
   include/linux/hid.h:1079:17: sparse:   also defined here
--
   drivers/hid/hid-razer.c: note: in included file:
>> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined twice
   include/linux/hid.h:1079:17: sparse:   also defined here
>> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined twice
   include/linux/hid.h:1079:17: sparse:   also defined here
>> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined twice
   include/linux/hid.h:1079:17: sparse:   also defined here
>> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined twice
   include/linux/hid.h:1079:17: sparse:   also defined here
--
   drivers/hid/hid-topseed.c: note: in included file:
>> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined twice
   include/linux/hid.h:1079:17: sparse:   also defined here
>> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined twice
   include/linux/hid.h:1079:17: sparse:   also defined here
>> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined twice
   include/linux/hid.h:1079:17: sparse:   also defined here
>> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined twice
   include/linux/hid.h:1079:17: sparse:   also defined here
>> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined twice
   include/linux/hid.h:1079:17: sparse:   also defined here
>> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined twice
   include/linux/hid.h:1079:17: sparse:   also defined here
>> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined twice
   include/linux/hid.h:1079:17: sparse:   also defined here
>> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined twice
   include/linux/hid.h:1079:17: sparse:   also defined here
>> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined twice
   include/linux/hid.h:1079:17: sparse:   also defined here
>> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined twice
   include/linux/hid.h:1079:17: sparse:   also defined here
>> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined twice
   include/linux/hid.h:1079:17: sparse:   also defined here
>> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined twice
   include/linux/hid.h:1079:17: sparse:   also defined here
>> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined twice
   include/linux/hid.h:1079:17: sparse:   also defined here
>> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined twice
   include/linux/hid.h:1079:17: sparse:   also defined here
>> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined twice
   include/linux/hid.h:1079:17: sparse:   also defined here
>> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined twice
   include/linux/hid.h:1079:17: sparse:   also defined here
>> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined twice
   include/linux/hid.h:1079:17: sparse:   also defined here
>> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined twice
   include/linux/hid.h:1079:17: sparse:   also defined here
>> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined twice
   include/linux/hid.h:1079:17: sparse:   also defined here
>> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined twice
   include/linux/hid.h:1079:17: sparse:   also defined here
>> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined twice
   include/linux/hid.h:1079:17: sparse:   also defined here
--
   drivers/hid/hid-twinhan.c: note: in included file:
>> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined twice
   include/linux/hid.h:1079:17: sparse:   also defined here
>> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined twice
   include/linux/hid.h:1079:17: sparse:   also defined here
>> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined twice
   include/linux/hid.h:1079:17: sparse:   also defined here
>> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined twice
   include/linux/hid.h:1079:17: sparse:   also defined here
>> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined twice
   include/linux/hid.h:1079:17: sparse:   also defined here
>> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined twice
   include/linux/hid.h:1079:17: sparse:   also defined here
>> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined twice
   include/linux/hid.h:1079:17: sparse:   also defined here
>> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined twice
   include/linux/hid.h:1079:17: sparse:   also defined here
>> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined twice
   include/linux/hid.h:1079:17: sparse:   also defined here
>> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined twice
   include/linux/hid.h:1079:17: sparse:   also defined here
>> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined twice
   include/linux/hid.h:1079:17: sparse:   also defined here
>> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined twice
   include/linux/hid.h:1079:17: sparse:   also defined here
>> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined twice
   include/linux/hid.h:1079:17: sparse:   also defined here
>> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined twice
   include/linux/hid.h:1079:17: sparse:   also defined here
>> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined twice
   include/linux/hid.h:1079:17: sparse:   also defined here
>> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined twice
   include/linux/hid.h:1079:17: sparse:   also defined here
>> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined twice
   include/linux/hid.h:1079:17: sparse:   also defined here
>> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined twice
   include/linux/hid.h:1079:17: sparse:   also defined here
>> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined twice
   include/linux/hid.h:1079:17: sparse:   also defined here
>> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined twice
   include/linux/hid.h:1079:17: sparse:   also defined here
>> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined twice
   include/linux/hid.h:1079:17: sparse:   also defined here
>> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined twice
   include/linux/hid.h:1079:17: sparse:   also defined here
>> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined twice
   include/linux/hid.h:1079:17: sparse:   also defined here
>> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined twice
   include/linux/hid.h:1079:17: sparse:   also defined here
>> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined twice
   include/linux/hid.h:1079:17: sparse:   also defined here
>> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined twice
   include/linux/hid.h:1079:17: sparse:   also defined here
>> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined twice
   include/linux/hid.h:1079:17: sparse:   also defined here
>> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined twice
   include/linux/hid.h:1079:17: sparse:   also defined here
>> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined twice
   include/linux/hid.h:1079:17: sparse:   also defined here
>> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined twice
   include/linux/hid.h:1079:17: sparse:   also defined here
>> include/linux/hid.h:1079:17: sparse: sparse: Initializer entry defined twice
   include/linux/hid.h:1079:17: sparse:   also defined here

vim +71 fs/btrfs/extent-io-tree.c

6962541e964ff3 Josef Bacik  2022-09-09  55  
d8038a1f46f376 Josef Bacik  2022-09-09  56  #define btrfs_debug_check_extent_io_range(tree, start, end)		\
d8038a1f46f376 Josef Bacik  2022-09-09  57  	__btrfs_debug_check_extent_io_range(__func__, (tree), (start), (end))
d8038a1f46f376 Josef Bacik  2022-09-09  58  static inline void __btrfs_debug_check_extent_io_range(const char *caller,
d8038a1f46f376 Josef Bacik  2022-09-09  59  						       struct extent_io_tree *tree,
d8038a1f46f376 Josef Bacik  2022-09-09  60  						       u64 start, u64 end)
6962541e964ff3 Josef Bacik  2022-09-09  61  {
738290c056e28d David Sterba 2023-11-21  62  	const struct btrfs_inode *inode;
6962541e964ff3 Josef Bacik  2022-09-09  63  	u64 isize;
6962541e964ff3 Josef Bacik  2022-09-09  64  
738290c056e28d David Sterba 2023-11-21  65  	if (tree->owner != IO_TREE_INODE_IO)
6962541e964ff3 Josef Bacik  2022-09-09  66  		return;
6962541e964ff3 Josef Bacik  2022-09-09  67  
738290c056e28d David Sterba 2023-11-21  68  	inode = extent_io_tree_to_inode_const(tree);
0988fc7bda79fe David Sterba 2022-10-28  69  	isize = i_size_read(&inode->vfs_inode);
6962541e964ff3 Josef Bacik  2022-09-09  70  	if (end >= PAGE_SIZE && (end % 2) == 0 && end != isize - 1) {
0988fc7bda79fe David Sterba 2022-10-28 @71  		btrfs_debug_rl(inode->root->fs_info,
6962541e964ff3 Josef Bacik  2022-09-09  72  		    "%s: ino %llu isize %llu odd range [%llu,%llu]",
0988fc7bda79fe David Sterba 2022-10-28  73  			caller, btrfs_ino(inode), isize, start, end);
6962541e964ff3 Josef Bacik  2022-09-09  74  	}
6962541e964ff3 Josef Bacik  2022-09-09  75  }
83cf709a89fb97 Josef Bacik  2022-09-09  76  #else
83cf709a89fb97 Josef Bacik  2022-09-09  77  #define btrfs_leak_debug_add_state(state)		do {} while (0)
83cf709a89fb97 Josef Bacik  2022-09-09  78  #define btrfs_leak_debug_del_state(state)		do {} while (0)
83cf709a89fb97 Josef Bacik  2022-09-09  79  #define btrfs_extent_state_leak_debug_check()		do {} while (0)
d8038a1f46f376 Josef Bacik  2022-09-09  80  #define btrfs_debug_check_extent_io_range(c, s, e)	do {} while (0)
83cf709a89fb97 Josef Bacik  2022-09-09  81  #endif
83cf709a89fb97 Josef Bacik  2022-09-09  82  
83cf709a89fb97 Josef Bacik  2022-09-09  83  

:::::: The code at line 71 was first introduced by commit
:::::: 0988fc7bda79feff046056f032fd149ab08e03d1 btrfs: switch extent_io_tree::private_data to btrfs_inode and rename

:::::: TO: David Sterba <dsterba@suse.com>
:::::: CC: David Sterba <dsterba@suse.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
