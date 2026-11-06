Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.21
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793984796;
	b=KNauZCER7VP3RlGuTCo4wmZKG2HviedQGj7q3ktp4uYqiz0tNQisDgaClVZznMnXddU0
	 C8rIAhNuukuEWrZE2aGd247l5OobdLz85jm0LfXZ0nKcX23c2SYXCcWKiEddMs/zwxiN0
	 QhAFgGVm8/mqBKEAw1dogpn6RUzjDjrGRgWTpopJRY+y1imKGwy2EXFvF4jwwDX135f5r
	 LXbsv4t8xbSpxNJ6B/twoJoJ9hpqWKFtOjGxRMlEpxxfXLzF7a8JhCS9pMollB6FdBTUf
	 wYrndiGylz4q8o2Ou9i9DuQi3xAbsremIPULMe978mwhbJKY3l4e7kQU0KYgHGaGBgQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793984796;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=7PpvU1VgNlf/3JvSK6d7WBRURjjFczbsRPewjeVgFlQ=;
	b=pwAUFKsOOW15F0v25kfV4XbjTu/FMMbZeYZvN8Ld6+e4i97srtHlVapZnoNrWKzDdc8n
	 RNI5YhHDpgk926+ATKeJYVmDucyRR29Yv4EFcQryq2oFAwL4L9qek3Mr/0Vw1fRM2Rq4Z
	 FWhICW+UE7GIv/WCywuDB9GFCp1AwiTOndtC+5cRTPw3P+/CUF7D62ryFsFVFXI/0AlIM
	 iR2eiq9hdUsczqk6pANjNClB3g2sOEi+fCev3Q0SdxRtB5r3WxF6Q09xz1okft6gfgm+/
	 YoZ+nCyynjVTsIjeFILx76JnVcKgJ2S1ogdXq+pqcYk5LDPwhpZobnQ1X1R3plAdVeQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=mxXvdCNS;
	arc=none smtp.remote-ip=198.175.65.21
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4E54606A32C
	for <oe-kbuild-all@lists.linux.dev>; Fri,  6 Nov 2026 17:06:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D4E54606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=mxXvdCNS
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793984794; x=1825520794;
  h=date:from:to:cc:subject:message-id;
  bh=iI/vz1l76rk0fJ23Snfx+DJ7L9bblPm1j4Dvgi3JptY=;
  b=mxXvdCNS1lnxXTW0xURSE8ekz7S4Mx8FQHzO3ILidgo73qu1lH/k0p+s
   2X7fqkXnaWKyMr/vxDPtJCCC1/WRxAFO2RK0bYMokgMxPGr1ZQY20LjC5
   kHndyrKt1X+rExH6DKIdvImSsqrT6WcHm20FTZ+mWEToWTYaScJoM6CR7
   OVxFElzJrbBIh0evMIJK7C59ZE4Xz+SfLjwj32c+uDuRR6CBUZ3QBBE8j
   ONbOChZNRauVHKwQukjCbOZxboZsCnLueHqpUR8BNj0/PSESAZriG0XDL
   dRZxWdBQgDnle9W+G1sWO5/931ou+E2hvM6k+tmtTUzLjaBo/cMq96Qmm
   g==;
X-CSE-ConnectionGUID: lzYK6G92Q/OcPvbEVRO4kA==
X-CSE-MsgGUID: GGu7wXn1QRSSigkx+6LuEQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11958"; a="2893538"
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="2893538"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2026 09:06:34 -0800
X-CSE-ConnectionGUID: 88jJX7FOTfGKtLISFJ8OOQ==
X-CSE-MsgGUID: a1hDD7N5SB6OTo+gEhURmQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="7377183"
Received: from igk-lkp-server01.igk.intel.com (HELO 58ca8a381a5c) ([10.211.93.152])
  by orviesa006.jf.intel.com with ESMTP; 06 Nov 2026 09:06:32 -0800
Received: from kbuild by 58ca8a381a5c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xPNOX-00000000AK7-0JpQ;
	Fri, 06 Nov 2026 17:06:29 +0000
Date: Fri, 06 Nov 2026 18:05:42 +0100
From: kernel test robot <lkp@intel.com>
To: Colin Braun <colinbrauncl@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, alsa-devel@alsa-project.org,
 Takashi Iwai <tiwai@suse.de>
Subject: [tiwai-sound:test/sound-rust-v7.3 35/56] Diff in
 rust/kernel/usb.rs:32:
Message-ID: <202611061749.sOMovkvI-lkp@intel.com>
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
commit: 579098a741b1256ae5092d4eb8ae8116057c8458 [35/56] rust: usb: add usb host interface and endpoint abstractions
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20261106/202611061749.sOMovkvI-lkp@intel.com/config)
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
rustc: rustc 1.96.0 (ac68faa20 2026-05-25)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261106/202611061749.sOMovkvI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611061749.sOMovkvI-lkp@intel.com/

All errors (new ones prefixed by >>):

        fn new() -> impl PinInit<Self, Error> {
            try_pin_init!(Self {
   Diff in sound/rust/dummy.rs:181:
    
        fn trigger(&self, substream: &pcm::Substream, cmd: pcm::TriggerCommand) -> Result {
            match cmd {
   -            pcm::TriggerCommand::Start |
   -            pcm::TriggerCommand::Resume => {
   +            pcm::TriggerCommand::Start | pcm::TriggerCommand::Resume => {
                    let runtime = substream.runtime();
                    let rate = runtime.rate() as i64;
                    let period_size = runtime.period_size();
   Diff in sound/rust/dummy.rs:204:
                    let handle = self.timer.clone().start(Delta::from_nanos(period_ns));
                    self.chip.lock().timer_handle = Some(handle);
                }
   -            pcm::TriggerCommand::Stop |
   -            pcm::TriggerCommand::PausePush |
   -            pcm::TriggerCommand::Suspend => {
   +            pcm::TriggerCommand::Stop
   +            | pcm::TriggerCommand::PausePush
   +            | pcm::TriggerCommand::Suspend => {
                    // Clear substream so the callback returns NoRestart on its
                    // next (or current) invocation.
                    self.timer.substream.clear(ordering::Release);
   Diff in sound/rust/dummy.rs:332:
    fn cstr_slice(s: &[u8]) -> &[u8] {
        match s.iter().position(|&b| b == 0) {
            Some(n) => &s[..n],
   -        None    => s,
   +        None => s,
        }
    }
    
   Diff in sound/rust/dummy.rs:374:
                let _ = write!(buf, " knot");
            }
            const RATES: &[(u32, u32)] = &[
   -            (bindings::SNDRV_PCM_RATE_5512,   5512),
   -            (bindings::SNDRV_PCM_RATE_8000,   8000),
   -            (bindings::SNDRV_PCM_RATE_11025,  11025),
   -            (bindings::SNDRV_PCM_RATE_16000,  16000),
   -            (bindings::SNDRV_PCM_RATE_22050,  22050),
   -            (bindings::SNDRV_PCM_RATE_32000,  32000),
   -            (bindings::SNDRV_PCM_RATE_44100,  44100),
   -            (bindings::SNDRV_PCM_RATE_48000,  48000),
   -            (bindings::SNDRV_PCM_RATE_64000,  64000),
   -            (bindings::SNDRV_PCM_RATE_88200,  88200),
   -            (bindings::SNDRV_PCM_RATE_96000,  96000),
   +            (bindings::SNDRV_PCM_RATE_5512, 5512),
   +            (bindings::SNDRV_PCM_RATE_8000, 8000),
   +            (bindings::SNDRV_PCM_RATE_11025, 11025),
   +            (bindings::SNDRV_PCM_RATE_16000, 16000),
   +            (bindings::SNDRV_PCM_RATE_22050, 22050),
   +            (bindings::SNDRV_PCM_RATE_32000, 32000),
   +            (bindings::SNDRV_PCM_RATE_44100, 44100),
   +            (bindings::SNDRV_PCM_RATE_48000, 48000),
   +            (bindings::SNDRV_PCM_RATE_64000, 64000),
   +            (bindings::SNDRV_PCM_RATE_88200, 88200),
   +            (bindings::SNDRV_PCM_RATE_96000, 96000),
                (bindings::SNDRV_PCM_RATE_176400, 176400),
                (bindings::SNDRV_PCM_RATE_192000, 192000),
            ];
   Diff in sound/rust/dummy.rs:415:
    
                let mut val_buf = [0u8; 20];
                buf.get_str(&mut val_buf, rest);
   -            let Some(val) = parse_u64(cstr_slice(&val_buf)) else { continue };
   +            let Some(val) = parse_u64(cstr_slice(&val_buf)) else {
   +                continue;
   +            };
    
                let mut hw = self.chip.lock();
                match name {
   Diff in sound/rust/dummy.rs:422:
   -                b"formats"          => hw.pcm_hw.formats          = val,
   -                b"rates"            => hw.pcm_hw.rates             = val as u32,
   -                b"rate_min"         => hw.pcm_hw.rate_min          = val as u32,
   -                b"rate_max"         => hw.pcm_hw.rate_max          = val as u32,
   -                b"channels_min"     => hw.pcm_hw.channels_min      = val as u32,
   -                b"channels_max"     => hw.pcm_hw.channels_max      = val as u32,
   -                b"buffer_bytes_max" => hw.pcm_hw.buffer_bytes_max  = val as usize,
   -                b"period_bytes_min" => hw.pcm_hw.period_bytes_min  = val as usize,
   -                b"period_bytes_max" => hw.pcm_hw.period_bytes_max  = val as usize,
   -                b"periods_min"      => hw.pcm_hw.periods_min       = val as u32,
   -                b"periods_max"      => hw.pcm_hw.periods_max       = val as u32,
   +                b"formats" => hw.pcm_hw.formats = val,
   +                b"rates" => hw.pcm_hw.rates = val as u32,
   +                b"rate_min" => hw.pcm_hw.rate_min = val as u32,
   +                b"rate_max" => hw.pcm_hw.rate_max = val as u32,
   +                b"channels_min" => hw.pcm_hw.channels_min = val as u32,
   +                b"channels_max" => hw.pcm_hw.channels_max = val as u32,
   +                b"buffer_bytes_max" => hw.pcm_hw.buffer_bytes_max = val as usize,
   +                b"period_bytes_min" => hw.pcm_hw.period_bytes_min = val as usize,
   +                b"period_bytes_max" => hw.pcm_hw.period_bytes_max = val as usize,
   +                b"periods_min" => hw.pcm_hw.periods_min = val as u32,
   +                b"periods_max" => hw.pcm_hw.periods_max = val as u32,
                    _ => {}
                }
            }
>> Diff in rust/kernel/usb.rs:32:
        marker::PhantomData,
        mem::offset_of,
        ptr::NonNull, //
   -    slice, //
   +    slice,        //
    };
    
    pub mod ch9;
   Diff in rust/kernel/sound/info.rs:13:
    //!
    //! C header: [`include/sound/info.h`](srctree/include/sound/info.h)
    
   +use super::card::Card;
    use crate::{bindings, error::to_result, prelude::*, sync::Arc};
    use core::marker::PhantomData;
   -use super::card::Card;
    
    //
    // InfoBuffer
   Diff in rust/kernel/sound/info.rs:52:
        pub fn get_line(&mut self, line: &mut [u8]) -> bool {
            // SAFETY: self.0 is valid; line is a writable slice of the given length.
            let ret = unsafe {
   -            bindings::snd_info_get_line(
   -                self.0,
   -                line.as_mut_ptr(),
   -                line.len() as core::ffi::c_int,
   -            )
   +            bindings::snd_info_get_line(self.0, line.as_mut_ptr(), line.len() as core::ffi::c_int)
            };
            ret == 0
        }
   Diff in rust/kernel/sound/info.rs:208:
        where
            T: TextOps + Sync + Send + 'static,
        {
   -        self.proc_new_impl(name, data, Some(TextOpsTable::<T>::c_read), Some(TextOpsTable::<T>::c_write))
   +        self.proc_new_impl(
   +            name,
   +            data,
   +            Some(TextOpsTable::<T>::c_read),
   +            Some(TextOpsTable::<T>::c_write),
   +        )
        }
    
        /// Common implementation for [`ro_proc_new`] and [`rw_proc_new`].
   Diff in rust/kernel/sound/info.rs:216:
            &self,
            name: &CStr,
            data: Arc<T>,
   -        read: Option<unsafe extern "C" fn(*mut bindings::snd_info_entry, *mut bindings::snd_info_buffer)>,
   -        write: Option<unsafe extern "C" fn(*mut bindings::snd_info_entry, *mut bindings::snd_info_buffer)>,
   +        read: Option<
   +            unsafe extern "C" fn(*mut bindings::snd_info_entry, *mut bindings::snd_info_buffer),
   +        >,
   +        write: Option<
   +            unsafe extern "C" fn(*mut bindings::snd_info_entry, *mut bindings::snd_info_buffer),
   +        >,
        ) -> Result
        where
            T: TextOps + Sync + Send + 'static,
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
--
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
    
   Diff in rust/kernel/sound/pcm.rs:753:
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
   Diff in rust/kernel/sound/pcm.rs:1076:
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
   Diff in rust/kernel/sound/pcm.rs:1083:
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
   Diff in rust/kernel/sound/pcm.rs:1088:
            // is called exactly once per runtime.
   -        unsafe { self.set_private(raw as *mut c_void, free_cb::<U>); }
   +        unsafe {
   +            self.set_private(raw as *mut c_void, free_cb::<U>);
   +        }
            HwRuleHandle(raw)
        }
    }
   Diff in rust/kernel/sound/pcm.rs:1117:
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
   Diff in rust/kernel/sound/pcm.rs:1206:
        ) -> crate::error::Result<Self> {
            // SAFETY: dev is a valid kernel device; snd_devm_alloc_pages manages
            // its own lifetime via devres.
   -        let ptr = unsafe {
   -            bindings::snd_devm_alloc_pages(dev.as_raw(), dma_type as i32, size)
   -        };
   +        let ptr = unsafe { bindings::snd_devm_alloc_pages(dev.as_raw(), dma_type as i32, size) };
            if ptr.is_null() {
                Err(ENOMEM)
            } else {
>> Diff in rust/kernel/usb.rs:32:
        marker::PhantomData,
        mem::offset_of,
        ptr::NonNull, //
   -    slice, //
   +    slice,        //
    };
    
    pub mod ch9;
   Diff in rust/kernel/pm.rs:24:
        types::ForeignOwnable, //
    };
    
   -use core::{
   -    cell::UnsafeCell,
   -    marker::PhantomData
   -};
   +use core::{cell::UnsafeCell, marker::PhantomData};
    
    /// Runtime Power Management modes that determine how a particular PM
    /// transition is to be carried out.
   Diff in rust/kernel/pci/irq.rs:185:
            // SAFETY: `irq` is a valid IRQ number for `self.dev`, resolved from this registration.
            // `self.dev` carries the full `'a` lifetime; `.as_ref()` preserves it so the returned
            // `IrqRequest<'a>` has the correct lifetime without any borrow shortening.
   -        Ok((unsafe { IrqRequest::new(self.dev.as_ref(), irq as u32) }, self))
   +        Ok((
   +            unsafe { IrqRequest::new(self.dev.as_ref(), irq as u32) },
   +            self,
   +        ))
        }
    }
    
   Diff in rust/kernel/pci/irq.rs:185:
            // SAFETY: `irq` is a valid IRQ number for `self.dev`, resolved from this registration.
            // `self.dev` carries the full `'a` lifetime; `.as_ref()` preserves it so the returned
            // `IrqRequest<'a>` has the correct lifetime without any borrow shortening.
   -        Ok((unsafe { IrqRequest::new(self.dev.as_ref(), irq as u32) }, self))
   +        Ok((
   +            unsafe { IrqRequest::new(self.dev.as_ref(), irq as u32) },
   +            self,
   +        ))
        }
    }
    
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
