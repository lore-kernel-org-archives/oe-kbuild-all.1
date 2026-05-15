Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE85435CBC3
	for <oe-kbuild-all@lists.linux.dev>; Fri, 15 May 2026 06:17:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778825879; cv=none; b=LG74afSMeXLazUTCdWxGccNmkRfJtLFAk77P4R7QTiIB+CcGBmFcexjtyJAFFm20Ns9wuCbBvtuFQE7tbJNXegd9Vn582uJjz3gwgQZbHy4hFA8kgH+JMqH4gqkB8AnRIC63CIKnoJBwzRUSC0Qu6OILClMb1zgUIiIGtPiSQJs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778825879; c=relaxed/simple;
	bh=jIwBVdm42yBzn0HbG2Toq8t7rfh5V3SWRtpjtL3mRiA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=DsxNu2YJovNaCDk6llJIMlR/oav5KsLAqgC+mhYHKllpNXd1mmZh1Janj1+kAwRqFWo7HozX+8BNAhC6HfdDAVFwzy4JVSrG721jqZZQwGtU6vve41u2u26z9bj+NfZELyYp9SZAiGs4++0G2ElRvzFpL48yCdeMXE6RbalHn0c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QVHVV2AE; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QVHVV2AE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778825877; x=1810361877;
  h=date:from:to:cc:subject:message-id;
  bh=jIwBVdm42yBzn0HbG2Toq8t7rfh5V3SWRtpjtL3mRiA=;
  b=QVHVV2AE3HU3OXCuCAMJaICnkCcqYZk6ejUaasVuUzDtWshENrdeGUVP
   1aKr9T1FwA5shOGpK+jyEpHjFTiqwO40ctZGojci3UPpjzjMbziWwFe5Z
   ay1cXIuMsSwwtuALf3pFdEcT9ZFHEGL7dniQLSMVVV7Onh/LwN1GT1oaA
   pVS0jHCdnTrW7hFiSFAwSpKXEhOh6JIRoOl7y59telCCilDR7WpKbIDSz
   5SDlIqb9z2Cr89j5RoMPr8cig6ruk/KUp0KTVBodxNNvh09pZXogWxtXZ
   MWyVxykAHVNzS1dPi5TW7ox/AmUY72Ruv8bQiBv+xw6oEtKBxraRu1bDj
   w==;
X-CSE-ConnectionGUID: NIpXNavUS0SBpC4vaDfjyg==
X-CSE-MsgGUID: 7v41q1wFSJO0xP4u36qP2g==
X-IronPort-AV: E=McAfee;i="6800,10657,11786"; a="79808035"
X-IronPort-AV: E=Sophos;i="6.23,236,1770624000"; 
   d="scan'208";a="79808035"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 May 2026 23:17:57 -0700
X-CSE-ConnectionGUID: kcUk8CQcSTu331fWNP8i3A==
X-CSE-MsgGUID: 5m16x3nOTlOEHmfBy/w8WQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,236,1770624000"; 
   d="scan'208";a="238864070"
Received: from lkp-server02.sh.intel.com (HELO 7a33ad3e7d27) ([10.239.97.151])
  by orviesa007.jf.intel.com with ESMTP; 14 May 2026 23:17:56 -0700
Received: from kbuild by 7a33ad3e7d27 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wNlrT-00000000109-1IUZ;
	Fri, 15 May 2026 06:17:33 +0000
Date: Fri, 15 May 2026 14:17:02 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android17-6.18 0/2] error[E0560]: struct
 `rb_process_layout` has no field named `__kabi_reserved_backport2`
Message-ID: <202605151407.Cx0U2was-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android17-6.18
head:   921728d05b998e3c5180c152d7bbb5ae0a1d1f44
commit: 38426ae909c9393a05aa368df60c52afd79971dc [0/2] ANDROID: rust_binder: reserve space in RUST_BINDER_LAYOUT
config: x86_64-randconfig-071-20260515 (https://download.01.org/0day-ci/archive/20260515/202605151407.Cx0U2was-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260515/202605151407.Cx0U2was-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605151407.Cx0U2was-lkp@intel.com/

Note: the android-common/android17-6.18 HEAD 921728d05b998e3c5180c152d7bbb5ae0a1d1f44 builds fine.
      It only hurts bisectability.

All errors (new ones prefixed by >>):

>> error[E0560]: struct `rb_process_layout` has no field named `__kabi_reserved_backport2`
   --> drivers/android/binder/process.rs:429:5
   |
   429 |     __kabi_reserved_backport2: 0,
   |     ^^^^^^^^^^^^^^^^^^^^^^^^^ `rb_process_layout` does not have this field
   |
   = note: all struct fields are already assigned
--
>> error[E0560]: struct `rb_process_layout` has no field named `__kabi_reserved_backport3`
   --> drivers/android/binder/process.rs:430:5
   |
   430 |     __kabi_reserved_backport3: 0,
   |     ^^^^^^^^^^^^^^^^^^^^^^^^^ `rb_process_layout` does not have this field
   |
   = note: all struct fields are already assigned
--
>> error[E0560]: struct `rb_thread_layout` has no field named `__kabi_reserved_backport0`
   --> drivers/android/binder/thread.rs:432:5
   |
   432 |     __kabi_reserved_backport0: 0,
   |     ^^^^^^^^^^^^^^^^^^^^^^^^^ `rb_thread_layout` does not have this field
   |
   = note: all struct fields are already assigned
--
>> error[E0560]: struct `rb_thread_layout` has no field named `__kabi_reserved_backport1`
   --> drivers/android/binder/thread.rs:433:5
   |
   433 |     __kabi_reserved_backport1: 0,
   |     ^^^^^^^^^^^^^^^^^^^^^^^^^ `rb_thread_layout` does not have this field
   |
   = note: all struct fields are already assigned
--
>> error[E0560]: struct `rb_thread_layout` has no field named `__kabi_reserved_backport2`
   --> drivers/android/binder/thread.rs:434:5
   |
   434 |     __kabi_reserved_backport2: 0,
   |     ^^^^^^^^^^^^^^^^^^^^^^^^^ `rb_thread_layout` does not have this field
   |
   = note: all struct fields are already assigned
--
>> error[E0560]: struct `rb_thread_layout` has no field named `__kabi_reserved_backport3`
   --> drivers/android/binder/thread.rs:435:5
   |
   435 |     __kabi_reserved_backport3: 0,
   |     ^^^^^^^^^^^^^^^^^^^^^^^^^ `rb_thread_layout` does not have this field
   |
   = note: all struct fields are already assigned
--
>> error[E0560]: struct `rb_transaction_layout` has no field named `__kabi_reserved_backport0`
   --> drivers/android/binder/transaction.rs:37:5
   |
   37 |     __kabi_reserved_backport0: 0,
   |     ^^^^^^^^^^^^^^^^^^^^^^^^^ `rb_transaction_layout` does not have this field
   |
   = note: all struct fields are already assigned
--
>> error[E0560]: struct `rb_transaction_layout` has no field named `__kabi_reserved_backport1`
   --> drivers/android/binder/transaction.rs:38:5
   |
   38 |     __kabi_reserved_backport1: 0,
   |     ^^^^^^^^^^^^^^^^^^^^^^^^^ `rb_transaction_layout` does not have this field
   |
   = note: all struct fields are already assigned
--
>> error[E0560]: struct `rb_transaction_layout` has no field named `__kabi_reserved_backport2`
   --> drivers/android/binder/transaction.rs:39:5
   |
   39 |     __kabi_reserved_backport2: 0,
   |     ^^^^^^^^^^^^^^^^^^^^^^^^^ `rb_transaction_layout` does not have this field
   |
   = note: all struct fields are already assigned
--
>> error[E0560]: struct `rb_transaction_layout` has no field named `__kabi_reserved_backport3`
   --> drivers/android/binder/transaction.rs:40:5
   |
   40 |     __kabi_reserved_backport3: 0,
   |     ^^^^^^^^^^^^^^^^^^^^^^^^^ `rb_transaction_layout` does not have this field
   |
   = note: all struct fields are already assigned
--
>> error[E0560]: struct `rust_binder_layout` has no field named `__kabi_reserved_backport0`
   --> drivers/android/binder/rust_binder_main.rs:99:5
   |
   99 |     __kabi_reserved_backport0: 0,
   |     ^^^^^^^^^^^^^^^^^^^^^^^^^ `rust_binder_layout` does not have this field
   |
   = note: all struct fields are already assigned
..

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
