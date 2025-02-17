Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6637E372
	for <oe-kbuild-all@lists.linux.dev>; Mon, 17 Feb 2025 19:58:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739822305; cv=none; b=lm6AZmlkBRGGllU8tIi6sSdlRdJVnnkYAcuGovsYgJKczSVOuKHv2CC2TQ/Hsz5Cu9ZuEObxGujNvO4cnm03EapG63sQVsIgZ60qUpAqGzO9Yaxbfcb+anAovETrkOTfNkAOgdlg0P7KNfCdgUqJC/6cRPGJ3oz/4Gg3P5i3f+o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739822305; c=relaxed/simple;
	bh=cQRPAXWzeq0Hd20SWRJmlBpGSe+MoA7owkFH1ph3bUs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=iLzw1ODNW1h4I8I6VY7W2k90Id0FRl6N0RoEg8MujEs2itF6r2qITHbJ4mZOLIm6jfWb5XXSkJN3wwK4dUYhuBifufSxmdCwQD36EWGxjw5GI6bKMsPJbyscP5Jrq1jRbY0UnhtyfpjllTTZTnfH9VPAjU+aB7+9j41gAClKsgU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZKVWXUa5; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZKVWXUa5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739822303; x=1771358303;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=cQRPAXWzeq0Hd20SWRJmlBpGSe+MoA7owkFH1ph3bUs=;
  b=ZKVWXUa5cVUiN491D95PuEzybJrA2xUVTwbeA1AH17fhqp0eLrzsNA/c
   MMow1WGe8Ox2WnfGJF4IYinuut1ZRYx6u2uGGSo5hvBNPah35Ucbb0u8H
   0laZ8wQ6Oaw5OdtB0hMNciTO48W5/Ynsykyr9/HFcQjfJsO3AL7R6/DS8
   nwVfHSm0TmIl3aDKsdHe3JqZ17zeodT5AVqPXE8NSoHMFqV6bMhyTogHs
   SifgKz2tRY98jisSzcf2sZdgoro+k5Hap3e7Ma0zrNgR0sr7FjYONJvHu
   ejp4UVrL8fG9RMTJcbecyo6t+1jhNt+Mo3fNUp/EpkwfpPanVSQw1V1ji
   Q==;
X-CSE-ConnectionGUID: wWBY8gkTRwu2aCRkISMlKQ==
X-CSE-MsgGUID: C8wf1PoPRrC0DGHM6g9K9Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11348"; a="62987007"
X-IronPort-AV: E=Sophos;i="6.13,293,1732608000"; 
   d="scan'208";a="62987007"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Feb 2025 11:58:22 -0800
X-CSE-ConnectionGUID: bV51x7dCQ3mVYPoFPGDT/A==
X-CSE-MsgGUID: iXtVyNRdT4i1PgHpDMIE6Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,293,1732608000"; 
   d="scan'208";a="114397897"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 17 Feb 2025 11:58:20 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tk7Fy-001DYC-1l;
	Mon, 17 Feb 2025 19:58:18 +0000
Date: Tue, 18 Feb 2025 03:57:41 +0800
From: kernel test robot <lkp@intel.com>
To: Eric Biggers <ebiggers@google.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [linux-next:master 4576/4577] arch/x86/lib/crc64-x86.o: warning:
 objtool: crc64_x86_init+0x14a: relocation to !ENDBR:
 crc64_msb_vpclmul_avx10_256+0x0
Message-ID: <202502180332.fVrVVYLK-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   253c82b3a2cec22bf9db65645f934fbe095899a3
commit: 76d1ba8179ac8077382d5d89c6eaabf9b3a57259 [4576/4577] Merge branch 'crc-next' of git://git.kernel.org/pub/scm/linux/kernel/git/ebiggers/linux.git
config: x86_64-randconfig-161-20250217 (https://download.01.org/0day-ci/archive/20250218/202502180332.fVrVVYLK-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250218/202502180332.fVrVVYLK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502180332.fVrVVYLK-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/x86/lib/crc64-x86.o: warning: objtool: crc64_x86_init+0x14a: relocation to !ENDBR: crc64_msb_vpclmul_avx10_256+0x0
   arch/x86/lib/crc64-x86.o: warning: objtool: __SCK__crc64_lsb_pclmul+0x0: data relocation to !ENDBR: crc64_lsb_pclmul_sse+0x0
   arch/x86/lib/crc64-x86.o: warning: objtool: __SCK__crc64_msb_pclmul+0x0: data relocation to !ENDBR: crc64_msb_pclmul_sse+0x0

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
