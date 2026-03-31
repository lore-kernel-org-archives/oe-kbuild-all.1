Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 903A82C1593
	for <oe-kbuild-all@lists.linux.dev>; Tue, 31 Mar 2026 05:55:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774936542; cv=none; b=sjngsCSz80mQBQx/1xpig8CUTeFUmMsWKMCpSh44DzOe2/Bquo0n69zXV3kdquY8V5+dv05eKGDPVg1Wx11rFyPtbdxcYZe2QnJo8Lm79nTMVZpyG4s2IrbGfDY5Tl5ipYYzjxQaUtGeGF4ppCs8j8148agUDlSYwRNnzJFoad4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774936542; c=relaxed/simple;
	bh=yoblPelc4LxYW9h+wPePcx2/7N/5FFEez027JRaR7RY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=k/eqAuyD+aLGj9qoW8MHafIRkpuwtpqOeg1Mtqx3tu2Sf9vSpJdIEandzEpq3jAVk7XLwTbAy36GBgWh1r5N6rg6V4L3mfkuuBPnRhY/TAu6Z2Svp0VTIyJ6eSzU8lX5uYWtEyn1DiIXQOAzELYAz3AigoMBv4+FzV98HLN3VTY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FIGeFPeJ; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FIGeFPeJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774936540; x=1806472540;
  h=date:from:to:cc:subject:message-id;
  bh=yoblPelc4LxYW9h+wPePcx2/7N/5FFEez027JRaR7RY=;
  b=FIGeFPeJaLOW9v4zvfJUHdCViyrwg7T77OxeiqZa5S3544ey4YRHqDha
   9vbpE+xWw2NzIEBl+lmAsp9vLjize0LDmyeZ+rQg5GYrKLO2D6TxN+SmU
   1qrzXEXTqfqzpBBjFNOyeAtqRTozryRTaC2lZ6ZinC1ASmmvI5BhtDO2i
   GpB1vuQeVNTdOdgMmA1kc7UClli0cRXkeKuMmwx1ZSn+DE1Irwnkfav+8
   4JQIOBt4AAj+c5xq3R5wRw3jpI4TWRgFE2UqCwI1ECBKfK0bLijydv+kQ
   on13OAvJiZSlVluhNXU3Dap+dAHswLkauB/TMAPuk/u/QfJi4yRvI+OYy
   g==;
X-CSE-ConnectionGUID: CpiC0IlsSUOiNDqqCGAW4g==
X-CSE-MsgGUID: 8DTsGCAtQemagPZNfOF4Xg==
X-IronPort-AV: E=McAfee;i="6800,10657,11744"; a="86555696"
X-IronPort-AV: E=Sophos;i="6.23,151,1770624000"; 
   d="scan'208";a="86555696"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Mar 2026 22:55:40 -0700
X-CSE-ConnectionGUID: 56kia9g8SVeIXtjzjygReg==
X-CSE-MsgGUID: mH28Bu/rQvqoZbYbS43J4w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,151,1770624000"; 
   d="scan'208";a="249481426"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by fmviesa001.fm.intel.com with ESMTP; 30 Mar 2026 22:55:39 -0700
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w7S4f-000000008Ir-0Lxg;
	Tue, 31 Mar 2026 05:55:37 +0000
Date: Tue, 31 Mar 2026 07:54:44 +0200
From: kernel test robot <lkp@intel.com>
To: Jeff Layton <jlayton@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jlayton:kdevops 26/26] Warning: fs/nfsd/nfs4xdr.c:4302
 function parameter 'nf' not described in 'nfsd4_encode_dir_attr_change'
Message-ID: <202603310741.ZGPHn7nd-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jlayton/linux.git kdevops
head:   41363e319407643cd357c31a12fd344cfc9eaf48
commit: 41363e319407643cd357c31a12fd344cfc9eaf48 [26/26] nfsd: add support to CB_NOTIFY for dir attribute changes
config: x86_64-rhel-9.4-ltp (https://download.01.org/0day-ci/archive/20260331/202603310741.ZGPHn7nd-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260331/202603310741.ZGPHn7nd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603310741.ZGPHn7nd-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Warning: fs/nfsd/nfs4xdr.c:4236 function parameter 'nf' not described in 'nfsd4_encode_notify_event'
>> Warning: fs/nfsd/nfs4xdr.c:4302 function parameter 'nf' not described in 'nfsd4_encode_dir_attr_change'
   Warning: fs/nfsd/nfs4xdr.c:4236 function parameter 'nf' not described in 'nfsd4_encode_notify_event'
>> Warning: fs/nfsd/nfs4xdr.c:4302 function parameter 'nf' not described in 'nfsd4_encode_dir_attr_change'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
