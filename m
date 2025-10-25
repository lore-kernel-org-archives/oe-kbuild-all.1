Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5252F2C3256
	for <oe-kbuild-all@lists.linux.dev>; Sat, 25 Oct 2025 08:59:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761382795; cv=none; b=ep27MgWzcJy84MMhGYl2sl4+JjpSIci2mG6jgGwAzgqBVGMYcxKVksR9TVRpWp9U7V7N9WjvFWIVo0prxzP1rMHfcCUtkQzTte7Se8ssE3UKBJAt4e/tfCi1gQSCjz8HKE9vj6z1lM1oC7lq5ir1trrv1aFxymTYwRFUjUgRK2s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761382795; c=relaxed/simple;
	bh=kjvRg9KbAGdUpQ5UopeZiytslJJ/qVE6Q3bBwusjQEk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=JKJkJJTYlbTYq0cRmVCYnwom9LUcu6OS1lBI9GuqmMbJ4TuWFZOVhAAYNo0SWV8IpHeagkSZeXibvaQ9+xmFqw1xgGc6UJjfvPgSAOXhN2326uJrr3Jq02WNzyU0TRexYWUk8HSl4XEm0bbb3Ye0oVB2qkP3F/SStK9jPgiIU9A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dZOgTDYc; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dZOgTDYc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761382794; x=1792918794;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=kjvRg9KbAGdUpQ5UopeZiytslJJ/qVE6Q3bBwusjQEk=;
  b=dZOgTDYcODhx5GqI5wsHZxbtNbP8jNlWu83mZY6WCNZ1kXuW8c+aHBBY
   jg4kf4IH7ZCv+cocf4xu+ZQx56zBzhtsJRm69fWYlhzyN0xMcyYPvX57a
   dqVzqNF8nhWXy+uIYxT5eIx3p2qgNYWDvLCl68AIJgU8AwQl6mD0g205g
   mUG5jt/cnKvenCUqj+CvGfnWG0XN5Dacu1xn4JsMxjSoVFzqNGLCipID2
   Ks1ItIZZYiven/xVUaZL5i34wuqqf8fAOJMzN7jJYfQUTJoJAshI0fBsb
   I0Tr+J6va02gXN36nCcrC0fMLEzsNIAytCllwiqBTa7Jq0Szlf68qy6Vf
   A==;
X-CSE-ConnectionGUID: QvU3IEL5SG65RB7taIRR+g==
X-CSE-MsgGUID: OnvPHUyFT1yGfcKIYH3efw==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="62755055"
X-IronPort-AV: E=Sophos;i="6.19,254,1754982000"; 
   d="scan'208";a="62755055"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Oct 2025 01:59:53 -0700
X-CSE-ConnectionGUID: MowbpbMFRKS1T46ANBXuhA==
X-CSE-MsgGUID: Vj8S+tCbSC2e9gn3rDlPQw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,254,1754982000"; 
   d="scan'208";a="215522149"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa001.fm.intel.com with ESMTP; 25 Oct 2025 01:59:52 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vCa7U-000FCz-1i;
	Sat, 25 Oct 2025 08:59:50 +0000
Date: Sat, 25 Oct 2025 16:58:52 +0800
From: kernel test robot <lkp@intel.com>
To: Oleg Nesterov <oleg@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	x86@kernel.org, Peter Zijlstra <peterz@infradead.org>
Subject: [tip:locking/core 9/11] array.c:undefined reference to
 `__scoped_seqlock_bug'
Message-ID: <202510251641.idrNXhv5-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git locking/core
head:   37d0472c8ac441af8bc10fc4959ad9d62dd5fa4c
commit: b76f72bea2c601afec81829ea427fc0d20f83216 [9/11] seqlock: Change do_task_stat() to use scoped_seqlock_read()
config: x86_64-buildonly-randconfig-002-20251025 (https://download.01.org/0day-ci/archive/20251025/202510251641.idrNXhv5-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251025/202510251641.idrNXhv5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510251641.idrNXhv5-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: vmlinux.o: in function `__scoped_seqlock_next.constprop.0':
   build_policy.c:(.text+0x23f823): undefined reference to `__scoped_seqlock_bug'
   ld: vmlinux.o: in function `__scoped_seqlock_next.constprop.0':
>> array.c:(.text+0x6296d3): undefined reference to `__scoped_seqlock_bug'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
