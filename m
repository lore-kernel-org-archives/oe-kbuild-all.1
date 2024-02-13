Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8731633989
	for <oe-kbuild-all@lists.linux.dev>; Tue, 13 Feb 2024 13:40:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707831659; cv=none; b=USvOOQgGl2I0iTpBn/Jlv5v6Ngv/k1NFzr4veY4++bEwaIIfi70zMwbtcXUMLFx5Crpz2OC6yM/jAwMLBdS8AWnlbQohvQdPh2yGLKuCiwmMDRLDWgszA5lFb2cpbYnn3GCHjEsyIQyHQSisK/bJF8jtZamXx09IrdgCZoRACCE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707831659; c=relaxed/simple;
	bh=YfUqG/C2LUsBB4FsmgT4VdGRJY4l2Y6Yb+dyr8zBKno=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=qHfbLwL84FwMk3N9aaC7F6qzp2JBmz1JBNU/mfDPq3i/NGY4DwEo1NCHs2xfQSqeDmxZ+JelEDP4uVKpa/uTjX+4V5FtzRCKK5mSwX+WHbX3zAF73n0v0qFll8PME8EgxVxaqk1izfshJa0lfqEOR9O//hDBY1bwC7Ogm8P/Dyc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kTMYjg2P; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kTMYjg2P"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707831657; x=1739367657;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=YfUqG/C2LUsBB4FsmgT4VdGRJY4l2Y6Yb+dyr8zBKno=;
  b=kTMYjg2PLcFT3orTcdZbUcjSP1G7i85aQcWbTSSikfGCTiTy6qMNoLtf
   6MQnmp1MCtU3SEWvGgpLFkfEBVIgkOIGfRQ4O1OUzkhtfaht+6rapn+YR
   iAW5fLDKOKggIGgbEtJrWyGxSsrFvoQ33NAMvCuhXCAVyDM/kRJ4tdNKU
   yultasqD6xxwwA0ZW90eEDnXJCZdQ16f3UtqXeOYlweXEGg9EmiIcX8Su
   1jY3wfwLCSTUyv8/Ptzcl0qCh7lc0tLIek8SdQze/sSmKEDt1YdUykvif
   ChhWMv4W+OKQnV87tCE4rNV7/2kxhp1c8v1wkXHUiR0UsrH9HNFmIOoqh
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10982"; a="27279755"
X-IronPort-AV: E=Sophos;i="6.06,157,1705392000"; 
   d="scan'208";a="27279755"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Feb 2024 05:40:56 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,157,1705392000"; 
   d="scan'208";a="2864769"
Received: from lkp-server01.sh.intel.com (HELO 01f0647817ea) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 13 Feb 2024 05:40:55 -0800
Received: from kbuild by 01f0647817ea with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rZt1o-0007lO-1Z;
	Tue, 13 Feb 2024 13:40:52 +0000
Date: Tue, 13 Feb 2024 21:40:33 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6 8455/8463] error[E0425]: cannot find
 function `fget` in crate `bindings`
Message-ID: <202402132123.YVYyFwI8-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android15-6.6
head:   136261ec9aae3a884377dab3b61a714a94099e27
commit: 40eecc8bdf64fd8f67395071e9fcd12c9ec4e480 [8455/8463] FROMLIST: rust: file: add Rust abstraction for `struct file`
config: x86_64-rhel-8.3-rust (https://download.01.org/0day-ci/archive/20240213/202402132123.YVYyFwI8-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240213/202402132123.YVYyFwI8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402132123.YVYyFwI8-lkp@intel.com/

All errors (new ones prefixed by >>):

>> error[E0425]: cannot find function `fget` in crate `bindings`
   --> rust/kernel/file.rs:179:56
   |
   179   |           let ptr = ptr::NonNull::new(unsafe { bindings::fget(fd) }).ok_or(BadFdError)?;
   |                                                          ^^^^ help: a function with a similar name exists: `sget`
   |
   ::: rust/bindings/bindings_generated.rs:39342:5
   |
   39342 | /     pub fn sget(
   39343 | |         type_: *mut file_system_type,
   39344 | |         test: ::core::option::Option<
   39345 | |             unsafe extern "C" fn(
   ...     |
   39357 | |         data: *mut core::ffi::c_void,
   39358 | |     ) -> *mut super_block;
   | |_________________________- similarly named function `sget` defined here
--
>> error[E0425]: cannot find function `fput` in crate `bindings`
   --> rust/kernel/file.rs:234:28
   |
   234   |         unsafe { bindings::fput(obj.cast().as_ptr()) }
   |                            ^^^^ help: a function with a similar name exists: `dput`
   |
   ::: rust/bindings/bindings_generated.rs:33719:5
   |
   33719 |     pub fn dput(arg1: *mut dentry);
   |     ------------------------------ similarly named function `dput` defined here

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
