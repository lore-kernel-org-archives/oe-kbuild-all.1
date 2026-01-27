Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 725E234CFCA
	for <oe-kbuild-all@lists.linux.dev>; Tue, 27 Jan 2026 12:42:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769517749; cv=none; b=May8M93ixmhEBvOvcS7sHq6yyabXNvKZAHaB6Y/Ina98tKXaSBRznGdJixFAjK/iIYVgkbGunDU4kVwwemyrdNIIWfkH5g3D9xNCLPYEuyb3lhLYAY33y2PCRGuuvwHnN3W5KdXb7C46sJ9nq2JtSQhh1FNFUEXeSSfZJ6kO/Lk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769517749; c=relaxed/simple;
	bh=CAoDe14Qy3FjIlY39zoN0opHszpQg5jZbnvQobOm/5I=;
	h=Date:From:To:Cc:Subject:Message-ID; b=oF1+VppxWm4j6Vb1LPUkRFzikIR24Bz6hjqlhr1Mt056DCT+COrEEGVznFTPfY1C0CIt5/axzeDlFE25spITWNhN+b3d4mk2FeSYtygSlQc/vcD4H+ArtDJUjS/UFZDLbCjThDRTuNCvBgA4H1XKK0ZBs/meBoBekI+5iZWCYB4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=K2FV6sR9; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="K2FV6sR9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769517749; x=1801053749;
  h=date:from:to:cc:subject:message-id;
  bh=CAoDe14Qy3FjIlY39zoN0opHszpQg5jZbnvQobOm/5I=;
  b=K2FV6sR92MPrzhX/1AWSxtKOdaGQ/vMgCPZgTUZ6//aZ28dcsakLXjNk
   SHzimfY2pPJYYOR4EGniiMTEKUbmHQh6DXdB0VKmW9p8RSmzPb/SABiTD
   nvO3A/6IcSP7D6qqYnDibp1am2u30k+Fcy3kNMLwpVzdKxBdp0FD26oAn
   APbvDvZ/5lVBS4DxYLCdhdDSVcfD9JI9DHcO371kKbNqCnZlHXyEX93mz
   RtPUJFSBIjfXcqEd2skhaQJsvz2vNAJWYcM0iR6iBfP1W/5c0NOC+u1aI
   xD5mHkVNR4pNgo6n+wPuyQrVQIRvDa3MfoBBtcswS6pa5vmZVKLJjB22s
   w==;
X-CSE-ConnectionGUID: dM0tibO1QOCf29CoUHWWIw==
X-CSE-MsgGUID: Dsyiati2T2Wcp4kRAnF5bA==
X-IronPort-AV: E=McAfee;i="6800,10657,11684"; a="70614033"
X-IronPort-AV: E=Sophos;i="6.21,257,1763452800"; 
   d="scan'208";a="70614033"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jan 2026 04:42:28 -0800
X-CSE-ConnectionGUID: GaXvkiUUQZ6uoZHcgOjNjw==
X-CSE-MsgGUID: SVaV93nGT3qh4Q7pPnPidQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,257,1763452800"; 
   d="scan'208";a="207586211"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 27 Jan 2026 04:42:26 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vkiOl-00000000YTa-2E8T;
	Tue, 27 Jan 2026 12:42:23 +0000
Date: Tue, 27 Jan 2026 20:41:31 +0800
From: kernel test robot <lkp@intel.com>
To: Roman Gushchin <roman.gushchin@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [rgushchin:bpfoom.3 8/18] oom_kill.c:undefined reference to
 `bpf_handle_oom'
Message-ID: <202601272007.jgTozW2u-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/rgushchin/linux.git bpfoom.3
head:   4f455e283257caaedc8070f2806557e6b3d31cae
commit: ce0600c8f5c7ec3ecccdc82513de16ed10686391 [8/18] mm: introduce BPF OOM struct ops
config: sh-randconfig-002-20260127 (https://download.01.org/0day-ci/archive/20260127/202601272007.jgTozW2u-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 10.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260127/202601272007.jgTozW2u-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601272007.jgTozW2u-lkp@intel.com/

All errors (new ones prefixed by >>):

   sh4-linux-ld: mm/oom_kill.o: in function `out_of_memory':
>> oom_kill.c:(.text+0x15d4): undefined reference to `bpf_handle_oom'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
