Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E30A4D518
	for <oe-kbuild-all@lists.linux.dev>; Fri, 15 Mar 2024 17:38:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710524302; cv=none; b=lgBxI7hFjTBanyi+QwLXIdhU5HhTeisWDtJ5cq0otNLCjDrG5nb7pIDcWjbCiCUDtsu0DpiL1shoIFYtFdVzbPqO8Et7ggWchbKo/ParlCRd/oCFfsXOKgb6yvu7nuCBjz877vCvAyfs1HaL64VaSytr37OsYFo874SJ+a/rod4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710524302; c=relaxed/simple;
	bh=CTcucCNyDkjPKR9Z8zgz/pCmmLiyHIz1XnumTxngFkM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=f3nNd/mwaUAnz/9J9x4yQHJADYCzH+ATWPci3M0sybxmZVHUw6EEvEZj+9eyFVDpq1KwIN9RsuPKbyETkkiuz8g/DGD5LoAsm/I7ZILTTMZqPB0+HvHCJOl8gjbE4ZFh6EutCArIQxqrBGm48VmEIoL0k+OqHNbw5DKt5hbTBCA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nhVnPzY/; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nhVnPzY/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1710524301; x=1742060301;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=CTcucCNyDkjPKR9Z8zgz/pCmmLiyHIz1XnumTxngFkM=;
  b=nhVnPzY/+qLw9Dg+s2IrxCAt8QezxL4g6KDonpuiNOgdT1O/5dfmngcP
   9S1lqETJxVpCv5u2Kmn56Phy4IgDbdWP7eQvfz4ebT/Wk7nLwxhScqdIw
   ahpJcFdImOr846OpRUQi5HhyRHDyBQJWFCGkTBfmuhVd5tnOI/FErTQJA
   OCsvQ2A5ejlOXvf0eBppfUznlTgEq3JBvZoJ6KmkuolC+7WcdKUgOgIy/
   xMTLAqDeG/31PK2hIqPACCkLvbqhzT4p3yjVMbkplKPTCe1fJhuUPh9Y6
   4nR6Ag2GrhrzENbsC6lTrAeZ5eMfUco/iM9MDoMUuOWII7wORxSp1iOBI
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11014"; a="16128630"
X-IronPort-AV: E=Sophos;i="6.07,129,1708416000"; 
   d="scan'208";a="16128630"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Mar 2024 10:38:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,129,1708416000"; 
   d="scan'208";a="50193539"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 15 Mar 2024 10:38:19 -0700
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rlBVY-000EgH-1B;
	Fri, 15 Mar 2024 17:38:16 +0000
Date: Sat, 16 Mar 2024 01:38:07 +0800
From: kernel test robot <lkp@intel.com>
To: Andreas Hindborg <a.hindborg@samsung.com>
Cc: oe-kbuild-all@lists.linux.dev, dri-devel@lists.freedesktop.org,
	Danilo Krummrich <dakr@redhat.com>
Subject: [drm-misc:topic/rust-drm 8/18] error[E0599]: no method named
 `revoke` found for opaque type `impl PinInit<Revocable<Example>>` in the
 current scope
Message-ID: <202403160126.yOqyf2Sq-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://anongit.freedesktop.org/drm/drm-misc topic/rust-drm
head:   42abbd1bc1f3362a9adee3d05e54518de90f2205
commit: 5aad7a29ba6037a224c3f8ff36bfb2c82a5d3f4d [8/18] rust: add revocable objects
config: x86_64-randconfig-r113-20240315 (https://download.01.org/0day-ci/archive/20240316/202403160126.yOqyf2Sq-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240316/202403160126.yOqyf2Sq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403160126.yOqyf2Sq-lkp@intel.com/

All errors (new ones prefixed by >>):

>> error[E0599]: no method named `revoke` found for opaque type `impl PinInit<Revocable<Example>>` in the current scope
   --> rust/doctests_kernel_generated.rs:2185:3
   |
   2185 | v.revoke();
   |   ^^^^^^ method not found in `impl PinInit<Revocable<Example>>`
   |
   = note: the full type name has been written to 'rust/doctests_kernel_generated.long-type-11207499695041056550.txt'
--
>> error[E0599]: no method named `revoke` found for opaque type `impl PinInit<Revocable<Example>>` in the current scope
   --> rust/doctests_kernel_generated.rs:2250:3
   |
   2250 | v.revoke();
   |   ^^^^^^ method not found in `impl PinInit<Revocable<Example>>`
   |
   = note: the full type name has been written to 'rust/doctests_kernel_generated.long-type-11949269667377111354.txt'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
