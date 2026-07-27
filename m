Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81AB93CC7FF
	for <oe-kbuild-all@lists.linux.dev>; Mon, 27 Jul 2026 06:24:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785133492; cv=none; b=IZmK2jPJB1OLUgGUq+ajxp6r7/d+Hw3qRsedtuad2CUShV0GTmPTNrPhblo18cYxSy69faUdDrFguUPusiwxKhlwmQFUtmYYbAkrG0/Flhr/4a6Nz7wm2/zSjSUtU6iQSmsN7piZIQXy9t5w3okymooqSv0x4sIENrZVjyMqMQ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785133492; c=relaxed/simple;
	bh=DBjVVkA5nSpONDCfTS7gqYYDU+hKdke3rZQCepkASlE=;
	h=Date:From:Cc:Subject:Message-ID; b=MqiiFOaKfSN6T7gB1cJ+wymA6RemHy1RinmX3ObsQERwbf5NUmF/fUTYd9XANv0MSI/1NCnBj8ZYrxwUL3NW+PPCb8NoGsNSP5G+otpTvIlB84nRKR3zrurCUqyh7hUtFemhFrhAzafPhCP7qqq4cOtDxw6I1akeRI3IA9HwaMM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YEnLn1KK; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YEnLn1KK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785133489; x=1816669489;
  h=date:from:cc:subject:message-id;
  bh=DBjVVkA5nSpONDCfTS7gqYYDU+hKdke3rZQCepkASlE=;
  b=YEnLn1KKiG1RcRXrtrlxBSJklGqRchhrAGRjry2SR3d4vFpMT9hxWlyV
   7gqb3uUB4rGgOtQyQ6xJVN6iv7iuFNslBWGbX92MIOzcmt0ccWn45lcZM
   IrOARcsh6yICYOpwbhiy7/dNwj/g+axidieEZnbJy+2niofs8Nomq1/VT
   vx25FfDzR7ZeJoTQjgqSvmCpurWEv8V5OLLPbdEir0yUVOm+giuxYjYhF
   bpMwKbUbwfYIoogt1E3To/Rn1tVG7tlZ5tGUrKIS7zzUZmDIBG9pUoBdf
   CtEI8YBCV8tot1cFQA2cMUdM7Yh/lkLjbYSv+lN403uIME3VbaK6rdtiq
   w==;
X-CSE-ConnectionGUID: WVqv1zeyQZGIXVfy/kv35w==
X-CSE-MsgGUID: hkTEemGKTuqwiMcszGTwKQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11857"; a="96355307"
X-IronPort-AV: E=Sophos;i="6.25,187,1779174000"; 
   d="scan'208";a="96355307"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jul 2026 23:24:47 -0700
X-CSE-ConnectionGUID: 0QQHoJHoRHiNDFxuY8Dtbw==
X-CSE-MsgGUID: gNIjhwFgQd+Qef4eIytBQw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,187,1779174000"; 
   d="scan'208";a="256661144"
Received: from igk-lkp-server01.igk.intel.com (HELO 3cba2a188a06) ([10.211.93.152])
  by fmviesa008.fm.intel.com with ESMTP; 26 Jul 2026 23:24:47 -0700
Received: from kbuild by 3cba2a188a06 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1woElY-000000001Xe-3mZg;
	Mon, 27 Jul 2026 06:24:44 +0000
Date: Mon, 27 Jul 2026 08:24:34 +0200
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [xinli-intel-fred-public:pr/1 1/1] checkpatch:
 WARNING:BLOCK_COMMENT_STYLE: Block comments should align the * on each line
Message-ID: <202607270804.00idARlw-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/xinli-intel/linux-fred-public.git pr/1
head:   f64bcba190b37131571dea0b8e0df0ed251a2e99
commit: f64bcba190b37131571dea0b8e0df0ed251a2e99 [1/1] KVM: selftests: Add FRED event data migration test
reproduce: (https://download.01.org/0day-ci/archive/20260727/202607270804.00idARlw-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

WARNING:BLOCK_COMMENT_STYLE: Block comments should align the * on each line
#347: FILE: tools/testing/selftests/kvm/x86/fred_event_data_test.c:192:
+	/*
+     * Map the stack page in the guest page table but do NOT back it

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
