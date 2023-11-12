Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B371A1A58E
	for <oe-kbuild-all@lists.linux.dev>; Sun, 12 Nov 2023 21:48:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ErN9noB/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699825723; x=1731361723;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=25SORU3wSULi2mjadRO5I6C4HgXt+Fy/BwdPukgD0TI=;
  b=ErN9noB/rfxn7gCLgDUWDAIIeCObrI/IR7rABrkRDLM5GZoKojjIjFfC
   y9ANdn/MHu0W5gVKCwRFB3SQRvY0m8oB8SefpzmqfiSGg48kBEZbMr3+H
   lM9U+YIBp4lLfjTLSGYlfNgdPuvdw7IldOld/wPVjGNTGRnRHTkaxw4J7
   9jn/kmy6L/MmfRHleU2vozsIpH5Urzfu38U+dQFZV17uAKngx130vuSFb
   iTFOUonDttuz/gaddyAmkPgCe7Gfglm69N2zdnr6bqcbUFP0aCFDGJbQj
   zi8027wq8gEPFfBBOmvfQrnSF0bCPB1KQTXWpMQSklf5kQDNrth+RmLuu
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10892"; a="370553891"
X-IronPort-AV: E=Sophos;i="6.03,298,1694761200"; 
   d="scan'208";a="370553891"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Nov 2023 13:48:42 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10892"; a="767745946"
X-IronPort-AV: E=Sophos;i="6.03,298,1694761200"; 
   d="scan'208";a="767745946"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 12 Nov 2023 13:48:41 -0800
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r2IJr-000BYU-0d;
	Sun, 12 Nov 2023 21:48:39 +0000
Date: Mon, 13 Nov 2023 05:47:47 +0800
From: kernel test robot <lkp@intel.com>
To: Shun Hao <shunh@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev, Leon Romanovsky <leon@kernel.org>
Subject: [leon-rdma:rdma-next 8/8] include/linux/stddef.h:16:33: error:
 'struct mlx5_ifc_device_mem_cap_bits' has no member named
 'log_indirect_encap_sw_icm_size'
Message-ID: <202311130511.z61TJE5J-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/leon/linux-rdma.git rdma-next
head:   f3ff09875836ad0faa7c32933eb4a3d0cd99c660
commit: f3ff09875836ad0faa7c32933eb4a3d0cd99c660 [8/8] net/mlx5: manage ICM type of SW encap
config: sparc-allmodconfig (https://download.01.org/0day-ci/archive/20231113/202311130511.z61TJE5J-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231113/202311130511.z61TJE5J-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311130511.z61TJE5J-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/byteorder/big_endian.h:5,
                    from arch/sparc/include/uapi/asm/byteorder.h:5,
                    from arch/sparc/include/asm/bitops_64.h:16,
                    from arch/sparc/include/asm/bitops.h:5,
                    from include/linux/bitops.h:68,
                    from include/linux/kernel.h:22,
                    from include/linux/mlx5/driver.h:36,
                    from drivers/net/ethernet/mellanox/mlx5/core/lib/dm.c:4:
   drivers/net/ethernet/mellanox/mlx5/core/lib/dm.c: In function 'mlx5_dm_create':
>> include/linux/stddef.h:16:33: error: 'struct mlx5_ifc_device_mem_cap_bits' has no member named 'log_indirect_encap_sw_icm_size'
      16 | #define offsetof(TYPE, MEMBER)  __builtin_offsetof(TYPE, MEMBER)
         |                                 ^~~~~~~~~~~~~~~~~~
   include/uapi/linux/byteorder/big_endian.h:41:51: note: in definition of macro '__be32_to_cpu'
      41 | #define __be32_to_cpu(x) ((__force __u32)(__be32)(x))
         |                                                   ^
   include/linux/mlx5/device.h:52:35: note: in expansion of macro 'offsetof'
      52 | #define __mlx5_bit_off(typ, fld) (offsetof(struct mlx5_ifc_##typ##_bits, fld))
         |                                   ^~~~~~~~
   include/linux/mlx5/device.h:54:34: note: in expansion of macro '__mlx5_bit_off'
      54 | #define __mlx5_dw_off(typ, fld) (__mlx5_bit_off(typ, fld) / 32)
         |                                  ^~~~~~~~~~~~~~
   include/linux/mlx5/device.h:97:1: note: in expansion of macro '__mlx5_dw_off'
      97 | __mlx5_dw_off(typ, fld))) >> __mlx5_dw_bit_off(typ, fld)) & \
         | ^~~~~~~~~~~~~
   include/linux/mlx5/device.h:1403:9: note: in expansion of macro 'MLX5_GET'
    1403 |         MLX5_GET(device_mem_cap, mdev->caps.hca[MLX5_CAP_DEV_MEM]->cur, cap)
         |         ^~~~~~~~
   drivers/net/ethernet/mellanox/mlx5/core/lib/dm.c:59:13: note: in expansion of macro 'MLX5_CAP_DEV_MEM'
      59 |         if (MLX5_CAP_DEV_MEM(dev, log_indirect_encap_sw_icm_size)) {
         |             ^~~~~~~~~~~~~~~~
   In file included from include/linux/mlx5/driver.h:54:
>> include/linux/mlx5/device.h:51:57: error: 'struct mlx5_ifc_device_mem_cap_bits' has no member named 'log_indirect_encap_sw_icm_size'
      51 | #define __mlx5_bit_sz(typ, fld) sizeof(__mlx5_nullp(typ)->fld)
         |                                                         ^~
   include/linux/mlx5/device.h:57:43: note: in expansion of macro '__mlx5_bit_sz'
      57 | #define __mlx5_dw_bit_off(typ, fld) (32 - __mlx5_bit_sz(typ, fld) - (__mlx5_bit_off(typ, fld) & 0x1f))
         |                                           ^~~~~~~~~~~~~
   include/linux/mlx5/device.h:97:30: note: in expansion of macro '__mlx5_dw_bit_off'
      97 | __mlx5_dw_off(typ, fld))) >> __mlx5_dw_bit_off(typ, fld)) & \
         |                              ^~~~~~~~~~~~~~~~~
   include/linux/mlx5/device.h:1403:9: note: in expansion of macro 'MLX5_GET'
    1403 |         MLX5_GET(device_mem_cap, mdev->caps.hca[MLX5_CAP_DEV_MEM]->cur, cap)
         |         ^~~~~~~~
   drivers/net/ethernet/mellanox/mlx5/core/lib/dm.c:59:13: note: in expansion of macro 'MLX5_CAP_DEV_MEM'
      59 |         if (MLX5_CAP_DEV_MEM(dev, log_indirect_encap_sw_icm_size)) {
         |             ^~~~~~~~~~~~~~~~
   In file included from include/uapi/linux/posix_types.h:5,
                    from include/uapi/linux/types.h:14,
                    from include/linux/types.h:6,
                    from include/linux/limits.h:6,
                    from include/linux/kernel.h:16:
>> include/linux/stddef.h:16:33: error: 'struct mlx5_ifc_device_mem_cap_bits' has no member named 'log_indirect_encap_sw_icm_size'
      16 | #define offsetof(TYPE, MEMBER)  __builtin_offsetof(TYPE, MEMBER)
         |                                 ^~~~~~~~~~~~~~~~~~
   include/linux/mlx5/device.h:52:35: note: in expansion of macro 'offsetof'
      52 | #define __mlx5_bit_off(typ, fld) (offsetof(struct mlx5_ifc_##typ##_bits, fld))
         |                                   ^~~~~~~~
   include/linux/mlx5/device.h:57:70: note: in expansion of macro '__mlx5_bit_off'
      57 | #define __mlx5_dw_bit_off(typ, fld) (32 - __mlx5_bit_sz(typ, fld) - (__mlx5_bit_off(typ, fld) & 0x1f))
         |                                                                      ^~~~~~~~~~~~~~
   include/linux/mlx5/device.h:97:30: note: in expansion of macro '__mlx5_dw_bit_off'
      97 | __mlx5_dw_off(typ, fld))) >> __mlx5_dw_bit_off(typ, fld)) & \
         |                              ^~~~~~~~~~~~~~~~~
   include/linux/mlx5/device.h:1403:9: note: in expansion of macro 'MLX5_GET'
    1403 |         MLX5_GET(device_mem_cap, mdev->caps.hca[MLX5_CAP_DEV_MEM]->cur, cap)
         |         ^~~~~~~~
   drivers/net/ethernet/mellanox/mlx5/core/lib/dm.c:59:13: note: in expansion of macro 'MLX5_CAP_DEV_MEM'
      59 |         if (MLX5_CAP_DEV_MEM(dev, log_indirect_encap_sw_icm_size)) {
         |             ^~~~~~~~~~~~~~~~
>> include/linux/mlx5/device.h:51:57: error: 'struct mlx5_ifc_device_mem_cap_bits' has no member named 'log_indirect_encap_sw_icm_size'
      51 | #define __mlx5_bit_sz(typ, fld) sizeof(__mlx5_nullp(typ)->fld)
         |                                                         ^~
   include/linux/mlx5/device.h:58:47: note: in expansion of macro '__mlx5_bit_sz'
      58 | #define __mlx5_mask(typ, fld) ((u32)((1ull << __mlx5_bit_sz(typ, fld)) - 1))
         |                                               ^~~~~~~~~~~~~
   include/linux/mlx5/device.h:98:1: note: in expansion of macro '__mlx5_mask'
      98 | __mlx5_mask(typ, fld))
         | ^~~~~~~~~~~
   include/linux/mlx5/device.h:1403:9: note: in expansion of macro 'MLX5_GET'
    1403 |         MLX5_GET(device_mem_cap, mdev->caps.hca[MLX5_CAP_DEV_MEM]->cur, cap)
         |         ^~~~~~~~
   drivers/net/ethernet/mellanox/mlx5/core/lib/dm.c:59:13: note: in expansion of macro 'MLX5_CAP_DEV_MEM'
      59 |         if (MLX5_CAP_DEV_MEM(dev, log_indirect_encap_sw_icm_size)) {
         |             ^~~~~~~~~~~~~~~~
   In file included from include/linux/bits.h:6,
                    from include/linux/bitops.h:6:
>> include/linux/stddef.h:16:33: error: 'struct mlx5_ifc_device_mem_cap_bits' has no member named 'log_indirect_encap_sw_icm_size'
      16 | #define offsetof(TYPE, MEMBER)  __builtin_offsetof(TYPE, MEMBER)
         |                                 ^~~~~~~~~~~~~~~~~~
   include/vdso/bits.h:7:44: note: in definition of macro 'BIT'
       7 | #define BIT(nr)                 (UL(1) << (nr))
         |                                            ^~
   include/linux/byteorder/generic.h:95:21: note: in expansion of macro '__be32_to_cpu'
      95 | #define be32_to_cpu __be32_to_cpu
         |                     ^~~~~~~~~~~~~
   include/linux/mlx5/device.h:52:35: note: in expansion of macro 'offsetof'
      52 | #define __mlx5_bit_off(typ, fld) (offsetof(struct mlx5_ifc_##typ##_bits, fld))
         |                                   ^~~~~~~~
   include/linux/mlx5/device.h:54:34: note: in expansion of macro '__mlx5_bit_off'
      54 | #define __mlx5_dw_off(typ, fld) (__mlx5_bit_off(typ, fld) / 32)
         |                                  ^~~~~~~~~~~~~~
   include/linux/mlx5/device.h:97:1: note: in expansion of macro '__mlx5_dw_off'
      97 | __mlx5_dw_off(typ, fld))) >> __mlx5_dw_bit_off(typ, fld)) & \
         | ^~~~~~~~~~~~~
   include/linux/mlx5/device.h:1403:9: note: in expansion of macro 'MLX5_GET'
    1403 |         MLX5_GET(device_mem_cap, mdev->caps.hca[MLX5_CAP_DEV_MEM]->cur, cap)
         |         ^~~~~~~~
   drivers/net/ethernet/mellanox/mlx5/core/lib/dm.c:61:29: note: in expansion of macro 'MLX5_CAP_DEV_MEM'
      61 |                         BIT(MLX5_CAP_DEV_MEM(dev, log_indirect_encap_sw_icm_size) -
         |                             ^~~~~~~~~~~~~~~~
>> include/linux/mlx5/device.h:51:57: error: 'struct mlx5_ifc_device_mem_cap_bits' has no member named 'log_indirect_encap_sw_icm_size'
      51 | #define __mlx5_bit_sz(typ, fld) sizeof(__mlx5_nullp(typ)->fld)
         |                                                         ^~
   include/vdso/bits.h:7:44: note: in definition of macro 'BIT'
       7 | #define BIT(nr)                 (UL(1) << (nr))
         |                                            ^~
   include/linux/mlx5/device.h:57:43: note: in expansion of macro '__mlx5_bit_sz'
      57 | #define __mlx5_dw_bit_off(typ, fld) (32 - __mlx5_bit_sz(typ, fld) - (__mlx5_bit_off(typ, fld) & 0x1f))
         |                                           ^~~~~~~~~~~~~
   include/linux/mlx5/device.h:97:30: note: in expansion of macro '__mlx5_dw_bit_off'
      97 | __mlx5_dw_off(typ, fld))) >> __mlx5_dw_bit_off(typ, fld)) & \
         |                              ^~~~~~~~~~~~~~~~~
   include/linux/mlx5/device.h:1403:9: note: in expansion of macro 'MLX5_GET'
    1403 |         MLX5_GET(device_mem_cap, mdev->caps.hca[MLX5_CAP_DEV_MEM]->cur, cap)
         |         ^~~~~~~~
   drivers/net/ethernet/mellanox/mlx5/core/lib/dm.c:61:29: note: in expansion of macro 'MLX5_CAP_DEV_MEM'
      61 |                         BIT(MLX5_CAP_DEV_MEM(dev, log_indirect_encap_sw_icm_size) -
         |                             ^~~~~~~~~~~~~~~~
>> include/linux/stddef.h:16:33: error: 'struct mlx5_ifc_device_mem_cap_bits' has no member named 'log_indirect_encap_sw_icm_size'
      16 | #define offsetof(TYPE, MEMBER)  __builtin_offsetof(TYPE, MEMBER)
         |                                 ^~~~~~~~~~~~~~~~~~
   include/vdso/bits.h:7:44: note: in definition of macro 'BIT'
       7 | #define BIT(nr)                 (UL(1) << (nr))
         |                                            ^~
   include/linux/mlx5/device.h:52:35: note: in expansion of macro 'offsetof'
      52 | #define __mlx5_bit_off(typ, fld) (offsetof(struct mlx5_ifc_##typ##_bits, fld))
         |                                   ^~~~~~~~
   include/linux/mlx5/device.h:57:70: note: in expansion of macro '__mlx5_bit_off'
      57 | #define __mlx5_dw_bit_off(typ, fld) (32 - __mlx5_bit_sz(typ, fld) - (__mlx5_bit_off(typ, fld) & 0x1f))
         |                                                                      ^~~~~~~~~~~~~~
   include/linux/mlx5/device.h:97:30: note: in expansion of macro '__mlx5_dw_bit_off'
      97 | __mlx5_dw_off(typ, fld))) >> __mlx5_dw_bit_off(typ, fld)) & \
         |                              ^~~~~~~~~~~~~~~~~
   include/linux/mlx5/device.h:1403:9: note: in expansion of macro 'MLX5_GET'
    1403 |         MLX5_GET(device_mem_cap, mdev->caps.hca[MLX5_CAP_DEV_MEM]->cur, cap)
         |         ^~~~~~~~
   drivers/net/ethernet/mellanox/mlx5/core/lib/dm.c:61:29: note: in expansion of macro 'MLX5_CAP_DEV_MEM'
      61 |                         BIT(MLX5_CAP_DEV_MEM(dev, log_indirect_encap_sw_icm_size) -
         |                             ^~~~~~~~~~~~~~~~
>> include/linux/mlx5/device.h:51:57: error: 'struct mlx5_ifc_device_mem_cap_bits' has no member named 'log_indirect_encap_sw_icm_size'
      51 | #define __mlx5_bit_sz(typ, fld) sizeof(__mlx5_nullp(typ)->fld)
         |                                                         ^~
   include/vdso/bits.h:7:44: note: in definition of macro 'BIT'
       7 | #define BIT(nr)                 (UL(1) << (nr))
         |                                            ^~
   include/linux/mlx5/device.h:58:47: note: in expansion of macro '__mlx5_bit_sz'
      58 | #define __mlx5_mask(typ, fld) ((u32)((1ull << __mlx5_bit_sz(typ, fld)) - 1))
         |                                               ^~~~~~~~~~~~~
   include/linux/mlx5/device.h:98:1: note: in expansion of macro '__mlx5_mask'
      98 | __mlx5_mask(typ, fld))
         | ^~~~~~~~~~~
   include/linux/mlx5/device.h:1403:9: note: in expansion of macro 'MLX5_GET'
    1403 |         MLX5_GET(device_mem_cap, mdev->caps.hca[MLX5_CAP_DEV_MEM]->cur, cap)
         |         ^~~~~~~~
   drivers/net/ethernet/mellanox/mlx5/core/lib/dm.c:61:29: note: in expansion of macro 'MLX5_CAP_DEV_MEM'
      61 |                         BIT(MLX5_CAP_DEV_MEM(dev, log_indirect_encap_sw_icm_size) -
         |                             ^~~~~~~~~~~~~~~~
   In file included from arch/sparc/include/asm/bug.h:25,
                    from include/linux/bug.h:5,
                    from include/linux/thread_info.h:13,
                    from include/asm-generic/preempt.h:5,
                    from ./arch/sparc/include/generated/asm/preempt.h:1,
                    from include/linux/preempt.h:79,
                    from include/linux/spinlock.h:56,
                    from include/linux/swait.h:7,
                    from include/linux/completion.h:12,
                    from include/linux/mlx5/driver.h:37:
   drivers/net/ethernet/mellanox/mlx5/core/lib/dm.c: In function 'mlx5_dm_cleanup':
>> include/linux/stddef.h:16:33: error: 'struct mlx5_ifc_device_mem_cap_bits' has no member named 'log_indirect_encap_sw_icm_size'
      16 | #define offsetof(TYPE, MEMBER)  __builtin_offsetof(TYPE, MEMBER)
         |                                 ^~~~~~~~~~~~~~~~~~
   include/asm-generic/bug.h:123:32: note: in definition of macro 'WARN_ON'
     123 |         int __ret_warn_on = !!(condition);                              \
         |                                ^~~~~~~~~
   drivers/net/ethernet/mellanox/mlx5/core/lib/dm.c:126:39: note: in expansion of macro 'BIT'
     126 |                                       BIT(MLX5_CAP_DEV_MEM(dev,
         |                                       ^~~
   include/linux/byteorder/generic.h:95:21: note: in expansion of macro '__be32_to_cpu'
      95 | #define be32_to_cpu __be32_to_cpu
         |                     ^~~~~~~~~~~~~
   include/linux/mlx5/device.h:52:35: note: in expansion of macro 'offsetof'
      52 | #define __mlx5_bit_off(typ, fld) (offsetof(struct mlx5_ifc_##typ##_bits, fld))
         |                                   ^~~~~~~~
   include/linux/mlx5/device.h:54:34: note: in expansion of macro '__mlx5_bit_off'
      54 | #define __mlx5_dw_off(typ, fld) (__mlx5_bit_off(typ, fld) / 32)
         |                                  ^~~~~~~~~~~~~~
   include/linux/mlx5/device.h:97:1: note: in expansion of macro '__mlx5_dw_off'
      97 | __mlx5_dw_off(typ, fld))) >> __mlx5_dw_bit_off(typ, fld)) & \
         | ^~~~~~~~~~~~~
   include/linux/mlx5/device.h:1403:9: note: in expansion of macro 'MLX5_GET'
    1403 |         MLX5_GET(device_mem_cap, mdev->caps.hca[MLX5_CAP_DEV_MEM]->cur, cap)
         |         ^~~~~~~~
   drivers/net/ethernet/mellanox/mlx5/core/lib/dm.c:126:43: note: in expansion of macro 'MLX5_CAP_DEV_MEM'
     126 |                                       BIT(MLX5_CAP_DEV_MEM(dev,
         |                                           ^~~~~~~~~~~~~~~~
>> include/linux/mlx5/device.h:51:57: error: 'struct mlx5_ifc_device_mem_cap_bits' has no member named 'log_indirect_encap_sw_icm_size'
      51 | #define __mlx5_bit_sz(typ, fld) sizeof(__mlx5_nullp(typ)->fld)
         |                                                         ^~
   include/asm-generic/bug.h:123:32: note: in definition of macro 'WARN_ON'
     123 |         int __ret_warn_on = !!(condition);                              \
         |                                ^~~~~~~~~
   drivers/net/ethernet/mellanox/mlx5/core/lib/dm.c:126:39: note: in expansion of macro 'BIT'
     126 |                                       BIT(MLX5_CAP_DEV_MEM(dev,
         |                                       ^~~
   include/linux/mlx5/device.h:57:43: note: in expansion of macro '__mlx5_bit_sz'
      57 | #define __mlx5_dw_bit_off(typ, fld) (32 - __mlx5_bit_sz(typ, fld) - (__mlx5_bit_off(typ, fld) & 0x1f))
         |                                           ^~~~~~~~~~~~~
   include/linux/mlx5/device.h:97:30: note: in expansion of macro '__mlx5_dw_bit_off'
      97 | __mlx5_dw_off(typ, fld))) >> __mlx5_dw_bit_off(typ, fld)) & \
         |                              ^~~~~~~~~~~~~~~~~
   include/linux/mlx5/device.h:1403:9: note: in expansion of macro 'MLX5_GET'
    1403 |         MLX5_GET(device_mem_cap, mdev->caps.hca[MLX5_CAP_DEV_MEM]->cur, cap)
         |         ^~~~~~~~
   drivers/net/ethernet/mellanox/mlx5/core/lib/dm.c:126:43: note: in expansion of macro 'MLX5_CAP_DEV_MEM'
     126 |                                       BIT(MLX5_CAP_DEV_MEM(dev,
         |                                           ^~~~~~~~~~~~~~~~
>> include/linux/stddef.h:16:33: error: 'struct mlx5_ifc_device_mem_cap_bits' has no member named 'log_indirect_encap_sw_icm_size'
      16 | #define offsetof(TYPE, MEMBER)  __builtin_offsetof(TYPE, MEMBER)
         |                                 ^~~~~~~~~~~~~~~~~~
   include/asm-generic/bug.h:123:32: note: in definition of macro 'WARN_ON'
     123 |         int __ret_warn_on = !!(condition);                              \
         |                                ^~~~~~~~~
   drivers/net/ethernet/mellanox/mlx5/core/lib/dm.c:126:39: note: in expansion of macro 'BIT'
     126 |                                       BIT(MLX5_CAP_DEV_MEM(dev,
         |                                       ^~~
   include/linux/mlx5/device.h:52:35: note: in expansion of macro 'offsetof'
      52 | #define __mlx5_bit_off(typ, fld) (offsetof(struct mlx5_ifc_##typ##_bits, fld))
         |                                   ^~~~~~~~
   include/linux/mlx5/device.h:57:70: note: in expansion of macro '__mlx5_bit_off'
      57 | #define __mlx5_dw_bit_off(typ, fld) (32 - __mlx5_bit_sz(typ, fld) - (__mlx5_bit_off(typ, fld) & 0x1f))
         |                                                                      ^~~~~~~~~~~~~~
   include/linux/mlx5/device.h:97:30: note: in expansion of macro '__mlx5_dw_bit_off'
      97 | __mlx5_dw_off(typ, fld))) >> __mlx5_dw_bit_off(typ, fld)) & \
         |                              ^~~~~~~~~~~~~~~~~
   include/linux/mlx5/device.h:1403:9: note: in expansion of macro 'MLX5_GET'
    1403 |         MLX5_GET(device_mem_cap, mdev->caps.hca[MLX5_CAP_DEV_MEM]->cur, cap)
         |         ^~~~~~~~
   drivers/net/ethernet/mellanox/mlx5/core/lib/dm.c:126:43: note: in expansion of macro 'MLX5_CAP_DEV_MEM'
     126 |                                       BIT(MLX5_CAP_DEV_MEM(dev,
         |                                           ^~~~~~~~~~~~~~~~
>> include/linux/mlx5/device.h:51:57: error: 'struct mlx5_ifc_device_mem_cap_bits' has no member named 'log_indirect_encap_sw_icm_size'
      51 | #define __mlx5_bit_sz(typ, fld) sizeof(__mlx5_nullp(typ)->fld)
         |                                                         ^~
   include/asm-generic/bug.h:123:32: note: in definition of macro 'WARN_ON'
     123 |         int __ret_warn_on = !!(condition);                              \
         |                                ^~~~~~~~~
   drivers/net/ethernet/mellanox/mlx5/core/lib/dm.c:126:39: note: in expansion of macro 'BIT'
     126 |                                       BIT(MLX5_CAP_DEV_MEM(dev,
         |                                       ^~~
   include/linux/mlx5/device.h:58:47: note: in expansion of macro '__mlx5_bit_sz'
      58 | #define __mlx5_mask(typ, fld) ((u32)((1ull << __mlx5_bit_sz(typ, fld)) - 1))
         |                                               ^~~~~~~~~~~~~
   include/linux/mlx5/device.h:98:1: note: in expansion of macro '__mlx5_mask'
      98 | __mlx5_mask(typ, fld))
         | ^~~~~~~~~~~
   include/linux/mlx5/device.h:1403:9: note: in expansion of macro 'MLX5_GET'
    1403 |         MLX5_GET(device_mem_cap, mdev->caps.hca[MLX5_CAP_DEV_MEM]->cur, cap)
         |         ^~~~~~~~
   drivers/net/ethernet/mellanox/mlx5/core/lib/dm.c:126:43: note: in expansion of macro 'MLX5_CAP_DEV_MEM'
     126 |                                       BIT(MLX5_CAP_DEV_MEM(dev,
         |                                           ^~~~~~~~~~~~~~~~
   drivers/net/ethernet/mellanox/mlx5/core/lib/dm.c: In function 'mlx5_dm_sw_icm_alloc':
>> drivers/net/ethernet/mellanox/mlx5/core/lib/dm.c:191:14: error: 'MLX5_SW_ICM_TYPE_SW_ENCAP' undeclared (first use in this function); did you mean 'MLX5_SW_ICM_TYPE_STEERING'?
     191 |         case MLX5_SW_ICM_TYPE_SW_ENCAP:
         |              ^~~~~~~~~~~~~~~~~~~~~~~~~
         |              MLX5_SW_ICM_TYPE_STEERING
   drivers/net/ethernet/mellanox/mlx5/core/lib/dm.c:191:14: note: each undeclared identifier is reported only once for each function it appears in
>> drivers/net/ethernet/mellanox/mlx5/core/lib/dm.c:193:53: error: 'struct mlx5_ifc_device_mem_cap_bits' has no member named 'indirect_encap_sw_icm_start_address'; did you mean 'steering_sw_icm_start_address'?
     193 |                                                     indirect_encap_sw_icm_start_address);
         |                                                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/uapi/linux/byteorder/big_endian.h:39:51: note: in definition of macro '__be64_to_cpu'
      39 | #define __be64_to_cpu(x) ((__force __u64)(__be64)(x))
         |                                                   ^
   include/linux/mlx5/device.h:52:35: note: in expansion of macro 'offsetof'
      52 | #define __mlx5_bit_off(typ, fld) (offsetof(struct mlx5_ifc_##typ##_bits, fld))
         |                                   ^~~~~~~~
   include/linux/mlx5/device.h:55:34: note: in expansion of macro '__mlx5_bit_off'
      55 | #define __mlx5_64_off(typ, fld) (__mlx5_bit_off(typ, fld) / 64)
         |                                  ^~~~~~~~~~~~~~
   include/linux/mlx5/device.h:121:63: note: in expansion of macro '__mlx5_64_off'
     121 | #define MLX5_GET64(typ, p, fld) be64_to_cpu(*((__be64 *)(p) + __mlx5_64_off(typ, fld)))
         |                                                               ^~~~~~~~~~~~~
   include/linux/mlx5/device.h:1406:9: note: in expansion of macro 'MLX5_GET64'
    1406 |         MLX5_GET64(device_mem_cap, mdev->caps.hca[MLX5_CAP_DEV_MEM]->cur, cap)
         |         ^~~~~~~~~~
   drivers/net/ethernet/mellanox/mlx5/core/lib/dm.c:192:34: note: in expansion of macro 'MLX5_CAP64_DEV_MEM'
     192 |                 icm_start_addr = MLX5_CAP64_DEV_MEM(dev,
         |                                  ^~~~~~~~~~~~~~~~~~
>> include/linux/stddef.h:16:33: error: 'struct mlx5_ifc_device_mem_cap_bits' has no member named 'log_indirect_encap_sw_icm_size'
      16 | #define offsetof(TYPE, MEMBER)  __builtin_offsetof(TYPE, MEMBER)
         |                                 ^~~~~~~~~~~~~~~~~~
   include/uapi/linux/byteorder/big_endian.h:41:51: note: in definition of macro '__be32_to_cpu'
      41 | #define __be32_to_cpu(x) ((__force __u32)(__be32)(x))
         |                                                   ^
   include/linux/mlx5/device.h:52:35: note: in expansion of macro 'offsetof'
      52 | #define __mlx5_bit_off(typ, fld) (offsetof(struct mlx5_ifc_##typ##_bits, fld))
         |                                   ^~~~~~~~
   include/linux/mlx5/device.h:54:34: note: in expansion of macro '__mlx5_bit_off'
      54 | #define __mlx5_dw_off(typ, fld) (__mlx5_bit_off(typ, fld) / 32)
         |                                  ^~~~~~~~~~~~~~
   include/linux/mlx5/device.h:97:1: note: in expansion of macro '__mlx5_dw_off'
      97 | __mlx5_dw_off(typ, fld))) >> __mlx5_dw_bit_off(typ, fld)) & \
         | ^~~~~~~~~~~~~
   include/linux/mlx5/device.h:1403:9: note: in expansion of macro 'MLX5_GET'
    1403 |         MLX5_GET(device_mem_cap, mdev->caps.hca[MLX5_CAP_DEV_MEM]->cur, cap)
         |         ^~~~~~~~
   drivers/net/ethernet/mellanox/mlx5/core/lib/dm.c:194:32: note: in expansion of macro 'MLX5_CAP_DEV_MEM'
     194 |                 log_icm_size = MLX5_CAP_DEV_MEM(dev,
         |                                ^~~~~~~~~~~~~~~~
>> include/linux/mlx5/device.h:51:57: error: 'struct mlx5_ifc_device_mem_cap_bits' has no member named 'log_indirect_encap_sw_icm_size'
      51 | #define __mlx5_bit_sz(typ, fld) sizeof(__mlx5_nullp(typ)->fld)
         |                                                         ^~
   include/linux/mlx5/device.h:57:43: note: in expansion of macro '__mlx5_bit_sz'
      57 | #define __mlx5_dw_bit_off(typ, fld) (32 - __mlx5_bit_sz(typ, fld) - (__mlx5_bit_off(typ, fld) & 0x1f))
         |                                           ^~~~~~~~~~~~~
   include/linux/mlx5/device.h:97:30: note: in expansion of macro '__mlx5_dw_bit_off'
      97 | __mlx5_dw_off(typ, fld))) >> __mlx5_dw_bit_off(typ, fld)) & \
         |                              ^~~~~~~~~~~~~~~~~
   include/linux/mlx5/device.h:1403:9: note: in expansion of macro 'MLX5_GET'
    1403 |         MLX5_GET(device_mem_cap, mdev->caps.hca[MLX5_CAP_DEV_MEM]->cur, cap)
         |         ^~~~~~~~
   drivers/net/ethernet/mellanox/mlx5/core/lib/dm.c:194:32: note: in expansion of macro 'MLX5_CAP_DEV_MEM'
     194 |                 log_icm_size = MLX5_CAP_DEV_MEM(dev,
         |                                ^~~~~~~~~~~~~~~~
>> include/linux/stddef.h:16:33: error: 'struct mlx5_ifc_device_mem_cap_bits' has no member named 'log_indirect_encap_sw_icm_size'
      16 | #define offsetof(TYPE, MEMBER)  __builtin_offsetof(TYPE, MEMBER)
         |                                 ^~~~~~~~~~~~~~~~~~
   include/linux/mlx5/device.h:52:35: note: in expansion of macro 'offsetof'
      52 | #define __mlx5_bit_off(typ, fld) (offsetof(struct mlx5_ifc_##typ##_bits, fld))
         |                                   ^~~~~~~~
   include/linux/mlx5/device.h:57:70: note: in expansion of macro '__mlx5_bit_off'
      57 | #define __mlx5_dw_bit_off(typ, fld) (32 - __mlx5_bit_sz(typ, fld) - (__mlx5_bit_off(typ, fld) & 0x1f))
         |                                                                      ^~~~~~~~~~~~~~
   include/linux/mlx5/device.h:97:30: note: in expansion of macro '__mlx5_dw_bit_off'
      97 | __mlx5_dw_off(typ, fld))) >> __mlx5_dw_bit_off(typ, fld)) & \
         |                              ^~~~~~~~~~~~~~~~~
   include/linux/mlx5/device.h:1403:9: note: in expansion of macro 'MLX5_GET'
    1403 |         MLX5_GET(device_mem_cap, mdev->caps.hca[MLX5_CAP_DEV_MEM]->cur, cap)
         |         ^~~~~~~~
   drivers/net/ethernet/mellanox/mlx5/core/lib/dm.c:194:32: note: in expansion of macro 'MLX5_CAP_DEV_MEM'
     194 |                 log_icm_size = MLX5_CAP_DEV_MEM(dev,
         |                                ^~~~~~~~~~~~~~~~
>> include/linux/mlx5/device.h:51:57: error: 'struct mlx5_ifc_device_mem_cap_bits' has no member named 'log_indirect_encap_sw_icm_size'
      51 | #define __mlx5_bit_sz(typ, fld) sizeof(__mlx5_nullp(typ)->fld)
         |                                                         ^~
   include/linux/mlx5/device.h:58:47: note: in expansion of macro '__mlx5_bit_sz'
      58 | #define __mlx5_mask(typ, fld) ((u32)((1ull << __mlx5_bit_sz(typ, fld)) - 1))
         |                                               ^~~~~~~~~~~~~
   include/linux/mlx5/device.h:98:1: note: in expansion of macro '__mlx5_mask'
      98 | __mlx5_mask(typ, fld))
         | ^~~~~~~~~~~
   include/linux/mlx5/device.h:1403:9: note: in expansion of macro 'MLX5_GET'
    1403 |         MLX5_GET(device_mem_cap, mdev->caps.hca[MLX5_CAP_DEV_MEM]->cur, cap)
         |         ^~~~~~~~
   drivers/net/ethernet/mellanox/mlx5/core/lib/dm.c:194:32: note: in expansion of macro 'MLX5_CAP_DEV_MEM'
     194 |                 log_icm_size = MLX5_CAP_DEV_MEM(dev,
         |                                ^~~~~~~~~~~~~~~~
   drivers/net/ethernet/mellanox/mlx5/core/lib/dm.c: In function 'mlx5_dm_sw_icm_dealloc':
   drivers/net/ethernet/mellanox/mlx5/core/lib/dm.c:276:14: error: 'MLX5_SW_ICM_TYPE_SW_ENCAP' undeclared (first use in this function); did you mean 'MLX5_SW_ICM_TYPE_STEERING'?
     276 |         case MLX5_SW_ICM_TYPE_SW_ENCAP:
         |              ^~~~~~~~~~~~~~~~~~~~~~~~~
         |              MLX5_SW_ICM_TYPE_STEERING
   drivers/net/ethernet/mellanox/mlx5/core/lib/dm.c:278:53: error: 'struct mlx5_ifc_device_mem_cap_bits' has no member named 'indirect_encap_sw_icm_start_address'; did you mean 'steering_sw_icm_start_address'?
     278 |                                                     indirect_encap_sw_icm_start_address);
         |                                                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/uapi/linux/byteorder/big_endian.h:39:51: note: in definition of macro '__be64_to_cpu'
      39 | #define __be64_to_cpu(x) ((__force __u64)(__be64)(x))
         |                                                   ^
   include/linux/mlx5/device.h:52:35: note: in expansion of macro 'offsetof'
      52 | #define __mlx5_bit_off(typ, fld) (offsetof(struct mlx5_ifc_##typ##_bits, fld))
         |                                   ^~~~~~~~
   include/linux/mlx5/device.h:55:34: note: in expansion of macro '__mlx5_bit_off'
      55 | #define __mlx5_64_off(typ, fld) (__mlx5_bit_off(typ, fld) / 64)
         |                                  ^~~~~~~~~~~~~~
   include/linux/mlx5/device.h:121:63: note: in expansion of macro '__mlx5_64_off'
     121 | #define MLX5_GET64(typ, p, fld) be64_to_cpu(*((__be64 *)(p) + __mlx5_64_off(typ, fld)))
         |                                                               ^~~~~~~~~~~~~
   include/linux/mlx5/device.h:1406:9: note: in expansion of macro 'MLX5_GET64'
    1406 |         MLX5_GET64(device_mem_cap, mdev->caps.hca[MLX5_CAP_DEV_MEM]->cur, cap)
         |         ^~~~~~~~~~
   drivers/net/ethernet/mellanox/mlx5/core/lib/dm.c:277:34: note: in expansion of macro 'MLX5_CAP64_DEV_MEM'
     277 |                 icm_start_addr = MLX5_CAP64_DEV_MEM(dev,
         |                                  ^~~~~~~~~~~~~~~~~~


vim +16 include/linux/stddef.h

6e21828743247270 Richard Knutsson 2006-09-30  14  
^1da177e4c3f4152 Linus Torvalds   2005-04-16  15  #undef offsetof
14e83077d55ff4b8 Rasmus Villemoes 2022-03-23 @16  #define offsetof(TYPE, MEMBER)	__builtin_offsetof(TYPE, MEMBER)
3876488444e71238 Denys Vlasenko   2015-03-09  17  

:::::: The code at line 16 was first introduced by commit
:::::: 14e83077d55ff4b88fe39f5e98fb8230c2ccb4fb include: drop pointless __compiler_offsetof indirection

:::::: TO: Rasmus Villemoes <linux@rasmusvillemoes.dk>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
