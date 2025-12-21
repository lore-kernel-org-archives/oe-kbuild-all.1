Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60A56548EE
	for <oe-kbuild-all@lists.linux.dev>; Sun, 21 Dec 2025 03:57:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766289478; cv=none; b=r1hMrcnQA9GXLYu7aQohVFn2G/usbyN7v/ywiv0dllpWVJTvWlNxeVHjcmaq8hLCNFuNARfkH5IsG8Et1Kpbf3vLzxlX3Dhdq7/TIjpMCv4bZCwLLZgE4BbnlpE3dHhC8GZKldF27unJCAfxoHXovtOIC3oNDZV2+JKzXDrC8NY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766289478; c=relaxed/simple;
	bh=LlARctBywG0K0PO7gIzaWkVX/DehRD5oJCgxgI8TOOs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=HLL8fAWxsNG4+78k297+miab8yS1VM1ZMNIxJLXRHwk/kMWpBCNxw4Esqx1nLDaFumkYFbD0EJkYefmbd0Cjm+/8yIr4rfMQ4z3HqUv7936W8rAVRmzIz6CuA9XNzDaiNSCm1QpEIxjxAfbI9gZry16URYi7RfpVgEi9hihIzP4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NpHgSZ+o; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NpHgSZ+o"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766289476; x=1797825476;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=LlARctBywG0K0PO7gIzaWkVX/DehRD5oJCgxgI8TOOs=;
  b=NpHgSZ+oQZ9WN3r4HsDV5CXVIzxoqVLfABAEB9FiAYifjz7gYSPLABcp
   w3a8o3reCMXYB6Y5SWlUCX+F9zhpm6YTa8V4vQdbvruapolGkkKMTibYx
   mklp7vsLiINKtrnqFRY6ISrT5qoU8BMfvcNNNR7LPTl3Ntc3I5xegFNV7
   rNndUajMH5m7LKm4/1Vob6lNmL0KdCDNYsT22sI1jsRp+xM7yqc8P+87F
   GT9lD+0q08rik4b6guy0ZybndC2T7tyqoUO53pFOWLEAWnZ7d4UKad1FD
   ZKm+Wocr6HABGrED1gWEw5BNP3nTWrssYdA6iEe5SSdKO5DoV3HBtG2HF
   w==;
X-CSE-ConnectionGUID: tWOqJ+MDT2+FzaAs9cnG+A==
X-CSE-MsgGUID: ijRC1jCZS62jUTqKgkkMvg==
X-IronPort-AV: E=McAfee;i="6800,10657,11648"; a="71826362"
X-IronPort-AV: E=Sophos;i="6.21,164,1763452800"; 
   d="scan'208";a="71826362"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Dec 2025 19:57:55 -0800
X-CSE-ConnectionGUID: p2Z5DhRJSkOgdeSM2y9FOw==
X-CSE-MsgGUID: oE87xGa3Q5iUE6kDpjbYtw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,164,1763452800"; 
   d="scan'208";a="200102027"
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a) ([10.211.93.152])
  by fmviesa010.fm.intel.com with ESMTP; 20 Dec 2025 19:57:54 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vXAZr-000000004vU-46YT;
	Sun, 21 Dec 2025 03:57:51 +0000
Date: Sun, 21 Dec 2025 04:57:23 +0100
From: kernel test robot <lkp@intel.com>
To: Sasha Levin <sashal@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [sashal:spec 4/131] Diff in
 tools/kapi/src/extractor/vmlinux/binary_utils.rs:48:
Message-ID: <202512210455.fOiqaYU6-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/sashal/linux.git spec
head:   d34c22a9d280338fc8a0f12fd5577e62f345503e
commit: 5b43072768b7c760c4421498125a39575340b306 [4/131] tools/kapi: Add kernel API specification extraction tool
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20251221/202512210455.fOiqaYU6-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251221/202512210455.fOiqaYU6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512210455.fOiqaYU6-lkp@intel.com/

All errors (new ones prefixed by >>):

   PATH=/opt/cross/clang-20/bin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
   INFO PATH=/opt/cross/rustc-1.88.0-bindgen-0.72.1/cargo/bin:/opt/cross/clang-20/bin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
   /usr/bin/timeout -k 100 12h /usr/bin/make KCFLAGS= -fno-crash-diagnostics -Wno-error=return-type -Wreturn-type -funsigned-char -Wundef W=1 --keep-going LLVM=1 -j32 -C source O=/kbuild/obj/consumer/x86_64-rhel-9.4-rust ARCH=x86_64 SHELL=/bin/bash rustfmtcheck
   make: Entering directory '/kbuild/src/consumer'
   make[1]: Entering directory '/kbuild/obj/consumer/x86_64-rhel-9.4-rust'
>> Diff in tools/kapi/src/extractor/vmlinux/binary_utils.rs:48:
        }
    
        pub fn read_u32(&mut self) -> Option<u32> {
   -        self.read_bytes(4).map(|b| u32::from_le_bytes(b.try_into().unwrap()))
   +        self.read_bytes(4)
   +            .map(|b| u32::from_le_bytes(b.try_into().unwrap()))
        }
    
        pub fn read_u8(&mut self) -> Option<u8> {
   Diff in tools/kapi/src/extractor/vmlinux/binary_utils.rs:56:
        }
    
        pub fn read_i32(&mut self) -> Option<i32> {
   -        self.read_bytes(4).map(|b| i32::from_le_bytes(b.try_into().unwrap()))
   +        self.read_bytes(4)
   +            .map(|b| i32::from_le_bytes(b.try_into().unwrap()))
        }
    
        pub fn read_u64(&mut self) -> Option<u64> {
   Diff in tools/kapi/src/extractor/vmlinux/binary_utils.rs:63:
   -        self.read_bytes(8).map(|b| u64::from_le_bytes(b.try_into().unwrap()))
   +        self.read_bytes(8)
   +            .map(|b| u64::from_le_bytes(b.try_into().unwrap()))
        }
    
        pub fn read_i64(&mut self) -> Option<i64> {
   Diff in tools/kapi/src/extractor/vmlinux/binary_utils.rs:67:
   -        self.read_bytes(8).map(|b| i64::from_le_bytes(b.try_into().unwrap()))
   +        self.read_bytes(8)
   +            .map(|b| i64::from_le_bytes(b.try_into().unwrap()))
        }
    
        pub fn read_usize(&mut self) -> Option<usize> {
   Diff in tools/kapi/src/extractor/vmlinux/binary_utils.rs:101:
            }
            Some(result)
        }
   -
   -
    }
    
    // Structure layout definitions for calculating sizes
>> Diff in tools/kapi/src/extractor/vmlinux/binary_utils.rs:48:
        }
    
        pub fn read_u32(&mut self) -> Option<u32> {
   -        self.read_bytes(4).map(|b| u32::from_le_bytes(b.try_into().unwrap()))
   +        self.read_bytes(4)
   +            .map(|b| u32::from_le_bytes(b.try_into().unwrap()))
        }
    
        pub fn read_u8(&mut self) -> Option<u8> {
   Diff in tools/kapi/src/extractor/vmlinux/binary_utils.rs:56:
        }
    
        pub fn read_i32(&mut self) -> Option<i32> {
   -        self.read_bytes(4).map(|b| i32::from_le_bytes(b.try_into().unwrap()))
   +        self.read_bytes(4)
   +            .map(|b| i32::from_le_bytes(b.try_into().unwrap()))
        }
    
        pub fn read_u64(&mut self) -> Option<u64> {
   Diff in tools/kapi/src/extractor/vmlinux/binary_utils.rs:63:
   -        self.read_bytes(8).map(|b| u64::from_le_bytes(b.try_into().unwrap()))
   +        self.read_bytes(8)
   +            .map(|b| u64::from_le_bytes(b.try_into().unwrap()))
        }
    
        pub fn read_i64(&mut self) -> Option<i64> {
   Diff in tools/kapi/src/extractor/vmlinux/binary_utils.rs:67:
   -        self.read_bytes(8).map(|b| i64::from_le_bytes(b.try_into().unwrap()))
   +        self.read_bytes(8)
   +            .map(|b| i64::from_le_bytes(b.try_into().unwrap()))
        }
    
        pub fn read_usize(&mut self) -> Option<usize> {
   Diff in tools/kapi/src/extractor/vmlinux/binary_utils.rs:101:
            }
            Some(result)
        }
   -
   -
    }
    
    // Structure layout definitions for calculating sizes
>> Diff in tools/kapi/src/extractor/vmlinux/magic_finder.rs:1:
    // Magic markers for each section
   -pub const MAGIC_PARAM: u32 = 0x4B415031;    // 'KAP1'
   -pub const MAGIC_RETURN: u32 = 0x4B415232;   // 'KAR2'
   -pub const MAGIC_ERROR: u32 = 0x4B414533;    // 'KAE3'
   -pub const MAGIC_LOCK: u32 = 0x4B414C34;     // 'KAL4'
   +pub const MAGIC_PARAM: u32 = 0x4B415031; // 'KAP1'
   +pub const MAGIC_RETURN: u32 = 0x4B415232; // 'KAR2'
   +pub const MAGIC_ERROR: u32 = 0x4B414533; // 'KAE3'
   +pub const MAGIC_LOCK: u32 = 0x4B414C34; // 'KAL4'
    pub const MAGIC_CONSTRAINT: u32 = 0x4B414335; // 'KAC5'
   -pub const MAGIC_INFO: u32 = 0x4B414936;     // 'KAI6'
   -pub const MAGIC_SIGNAL: u32 = 0x4B415337;   // 'KAS7'
   -pub const MAGIC_SIGMASK: u32 = 0x4B414D38;  // 'KAM8'
   -pub const MAGIC_STRUCT: u32 = 0x4B415439;   // 'KAT9'
   -pub const MAGIC_EFFECT: u32 = 0x4B414641;   // 'KAFA'
   -pub const MAGIC_TRANS: u32 = 0x4B415442;    // 'KATB'
   -pub const MAGIC_CAP: u32 = 0x4B414343;      // 'KACC'
   +pub const MAGIC_INFO: u32 = 0x4B414936; // 'KAI6'
   +pub const MAGIC_SIGNAL: u32 = 0x4B415337; // 'KAS7'
   +pub const MAGIC_SIGMASK: u32 = 0x4B414D38; // 'KAM8'
   +pub const MAGIC_STRUCT: u32 = 0x4B415439; // 'KAT9'
   +pub const MAGIC_EFFECT: u32 = 0x4B414641; // 'KAFA'
   +pub const MAGIC_TRANS: u32 = 0x4B415442; // 'KATB'
   +pub const MAGIC_CAP: u32 = 0x4B414343; // 'KACC'
    
    pub struct MagicOffsets {
        pub param_offset: Option<usize>,
   Diff in tools/kapi/src/extractor/vmlinux/magic_finder.rs:57:
                match value {
                    MAGIC_PARAM if offsets.param_offset.is_none() => {
                        offsets.param_offset = Some(base_offset + i);
   -                },
   +                }
                    MAGIC_RETURN if offsets.return_offset.is_none() => {
                        offsets.return_offset = Some(base_offset + i);
   -                },
   +                }
                    MAGIC_ERROR if offsets.error_offset.is_none() => {
                        offsets.error_offset = Some(base_offset + i);
   -                },
   +                }
                    MAGIC_LOCK if offsets.lock_offset.is_none() => {
                        offsets.lock_offset = Some(base_offset + i);
   -                },
   +                }
                    MAGIC_CONSTRAINT if offsets.constraint_offset.is_none() => {
                        offsets.constraint_offset = Some(base_offset + i);
   -                },
   +                }
                    MAGIC_INFO if offsets.info_offset.is_none() => {
                        offsets.info_offset = Some(base_offset + i);
   -                },
   +                }
                    MAGIC_SIGNAL if offsets.signal_offset.is_none() => {
                        offsets.signal_offset = Some(base_offset + i);
   -                },
   +                }
                    MAGIC_SIGMASK if offsets.sigmask_offset.is_none() => {
                        offsets.sigmask_offset = Some(base_offset + i);
   -                },
   +                }
                    MAGIC_STRUCT if offsets.struct_offset.is_none() => {
                        offsets.struct_offset = Some(base_offset + i);
   -                },
   +                }
                    MAGIC_EFFECT if offsets.effect_offset.is_none() => {
                        offsets.effect_offset = Some(base_offset + i);
   -                },
   +                }
                    MAGIC_TRANS if offsets.trans_offset.is_none() => {
                        offsets.trans_offset = Some(base_offset + i);
   -                },
   +                }
                    MAGIC_CAP if offsets.cap_offset.is_none() => {
                        offsets.cap_offset = Some(base_offset + i);
   -                },
   +                }
                    _ => {}
                }
    
   Diff in tools/kapi/src/extractor/vmlinux/magic_finder.rs:100:
            offsets
        }
    }
   +
>> Diff in tools/kapi/src/extractor/vmlinux/mod.rs:1:
    use super::{
        ApiExtractor, ApiSpec, CapabilitySpec, ConstraintSpec, ErrorSpec, LockSpec, ParamSpec,
   -    ReturnSpec, SideEffectSpec, SignalMaskSpec, SignalSpec, StateTransitionSpec, StructSpec,
   -    StructFieldSpec,
   +    ReturnSpec, SideEffectSpec, SignalMaskSpec, SignalSpec, StateTransitionSpec, StructFieldSpec,
   +    StructSpec,
    };
    use crate::formatter::OutputFormatter;
    use anyhow::{Context, Result};
   Diff in tools/kapi/src/extractor/vmlinux/mod.rs:13:
    mod binary_utils;
    mod magic_finder;
    use binary_utils::{
   -    DataReader, addr_family_spec_layout_size, async_spec_layout_size, buffer_spec_layout_size,
   -    protocol_behavior_spec_layout_size, signal_mask_spec_layout_size,
   -    sizes, socket_state_spec_layout_size, struct_field_layout_size,
   +    addr_family_spec_layout_size, async_spec_layout_size, buffer_spec_layout_size,
   +    protocol_behavior_spec_layout_size, signal_mask_spec_layout_size, sizes,
   +    socket_state_spec_layout_size, struct_field_layout_size, DataReader,
    };
    
    // Helper to convert empty strings to None
   Diff in tools/kapi/src/extractor/vmlinux/mod.rs:22:
    fn opt_string(s: String) -> Option<String> {
   -    if s.is_empty() { None } else { Some(s) }
   +    if s.is_empty() {
   +        None
   +    } else {
   +        Some(s)
   +    }
    }
    
    pub struct VmlinuxExtractor {
   Diff in tools/kapi/src/extractor/vmlinux/mod.rs:124:
                    let magic_offset = offset + param_magic_offset;
                    if magic_offset + 4 <= data.len() {
                        let magic_bytes = &data[magic_offset..magic_offset + 4];
   -                    let magic_value = u32::from_le_bytes([magic_bytes[0], magic_bytes[1], magic_bytes[2], magic_bytes[3]]);
   +                    let magic_value = u32::from_le_bytes([
   +                        magic_bytes[0],
   +                        magic_bytes[1],
   +                        magic_bytes[2],
   +                        magic_bytes[3],
   +                    ]);
    
                        if magic_value == magic_finder::MAGIC_PARAM {
                            // Avoid duplicate detection of the same spec
   Diff in tools/kapi/src/extractor/vmlinux/mod.rs:131:
   -                        if last_found_offset.is_none() || offset >= last_found_offset.unwrap() + param_magic_offset {
   +                        if last_found_offset.is_none()
   +                            || offset >= last_found_offset.unwrap() + param_magic_offset
   +                        {
                                let api_type = if name.starts_with("sys_") {
                                    "syscall"
                                } else if name.ends_with("_ioctl") {
   Diff in tools/kapi/src/extractor/vmlinux/mod.rs:160:
        Ok(specs)
    }
    
   -
   -
   -
    fn is_valid_api_name(name: &str) -> bool {
        // Validate API name format and length
        if name.is_empty() || name.len() < 3 || name.len() > 100 {
   Diff in tools/kapi/src/extractor/vmlinux/mod.rs:181:
        }
    
        // Match common kernel API patterns
   -    name.starts_with("sys_") ||
   -    name.starts_with("__") ||
   -    name.ends_with("_ioctl") ||
   -    name.contains("_") ||
   -    name.len() > 6
   +    name.starts_with("sys_")
   +        || name.starts_with("__")
   +        || name.ends_with("_ioctl")
   +        || name.contains("_")
   +        || name.len() > 6
    }
    
    impl ApiExtractor for VmlinuxExtractor {
   Diff in tools/kapi/src/extractor/vmlinux/mod.rs:195:
                .iter()
                .map(|spec| {
                    // Parse the full spec for listing
   -                parse_binary_to_api_spec(&self.kapi_data, spec.offset)
   -                    .unwrap_or_else(|_| ApiSpec {
   -                        name: spec.name.clone(),
   -                        api_type: spec.api_type.clone(),
   -                        description: None,
   -                        long_description: None,
   -                        version: None,
   -                        context_flags: vec![],
   -                        param_count: None,
   -                        error_count: None,
   -                        examples: None,
   -                        notes: None,
   -                        since_version: None,
   -                        subsystem: None,
--
            }
   Diff in tools/kapi/src/extractor/vmlinux/mod.rs:337:
            &mut reader,
            magic_offsets.param_offset,
            sizes::MAX_PARAMS as u32,
   -        |r| parse_param(r, 0),  // Index doesn't seem to be used in parse_param
   +        |r| parse_param(r, 0), // Index doesn't seem to be used in parse_param
        );
    
        // Read return_spec
   Diff in tools/kapi/src/extractor/vmlinux/mod.rs:370:
        // Read examples and notes - position reader at info section if magic found
        let (examples, notes) = if let Some(info_offset) = magic_offsets.info_offset {
            reader.pos = info_offset + 4; // +4 to skip magic
   -        let examples = reader.read_cstring(sizes::DESC * 2).filter(|s| !s.is_empty());
   -        let notes = reader.read_cstring(sizes::DESC * 2).filter(|s| !s.is_empty());
   +        let examples = reader
   +            .read_cstring(sizes::DESC * 2)
   +            .filter(|s| !s.is_empty());
   +        let notes = reader
   +            .read_cstring(sizes::DESC * 2)
   +            .filter(|s| !s.is_empty());
            (examples, notes)
        } else {
   -        let examples = reader.read_cstring(sizes::DESC * 2).filter(|s| !s.is_empty());
   -        let notes = reader.read_cstring(sizes::DESC * 2).filter(|s| !s.is_empty());
   +        let examples = reader
   +            .read_cstring(sizes::DESC * 2)
   +            .filter(|s| !s.is_empty());
   +        let notes = reader
   +            .read_cstring(sizes::DESC * 2)
   +            .filter(|s| !s.is_empty());
            (examples, notes)
        };
    
   Diff in tools/kapi/src/extractor/vmlinux/mod.rs:460:
            addr_family_spec_layout_size() * sizes::MAX_ADDR_FAMILIES +
            4 + // addr_family_count
            6 + 2 + // 6 bool flags + padding
   -        sizes::DESC * 3 // 3 semantic descriptions
   +        sizes::DESC * 3, // 3 semantic descriptions
        );
    
        Ok(ApiSpec {
   Diff in tools/kapi/src/extractor/vmlinux/mod.rs:470:
            long_description,
            version,
            context_flags,
   -        param_count: if parameters.is_empty() { None } else { Some(parameters.len() as u32) },
   -        error_count: if errors.is_empty() { None } else { Some(errors.len() as u32) },
   +        param_count: if parameters.is_empty() {
   +            None
   +        } else {
   +            Some(parameters.len() as u32)
   +        },
   +        error_count: if errors.is_empty() {
   +            None
   +        } else {
   +            Some(errors.len() as u32)
   +        },
            examples,
            notes,
            since_version,
   Diff in tools/kapi/src/extractor/vmlinux/mod.rs:603:
        // Skip error_values pointer (8 bytes)
        reader.skip(8);
        let _error_count = reader.read_u32().unwrap_or(0); // Don't fail on return spec
   -    // Skip is_success function pointer (8 bytes)
   +                                                       // Skip is_success function pointer (8 bytes)
        reader.skip(8);
    
        let description = reader.read_string_or_default(sizes::DESC);
   Diff in tools/kapi/src/extractor/vmlinux/mod.rs:684:
        let _transform_to = reader.read_i32()?; // transform_to
        let timing_bytes = reader.read_bytes(32)?; // timing[32]
        let timing = if let Some(end) = timing_bytes.iter().position(|&b| b == 0) {
   -        String::from_utf8_lossy(&timing_bytes[..end]).parse().unwrap_or(0)
   +        String::from_utf8_lossy(&timing_bytes[..end])
   +            .parse()
   +            .unwrap_or(0)
        } else {
            0
        };
   Diff in tools/kapi/src/extractor/vmlinux/mod.rs:727:
    
        let _signal_count = reader.read_u32()?;
    
   -    Some(SignalMaskSpec {
   -        name,
   -        description,
   -    })
   +    Some(SignalMaskSpec { name, description })
    }
    
    fn parse_struct_field(reader: &mut DataReader) -> Option<StructFieldSpec> {
   Diff in tools/kapi/src/extractor/vmlinux/mod.rs:862:
            alternatives,
        })
    }
   +
>> Diff in tools/kapi/src/extractor/vmlinux/magic_finder.rs:1:
    // Magic markers for each section
   -pub const MAGIC_PARAM: u32 = 0x4B415031;    // 'KAP1'
   -pub const MAGIC_RETURN: u32 = 0x4B415232;   // 'KAR2'
   -pub const MAGIC_ERROR: u32 = 0x4B414533;    // 'KAE3'
   -pub const MAGIC_LOCK: u32 = 0x4B414C34;     // 'KAL4'
   +pub const MAGIC_PARAM: u32 = 0x4B415031; // 'KAP1'
   +pub const MAGIC_RETURN: u32 = 0x4B415232; // 'KAR2'
   +pub const MAGIC_ERROR: u32 = 0x4B414533; // 'KAE3'
   +pub const MAGIC_LOCK: u32 = 0x4B414C34; // 'KAL4'
    pub const MAGIC_CONSTRAINT: u32 = 0x4B414335; // 'KAC5'
   -pub const MAGIC_INFO: u32 = 0x4B414936;     // 'KAI6'
   -pub const MAGIC_SIGNAL: u32 = 0x4B415337;   // 'KAS7'
   -pub const MAGIC_SIGMASK: u32 = 0x4B414D38;  // 'KAM8'
   -pub const MAGIC_STRUCT: u32 = 0x4B415439;   // 'KAT9'
   -pub const MAGIC_EFFECT: u32 = 0x4B414641;   // 'KAFA'
   -pub const MAGIC_TRANS: u32 = 0x4B415442;    // 'KATB'
   -pub const MAGIC_CAP: u32 = 0x4B414343;      // 'KACC'
   +pub const MAGIC_INFO: u32 = 0x4B414936; // 'KAI6'
   +pub const MAGIC_SIGNAL: u32 = 0x4B415337; // 'KAS7'
   +pub const MAGIC_SIGMASK: u32 = 0x4B414D38; // 'KAM8'
   +pub const MAGIC_STRUCT: u32 = 0x4B415439; // 'KAT9'
   +pub const MAGIC_EFFECT: u32 = 0x4B414641; // 'KAFA'
   +pub const MAGIC_TRANS: u32 = 0x4B415442; // 'KATB'
   +pub const MAGIC_CAP: u32 = 0x4B414343; // 'KACC'
    
    pub struct MagicOffsets {
        pub param_offset: Option<usize>,
   Diff in tools/kapi/src/extractor/vmlinux/magic_finder.rs:57:
                match value {
                    MAGIC_PARAM if offsets.param_offset.is_none() => {
                        offsets.param_offset = Some(base_offset + i);
   -                },
   +                }
                    MAGIC_RETURN if offsets.return_offset.is_none() => {
                        offsets.return_offset = Some(base_offset + i);
   -                },
   +                }
                    MAGIC_ERROR if offsets.error_offset.is_none() => {
                        offsets.error_offset = Some(base_offset + i);
   -                },
   +                }
                    MAGIC_LOCK if offsets.lock_offset.is_none() => {
                        offsets.lock_offset = Some(base_offset + i);
   -                },
   +                }
                    MAGIC_CONSTRAINT if offsets.constraint_offset.is_none() => {
                        offsets.constraint_offset = Some(base_offset + i);
   -                },
   +                }
                    MAGIC_INFO if offsets.info_offset.is_none() => {
                        offsets.info_offset = Some(base_offset + i);
   -                },
   +                }
                    MAGIC_SIGNAL if offsets.signal_offset.is_none() => {
                        offsets.signal_offset = Some(base_offset + i);
   -                },
   +                }
                    MAGIC_SIGMASK if offsets.sigmask_offset.is_none() => {
                        offsets.sigmask_offset = Some(base_offset + i);
   -                },
   +                }
                    MAGIC_STRUCT if offsets.struct_offset.is_none() => {
                        offsets.struct_offset = Some(base_offset + i);
   -                },
   +                }
                    MAGIC_EFFECT if offsets.effect_offset.is_none() => {
                        offsets.effect_offset = Some(base_offset + i);
   -                },
   +                }
                    MAGIC_TRANS if offsets.trans_offset.is_none() => {
                        offsets.trans_offset = Some(base_offset + i);
   -                },
   +                }
                    MAGIC_CAP if offsets.cap_offset.is_none() => {
                        offsets.cap_offset = Some(base_offset + i);
   -                },
   +                }
                    _ => {}
                }
    
   Diff in tools/kapi/src/extractor/vmlinux/magic_finder.rs:100:
            offsets
        }
    }
   +
>> Diff in tools/kapi/src/extractor/debugfs.rs:1:
    use crate::formatter::OutputFormatter;
   -use anyhow::{Context, Result, bail};
   +use anyhow::{bail, Context, Result};
    use serde::Deserialize;
    use std::fs;
    use std::io::Write;
   Diff in tools/kapi/src/extractor/debugfs.rs:6:
    use std::path::PathBuf;
    
   -use super::{ApiExtractor, ApiSpec, CapabilitySpec, display_api_spec};
   +use super::{display_api_spec, ApiExtractor, ApiSpec, CapabilitySpec};
    
    #[derive(Deserialize)]
    struct KernelApiJson {
>> Diff in tools/kapi/src/extractor/kerneldoc_parser.rs:1:
    use super::{
   -    ApiSpec, CapabilitySpec, ConstraintSpec, ErrorSpec, LockSpec, ParamSpec,
   -    ReturnSpec, SideEffectSpec, SignalSpec, StateTransitionSpec, StructSpec,
   -    StructFieldSpec,
   +    ApiSpec, CapabilitySpec, ConstraintSpec, ErrorSpec, LockSpec, ParamSpec, ReturnSpec,
   +    SideEffectSpec, SignalSpec, StateTransitionSpec, StructFieldSpec, StructSpec,
    };
    use anyhow::Result;
    use std::collections::HashMap;
   Diff in tools/kapi/src/extractor/kerneldoc_parser.rs:89:
                        let desc = desc.trim();
                        if !param_name.contains('-') {
                            // This is a basic parameter description - add to map
   -                        param_map.insert(param_name.to_string(), ParamSpec {
   -                            index: param_map.len() as u32,
   -                            name: param_name.to_string(),
   -                            type_name: String::new(),
   -                            description: desc.to_string(),
   -                            flags: 0,
   -                            param_type: 0,
   -                            constraint_type: 0,
   -                            constraint: None,
   -                            min_value: None,
   -                            max_value: None,
   -                            valid_mask: None,
   -                            enum_values: vec![],
   -                            size: None,
   -                            alignment: None,
   -                        });
   +                        param_map.insert(
   +                            param_name.to_string(),
   +                            ParamSpec {
   +                                index: param_map.len() as u32,
   +                                name: param_name.to_string(),
   +                                type_name: String::new(),
   +                                description: desc.to_string(),
   +                                flags: 0,
   +                                param_type: 0,
   +                                constraint_type: 0,
   +                                constraint: None,
   +                                min_value: None,
   +                                max_value: None,
   +                                valid_mask: None,
   +                                enum_values: vec![],
   +                                size: None,
   +                                alignment: None,
   +                            },
   +                        );
                        }
                    }
                }
   Diff in tools/kapi/src/extractor/kerneldoc_parser.rs:240:
                            _ => super::KAPI_LOCK_INTERNAL,
                        };
                    }
   -            }
   -            else if let Some(rest) = line.strip_prefix("lock-desc:") {
   +            } else if let Some(rest) = line.strip_prefix("lock-desc:") {
                    if let Some(lock) = current_lock.as_mut() {
                        lock.description = self.collect_multiline_value(&lines, i, rest);
                    }
   Diff in tools/kapi/src/extractor/kerneldoc_parser.rs:280:
                    if let Some(signal) = current_signal.as_mut() {
                        signal.direction = self.parse_signal_direction(rest.trim());
                    }
   -            }
   -            else if let Some(rest) = line.strip_prefix("signal-action:") {
   +            } else if let Some(rest) = line.strip_prefix("signal-action:") {
                    if let Some(signal) = current_signal.as_mut() {
                        signal.action = self.parse_signal_action(rest.trim());
                    }
   Diff in tools/kapi/src/extractor/kerneldoc_parser.rs:288:
   -            }
   -            else if let Some(rest) = line.strip_prefix("signal-condition:") {
   +            } else if let Some(rest) = line.strip_prefix("signal-condition:") {
                    if let Some(signal) = current_signal.as_mut() {
                        signal.condition = Some(self.collect_multiline_value(&lines, i, rest));
                    }
   Diff in tools/kapi/src/extractor/kerneldoc_parser.rs:293:
   -            }
   -            else if let Some(rest) = line.strip_prefix("signal-desc:") {
   +            } else if let Some(rest) = line.strip_prefix("signal-desc:") {
                    if let Some(signal) = current_signal.as_mut() {
                        signal.description = Some(self.collect_multiline_value(&lines, i, rest));
                    }
   Diff in tools/kapi/src/extractor/kerneldoc_parser.rs:298:
   -            }
   -            else if let Some(rest) = line.strip_prefix("signal-timing:") {
   +            } else if let Some(rest) = line.strip_prefix("signal-timing:") {
                    if let Some(signal) = current_signal.as_mut() {
                        signal.timing = self.parse_signal_timing(rest.trim());
                    }
   Diff in tools/kapi/src/extractor/kerneldoc_parser.rs:303:
   -            }
   -            else if let Some(rest) = line.strip_prefix("signal-priority:") {
   +            } else if let Some(rest) = line.strip_prefix("signal-priority:") {
                    if let Some(signal) = current_signal.as_mut() {
                        signal.priority = rest.trim().parse().unwrap_or(0);
                    }
   Diff in tools/kapi/src/extractor/kerneldoc_parser.rs:308:
..

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
