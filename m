Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 848C43DDDA5
	for <oe-kbuild-all@lists.linux.dev>; Wed, 11 Mar 2026 11:36:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773229017; cv=none; b=QgvSWVeZhqTgMQsoSK2vN6wLwtmnT2HyuDUHIBwFKhv3x4Mb6iepRSIiBAgofK5J1WLTGuOftAnQNkqGUNX/qPlQY9syP9aZblLLfHtCf/VxBfeLxFqDJc3tpeFzRau4anELMqcrMEho+tVKT6EhNl8IN7KhtsgcWKV29BcLdI8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773229017; c=relaxed/simple;
	bh=ZiFugM8IYTVB4HYjxCXF6jN5jhxXG81vzcbxDK3wYBo=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ugxfy9TsqnCcsLd3d9sryGxQkc1HI2Zz5FVxPP0wLQHw9+f1sMTRf6kwZqN5EFhgncljvqXXMi4Aj2V2uG3Y4zhpB0SakWoOHMJ/R/D3VwQKYQP+gX1HIiJP8DWDrOzflPWV8NFGqCPlC6lKZK/02C35pRsgsNGm58RGG1qBDbg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ds0Z18GW; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ds0Z18GW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773229016; x=1804765016;
  h=date:from:to:cc:subject:message-id;
  bh=ZiFugM8IYTVB4HYjxCXF6jN5jhxXG81vzcbxDK3wYBo=;
  b=ds0Z18GWZJ5EK89UMY8fQpTQHNv6a/TJ1l3+f0u8EPfSWbb4eFPb1wIU
   bu26I0JOT7Tx/QZQyTWLJx4mgThogShsbW4IhDx2/frYTo5GzEm7KcaR+
   lsQP1wgekfQYTcTE4kO1xrOCXkIhUDzFxH8hjn+i2mKB9tarAKnCHFSLU
   JwIn329Wnnv3UWb9v8+ewCN6k3P1bKlj4RXsfFo92IzKSJnrYhBqQx2Oa
   8Iqv80TdOylSpRTUmJIjmPW3kckI5wRiG3l/AJa4nuPCDkbgfHBYuveTj
   I2Bv8JnXzpGItPc9rRTcWtY5/D7SXeLbJA8M1zb2RWgqLdHs/5yzE+diV
   g==;
X-CSE-ConnectionGUID: 5xuB4Y/4RLG4k5nvvPO95w==
X-CSE-MsgGUID: f51/JTOmS5CFo2tzzq0+LA==
X-IronPort-AV: E=McAfee;i="6800,10657,11725"; a="85380433"
X-IronPort-AV: E=Sophos;i="6.23,113,1770624000"; 
   d="scan'208";a="85380433"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Mar 2026 04:36:55 -0700
X-CSE-ConnectionGUID: KyevOgDSRY+ism7ERzzrng==
X-CSE-MsgGUID: xpK3ZtehQhynKIMcLQlK+w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,113,1770624000"; 
   d="scan'208";a="220492085"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by orviesa008.jf.intel.com with ESMTP; 11 Mar 2026 04:36:52 -0700
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w0Hrv-000000003Jd-1YIX;
	Wed, 11 Mar 2026 11:36:51 +0000
Date: Wed, 11 Mar 2026 12:36:01 +0100
From: kernel test robot <lkp@intel.com>
To: Chao Yu <chao@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chao:bugfix/syzbot 3/3] Warning: fs/f2fs/segment.c:1883
 function parameter 'need_check' not described in 'f2fs_issue_discard_timeout'
Message-ID: <202603111228.nhgkHXs0-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/chao/linux.git bugfix/syzbot
head:   17fdc33a1b6d3096e7f1788c4c45e412f3919dc6
commit: 17fdc33a1b6d3096e7f1788c4c45e412f3919dc6 [3/3] f2fs: fix to do sanity check on dcc->discard_cmd_cnt conditionally
config: x86_64-rhel-9.4 (https://download.01.org/0day-ci/archive/20260311/202603111228.nhgkHXs0-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260311/202603111228.nhgkHXs0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603111228.nhgkHXs0-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: fs/f2fs/segment.c:1883 function parameter 'need_check' not described in 'f2fs_issue_discard_timeout'
>> Warning: fs/f2fs/segment.c:1883 function parameter 'need_check' not described in 'f2fs_issue_discard_timeout'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
