Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA2434204E
	for <oe-kbuild-all@lists.linux.dev>; Thu,  5 Mar 2026 04:38:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772685524; cv=none; b=rO+jBky29UcTjQMs2v7x3fGs6dtFYa+67euDo62T/oHwGAc5hLq0hSvUIGEI2nkbA2g63IdwUeZeWq4LhyGYJQanwpA4xuCAqJ6pylZw17RxRz8X2Wy0cORwQqRGVZ4u7tBXGjvJVh6tdYZdruQ0Va2gisL6zNfAt0UjXDpCcLU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772685524; c=relaxed/simple;
	bh=qe2DVNkX6T2yrxkf7a9GBNVxg4L+IeuUxQRKzUvaM/I=;
	h=Date:From:To:Cc:Subject:Message-ID; b=bp8aQfPDqESNF1srCfs7TSzBbLoacbleMlhmITLwoHvn5/y4gOfitII9pg5c7w7gvv9u/ZpPjUY1zzqqUZy5Wi7FGXumiRogWEFqDrTpzlajPIYQAw/TT/zazaGuHbiXD/5x2GEAiuOmfzgBCYonkpvuXbNv/8eobReVe4qpNLQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Euxi+7xX; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Euxi+7xX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772685522; x=1804221522;
  h=date:from:to:cc:subject:message-id;
  bh=qe2DVNkX6T2yrxkf7a9GBNVxg4L+IeuUxQRKzUvaM/I=;
  b=Euxi+7xX8dnGJg268lFLnrHxQfVocjJZr8KMhJ/ijfP5edzQAaNYdlhC
   Af6RiT3v81QuUJwTEpCGTaxwuuVjG1684btRLwVgh1btZXQaKT/2OQhm2
   Sh6Mmvj1GCrr1aFT+7LkwmaJ9ojRQSxlU9ne9+A9QMnbF0LkstVYVfn06
   ya2+2Aju/JpzD1TGzm/oJSzm8RLFisXD9Go93W4K5m6clEIunintO0qjJ
   FccBmGKRbDxCCHWON0fthpgmMAJuxiLxtvmHWySUEXK+wZcBoJ/RhFg22
   Zo93nmAqZjRTRubw6prz5kS3dA/hz0HzvKKidjc+AeXP3qsi7va2DFXZr
   g==;
X-CSE-ConnectionGUID: XKROjqvXSW2JAIukovM7Cg==
X-CSE-MsgGUID: Avflq426RIqQl+p3UAqU3w==
X-IronPort-AV: E=McAfee;i="6800,10657,11719"; a="72789095"
X-IronPort-AV: E=Sophos;i="6.21,325,1763452800"; 
   d="scan'208";a="72789095"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Mar 2026 20:38:42 -0800
X-CSE-ConnectionGUID: rX2/5YqSQ7+AJs3rqolA0g==
X-CSE-MsgGUID: 89dObCfISpqlBMmYay/hUg==
X-ExtLoop1: 1
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by fmviesa003.fm.intel.com with ESMTP; 04 Mar 2026 20:38:41 -0800
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vy0Tu-000000001xB-3ZcG;
	Thu, 05 Mar 2026 04:38:38 +0000
Date: Thu, 05 Mar 2026 05:38:10 +0100
From: kernel test robot <lkp@intel.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [axboe:rw_iter 467/467] error[E0560]: struct
 `bindings::file_operations` has no field named `read`
Message-ID: <202603050532.x7QtIb9E-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux.git rw_iter
head:   fbd53fdafbefc56ceb47b7f9828fd34cdc6ac01a
commit: fbd53fdafbefc56ceb47b7f9828fd34cdc6ac01a [467/467] fs: finally remove ->read() and ->write() from file_operations
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20260305/202603050532.x7QtIb9E-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260305/202603050532.x7QtIb9E-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603050532.x7QtIb9E-lkp@intel.com/

All errors (new ones prefixed by >>):

>> error[E0560]: struct `bindings::file_operations` has no field named `read`
   --> rust/kernel/debugfs/file_ops.rs:134:13
   |
   134 |             read: Some(bindings::seq_read),
   |             ^^^^ `bindings::file_operations` does not have this field
   |
   = note: available fields are: `owner`, `fop_flags`, `read_iter`, `write_iter`, `iopoll` ... and 24 others
--
>> error[E0560]: struct `bindings::file_operations` has no field named `read`
   --> rust/kernel/debugfs/file_ops.rs:186:13
   |
   186 |             read: Some(bindings::seq_read),
   |             ^^^^ `bindings::file_operations` does not have this field
   |
   = note: available fields are: `owner`, `fop_flags`, `read_iter`, `write_iter`, `iopoll` ... and 24 others
--
>> error[E0560]: struct `bindings::file_operations` has no field named `write`
   --> rust/kernel/debugfs/file_ops.rs:187:13
   |
   187 |             write: Some(write::<T>),
   |             ^^^^^ `bindings::file_operations` does not have this field
   |
   = note: available fields are: `owner`, `fop_flags`, `read_iter`, `write_iter`, `iopoll` ... and 24 others
--
>> error[E0560]: struct `bindings::file_operations` has no field named `write`
   --> rust/kernel/debugfs/file_ops.rs:243:13
   |
   243 |             write: Some(write_only_write::<T>),
   |             ^^^^^ `bindings::file_operations` does not have this field
   |
   = note: available fields are: `owner`, `fop_flags`, `read_iter`, `write_iter`, `iopoll` ... and 25 others
--
>> error[E0560]: struct `bindings::file_operations` has no field named `read`
   --> rust/kernel/debugfs/file_ops.rs:294:13
   |
   294 |             read: Some(blob_read::<T>),
   |             ^^^^ `bindings::file_operations` does not have this field
   |
   = note: available fields are: `owner`, `fop_flags`, `read_iter`, `write_iter`, `iopoll` ... and 25 others
--
>> error[E0560]: struct `bindings::file_operations` has no field named `write`
   --> rust/kernel/debugfs/file_ops.rs:348:13
   |
   348 |             write: Some(blob_write::<T>),
   |             ^^^^^ `bindings::file_operations` does not have this field
   |
   = note: available fields are: `owner`, `fop_flags`, `read_iter`, `write_iter`, `iopoll` ... and 25 others
--
>> error[E0560]: struct `bindings::file_operations` has no field named `read`
   --> rust/kernel/debugfs/file_ops.rs:372:13
   |
   372 |             read: Some(blob_read::<T>),
   |             ^^^^ `bindings::file_operations` does not have this field
   |
   = note: available fields are: `owner`, `fop_flags`, `read_iter`, `write_iter`, `iopoll` ... and 25 others
--
>> error[E0560]: struct `bindings::file_operations` has no field named `write`
   --> rust/kernel/debugfs/file_ops.rs:373:13
   |
   373 |             write: Some(blob_write::<T>),
   |             ^^^^^ `bindings::file_operations` does not have this field
   |
   = note: available fields are: `owner`, `fop_flags`, `read_iter`, `write_iter`, `iopoll` ... and 25 others

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
