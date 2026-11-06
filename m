Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.21
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793950265;
	b=HE1CcfmU4pRf445XxwtXbLcAw7nWiJ9BYSUHV3M/uwEg6JcjUsu5xerIyDrngxtQHRoX
	 uthsJZ+kJYggJPFIcwRt1cN+wuoZR9QfU+80hMCCNdVglH4fM2MnBd7yA4Dzbhqh3RJ0v
	 MSLyk+jig7VIBlFbx+HPLV5wPiApjWnHySpnB0wc4iY+0Z/pRH0uI5o34IA+yaLPEklHf
	 zr1Lm70ALbGWDCBMeGizU080xC20/XI8r02n9k24ZxXJvTuMLaWH/Tb8N4J5V9wVN5uMg
	 RFXi3xwDRTTGFwPikPHeFYaEebf8qwu1CYoQHbKsJTvNvcgU+AUTVS9SvqyDb/+FE2Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793950265;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=AQmB073PqCtmbCNZaM5um1Q8HDtPP4LUEACr4kxR2JY=;
	b=mBuOa9DLj2qhH7CO9dHxeNH+YK4RrZCRTixLKzHMTq7loMICVnHXM20Sg+RAbAbK69W0
	 C2bNpK79vsCcaqAo+uKiw75QP2OBBPFDZIh2rUjV6cLV4jTaHh1bnV+vxpWwQVZmS08Wb
	 9UJONTeZuO92si6ek7CF8fxymUD9G0oao1QJIl21tVbDvywna5c5Tr7KfGSK25c7zX0ti
	 pYFLqwNKN2u5T4pqlWraw+dZ5R6a/C+65rwW3aUFRblUqwFGtPi5g2Pri0EODUO05p3/V
	 eIaNIsMG57GF/rvbEIQN16NUzM5tryiwxFdpflXsbQKCPXFNLLkcLPflSfJ1OFDP4Nw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b="D1Q/nH4o";
	arc=none smtp.remote-ip=198.175.65.21
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B515A606A32E
	for <oe-kbuild-all@lists.linux.dev>; Fri,  6 Nov 2026 07:31:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B515A606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=D1Q/nH4o
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793950265; x=1825486265;
  h=date:from:to:cc:subject:message-id;
  bh=gLsbIKaMeV52vEF3mJFFGEM9QjGvlInPZM1xlsYFMRg=;
  b=D1Q/nH4o4C+tKcsNONT5k4FpxpZg0edvUOLd2Xi2Zel+rf8UIFRN3932
   C1OcDpJdOtGQ/UU3HRl9tF+57F+0pEv8UV/AGO7rU7ID9/e0i/t3ro1GO
   0fLTT2+kGqnxOvh0ZXPAdjl7mclXVbnaheh7DdLgJTtehJVx2c4HJAIuv
   CQ6UR8URDShgYc3ndeLGgoSIzCUO8IMtGZEu1SPZGq9tPe0laOnsQnWAr
   AOI/41NDSR2MV1tYuoRC4sfGHrCWyn9mRjdw3QO10PgWtdpVeLDMW+gQ+
   tUJ1boZGyaUQrV/2wuyehOwbVDclDt99ynj2ixg7psHVK9jbj5c/o4ypF
   g==;
X-CSE-ConnectionGUID: 4O2QZB3EQRqvjyMJVktXDg==
X-CSE-MsgGUID: KLbTN2lvTz+kawMF8eB6/Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11957"; a="2847370"
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="2847370"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2026 23:31:04 -0800
X-CSE-ConnectionGUID: w0t+eUU7QQqZOkm+jts1Iw==
X-CSE-MsgGUID: xZ4OEfnQRKe7ghdisrk6dQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="7090976"
Received: from igk-lkp-server01.igk.intel.com (HELO 58ca8a381a5c) ([10.211.93.152])
  by orviesa007.jf.intel.com with ESMTP; 05 Nov 2026 23:31:03 -0800
Received: from kbuild by 58ca8a381a5c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xPEPc-00000000A83-0Nq8;
	Fri, 06 Nov 2026 07:31:00 +0000
Date: Fri, 06 Nov 2026 08:30:18 +0100
From: kernel test robot <lkp@intel.com>
To: Takashi Iwai <tiwai@suse.de>
Cc: oe-kbuild-all@lists.linux.dev, alsa-devel@alsa-project.org
Subject: [tiwai-sound:test/sound-rust-v7.3 24/56] +    pub fn
 hw_constraint_minmax(&self, var: i32, min: u32, max: u32) ->
 crate::error::Result {
Message-ID: <202611060844.oYnGWPdW-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git test/sound-rust-v7.3
head:   070444a8abf14da700680a5331d0a95cd11e578b
commit: 6a450838191295e224845ae206d9594315682abc [24/56] ALSA: rust: pcm: Add hw_rule_add and hw_constraint_minmax abstractions
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20261106/202611060844.oYnGWPdW-lkp@intel.com/config)
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
rustc: rustc 1.96.0 (ac68faa20 2026-05-25)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261106/202611060844.oYnGWPdW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611060844.oYnGWPdW-lkp@intel.com/

All errors (new ones prefixed by >>):

   PATH=/opt/cross/clang-22/bin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
   INFO PATH=/opt/cross/rustc-1.96.0-bindgen-0.72.1/cargo/bin:/opt/cross/clang-22/bin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
   /usr/bin/timeout -k 100 12h /usr/bin/make KCFLAGS=\ -fno-crash-diagnostics\ -Wno-error=return-type\ -Wreturn-type\ -funsigned-char\ -Wundef\ -falign-functions=64 W=1 --keep-going LLVM=1 -j32 -C source O=/kbuild/obj/consumer/x86_64-rhel-9.4-rust ARCH=x86_64 SHELL=/bin/bash rustfmtcheck 
   make: Entering directory '/kbuild/src'
   make[1]: Entering directory '/kbuild/obj/consumer/x86_64-rhel-9.4-rust'
   Diff in rust/kernel/sound/pcm.rs:4:
    //!
    //! C header: [`include/sound/pcm.h`](srctree/include/sound/pcm.h)
    
   +use super::card::Card;
    use crate::{
        bindings,
        error::to_result,
   Diff in rust/kernel/sound/pcm.rs:10:
        prelude::*,
        str::CStr,
   -    sync::{atomic::{ordering, Atomic}, Arc, ArcBorrow},
   +    sync::{
   +        atomic::{ordering, Atomic},
   +        Arc, ArcBorrow,
   +    },
        types::Opaque,
    };
    use core::ffi::c_void;
   Diff in rust/kernel/sound/pcm.rs:16:
   -use super::card::Card;
    
    use core::marker::PhantomData;
    
   Diff in rust/kernel/sound/pcm.rs:193:
        ///
        /// Returns 8 for 8-bit formats, 16 for 16-bit formats, etc.
        pub fn format_width(&self) -> i32 {
   -        unsafe {
   -            bindings::snd_pcm_format_width((*self.as_raw()).format)
   -        }
   +        unsafe { bindings::snd_pcm_format_width((*self.as_raw()).format) }
        }
    
        /// Returns the raw `*mut snd_pcm_runtime` pointer.
   Diff in rust/kernel/sound/pcm.rs:266:
        /// Constrains a runtime parameter to the range \[`min`, `max`\].
        ///
        /// Mirrors `snd_pcm_hw_constraint_minmax()`.
   -    pub fn hw_constraint_minmax(
   -        &self,
   -        var: i32,
   -        min: u32,
   -        max: u32,
>> -    ) -> crate::error::Result {
>> +    pub fn hw_constraint_minmax(&self, var: i32, min: u32, max: u32) -> crate::error::Result {
>>          crate::error::to_result(unsafe {
                bindings::snd_pcm_hw_constraint_minmax(self.as_raw(), var as _, min, max)
            })
   Diff in rust/kernel/sound/pcm.rs:446:
        }
    
        /// Called to set hardware parameters.
   -    fn hw_params(
   -        &self,
   -        substream: &Substream,
   -        params: &HwParams,
   -    ) -> Result {
   +    fn hw_params(&self, substream: &Substream, params: &HwParams) -> Result {
            let _ = (substream, params);
            Ok(())
        }
   Diff in rust/kernel/sound/pcm.rs:706:
            max: usize,
        ) -> Result {
            to_result(unsafe {
   -            bindings::snd_pcm_set_managed_buffer_all(
   -                self.as_raw(),
   -                dma_type as i32,
   -                dev,
   -                size,
   -                max,
   -            )
   +            bindings::snd_pcm_set_managed_buffer_all(self.as_raw(), dma_type as i32, dev, size, max)
            })
        }
    
   Diff in rust/kernel/sound/pcm.rs:741:
    pub fn format_name(fmt: i32) -> &'static CStr {
        // SAFETY: `snd_pcm_format_name` always returns a valid, statically-allocated,
        // NUL-terminated C string for any format value, including unknown ones.
   -    unsafe { CStr::from_char_ptr(bindings::snd_pcm_format_name(fmt as bindings::snd_pcm_format_t)) }
   +    unsafe {
   +        CStr::from_char_ptr(bindings::snd_pcm_format_name(
   +            fmt as bindings::snd_pcm_format_t,
   +        ))
   +    }
    }
    
    /// Non-owning handle to a PCM substream, for spinlock-guarded interrupt context.
   Diff in rust/kernel/sound/pcm.rs:1064:
        /// error paths that unwind through the PCM core), so rule pointers obtained
        /// from the returned handle are guaranteed to remain valid for the runtime's
        /// lifetime.
   -    pub fn store_hw_rules<U: Send + 'static>(&self, rules: crate::alloc::KBox<U>) -> HwRuleHandle<U> {
   +    pub fn store_hw_rules<U: Send + 'static>(
   +        &self,
   +        rules: crate::alloc::KBox<U>,
   +    ) -> HwRuleHandle<U> {
            unsafe extern "C" fn free_cb<U>(rt: *mut bindings::snd_pcm_runtime) {
                let ptr = unsafe { (*rt).private_data as *mut U };
                // SAFETY: ptr was set from KBox::into_raw in store_hw_rules.
   Diff in rust/kernel/sound/pcm.rs:1071:
   -            unsafe { drop(crate::alloc::KBox::from_raw(ptr)); }
   -            unsafe { (*rt).private_data = core::ptr::null_mut(); }
   +            unsafe {
   +                drop(crate::alloc::KBox::from_raw(ptr));
   +            }
   +            unsafe {
   +                (*rt).private_data = core::ptr::null_mut();
   +            }
            }
            let raw = crate::alloc::KBox::into_raw(rules);
            // SAFETY: raw is a fresh heap pointer from KBox::into_raw; set_private
   Diff in rust/kernel/sound/pcm.rs:1076:
            // is called exactly once per runtime.
   -        unsafe { self.set_private(raw as *mut c_void, free_cb::<U>); }
   +        unsafe {
   +            self.set_private(raw as *mut c_void, free_cb::<U>);
   +        }
            HwRuleHandle(raw)
        }
    }
   Diff in rust/kernel/sound/pcm.rs:1105:
            let rule_ptr = rule_ref as *const R as *mut c_void;
            to_result(unsafe {
                bindings::snd_pcm_hw_rule_add(
   -                runtime.as_raw(), cond, var,
   +                runtime.as_raw(),
   +                cond,
   +                var,
                    Some(hw_rule_trampoline::<R>),
                    rule_ptr,
   -                dep0, dep1, dep2, dep3,
   +                dep0,
   +                dep1,
   +                dep2,
   +                dep3,
                )
            })
        }
   Diff in rust/kernel/sound/pcm.rs:1194:
        ) -> crate::error::Result<Self> {
            // SAFETY: dev is a valid kernel device; snd_devm_alloc_pages manages
            // its own lifetime via devres.
   -        let ptr = unsafe {
   -            bindings::snd_devm_alloc_pages(dev.as_raw(), dma_type as i32, size)
--
        /// Registers a control with custom settings.
   -    pub fn add_control(&self, iface: ElemIface, name: &CStr, ops: impl KControlOps) -> Result<Handle> {
   +    pub fn add_control(
   +        &self,
   +        iface: ElemIface,
   +        name: &CStr,
   +        ops: impl KControlOps,
   +    ) -> Result<Handle> {
            self.add_kcontrol(KControlConfig::new(iface, name), ops)
        }
    
   Diff in rust/kernel/sound/control.rs:304:
        /// Low-level entry point for fully custom controls.
   -    pub fn add_kcontrol(&self, config: KControlConfig<'_>, ops: impl KControlOps) -> Result<Handle> {
   +    pub fn add_kcontrol(
   +        &self,
   +        config: KControlConfig<'_>,
   +        ops: impl KControlOps,
   +    ) -> Result<Handle> {
            let data = KBox::new(
                KControlData(KBox::new(ops, GFP_KERNEL)? as KBox<dyn KControlOps>),
                GFP_KERNEL,
   Diff in rust/kernel/sound/control.rs:327:
            };
    
            // SAFETY: template is a valid snd_kcontrol_new on the stack.
   -        let kctl = unsafe {
   -            bindings::snd_ctl_new1(&template, data_ptr as *mut core::ffi::c_void)
   -        };
   +        let kctl = unsafe { bindings::snd_ctl_new1(&template, data_ptr as *mut core::ffi::c_void) };
    
            if kctl.is_null() {
                // snd_ctl_new1 failed; free data ourselves.
   Diff in rust/kernel/sound/control.rs:339:
    
            if config.bump_on_collision {
                while !unsafe { bindings::snd_ctl_find_id(self.as_raw(), &(*kctl).id) }.is_null() {
   -                unsafe { (*kctl).id.index += 1; }
   +                unsafe {
   +                    (*kctl).id.index += 1;
   +                }
                }
            }
    
   Diff in rust/kernel/sound/mod.rs:14:
    pub mod control;
    pub mod pcm;
    
   +pub use crate::{new_owned_sound_card, new_sound_card};
    pub use card::{Card, OwnedCard};
   -pub use control::{KControlConfig, KControlOps, ElemIface, ElemType};
   -pub use pcm::{Pcm};
   -pub use crate::{new_sound_card, new_owned_sound_card};
   +pub use control::{ElemIface, ElemType, KControlConfig, KControlOps};
   +pub use pcm::Pcm;
    
   Diff in rust/kernel/sound/pcm.rs:4:
    //!
    //! C header: [`include/sound/pcm.h`](srctree/include/sound/pcm.h)
    
   +use super::card::Card;
    use crate::{
        bindings,
        error::to_result,
   Diff in rust/kernel/sound/pcm.rs:10:
        prelude::*,
        str::CStr,
   -    sync::{atomic::{ordering, Atomic}, Arc, ArcBorrow},
   +    sync::{
   +        atomic::{ordering, Atomic},
   +        Arc, ArcBorrow,
   +    },
        types::Opaque,
    };
    use core::ffi::c_void;
   Diff in rust/kernel/sound/pcm.rs:16:
   -use super::card::Card;
    
    use core::marker::PhantomData;
    
   Diff in rust/kernel/sound/pcm.rs:193:
        ///
        /// Returns 8 for 8-bit formats, 16 for 16-bit formats, etc.
        pub fn format_width(&self) -> i32 {
   -        unsafe {
   -            bindings::snd_pcm_format_width((*self.as_raw()).format)
   -        }
   +        unsafe { bindings::snd_pcm_format_width((*self.as_raw()).format) }
        }
    
        /// Returns the raw `*mut snd_pcm_runtime` pointer.
   Diff in rust/kernel/sound/pcm.rs:266:
        /// Constrains a runtime parameter to the range \[`min`, `max`\].
        ///
        /// Mirrors `snd_pcm_hw_constraint_minmax()`.
   -    pub fn hw_constraint_minmax(
   -        &self,
   -        var: i32,
   -        min: u32,
   -        max: u32,
>> -    ) -> crate::error::Result {
>> +    pub fn hw_constraint_minmax(&self, var: i32, min: u32, max: u32) -> crate::error::Result {
>>          crate::error::to_result(unsafe {
                bindings::snd_pcm_hw_constraint_minmax(self.as_raw(), var as _, min, max)
            })
   Diff in rust/kernel/sound/pcm.rs:446:
        }
    
        /// Called to set hardware parameters.
   -    fn hw_params(
   -        &self,
   -        substream: &Substream,
   -        params: &HwParams,
   -    ) -> Result {
   +    fn hw_params(&self, substream: &Substream, params: &HwParams) -> Result {
            let _ = (substream, params);
            Ok(())
        }
   Diff in rust/kernel/sound/pcm.rs:706:
            max: usize,
        ) -> Result {
            to_result(unsafe {
   -            bindings::snd_pcm_set_managed_buffer_all(
   -                self.as_raw(),
   -                dma_type as i32,
   -                dev,
   -                size,
   -                max,
   -            )
   +            bindings::snd_pcm_set_managed_buffer_all(self.as_raw(), dma_type as i32, dev, size, max)
            })
        }
    
   Diff in rust/kernel/sound/pcm.rs:741:
    pub fn format_name(fmt: i32) -> &'static CStr {
        // SAFETY: `snd_pcm_format_name` always returns a valid, statically-allocated,
        // NUL-terminated C string for any format value, including unknown ones.
   -    unsafe { CStr::from_char_ptr(bindings::snd_pcm_format_name(fmt as bindings::snd_pcm_format_t)) }
   +    unsafe {
   +        CStr::from_char_ptr(bindings::snd_pcm_format_name(
   +            fmt as bindings::snd_pcm_format_t,
   +        ))
   +    }
    }
    
    /// Non-owning handle to a PCM substream, for spinlock-guarded interrupt context.
   Diff in rust/kernel/sound/pcm.rs:1064:
        /// error paths that unwind through the PCM core), so rule pointers obtained
        /// from the returned handle are guaranteed to remain valid for the runtime's
        /// lifetime.
   -    pub fn store_hw_rules<U: Send + 'static>(&self, rules: crate::alloc::KBox<U>) -> HwRuleHandle<U> {
   +    pub fn store_hw_rules<U: Send + 'static>(
   +        &self,
   +        rules: crate::alloc::KBox<U>,
   +    ) -> HwRuleHandle<U> {
            unsafe extern "C" fn free_cb<U>(rt: *mut bindings::snd_pcm_runtime) {
                let ptr = unsafe { (*rt).private_data as *mut U };
                // SAFETY: ptr was set from KBox::into_raw in store_hw_rules.
   Diff in rust/kernel/sound/pcm.rs:1071:
   -            unsafe { drop(crate::alloc::KBox::from_raw(ptr)); }
   -            unsafe { (*rt).private_data = core::ptr::null_mut(); }
   +            unsafe {
   +                drop(crate::alloc::KBox::from_raw(ptr));
   +            }
   +            unsafe {
   +                (*rt).private_data = core::ptr::null_mut();
   +            }
            }
            let raw = crate::alloc::KBox::into_raw(rules);
            // SAFETY: raw is a fresh heap pointer from KBox::into_raw; set_private
   Diff in rust/kernel/sound/pcm.rs:1076:
            // is called exactly once per runtime.
   -        unsafe { self.set_private(raw as *mut c_void, free_cb::<U>); }
   +        unsafe {
   +            self.set_private(raw as *mut c_void, free_cb::<U>);
   +        }
            HwRuleHandle(raw)
        }
    }
   Diff in rust/kernel/sound/pcm.rs:1105:
            let rule_ptr = rule_ref as *const R as *mut c_void;
            to_result(unsafe {
                bindings::snd_pcm_hw_rule_add(
   -                runtime.as_raw(), cond, var,
   +                runtime.as_raw(),
   +                cond,
   +                var,
                    Some(hw_rule_trampoline::<R>),
                    rule_ptr,
   -                dep0, dep1, dep2, dep3,
   +                dep0,
   +                dep1,
   +                dep2,
   +                dep3,
                )
            })
        }
   Diff in rust/kernel/sound/pcm.rs:1194:
        ) -> crate::error::Result<Self> {
            // SAFETY: dev is a valid kernel device; snd_devm_alloc_pages manages
            // its own lifetime via devres.
   -        let ptr = unsafe {
   -            bindings::snd_devm_alloc_pages(dev.as_raw(), dma_type as i32, size)
..

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
