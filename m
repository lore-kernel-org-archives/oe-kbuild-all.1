Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44AFD3A3E81
	for <oe-kbuild-all@lists.linux.dev>; Thu, 14 May 2026 03:34:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778729675; cv=none; b=G0dierO269gL74oHH9IWGrpdNmhssS196BAIb9t681w+uzJVkLwlqVAwYHnQVeEWMuQ2hS+p2zoUmCPAEhGYIwtZXL2v6q3KuVAy0PlOPI39aYdTXuQGEE0F0Hc9m3DA1nbWUAqgAl+QYJYJqk7txQVTTjbtC4ZQfP0bKYo82mQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778729675; c=relaxed/simple;
	bh=UiDDyluWsv8L9ropL6Th68YBLwMOyqud9D5hGTqIus8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=sm35if0qMoGNbi3i9kFfs0JpqRZqZMO/5QYf8kINut9xXSKdIuuZXD4dCJ0i+Vr0jExpu2v0vsL91pjmcvfig3aJh0Z5Xlj6jW5ldVjH5VzAVt4PFj6TF/3HBMPZPig6vQuaGgJRlGyZkTyz7qBkZ4a0t3JZFUqOp6eEVPiBoV8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dij+up+y; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dij+up+y"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778729673; x=1810265673;
  h=date:from:to:cc:subject:message-id;
  bh=UiDDyluWsv8L9ropL6Th68YBLwMOyqud9D5hGTqIus8=;
  b=dij+up+ya2b4RW6MzyuDPX+EaTgbavV/5qxYHCFo2RDmwKrukotyCYBy
   mI66JnZfzZXpdxKvoa8EI/Q42qHJxKimPm4FoDMKui9lenpfAv7009KKa
   Nl4maevPi+S+k3hP5COdNAmccdglAeWyGN+i2kaRTzzUpc3wfi94dqT95
   AZw5JUr62O9oko9jo2y7LZxLkCMB9v6QDCYJErEdBePBE0FbFShPqyYHf
   40vD/UExERQmYyrhrmtmfJWxOLDmNZ0IlVOXoWBhkHt2TxyjwgjolJiFx
   8TGNp/vrwAmkXAQmPfy+q/v0pOwq+Mlao0onnsgVYJQ8544J/Sw1UjErX
   w==;
X-CSE-ConnectionGUID: gxHkbU9RQvScGzfgqj2n4Q==
X-CSE-MsgGUID: JUz1Xa1BTyCr2EcLE3TiQQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11785"; a="79648527"
X-IronPort-AV: E=Sophos;i="6.23,234,1770624000"; 
   d="scan'208";a="79648527"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2026 20:34:33 -0700
X-CSE-ConnectionGUID: NDlHr+POT6qR+9VGNXaBDQ==
X-CSE-MsgGUID: 4Xrx/4ioSOe1u0JfX8WYXA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,234,1770624000"; 
   d="scan'208";a="242598644"
Received: from lkp-server01.sh.intel.com (HELO dca79079c3eb) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 13 May 2026 20:34:31 -0700
Received: from kbuild by dca79079c3eb with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wNMqC-000000005kj-1rg2;
	Thu, 14 May 2026 03:34:28 +0000
Date: Thu, 14 May 2026 11:33:33 +0800
From: kernel test robot <lkp@intel.com>
To: Blaise Boscaccy <bboscaccy@linux.microsoft.com>
Cc: oe-kbuild-all@lists.linux.dev, Paul Moore <paul@paul-moore.com>
Subject: [linuxsecuritymodule:next 7/11]
 security/hornet/hornet_lsm.c:78:33: warning: comparison of distinct pointer
 types ('const struct file_operations *' and 'void (*)(struct bpf_map *)')
Message-ID: <202605141142.p1dckBny-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/LinuxSecurityModule/kernel next
head:   7cd0da3c29d22e2a8dcbc995b12199bc3d2704a8
commit: c62310df81899f7e14d632271aba08d0a55e2318 [7/11] lsm: introduce the Hornet LSM
config: riscv-randconfig-r133-20260514 (https://download.01.org/0day-ci/archive/20260514/202605141142.p1dckBny-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 5bac06718f502014fade905512f1d26d578a18f3)
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260514/202605141142.p1dckBny-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605141142.p1dckBny-lkp@intel.com/

All warnings (new ones prefixed by >>):

   security/hornet/hornet_lsm.c:78:37: error: use of undeclared identifier 'bpf_map_fops'; did you mean 'bpf_map_put'?
      78 |                 if (unlikely(fd_file(f)->f_op != &bpf_map_fops))
         |                                                   ^~~~~~~~~~~~
         |                                                   bpf_map_put
   include/linux/compiler.h:77:42: note: expanded from macro 'unlikely'
      77 | # define unlikely(x)    __builtin_expect(!!(x), 0)
         |                                             ^
   include/linux/bpf.h:3291:20: note: 'bpf_map_put' declared here
    3291 | static inline void bpf_map_put(struct bpf_map *map)
         |                    ^
>> security/hornet/hornet_lsm.c:78:33: warning: comparison of distinct pointer types ('const struct file_operations *' and 'void (*)(struct bpf_map *)') [-Wcompare-distinct-pointer-types]
      78 |                 if (unlikely(fd_file(f)->f_op != &bpf_map_fops))
         |                     ~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~
   include/linux/compiler.h:77:42: note: expanded from macro 'unlikely'
      77 | # define unlikely(x)    __builtin_expect(!!(x), 0)
         |                                             ^
   security/hornet/hornet_lsm.c:256:9: error: call to undeclared function 'security_bpf_prog_load_post_integrity'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     256 |         return security_bpf_prog_load_post_integrity(prog, attr, token, is_kernel,
         |                ^
   security/hornet/hornet_lsm.c:256:9: note: did you mean 'hornet_bpf_prog_load_integrity'?
   security/hornet/hornet_lsm.c:247:12: note: 'hornet_bpf_prog_load_integrity' declared here
     247 | static int hornet_bpf_prog_load_integrity(struct bpf_prog *prog, union bpf_attr *attr,
         |            ^
     248 |                                           struct bpf_token *token, bool is_kernel)
     249 | {
     250 |         enum lsm_integrity_verdict verdict;
     251 |         int result = hornet_check_program(prog, attr, token, is_kernel, &verdict);
     252 | 
     253 |         if (result < 0)
     254 |                 return result;
     255 | 
     256 |         return security_bpf_prog_load_post_integrity(prog, attr, token, is_kernel,
         |                ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                hornet_bpf_prog_load_integrity
   security/hornet/hornet_lsm.c:273:27: error: use of undeclared identifier 'bpf_prog_fops'
     273 |         if (fd_file(f)->f_op != &bpf_prog_fops)
         |                                  ^~~~~~~~~~~~~
   security/hornet/hornet_lsm.c:337:16: error: no member named 'bpf_prog_load_integrity' in 'struct lsm_static_calls_table'
     337 |         LSM_HOOK_INIT(bpf_prog_load_integrity, hornet_bpf_prog_load_integrity),
         |         ~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/lsm_hooks.h:139:32: note: expanded from macro 'LSM_HOOK_INIT'
     139 |                 .scalls = static_calls_table.NAME,      \
         |                           ~~~~~~~~~~~~~~~~~~ ^
   security/hornet/hornet_lsm.c:338:16: error: no member named 'bpf' in 'struct lsm_static_calls_table'
     338 |         LSM_HOOK_INIT(bpf, hornet_bpf),
         |         ~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~
   include/linux/lsm_hooks.h:139:32: note: expanded from macro 'LSM_HOOK_INIT'
     139 |                 .scalls = static_calls_table.NAME,      \
         |                           ~~~~~~~~~~~~~~~~~~ ^
   1 warning and 5 errors generated.


vim +78 security/hornet/hornet_lsm.c

    53	
    54	static int hornet_verify_hashes(struct hornet_maps *maps,
    55					struct hornet_parse_context *ctx,
    56					struct bpf_prog *prog)
    57	{
    58		int map_fd;
    59		u32 i;
    60		struct bpf_map *map;
    61		int err = 0;
    62		unsigned char hash[SHA256_DIGEST_SIZE];
    63		struct hornet_prog_security_struct *security = hornet_bpf_prog_security(prog);
    64	
    65		for (i = 0; i < ctx->hash_count; i++) {
    66			if (ctx->skips[i])
    67				continue;
    68	
    69			err = copy_from_bpfptr_offset(&map_fd, maps->fd_array,
    70						      ctx->indexes[i] * sizeof(map_fd),
    71						      sizeof(map_fd));
    72			if (err != 0)
    73				return LSM_INT_VERDICT_FAULT;
    74	
    75			CLASS(fd, f)(map_fd);
    76			if (fd_empty(f))
    77				return LSM_INT_VERDICT_FAULT;
  > 78			if (unlikely(fd_file(f)->f_op != &bpf_map_fops))
    79				return LSM_INT_VERDICT_FAULT;
    80	
    81			map = fd_file(f)->private_data;
    82			if (!READ_ONCE(map->frozen))
    83				return LSM_INT_VERDICT_FAULT;
    84	
    85			if (!map->ops->map_get_hash)
    86				return LSM_INT_VERDICT_FAULT;
    87	
    88			if (map->ops->map_get_hash(map, SHA256_DIGEST_SIZE, hash))
    89				return LSM_INT_VERDICT_FAULT;
    90	
    91			err = memcmp(hash, &ctx->hashes[i * SHA256_DIGEST_SIZE],
    92				      SHA256_DIGEST_SIZE);
    93			if (err)
    94				return LSM_INT_VERDICT_UNEXPECTED;
    95	
    96			memcpy(&security->signed_hashes[security->signed_hash_count * SHA256_DIGEST_SIZE],
    97			       &ctx->hashes[i * SHA256_DIGEST_SIZE], SHA256_DIGEST_SIZE);
    98			security->signed_hash_count++;
    99		}
   100		return LSM_INT_VERDICT_OK;
   101	}
   102	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
