Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6342EB660
	for <oe-kbuild-all@lists.linux.dev>; Sat,  8 Mar 2025 05:59:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741413571; cv=none; b=XJ8x7LCH8t74yRzmf7sovZcztQu3qHv9XzjfAh1Uf5wQwFSeE89S18MYTR8aaoAqwYgUQ8JklWj7Cnf6Bof+rLj6cgFsscbklg/NrzNctAVsLMV6A+Wuw7kHfI3u48+D5ayAZ0wS7ierTMLX+jT/2DnGmhavXAWXxWlcdQeifTE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741413571; c=relaxed/simple;
	bh=T5pe+7FR5m7n5RPJDvrWEIXalQrTKWSTGLE1qEWcSrY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=NtFziDk6d5kWmtYMYTGL8p5rgdBobXBrAWh+oJxNHIdeEeW/q6kLiYC+QO489m8LPtppsynChqbj2V5JkKx0rjkTTUw+xdwqTViR+Y4p0Vde5gzYKyYhWYB7Ww7NiG28bj91QZO6wjVRmuUSrs+thSHgWyrASiureU7UT3h/4/g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=B9LfINkW; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="B9LfINkW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741413569; x=1772949569;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=T5pe+7FR5m7n5RPJDvrWEIXalQrTKWSTGLE1qEWcSrY=;
  b=B9LfINkWt4+DuwGRyPd/A9G1eK2PxNjbDsXmwviPHHE8sWD5ZxSlF7fB
   tjTyG0RvL2bHD5R5booCiQ6dbAywbGLc7/BtpKTyzEPL4Obl7H69e31W2
   wLwtjNnCJUfd3CK8RESbsH4JRfIaAYkl42DawIkSX+Yer4XwFIKcjgl7+
   nKy+E1wotCvxiy3JadYoLtmaOTBDnCTsKHHuVr+w9qGJh75BbGMwrd5rG
   TPwCXWoKz1H2zsfl9e9pq3ihWbvNFd7gXKA4L26VQv7aS+fD+XQv2BaaR
   wjTYdF4+Nmlz+p7E2+LoQfTWzxCL1+/DYC+yPyom99XCpyCicWw2WiSv8
   w==;
X-CSE-ConnectionGUID: q81wdEKDRsSXBRmjvUmQqg==
X-CSE-MsgGUID: 3RlCSioYRiWgfZvQ/QRVCQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11366"; a="42346835"
X-IronPort-AV: E=Sophos;i="6.14,231,1736841600"; 
   d="scan'208";a="42346835"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Mar 2025 21:59:28 -0800
X-CSE-ConnectionGUID: ZCl1k0c0TXmkRV9F42Fgbg==
X-CSE-MsgGUID: 3pAk4v3rRFa0nvUd+qCMqg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,231,1736841600"; 
   d="scan'208";a="119489806"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by orviesa006.jf.intel.com with ESMTP; 07 Mar 2025 21:59:28 -0800
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tqnDZ-0001YQ-2J;
	Sat, 08 Mar 2025 05:59:25 +0000
Date: Sat, 8 Mar 2025 13:58:56 +0800
From: kernel test robot <lkp@intel.com>
To: Dave Airlie <airlied@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jfern:nova-core-experiments 248/411] warning: empty doc comment
Message-ID: <202503081331.0UFpHvvJ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jfern/linux.git nova-core-experiments
head:   3b93174b3502247b0c46bd54a7cf5f4105274edb
commit: 0dcf2721f357dcdaaace07365dc427f110ab0934 [248/411] rust/list: add some more linked list helpers.
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20250308/202503081331.0UFpHvvJ-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250308/202503081331.0UFpHvvJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503081331.0UFpHvvJ-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> warning: empty doc comment
   --> rust/kernel/list.rs:523:5
   |
   523 |     ///
   |     ^^^
   |
   = help: consider removing or filling it
   = help: for further information visit https://rust-lang.github.io/rust-clippy/master/index.html#empty_docs
   = note: `-W clippy::empty-docs` implied by `-W clippy::all`
   = help: to override `-W clippy::all` add `#[allow(clippy::empty_docs)]`
--
>> warning: empty doc comment
   --> rust/kernel/list.rs:550:5
   |
   550 |     ///
   |     ^^^
   |
   = help: consider removing or filling it
   = help: for further information visit https://rust-lang.github.io/rust-clippy/master/index.html#empty_docs
--
>> warning: method `eq` can be confused for the standard trait method `std::cmp::PartialEq::eq`
   --> rust/kernel/list.rs:649:5
   |
   649 | /     pub fn eq(&self, test: &T) -> bool {
   650 | |
   651 | |     let me = self.current;
   652 | |     let testfield = unsafe { ListLinks::fields(T::view_links(test)) };
   ...   |
   656 | |     return false;
   657 | |     }
   | |_____^
   |
   = help: consider implementing the trait `std::cmp::PartialEq` or choosing a less ambiguous method name
   = help: for further information visit https://rust-lang.github.io/rust-clippy/master/index.html#should_implement_trait
   = note: `-W clippy::should-implement-trait` implied by `-W clippy::all`
   = help: to override `-W clippy::all` add `#[allow(clippy::should_implement_trait)]`

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
