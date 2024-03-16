Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8764511CAB
	for <oe-kbuild-all@lists.linux.dev>; Sat, 16 Mar 2024 11:59:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710590390; cv=none; b=c1zNkdaaLCVDMtc50ulOw3+LT2mhEuwgz3PtQunUOStbVqgsW1I9H6ynUN9KrcMcnQGIqSXRCwcnkxU++4JBAasvd8PhNu+0zBKE0OwrhrBCEXql9ueu0Kd8XsgWFYgMRuFVb9I0I/ZKxtF9LI/Tkki6EO0ey0G07mIKdU4VFhQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710590390; c=relaxed/simple;
	bh=GQaOmXx49F22BsoNWUl25IfPcwQiWW9FchaNzSXZqtI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=bnsxVTdukTk3/QnoZGU/PYt3KsCfJ9bxIAO/7SvZa/aCbtsDA2ds3QttdwqZjcsYM6SWqSNx3xl9sPJgCsPrCDp0IzgS5P29QXqAWSD1U1gDgdx2cQTPNpzEiM0t9SFgrWmuuXxk5FVdGu1Z68XR0BCWLrHtmMjy93ePcLtHDOY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DUvLq37E; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DUvLq37E"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1710590389; x=1742126389;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=GQaOmXx49F22BsoNWUl25IfPcwQiWW9FchaNzSXZqtI=;
  b=DUvLq37EQ2ecisSA4AvTZ7CN18gb5vyAmxE9MBqt16D5EOWlabMT3yiN
   0u3/fbk+tpCKQJLOgDOM6WQM+AZqfQdz0AePqW/bZ9Q5INVrbaUDFZjAY
   8isvtaGCQRWT42Wt1/7H0N5QreBzIsWW7RvAkd/t3jmUOc8m6uH/zAbsR
   U7LMeoE/xxMyEuaXqW414hK7TpJgXIZl+hVTgnf1Gwf1mBZMYAyhRc+8D
   gg9LAkVzbkiXZ//Jg3JSN2ELKcDEMwEv1HInr6/pdMwnbxjmiX0F9XSS0
   5e3/gvSUsKyLTBfe1h+EXG9eSBVyQfWBPHcacUsah+9RVGNdlQUsKVaei
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11014"; a="6064480"
X-IronPort-AV: E=Sophos;i="6.07,130,1708416000"; 
   d="scan'208,217";a="6064480"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Mar 2024 04:59:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,130,1708416000"; 
   d="scan'208,217";a="17669188"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 16 Mar 2024 04:59:46 -0700
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rlShT-000FNn-1x;
	Sat, 16 Mar 2024 11:59:43 +0000
Date: Sat, 16 Mar 2024 19:59:29 +0800
From: kernel test robot <lkp@intel.com>
To: Asahi Lina <lina@asahilina.net>
Cc: oe-kbuild-all@lists.linux.dev, dri-devel@lists.freedesktop.org,
	Danilo Krummrich <dakr@redhat.com>
Subject: [drm-misc:topic/rust-drm 10/18] error[E0425]: cannot find function
 `my_get_param_handler` in this scope
Message-ID: <202403161916.bAUNmINI-lkp@intel.com>
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
commit: 6f60fd0a4eca6108d590543d3ce3707706dedaa2 [10/18] rust: drm: ioctl: Add DRM ioctl abstraction
config: x86_64-randconfig-r113-20240315 (https://download.01.org/0day-ci/archive/20240316/202403161916.bAUNmINI-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240316/202403161916.bAUNmINI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403161916.bAUNmINI-lkp@intel.com/

All errors (new ones prefixed by >>):

>> error: expected one of `->`, `where`, or `{`, found `}`
   --> rust/doctests_kernel_generated.rs:352:1
   |
   348 | fn foo(device: &kernel::drm::device::Device<Self>,
   |    --- while parsing this `fn`
   ...
   351 | )
   |  - expected one of `->`, `where`, or `{`
   352 | } _doctest_main__kbuild_src_consumer_rust_kernel_drm_ioctl_rs_81_0() }
   | ^ unexpected token
--
>> error: free function without a body
   --> rust/doctests_kernel_generated.rs:348:1
   |
   348 | / fn foo(device: &kernel::drm::device::Device<Self>,
   349 | |        data: &mut bindings::argument_type,
   350 | |        file: &kernel::drm::file::File<Self::File>,
   351 | | )
   | | ^- help: provide a definition for the function: `{ <body> }`
   | |_|
   |
--
>> error[E0425]: cannot find function `my_get_param_handler` in this scope
   --> rust/doctests_kernel_generated.rs:400:61
   |
   400 |     (FOO_GET_PARAM, drm_foo_get_param, ioctl::RENDER_ALLOW, my_get_param_handler),
   |                                                             ^^^^^^^^^^^^^^^^^^^^ not found in this scope
--
>> error[E0599]: no method named `to_errno` found for type `u32` in the current scope
   --> rust/doctests_kernel_generated.rs:399:1
   |
   399 | / kernel::declare_drm_ioctls! {
   400 | |     (FOO_GET_PARAM, drm_foo_get_param, ioctl::RENDER_ALLOW, my_get_param_handler),
   401 | | }
   | |_^ method not found in `u32`
   |
   = note: this error originates in the macro `kernel::declare_drm_ioctls` (in Nightly builds, run with -Z macro-backtrace for more info)
--
>> error[E0433]: failed to resolve: use of undeclared crate or module `bindings`
   --> rust/doctests_kernel_generated.rs:349:19
   |
   349 |        data: &mut bindings::argument_type,
   |                   ^^^^^^^^ use of undeclared crate or module `bindings`
--
>> error[E0433]: failed to resolve: `Self` is only available in impls, traits, and type definitions
   --> rust/doctests_kernel_generated.rs:350:39
   |
   350 |        file: &kernel::drm::file::File<Self::File>,
   |                                       ^^^^ `Self` is only available in impls, traits, and type definitions
--
>> error[E0411]: cannot find type `Self` in this scope
   --> rust/doctests_kernel_generated.rs:348:45
   |
   348 | fn foo(device: &kernel::drm::device::Device<Self>,
   |    --- `Self` not allowed in a function     ^^^^ `Self` is only available in impls, traits, and type definitions
--
>> error[E0425]: cannot find value `DRM_IOCTL_FOO_GET_PARAM` in this scope
   --> rust/doctests_kernel_generated.rs:400:6
   |
   400 |     (FOO_GET_PARAM, drm_foo_get_param, ioctl::RENDER_ALLOW, my_get_param_handler),
   |      ^^^^^^^^^^^^^ not found in this scope
--
>> error[E0412]: cannot find type `drm_foo_get_param` in crate `$crate::uapi`
   --> rust/doctests_kernel_generated.rs:400:21
   |
   400 |     (FOO_GET_PARAM, drm_foo_get_param, ioctl::RENDER_ALLOW, my_get_param_handler),
   |                     ^^^^^^^^^^^^^^^^^ not found in `$crate::uapi`
--
>> error[E0433]: failed to resolve: use of undeclared crate or module `ioctl`
   --> rust/doctests_kernel_generated.rs:400:40
   |
   400 |     (FOO_GET_PARAM, drm_foo_get_param, ioctl::RENDER_ALLOW, my_get_param_handler),
   |                                        ^^^^^ use of undeclared crate or module `ioctl`
   |
   help: consider importing this module
   |
   3   + use kernel::drm::ioctl;
   |

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
