Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41F5B182CD
	for <oe-kbuild-all@lists.linux.dev>; Sat,  8 Mar 2025 03:07:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741403271; cv=none; b=fOahkGXrvLhv8GNBNqCf40yd5cErjjL6zMMzse32JA2RSkAcM5d97Qi/a2BwFb5MZM7hLt9xYAv/l4QkoGZQRcZVZV3BWZPIu7LdrSuLp3tpRHc9axGBE0JhwTSNAiCoiNt45iovAcL7evJjTqjCQXPrqNDOCqLcVQTCH8VJIs4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741403271; c=relaxed/simple;
	bh=rIBoUNXgkWEeCtA7ua+UdccDFcgjhxZ3z4yKhTGYcmM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=QwOfNLjWB9QX7ruxIrc8cDoi+iuysN6YyXqersBL8lvB2I6NsAWWie1kQEIswB2KVXDfRNNhhHiH5NAmLLW73jkzq5u1zfi5d30iEB/bHY9Jd3RDllIEAwfxtLeHqYB2+b1wtwwl+Nxwvppc1FRrWS4+x3g0PtzG19CLVbo0Me4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OkmE9i/I; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OkmE9i/I"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741403269; x=1772939269;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=rIBoUNXgkWEeCtA7ua+UdccDFcgjhxZ3z4yKhTGYcmM=;
  b=OkmE9i/Ia7F8NGA7Is4TFMxFO8G6XCZYGJVb13nGkN7gA0HckbkHDnym
   CAk+oXYY1V4QFdMCtm+PhhuxdlYzboYOmMBOQRazTzH31SYrdIr2BdhKB
   O5sbQZ0Ngwc05Is0jz7DOH5Bl/le5zmjU53bM3o0rk02Egc904TuCEz9S
   wEBQNk8f+FKf3vctWaI1gC18GAvn7qMlUrfbtjsHt2eLjXPlvnOru8QZi
   rtlC0DE9oiXBCfvfiKugkTojAaTMxDNSbHRPcnBNCvqyFVP+eafOT7EqK
   ZwZkcBTTw05Oznl6Kr/T4IhHnCPDExMxDxs0hIbppbFJs3umBlJRB/u4Q
   A==;
X-CSE-ConnectionGUID: rpm/PIATQvGEWIc1Fy6jfA==
X-CSE-MsgGUID: SdgxvNQVRkitLvrDiJX71Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11366"; a="46384525"
X-IronPort-AV: E=Sophos;i="6.14,231,1736841600"; 
   d="scan'208";a="46384525"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Mar 2025 19:07:48 -0800
X-CSE-ConnectionGUID: PJ99xzGmTimDdpWhLSXBiA==
X-CSE-MsgGUID: imS0j+SRQYibT9+SRxlzUg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,231,1736841600"; 
   d="scan'208";a="119479172"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by fmviesa007.fm.intel.com with ESMTP; 07 Mar 2025 19:07:47 -0800
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tqkXR-0001P2-0y;
	Sat, 08 Mar 2025 03:07:45 +0000
Date: Sat, 8 Mar 2025 11:07:22 +0800
From: kernel test robot <lkp@intel.com>
To: Abdiel Janulgue <abdiel.janulgue@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, Dave Airlie <airlied@redhat.com>
Subject: [jfern:nova-core-experiments 53/411] warning: this public function
 might dereference a raw pointer but is not marked `unsafe`
Message-ID: <202503081056.KBKFX7ex-lkp@intel.com>
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
commit: a7533bb67625d3b2624275d3df8292c1ee6f4daf [53/411] rust: page: Extend support to vmalloc_to_page
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20250308/202503081056.KBKFX7ex-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250308/202503081056.KBKFX7ex-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503081056.KBKFX7ex-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> warning: this public function might dereference a raw pointer but is not marked `unsafe`
   --> rust/kernel/page.rs:93:48
   |
   93 |         if unsafe { !bindings::is_vmalloc_addr(cpu_addr) } {
   |                                                ^^^^^^^^
   |
   = help: for further information visit https://rust-lang.github.io/rust-clippy/master/index.html#not_unsafe_ptr_arg_deref
   = note: `-W clippy::not-unsafe-ptr-arg-deref` implied by `-W clippy::all`
   = help: to override `-W clippy::all` add `#[allow(clippy::not_unsafe_ptr_arg_deref)]`
--
>> warning: this public function might dereference a raw pointer but is not marked `unsafe`
   --> rust/kernel/page.rs:99:55
   |
   99 |         let page = unsafe { bindings::vmalloc_to_page(cpu_addr) };
   |                                                       ^^^^^^^^
   |
   = help: for further information visit https://rust-lang.github.io/rust-clippy/master/index.html#not_unsafe_ptr_arg_deref

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
