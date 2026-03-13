Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66B7A1A267
	for <oe-kbuild-all@lists.linux.dev>; Fri, 13 Mar 2026 02:43:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773369827; cv=none; b=PzernPbpW9SpsGLDAhPWd4qO8WIZXvA/7ljlh0DYqP1nhR7mnQjAwpLZ+K7Ra4ucD1bRAqGpILn88TXoY/sD1vVPAOhAXqKA9nvhRpGbewS9JETXCWd4mrmOcBuRLWrwOUNTXzpzDzopcVbEdBx/npUtDlBHnnffEgGGS0Xn7N0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773369827; c=relaxed/simple;
	bh=yVWLnY68mvHkqKmyiA1l/v5t4pYtxfwQIo7xiVtyWnI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Fosmuq5mXNzHbazjP7KECjn60pM3mvP0OzMNhhEgVtY5Pf7q4RaW6tBc9bmfp+OBUmqtUKjjTuDDp8t0e21G0bh0xUgC89wi4lSR1HQXaYa25eUUtbTTuM24U17FiOco0NtmNwelc1ywoDpto+cU9IbJrIgkVuQmlshDZusNPzc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=K1hjvw1Y; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="K1hjvw1Y"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773369826; x=1804905826;
  h=date:from:to:cc:subject:message-id;
  bh=yVWLnY68mvHkqKmyiA1l/v5t4pYtxfwQIo7xiVtyWnI=;
  b=K1hjvw1YahJoyNauMVIkglDaZJqbN0EYgzr7ywJrg1zXZturfFms8HHP
   bA3Bb19/7f0DvKAuo371dWA1biEPQoBPH8Z3YezQOUfgzC0Nd60HLyahk
   XLyXxPdB6KYQu1IwAyrjhpE7LNjU8p0BthlkD2Cvtv4gr2EDdQFlxLNKC
   BvfWtYF72acmH+5TPtKwtnJ2UmG3SUaNE+ttAsX0ggcJ9kpgsgmBfzwFJ
   vRSnX9HZ8EeMh6wLQO7UyaJJPUfImx+BJHmRO1BrL9uhMzXZXy6fqsOLt
   bQpLvNlgs/F3IudwGZVTVq96xoZxAC2uCMGtdK5VOys7UKp1gfFa7ghD0
   Q==;
X-CSE-ConnectionGUID: BjcbkVCwSLqs41cg6gibqQ==
X-CSE-MsgGUID: n4jZ7VkzS7+ZQ45Sv0Dy8A==
X-IronPort-AV: E=McAfee;i="6800,10657,11727"; a="74370390"
X-IronPort-AV: E=Sophos;i="6.23,117,1770624000"; 
   d="scan'208";a="74370390"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Mar 2026 19:43:45 -0700
X-CSE-ConnectionGUID: 8yaub4K0Seqq4umQEbdM0Q==
X-CSE-MsgGUID: FRrSSqMiRHK1HUokFkaasg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,117,1770624000"; 
   d="scan'208";a="217070779"
Received: from lkp-server01.sh.intel.com (HELO 418530b1a366) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 12 Mar 2026 19:43:44 -0700
Received: from kbuild by 418530b1a366 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w0sV4-000000003Lb-1G2y;
	Fri, 13 Mar 2026 02:43:42 +0000
Date: Fri, 13 Mar 2026 10:42:42 +0800
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [bcachefs:bcachefs-testing 334/405] Warning:
 fs/bcachefs/fs/check.c:555 function parameter 'trans' not described in
 'bch2_key_visible_in_snapshot'
Message-ID: <202603131041.xVXBJry0-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Kent,

FYI, the error/warning still remains.

tree:   https://evilpiepirate.org/git/bcachefs.git bcachefs-testing
head:   f11d1f15ba17c356e651751a149a02d9b55ebfd1
commit: 97a3660140c09dc6c698781146e1a3560236aafe [334/405] bcachefs: Plumb btree_trans to snapshot_is_ancestor()
config: openrisc-allmodconfig (https://download.01.org/0day-ci/archive/20260313/202603131041.xVXBJry0-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260313/202603131041.xVXBJry0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603131041.xVXBJry0-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: fs/bcachefs/fs/check.c:555 function parameter 'trans' not described in 'bch2_key_visible_in_snapshot'
>> Warning: fs/bcachefs/fs/check.c:594 function parameter 'trans' not described in 'bch2_ref_visible'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
