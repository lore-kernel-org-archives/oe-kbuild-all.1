Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40807328565
	for <oe-kbuild-all@lists.linux.dev>; Tue, 16 Sep 2025 16:12:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758039132; cv=none; b=oXUDEB3X4gvX42oK/8jlaKj9hP9vsg+970OM25fcf9gWqR+o2dayut1pCYcK3gsfItqEnnbGTwbVxEkalc8fSr6C0JBOLvXuJLobBLhULDdST2txFSFSykIWM9Ii6FtAYz2wMLM0PNKhwiTvHiCvSFvf42iOzW0nP/2QbnZpol0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758039132; c=relaxed/simple;
	bh=dVw7/MaCbKOLHjFIjez7oCQAfTw/BIxmg8IyusY9v6s=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=hLRB6l2ibep7T88pg5s7fhqEr6HKn2RZWc5hBMcZxeLSpOjZAPX48xn9xFKib1DA1uWXIRC1CaDENhDlOdi/FO0OKc45/88wNrzFf9CX3q3O1J8uxmbXG/6xWEqtxiZy2Ayy0kIdDruqcirCs6i6D0cXrAdwQeaaRMlOoK1U2IM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZNEiY8d6; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZNEiY8d6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758039131; x=1789575131;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=dVw7/MaCbKOLHjFIjez7oCQAfTw/BIxmg8IyusY9v6s=;
  b=ZNEiY8d6eI+XnNORGB0riOk97bOUFeZAWIwqAvclT2zv22+RZ7sIVTaY
   tXyNYL/1rMJpfp2zoXgRmCH6VzYeDGumEimXpfv9en/+1TnpELllmWl0B
   A/WzT4ruiEOEsRf1HHcKAgBFxcdgvNMRu7N88NhNtqKgttR4l59rKmu74
   CW3VCQE1tyuDLM3fgPMqv9F2rulYQbp/E0xpmBKXnytrZ4hBdkJTP6MFM
   qUnJrS9csKy1j5NyM4u9Fkiw3d68HLPy6o4Nf8aWc90cBnUdDD5w4zq4b
   I0fWtFVVqZWPMVBDMDfs+u9aojVtp+WRYivw+h4PSHdNRaA7xbtbxQ/4M
   w==;
X-CSE-ConnectionGUID: 5bZxtRMeTzSeq6DC3kBEXw==
X-CSE-MsgGUID: a4H02lESRr+Xo5HMza6bzw==
X-IronPort-AV: E=McAfee;i="6800,10657,11555"; a="82921565"
X-IronPort-AV: E=Sophos;i="6.18,269,1751266800"; 
   d="scan'208";a="82921565"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2025 09:12:10 -0700
X-CSE-ConnectionGUID: WMm4PwpbQ5uVU3Ovt9DZbA==
X-CSE-MsgGUID: 3LTPHmqaTESBuqkjsjGSPw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,269,1751266800"; 
   d="scan'208";a="178990626"
Received: from igk-lkp-server01.igk.intel.com (HELO 0e586ad5e7f7) ([10.91.175.65])
  by orviesa003.jf.intel.com with ESMTP; 16 Sep 2025 09:12:08 -0700
Received: from kbuild by 0e586ad5e7f7 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1uyYHl-000000002bR-3iIT;
	Tue, 16 Sep 2025 16:12:05 +0000
Date: Tue, 16 Sep 2025 18:11:47 +0200
From: kernel test robot <lkp@intel.com>
To: Miguel Ojeda <ojeda@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, Mark Brown <broonie@kernel.org>
Subject: [linux-next:master 9685/9696] error: expected one of `,` or `}`,
 found `;`
Message-ID: <202509161829.y9eJbmZc-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   05af764719214d6568adb55c8749dec295228da8
commit: 6e86e08cdc19804be3701feb04f96f332b31503a [9685/9696] Merge branch 'rust-next' of https://github.com/Rust-for-Linux/linux.git
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20250916/202509161829.y9eJbmZc-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250916/202509161829.y9eJbmZc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509161829.y9eJbmZc-lkp@intel.com/

All errors (new ones prefixed by >>):

>> error: expected one of `,` or `}`, found `;`
   --> rust/kernel/block/mq/gen_disk.rs:12:23
   |
   12 |     fmt::{self, Write};
   |                       ^
   |                       |
   |                       expected one of `,` or `}`
   |                       help: missing `,`
--
   Error writing files: failed to resolve mod `gen_disk`: cannot parse rust/kernel/block/mq/gen_disk.rs
>> error: expected one of `,` or `}`, found `;`
   --> rust/kernel/block/mq/gen_disk.rs:12:23
   |
   12 |     fmt::{self, Write};
   |                       ^
   |                       |
   |                       expected one of `,` or `}`
   |                       help: missing `,`
--
   PATH=/opt/cross/clang-20/bin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
   INFO PATH=/opt/cross/rustc-1.88.0-bindgen-0.72.0/cargo/bin:/opt/cross/clang-20/bin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
   /usr/bin/timeout -k 100 12h /usr/bin/make KCFLAGS= -fno-crash-diagnostics -Wno-error=return-type -Wreturn-type -funsigned-char -Wundef W=1 --keep-going LLVM=1 -j32 -C source O=/kbuild/obj/consumer/x86_64-rhel-9.4-rust ARCH=x86_64 SHELL=/bin/bash rustfmtcheck
   make: Entering directory '/kbuild/src/consumer'
   make[1]: Entering directory '/kbuild/obj/consumer/x86_64-rhel-9.4-rust'
>> error: expected one of `,` or `}`, found `;`
   --> rust/kernel/block/mq/gen_disk.rs:12:23
   |
   12 |     fmt::{self, Write};
   |                       ^
   |                       |
   |                       expected one of `,` or `}`
   |                       help: missing `,`

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
