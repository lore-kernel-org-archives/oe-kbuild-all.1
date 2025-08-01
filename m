Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDA9217BA5
	for <oe-kbuild-all@lists.linux.dev>; Fri,  1 Aug 2025 11:49:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754048993; cv=none; b=gTLYzyHSKP4GRTheQxjwi6AmbinK+NMTVG+W+R1iH+CftmhVDBcHy7vqR9cIATtFaQ1MjjXWrMCJ2JbVnQ7g1n736i8JwCFRtcFumHzESmyZTf/RtmMzDchziPi8R7EFyPHSNsr/TfPmSITM06Fopd8BDuNd4zSFdAvnBqsDXUU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754048993; c=relaxed/simple;
	bh=dHV/UHP+UYhCdhe7xqxR74Pc/zXdYnv26R1m6WcNqsg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Yzgt+DPcrBdrbF4xsCTHjbcB7PL+ET5n7Vp94Ea0qR+/JLc1wsIjMPUmChGP+9RERdNaozt34RdPZceUJoLMDXTQzRkyVUtDqSEZXZLGevjZNClBTclnlL+THiu1uwfoQH/Thl0yI+7lsQpH3iVEbdgZfCw5SaKaqaRPSpHGibc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OSDCLvS3; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OSDCLvS3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754048993; x=1785584993;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=dHV/UHP+UYhCdhe7xqxR74Pc/zXdYnv26R1m6WcNqsg=;
  b=OSDCLvS3EovO6FOO4f1jlUPhCFO7ZIEaKNEkwh6oMbHLonu7YRCWrE/k
   DokvG9oFzzrznVlRMcY+WdVZh5lKq+18lHQ/sJvtlYfal6Qf9kpTRl071
   z0e1OM71O3TOh3xWhrNhDp28h0Nn2maI5936LPUAZz/8zKoSeRvYw6Vy5
   KvKR7HZVi0prjKijBDte8GqiGop0wkh236gF71zT5n01mYozkzOnj+b6G
   kfd8aAHmIT+5auEQ3D4H/u/qvHLN4SN5WKGZnHAkIeQGH4F8gTbGRF5P3
   FVJs20Y3NHdfe+jm7BEbHqK+6jHhsIJO9XCvpqnXcM59z+Knni7dWU24j
   w==;
X-CSE-ConnectionGUID: Gu0cq4nYSmaDgL+vLKjC7Q==
X-CSE-MsgGUID: QOFgHab+TNmKB2wxC7ha0w==
X-IronPort-AV: E=McAfee;i="6800,10657,11508"; a="56262559"
X-IronPort-AV: E=Sophos;i="6.17,255,1747724400"; 
   d="scan'208";a="56262559"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Aug 2025 04:49:52 -0700
X-CSE-ConnectionGUID: QPtmN3VpSSCg3M8ALKVWVw==
X-CSE-MsgGUID: xNoqp/2VQPW3gGj/WNp6Rw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,255,1747724400"; 
   d="scan'208";a="164338400"
Received: from igk-lkp-server01.igk.intel.com (HELO b3b7d4258b7c) ([10.91.175.65])
  by fmviesa010.fm.intel.com with ESMTP; 01 Aug 2025 04:49:50 -0700
Received: from kbuild by b3b7d4258b7c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uhoGi-0001Dj-10;
	Fri, 01 Aug 2025 11:49:48 +0000
Date: Fri, 1 Aug 2025 13:49:19 +0200
From: kernel test robot <lkp@intel.com>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [linux-next:master 12438/13054] hppa-linux-objcopy:
 vmlinux.unstripped: warning: empty loadable segment detected at
 vaddr=0x10c00000, is this intentional?
Message-ID: <202508011303.YJlh0DNL-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   b9ddaa95fd283bce7041550ddbbe7e764c477110
commit: 94564d1bb0599a49b833a6502caab9fbaaba7c39 [12438/13054] kbuild: keep .modinfo section in vmlinux.unstripped
config: parisc64-alldefconfig (https://download.01.org/0day-ci/archive/20250801/202508011303.YJlh0DNL-lkp@intel.com/config)
compiler: hppa64-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250801/202508011303.YJlh0DNL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508011303.YJlh0DNL-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> hppa-linux-objcopy: vmlinux.unstripped: warning: empty loadable segment detected at vaddr=0x10c00000, is this intentional?

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
