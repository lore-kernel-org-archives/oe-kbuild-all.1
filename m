Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14564149C7B
	for <oe-kbuild-all@lists.linux.dev>; Fri, 14 Feb 2025 20:04:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739563449; cv=none; b=q9QMuTI/FyqL5DBXB6GVIw+g59H7QQtZgjKfbkk9bR52Mp65Wsr3E5Edn0/wICLQ1zdgcP0pFEHv2Ev+i5pEDzHG4GOLNog3RZTfCjEdQLlgTr40U84rz9LT53/LSIHvmtEwYPj6gJNAdn9oEt+A0PYbW6eOH8NDABkjpfmMDbk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739563449; c=relaxed/simple;
	bh=p81+UpM8f488ZvdmuhviENdjtxdSzi/PFA6VHwQfLJ8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=MP35/Jk10kYdEjc9WLZ0XOAg8+Tk7LjGbSKLZkh+du2rLuZWKxyZHEQmyo/KVQ8+alc5b09WtFHs4i/20i/zNux57jp3q+fzlQTRLr+I7Sq17AcsIrcPEjJfO4rYZSR4e3Lh8DPN9IPqSE4gL99Lxe0KP4RVGDjF8k5CEQH8QU0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Do1gfPmH; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Do1gfPmH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739563448; x=1771099448;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=p81+UpM8f488ZvdmuhviENdjtxdSzi/PFA6VHwQfLJ8=;
  b=Do1gfPmHl1C2bFxAtnOqKcJS2Nc5vLKOy8ibzWPhWpObfTv5PfPqSr72
   N/nvx0tlu2KSdb0P+DpnOnmh6MvPVQg2hvZegeYyQT8Z4VkMNeeZb3x3d
   FYEpq9sBtCp6cFVZgAQh4pj2JlEdjB24ZHANhzA4tukHoqVdgw0Y0Hz8W
   0XG42Lp7hDYQd9sbDNDnYVsiZTKvLNxZR2hfMkOS3fK9gGarJ6t3b4Fsm
   +NRYyQ3z3wxNRyJQOZyzBgNnO0vCCqt+jhClw7CorpkHZn377FJ051k8L
   BFRihsYj9qbPaluXfwufptxLNVfxVLE86ImnHmHtQVh5BgvQyT/FiOC0b
   g==;
X-CSE-ConnectionGUID: fmwXP7beR6StOLorOsiSxw==
X-CSE-MsgGUID: rNP7lp33Tueue0fNT+Reog==
X-IronPort-AV: E=McAfee;i="6700,10204,11345"; a="50968972"
X-IronPort-AV: E=Sophos;i="6.13,286,1732608000"; 
   d="scan'208";a="50968972"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Feb 2025 12:04:07 -0800
X-CSE-ConnectionGUID: ckt3SvLES+CFmBPpfOiR/Q==
X-CSE-MsgGUID: v/Xqbp8+Qv6jAp5EpNDpXw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="118471515"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 14 Feb 2025 12:04:07 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tj1uu-001A6n-0r;
	Fri, 14 Feb 2025 20:04:04 +0000
Date: Sat, 15 Feb 2025 04:03:32 +0800
From: kernel test robot <lkp@intel.com>
To: Pavel Begunkov <asml.silence@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [isilence:zctx/sg-iter-ops 3/4] /usr/bin/ld:
 io_uring/notif.o:undefined reference to `io_sg_from_iter'
Message-ID: <202502150356.UKeka4R0-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/isilence/linux zctx/sg-iter-ops
head:   2c44968c915f2b63fe7199a8a13496ec554e1cd6
commit: 80d41ad4211efa00ef21828a41a81d7372441c29 [3/4] net: move ->sg_from_iter into ubuf_info_ops
config: um-allnoconfig (https://download.01.org/0day-ci/archive/20250215/202502150356.UKeka4R0-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250215/202502150356.UKeka4R0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502150356.UKeka4R0-lkp@intel.com/

All errors (new ones prefixed by >>):

   /usr/bin/ld: warning: .tmp_vmlinux1 has a LOAD segment with RWX permissions
>> /usr/bin/ld: io_uring/notif.o:(.rodata+0x4): undefined reference to `io_sg_from_iter'
   clang: error: linker command failed with exit code 1 (use -v to see invocation)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
