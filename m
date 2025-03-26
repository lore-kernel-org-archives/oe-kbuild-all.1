Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B53F1A0B08
	for <oe-kbuild-all@lists.linux.dev>; Wed, 26 Mar 2025 11:33:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742988831; cv=none; b=dtYjTcUgMlZxTV1HHYsPb5LjFUULuPyhx/j3dUE1iu1M9i9bubdGOTKU5fCCjJNw75Q4gkZDWMQDfz8PdPmpiWlpzKSRkHl5cHd09BJ1+JSkREWWLyn3Mq7UucvCLaBwiah6HTo9T6J5tytqdQ1g/MDE5qnQRptF6jEntDzXFx0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742988831; c=relaxed/simple;
	bh=WlhhfJoU1aFv9kbMHowiUbLOf+Kq+yDT1ocEHF+cHRk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=LNFoco1sryskP8cHlRl5NYDXiF0t7MGHg+mElSD1FgBKbXYyqd/JBTS0Vm+GfXPtUc8hc7FHD8xXJQX+RRekFTjmw6qYXLAunju3pZ68F3wxBFMQSuOyoslk41bEQfcU7GmEWxOC5oOPU5yA7rrRccYLkdHUc+usikJx9IvS6vw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JO+AG1vy; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JO+AG1vy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1742988829; x=1774524829;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=WlhhfJoU1aFv9kbMHowiUbLOf+Kq+yDT1ocEHF+cHRk=;
  b=JO+AG1vybQwpqYjStddp9cUk1zqDB4k2flDBF3ZkRkOrLq5GUwH2aATD
   Jt8Cmn7d+wupQ8ZLVX4z3pUlSCU9lieyj1KnvPfzLrCk1qvoX3Y/ml5IZ
   aHcaRnywdaa1tjRq3xpJB0P0QpBoTpLlf08ZJEKl3q2omy4sf1Kkqs0bW
   CTfkL7Pr8YpdPkE/jYmGNcNrvAEnvVYk6pttXsk1WSQxMwS6pnDVPLKzm
   R3jeqIj2eAbENOyYQcO5MhiXyDY3FfM3B7yOP9DHRT4Cg4l6XsoIW1aXS
   z3sBKR1YXk9F6wu2MpbsYs7bONtTz1xAFzMDCIWDGIS05Qg7L9fmwq6L2
   A==;
X-CSE-ConnectionGUID: Fi11Z0hVSrqLmK35VN5d0A==
X-CSE-MsgGUID: aqlssYSeTNa0m0PwHwvUgw==
X-IronPort-AV: E=McAfee;i="6700,10204,11384"; a="55638668"
X-IronPort-AV: E=Sophos;i="6.14,277,1736841600"; 
   d="scan'208";a="55638668"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Mar 2025 04:33:49 -0700
X-CSE-ConnectionGUID: J0/w6vZrT8KWX3JwDMwnBg==
X-CSE-MsgGUID: bR/B+4pVQouSvKLPt1YY7g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,277,1736841600"; 
   d="scan'208";a="124911633"
Received: from lkp-server02.sh.intel.com (HELO e98e3655d6d2) ([10.239.97.151])
  by fmviesa008.fm.intel.com with ESMTP; 26 Mar 2025 04:33:47 -0700
Received: from kbuild by e98e3655d6d2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1txP0z-0005gV-2l;
	Wed, 26 Mar 2025 11:33:45 +0000
Date: Wed, 26 Mar 2025 19:33:42 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6-2024-07 0/1] Diff in
 scripts/generate_rust_target.rs at line 26:
Message-ID: <202503261945.eyAsinBo-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android15-6.6-2024-07
head:   326500972cfcd2870516e5e028a06d7836d1e016
commit: 2b93c38eced50c83ce24a8f0e4ba66ed5275d5a8 [0/1] ANDROID: rust: Support arrays in target JSON
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20250326/202503261945.eyAsinBo-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
rustc: rustc 1.73.0 (cc66ad468 2023-10-03)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250326/202503261945.eyAsinBo-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503261945.eyAsinBo-lkp@intel.com/

All errors (new ones prefixed by >>):

   PATH=/opt/cross/clang-18/bin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
   INFO PATH=/opt/cross/rustc-1.73.0-bindgen-0.65.1/cargo/bin:/opt/cross/clang-18/bin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
   /usr/bin/timeout -k 100 12h /usr/bin/make KCFLAGS= -Wno-error=return-type -Wreturn-type -funsigned-char -Wundef W=1 --keep-going LLVM=1 -j32 -C source O=/kbuild/obj/consumer/x86_64-rhel-9.4-rust ARCH=x86_64 SHELL=/bin/bash rustfmtcheck
   make: Entering directory '/kbuild/src/consumer'
   make[1]: Entering directory '/kbuild/obj/consumer/x86_64-rhel-9.4-rust'
>> Diff in scripts/generate_rust_target.rs at line 26:
    
    type Object = Vec<(String, Value)>;
    
   -fn comma_sep<T>(seq: &[T], formatter: &mut Formatter<'_>, f: impl Fn(&mut Formatter<'_>, &T) -> Result) -> Result {
   +fn comma_sep<T>(
   +    seq: &[T],
   +    formatter: &mut Formatter<'_>,
   +    f: impl Fn(&mut Formatter<'_>, &T) -> Result,
   +) -> Result {
        if let [ref rest @ .., ref last] = seq[..] {
            for v in rest {
                f(formatter, v)?;
   Diff in scripts/generate_rust_target.rs at line 52:
                }
                Value::Object(object) => {
                    formatter.write_str("{")?;
   -                comma_sep(&object[..], formatter, |formatter, v|
   -                          write!(formatter, "\"{}\": {}", v.0, v.1))?;
   +                comma_sep(&object[..], formatter, |formatter, v| {
   +                    write!(formatter, "\"{}\": {}", v.0, v.1)
   +                })?;
                    formatter.write_str("}")
                }
            }
   Diff in scripts/generate_rust_target.rs at line 90:
        }
    }
    
   -impl <T: Into<Value>, const N: usize> From<[T; N]> for Value {
   +impl<T: Into<Value>, const N: usize> From<[T; N]> for Value {
        fn from(i: [T; N]) -> Self {
            Self::Array(i.into_iter().map(|v| v.into()).collect())
        }
   make[2]: *** [Makefile:1766: rustfmt] Error 123
   make[2]: Target 'rustfmtcheck' not remade because of errors.
   make[1]: Leaving directory '/kbuild/obj/consumer/x86_64-rhel-9.4-rust'
   make[1]: *** [Makefile:252: __sub-make] Error 2
   make[1]: Target 'rustfmtcheck' not remade because of errors.
   make: *** [Makefile:252: __sub-make] Error 2
   make: Target 'rustfmtcheck' not remade because of errors.
   make: Leaving directory '/kbuild/src/consumer'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
