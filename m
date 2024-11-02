Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0EAF1991BF
	for <oe-kbuild-all@lists.linux.dev>; Sat,  2 Nov 2024 14:04:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730556284; cv=none; b=kjBEzmpiBxNfEzNoaKPBuY40vSl1wKuzqGcX/TIaHOxG4qB/J2jXgmYqOOwSvAmCeqlaFA7t2HxsJe38Uop+mRQO2pXsZuZwbNngshdSF2ZKYJS7ua/DA7Qdb9rdG8ppIj+F/aHKeAhFzfEAtZxd2C9KI2kBonQkkC3CICJHIXY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730556284; c=relaxed/simple;
	bh=Rt98b2f8Rl6AMyUjJgz1QxJEpMu8VSuscWKSCGoXNrE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=iqWSu95kVtsEjVVBOOGkNCue+tIj/V2z96wm/AjGkxaOugclFKBjG+Qy5JS3cwZJM2sYXk3HISge/fbBec+YtfDt4IALPBLWcAWAMEGvNGAVFGcUXMbr1xw4BgNgMN7PBZtCeQye4I+bqCVCcsQfkQo9KlvFzST5LsaEAiLCSOE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hM6FVi5m; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hM6FVi5m"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730556283; x=1762092283;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Rt98b2f8Rl6AMyUjJgz1QxJEpMu8VSuscWKSCGoXNrE=;
  b=hM6FVi5m2XK3jQnVmR1Aa95zANoAwI+SOSF5A5ejxoKcW2dkTdRiiuRY
   AEbK6zenA0Tjhg/B69qmxYm3Zwl1d0BMErYRa9lUFjC+NtuEDJ9YSZ6iP
   5h/dv236Di6FnQ7qC1RcplpRyRkDGiPMAqnS4IfuULTeC+1//XDZauIuJ
   I2jdyzJM1n13ME3nDZFnKFFJKmqJweH0Dcz1ZtrR2nvcHpYCukbxNYeAz
   JMXatYNERtnckeBHgZUtYTKsYzAxwGi/lfwSKPIdg2jIPEtJRqxDq/5fq
   k6BvI26FWgqBXLDYiJ6T0DzfpR/1hS9AlVa5uHm0zzesJjRtAMsGsxjdC
   Q==;
X-CSE-ConnectionGUID: wNTEvj7UQsmrHGUdScsucw==
X-CSE-MsgGUID: oMMrl+HyTrePkBNvWnKyhw==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="30071988"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="30071988"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Nov 2024 07:04:41 -0700
X-CSE-ConnectionGUID: DGFOx46WQ56ioot1fN9OXg==
X-CSE-MsgGUID: BpEmGjNCQXKtPQUmMTspjQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,253,1725346800"; 
   d="scan'208";a="83327414"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 02 Nov 2024 07:04:39 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t7Ek1-000j2r-16;
	Sat, 02 Nov 2024 14:04:37 +0000
Date: Sat, 2 Nov 2024 22:04:24 +0800
From: kernel test robot <lkp@intel.com>
To: Paolo Abeni <pabeni@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [linux-next:master 7079/7183] progs/bpf_iter_netlink.c:11:9: error:
 incompatible pointer types returning 'struct inode___2 *' from a function
 with result type 'struct inode *'
Message-ID: <202411022118.B9SpVJ75-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   c88416ba074a8913cf6d61b789dd834bbca6681c
commit: f998557433ecd476f3c22b61c2002c1e472a6ea7 [7079/7183] Merge branch 'main' of git://git.kernel.org/pub/scm/linux/kernel/git/netdev/net-next.git
compiler: clang version 19.1.2 (https://github.com/llvm/llvm-project 7ba7d8e2f7b6445b60679da826210cdde29eaf8b)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241102/202411022118.B9SpVJ75-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411022118.B9SpVJ75-lkp@intel.com/

All errors (new ones prefixed by >>):

>> progs/bpf_iter_netlink.c:11:9: error: incompatible pointer types returning 'struct inode___2 *' from a function with result type 'struct inode *' [-Werror,-Wincompatible-pointer-types]
      11 |         return &container_of(socket, struct socket_alloc, socket)->vfs_inode;
         |                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   1 error generated.
--
>> progs/bpf_iter_tcp4.c:58:8: error: incompatible pointer types assigning to 'const struct inode *' from 'struct inode___2 *' [-Werror,-Wincompatible-pointer-types]
      58 |         inode = &container_of(sk_socket, struct socket_alloc, socket)->vfs_inode;
         |               ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   1 error generated.
--
>> progs/bpf_iter_udp4.c:19:8: error: incompatible pointer types assigning to 'const struct inode *' from 'struct inode___2 *' [-Werror,-Wincompatible-pointer-types]
      19 |         inode = &container_of(sk_socket, struct socket_alloc, socket)->vfs_inode;
         |               ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   1 error generated.
--
>> progs/bpf_iter_udp6.c:26:8: error: incompatible pointer types assigning to 'const struct inode *' from 'struct inode___2 *' [-Werror,-Wincompatible-pointer-types]
      26 |         inode = &container_of(sk_socket, struct socket_alloc, socket)->vfs_inode;
         |               ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   1 error generated.
--
>> progs/local_storage.c:220:23: error: incompatible pointer types assigning to 'struct inode *' from 'struct inode___2 *' [-Werror,-Wincompatible-pointer-types]
     220 |                 storage->exec_inode = bprm->file->f_inode;
         |                                     ^ ~~~~~~~~~~~~~~~~~~~
   1 error generated.
--
   progs/map_percpu_stats.c:10:7: error: conflicting types for 'bpf_map_sum_elem_count'
      10 | __s64 bpf_map_sum_elem_count(const struct bpf_map *map) __ksym;
         |       ^
   tools/testing/selftests/bpf/tools/include/vmlinux.h:159544:12: note: previous declaration is here
    159544 | extern s64 bpf_map_sum_elem_count(const struct bpf_map___2 *map) __weak __ksym;
           |            ^
>> progs/map_percpu_stats.c:16:18: error: incompatible pointer types initializing 'struct bpf_map *' with an expression of type 'struct bpf_map___2 *' [-Werror,-Wincompatible-pointer-types]
      16 |         struct bpf_map *map = ctx->map;
         |                         ^     ~~~~~~~~
   progs/map_percpu_stats.c:19:54: error: incompatible pointer types passing 'struct bpf_map *' to parameter of type 'const struct bpf_map___2 *' [-Werror,-Wincompatible-pointer-types]
      19 |                 BPF_SEQ_PRINTF(seq, "%lld", bpf_map_sum_elem_count(map));
         |                                                                    ^~~
   tools/testing/selftests/bpf/tools/include/bpf/bpf_helpers.h:252:24: note: expanded from macro 'BPF_SEQ_PRINTF'
     252 |         ___bpf_fill(___param, args);                            \
         |                               ^~~~
   tools/testing/selftests/bpf/tools/include/bpf/bpf_helpers.h:239:55: note: expanded from macro '___bpf_fill'
     239 |         ___bpf_apply(___bpf_fill, ___bpf_narg(args))(arr, 0, args)
         |                                                              ^~~~
   tools/testing/selftests/bpf/tools/include/bpf/bpf_helpers.h:226:42: note: expanded from macro '___bpf_fill1'
     226 | #define ___bpf_fill1(arr, p, x) arr[p] = x
         |                                          ^
   tools/testing/selftests/bpf/tools/include/vmlinux.h:159544:61: note: passing argument to parameter 'map' here
    159544 | extern s64 bpf_map_sum_elem_count(const struct bpf_map___2 *map) __weak __ksym;
           |                                                             ^
   3 errors generated.
--
>> progs/verifier_arena.c:121:18: error: incompatible pointer types initializing 'struct bpf_map *' with an expression of type 'struct bpf_map___2 *' [-Werror,-Wincompatible-pointer-types]
     121 |         struct bpf_map *map = ctx->map;
         |                         ^     ~~~~~~~~
   progs/verifier_arena.c:143:18: error: incompatible pointer types initializing 'struct bpf_map *' with an expression of type 'struct bpf_map___2 *' [-Werror,-Wincompatible-pointer-types]
     143 |         struct bpf_map *map = ctx->map;
         |                         ^     ~~~~~~~~
   2 errors generated.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
