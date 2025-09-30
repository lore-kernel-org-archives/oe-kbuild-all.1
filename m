Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88F5926E16E
	for <oe-kbuild-all@lists.linux.dev>; Tue, 30 Sep 2025 04:03:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759205006; cv=none; b=EYZnlLGo05YVleRNC4QVM0gwYQOLeSFwhlNWIjdPBhR/+38IXvu34qELNcoMLQD34ciPCWGHfZjVWZXMn5uFoilmUYxC6nr5QxVkB0GLfGH/RvTKXwlexDkOdQxAAqnAS75yxMqgAByJe8MA9UwHZt6npxl27VbgKXGmbZaa3Z8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759205006; c=relaxed/simple;
	bh=mMD9rKKYTPrKpsaNGngjXCmG3RLM8/EV4arW7Giaal0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=eGwNd5hzmzY0mr7NDDOMtBCyDaLqcy5fFVS9INt3iUbyOI0cSD62tUaaKdeQfMGHiZknYg3rJGYDF+O8oWMQa8tgI7vLWOuFZWky+uWgqmTBwgGVCE5831pIG3isgk6itb4ogNfUqczDOPd6878vHW2MgbStIcYWEHogo1SMqh0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Tpm8IGPZ; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Tpm8IGPZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1759205004; x=1790741004;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=mMD9rKKYTPrKpsaNGngjXCmG3RLM8/EV4arW7Giaal0=;
  b=Tpm8IGPZoM2/qQAlCfL2kCMPThocksDRNGimAZyjIl/DJjem1GNEVA71
   JHFI6cyGOH73a8MEDkeKIMx7AtdjAM7uv4DLgI4CEYWqLpjQ4jOcrNfwA
   NZM0KtgrVDZhgR1t/APEJveFmcGKTZ2FT8dwVhr+ZGO1Z2LyZiBz3pjNs
   22ONPctcez9o3oqDzHPUJGOCIug7GCEPXpeqqSo9rQxMe6lyaXiOz95mV
   LPLIlrwtLRPXwGt2WylNJgoNKsjLQlKUABMPGZrjLqiWbXpNBmAYNBk2U
   GaoJ9ZO3omSI3lO1FjKUqysj+2HGc1S1v6olCq+wXEFpWvMVnzLsDreMy
   g==;
X-CSE-ConnectionGUID: euU8t+ocSxCSlg8LkA4syg==
X-CSE-MsgGUID: daJKI7l0RnGy7sbYqtQj6g==
X-IronPort-AV: E=McAfee;i="6800,10657,11568"; a="72070580"
X-IronPort-AV: E=Sophos;i="6.18,303,1751266800"; 
   d="scan'208";a="72070580"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Sep 2025 21:03:24 -0700
X-CSE-ConnectionGUID: 9whVPoMAR9iLTj/7UlzjXQ==
X-CSE-MsgGUID: kX4eFeH8QnOsYC5Kztx/MQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,303,1751266800"; 
   d="scan'208";a="209363333"
Received: from igk-lkp-server01.igk.intel.com (HELO 0e586ad5e7f7) ([10.91.175.65])
  by fmviesa001.fm.intel.com with ESMTP; 29 Sep 2025 21:03:22 -0700
Received: from kbuild by 0e586ad5e7f7 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1v3RaC-0000000068j-1tLW;
	Tue, 30 Sep 2025 04:03:20 +0000
Date: Tue, 30 Sep 2025 06:02:28 +0200
From: kernel test robot <lkp@intel.com>
To: Sean Christopherson <seanjc@google.com>
Cc: oe-kbuild-all@lists.linux.dev, Fuad Tabba <tabba@google.com>,
	Ackerley Tng <ackerleytng@google.com>, linux-doc@vger.kernel.org
Subject: [sean-jc:x86/gmem_default_shared 2/10] htmldocs:
 Documentation/virt/kvm/api.rst:6430: WARNING: Literal block ends without a
 blank line; unexpected unindent. [docutils]
Message-ID: <202509300613.3q6FQjEc-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/sean-jc/linux x86/gmem_default_shared
head:   71c8199c17c4609d842dc94e6d225156d8574d82
commit: 65042d91905d173c70a5474c1c032076bbf702dc [2/10] KVM: guest_memfd: Add INIT_SHARED flag, reject user page faults if not set
reproduce: (https://download.01.org/0day-ci/archive/20250930/202509300613.3q6FQjEc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509300613.3q6FQjEc-lkp@intel.com/

All warnings (new ones prefixed by >>):

   ERROR: Cannot find file ./include/linux/mutex.h
   ERROR: Cannot find file ./include/linux/mutex.h
   WARNING: No kernel-doc for file ./include/linux/mutex.h
   ERROR: Cannot find file ./include/linux/fwctl.h
   WARNING: No kernel-doc for file ./include/linux/fwctl.h
>> Documentation/virt/kvm/api.rst:6430: WARNING: Literal block ends without a blank line; unexpected unindent. [docutils]
   Documentation/virt/kvm/api.rst:6432: WARNING: Literal block expected; none found. [docutils]


vim +6430 Documentation/virt/kvm/api.rst

f844b9053e048e Sean Christopherson 2025-09-29  6419  
f844b9053e048e Sean Christopherson 2025-09-29  6420    - GUEST_MEMFD_FLAG_MMAP enables using mmap() on the file descriptor.
f844b9053e048e Sean Christopherson 2025-09-29  6421  
65042d91905d17 Sean Christopherson 2025-09-29  6422    - GUEST_MEMFD_FLAG_INIT_SHARED makes all memory in the file shared during
65042d91905d17 Sean Christopherson 2025-09-29  6423      KVM_CREATE_GUEST_MEMFD (memory files created without INIT_SHARED will be
65042d91905d17 Sean Christopherson 2025-09-29  6424      marked private).  Shared memory can be faulted into host userspace page
65042d91905d17 Sean Christopherson 2025-09-29  6425      tables. Private memory cannot.
65042d91905d17 Sean Christopherson 2025-09-29  6426  
65042d91905d17 Sean Christopherson 2025-09-29  6427      Note!  Since KVM doesn't yet support in-place private<=>shared conversions,
65042d91905d17 Sean Christopherson 2025-09-29  6428      INIT_SHARED must be specified in order to fault memory into userspace page
65042d91905d17 Sean Christopherson 2025-09-29  6429      tables.  This limitation will go away when in-place conversions are supported.
f844b9053e048e Sean Christopherson 2025-09-29 @6430  ::
3d3a04fad25a66 Fuad Tabba          2025-07-29  6431  

:::::: The code at line 6430 was first introduced by commit
:::::: f844b9053e048ebcebbedf37c72d6084a41fa773 KVM: Rework KVM_CAP_GUEST_MEMFD_MMAP into KVM_CAP_GUEST_MEMFD_FLAGS

:::::: TO: Sean Christopherson <seanjc@google.com>
:::::: CC: Sean Christopherson <seanjc@google.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
