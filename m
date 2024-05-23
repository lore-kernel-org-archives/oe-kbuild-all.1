Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5448B641
	for <oe-kbuild-all@lists.linux.dev>; Thu, 23 May 2024 15:06:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716476807; cv=none; b=gEvWy9XCiyoC/yNBCAGMubpQgx94tK8UkFNiPEWabxEYZCJZnzvFxU1Ypt++Fl2FOiuZJiE7Y3UBVmwgdCIIUHWaEMtFwJ59K9sUSqz7w5N3oCfEbfb5dwNLj7+e3dlnkABi7nlvbijJvPIfaaEuylj3MuPJNThdoiuICLQkc5A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716476807; c=relaxed/simple;
	bh=W+Pf1QDTAUCcce5+lSvdZ2wjOuQTZawv22poU8K0s78=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=m3qtNj+q1xjx/Hh0VXM7xf0yRnBn12L6Zb9dzt1b5VVdlC4u5joKaGjRDW4nss36Nz1EkUGb6SKcpAGJcyh8xgz+qGg0n27q4zfTzzOYF1kXebJRzPtn+BzQ7rrOSfLQiT6h/+OMcy1c5ngSztm2Go37ZALFFrTHscnHgzld3to=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WPI/XOzu; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WPI/XOzu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1716476805; x=1748012805;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=W+Pf1QDTAUCcce5+lSvdZ2wjOuQTZawv22poU8K0s78=;
  b=WPI/XOzuv6VQLpmqOEF9a9ZvTrZpw5psLcQUYzL8RqjCa8qdHhI+IlFI
   7Uarket8t9kQgNjWmQhDspROqpzF0bNtjc9LUDhZlNH+vA9U7SOn0t9ow
   bmhc+nEDjIlGuPzm+uBKJccownTLaumcYcStmrI1FNoFpRNFdBc8UthcU
   jdkTDiQ7v5J3U/69iXcTNOXfsYTAVh9Ts9B2ai1WYGI8EePZA+YHzTEs7
   IsYH6qu/3r9XAhYxsx6H26+cxg/7g6xfZHxxxYXgY4SCCCW896mHDelD+
   BQWIpUwmXMJsRPgj7Se4Sxb8Z3r6Wc2wecUszofLMflFQYfQOloCmrcRO
   A==;
X-CSE-ConnectionGUID: 1IPTmUO1RMaBy1tme4RDvQ==
X-CSE-MsgGUID: Dv+C/F5zQqefl+cr5Xjs6w==
X-IronPort-AV: E=McAfee;i="6600,9927,11081"; a="24209993"
X-IronPort-AV: E=Sophos;i="6.08,182,1712646000"; 
   d="scan'208";a="24209993"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 May 2024 08:05:58 -0700
X-CSE-ConnectionGUID: P5cEzI9vQvirZo4gdnd4lw==
X-CSE-MsgGUID: HhNJpDaLRWqYH7pv9w5KRQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,182,1712646000"; 
   d="scan'208";a="38473594"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by orviesa003.jf.intel.com with ESMTP; 23 May 2024 08:05:58 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sAA0x-0002zf-0r;
	Thu, 23 May 2024 15:05:55 +0000
Date: Thu, 23 May 2024 23:05:18 +0800
From: kernel test robot <lkp@intel.com>
To: Kairui Song <kasong@tencent.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: [akpm-mm:mm-unstable 34/107] fs/ceph/dir.o: warning: objtool:
 unexpected relocation symbol type in .rela.discard.unreachable
Message-ID: <202405232254.fWfccLnU-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-unstable
head:   c65920c76a977c2b73c3a8b03b4c0c00cc1285ed
commit: fb15800c8fd6bccfe20bdfd761b997c07a8be26d [34/107] ceph: drop usage of page_index
config: loongarch-defconfig (https://download.01.org/0day-ci/archive/20240523/202405232254.fWfccLnU-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240523/202405232254.fWfccLnU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405232254.fWfccLnU-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/ceph/dir.o: warning: objtool: unexpected relocation symbol type in .rela.discard.unreachable

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
