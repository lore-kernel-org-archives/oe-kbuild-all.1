Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B61557262D
	for <oe-kbuild-all@lists.linux.dev>; Thu, 11 Dec 2025 05:27:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765430862; cv=none; b=a1L1ViCKuy/OTxbU0jjibwyFcKj/eaf649Ym9WCxKClMuKaOcoItsa6yx4TDiTijehQWtaxhQxyozNDS2Yw9gcivL38Ki+t50+zfXHmzh1kOoO84Bl3AFXtBjllCcszXjcAi61DvGlTMCfB92tyXVkK1VYIy3GZZJ6CUaYcEvJc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765430862; c=relaxed/simple;
	bh=KFv2/qaYjs9V3YoNfiriNE86jKq6h11tpHxjR0/tBGo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=eTZwfbn/AX+W7ITT73iHXNATipmKzR2n6ef5JMvfC5eKFHvLd3UKRx73NKIGbSWdiFfwMlLV2rEBHBd9qoyKgH/yJ/JHLtZAfNMJlsX129bUacQ2GdPzK0y6vDfziIuBolJ+Dlphw0Dz5iImIPh7jTmoyYkh7ZJnG9g0yecixlM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KKxO8bNM; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KKxO8bNM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765430860; x=1796966860;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=KFv2/qaYjs9V3YoNfiriNE86jKq6h11tpHxjR0/tBGo=;
  b=KKxO8bNMzG8YXzgifY4GL9h5nZIgfAHfTZ/jL5NT5ayuU4e67NBVUon/
   4Rx8DQaFTJBGpobrl+ekOv3KvNbYPrAvdCFr2R4AeTEgtMfjqI2nRatEO
   e7KxCtHSRjK9Y70/Ar/fwimq54SIwAT7mOrS9rI6regUtw7bfE0X+RQ0i
   GNU/7ha1dIcuuWFKwuY0XX2H1S9IVanQKBbi+DC43riF1qAEUWWSrS3AQ
   DB65Y/Bo59F1cT51b9+jI/FtIRT6c/d+mg1xjp4bzd/0VO3pIxQA06aD+
   p4O8RspKroInqEOeVH1C9y2WXv7QQH1aIj9guEFaXAH1kF1KZxtev7gWb
   g==;
X-CSE-ConnectionGUID: v9sn0Wh9QXug61j26UUwtQ==
X-CSE-MsgGUID: yfXKXmjlQH+sP1lAfYmyRA==
X-IronPort-AV: E=McAfee;i="6800,10657,11638"; a="69993437"
X-IronPort-AV: E=Sophos;i="6.20,265,1758610800"; 
   d="scan'208";a="69993437"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Dec 2025 21:27:40 -0800
X-CSE-ConnectionGUID: vX8YLIXLRiyaZpUdvMoQKA==
X-CSE-MsgGUID: ojJkZUDCQOW3NBZzkjThpg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,265,1758610800"; 
   d="scan'208";a="220052891"
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a) ([10.211.93.152])
  by fmviesa002.fm.intel.com with ESMTP; 10 Dec 2025 21:27:39 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vTZDF-000000000vY-1ORT;
	Thu, 11 Dec 2025 05:27:37 +0000
Date: Thu, 11 Dec 2025 06:27:06 +0100
From: kernel test robot <lkp@intel.com>
To: Gary Guo <gary@garyguo.net>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [nbdd0121:macros 2/10] warning: this creates an owned instance just
 for comparison
Message-ID: <202512110636.UNZSjQJv-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/nbdd0121/linux macros
head:   1d5aa4ae3a33e6ff75aeab77c9e2f08388d063ef
commit: 33d9f33c7803c96e005f1c98b238f3137b4cf2fe [2/10] rust: macros: use `quote!` from vendored crate
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20251211/202512110636.UNZSjQJv-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251211/202512110636.UNZSjQJv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512110636.UNZSjQJv-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> warning: this creates an owned instance just for comparison
   --> rust/macros/helpers.rs:78:36
   |
   78 |             TokenTree::Ident(i) if i.to_string() == "fn" => {
   |                                    ^^^^^^^^^^^^^ help: try: `i`
   |
   = help: for further information visit https://rust-lang.github.io/rust-clippy/master/index.html#cmp_owned
   = note: `-W clippy::cmp-owned` implied by `-W clippy::all`
   = help: to override `-W clippy::all` add `#[allow(clippy::cmp_owned)]`
--
>> warning: this creates an owned instance just for comparison
   --> rust/macros/kunit.rs:63:36
   |
   63 |             TokenTree::Ident(i) if i.to_string() == "fn" && attributes.contains_key("test") => {
   |                                    ^^^^^^^^^^^^^ help: try: `i`
   |
   = help: for further information visit https://rust-lang.github.io/rust-clippy/master/index.html#cmp_owned
--
>> warning: this creates an owned instance just for comparison
   --> rust/macros/vtable.rs:35:40
   |
   35 |             TokenTree::Ident(ident) if ident.to_string() == "fn" => {
   |                                        ^^^^^^^^^^^^^^^^^ help: try: `ident`
   |
   = help: for further information visit https://rust-lang.github.io/rust-clippy/master/index.html#cmp_owned
--
>> warning: this creates an owned instance just for comparison
   --> rust/macros/vtable.rs:43:40
   |
   43 |             TokenTree::Ident(ident) if ident.to_string() == "const" => {
   |                                        ^^^^^^^^^^^^^^^^^ help: try: `ident`
   |
   = help: for further information visit https://rust-lang.github.io/rust-clippy/master/index.html#cmp_owned

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
