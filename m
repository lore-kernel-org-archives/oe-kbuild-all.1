Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82C9C28A72F
	for <oe-kbuild-all@lists.linux.dev>; Mon, 26 Jan 2026 19:55:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769457327; cv=none; b=lXLy/7KoZsrz1IuDkFKoedOdwewpejkXqXV9yZ7EaVpaCclrBQaJAmDquN9RKcJuTid6qKd3thykzpv7mcOnwlYlg2JLoKr0r0H/QQrl++kM4rXdTmwttZwxL9t2ze+9rB8sc+vFaY+cSHDI+Mh9tVDNDt79nFWDi87DA2FfeeM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769457327; c=relaxed/simple;
	bh=bzYjp+8xDiAYc9Gm7J8G6NjVxzQxrMXHBQZwbxSYmLc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jlNeoo8poZJLL6vfTaXEqIPagF6x92k8T5XGGRQdUAhUq5lbTzffDMM1XFieprDT0Bk8YLVdqp5bi1XbFzqoCdzsSC/Nn3ZcBJYRw818hvD9188fIS7+9ndZgKhiaUaSRN40Ndu/g3TqeWUq4UFiXqsvJZ7oQ7tzcWrfJ9LeSoo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mc5ehc/S; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mc5ehc/S"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769457325; x=1800993325;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=bzYjp+8xDiAYc9Gm7J8G6NjVxzQxrMXHBQZwbxSYmLc=;
  b=mc5ehc/SPhUU9eVTVHm3boI3rIlPQ9Cal9giHUuVvAOKvyDnHwLlEsns
   z8QXy0gjdf2spzWH/jOqXSP5aIqbw6+2UIbJ7CBNUUP1zVVklWESd/V7y
   SwpzSVUNB7MzGwjcdD8eGmdM4buu64gvAZFNiXn6xfCqQPCfxYkfDeB2X
   9GxO8DOvMjSaLvE+0xYwT+YCFRk6QDGuVPPvc11yti0BFKVLuW8mama6v
   OLGx4V+NdmjCh7B5uqVYejgaewE03FTIYwr5V9bEK8EaqvXWMd8f0Tv/t
   dChdxTLonfnzcQ5qPlznNUo01Sw1EKPbZvfwYBpyMaTsMeatGtl6qEKK4
   Q==;
X-CSE-ConnectionGUID: Uo00OcraSz64rWpGmZX1XA==
X-CSE-MsgGUID: AIXzQNooRdGjUk3wSLf8Hw==
X-IronPort-AV: E=McAfee;i="6800,10657,11683"; a="88220404"
X-IronPort-AV: E=Sophos;i="6.21,255,1763452800"; 
   d="scan'208";a="88220404"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jan 2026 11:55:24 -0800
X-CSE-ConnectionGUID: M+z32x+hT9COs304ebl1QA==
X-CSE-MsgGUID: CM8cJ8CfSFeNo2ReGsNN7w==
X-ExtLoop1: 1
Received: from igk-lkp-server01.igk.intel.com (HELO afc5bfd7f602) ([10.211.93.152])
  by fmviesa003.fm.intel.com with ESMTP; 26 Jan 2026 11:55:23 -0800
Received: from kbuild by afc5bfd7f602 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vkSgD-000000001an-0TTB;
	Mon, 26 Jan 2026 19:55:21 +0000
Date: Mon, 26 Jan 2026 20:54:27 +0100
From: kernel test robot <lkp@intel.com>
To: SeungJong Ha via B4 Relay <devnull+engineer.jjhama.gmail.com@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH RFC 2/3] rust: tty: add TTY subsystem abstractions
Message-ID: <202601262059.RG0O6igF-lkp@intel.com>
References: <20260126-rust-tty-printk-driver-v1-2-28604e7e100e@gmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260126-rust-tty-printk-driver-v1-2-28604e7e100e@gmail.com>

Hi SeungJong,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on e741e19d7691c5e6f5c2bbff980d835dccb86054]

url:    https://github.com/intel-lab-lkp/linux/commits/SeungJong-Ha-via-B4-Relay/rust-bindings-add-TTY-subsystem-headers/20260126-202713
base:   e741e19d7691c5e6f5c2bbff980d835dccb86054
patch link:    https://lore.kernel.org/r/20260126-rust-tty-printk-driver-v1-2-28604e7e100e%40gmail.com
patch subject: [PATCH RFC 2/3] rust: tty: add TTY subsystem abstractions
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20260126/202601262059.RG0O6igF-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260126/202601262059.RG0O6igF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601262059.RG0O6igF-lkp@intel.com/

All errors (new ones prefixed by >>):

   PATH=/opt/cross/clang-20/bin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
   INFO PATH=/opt/cross/rustc-1.88.0-bindgen-0.72.1/cargo/bin:/opt/cross/clang-20/bin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
   /usr/bin/timeout -k 100 12h /usr/bin/make KCFLAGS= -fno-crash-diagnostics -Wno-error=return-type -Wreturn-type -funsigned-char -Wundef -falign-functions=64 W=1 --keep-going LLVM=1 -j32 -C source O=/kbuild/obj/consumer/x86_64-rhel-9.4-rust ARCH=x86_64 SHELL=/bin/bash rustfmtcheck
   make: Entering directory '/kbuild/src/consumer'
   make[1]: Entering directory '/kbuild/obj/consumer/x86_64-rhel-9.4-rust'
>> Diff in rust/kernel/tty/port.rs:9:
    
    use pin_init::PinInit;
    
   -use crate::{
   -    bindings,
   -    error::VTABLE_DEFAULT_ERROR,
   -    prelude::*,
   -    types::Opaque,
   -};
   +use crate::{bindings, error::VTABLE_DEFAULT_ERROR, prelude::*, types::Opaque};
    
    /// A combined TTY port and driver data structure.
    ///
>> Diff in rust/kernel/tty/driver.rs:6:
    
    use core::marker::PhantomData;
    
   -use super::{
   -    DriverPort,
   -    PortOperations,
   -    Tty,
   -};
   +use super::{DriverPort, PortOperations, Tty};
    use crate::{
        bindings,
   -    error::{
   -        Error,
   -        Result,
   -        VTABLE_DEFAULT_ERROR,
   -    },
   +    error::{Error, Result, VTABLE_DEFAULT_ERROR},
        prelude::*,
        sync::Arc,
        types::Opaque,
>> Diff in rust/kernel/tty/driver.rs:6:
    
    use core::marker::PhantomData;
    
   -use super::{
   -    DriverPort,
   -    PortOperations,
   -    Tty,
   -};
   +use super::{DriverPort, PortOperations, Tty};
    use crate::{
        bindings,
   -    error::{
   -        Error,
   -        Result,
   -        VTABLE_DEFAULT_ERROR,
   -    },
   +    error::{Error, Result, VTABLE_DEFAULT_ERROR},
        prelude::*,
        sync::Arc,
        types::Opaque,
>> Diff in rust/kernel/tty/port.rs:9:
    
    use pin_init::PinInit;
    
   -use crate::{
   -    bindings,
   -    error::VTABLE_DEFAULT_ERROR,
   -    prelude::*,
   -    types::Opaque,
   -};
   +use crate::{bindings, error::VTABLE_DEFAULT_ERROR, prelude::*, types::Opaque};
    
    /// A combined TTY port and driver data structure.
    ///
>> Diff in rust/kernel/tty.rs:14:
    use core::marker::PhantomData;
    
    pub use driver::{
   -    flags,
   -    oflag,
   -    DriverType,
   -    Operations,
   -    Options,
   -    TtyDriver,
   -    TtyDriverBuilder,
   -    TTYAUX_MAJOR,
   +    flags, oflag, DriverType, Operations, Options, TtyDriver, TtyDriverBuilder, TTYAUX_MAJOR,
    };
   -pub use port::{
   -    DriverPort,
   -    Operations as PortOperations,
   -};
   +pub use port::{DriverPort, Operations as PortOperations};
    
   -use crate::{
   -    bindings,
   -    sync::Arc,
   -};
   +use crate::{bindings, sync::Arc};
    
    /// TTY struct wrapper, generic over driver data and driver state types.
    ///
>> Diff in rust/kernel/tty/driver.rs:6:
    
    use core::marker::PhantomData;
    
   -use super::{
   -    DriverPort,
   -    PortOperations,
   -    Tty,
   -};
   +use super::{DriverPort, PortOperations, Tty};
    use crate::{
        bindings,
   -    error::{
   -        Error,
   -        Result,
   -        VTABLE_DEFAULT_ERROR,
   -    },
   +    error::{Error, Result, VTABLE_DEFAULT_ERROR},
        prelude::*,
        sync::Arc,
        types::Opaque,
>> Diff in rust/kernel/tty/port.rs:9:
    
    use pin_init::PinInit;
    
   -use crate::{
   -    bindings,
   -    error::VTABLE_DEFAULT_ERROR,
   -    prelude::*,
   -    types::Opaque,
   -};
   +use crate::{bindings, error::VTABLE_DEFAULT_ERROR, prelude::*, types::Opaque};
    
    /// A combined TTY port and driver data structure.
    ///
>> Diff in rust/kernel/tty.rs:14:
    use core::marker::PhantomData;
    
    pub use driver::{
   -    flags,
   -    oflag,
   -    DriverType,
   -    Operations,
   -    Options,
   -    TtyDriver,
   -    TtyDriverBuilder,
   -    TTYAUX_MAJOR,
   +    flags, oflag, DriverType, Operations, Options, TtyDriver, TtyDriverBuilder, TTYAUX_MAJOR,
    };
   -pub use port::{
   -    DriverPort,
   -    Operations as PortOperations,
   -};
   +pub use port::{DriverPort, Operations as PortOperations};
    
   -use crate::{
   -    bindings,
   -    sync::Arc,
   -};
   +use crate::{bindings, sync::Arc};
    
    /// TTY struct wrapper, generic over driver data and driver state types.
    ///
   make[2]: *** [Makefile:1871: rustfmt] Error 123
   make[2]: Target 'rustfmtcheck' not remade because of errors.
   make[1]: Leaving directory '/kbuild/obj/consumer/x86_64-rhel-9.4-rust'
   make[1]: *** [Makefile:248: __sub-make] Error 2
   make[1]: Target 'rustfmtcheck' not remade because of errors.
   make: *** [Makefile:248: __sub-make] Error 2
   make: Target 'rustfmtcheck' not remade because of errors.
   make: Leaving directory '/kbuild/src/consumer'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
