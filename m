Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5822D18EFD1
	for <oe-kbuild-all@lists.linux.dev>; Tue, 25 Nov 2025 08:50:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764060644; cv=none; b=rc3V1L7WD6huQ02goPJBhkQ7D5GK4p3eno8a0VqGJMtvGTBd2Dvf5xJ4fqUHxktxkgEqJkv467zgn7w2TAPMCv4ctckbDNkD/61BPP2cIKQJzqXNmiXNt2l+NAPsz9Fev2dtS960NP+PObqoJqdcyNiMp+TLY8TnyKyUquXoxqM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764060644; c=relaxed/simple;
	bh=EukammT3td/Uxa2UV4r0R8iCRxBO5DygHpKbChUjxQ0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=P1SwFtn3EyNjB+xL97UhyOdyJUKLDaTQWZ7knAT1tw/7BMmsmXj0GY5tG53V74t4R/RKuhRfx6P1KZnquS74VBtLrwPiC+1AKaqBRpVVBXzJ6wV+JKRnrtxIMMxl+QUyrRFxx5f+sjnId5I3aUI1W6Zts20vVjA1ux73rfEpZNk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=D13T6/iR; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="D13T6/iR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764060642; x=1795596642;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=EukammT3td/Uxa2UV4r0R8iCRxBO5DygHpKbChUjxQ0=;
  b=D13T6/iROLvpSxL/UnVMHqco72xBy44SwNhPjStYHDH79nHMfIps+7di
   +sWCFSiSaGuUQJpqW6Naa2kY96z3g8RKzNRJo5u5txdHBmpSyo0VK5fje
   CQZzpx0MweDmOAKRuLB3b/9eiBNRKF9D6s5Up/puOMTDTUKhBbHoB/2qA
   Gti6w9mBFF75hVunTTWrO6IEtOQouSkSPAdiyij7FE3g0tUuebF5YS+sG
   AuasR6Ssl8qfr59+Dw4B3COwvkirl8hwZpiDMEedMdlPNACS9mgjeT951
   QpUlxNw0tVBp1me5VSru4xZPuC6aoRfkNNC9Q1onVzonj8G+HOTLIB/Zo
   Q==;
X-CSE-ConnectionGUID: t6YpWBjoSC6idUgL9983bw==
X-CSE-MsgGUID: WVbU8coSRpalC8GyiOxxIw==
X-IronPort-AV: E=McAfee;i="6800,10657,11623"; a="77549547"
X-IronPort-AV: E=Sophos;i="6.20,225,1758610800"; 
   d="scan'208";a="77549547"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Nov 2025 00:50:42 -0800
X-CSE-ConnectionGUID: LshNavNfSG+rcaINEi14Zg==
X-CSE-MsgGUID: b+tTUZjySEm98YkZqDbPow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,225,1758610800"; 
   d="scan'208";a="192464915"
Received: from igk-lkp-server01.igk.intel.com (HELO 1f7de368ad0d) ([10.211.93.152])
  by fmviesa006.fm.intel.com with ESMTP; 25 Nov 2025 00:50:40 -0800
Received: from kbuild by 1f7de368ad0d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vNokw-000000000TN-0sHw;
	Tue, 25 Nov 2025 08:50:38 +0000
Date: Tue, 25 Nov 2025 09:50:31 +0100
From: kernel test robot <lkp@intel.com>
To: lsig <ls4121@columbia.edu>
Cc: oe-kbuild-all@lists.linux.dev, Miguel Ojeda <ojeda@kernel.org>
Subject: [rust:pr/1208 11/17] warning: associated function `from_raw` is
 never used
Message-ID: <202511250907.p9n6MOlZ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Rust-for-Linux/linux pr/1208
head:   9bba107357a10d7bc2b6d669bfecb41e498bbb5d
commit: a8dd3ef0c7c9bde9fe2db4d4719c77a98a2dcd8e [11/17] [VFS] mount checkpoint
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20251125/202511250907.p9n6MOlZ-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251125/202511250907.p9n6MOlZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511250907.p9n6MOlZ-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> warning: unused import: `time`
   --> rust/kernel/inode.rs:11:5
   |
   11 |     time,
   |     ^^^^
   |
   = note: `#[warn(unused_imports)]` on by default
--
>> warning: unused variable: `str`
   --> rust/kernel/inode.rs:132:23
   |
   132 |             Type::Lnk(str) => {
   |                       ^^^ help: if this is intentional, prefix it with an underscore: `_str`
   |
   = note: `#[warn(unused_variables)]` on by default
--
>> warning: expression has unnecessary safety comment
   --> rust/kernel/sb.rs:123:13
   |
   123 |             Ok(INodeState::Uninitilized(inode::New(inode, PhantomData)))
   |             ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
   |
   help: consider removing the safety comment
   --> rust/kernel/sb.rs:121:13
   |
   121 |             // SAFETY: The new inode is valid but not fully initialised yet, so it's ok to create a
   |             ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
   = help: for further information visit https://rust-lang.github.io/rust-clippy/master/index.html#unnecessary_safety_comment
   = note: requested on the command line with `-W clippy::unnecessary-safety-comment`
--
>> warning: missing documentation for a struct
   --> rust/kernel/dentry.rs:14:1
   |
   14 | pub struct DEntry<T: FileSystem + ?Sized>(pub(crate) Opaque<bindings::dentry>, PhantomData<T>);
   | ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
--
>> warning: missing documentation for a struct
   --> rust/kernel/dentry.rs:48:1
   |
   48 | pub struct Root<T: FileSystem + ?Sized>(ARef<DEntry<T>>);
   | ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
--
>> warning: associated function `from_raw` is never used
   --> rust/kernel/dentry.rs:36:26
   |
   29 | impl<T: FileSystem + ?Sized> DEntry<T> {
   | -------------------------------------- associated function in this implementation
   ...
   36 |     pub(crate) unsafe fn from_raw<'a>(ptr: *mut bindings::dentry) -> &'a Self {
   |                          ^^^^^^^^
   |
   = note: `#[warn(dead_code)]` on by default
--
>> warning: missing documentation for an associated function
   --> rust/kernel/fs.rs:57:5
   |
   57 | /     fn fill_super(
   58 | |         sb: &mut SuperBlock<Self, sb::New>,
   59 | |         mapper: Option<inode::Mapper<Self>>, //TODO: Default type parameter should be UnspecifiedFS
   60 | |     ) -> Result<Self::Data>;
   | |____________________________^
--
>> warning: missing documentation for a type alias
   --> rust/kernel/inode.rs:16:1
   |
   16 | pub type Ino = usize;
   | ^^^^^^^^^^^^
--
>> warning: missing documentation for an enum
   --> rust/kernel/inode.rs:18:1
   |
   18 | pub enum INodeState<T: FileSystem + ?Sized> {
   | ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
--
>> warning: missing documentation for a variant
   --> rust/kernel/inode.rs:19:5
   |
   19 |     Existing(ARef<INode<T>>),
   |     ^^^^^^^^
--
>> warning: missing documentation for a variant
   --> rust/kernel/inode.rs:20:5
   |
   20 |     Uninitilized(New<T>),
   |     ^^^^^^^^^^^^
..

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
