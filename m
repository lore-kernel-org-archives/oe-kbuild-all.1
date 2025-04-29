Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E17F22D193B
	for <oe-kbuild-all@lists.linux.dev>; Tue, 29 Apr 2025 14:13:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745935997; cv=none; b=u4SOJvhGqMOn9KuHxxVlMI9L258Qb6jE4PlXznjYrhR+zrmq/syzNT0xTEs2Kc4SBuOtrQuYmaOpkXDHq7IKcS9INxHTX91gcCsQhmsObm2pzYB/HJmsAbCALSaAjHsVwkBg+OWPRl3gxJrl593rGqX3xHFnPWyJKEnsqnvi900=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745935997; c=relaxed/simple;
	bh=AkgpgKV7X9POGuJk6xqHjMbCCftfpKC/vgggx3BD5Mw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Hbz97lwccnGe4T40ELwnm4DjNcRfIu+SR9kZd4vgPY44XtI9hQZ6H8hjwfSo85RI4SY6/5PYj4ERxgpydTx3lSUlWpnh1mcVPOipj0BxoX3xlEhZDoJqxf4wyFKnIHjKaFNKM57iyAaTu++3bxgxptKV8uOl2VQuy/FQBRVzyAc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Yy7wIxnQ; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Yy7wIxnQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745935996; x=1777471996;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=AkgpgKV7X9POGuJk6xqHjMbCCftfpKC/vgggx3BD5Mw=;
  b=Yy7wIxnQfjtaZt/Oo3pZ3RO43tTOfmPfki1xJHqBJ//R/tRGhty6hApD
   LtfFqCllEqJyyEuVHfH6zBeBcaiusd5StI8yFrz6/eakyvS8E56+3mKGr
   lYtnYOfLHmoWlfnvgPYeT/dyZrMnZkiVGsj37Uf6/6EDKZKKAbTpF1vv3
   dSE4ekPLlxkoUq5MLoqS6Zz+BAN4rJIAk9uIACyVqHmaDwckZnO4SZHlx
   Fi6Jdt4qbKU1wETTazJ46/7L9Cy9hUzBGM9QFKTkCDUA91wyiv+vlMQx+
   XlwZSpCbeu3Pfa1lSOiGCGAEqNggUAML8N5/BPA+1E5FugOK0Pl027bf2
   A==;
X-CSE-ConnectionGUID: pr5ViWOsTlGnBEIUODL2kA==
X-CSE-MsgGUID: 8K7Yeau8TDqjb5q0aXNSdg==
X-IronPort-AV: E=McAfee;i="6700,10204,11418"; a="47654136"
X-IronPort-AV: E=Sophos;i="6.15,249,1739865600"; 
   d="scan'208";a="47654136"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Apr 2025 07:12:57 -0700
X-CSE-ConnectionGUID: 1OdWna+7TOGxMlAOVynxOg==
X-CSE-MsgGUID: kZiuGYb+ShS3ta17vh1NBw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,249,1739865600"; 
   d="scan'208";a="137869490"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 29 Apr 2025 07:12:55 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u9lhc-0000lN-2X;
	Tue, 29 Apr 2025 14:12:52 +0000
Date: Tue, 29 Apr 2025 22:12:47 +0800
From: kernel test robot <lkp@intel.com>
To: Andreas Hindborg <a.hindborg@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [linux-next:master 7097/7105] Diff in rust/kernel/auxiliary.rs at
 line 74:
Message-ID: <202504292246.6rkRXOWd-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   9d9096722447b77662d4237a09909bde7774f22e
commit: 4011c642639869dd11f1b59ddbb2351b89ed0b1e [7097/7105] Merge branch 'xarray-next' of https://github.com/Rust-for-Linux/linux.git
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20250429/202504292246.6rkRXOWd-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
rustc: rustc 1.78.0 (9b00956e5 2024-04-29)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250429/202504292246.6rkRXOWd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504292246.6rkRXOWd-lkp@intel.com/

All errors (new ones prefixed by >>):

   PATH=/opt/cross/clang-18/bin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
   INFO PATH=/opt/cross/rustc-1.78.0-bindgen-0.65.1/cargo/bin:/opt/cross/clang-18/bin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
   /usr/bin/timeout -k 100 12h /usr/bin/make KCFLAGS= -Wno-error=return-type -Wreturn-type -funsigned-char -Wundef W=1 --keep-going LLVM=1 -j32 -C source O=/kbuild/obj/consumer/x86_64-rhel-9.4-rust ARCH=x86_64 SHELL=/bin/bash rustfmtcheck
   make: Entering directory '/kbuild/src/consumer'
   make[1]: Entering directory '/kbuild/obj/consumer/x86_64-rhel-9.4-rust'
>> Diff in rust/kernel/auxiliary.rs at line 74:
                    // SAFETY: By the type invariant `adev.as_raw` returns a valid pointer to a
                    // `struct auxiliary_device`.
                    unsafe {
   -		    bindings::auxiliary_set_drvdata(adev.as_raw(), data.into_foreign().cast())
   -		};
   +                    bindings::auxiliary_set_drvdata(adev.as_raw(), data.into_foreign().cast())
   +                };
                }
                Err(err) => return Error::to_errno(err),
            }
>> Diff in rust/kernel/auxiliary.rs at line 74:
                    // SAFETY: By the type invariant `adev.as_raw` returns a valid pointer to a
                    // `struct auxiliary_device`.
                    unsafe {
   -		    bindings::auxiliary_set_drvdata(adev.as_raw(), data.into_foreign().cast())
   -		};
   +                    bindings::auxiliary_set_drvdata(adev.as_raw(), data.into_foreign().cast())
   +                };
                }
                Err(err) => return Error::to_errno(err),
            }
   make[2]: *** [Makefile:1838: rustfmt] Error 123
   make[2]: Target 'rustfmtcheck' not remade because of errors.
   make[1]: Leaving directory '/kbuild/obj/consumer/x86_64-rhel-9.4-rust'
   make: *** [Makefile:248: __sub-make] Error 2
   make: Target 'rustfmtcheck' not remade because of errors.
   make[1]: *** [Makefile:248: __sub-make] Error 2
   make[1]: Target 'rustfmtcheck' not remade because of errors.
   make: Leaving directory '/kbuild/src/consumer'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
