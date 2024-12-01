Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 344E633086
	for <oe-kbuild-all@lists.linux.dev>; Sun,  1 Dec 2024 04:29:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733027350; cv=none; b=YQX07dzJgarzISwUVdctTeWA0dT9hmA+djgtdrTGuolT7jmzQsSkn0z72gmlx50TlfLU9D9V69VQ1532bnrY9U6soMU7hbMMuFpD+MtAYcV5GbaBpnssFVde3GQ9AMgzobIb5p3coUIKUYAEWhGT6CGNRuC6VQuw4y5zvVSqbU4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733027350; c=relaxed/simple;
	bh=hoQpx80ABvAg7lxwf+LSvlEv7CQp55ZLaDJpQtQSB2U=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=MLI23hexPKN03V2ZqJaTb9iF3qIGRlWhBOlz7lr0Je5QFHPXMVUeRcz+49/WM/WRZwwP2AvgI9gy2QR5Kw/0cN3SDeObOsa0VzaorVjwgDhLD/Fo1fxfgAeDSdgyjuTrVHob3lNQRrGyMaSjo1HVXs9lWj/bgokJK+GZRPMtJVg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KumIus/V; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KumIus/V"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733027348; x=1764563348;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=hoQpx80ABvAg7lxwf+LSvlEv7CQp55ZLaDJpQtQSB2U=;
  b=KumIus/VkXii2bXstais5eU+4uLkEjIbg5Ho+4FCjBToq49aqpBlre5S
   YUxeWRCW3U0htbhoZvVV6FZYQXAp1kmhQrmNUEDrCFoMHOjDxEk7Zindl
   1y7eqT5VSHZNPeOhFfnxHnvfIUMPcCPj9Zi/1+HqnyHTkb+t2jePLGwE3
   6nofuxvpQT0JGDa8zLvT+ClgsWRsH/JPfoYP+299y1IHdqMkYtGDljsjt
   oMWG8xfjf4PXQPYLytQaw9K7YwMnhXILjfYj6xL8lM7XehkBe3uGkrEZx
   P5bH0kPmiRmvS0Goek3AeBRGaMUQ6+VrjgeTyC509Jj05ypUHWisYu58V
   Q==;
X-CSE-ConnectionGUID: 3VH+o+fLSY+BvHaTXNvpkQ==
X-CSE-MsgGUID: o6yPLYR4TX6Np7Scs6q7aQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11272"; a="55696335"
X-IronPort-AV: E=Sophos;i="6.12,199,1728975600"; 
   d="scan'208";a="55696335"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Nov 2024 20:29:07 -0800
X-CSE-ConnectionGUID: ynhSQ+QfS3SJvi1jsbRmUQ==
X-CSE-MsgGUID: nYyDsLLbRE+gUpNDqD3BTQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,199,1728975600"; 
   d="scan'208";a="96866184"
Received: from lkp-server02.sh.intel.com (HELO 36a1563c48ff) ([10.239.97.151])
  by fmviesa003.fm.intel.com with ESMTP; 30 Nov 2024 20:29:06 -0800
Received: from kbuild by 36a1563c48ff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tHbZw-0001Eg-1R;
	Sun, 01 Dec 2024 04:29:04 +0000
Date: Sun, 1 Dec 2024 12:28:12 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12 109/328]
 kernel/trace/ring_buffer.c:2455: warning: Function parameter or struct
 member 'writer' not described in '__ring_buffer_alloc'
Message-ID: <202412011243.6Q4nJOzd-lkp@intel.com>
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

tree:   https://android.googlesource.com/kernel/common android16-6.12
head:   55ff5f6bc99d57f4b10bbbfa45b626de7117f676
commit: 162c11d25bcd8e91df9b1410358d8a92b30a0700 [109/328] FROMLIST: ring-buffer: Introducing ring-buffer writer
config: x86_64-defconfig (https://download.01.org/0day-ci/archive/20241201/202412011243.6Q4nJOzd-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241201/202412011243.6Q4nJOzd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412011243.6Q4nJOzd-lkp@intel.com/

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
