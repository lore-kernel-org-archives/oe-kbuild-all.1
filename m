Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABA263B52E2
	for <oe-kbuild-all@lists.linux.dev>; Mon, 27 Jul 2026 16:02:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785168135; cv=none; b=m7s+MdgWmUrDLLdg1RBV1zi71yZO0VUyfv+fjlGaWnmVKrqG4NfZ3ISwdqip0djpg7O/+ocSO2Ka757NwrKNIPRjuX7xg7xQT0ApcD8N8g8vGnJ86GRUUWHPN2xYpRrgvbQ2Ltl/0FMmNCO7WbjIZwc+rxHMLmqvDgNKHC4OgOo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785168135; c=relaxed/simple;
	bh=rrtwK1FYZ9XsqNWuizcpofPb2E/66bRA7W1rYhrIjbg=;
	h=Date:From:Cc:Subject:Message-ID; b=Fa4AN9naSBzlo2K/JH8Ei1Gew3Kta44UxMm0icK6mO/d5aLILjWeWrzWRT4tlsoUWI9/pb44vzumb+cVd/jNZLGlil3BiRs7xEsMAfk1Qij4bhlPwT9Mshffd9NK5lCxJwzkybR1nfoHJs8bK9SGQ8uP4eJUhgCDqbDuJjwz4ho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TaTCj0kF; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TaTCj0kF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785168132; x=1816704132;
  h=date:from:cc:subject:message-id;
  bh=rrtwK1FYZ9XsqNWuizcpofPb2E/66bRA7W1rYhrIjbg=;
  b=TaTCj0kFQQu60tCeZJWBLYELvxylc2ha/A6UlJ/ibtOIiQv6hIMfT+qd
   pe8XcYNtWHybpspcWG8kE1/AujjDw6IpaYxiH4CA2JBMo/zJv3gU8w4p0
   fGgch+bO64HvXKW7uTmizAyVE6jgmLYCWBXLAMy3CEqNMqqirgJyPTWxl
   38wKCbrz80nL1UpVEfr1i0djoU42PY2ssNhqF2n5e/D+ueA2K7W6Vt/q/
   ulY3cM36IFaSqCrD55dN8cLc2ADdP7k0oP0LklEB1M2MBBDLmyKdEbslG
   g4gH1BpvQRkEw5gKolxt0LTtUdnzPZ7wOXGu8y4mLNdvLsS1BX0dFEZe8
   Q==;
X-CSE-ConnectionGUID: 0NGGNEP5RTSq0w4mHjWN2w==
X-CSE-MsgGUID: MyXAlqlUR76c4w81JN3/9Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11858"; a="97251340"
X-IronPort-AV: E=Sophos;i="6.25,188,1779174000"; 
   d="scan'208";a="97251340"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jul 2026 09:02:02 -0700
X-CSE-ConnectionGUID: 49o2b8O8RISakRnVGWD8hQ==
X-CSE-MsgGUID: 3GdUqhcTTk+LqEvXzW66mQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,188,1779174000"; 
   d="scan'208";a="258168471"
Received: from igk-lkp-server01.igk.intel.com (HELO 3cba2a188a06) ([10.211.93.152])
  by orviesa010.jf.intel.com with ESMTP; 27 Jul 2026 09:02:01 -0700
Received: from kbuild by 3cba2a188a06 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1woNmA-000000001fm-39Z6;
	Mon, 27 Jul 2026 16:01:58 +0000
Date: Mon, 27 Jul 2026 18:01:47 +0200
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev,
 "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Subject: [char-misc:char-misc-testing 1/1] Diff in
 drivers/android/binder/thread.rs:1296:
Message-ID: <202607271720.zYTH7DRy-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/char-misc.git char-misc-testing
head:   0957fbab972a9499626ac457fd924b24491c6315
commit: 0957fbab972a9499626ac457fd924b24491c6315 [1/1] Merge 7.2-rc5 into char-misc-next
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20260727/202607271720.zYTH7DRy-lkp@intel.com/config)
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
rustc: rustc 1.96.0 (ac68faa20 2026-05-25)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260727/202607271720.zYTH7DRy-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607271720.zYTH7DRy-lkp@intel.com/

All errors (new ones prefixed by >>):

   PATH=/opt/cross/clang-22/bin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
   INFO PATH=/opt/cross/rustc-1.96.0-bindgen-0.72.1/cargo/bin:/opt/cross/clang-22/bin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
   /usr/bin/timeout -k 100 12h /usr/bin/make KCFLAGS=\ -fno-crash-diagnostics\ -Wno-error=return-type\ -Wreturn-type\ -funsigned-char\ -Wundef\ -falign-functions=64 W=1 --keep-going LLVM=1 -j384 -C source O=/kbuild/obj/consumer/x86_64-rhel-9.4-rust ARCH=x86_64 SHELL=/bin/bash rustfmtcheck 
   make: Entering directory '/kbuild/src'
   make[1]: Entering directory '/kbuild/obj/consumer/x86_64-rhel-9.4-rust'
>> Diff in drivers/android/binder/thread.rs:1296:
                                ExtendedError::new(info.debug_id as u32, err.reply, source.to_errno());
                        }
    
   -                binder_debug!(
   -                    FailedTransaction,
   -                    "transaction {} to {}:{} failed {:?}, code {} size {}-{}",
   -                    if info.is_reply {
   -                        "reply"
   -                    } else if info.is_oneway() {
   -                        "async"
   -                    } else {
   -                        "call"
   -                    },
   -                    info.to_pid,
   -                    info.to_tid,
   -                    err,
   -                    info.code,
   -                    info.data_size,
   -                    info.offsets_size
   -                );
   +                    binder_debug!(
   +                        FailedTransaction,
   +                        "transaction {} to {}:{} failed {:?}, code {} size {}-{}",
   +                        if info.is_reply {
   +                            "reply"
   +                        } else if info.is_oneway() {
   +                            "async"
   +                        } else {
   +                            "call"
   +                        },
   +                        info.to_pid,
   +                        info.to_tid,
   +                        err,
   +                        info.code,
   +                        info.data_size,
   +                        info.offsets_size
   +                    );
                    }
                }
            }
>> Diff in drivers/android/binder/thread.rs:1296:
                                ExtendedError::new(info.debug_id as u32, err.reply, source.to_errno());
                        }
    
   -                binder_debug!(
   -                    FailedTransaction,
   -                    "transaction {} to {}:{} failed {:?}, code {} size {}-{}",
   -                    if info.is_reply {
   -                        "reply"
   -                    } else if info.is_oneway() {
   -                        "async"
   -                    } else {
   -                        "call"
   -                    },
   -                    info.to_pid,
   -                    info.to_tid,
   -                    err,
   -                    info.code,
   -                    info.data_size,
   -                    info.offsets_size
   -                );
   +                    binder_debug!(
   +                        FailedTransaction,
   +                        "transaction {} to {}:{} failed {:?}, code {} size {}-{}",
   +                        if info.is_reply {
   +                            "reply"
   +                        } else if info.is_oneway() {
   +                            "async"
   +                        } else {
   +                            "call"
   +                        },
   +                        info.to_pid,
   +                        info.to_tid,
   +                        err,
   +                        info.code,
   +                        info.data_size,
   +                        info.offsets_size
   +                    );
                    }
                }
            }
   make[2]: *** [Makefile:1998: rustfmt] Error 123
   make[1]: Leaving directory '/kbuild/obj/consumer/x86_64-rhel-9.4-rust'
   make[2]: Target 'rustfmtcheck' not remade because of errors.
   make[1]: *** [Makefile:248: __sub-make] Error 2
   make[1]: Target 'rustfmtcheck' not remade because of errors.
   make: *** [Makefile:248: __sub-make] Error 2
   make: Target 'rustfmtcheck' not remade because of errors.
   make: Leaving directory '/kbuild/src'

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
