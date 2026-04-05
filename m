Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93BD8227565
	for <oe-kbuild-all@lists.linux.dev>; Sun,  5 Apr 2026 00:25:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775348705; cv=none; b=N//4DyjFchgI35+9pJgVUnhi+AMNO+HSHPHN3jstS9xlC5fN2MhNgP1+8xxy4fY82mTkCY8GsSLlwLyK5y3TUX8pgLKfZMquLe5ooNwKhPPl0KlnwqbWuI5fWpwk5shQKzXqa9XmTWNZRa40e2ZaL1gzrEKzfgZ4hhBRVG3IyE0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775348705; c=relaxed/simple;
	bh=lJVNmnNbJjXWzTMiM8AF9GoOMWY1hxgCJJWeuBCpL2Q=;
	h=Date:From:To:Cc:Subject:Message-ID; b=mfpgf7/NQEV+vfKORegLqYff26DQN4pqOCUhbzw2wdVpXB4KOmG8mzkcb5ulk4IIwAPR+URl+bjhDqdEmB8nBV7ZiJALk19d53SM+r5i2EauM/wlkk+798henBcAUg3imgGBrO2QisSAncd2jdmxNEr6pCxWFZfjtUCiQqoUBsI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=C2V6IJR1; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="C2V6IJR1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775348704; x=1806884704;
  h=date:from:to:cc:subject:message-id;
  bh=lJVNmnNbJjXWzTMiM8AF9GoOMWY1hxgCJJWeuBCpL2Q=;
  b=C2V6IJR10uaLJk0sYJ6eN6IV6oWzI4snCineW/hHTApxAiy0p4VJ1qBi
   He3oHS/bgBVjWLHylS0ll6iKsXQqyhrovXb/9d7ZAri9nZGs5tkSUauGa
   9BlAzE8Ta0KDlnkFi1MqsvEXfOoILs+X+CbVuCFCCG9lfVLjR84eVN5lt
   mPkLdGTprsWx8UtlaHytcMAjuG8jLgg1s8Q9JOeCL6lieUh6+2Yh97WTQ
   keNaZ+8s7Q53qlo7Yvgtu8PE3ooBpIZpnCgdwIlu+xDgMF/SzBHS+KioR
   MdHhnD7p6Ky85s7owjs/WERb4HMPQI38N7QJhwoGeAuk4GxBs0oktXTtC
   Q==;
X-CSE-ConnectionGUID: DfVOEY6STyagY41p0uyAeQ==
X-CSE-MsgGUID: 8czJC5xRQZ2LNdx+oY5Usg==
X-IronPort-AV: E=McAfee;i="6800,10657,11749"; a="76243741"
X-IronPort-AV: E=Sophos;i="6.23,160,1770624000"; 
   d="scan'208";a="76243741"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Apr 2026 17:25:03 -0700
X-CSE-ConnectionGUID: 4ELwuvZLTd240982eRlbXg==
X-CSE-MsgGUID: uS4qhzWXSF6yx3qOiNuACg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,160,1770624000"; 
   d="scan'208";a="229221868"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by fmviesa004.fm.intel.com with ESMTP; 04 Apr 2026 17:25:01 -0700
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w9BIR-000000009iT-0q8c;
	Sun, 05 Apr 2026 00:24:59 +0000
Date: Sun, 05 Apr 2026 02:24:21 +0200
From: kernel test robot <lkp@intel.com>
To: Aakash Bollineni <aakash.bollineni@multicorewareinc.com>
Cc: oe-kbuild-all@lists.linux.dev, 0day robot <lkp@intel.com>
Subject: Diff in samples/rust/rust_workqueue_test.rs:149:
Message-ID: <202604050247.209bKjHO-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/intel-lab-lkp/linux/commits/Aakash-Bollineni-via-B4-Relay/rust-helpers-add-workqueue-helpers/20260405-005732
head:   9e8d11645235b6da62a1abee39b3a1a8b5731b61
commit: 9e8d11645235b6da62a1abee39b3a1a8b5731b61 rust: workqueue: add KUnit and sample stress tests
date:   7 hours ago
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20260405/202604050247.209bKjHO-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260405/202604050247.209bKjHO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604050247.209bKjHO-lkp@intel.com/

All errors (new ones prefixed by >>):

   PATH=/opt/cross/clang-20/bin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
   INFO PATH=/opt/cross/rustc-1.88.0-bindgen-0.72.1/cargo/bin:/opt/cross/clang-20/bin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
   /usr/bin/timeout -k 100 12h /usr/bin/make KCFLAGS=\ -fno-crash-diagnostics\ -Wno-error=return-type\ -Wreturn-type\ -funsigned-char\ -Wundef\ -falign-functions=64 W=1 --keep-going LLVM=1 -j32 -C source O=/kbuild/obj/consumer/x86_64-rhel-9.4-rust ARCH=x86_64 SHELL=/bin/bash rustfmtcheck 
   make: Entering directory '/kbuild/src/consumer'
   make[1]: Entering directory '/kbuild/obj/consumer/x86_64-rhel-9.4-rust'
>> Diff in samples/rust/rust_workqueue_test.rs:149:
                let initial_count = workqueue::arc_count(&delayed_item);
    
                // Schedule with a long delay (5 seconds)
   -            if let Err(returned) = workqueue::system().enqueue_delayed(delayed_item.clone(), msecs_to_jiffies(5000)) {
   +            if let Err(returned) =
   +                workqueue::system().enqueue_delayed(delayed_item.clone(), msecs_to_jiffies(5000))
   +            {
                    drop(returned);
                } else {
   -                pr_info!("Delayed work enqueued. count: {}\n", workqueue::arc_count(&delayed_item));
   +                pr_info!(
   +                    "Delayed work enqueued. count: {}\n",
   +                    workqueue::arc_count(&delayed_item)
   +                );
                }
    
                if let Some(reclaimed) = delayed_item.delayed_work.cancel() {
   make[2]: *** [Makefile:1912: rustfmt] Error 123
   make[2]: Target 'rustfmtcheck' not remade because of errors.
   make[1]: Leaving directory '/kbuild/obj/consumer/x86_64-rhel-9.4-rust'
   make[1]: *** [Makefile:248: __sub-make] Error 2
   make: *** [Makefile:248: __sub-make] Error 2
   make[1]: Target 'rustfmtcheck' not remade because of errors.
   make: Target 'rustfmtcheck' not remade because of errors.
   make: Leaving directory '/kbuild/src/consumer'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
