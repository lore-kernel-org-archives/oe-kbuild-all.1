Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE2013081B8
	for <oe-kbuild-all@lists.linux.dev>; Thu, 11 Dec 2025 11:23:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765452185; cv=none; b=MZ9S3TQuPQoMAQuaZWtfeaMZKemVvAcmJTxZkp4Q8VMrKydCT9MFVyb3eIv+zxOdf+apZqIwjLIOLQPrfpdyeRJ+8+HtR3jbab3fozqyRakgJBmRNxkG4JpuaGlrLGk/wpf6nSY8Ob+sz+12xNOmxIlCIK8pC41OjJEXPyVTm34=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765452185; c=relaxed/simple;
	bh=r9gL+giU4sz9yPYTXrW1oP3pYxWqjemabjEKPfO+98A=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=BRwaN/y1Ki7R02ERRE3g9QzUEzvMcuLJ0H14QLhAHsiRnOsBJAgNuOHIfkR2eXDl1wBJE2HNiNNp1YxF5rduuRyQCDe0fl7+U2KGdIfGsg8djdrOx4QasNeKh2g3bFWKZvT+kSjuidO8hEzPbs0GBHg2xSgzq+/8I4cdG7ly/Yg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UUocEQm4; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UUocEQm4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765452184; x=1796988184;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=r9gL+giU4sz9yPYTXrW1oP3pYxWqjemabjEKPfO+98A=;
  b=UUocEQm4zCLrcsy+Ywc4PV8rMEZ6Og0yzQ3hT0nHOabBnE/OLbrdhvmj
   zNRYqYnGTDC1DsxJgNsH8t7XOj8OaFVVdrU6YOTrAidhVGrcpVeRLgCeE
   gyWM1K754zfDvIVbqbvj6i5NHBmsuuYiDLH+BdHzagIqfpphwDMIIdYZY
   wt5GbHrpRu4eV0xFvqfQM9hrwPa856YX/5uCyK5dm4XmnKSeQrLnNBoE3
   Xy2tpUVTi/JlrSKWH9KIpviqSMTiadk0i80eDpueuvUI4ZohDANwYweL6
   0PghxLcsBf6QjFLjlbfSc1wksOEBzEMhQowOd2igNDblU69MXxlae0cma
   w==;
X-CSE-ConnectionGUID: GsR5aMeaRuG02dIPXjy1tA==
X-CSE-MsgGUID: sCNxhQoBSneu1srIcuZOLg==
X-IronPort-AV: E=McAfee;i="6800,10657,11638"; a="78543663"
X-IronPort-AV: E=Sophos;i="6.20,265,1758610800"; 
   d="scan'208";a="78543663"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Dec 2025 03:22:59 -0800
X-CSE-ConnectionGUID: rKH/f8VJSlGrIl3xaWM/eg==
X-CSE-MsgGUID: go+OuBZtSOaFDjpVJMhqDg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,265,1758610800"; 
   d="scan'208";a="201690335"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 11 Dec 2025 03:22:58 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vTel5-000000004aD-1D6g;
	Thu, 11 Dec 2025 11:22:55 +0000
Date: Thu, 11 Dec 2025 19:22:20 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12-desktop 2/2]
 kernel/trace/ring_buffer.c:2455: warning: Function parameter or struct
 member 'writer' not described in '__ring_buffer_alloc'
Message-ID: <202512111932.NqryiOVq-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Vincent,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android16-6.12-desktop
head:   1594e8fdf0af3790482e1d7e4d4dd3e5166f4f22
commit: 162c11d25bcd8e91df9b1410358d8a92b30a0700 [2/2] FROMLIST: ring-buffer: Introducing ring-buffer writer
config: i386-randconfig-141-20251211 (https://download.01.org/0day-ci/archive/20251211/202512111932.NqryiOVq-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251211/202512111932.NqryiOVq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512111932.NqryiOVq-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> kernel/trace/ring_buffer.c:2455: warning: Function parameter or struct member 'writer' not described in '__ring_buffer_alloc'

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for SND_PCM_IEC958
   Depends on [n]: SOUND [=y] && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_SOC_CONFIGS [=y]


vim +2455 kernel/trace/ring_buffer.c

be68d63a139bd4 Steven Rostedt (Google  2024-06-12  2440) 
be68d63a139bd4 Steven Rostedt (Google  2024-06-12  2441) /**
be68d63a139bd4 Steven Rostedt (Google  2024-06-12  2442)  * __ring_buffer_alloc - allocate a new ring_buffer
be68d63a139bd4 Steven Rostedt (Google  2024-06-12  2443)  * @size: the size in bytes per cpu that is needed.
be68d63a139bd4 Steven Rostedt (Google  2024-06-12  2444)  * @flags: attributes to set for the ring buffer.
be68d63a139bd4 Steven Rostedt (Google  2024-06-12  2445)  * @key: ring buffer reader_lock_key.
be68d63a139bd4 Steven Rostedt (Google  2024-06-12  2446)  *
be68d63a139bd4 Steven Rostedt (Google  2024-06-12  2447)  * Currently the only flag that is available is the RB_FL_OVERWRITE
be68d63a139bd4 Steven Rostedt (Google  2024-06-12  2448)  * flag. This flag means that the buffer will overwrite old data
be68d63a139bd4 Steven Rostedt (Google  2024-06-12  2449)  * when the buffer wraps. If this flag is not set, the buffer will
be68d63a139bd4 Steven Rostedt (Google  2024-06-12  2450)  * drop data when the tail hits the head.
be68d63a139bd4 Steven Rostedt (Google  2024-06-12  2451)  */
be68d63a139bd4 Steven Rostedt (Google  2024-06-12  2452) struct trace_buffer *__ring_buffer_alloc(unsigned long size, unsigned flags,
162c11d25bcd8e Vincent Donnefort       2024-09-11  2453  					 struct lock_class_key *key,
162c11d25bcd8e Vincent Donnefort       2024-09-11  2454  					 struct ring_buffer_writer *writer)
be68d63a139bd4 Steven Rostedt (Google  2024-06-12 @2455) {
be68d63a139bd4 Steven Rostedt (Google  2024-06-12  2456) 	/* Default buffer page size - one system page */
162c11d25bcd8e Vincent Donnefort       2024-09-11  2457  	return alloc_buffer(size, flags, 0, 0, 0, key, writer);
be68d63a139bd4 Steven Rostedt (Google  2024-06-12  2458) 

:::::: The code at line 2455 was first introduced by commit
:::::: be68d63a139bd4a0eae44d06234eaff8c07d207c ring-buffer: Add ring_buffer_alloc_range()

:::::: TO: Steven Rostedt (Google) <rostedt@goodmis.org>
:::::: CC: Steven Rostedt (Google) <rostedt@goodmis.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
