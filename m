Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9A4848A2DF
	for <oe-kbuild-all@lists.linux.dev>; Wed, 14 Oct 2026 19:45:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792007165; cv=none; b=oeAP/SeB+hjoZNjO1CSEMwkHtvizSkove/769786ffb4adXueezEoYqZHoV+ireZZir/syHNqxdBzpZcJhFAJyzLXJkSTM348cEXC+XxQOqlVjpR1JiFZVmwfLQUfHsPsl5soZY0H/KRp8UcHn4KI1n2m4mi9xHKHxD6lRqjxuA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792007165; c=relaxed/simple;
	bh=cw0aHyfCD92zN8rGIfApoZkyyo4s7jWHyWoWm1WefWU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=YcISyAM9Gf5QjiaYqU8Zqx6mk3SJ1i/v6bwRyUCLW30qFYVTcWSiCavYlLkyk/VAvb4Vh6eO9ylXVCZgqYf7ghq8fOumG1dFuc2U7yx7mhcapXjVZwJ1CwfTSHfjXlCBo6A8XdnJQUj9flBWd8cRPHL0yXpTJQqUxSyQMJgsYfQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YTIKDkX+; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YTIKDkX+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792007160; x=1823543160;
  h=date:from:to:cc:subject:message-id;
  bh=cw0aHyfCD92zN8rGIfApoZkyyo4s7jWHyWoWm1WefWU=;
  b=YTIKDkX+jVSM/Fuz8x2ZaOCb3vDiJNNnv45z+ixHTjox/qUWCkCbeLKr
   ROg6F4xSlGD3Y2Rtbs1MzK/YBScNzK4tAXByzP/CDUfw4SloAXr6CCsmp
   5qWYs52c8XjSWWLl4N05rJP1vVV+mHse6AiN3TRFChO4+Gjemk0fwKrTf
   9BKHpV7FZ8grefR91BkjS06MmI9ZyGX5FtGYUptNWWJd8dq2DWLQIPA1g
   hDt3yfFJwCf6+24l7O79ua+6uJwXBUboab7IJPBhd+CtMg/wovFWsUnot
   D1XJzxUTREwn2fhb71JZTW8iWC8lhaX2Oor5yIpVX6NRxuCVpKjn58q3M
   A==;
X-CSE-ConnectionGUID: WvTYH2/oQGusyn/tDeazig==
X-CSE-MsgGUID: F8sdRcq+Rf2v52LfvdLPbg==
X-IronPort-AV: E=McAfee;i="6800,10657,11935"; a="666132"
X-IronPort-AV: E=Sophos;i="6.27,158,1787036400"; 
   d="scan'208";a="666132"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2026 12:45:52 -0700
X-CSE-ConnectionGUID: YMyAlh/EQyeu/9peuTOR7w==
X-CSE-MsgGUID: +QQNG3pSQ3mxx4Y2d8SruQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,158,1787036400"; 
   d="scan'208";a="1844851"
Received: from igk-lkp-server01.igk.intel.com (HELO d0de6c2a75a7) ([10.211.93.152])
  by fmviesa008.fm.intel.com with ESMTP; 14 Oct 2026 12:45:51 -0700
Received: from kbuild by d0de6c2a75a7 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xH4v6-00000000BHT-0pUg;
	Wed, 14 Oct 2026 19:45:48 +0000
Date: Wed, 14 Oct 2026 21:45:42 +0200
From: kernel test robot <lkp@intel.com>
To: Leon Romanovsky <leonro@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [leon-rdma:rxe-rust-v1 91/119] Diff in
 rust/kernel/rdma/address.rs:244:
Message-ID: <202610142146.Xhn8A9Y8-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/leon/linux-rdma.git rxe-rust-v1
head:   51164760f7c1e7761e793acedc65c2c014d0e92f
commit: 6aa447caf59b10cd8dd511aace13e722f5f6e631 [91/119] rust: rdma: Own protection domains and address handles
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20261014/202610142146.Xhn8A9Y8-lkp@intel.com/config)
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
rustc: rustc 1.96.0 (ac68faa20 2026-05-25)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261014/202610142146.Xhn8A9Y8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610142146.Xhn8A9Y8-lkp@intel.com/

All errors (new ones prefixed by >>):

   PATH=/opt/cross/clang-22/bin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
   INFO PATH=/opt/cross/rustc-1.96.0-bindgen-0.72.1/cargo/bin:/opt/cross/clang-22/bin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
   /usr/bin/timeout -k 100 12h /usr/bin/make KCFLAGS=\ -fno-crash-diagnostics\ -Wno-error=return-type\ -Wreturn-type\ -funsigned-char\ -Wundef\ -falign-functions=64 W=1 --keep-going LLVM=1 -j32 -C source O=/kbuild/obj/consumer/x86_64-rhel-9.4-rust ARCH=x86_64 SHELL=/bin/bash rustfmtcheck 
   make: Entering directory '/kbuild/src'
   make[1]: Entering directory '/kbuild/obj/consumer/x86_64-rhel-9.4-rust'
>> Diff in rust/kernel/rdma/address.rs:244:
                        let mut mac = [0; 6];
                        let mut vlan = 0;
>>                      crate::error::to_result(bindings::rdma_read_gid_l2_fields(
   -                        source, &mut vlan, mac.as_mut_ptr(),
   +                        source,
   +                        &mut vlan,
   +                        mac.as_mut_ptr(),
                        ))?;
                        Some((mac, vlan))
                    };
>> Diff in rust/kernel/rdma/ah.rs:93:
        ///
        /// Provider-internal users must drain before returning. Mandatory core cleanup does not
        /// retain a handle for another release attempt.
   -    fn release_address(
   -        self: Pin<&Self>,
   -        owner: Self::AddressHandle,
   -        _flags: AddressReleaseFlags,
   -    ) {
   +    fn release_address(self: Pin<&Self>, owner: Self::AddressHandle, _flags: AddressReleaseFlags) {
            drop(owner);
        }
    }
>> Diff in rust/kernel/rdma/pd.rs:63:
        ///
        /// The callback runs in sleepable context with exclusive ownership. It must finish cleanup
        /// before returning: mandatory core cleanup does not retain a handle for another attempt.
   -    fn release_domain(
   -        self: Pin<&Self>,
   -        owner: Self::Domain,
   -        _data: Option<UserData<'_, Self>>,
   -    ) {
   +    fn release_domain(self: Pin<&Self>, owner: Self::Domain, _data: Option<UserData<'_, Self>>) {
            drop(owner);
        }
    }
   Diff in rust/kernel/rdma/pd.rs:158:
            unsafe {
                let slot = &raw mut (*domain.cast::<Domain>()).private_data;
                let owner = T::Domain::from_foreign(ptr::replace(slot, ptr::null_mut()));
   -            Operations::<T>::data((*domain).device)
   -                .release_domain(owner, UserData::from_raw(data));
   +            Operations::<T>::data((*domain).device).release_domain(owner, UserData::from_raw(data));
                0
            }
        }
   Diff in rust/kernel/rdma/sysfs.rs:21:
    /// Checks a single sysfs path component before publishing its descriptor.
    pub(super) const fn valid_name(name: &CStr) -> bool {
        let bytes = name.to_bytes();
   -    if bytes.is_empty() || (bytes.len() == 1 && bytes[0] == b'.')
   +    if bytes.is_empty()
   +        || (bytes.len() == 1 && bytes[0] == b'.')
            || (bytes.len() == 2 && bytes[0] == b'.' && bytes[1] == b'.')
        {
            return false;
>> Diff in rust/kernel/rdma/ah.rs:93:
        ///
        /// Provider-internal users must drain before returning. Mandatory core cleanup does not
        /// retain a handle for another release attempt.
   -    fn release_address(
   -        self: Pin<&Self>,
   -        owner: Self::AddressHandle,
   -        _flags: AddressReleaseFlags,
   -    ) {
   +    fn release_address(self: Pin<&Self>, owner: Self::AddressHandle, _flags: AddressReleaseFlags) {
            drop(owner);
        }
    }
>> Diff in rust/kernel/rdma/address.rs:244:
                        let mut mac = [0; 6];
                        let mut vlan = 0;
>>                      crate::error::to_result(bindings::rdma_read_gid_l2_fields(
   -                        source, &mut vlan, mac.as_mut_ptr(),
   +                        source,
   +                        &mut vlan,
   +                        mac.as_mut_ptr(),
                        ))?;
                        Some((mac, vlan))
                    };
>> Diff in rust/kernel/rdma/pd.rs:63:
        ///
        /// The callback runs in sleepable context with exclusive ownership. It must finish cleanup
        /// before returning: mandatory core cleanup does not retain a handle for another attempt.
   -    fn release_domain(
   -        self: Pin<&Self>,
   -        owner: Self::Domain,
   -        _data: Option<UserData<'_, Self>>,
   -    ) {
   +    fn release_domain(self: Pin<&Self>, owner: Self::Domain, _data: Option<UserData<'_, Self>>) {
            drop(owner);
        }
    }
   Diff in rust/kernel/rdma/pd.rs:158:
            unsafe {
                let slot = &raw mut (*domain.cast::<Domain>()).private_data;
                let owner = T::Domain::from_foreign(ptr::replace(slot, ptr::null_mut()));
   -            Operations::<T>::data((*domain).device)
   -                .release_domain(owner, UserData::from_raw(data));
   +            Operations::<T>::data((*domain).device).release_domain(owner, UserData::from_raw(data));
                0
            }
        }
   Diff in rust/kernel/rdma/sysfs.rs:21:
    /// Checks a single sysfs path component before publishing its descriptor.
    pub(super) const fn valid_name(name: &CStr) -> bool {
        let bytes = name.to_bytes();
   -    if bytes.is_empty() || (bytes.len() == 1 && bytes[0] == b'.')
   +    if bytes.is_empty()
   +        || (bytes.len() == 1 && bytes[0] == b'.')
            || (bytes.len() == 2 && bytes[0] == b'.' && bytes[1] == b'.')
        {
            return false;
>> Diff in rust/kernel/rdma/address.rs:244:
                        let mut mac = [0; 6];
                        let mut vlan = 0;
>>                      crate::error::to_result(bindings::rdma_read_gid_l2_fields(
   -                        source, &mut vlan, mac.as_mut_ptr(),
   +                        source,
   +                        &mut vlan,
   +                        mac.as_mut_ptr(),
                        ))?;
                        Some((mac, vlan))
                    };
>> Diff in rust/kernel/rdma/ah.rs:93:
        ///
        /// Provider-internal users must drain before returning. Mandatory core cleanup does not
        /// retain a handle for another release attempt.
   -    fn release_address(
   -        self: Pin<&Self>,
   -        owner: Self::AddressHandle,
   -        _flags: AddressReleaseFlags,
   -    ) {
   +    fn release_address(self: Pin<&Self>, owner: Self::AddressHandle, _flags: AddressReleaseFlags) {
            drop(owner);
        }
    }
>> Diff in rust/kernel/rdma/pd.rs:63:
        ///
        /// The callback runs in sleepable context with exclusive ownership. It must finish cleanup
        /// before returning: mandatory core cleanup does not retain a handle for another attempt.
   -    fn release_domain(
   -        self: Pin<&Self>,
   -        owner: Self::Domain,
   -        _data: Option<UserData<'_, Self>>,
   -    ) {
   +    fn release_domain(self: Pin<&Self>, owner: Self::Domain, _data: Option<UserData<'_, Self>>) {
            drop(owner);
        }
    }
   Diff in rust/kernel/rdma/pd.rs:158:
            unsafe {
                let slot = &raw mut (*domain.cast::<Domain>()).private_data;
                let owner = T::Domain::from_foreign(ptr::replace(slot, ptr::null_mut()));
   -            Operations::<T>::data((*domain).device)
   -                .release_domain(owner, UserData::from_raw(data));
   +            Operations::<T>::data((*domain).device).release_domain(owner, UserData::from_raw(data));
                0
            }
        }
   Diff in rust/kernel/rdma/sysfs.rs:21:
    /// Checks a single sysfs path component before publishing its descriptor.
    pub(super) const fn valid_name(name: &CStr) -> bool {
        let bytes = name.to_bytes();
   -    if bytes.is_empty() || (bytes.len() == 1 && bytes[0] == b'.')
   +    if bytes.is_empty()
   +        || (bytes.len() == 1 && bytes[0] == b'.')
            || (bytes.len() == 2 && bytes[0] == b'.' && bytes[1] == b'.')
        {
            return false;
   make[2]: *** [Makefile:2038: rustfmt] Error 123
   make[2]: Target 'rustfmtcheck' not remade because of errors.
   make[1]: Leaving directory '/kbuild/obj/consumer/x86_64-rhel-9.4-rust'
   make[1]: *** [Makefile:248: __sub-make] Error 2
   make[1]: Target 'rustfmtcheck' not remade because of errors.
   make: *** [Makefile:248: __sub-make] Error 2
   make: Target 'rustfmtcheck' not remade because of errors.
   make: Leaving directory '/kbuild/src'

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
