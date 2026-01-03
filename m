Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D6D8A95E
	for <oe-kbuild-all@lists.linux.dev>; Sat,  3 Jan 2026 04:29:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767414563; cv=none; b=tRb/JOqvggdDb9Px/6Y3vCWN55aGozhFYEuA6PUrCTwCN5T8NxCjSMiW9bgafoYZepxCUDpmeRB4LMVNTg5h76sSZoGadbevwa/s8hkb90hW7OPwBkTplfRMGOv0WEK0cQOavpsuldfFJf64RfMgG77M43endh77Luev/+i+M7I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767414563; c=relaxed/simple;
	bh=M2MUDzU7v0PxQABcib+TTm5cmX6cSOqBZfaPh14B5vE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gk0ZCjZ9KkD9fTKyTqRdl1Nsslk1kB0BrLvGjG0wRWeiJciDFX2uHZv79mWnsIx9vmU9rFwEhRZUCJ1DQqF2XUC/ECQdW96mDYhJzhneJqVJtEkKHy2laHOxXOVSLJSjNPq1epera5gprhr4CglMMyZgFHz5H4tnOdQejKA3cf0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=i/7DMo+K; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="i/7DMo+K"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767414561; x=1798950561;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=M2MUDzU7v0PxQABcib+TTm5cmX6cSOqBZfaPh14B5vE=;
  b=i/7DMo+Kk5/yg7LrcORhn3vgkyE0ZZ56i0jCrfj59s/8PX5wAyOcO0nG
   Kio+IAO9+uHIL1Zx4qlQvr1WdLlgPJXxxz6A/q0kk3IkFeQ4VDaRK7Pbv
   7qSOQQ/PR3jnRSZwxVDZbiXl1yb/eLh2sPF7BUULjv7NTPs2nbT2trD+2
   SSL4dznW9C6wyjfWLiFogcFU2JkRKeJWWot0q6eD+ExiWoAebKhMNpKvT
   pNbakbmha3B2N03lQRsBwb6mhhVH7sq74vvSbVWysqUSbgxzuTXgIX2Vk
   6k2cHrodx3hLEwHLdYoIGHzsiJKlMbEsdOAp8K5QQoiMVozG9lgCNb3Ly
   w==;
X-CSE-ConnectionGUID: k5NL0gg3R9e6mZHVDOKTnA==
X-CSE-MsgGUID: AHKPApALQ0uiEze9m9ecQA==
X-IronPort-AV: E=McAfee;i="6800,10657,11659"; a="72734366"
X-IronPort-AV: E=Sophos;i="6.21,198,1763452800"; 
   d="scan'208";a="72734366"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jan 2026 20:29:20 -0800
X-CSE-ConnectionGUID: HcC4e9/bQua265CauCJCMw==
X-CSE-MsgGUID: AdUbU7K4R2+7jQ8zgG4TQg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,198,1763452800"; 
   d="scan'208";a="201701996"
Received: from igk-lkp-server01.igk.intel.com (HELO 92b2e8bd97aa) ([10.211.93.152])
  by orviesa009.jf.intel.com with ESMTP; 02 Jan 2026 20:29:14 -0800
Received: from kbuild by 92b2e8bd97aa with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vbtGJ-000000000bp-3aS0;
	Sat, 03 Jan 2026 04:29:11 +0000
Date: Sat, 3 Jan 2026 05:28:31 +0100
From: kernel test robot <lkp@intel.com>
To: Shankari Anand <shankari.ak0208@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Arve =?iso-8859-1?B?SGr4bm5lduVn?= <arve@android.com>,
	Todd Kjos <tkjos@android.com>, Martijn Coenen <maco@android.com>,
	Joel Fernandes <joelagnelf@nvidia.com>,
	Christian Brauner <brauner@kernel.org>,
	Carlos Llamas <cmllamas@google.com>,
	Suren Baghdasaryan <surenb@google.com>,
	Danilo Krummrich <dakr@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Alexandre Courbot <acourbot@nvidia.com>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Igor Korotin <igor.korotin.linux@gmail.com>,
	Michal Wilczynski <m.wilczynski@samsung.com>
Cc: oe-kbuild-all@lists.linux.dev, Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Trevor Gross <tmgross@umich.edu>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Abdiel Janulgue <abdiel.janulgue@gmail.com>,
	Robin Murphy <robin.murphy@arm.com>
Subject: Re: [PATCH v2 4/4] rust: types: remove temporary re-exports of ARef
 and AlwaysRefCounted
Message-ID: <202601030523.4eFrzaYI-lkp@intel.com>
References: <20260102202714.184223-5-shankari.ak0208@gmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260102202714.184223-5-shankari.ak0208@gmail.com>

Hi Shankari,

kernel test robot noticed the following build errors:

[auto build test ERROR on staging/staging-testing]
[also build test ERROR on staging/staging-next staging/staging-linus rust/rust-next usb/usb-testing usb/usb-next usb/usb-linus next-20251219]
[cannot apply to linus/master v6.16-rc1]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Shankari-Anand/rust-i2c-Update-ARef-and-AlwaysRefCounted-imports-to-use-sync-aref/20260103-061451
base:   staging/staging-testing
patch link:    https://lore.kernel.org/r/20260102202714.184223-5-shankari.ak0208%40gmail.com
patch subject: [PATCH v2 4/4] rust: types: remove temporary re-exports of ARef and AlwaysRefCounted
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20260103/202601030523.4eFrzaYI-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260103/202601030523.4eFrzaYI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601030523.4eFrzaYI-lkp@intel.com/

All errors (new ones prefixed by >>):

>> error[E0432]: unresolved import `crate::types::ARef`
   --> rust/kernel/device/property.rs:17:13
   |
   17 |     types::{ARef, Opaque},
   |             ^^^^ no `ARef` in `types`
   |
   = help: consider importing this struct instead:
   crate::sync::aref::ARef
--
>> error[E0432]: unresolved import `crate::types::ARef`
   --> rust/kernel/scatterlist.rs:41:13
   |
   41 |     types::{ARef, Opaque},
   |             ^^^^ no `ARef` in `types`
   |
   = help: consider importing this struct instead:
   crate::sync::aref::ARef
--
>> error[E0405]: cannot find trait `AlwaysRefCounted` in module `crate::types`
   --> rust/kernel/device/property.rs:362:27
   |
   362 | unsafe impl crate::types::AlwaysRefCounted for FwNode {
   |                           ^^^^^^^^^^^^^^^^ not found in `crate::types`
   |
   help: consider importing this trait
   |
   7   + use crate::sync::aref::AlwaysRefCounted;
   |
   help: if you import `AlwaysRefCounted`, refer to it directly
   |
   362 - unsafe impl crate::types::AlwaysRefCounted for FwNode {
   362 + unsafe impl AlwaysRefCounted for FwNode {
   |

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
