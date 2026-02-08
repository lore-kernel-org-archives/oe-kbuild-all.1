Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39ECE3EBF0E
	for <oe-kbuild-all@lists.linux.dev>; Sun,  8 Feb 2026 08:58:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770541083; cv=none; b=Ba5cdUic2alR5MV4+8b1PKaEPgJIY8U4G/FYdl/4L+GodxxURrgbO7MjBP+7l3U5hLqcIHBSW5hzgEiqJvNoSXc5uzBDnPPGWz6xy5nq/gDbzwtBBv2dPhYsDWqwozUrJuHRK0KAqSBuYoTV8QZ3uypZP25wyi0jmPUxylfqIbI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770541083; c=relaxed/simple;
	bh=lMdeZJoibxpD6w3T9C/wGtuU0nMrJMhV3XoBmyGQEMg=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Xaeqb7hT0sqgvb6jhZvGV+v1kMKfxJIxc97Ioe4mkNTsgk1YTWlz5sVXnRCP+2ae4EHBWtzzZJxNPlXGziCuxiGPR+ehDirUGoR/LMgLeZYSoQHUZT1ffG8aJIamYFxWDqNsgMZsTTt9at/aLINYpRmVSyR25Qilyu37aRq1zao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NpXWeXyA; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NpXWeXyA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770541083; x=1802077083;
  h=date:from:to:cc:subject:message-id;
  bh=lMdeZJoibxpD6w3T9C/wGtuU0nMrJMhV3XoBmyGQEMg=;
  b=NpXWeXyA2e0Ro4OrTnNX/SYk6KA9Ht1dF+qo3Vm+6Rv3f3/IzhTJBcrV
   o1i2tnUbrCrvPWz1GUZo5LpNdUrGRXqoiC5OlO7t6jzK1YN50BflkTu7/
   TlqLWNi59/FGH39tfLEHE981WFjIXhgkPF7AljLOSbywSpFHhhc0e0ejF
   1HkeYbqsl0KXkP99uG0+eP7x7sMHfuy/tXTYW4tfx4rM52kXosxVfDH62
   4MNLCHPb8snxpmG30mbTf1WwszkRGfqsR9W+61hF+PwY0CX4x/o4ECyVd
   fWzKiIc0BEmxRcGvRFVKFs7yEi97HOQZB+lRDyvTSF6jBCYVGtZGwedQh
   w==;
X-CSE-ConnectionGUID: WF6Pt38PTeaO4LKHHxjhaA==
X-CSE-MsgGUID: XA1cLMTxQ2CCAhpXCJ6dHw==
X-IronPort-AV: E=McAfee;i="6800,10657,11694"; a="83056641"
X-IronPort-AV: E=Sophos;i="6.21,279,1763452800"; 
   d="scan'208";a="83056641"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Feb 2026 00:58:02 -0800
X-CSE-ConnectionGUID: AWW8HXptQV2gVBiHxpEE1w==
X-CSE-MsgGUID: lYFejqT5ReORjkB9YBlRyA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,279,1763452800"; 
   d="scan'208";a="215475046"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 08 Feb 2026 00:58:00 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vp0cA-00000000m78-1lpA;
	Sun, 08 Feb 2026 08:57:58 +0000
Date: Sun, 08 Feb 2026 16:57:28 +0800
From: kernel test robot <lkp@intel.com>
To: Allison Henderson <allison.henderson@oracle.com>
Cc: oe-kbuild-all@lists.linux.dev, Paolo Abeni <pabeni@redhat.com>
Subject: [linux-next:master 4898/12094] {standard input}:5481: Error:
 pcrel offset for branch to .LS001F too far (0x3e)
Message-ID: <202602081618.FX6Ihgdg-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   9845cf73f7db6094c0d8419d6adb848028f4a921
commit: d327e2e74aedbe77e1dd716ec77b9aa828ef6812 [4898/12094] net/rds: Add per cp work queue
config: csky-randconfig-r054-20260208 (https://download.01.org/0day-ci/archive/20260208/202602081618.FX6Ihgdg-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 12.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260208/202602081618.FX6Ihgdg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602081618.FX6Ihgdg-lkp@intel.com/

Note: the linux-next/master HEAD 9845cf73f7db6094c0d8419d6adb848028f4a921 builds fine.
      It may have been fixed somewhere.

All errors (new ones prefixed by >>):

   {standard input}: Assembler messages:
>> {standard input}:5481: Error: pcrel offset for branch to .LS001F too far (0x3e)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
