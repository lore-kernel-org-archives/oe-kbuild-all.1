Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90F00178CE4
	for <oe-kbuild-all@lists.linux.dev>; Sat, 26 Oct 2024 11:02:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729940582; cv=none; b=fh17JwgIhlUZOmwemDDPVKuwo4WbuxGiv77Jpwf8mTeiQiRMCMRZ7ohvFD8wxyLyRMcdUdmjxINJhS5sjFBTpcvx4pbuGcKvXloMCfIUX8sPJaurHQK6t361g0OZpvcc19Oqdl2+OEoIZgz2zKltvB8S1wstiud0rvntoYiPTPQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729940582; c=relaxed/simple;
	bh=NT9hOXwPCDJ5fkCLXQBEix9RejaCpxYOXBA8FGsHkdg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=gSDaJVrKLgP+tdOFlHweikgFtxZvOruiVssUwiwJ00qoQsxSYaBJ3Np9Z2g+3xI50RKreG9qkbpLkNEXhaesLkYbPsrjzrhxCp8UqCfuyj0aiCJ0R+L5FJMVj9t3+EMzeljPZsPBu+5HmcPln9r2yfuwzuySLg71/vAAl569I2s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JsTI0RNW; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JsTI0RNW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729940580; x=1761476580;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=NT9hOXwPCDJ5fkCLXQBEix9RejaCpxYOXBA8FGsHkdg=;
  b=JsTI0RNWyH4qdcCk2mFV00lOQ9bDEvERCvFc6HQCSn/X4QlE0fGGYYkE
   FTffoexnFL8q01peMic0NGb6mWG4MZ9PCqQsvZvVAFNw4BNcOZD5I/AuC
   vtzGTs9FKznRvP5FclmJ12KpItZ1tsORxHUtNuoOLZQoa2Jv1sEV0T+dU
   GVqlbuCZcaXsnRLWY8Xij/E1CTCmGLP2I8Hf4VB2FxI2dN8UYwCpnO4fM
   PG/aWcuO2973btV4yInB4Vb2gsFfsREvMNUQLu/C0ugW+ml9ALFFD4AY5
   NCu5pH2+SdkxGmmJKIhdPQm3pHFok0uT4zdTaqLNH+Blbd5MW38zjCvXW
   Q==;
X-CSE-ConnectionGUID: 3w8ALW9LS/aLVCjMMhHuWA==
X-CSE-MsgGUID: 8H+MvZ7kRlCnGpgN8sYyZQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11236"; a="32465283"
X-IronPort-AV: E=Sophos;i="6.11,234,1725346800"; 
   d="scan'208";a="32465283"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Oct 2024 04:02:59 -0700
X-CSE-ConnectionGUID: RTKXwpp9Rv63AcSnPbK9OQ==
X-CSE-MsgGUID: FGKLKWz9Tf+YhvHmsROxtw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,234,1725346800"; 
   d="scan'208";a="80799097"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 26 Oct 2024 04:02:58 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t4eZL-000ZY8-2M;
	Sat, 26 Oct 2024 11:02:55 +0000
Date: Sat, 26 Oct 2024 19:02:39 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Yang Yingliang <yangyingliang@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 17125/23859] kernel/bpf/verifier.o:
 warning: objtool: do_check()+0x2bc8: can't find switch jump table
Message-ID: <202410261849.E2vRU8kU-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   d2a40c79ddef4b96b8a7a396bd7273121b1b4a5c
commit: b2fdc6d8c190bbe579cbc19c520f3d7c25e9fb44 [17125/23859] bpf: Do not mark insn as seen under speculative path verification
config: x86_64-randconfig-073-20241026 (https://download.01.org/0day-ci/archive/20241026/202410261849.E2vRU8kU-lkp@intel.com/config)
compiler: clang version 19.1.2 (https://github.com/llvm/llvm-project 7ba7d8e2f7b6445b60679da826210cdde29eaf8b)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241026/202410261849.E2vRU8kU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410261849.E2vRU8kU-lkp@intel.com/

All warnings (new ones prefixed by >>):

   kernel/bpf/verifier.c:6228:16: warning: cast from 'unsigned int (*)(const void *, const struct bpf_insn *)' to 'u64 (*)(u64, u64, u64, u64, u64)' (aka 'unsigned long long (*)(unsigned long long, unsigned long long, unsigned long long, unsigned long long, unsigned long long)') converts to incompatible function type [-Wcast-function-type-strict]
    6228 |                         insn->imm = (u64 (*)(u64, u64, u64, u64, u64))
         |                                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    6229 |                                 func[subprog]->bpf_func -
         |                                 ~~~~~~~~~~~~~~~~~~~~~~~
   kernel/bpf/verifier.c:6569:17: warning: cast from 'void *(*)(struct bpf_map *, void *)' to 'u64 (*)(u64, u64, u64, u64, u64)' (aka 'unsigned long long (*)(unsigned long long, unsigned long long, unsigned long long, unsigned long long, unsigned long long)') converts to incompatible function type [-Wcast-function-type-strict]
    6569 |                                 insn->imm = BPF_CAST_CALL(ops->map_lookup_elem) -
         |                                             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/filter.h:323:4: note: expanded from macro 'BPF_CAST_CALL'
     323 |                 ((u64 (*)(u64, u64, u64, u64, u64))(x))
         |                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/bpf/verifier.c:6573:17: warning: cast from 'int (*)(struct bpf_map *, void *, void *, u64)' (aka 'int (*)(struct bpf_map *, void *, void *, unsigned long long)') to 'u64 (*)(u64, u64, u64, u64, u64)' (aka 'unsigned long long (*)(unsigned long long, unsigned long long, unsigned long long, unsigned long long, unsigned long long)') converts to incompatible function type [-Wcast-function-type-strict]
    6573 |                                 insn->imm = BPF_CAST_CALL(ops->map_update_elem) -
         |                                             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/filter.h:323:4: note: expanded from macro 'BPF_CAST_CALL'
     323 |                 ((u64 (*)(u64, u64, u64, u64, u64))(x))
         |                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/bpf/verifier.c:6577:17: warning: cast from 'int (*)(struct bpf_map *, void *)' to 'u64 (*)(u64, u64, u64, u64, u64)' (aka 'unsigned long long (*)(unsigned long long, unsigned long long, unsigned long long, unsigned long long, unsigned long long)') converts to incompatible function type [-Wcast-function-type-strict]
    6577 |                                 insn->imm = BPF_CAST_CALL(ops->map_delete_elem) -
         |                                             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/filter.h:323:4: note: expanded from macro 'BPF_CAST_CALL'
     323 |                 ((u64 (*)(u64, u64, u64, u64, u64))(x))
         |                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   4 warnings generated.
>> kernel/bpf/verifier.o: warning: objtool: do_check()+0x2bc8: can't find switch jump table

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
