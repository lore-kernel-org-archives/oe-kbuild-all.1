Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BB93318ED3
	for <oe-kbuild-all@lists.linux.dev>; Wed,  4 Feb 2026 22:51:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770245485; cv=none; b=TnWsdu1wY8DiGV1EUqfe8UzZ4eFulvAIYEBGEOhYPjdpiuXqutS9PbSSjKh49Kcjh8x4SE7qlMEKFAVMW9+JUBdGX4ngFAP2IQq0+B8htk+nD+ZpsXkgXv53LegPBfY7i/9MdABvFtoDJW26zKkUZvKGT/4pvZuHjwKP4sk1A4g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770245485; c=relaxed/simple;
	bh=8ASg7zHfyZSUqGE6jMTRHxYDtaIpkF12U4cQ5TknXmA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=j/qijT7i+35LY6JVLHGIBpqCpt0mFJ3G5VyQ+en/Fw0cc0wZJRD3yssQmf7WoOTSEb0t3VkSquOG8ktHHzg0VI0R7e9d8Xh5Y/F/n+x90BjStPd5e4xJLEyEZ2gXYQ5oS0mwdptNaTN13bG3184fllsDWVyzgibIhkEepxvPA7k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IK/yj9Hx; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IK/yj9Hx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770245485; x=1801781485;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=8ASg7zHfyZSUqGE6jMTRHxYDtaIpkF12U4cQ5TknXmA=;
  b=IK/yj9HxTTiCIscixdMvYnKTEim0Z0hfG/+uFVYu+/FuFvMqhqlyfet0
   OlqVZZI7r1oXgCEwGESSEKk+RCX7tmwCiirPRJLHOdYP23XJH3z7RFvwH
   7Ipdvt+9sTQxYeakwzmSslegm1beOugPL666MawYH4qKMI/byPBwqcrd4
   D3oy45yOIQ2tCYZ31m9YirH+8U2fzX+AkXoDVNierF/xyjZ4hSSoyoSB8
   /e36NGGOaJ7I7MLNP46sWdvhwrjnZDCxnL8Lq82aSprJ263i5jCCRAyGd
   Sp4vqlldoK1YHW2lS4yuMMPYwkGNCo1GspCXlpYa/0OXzymNETa1mb7LM
   A==;
X-CSE-ConnectionGUID: ye7Ul+6IQZ2pLGVyAEFoyw==
X-CSE-MsgGUID: REPgBOU/QCuN8CotDs0tGw==
X-IronPort-AV: E=McAfee;i="6800,10657,11691"; a="71499436"
X-IronPort-AV: E=Sophos;i="6.21,273,1763452800"; 
   d="scan'208";a="71499436"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Feb 2026 14:51:17 -0800
X-CSE-ConnectionGUID: anaVayjPQA+WhqMGJSeLCw==
X-CSE-MsgGUID: DcbSzAyTRjOEaEW5mfHOiA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,273,1763452800"; 
   d="scan'208";a="209666270"
Received: from igk-lkp-server01.igk.intel.com (HELO afc5bfd7f602) ([10.211.93.152])
  by fmviesa007.fm.intel.com with ESMTP; 04 Feb 2026 14:51:10 -0800
Received: from kbuild by afc5bfd7f602 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vnliG-000000003q9-0rdd;
	Wed, 04 Feb 2026 22:51:08 +0000
Date: Wed, 4 Feb 2026 23:50:40 +0100
From: kernel test robot <lkp@intel.com>
To: Andreas Hindborg <a.hindborg@kernel.org>,
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Dave Ertman <david.m.ertman@intel.com>,
	Ira Weiny <ira.weiny@intel.com>, Leon Romanovsky <leon@kernel.org>,
	Paul Moore <paul@paul-moore.com>, Serge Hallyn <sergeh@kernel.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>,
	Igor Korotin <igor.korotin.linux@gmail.com>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>,
	Stephen Boyd <sboyd@kernel.org>, Bjorn Helgaas <helgaas@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v14 2/9] rust: rename `AlwaysRefCounted` to `RefCounted`.
Message-ID: <202602042300.Ec1WiMLA-lkp@intel.com>
References: <20260204-unique-ref-v14-2-17cb29ebacbb@kernel.org>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260204-unique-ref-v14-2-17cb29ebacbb@kernel.org>

Hi Andreas,

kernel test robot noticed the following build errors:

[auto build test ERROR on 63804fed149a6750ffd28610c5c1c98cce6bd377]

url:    https://github.com/intel-lab-lkp/linux/commits/Andreas-Hindborg/rust-types-Add-Ownable-Owned-types/20260204-200041
base:   63804fed149a6750ffd28610c5c1c98cce6bd377
patch link:    https://lore.kernel.org/r/20260204-unique-ref-v14-2-17cb29ebacbb%40kernel.org
patch subject: [PATCH v14 2/9] rust: rename `AlwaysRefCounted` to `RefCounted`.
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20260204/202602042300.Ec1WiMLA-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260204/202602042300.Ec1WiMLA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602042300.Ec1WiMLA-lkp@intel.com/

All errors (new ones prefixed by >>):

>> error[E0407]: method `inc_ref` is not a member of trait `AlwaysRefCounted`
   --> rust/kernel/usb.rs:378:5
   |
   378 | /     fn inc_ref(&self) {
   ...   |
   383 | |     }
   | |_____^ not a member of trait `AlwaysRefCounted`
--
>> error[E0407]: method `dec_ref` is not a member of trait `AlwaysRefCounted`
   --> rust/kernel/usb.rs:385:5
   |
   385 | /     unsafe fn dec_ref(obj: NonNull<Self>) {
   386 | |         // SAFETY: The safety requirements guarantee that the refcount is non-zero.
   387 | |         unsafe { bindings::usb_put_intf(obj.cast().as_ptr()) }
   388 | |     }
   | |_____^ not a member of trait `AlwaysRefCounted`
--
>> error[E0277]: the trait bound `usb::Interface: sync::aref::RefCounted` is not satisfied
   --> rust/kernel/device.rs:700:17
   |
   700 |                 (&**dev).into()
   |                 ^^^^^^^^^^^^^^^ the trait `sync::aref::RefCounted` is not implemented for `usb::Interface`
   |
   ::: rust/kernel/usb.rs:352:1
   |
   352 | kernel::impl_device_context_into_aref!(Interface);
   | ------------------------------------------------- in this macro invocation
   |
   = help: the following other types implement trait `sync::aref::RefCounted`:
   auxiliary::Device
   block::mq::request::Request<T>
   cred::Credential
   device::Device
   device::property::FwNode
   fs::file::File
   fs::file::LocalFile
   i2c::I2cAdapter
   and 8 others
   note: required by a bound in `sync::aref::ARef`
   --> rust/kernel/sync/aref.rs:86:20
   |
   86  | pub struct ARef<T: RefCounted> {
   |                    ^^^^^^^^^^ required by this bound in `ARef`
   = note: this error originates in the macro `::kernel::__impl_device_context_into_aref` which comes from the expansion of the macro `kernel::impl_device_context_into_aref` (in Nightly builds, run with -Z macro-backtrace for more info)
--
>> error[E0277]: the trait bound `usb::Device: sync::aref::RefCounted` is not satisfied
   --> rust/kernel/device.rs:700:17
   |
   700 |                 (&**dev).into()
   |                 ^^^^^^^^^^^^^^^ the trait `sync::aref::RefCounted` is not implemented for `usb::Device`
   |
   ::: rust/kernel/usb.rs:425:1
   |
   425 | kernel::impl_device_context_into_aref!(Device);
   | ---------------------------------------------- in this macro invocation
   |
   = help: the following other types implement trait `sync::aref::RefCounted`:
   auxiliary::Device
   block::mq::request::Request<T>
   cred::Credential
   device::Device
   device::property::FwNode
   fs::file::File
   fs::file::LocalFile
   i2c::I2cAdapter
   and 8 others
   note: required by a bound in `sync::aref::ARef`
   --> rust/kernel/sync/aref.rs:86:20
   |
   86  | pub struct ARef<T: RefCounted> {
   |                    ^^^^^^^^^^ required by this bound in `ARef`
   = note: this error originates in the macro `::kernel::__impl_device_context_into_aref` which comes from the expansion of the macro `kernel::impl_device_context_into_aref` (in Nightly builds, run with -Z macro-backtrace for more info)
--
>> error[E0407]: method `inc_ref` is not a member of trait `AlwaysRefCounted`
   --> rust/kernel/usb.rs:429:5
   |
   429 | /     fn inc_ref(&self) {
   ...   |
   434 | |     }
   | |_____^ not a member of trait `AlwaysRefCounted`
--
>> error[E0407]: method `dec_ref` is not a member of trait `AlwaysRefCounted`
   --> rust/kernel/usb.rs:436:5
   |
   436 | /     unsafe fn dec_ref(obj: NonNull<Self>) {
   437 | |         // SAFETY: The safety requirements guarantee that the refcount is non-zero.
   438 | |         unsafe { bindings::usb_put_dev(obj.cast().as_ptr()) }
   439 | |     }
   | |_____^ not a member of trait `AlwaysRefCounted`
--
>> error[E0277]: the trait bound `usb::Interface: sync::aref::RefCounted` is not satisfied
   --> rust/kernel/device.rs:698:56
   |
   698 |         impl ::core::convert::From<&$device<$src>> for $crate::sync::aref::ARef<$device> {
   |                                                        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ the trait `sync::aref::RefCounted` is not implemented for `usb::Interface`
   |
   ::: rust/kernel/usb.rs:352:1
   |
   352 | kernel::impl_device_context_into_aref!(Interface);
   | ------------------------------------------------- in this macro invocation
   |
   = help: the following other types implement trait `sync::aref::RefCounted`:
   auxiliary::Device
   block::mq::request::Request<T>
   cred::Credential
   device::Device
   device::property::FwNode
   fs::file::File
   fs::file::LocalFile
   i2c::I2cAdapter
   and 8 others
   note: required by a bound in `sync::aref::ARef`
   --> rust/kernel/sync/aref.rs:86:20
   |
   86  | pub struct ARef<T: RefCounted> {
   |                    ^^^^^^^^^^ required by this bound in `ARef`
   = note: this error originates in the macro `::kernel::__impl_device_context_into_aref` which comes from the expansion of the macro `kernel::impl_device_context_into_aref` (in Nightly builds, run with -Z macro-backtrace for more info)
--
>> error[E0277]: the trait bound `usb::Interface: sync::aref::RefCounted` is not satisfied
   --> rust/kernel/usb.rs:377:34
   |
   377 | unsafe impl AlwaysRefCounted for Interface {
   |                                  ^^^^^^^^^ the trait `sync::aref::RefCounted` is not implemented for `usb::Interface`
   |
   = help: the following other types implement trait `sync::aref::RefCounted`:
   auxiliary::Device
   block::mq::request::Request<T>
   cred::Credential
   device::Device
   device::property::FwNode
   fs::file::File
   fs::file::LocalFile
   i2c::I2cAdapter
   and 8 others
   note: required by a bound in `sync::aref::AlwaysRefCounted`
   --> rust/kernel/sync/aref.rs:74:36
   |
   74  | pub unsafe trait AlwaysRefCounted: RefCounted {}
   |                                    ^^^^^^^^^^ required by this bound in `AlwaysRefCounted`
--
>> error[E0277]: the trait bound `usb::Device: sync::aref::RefCounted` is not satisfied
   --> rust/kernel/device.rs:698:56
   |
   698 |         impl ::core::convert::From<&$device<$src>> for $crate::sync::aref::ARef<$device> {
   |                                                        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ the trait `sync::aref::RefCounted` is not implemented for `usb::Device`
   |
   ::: rust/kernel/usb.rs:425:1
   |
   425 | kernel::impl_device_context_into_aref!(Device);
   | ---------------------------------------------- in this macro invocation
   |
   = help: the following other types implement trait `sync::aref::RefCounted`:
   auxiliary::Device
   block::mq::request::Request<T>
   cred::Credential
   device::Device
   device::property::FwNode
   fs::file::File
   fs::file::LocalFile
   i2c::I2cAdapter
   and 8 others
   note: required by a bound in `sync::aref::ARef`
   --> rust/kernel/sync/aref.rs:86:20
   |
   86  | pub struct ARef<T: RefCounted> {
   |                    ^^^^^^^^^^ required by this bound in `ARef`
   = note: this error originates in the macro `::kernel::__impl_device_context_into_aref` which comes from the expansion of the macro `kernel::impl_device_context_into_aref` (in Nightly builds, run with -Z macro-backtrace for more info)
--
>> error[E0277]: the trait bound `usb::Device: sync::aref::RefCounted` is not satisfied
   --> rust/kernel/usb.rs:428:34
   |
   428 | unsafe impl AlwaysRefCounted for Device {
   |                                  ^^^^^^ the trait `sync::aref::RefCounted` is not implemented for `usb::Device`
   |
   = help: the following other types implement trait `sync::aref::RefCounted`:
   auxiliary::Device
   block::mq::request::Request<T>
   cred::Credential
   device::Device
   device::property::FwNode
   fs::file::File
   fs::file::LocalFile
   i2c::I2cAdapter
   and 8 others
   note: required by a bound in `sync::aref::AlwaysRefCounted`
   --> rust/kernel/sync/aref.rs:74:36
   |
   74  | pub unsafe trait AlwaysRefCounted: RefCounted {}
   |                                    ^^^^^^^^^^ required by this bound in `AlwaysRefCounted`
--
>> error[E0277]: the trait bound `usb::Interface: sync::aref::RefCounted` is not satisfied
   --> rust/kernel/device.rs:699:45
   |
   699 |             fn from(dev: &$device<$src>) -> Self {
   |                                             ^^^^ the trait `sync::aref::RefCounted` is not implemented for `usb::Interface`
   |
   ::: rust/kernel/usb.rs:352:1
   |
   352 | kernel::impl_device_context_into_aref!(Interface);
   | ------------------------------------------------- in this macro invocation
   |
   = help: the following other types implement trait `sync::aref::RefCounted`:
   auxiliary::Device
   block::mq::request::Request<T>
   cred::Credential
   device::Device
   device::property::FwNode
   fs::file::File
   fs::file::LocalFile
   i2c::I2cAdapter
   and 8 others
   note: required by a bound in `sync::aref::ARef`
   --> rust/kernel/sync/aref.rs:86:20
   |
   86  | pub struct ARef<T: RefCounted> {
   |                    ^^^^^^^^^^ required by this bound in `ARef`
   = note: this error originates in the macro `::kernel::__impl_device_context_into_aref` which comes from the expansion of the macro `kernel::impl_device_context_into_aref` (in Nightly builds, run with -Z macro-backtrace for more info)
..

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
