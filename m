Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3E023CB543
	for <oe-kbuild-all@lists.linux.dev>; Mon, 10 Aug 2026 12:04:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786363497; cv=none; b=ByIqSmbA03g12gzj0vg637ouYONySueyqASDwrwjSCGCADm2kLrNWUq4y0K1ibrokGMAfO/6E38TuqbxTDw+I98m7adX0tAho9NoKvjnUvXu2I6SHDjxsXl7ZDKZzoG3cw+J41UDMK+9I1LC38mpgkTV6Hl7twMZsSVoO8WAkc0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786363497; c=relaxed/simple;
	bh=U82eM8eNTDzG+OaW1DdKWhRGB39rDk0xaydfjLOST4w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=npN5d1rdX1nZAYIlJtPF8RsBS4odORrhOmdlMv9js0Zavc/QVOiwqr0GCYnAK7S5mcQ8Wk/sDXa80UagLhXRXjgafT5CnkXgGz+zj6Yu1nCq6HEVLoJLFPWrvX/6yCPyQUqIJJw+XUBz38M6Df/9siOYvzLG0IxLuTtlvCOKuPw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RsAA8zV9; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RsAA8zV9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786363496; x=1817899496;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=U82eM8eNTDzG+OaW1DdKWhRGB39rDk0xaydfjLOST4w=;
  b=RsAA8zV9hDN2qS8FOBgYaZ0k0BG7oCS7CTEiIBpeLb7w502aYT8DeOAs
   3idntSXNGhK39NabMSsPbNxRojf90z7iX9148k7qVSeNdABLCqz2hgYfB
   NKf6h4mePPdir/kHX182IpsijAxCLt+yfdpYAXpkgv8ima22JSivdinND
   ZbuwoE7iYBkOqHfdZxJwkQk7VCMbahVG1dwiBz2av2ejesAThXV16MNn0
   gMQ5J4Bo3qUsw+vYS1EJP6xh4xHaZwjyzbli29NenszvIccjYqgz5k732
   nuhkdQMDSqmTn7kPl8zy9iX8VciQqMOSYBlwTdfzWDQLuUt25XexU7FW2
   A==;
X-CSE-ConnectionGUID: ottLI4+JTaed6ydRWwf7RQ==
X-CSE-MsgGUID: g9oBnzkrQvm2kIAPxK2Hfg==
X-IronPort-AV: E=McAfee;i="6800,10657,11870"; a="90688637"
X-IronPort-AV: E=Sophos;i="6.25,215,1779174000"; 
   d="scan'208";a="90688637"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Aug 2026 05:04:55 -0700
X-CSE-ConnectionGUID: i6zw2jiqSIyW9f7rRwUJew==
X-CSE-MsgGUID: rD5jcv6hTbS9PRJ5slS1gQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,215,1779174000"; 
   d="scan'208";a="263632584"
Received: from igk-lkp-server01.igk.intel.com (HELO 3cba2a188a06) ([10.211.93.152])
  by orviesa009.jf.intel.com with ESMTP; 10 Aug 2026 05:04:54 -0700
Received: from kbuild by 3cba2a188a06 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wtOkO-000000005Ta-0Cio;
	Mon, 10 Aug 2026 12:04:52 +0000
Date: Mon, 10 Aug 2026 14:04:28 +0200
From: kernel test robot <lkp@intel.com>
To: Alexandru Radovici <alexandru.radovici@wyliodrin.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH RFC 2/2] rust: usb: add control message send and receive
Message-ID: <202608101304.PBIoqR9D-lkp@intel.com>
References: <20260801-rust-usb_control_msg-v1-2-655bb444b52c@wyliodrin.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260801-rust-usb_control_msg-v1-2-655bb444b52c@wyliodrin.com>

Hi Alexandru,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on 8ba098e6b6ff0db8edf28528d1552be261af30d4]

url:    https://github.com/intel-lab-lkp/linux/commits/Alexandru-Radovici/rust-usb-add-endpoint-abstraction/20260804-141353
base:   8ba098e6b6ff0db8edf28528d1552be261af30d4
patch link:    https://lore.kernel.org/r/20260801-rust-usb_control_msg-v1-2-655bb444b52c%40wyliodrin.com
patch subject: [PATCH RFC 2/2] rust: usb: add control message send and receive
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20260810/202608101304.PBIoqR9D-lkp@intel.com/config)
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
rustc: rustc 1.96.0 (ac68faa20 2026-05-25)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260810/202608101304.PBIoqR9D-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608101304.PBIoqR9D-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> warning: unresolved link to `Self::max_packet_mult`
   --> rust/kernel/usb/endpoint.rs:321:66
   |
   321 |     /// transactions per microframe, which [`max_packet_mult()`](Self::max_packet_mult)
   |                                                                  ^^^^^^^^^^^^^^^^^^^^^ the struct `HostEndpoint` has no field or associated item named `max_packet_mult`
--
>> warning: unresolved link to `Interface::current_alt_setting`
   --> rust/kernel/usb.rs:346:29
   |
   346 | /// active at a time; see [`Interface::current_alt_setting()`].
   |                             ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ the struct `Interface` has no function named `current_alt_setting`
--
>> warning: unresolved link to `Endpoint::as_in`
   --> rust/kernel/usb.rs:391:11
   |
   391 |     /// [`Endpoint::as_in()`], [`Endpoint::as_out()`] and [`Endpoint::as_control()`].
   |           ^^^^^^^^^^^^^^^^^ no item named `Endpoint` in scope
--
>> warning: unresolved link to `Endpoint::as_out`
   --> rust/kernel/usb.rs:391:34
   |
   391 |     /// [`Endpoint::as_in()`], [`Endpoint::as_out()`] and [`Endpoint::as_control()`].
   |                                  ^^^^^^^^^^^^^^^^^^ no item named `Endpoint` in scope
--
>> warning: unresolved link to `Endpoint::as_control`
   --> rust/kernel/usb.rs:391:61
   |
   391 |     /// [`Endpoint::as_in()`], [`Endpoint::as_out()`] and [`Endpoint::as_control()`].
   |                                                             ^^^^^^^^^^^^^^^^^^^^^^ no item named `Endpoint` in scope

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
