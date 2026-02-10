Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A073333440
	for <oe-kbuild-all@lists.linux.dev>; Tue, 10 Feb 2026 07:26:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770708378; cv=none; b=P2J5nYBujEPebTSfaAJzXhSOD6KCHP5shkDQdRKHux76LZW00hHRBDu1Hvw+cLm1JBA6ERklI4Tb6kDd1slJguURPAhDIKUAxR9TBA29qbEeoS6pBNVw6B41Y/N1MrimHsQCDDErkveuT0p6omHdQ6yelhd7IAP8VfavRBPxazM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770708378; c=relaxed/simple;
	bh=H9pLWBd1itMH4X5jtGhIum4UAnFYFyjrzN68ERle3sI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kd7Nhv59+xzf0lFxV2xvrkoIrlxCPgZxK8IqipDFPqFoZWzEjD/hRHLh9i44y1pYoOBr4WM4IgFXVTvbCRsGZ10dtdw+6gJHKKnPuyqvYMU96QKHutNbQ7kFV1t6gJzADGGYPqsmJJpfzWkpC4MkFY340l9/qQYOp9jj1dOeLHU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XJDInZ8s; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XJDInZ8s"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770708378; x=1802244378;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=H9pLWBd1itMH4X5jtGhIum4UAnFYFyjrzN68ERle3sI=;
  b=XJDInZ8spZL4/ohsWx2jfmmF6kimHm4utXhHOLornzipVgDUf1dbeior
   nsdXCOX/nMogmMN6ylu85s2Qaf00m0KS+89z4K+wgVhTUM4DxwOsiikpg
   pTWhvoNQJ316+j/8n5K49e6YRteYQY/d1bFGzBIwHjq79m1gNxPZPWs8J
   e66+0VVux7YKEByTt0XxXDqWVvCSOKdNhI/TB0YARI3ZVP6HEkJ3mDXkN
   lOtlnQ1L4Jqb+ZTyEIjKDkq4VKzAJRAA3MrZUN8B1k/g23UJqBSryNyNb
   3YKg5INd5VSKoo5M7TIEtwaFknStS0Uv8HNgriHXewvMX6siCH0BD2XyZ
   w==;
X-CSE-ConnectionGUID: DTncyCE1RjqVJ0VPGXPOfA==
X-CSE-MsgGUID: vbqSFd7XSF+j89CWNFEw1Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11696"; a="82152604"
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; 
   d="scan'208";a="82152604"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Feb 2026 23:26:17 -0800
X-CSE-ConnectionGUID: Y1j+YbBpTLWb/6B3PbuQGA==
X-CSE-MsgGUID: N7rdKDBzTGapokN/FK8JRw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; 
   d="scan'208";a="242451140"
Received: from igk-lkp-server01.igk.intel.com (HELO e5404a91d123) ([10.211.93.152])
  by orviesa002.jf.intel.com with ESMTP; 09 Feb 2026 23:26:11 -0800
Received: from kbuild by e5404a91d123 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vpi8N-000000000ht-3QLi;
	Tue, 10 Feb 2026 07:26:07 +0000
Date: Tue, 10 Feb 2026 08:25:09 +0100
From: kernel test robot <lkp@intel.com>
To: Joel Fernandes <joelagnelf@nvidia.com>, linux-kernel@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Jonathan Corbet <corbet@lwn.net>,
	Alex Deucher <alexander.deucher@amd.com>,
	Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
	Jani Nikula <jani.nikula@linux.intel.com>,
	Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
	Rodrigo Vivi <rodrigo.vivi@intel.com>,
	Tvrtko Ursulin <tursulin@ursulin.net>,
	Huang Rui <ray.huang@amd.com>,
	Matthew Auld <matthew.auld@intel.com>,
	Matthew Brost <matthew.brost@intel.com>,
	Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
	Helge Deller <deller@gmx.de>, Danilo Krummrich <dakr@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Trevor Gross <tmgross@umich.edu>,
	John Hubbard <jhubbard@nvidia.com>
Subject: Re: [PATCH -next v8 2/3] rust: gpu: Add GPU buddy allocator bindings
Message-ID: <202602100828.yiR4khw2-lkp@intel.com>
References: <20260209214246.2783990-3-joelagnelf@nvidia.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260209214246.2783990-3-joelagnelf@nvidia.com>

Hi Joel,

kernel test robot noticed the following build errors:

[auto build test ERROR on next-20260209]

url:    https://github.com/intel-lab-lkp/linux/commits/Joel-Fernandes/rust-clist-Add-support-to-interface-with-C-linked-lists/20260210-054655
base:   next-20260209
patch link:    https://lore.kernel.org/r/20260209214246.2783990-3-joelagnelf%40nvidia.com
patch subject: [PATCH -next v8 2/3] rust: gpu: Add GPU buddy allocator bindings
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20260210/202602100828.yiR4khw2-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260210/202602100828.yiR4khw2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602100828.yiR4khw2-lkp@intel.com/

All errors (new ones prefixed by >>):

>> rust/bindings/bindings_helper.h:32:10: fatal error: 'linux/gpu_buddy.h' file not found
>> Unable to generate bindings: clang diagnosed error: rust/bindings/bindings_helper.h:32:10: fatal error: 'linux/gpu_buddy.h' file not found
--
>> rust/helpers/gpu.c:3:10: fatal error: 'linux/gpu_buddy.h' file not found
>> Unable to generate bindings: clang diagnosed error: rust/helpers/gpu.c:3:10: fatal error: 'linux/gpu_buddy.h' file not found
--
   In file included from rust/helpers/helpers.c:35:
>> rust/helpers/gpu.c:3:10: fatal error: 'linux/gpu_buddy.h' file not found
       3 | #include <linux/gpu_buddy.h>
         |          ^~~~~~~~~~~~~~~~~~~
   1 error generated.


vim +32 rust/bindings/bindings_helper.h

    30	
    31	#include <linux/acpi.h>
  > 32	#include <linux/gpu_buddy.h>
    33	#include <drm/drm_device.h>
    34	#include <drm/drm_drv.h>
    35	#include <drm/drm_file.h>
    36	#include <drm/drm_gem.h>
    37	#include <drm/drm_ioctl.h>
    38	#include <kunit/test.h>
    39	#include <linux/auxiliary_bus.h>
    40	#include <linux/bitmap.h>
    41	#include <linux/blk-mq.h>
    42	#include <linux/blk_types.h>
    43	#include <linux/blkdev.h>
    44	#include <linux/clk.h>
    45	#include <linux/completion.h>
    46	#include <linux/configfs.h>
    47	#include <linux/cpu.h>
    48	#include <linux/cpufreq.h>
    49	#include <linux/cpumask.h>
    50	#include <linux/cred.h>
    51	#include <linux/debugfs.h>
    52	#include <linux/device/faux.h>
    53	#include <linux/dma-direction.h>
    54	#include <linux/dma-mapping.h>
    55	#include <linux/errname.h>
    56	#include <linux/ethtool.h>
    57	#include <linux/fdtable.h>
    58	#include <linux/file.h>
    59	#include <linux/firmware.h>
    60	#include <linux/fs.h>
    61	#include <linux/i2c.h>
    62	#include <linux/interrupt.h>
    63	#include <linux/io-pgtable.h>
    64	#include <linux/ioport.h>
    65	#include <linux/jiffies.h>
    66	#include <linux/jump_label.h>
    67	#include <linux/mdio.h>
    68	#include <linux/mm.h>
    69	#include <linux/miscdevice.h>
    70	#include <linux/of_device.h>
    71	#include <linux/pci.h>
    72	#include <linux/phy.h>
    73	#include <linux/pid_namespace.h>
    74	#include <linux/platform_device.h>
    75	#include <linux/pm_opp.h>
    76	#include <linux/poll.h>
    77	#include <linux/property.h>
    78	#include <linux/pwm.h>
    79	#include <linux/random.h>
    80	#include <linux/refcount.h>
    81	#include <linux/regulator/consumer.h>
    82	#include <linux/sched.h>
    83	#include <linux/security.h>
    84	#include <linux/slab.h>
    85	#include <linux/sys_soc.h>
    86	#include <linux/task_work.h>
    87	#include <linux/tracepoint.h>
    88	#include <linux/usb.h>
    89	#include <linux/wait.h>
    90	#include <linux/workqueue.h>
    91	#include <linux/xarray.h>
    92	#include <trace/events/rust_sample.h>
    93	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
