Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94F272DAFBB
	for <oe-kbuild-all@lists.linux.dev>; Tue, 26 May 2026 23:34:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779838495; cv=none; b=sG7cOWoGxEuyjIK/mN+LYUJU/Cg+wfEAZu2ukCWr4NEs9tCR/WbfDNHJ2ntuxtv7BccittwLh7bTZDx/6NKZqFI5phBiF2A3WXEceWk9gPxn1xFdZoWZL9UNeea2+nz6ActsiF9Va8+6v8i7aTqSvwEo2r6YJsPtsXSZctqn7Xw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779838495; c=relaxed/simple;
	bh=BwHNCr3k9zlwKlMYvwgZJr1bvTes7eyscwgY5U9ekKk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=W7gObOwSt3pHpAIgf9A4QpJuB1SPJvN6dx0QhBTy+GkQsAEkit6woSlBEe0CBc8KlQwnnJ4zcXsLUcojREZBGTrXYOBYcKDm5CuvbiseKMmqLso5wFQkauqli2x+4VEgsnjVaJbpngjYAgSggIyHAvPvg9A0+KoiFLN29D8p10I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GL6+PxFb; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GL6+PxFb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779838494; x=1811374494;
  h=date:from:to:cc:subject:message-id;
  bh=BwHNCr3k9zlwKlMYvwgZJr1bvTes7eyscwgY5U9ekKk=;
  b=GL6+PxFb1URYk2OC4KXyx3wib5TMmmVAfSVTTCwAarAvaj3M/cnE92Cn
   nc1dex4lCp7yj3SxMhYA8N2rrfCjeGunbCR3NSAJdPVGkKGEExGdHx1St
   1zdAP4sDtdlmnGT4CxvpBnpz9pNxUaaEGWS3k5OFDNkpoXlr1m1xLowlK
   Pc0eYZvWxn5XTp92ERJ9nGhsZIoqW5PhSYH+mDmIvphCK9xUEXUDkNRoi
   rG+MZUOfT0eVxd8GhYDMBvFQdDCQtOXHZfPne26bmD/alu7C8Cp4KM8D3
   i4x+iVXnUcdQWoCiQE12RNnywiL2zyoLATG8frYf01U64kO6FYaMUv1f2
   g==;
X-CSE-ConnectionGUID: LEO9bB5NR8SzQTh4YCiR3A==
X-CSE-MsgGUID: KYSzeurgTlegJnY3RblyYQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11798"; a="80649482"
X-IronPort-AV: E=Sophos;i="6.24,170,1774335600"; 
   d="scan'208";a="80649482"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 May 2026 16:34:53 -0700
X-CSE-ConnectionGUID: hYnnfZFYS/m47bCv47Spzg==
X-CSE-MsgGUID: euUpbhCFRGO77pCpTuRYvw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,170,1774335600"; 
   d="scan'208";a="241902949"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by orviesa008.jf.intel.com with ESMTP; 26 May 2026 16:34:40 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wS1IC-00000000CX3-1VXK;
	Tue, 26 May 2026 23:34:36 +0000
Date: Wed, 27 May 2026 01:34:34 +0200
From: kernel test robot <lkp@intel.com>
To: Tamir Duberstein <tamird@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [tamird:binder-multiplexed-transactions 1/1] Diff in
 drivers/android/binder/thread.rs:1450:
Message-ID: <202605270147.Grz4lrhH-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/tamird/linux binder-multiplexed-transactions
head:   a8e5461401d2bf1b6843fc23cdbec95106cbf197
commit: a8e5461401d2bf1b6843fc23cdbec95106cbf197 [1/1] binder: Add multiplexed transactions
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20260527/202605270147.Grz4lrhH-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260527/202605270147.Grz4lrhH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605270147.Grz4lrhH-lkp@intel.com/

All errors (new ones prefixed by >>):

   PATH=/opt/cross/clang-20/bin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
   INFO PATH=/opt/cross/rustc-1.88.0-bindgen-0.72.1/cargo/bin:/opt/cross/clang-20/bin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
   /usr/bin/timeout -k 100 12h /usr/bin/make KCFLAGS=\ -fno-crash-diagnostics\ -Wno-error=return-type\ -Wreturn-type\ -funsigned-char\ -Wundef\ -falign-functions=64 W=1 --keep-going LLVM=1 -j384 -C source O=/kbuild/obj/consumer/x86_64-rhel-9.4-rust ARCH=x86_64 SHELL=/bin/bash rustfmtcheck 
   make: Entering directory '/kbuild/src'
   make[1]: Entering directory '/kbuild/obj/consumer/x86_64-rhel-9.4-rust'
>> Diff in drivers/android/binder/thread.rs:1450:
                return Err(EINVAL);
            }
    
   -        if let Some(orig) = self.process.take_ordinary_multiplexed_reply(info.reply_token) {
   +        if let Some(orig) = self
   +            .process
   +            .take_ordinary_multiplexed_reply(info.reply_token)
   +        {
                info.to_tid = orig.from.id;
                info.to_pid = orig.from.process.task.pid();
                let allow_fds = orig.flags & TF_ACCEPT_FDS != 0;
   Diff in drivers/android/binder/thread.rs:1552:
                        self.transaction(cmd, &mut reader)?;
                    }
                    BC_CLAIM_MULTIPLEXED_REPLY => self.claim_multiplexed_reply(&mut reader)?,
   -                BC_RETIRE_MULTIPLEXED_NODE => self
   -                    .process
   -                    .retire_multiplexed_node(&mut reader)?,
   +                BC_RETIRE_MULTIPLEXED_NODE => self.process.retire_multiplexed_node(&mut reader)?,
                    BC_FREE_BUFFER => {
                        let buffer = self.process.buffer_get(reader.read()?);
                        if let Some(buffer) = buffer {
>> Diff in drivers/android/binder/node.rs:730:
                ) {
                    inner.multiplexed_requests.remove(&key);
                    true
   -            } else if inner.multiplexed_retired && inner.multiplexed_requests.get(&key).is_none()
   -            {
   +            } else if inner.multiplexed_retired && inner.multiplexed_requests.get(&key).is_none() {
                    true
                } else {
                    false
>> Diff in drivers/android/binder/process.rs:802:
                    MultiplexedReplyTokenState::InFlight(transaction)
                        if transaction.multiplexed_request_key().is_none() =>
                    {
   -                    transaction.from.deliver_reply(Err(BR_DEAD_REPLY), &transaction);
   +                    transaction
   +                        .from
   +                        .deliver_reply(Err(BR_DEAD_REPLY), &transaction);
                    }
                    MultiplexedReplyTokenState::ActiveOrdinary(transaction) => {
   -                    transaction.from.deliver_reply(Err(BR_DEAD_REPLY), &transaction);
   +                    transaction
   +                        .from
   +                        .deliver_reply(Err(BR_DEAD_REPLY), &transaction);
                    }
                    _ => {}
                }
   Diff in drivers/android/binder/process.rs:1601:
                        if transaction.multiplexed_request_key().is_some() {
                            transaction.fail_multiplexed_request(BINDER_MULTIPLEXED_REPLY_DEAD, 0);
                        } else {
   -                        transaction.from.deliver_reply(Err(BR_DEAD_REPLY), transaction);
   +                        transaction
   +                            .from
   +                            .deliver_reply(Err(BR_DEAD_REPLY), transaction);
                        }
                    }
                    MultiplexedReplyTokenState::ActiveMultiplexed { node, key } => {
   Diff in drivers/android/binder/process.rs:1608:
                        node.fail_multiplexed_request(*key, BINDER_MULTIPLEXED_REPLY_DEAD, 0)
                    }
   -                MultiplexedReplyTokenState::ActiveOrdinary(transaction) => {
   -                    transaction.from.deliver_reply(Err(BR_DEAD_REPLY), transaction)
   -                }
   +                MultiplexedReplyTokenState::ActiveOrdinary(transaction) => transaction
   +                    .from
   +                    .deliver_reply(Err(BR_DEAD_REPLY), transaction),
                }
            }
            drop(multiplexed_reply_tokens);
>> Diff in drivers/android/binder/thread.rs:1450:
                return Err(EINVAL);
            }
    
   -        if let Some(orig) = self.process.take_ordinary_multiplexed_reply(info.reply_token) {
   +        if let Some(orig) = self
   +            .process
   +            .take_ordinary_multiplexed_reply(info.reply_token)
   +        {
                info.to_tid = orig.from.id;
                info.to_pid = orig.from.process.task.pid();
                let allow_fds = orig.flags & TF_ACCEPT_FDS != 0;
   Diff in drivers/android/binder/thread.rs:1552:
                        self.transaction(cmd, &mut reader)?;
                    }
                    BC_CLAIM_MULTIPLEXED_REPLY => self.claim_multiplexed_reply(&mut reader)?,
   -                BC_RETIRE_MULTIPLEXED_NODE => self
   -                    .process
   -                    .retire_multiplexed_node(&mut reader)?,
   +                BC_RETIRE_MULTIPLEXED_NODE => self.process.retire_multiplexed_node(&mut reader)?,
                    BC_FREE_BUFFER => {
                        let buffer = self.process.buffer_get(reader.read()?);
                        if let Some(buffer) = buffer {
>> Diff in drivers/android/binder/node.rs:730:
                ) {
                    inner.multiplexed_requests.remove(&key);
                    true
   -            } else if inner.multiplexed_retired && inner.multiplexed_requests.get(&key).is_none()
   -            {
   +            } else if inner.multiplexed_retired && inner.multiplexed_requests.get(&key).is_none() {
                    true
                } else {
                    false
>> Diff in drivers/android/binder/process.rs:802:
                    MultiplexedReplyTokenState::InFlight(transaction)
                        if transaction.multiplexed_request_key().is_none() =>
                    {
   -                    transaction.from.deliver_reply(Err(BR_DEAD_REPLY), &transaction);
   +                    transaction
   +                        .from
   +                        .deliver_reply(Err(BR_DEAD_REPLY), &transaction);
                    }
                    MultiplexedReplyTokenState::ActiveOrdinary(transaction) => {
   -                    transaction.from.deliver_reply(Err(BR_DEAD_REPLY), &transaction);
   +                    transaction
   +                        .from
   +                        .deliver_reply(Err(BR_DEAD_REPLY), &transaction);
                    }
                    _ => {}
                }
   Diff in drivers/android/binder/process.rs:1601:
                        if transaction.multiplexed_request_key().is_some() {
                            transaction.fail_multiplexed_request(BINDER_MULTIPLEXED_REPLY_DEAD, 0);
                        } else {
   -                        transaction.from.deliver_reply(Err(BR_DEAD_REPLY), transaction);
   +                        transaction
   +                            .from
   +                            .deliver_reply(Err(BR_DEAD_REPLY), transaction);
                        }
                    }
                    MultiplexedReplyTokenState::ActiveMultiplexed { node, key } => {
   Diff in drivers/android/binder/process.rs:1608:
                        node.fail_multiplexed_request(*key, BINDER_MULTIPLEXED_REPLY_DEAD, 0)
                    }
   -                MultiplexedReplyTokenState::ActiveOrdinary(transaction) => {
   -                    transaction.from.deliver_reply(Err(BR_DEAD_REPLY), transaction)
   -                }
   +                MultiplexedReplyTokenState::ActiveOrdinary(transaction) => transaction
   +                    .from
   +                    .deliver_reply(Err(BR_DEAD_REPLY), transaction),
                }
            }
            drop(multiplexed_reply_tokens);
   make[2]: *** [Makefile:1954: rustfmt] Error 123
   make[1]: Leaving directory '/kbuild/obj/consumer/x86_64-rhel-9.4-rust'
   make[1]: *** [Makefile:248: __sub-make] Error 2
   make[2]: Target 'rustfmtcheck' not remade because of errors.
   make[1]: Target 'rustfmtcheck' not remade because of errors.
   make: *** [Makefile:248: __sub-make] Error 2
   make: Target 'rustfmtcheck' not remade because of errors.
   make: Leaving directory '/kbuild/src'

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
