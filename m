Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACB1B29CB24
	for <oe-kbuild-all@lists.linux.dev>; Sat, 21 Mar 2026 07:51:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774079466; cv=none; b=kixNPX+scKpVmmngCHP/q5xLJQGABkFQOG7BQLi0WFnA0J/empdUDMja12GkpUZBb15f4GVAjesmd7LjMWjZdTgncyc/7TaM3UULXBpKZ6KU8HnjWk0dB1tZduErMil69n6XKm64eyQvyQd7ELiEufCOMu9Pv3FXS5Zb1PSDWZA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774079466; c=relaxed/simple;
	bh=BFXZ1IXRQmOMj+Q2RHuSPaERb17sdoOqsc77bnkkTFw=;
	h=Date:From:To:Cc:Subject:Message-ID; b=UJfcse9/zD5g78UW5bQxSNTKzeNNjLD0VHzZGe/s9yKIfIf6cVnJBtu6z6htxJWN3/OJuxJik14Fj8YrTf/MGMbiSk/1xHKn4RWqPa4HHEZthmkFkPMOUBJnUhF7dG9f8JzeVbc948FsqOnL2Pl19ojFgCMODgetvoOfYbH0RZs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=V5RQC/yU; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="V5RQC/yU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774079465; x=1805615465;
  h=date:from:to:cc:subject:message-id;
  bh=BFXZ1IXRQmOMj+Q2RHuSPaERb17sdoOqsc77bnkkTFw=;
  b=V5RQC/yUqrwUPCZEUvDiT/4hg5Ol6x7Ii/DHG1qiMnAnMWpzH3O3fGnz
   agJ9wwXDSRIlLE7jSh2QbqgJOorDRaLTcLzqv/jHWhZfCPS7LOuBJ2r4t
   MUbDOJ2yBuWdUijo9Q4kaXlv+vxN0zDzfSlOXC0tC5z/G6L7sA+bSSptI
   5KR+ubysNvVQUoIK3IXbizdnc1367fmHVPRNsLX5mAIDZjhceGbaibYYd
   8I6ge14hcDjxjQaJjsyP9LMe+OicNi8wIrA0A3YKDnOzX0T13Osdo36Yu
   zhsLlPonnlhNBjlGKXP47tAgwuf8hQ5cY+lwoNP4/iIThvltrNhTeu36H
   Q==;
X-CSE-ConnectionGUID: AKhsTJVETae6r5HQtnjaUA==
X-CSE-MsgGUID: t+IaZAavRFaoZE/6obw4pg==
X-IronPort-AV: E=McAfee;i="6800,10657,11735"; a="75280917"
X-IronPort-AV: E=Sophos;i="6.23,133,1770624000"; 
   d="scan'208";a="75280917"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Mar 2026 00:51:04 -0700
X-CSE-ConnectionGUID: E0ZJWUezQFKssMKL5q4fxA==
X-CSE-MsgGUID: eYG8bySZQjuDz145G9UKjQ==
X-ExtLoop1: 1
Received: from lkp-server02.sh.intel.com (HELO d7fefbca0d04) ([10.239.97.151])
  by fmviesa003.fm.intel.com with ESMTP; 21 Mar 2026 00:51:02 -0700
Received: from kbuild by d7fefbca0d04 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w3r6q-000000000S3-24Yj;
	Sat, 21 Mar 2026 07:51:00 +0000
Date: Sat, 21 Mar 2026 15:50:38 +0800
From: kernel test robot <lkp@intel.com>
To: chenmiao <chenmiao.ku@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Stafford Horne <shorne@gmail.com>
Subject: WARNING: modpost: vmlinux: section mismatch in reference:
 __set_fixmap+0x84 (section: .text.unlikely) -> map_page.isra.0 (section:
 .init.text)
Message-ID: <202603211503.E8mMETO3-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi chenmiao,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   a0c83177734ab98623795e1ba2cf4b72c23de5e7
commit: 4735037b5d9b0f809c51976c87d737fa2c48fdea openrisc: Add text patching API support
date:   6 months ago
config: openrisc-randconfig-r053-20260321 (https://download.01.org/0day-ci/archive/20260321/202603211503.E8mMETO3-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 10.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260321/202603211503.E8mMETO3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603211503.E8mMETO3-lkp@intel.com/

All warnings (new ones prefixed by >>, old ones prefixed by <<):

>> WARNING: modpost: vmlinux: section mismatch in reference: __set_fixmap+0x84 (section: .text.unlikely) -> map_page.isra.0 (section: .init.text)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
