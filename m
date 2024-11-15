Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD99D523A
	for <oe-kbuild-all@lists.linux.dev>; Fri, 15 Nov 2024 02:13:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731636789; cv=none; b=o6Gd1tnDO8V4TMdsBaRpiekDY87cu/vLygxqsZHshT2v5f/HIBqur6R17NlFsKh3VRpEO5dmgnFlpImje5L2Sw/SgKpHSUf+92yqYa4XzLjcQKUhFUhBHMrONSjf+S/sIZ0/pV6g/Zh+VkchjxoBt5et6hUdOV8DCmHTNxgfbEk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731636789; c=relaxed/simple;
	bh=W55xLFQzR6BYnGLoY51TzKYpozx5Qmsv5QlHQQbOdYM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ZVLx+zW5zpu+PvzxygT8WAFVLbnok1Z+T1Cgz5NQ6St52lX7Kx43I2Cvu8nFwTevZzOauu8oU8vRB8a22l7KG6H+BsZ99VFmHn9tTjaRgtDghLWbyImE4yA/4RLzSRWoBRvMA7nxMfGbKSxnVDsGHwYdxJuVuO/ppv7mVw/Lo5E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=B7PBre4U; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="B7PBre4U"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731636788; x=1763172788;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=W55xLFQzR6BYnGLoY51TzKYpozx5Qmsv5QlHQQbOdYM=;
  b=B7PBre4UaDpFg+90GGZ8eZ1B6Lq6dzboQaSyCmW+m880KZFZFS6G1ovG
   OFPQsxsBL4LNhN5ROpeoh11t+nqKj5zFktmaeNtUs+dvH8BqO9L0Hi9R8
   4zPs/HsJprTBeTm0CB9SnSqzKUY8SxA+0lRKjU/gNnAESzc4NEcLT5XjG
   AOZEh0zMeveu7n6ZFMT+21ANHjJP8uOFRdRsInMif4kdQosK0KtfNgIUD
   8DnkOSN2PyZALdKiXedl0uaWL20a3GwZg7B7yQ71ys3mB+3bKPQP9/fxY
   yg1ZYRp06RZl8T1nsqGsYws3HqhHGdA3CxzYso+p4fnJRAQuXaSRv+mrv
   w==;
X-CSE-ConnectionGUID: yXVh2D8dRYWZXyGYwaBZ0g==
X-CSE-MsgGUID: Gg+F1yGZRy+3gKZ1l65m+A==
X-IronPort-AV: E=McAfee;i="6700,10204,11256"; a="49141407"
X-IronPort-AV: E=Sophos;i="6.12,155,1728975600"; 
   d="scan'208";a="49141407"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Nov 2024 18:13:05 -0800
X-CSE-ConnectionGUID: iM+5jGFJR+aWFOGRgPrVZQ==
X-CSE-MsgGUID: 5kYnjOc6RdqudtAd2aVejg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,155,1728975600"; 
   d="scan'208";a="87974973"
Received: from lkp-server02.sh.intel.com (HELO 481373e0caf0) ([10.239.97.151])
  by fmviesa006.fm.intel.com with ESMTP; 14 Nov 2024 18:09:47 -0800
Received: from kbuild by 481373e0caf0 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tBlmI-00002R-1t;
	Fri, 15 Nov 2024 02:09:43 +0000
Date: Fri, 15 Nov 2024 10:08:50 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12 109/325]
 kernel/trace/ring_buffer.c:2455: warning: Function parameter or struct
 member 'writer' not described in '__ring_buffer_alloc'
Message-ID: <202411151037.Idc9piL9-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android16-6.12
head:   8d647cb15a3d7ad2067b883e01ce0527a5149c9a
commit: 162c11d25bcd8e91df9b1410358d8a92b30a0700 [109/325] FROMLIST: ring-buffer: Introducing ring-buffer writer
config: x86_64-defconfig (https://download.01.org/0day-ci/archive/20241115/202411151037.Idc9piL9-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241115/202411151037.Idc9piL9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411151037.Idc9piL9-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> kernel/trace/ring_buffer.c:2455: warning: Function parameter or struct member 'writer' not described in '__ring_buffer_alloc'


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
