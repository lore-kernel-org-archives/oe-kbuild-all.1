Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61D0027AC31
	for <oe-kbuild-all@lists.linux.dev>; Fri, 16 Oct 2026 03:17:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792120657; cv=none; b=cF5NW8UbNxtsKoU1icbN1Azs2F/uzQ8zyIxl5n5ApAUvXnhb8hyt2sHaXoJ9S3uHSlEUCLFxR3It6QPWNSW3x5m4kzGHcw/ABhsoCbISKVZfiGuYGFsXVZtTIxye0wLJ3zJGcWBqeHSWTuejVp6b/EQgUGs8CaEyoFMb/2IMcxk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792120657; c=relaxed/simple;
	bh=Hys5VfJb2FpvH3WtWLA7xodI0pXlCZ8YhE1x2URQ3VY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Wf09ULA0kRP0Y6ispAMOodIcYMSDmcQXuaTGdsXIrwK42O7vTC9ZbWC5bXlUCuiQdFqHlxSpoMg8J8YownPXL2qjPHyl9y0QL6L3Yq5GZPrjDFZzpXf4rU9I3gj4pdxVY8IRqH4z82mYwDAQmfPgJuN/E4+oMTyWPpztzbIcV2A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Jbb4O4Pz; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Jbb4O4Pz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792120656; x=1823656656;
  h=date:from:to:cc:subject:message-id;
  bh=Hys5VfJb2FpvH3WtWLA7xodI0pXlCZ8YhE1x2URQ3VY=;
  b=Jbb4O4PzXMrSNIRT0ZJDChlZrItiZyRe4LGMA2oG4+c1XUQdCz9uIc8Y
   wQjjTORNi/u+7m64KmU1Jxv5abfLbTyeIoujUcPuV2CK0tVlhbjjdZFN1
   Ioc9gyShRpDqqbp/qupMjmNwrCMWmObDiuoZ1Try9g8KTXJx231wuS60D
   cyrLORwcUs1s8gkL77ASvLzlqdjsH/Ri9pL7VXP8LYhSo5uD75HPjR6Ky
   LZSLuX2I9psvqHZegtqgBjZaESnlG6JjcP1iX8J1Q06wPw6LdpoocioUk
   XxWG3wbevWKjbjPQnALcEYjqLuIlpeG+mfQJ5m7H9hljS4kBBBdI7DNhG
   A==;
X-CSE-ConnectionGUID: kLBhwqxuRImEqxfCxaKXEQ==
X-CSE-MsgGUID: S9pflGOrQamDM2q5hlqxXQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11936"; a="779875"
X-IronPort-AV: E=Sophos;i="6.27,161,1787036400"; 
   d="scan'208";a="779875"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Oct 2026 20:17:36 -0700
X-CSE-ConnectionGUID: GbMo80SjTays6iuSquI4wQ==
X-CSE-MsgGUID: R4LOr9dUTWubb4BuM+DU/A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,161,1787036400"; 
   d="scan'208";a="1753132"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 15 Oct 2026 20:17:34 -0700
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xHYRn-00000000HVa-2fVq;
	Fri, 16 Oct 2026 03:17:31 +0000
Date: Fri, 16 Oct 2026 11:17:12 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12 0/1]
 kernel/trace/ring_buffer.c:2455: warning: Function parameter or struct member
 'writer' not described in '__ring_buffer_alloc'
Message-ID: <202610161109.IKID6XEg-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Vincent,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android16-6.12
head:   c82b35cb007f01c9aef84e93febc8961486d59ec
commit: 162c11d25bcd8e91df9b1410358d8a92b30a0700 [0/1] FROMLIST: ring-buffer: Introducing ring-buffer writer
config: i386-allmodconfig (https://download.01.org/0day-ci/archive/20261016/202610161109.IKID6XEg-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261016/202610161109.IKID6XEg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610161109.IKID6XEg-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> kernel/trace/ring_buffer.c:2455: warning: Function parameter or struct member 'writer' not described in '__ring_buffer_alloc'

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for GET_FREE_REGION
   Depends on [n]: SPARSEMEM [=n]
   Selected by [m]:
   - RESOURCE_KUNIT_TEST [=m] && RUNTIME_TESTING_MENU [=y] && KUNIT [=m]


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
