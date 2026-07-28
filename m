Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C708C3D522C
	for <oe-kbuild-all@lists.linux.dev>; Tue, 28 Jul 2026 11:28:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785238129; cv=none; b=ZwDsj7lUzyJL+EHV0uHwmScD66YGfie5QkBHeljiQ7P31U1919PCNLRgseEpZ3XH2av9klm1CBh+mwI1LNYuwwzOAKZJ0w5MefAUX1AU3ZkjbI//KKOo5EqrpVykPf9GXuL4bOafJLLs8YTQbiOst1G8GclHaOqYkP6nfDOF2Js=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785238129; c=relaxed/simple;
	bh=wzXWNvzgb5tDdnUQ11j2jW/YBebYGPFASN0neEDVUWs=;
	h=Date:From:Cc:Subject:Message-ID; b=KJ3Z0rr8CiIXU1Zczmy0SbwS/BlKcTUcgXXvGPnP9QZCVvV23/9Jn/1IabRVCJ2bZT0llPd5ekw7sgA7wl6HqGLqYPHAsaV6AANMw5a7bHGxZla3vY13JpXD8Tx6o9i8eQlAOfrdzskIrj3gT9licoFCgcLRhjSjfLy1thH1/fU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Kh0ezkfK; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Kh0ezkfK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785238128; x=1816774128;
  h=date:from:cc:subject:message-id;
  bh=wzXWNvzgb5tDdnUQ11j2jW/YBebYGPFASN0neEDVUWs=;
  b=Kh0ezkfKLUExOo1ZSv4VRRbq3Ithj35h0oFoTYVAwQAs87TqX7x4azZ4
   bW1f6a/JdE9gd+ofQUgadgJOXhUdNAtxl72msM8Mk4u89QIB2fJqXkl/x
   yAVP8Ae5yA8drDaZ2YVC1HFEJdCc7cHpdR4dTnwcLKFa3w2HKvF5axbHz
   14wxyBGoKQijRsMDQkOB9rOR9cqf42KyjZn4P3KGO8vLKx3aLqwplzqPt
   Z9D+5y1fie4a1aFFjSQAvOKa3Yb6pI4sHi6YIffaHnACFlk0RR+bjj3P2
   d1LmO3vWNmSjs8awf19Q6cFP2HXxh67a/hT4AFBOZFYYsbZAyADBKq005
   A==;
X-CSE-ConnectionGUID: QxVSpOdtQ5OfUzwQ7jiF1Q==
X-CSE-MsgGUID: ntw506PfSiG8nZVrlaY9XA==
X-IronPort-AV: E=McAfee;i="6800,10657,11858"; a="85668077"
X-IronPort-AV: E=Sophos;i="6.25,190,1779174000"; 
   d="scan'208";a="85668077"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jul 2026 04:28:47 -0700
X-CSE-ConnectionGUID: wcreHmSETRudd8aJpoC2wQ==
X-CSE-MsgGUID: bhQ7dFcFSzKltx477PuJLg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,190,1779174000"; 
   d="scan'208";a="289634521"
Received: from igk-lkp-server01.igk.intel.com (HELO 3cba2a188a06) ([10.211.93.152])
  by orviesa002.jf.intel.com with ESMTP; 28 Jul 2026 04:28:47 -0700
Received: from kbuild by 3cba2a188a06 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wofzH-000000001xG-3rZl;
	Tue, 28 Jul 2026 11:28:43 +0000
Date: Tue, 28 Jul 2026 13:27:58 +0200
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [xinli-intel-fred-public:pr/1 1/1] checkpatch:
 WARNING:BLOCK_COMMENT_STYLE: Block comments should align the * on each line
Message-ID: <202607281356.SSqjJCZb-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/xinli-intel/linux-fred-public.git pr/1
head:   943783d3635388a9c38d79c997be465974dd8962
commit: 943783d3635388a9c38d79c997be465974dd8962 [1/1] KVM: selftests: Add FRED event data migration test
reproduce: (https://download.01.org/0day-ci/archive/20260728/202607281356.SSqjJCZb-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

WARNING:BLOCK_COMMENT_STYLE: Block comments should align the * on each line
#345: FILE: tools/testing/selftests/kvm/x86/fred_event_data_test.c:190:
+	/*
+     * Map the stack page in the guest page table but do NOT back it

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
