Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 742F13DDAF2
	for <oe-kbuild-all@lists.linux.dev>; Thu,  6 Aug 2026 09:54:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786010087; cv=none; b=tK6r5YVNgmKtok0PzPB7d9rJPXjVHZ5qsh/qvrMeh1izjZMqp5HUfthKmMhSxZrkRc+QcRL+VxsAj8w6yeoOrrRun4DWzLdDB94Kd6d5VF2Alchkt9MdkcN0FXCa9MAC1dFloxTIHQfsL8CsVA41I9MlgfxX7/rCchbUTfc9sQ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786010087; c=relaxed/simple;
	bh=FwssaE0FLi+dA6cGHH8eNO6t/5udnVCaFyf0UtiEzeI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=DfoHtvW4zHu69W4+busCSpNz12mvC3Bg+Qa5cGAxQ51ZIr1zFrvrABJFB2jb7+C46y+ZoVSDmtxeYE/vOV3ZuNMimyWkB4ri8zr70HVU8YVXYdPuGpmc1c+n8xZUajNBb/yG3iJ54DU3FL5BQKz7XdTmPVCJmJj40ZzhXUQZo5k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KXh5b2y8; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KXh5b2y8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786010086; x=1817546086;
  h=date:from:to:cc:subject:message-id;
  bh=FwssaE0FLi+dA6cGHH8eNO6t/5udnVCaFyf0UtiEzeI=;
  b=KXh5b2y8BADa9u1KJh0KZYdM2lp2rUCvSs9yCGbxgs0xSRn54LVQedx3
   /T4dewbOJNlymfuCigRcENTuGfmH6mzRHbnLDjS68NMf7DP+sXW0knjWk
   oOYz0k5MNgZA+0nY1IGnVTlGc3lr28pXuA39+VlBoDrtAnos+OL71lWS9
   JKLlAYTb6tLHvTRXnwwTTKUXMpJB164tYjiQSgwcuxV9oVYX+qsxN3J0x
   aCx+5Dmox9V7U1YGJwcvSzMQeoN7kYnSP9WmelNS1kMbRVR41eQVCD4SP
   /cZBsVOYTTULuzsi/TgWGEAA6mOeQcFheTSDY15Ieh0F0cBz6OyvKsQia
   Q==;
X-CSE-ConnectionGUID: bf87ebI5Q2yLp6ogzRk/kA==
X-CSE-MsgGUID: dEe8eXQmRNqIZEBD90Jb7Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11866"; a="74134167"
X-IronPort-AV: E=Sophos;i="6.25,208,1779174000"; 
   d="scan'208";a="74134167"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Aug 2026 02:54:45 -0700
X-CSE-ConnectionGUID: 7kqv0op9TZCUh4iLuiQJXQ==
X-CSE-MsgGUID: bigULc+LSYe9/B/Qe699UA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,208,1779174000"; 
   d="scan'208";a="258736284"
Received: from igk-lkp-server01.igk.intel.com (HELO 3cba2a188a06) ([10.211.93.152])
  by fmviesa007.fm.intel.com with ESMTP; 06 Aug 2026 02:54:43 -0700
Received: from kbuild by 3cba2a188a06 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wruoD-000000004bu-0c4c;
	Thu, 06 Aug 2026 09:54:41 +0000
Date: Thu, 06 Aug 2026 11:54:04 +0200
From: kernel test robot <lkp@intel.com>
To: Sasha Finkelstein <k@chaosmail.tech>
Cc: oe-kbuild-all@lists.linux.dev, Janne Grunau <j@jannau.net>
Subject: [asahilinux:bits/250-aop 57/57] Diff in
 sound/soc/apple/aop_audio.rs:559:
Message-ID: <202608061156.7nQ5o903-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/AsahiLinux/linux bits/250-aop
head:   136397c31608440bafd64cf7ce72b6049b3ee4a6
commit: 136397c31608440bafd64cf7ce72b6049b3ee4a6 [57/57] ASoC: apple: aop: Add M3 generation built-in mics
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20260806/202608061156.7nQ5o903-lkp@intel.com/config)
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
rustc: rustc 1.96.0 (ac68faa20 2026-05-25)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260806/202608061156.7nQ5o903-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608061156.7nQ5o903-lkp@intel.com/

All errors (new ones prefixed by >>):

   PATH=/opt/cross/clang-22/bin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
   INFO PATH=/opt/cross/rustc-1.96.0-bindgen-0.72.1/cargo/bin:/opt/cross/clang-22/bin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
   /usr/bin/timeout -k 100 12h /usr/bin/make KCFLAGS=\ -fno-crash-diagnostics\ -Wno-error=return-type\ -Wreturn-type\ -funsigned-char\ -Wundef\ -falign-functions=64 W=1 --keep-going LLVM=1 -j384 -C source O=/kbuild/obj/consumer/x86_64-rhel-9.4-rust ARCH=x86_64 SHELL=/bin/bash rustfmtcheck 
   make: Entering directory '/kbuild/src'
   make[1]: Entering directory '/kbuild/obj/consumer/x86_64-rhel-9.4-rust'
>> Diff in sound/soc/apple/aop_audio.rs:559:
                mic_settle_time_valid: U32(1),
                mic_settle_time_ms: U32(50),
                ..Zeroable::init_zeroed()
   -        }).chain(|raw| {
   +        })
   +        .chain(|raw| {
                if !self.hwdata.hf_decimator {
                    self.build_decimator_config(&mut raw.decim);
                }
   Diff in sound/soc/apple/aop_audio.rs:604:
                filter_lengths: FILTER_LENGTHS_HF,
                coeff_bulk: DECIM_NUM_COEFFS_HF as u32,
                ..Zeroable::init_zeroed()
   -        }).chain(|raw| {
   +        })
   +        .chain(|raw| {
                raw.coeffs[..COEFFICIENTS_HF.len()].copy_from_slice(&COEFFICIENTS_HF);
                Ok(())
            });
   Diff in sound/soc/apple/aop_audio.rs:955:
        <SndSocAopDriver as platform::Driver>::IdInfo,
        [
            (of::DeviceId::new(c_str!("apple,aop-audio")), &HW_CFG_T8013),
   -        (of::DeviceId::new(c_str!("apple,t6030-aop-audio")), &HW_CFG_T6030),
   +        (
   +            of::DeviceId::new(c_str!("apple,t6030-aop-audio")),
   +            &HW_CFG_T6030
   +        ),
        ]
    );
    
   Diff in sound/soc/apple/aop_audio.rs:966:
    
        fn probe(
            pdev: &platform::Device<Core>,
   -        info: Option<&Self::IdInfo>
   +        info: Option<&Self::IdInfo>,
        ) -> impl PinInit<Self, Error> {
            let info = info.ok_or(ENODEV)?;
            let dev = ARef::<device::Device>::from(pdev.as_ref());
   make[2]: *** [Makefile:1955: rustfmt] Error 123
   make[2]: Target 'rustfmtcheck' not remade because of errors.
   make[1]: Leaving directory '/kbuild/obj/consumer/x86_64-rhel-9.4-rust'
   make[1]: *** [Makefile:248: __sub-make] Error 2
   make: *** [Makefile:248: __sub-make] Error 2
   make[1]: Target 'rustfmtcheck' not remade because of errors.
   make: Target 'rustfmtcheck' not remade because of errors.
   make: Leaving directory '/kbuild/src'

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
