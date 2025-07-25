Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C205A381C4
	for <oe-kbuild-all@lists.linux.dev>; Fri, 25 Jul 2025 00:45:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753404329; cv=none; b=ZhQyOim85Q0UbP1YJfZIggY8gIVXxmL8G1WjkTJHNFxfaTgKGFOjwCav/QlV5pVL9Bvy/4XMxMTXjA2o5NJmRaJBSUmRE5B2VB0nYrsC8xj7LMlmONHCqrs+NKBYJseMY0WbGdmmBw+76LU9BBIvuvDk9dwA3ACofyLQGrV1Kdw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753404329; c=relaxed/simple;
	bh=KIoZblFvD4OBNvY7+KpS684Ihjkx45n5AsCZWT7i7EQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ly1A8PXb4Ba+JFA+9XQQ7YiKHfS/i/B/Q0mAlPGubOdzdR/4IOTXUWmQ+zkYt0bMBMEEnw69Ec9A8kUAGLALRWEa7XdronsOTrup7DmwhbqSjdLZ47Anz5yw2kqr2KjW1yUHK4HpMFPEAm7OPjiVQ2jYOZ+fNCLT6Be8BKYuK7M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=j8TIIRnu; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="j8TIIRnu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1753404328; x=1784940328;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=KIoZblFvD4OBNvY7+KpS684Ihjkx45n5AsCZWT7i7EQ=;
  b=j8TIIRnubPVhNKjmx0nZyS4sB2OQuyFIZ2/Rf0kgGAizNUdWGCJ5NjVh
   jHBYE2Ge+oQOPXuJFXT3ZzuQyH1Q7ZpgwkFfi55EewU+VcwFPTf3b5ZHY
   16W92Zfxkxg9DkpcVkou9MlH8r/5TQfrP8ah1BRGkYDhh0bDek2oybhT3
   TRfA8njONCB2HvITt4fWi0itRP8ZitMUx5ML9JlVxRoPsxt4RASG8XKZr
   oKFsB3Rg/r4CuKg9WkVMhfaUfUa53hS1EXAN4IOk/1h2wkD9ZUSUhYQ4v
   3LUZa3xDeiyvDtspv8BSS7xRzKR2uI2mACCGgMkIvxUhd5XoGRkBwWzS1
   Q==;
X-CSE-ConnectionGUID: 3srUN+JoQ6qiNvv6tKvDWg==
X-CSE-MsgGUID: gQHRf5hoTVCNtWV1qJsfJA==
X-IronPort-AV: E=McAfee;i="6800,10657,11501"; a="67088681"
X-IronPort-AV: E=Sophos;i="6.16,338,1744095600"; 
   d="scan'208";a="67088681"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jul 2025 17:45:27 -0700
X-CSE-ConnectionGUID: scFnoLyCTnC3CdcrMOV3Xw==
X-CSE-MsgGUID: NLbUAxR6QkezaxQQQVRanA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,338,1744095600"; 
   d="scan'208";a="197703324"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 24 Jul 2025 17:45:26 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uf6Yu-000Kxb-0H;
	Fri, 25 Jul 2025 00:45:24 +0000
Date: Fri, 25 Jul 2025 08:44:56 +0800
From: kernel test robot <lkp@intel.com>
To: Kees Cook <kees@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v4 3/4] init.h: Disable sanitizer coverage for __init and
 __head
Message-ID: <202507250816.PgMzyj4y-lkp@intel.com>
References: <20250724055029.3623499-3-kees@kernel.org>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250724055029.3623499-3-kees@kernel.org>

Hi Kees,

kernel test robot noticed the following build errors:

[auto build test ERROR on next-20250723]
[also build test ERROR on v6.16-rc7]
[cannot apply to tip/x86/core arm64/for-next/core soc/for-next linus/master v6.16-rc7 v6.16-rc6 v6.16-rc5]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Kees-Cook/arm64-Handle-KCOV-__init-vs-inline-mismatches/20250724-135311
base:   next-20250723
patch link:    https://lore.kernel.org/r/20250724055029.3623499-3-kees%40kernel.org
patch subject: [PATCH v4 3/4] init.h: Disable sanitizer coverage for __init and __head
config: arm64-randconfig-002-20250725 (https://download.01.org/0day-ci/archive/20250725/202507250816.PgMzyj4y-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 12.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250725/202507250816.PgMzyj4y-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507250816.PgMzyj4y-lkp@intel.com/

All errors (new ones prefixed by >>):

   aarch64-linux-ld: Unexpected GOT/PLT entries detected!
   aarch64-linux-ld: Unexpected run-time procedure linkages detected!
   aarch64-linux-ld: arch/arm/xen/enlighten.o: in function `xen_guest_init':
>> enlighten.c:(.init.text+0x364): undefined reference to `xen_efi_runtime_setup'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
