Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04C0C126F0A
	for <oe-kbuild-all@lists.linux.dev>; Sat,  3 Jan 2026 10:13:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767435200; cv=none; b=MqUv14Vs5TCXe/LTSDwVF7rKbazz4C3GumOj6j7mFtMrmt3jA/k7riIghALYROn9LbDYrkoyasl8Sj6YG5V54B/tfflLlB05kpAdOXG80277fVr7DYVSqp21g4Pq8/h0eM7DTHg71w/Z7LyjqrkmbAYa9UihupBOC3/gHFYvhZ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767435200; c=relaxed/simple;
	bh=XJlVD4hTViB86wkFZlnfzBfSSuCdLOYlm6MQZj8YZWQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=o34OrCVqCjLn8FC0vhHSIPVItimOkscqayQWmC2jKkzBnXQpa24XuntgO84uw+F4dQuL/J9irsolSuonY2sMnCynTYaV6J+9xywUhyTVzqZPop1LHNJJk26CWAiUZ7eOsaUyO0AzCT0QOxwzvbcxSXPvp3jF+8lLlbwbgFEPK2Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Touqd5lS; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Touqd5lS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767435199; x=1798971199;
  h=date:from:to:cc:subject:message-id;
  bh=XJlVD4hTViB86wkFZlnfzBfSSuCdLOYlm6MQZj8YZWQ=;
  b=Touqd5lSgV2A2HS8mrADmHV98kGa8lLbSGHXFum5q6UPjRsI8VWuZKzs
   CUUZO7vYSWpRG7wEaFsSlyms3JFBqmRB95eDL+fEG5PKMqleuQkvBfCZb
   qcgB5DqnmEgd/bO2iJRXGnWwH3eklJ9Ei3Wej+ae7Q9AbnWXSacjQ09RZ
   9Xu+vt5AqK9OgnXYxuOKqkInhucXhWfNVoySPPwHNpeO+R1O42FVriZOw
   uWNAYgEoclxN/RYj/xngK5EdNJHtgAhlaBRaep4jr9u2nOrd6FH8KfZ/D
   kUJ0XAi+LnanoFvNLjnEkKioEXshuY1K/2R/BDa3pg8lOmZMEHfgQDnOp
   w==;
X-CSE-ConnectionGUID: lJv+oBuES/SgsH8tTmMevg==
X-CSE-MsgGUID: 9GkiWcgCQdiwVAkwSefozw==
X-IronPort-AV: E=McAfee;i="6800,10657,11659"; a="69053498"
X-IronPort-AV: E=Sophos;i="6.21,198,1763452800"; 
   d="scan'208";a="69053498"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jan 2026 02:13:18 -0800
X-CSE-ConnectionGUID: IDr4yMqQRjKb2IQlJhA2pQ==
X-CSE-MsgGUID: pGC4tLkVRHCFXBy//AISDA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,198,1763452800"; 
   d="scan'208";a="206863163"
Received: from igk-lkp-server01.igk.intel.com (HELO 92b2e8bd97aa) ([10.211.93.152])
  by fmviesa004.fm.intel.com with ESMTP; 03 Jan 2026 02:13:17 -0800
Received: from kbuild by 92b2e8bd97aa with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vbydH-000000000gT-0Xs5;
	Sat, 03 Jan 2026 10:13:15 +0000
Date: Sat, 03 Jan 2026 11:12:45 +0100
From: kernel test robot <lkp@intel.com>
To: Boqun Feng <boqun.feng@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [boqun:rust-sync 25/25] warning: unresolved link to
 `P::into_foreign`
Message-ID: <202601031116.S3LspbYy-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/boqun/linux.git rust-sync
head:   a022f632d22b58be3e5ae9035e105461ecdfe230
commit: a022f632d22b58be3e5ae9035e105461ecdfe230 [25/25] rust: sync: rcu: Add RCU protected pointer
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20260103/202601031116.S3LspbYy-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260103/202601031116.S3LspbYy-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601031116.S3LspbYy-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> warning: unresolved link to `P::into_foreign`
   --> rust/kernel/sync/rcu.rs:74:69
   |
   74 | /// Either the pointer is null, or it points to a return value of [`P::into_foreign`] and the atomic
   |                                                                     ^^^^^^^^^^^^^^^ no item named `P` in scope
   |
   = note: `#[warn(rustdoc::broken_intra_doc_links)]` on by default
--
>> warning: unresolved link to `P::into_foreign`
   --> rust/kernel/sync/rcu.rs:85:47
   |
   85 | /// The pointer has to be a return value of [`P::into_foreign`] and [`Self`] exclusively owns the
   |                                               ^^^^^^^^^^^^^^^ no item named `P` in scope
--
>> warning: unresolved link to `Opaque`
   --> rust/kernel/sync/rcu.rs:235:11
   |
   235 |     /// [`Opaque<T>`] which has the same effect on aliasing rules as [`UnsafePinned`].
   |           ^^^^^^^^^ no item named `Opaque` in scope
   |
   = help: to escape `[` and `]` characters, add '' before them like `[` or `]`

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
