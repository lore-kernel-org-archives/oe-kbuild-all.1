Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC25B1B81D3
	for <oe-kbuild-all@lists.linux.dev>; Sat, 10 Jan 2026 01:04:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768007045; cv=none; b=faiW+4OCKPe3m0Yb4cg3zK3KqKLOKGl+tgd8QycvagIDbDLFu4QeNEZF+bDj30aY5TEnIpkKLIUKmbmvzh5HHlRsOJuvIx1g90v4RYdxU5ci/0bLgksr6/aXHq+n4R17ojq+4zqOrwtQHZtmDxKJKOgo7x855GdJD95pTpXEgmw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768007045; c=relaxed/simple;
	bh=j6KVbHQs8FIdO2Qtc0Sp4iOhfIJayw1AX0HpbB9e20M=;
	h=Date:From:To:Cc:Subject:Message-ID; b=nVVNQxQTFbGEqE9y9zlaLLDYA2RUL5Gll0o0U7+XH9xikmPbt+m9xlO6H/seRudXXThetUuFSjFWVUZ+Ta941vG5mpIBtSBjIWmJ9bQhzDkfI2br2ze0PRLICWBxOj9ZQ/D3e9o7iSSoNzSUrUojjbFFU92OyGEsOty4Omfe//Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kBbGi4lo; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kBbGi4lo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768007044; x=1799543044;
  h=date:from:to:cc:subject:message-id;
  bh=j6KVbHQs8FIdO2Qtc0Sp4iOhfIJayw1AX0HpbB9e20M=;
  b=kBbGi4lop2VDMik6AxH01zyE0pWUXKWXCfqNbwpo59dJAvm3/rdgjICM
   q6MldBGr4yVZYxqIxvncZZ14bmUB0ZkdRMIR/TkINnhc8M/O76H29LJy5
   ksaofTsF84j//QxR9hwZRFBOov7OPT2tsPR7Xrfy8NQS2bXZBr6aLhlU0
   dsE/CN1laZWfz2twvl8CK05nOM6T8A0PLfwNV9b+sjvy822QKvZt6eAAJ
   23XQT1NWZxqp2JUMlrh+CCC0FUWQwYFmJx10SYGrmO47iF8yMfBMw2ubP
   cWPwjnCUbkvERIBp9wbAMyc6YKeurAgZDsU3Qzn5FuD11a+4f1D+o/8On
   Q==;
X-CSE-ConnectionGUID: QiBsz0pIQlypf31iWJM6OA==
X-CSE-MsgGUID: oyui2d8PQgW+hNsgilo/BA==
X-IronPort-AV: E=McAfee;i="6800,10657,11666"; a="80755817"
X-IronPort-AV: E=Sophos;i="6.21,215,1763452800"; 
   d="scan'208";a="80755817"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jan 2026 17:04:03 -0800
X-CSE-ConnectionGUID: SNmmDZSfSk+D5LuIffXhgA==
X-CSE-MsgGUID: R9UqJAKMTnajVrB/5fZaCQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,215,1763452800"; 
   d="scan'208";a="203893315"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 09 Jan 2026 17:04:01 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1veNOZ-000000007uL-0Thb;
	Sat, 10 Jan 2026 01:03:59 +0000
Date: Sat, 10 Jan 2026 09:03:04 +0800
From: kernel test robot <lkp@intel.com>
To: Johannes Weiner <hannes@cmpxchg.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>,
 Linux Memory Management List <linux-mm@kvack.org>,
 Brendan Jackman <jackmanb@google.com>, Vlastimil Babka <vbabka@suse.cz>
Subject: {standard input}:26675: Error: operand out of range
 (0xffffffff not between 0 and 0x3f) `l.slli r21,r21,-1'
Message-ID: <202601100812.QjhXvtfv-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   372800cb95a35a7c40a07e2e0f7de4ce6786d230
commit: ee414bd97b3fa0a4f74e40004e3b4191326bd46c mm: page_alloc: tighten up find_suitable_fallback()
date:   8 months ago
config: openrisc-randconfig-r063-20260109 (https://download.01.org/0day-ci/archive/20260110/202601100812.QjhXvtfv-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260110/202601100812.QjhXvtfv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601100812.QjhXvtfv-lkp@intel.com/

All errors (new ones prefixed by >>):

   {standard input}: Assembler messages:
>> {standard input}:26675: Error: operand out of range (0xffffffff not between 0 and 0x3f) `l.slli r21,r21,-1'
   {standard input}:31576: Error: operand out of range (0xffffffff not between 0 and 0x3f) `l.slli r17,r17,-1'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
