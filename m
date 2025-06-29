Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AF971F869E
	for <oe-kbuild-all@lists.linux.dev>; Sun, 29 Jun 2025 22:09:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751234981; cv=none; b=H97kYfNzMVUiIMfZFTaNpy9+Io8TAxe0HJseH7P1YeHNeXMtchdsgjyXWt8eB5pMr52rDZ99Ler7T9GJeqVzlKU8uw5BAFxRVweZmcrbZ+u0MP/DHWg9GQA4LqMFonlk+MZ+A8xEeCEhUa1ohZBCpn4itvMpjVf0dT1LaGYisYg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751234981; c=relaxed/simple;
	bh=esTkBPeZs+pVHETpbbD78TzZ+wJ1IS2/6Dr19gIySdk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=OeHXKZMqh89OSarZGkBw/Pib9l+cCTaFHIl2HHgf0A1SiaJYVOH4uAX1Vu6pRQDuV6HWCNKwYY+v2/b7iNQ8t9CGRVHqBNUsgYhnjvuYUMBrS2Nt/lFINR5kD69CATORhnaQsF987YmubVPTV7pbagCanxpZCm2Lv2Cb+s3OhCE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=M0HuNLgH; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="M0HuNLgH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751234979; x=1782770979;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=esTkBPeZs+pVHETpbbD78TzZ+wJ1IS2/6Dr19gIySdk=;
  b=M0HuNLgHurFFgY/FaDvvkBLJDTwahgnQ1mbnnPw+FPNrMrrQobaY6Lpr
   X+VRswH6y7t0gSXr6pBrGoeE3jwbAJc+4dySZtzkrY7D2TzqoRTVVgq6/
   6WYTYRYJgJYjc23KK5juaFx3Xyv8EEr7hS68cuRv9UHbW/yNU/0Q331FE
   JOzYTpFUq1ntLmDujAiRsaO96JoL8GpIzjm1FEzHFa+M0/dG/EbiaeYeG
   Okxfm2d4pbUW9/ITfWhhtvE/PqyOHALVyDkaHMlF58NRYG5czyUb3wJZg
   f6E7rd1wLhYTDOiKkDJnmWL/mbZ7Kl1xc/TDZG7+3gMla7BBz1Jq9yaYo
   Q==;
X-CSE-ConnectionGUID: I7CE98TgR9qA/u/MmFbh9w==
X-CSE-MsgGUID: diP2KHGkQiGqyu91PU1+dQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11479"; a="52574969"
X-IronPort-AV: E=Sophos;i="6.16,276,1744095600"; 
   d="scan'208";a="52574969"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jun 2025 15:09:36 -0700
X-CSE-ConnectionGUID: r+kGPcljRd663Kaa1DKH0g==
X-CSE-MsgGUID: X6TpsZm/QKegRZ4DkAG32A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,276,1744095600"; 
   d="scan'208";a="190475007"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 29 Jun 2025 15:09:36 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uW0DN-000YHC-0l;
	Sun, 29 Jun 2025 22:09:33 +0000
Date: Mon, 30 Jun 2025 06:08:41 +0800
From: kernel test robot <lkp@intel.com>
To: Sabyrzhan Tasbolatov <snovitoll@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: [akpm-mm:mm-new 226/237] WARNING: modpost: vmlinux: section mismatch
 in reference: kasan_init+0x54 (section: .text) -> kasan_init_generic
 (section: .init.text)
Message-ID: <202506300650.wjMQ0CnC-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-new
head:   2e462e10265dcdce546cab85a902b716e2b26d9f
commit: f6a00da8def1db533603d45c6c2c1529fda83067 [226/237] kasan/um: call kasan_init_generic in kasan_init
config: um-allyesconfig (https://download.01.org/0day-ci/archive/20250630/202506300650.wjMQ0CnC-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14+deb12u1) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250630/202506300650.wjMQ0CnC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506300650.wjMQ0CnC-lkp@intel.com/

All warnings (new ones prefixed by >>, old ones prefixed by <<):

>> WARNING: modpost: vmlinux: section mismatch in reference: kasan_init+0x54 (section: .text) -> kasan_init_generic (section: .init.text)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
