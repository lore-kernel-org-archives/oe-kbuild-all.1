Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B37B938BF73
	for <oe-kbuild-all@lists.linux.dev>; Wed,  4 Feb 2026 07:20:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770189613; cv=none; b=r1XC10fAV3MZrZK+xqMz/c5pm2oWs3O7A2e++cD6YRGtTkJ50KSZ9VJaEkp03cqjPJdCRMeXgPOj77QsCrBv2+eZl8uyXsHUfOf4U/CobA2ciudGWnQpWsxWLXFoHFhiqpjdsT06X3Zei7LO6MPxmmiiF5lxknCWsaydN4yfrdk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770189613; c=relaxed/simple;
	bh=4dux5UmJOQD9Vf+9fqvPLEr3XJhYGLA9uyPCnLFBJvY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=sY789wPvs+ZdzB1nZK/56PHqTsZDZ29P7JgaBJy0Npw4/u4ZzOJjpXvwPl9Mq4cIvHsZ4UG1mpzwOowowyylJbCFz0gtA/ySJ1vkqs+nZqZIco4Uq2ASEHoroIB9itGR3Q3hVvmdkKm51tUI8HKWAV0C6ZFEXG/kZzvqHvqk3Hs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FkYIJD+U; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FkYIJD+U"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770189612; x=1801725612;
  h=date:from:to:cc:subject:message-id;
  bh=4dux5UmJOQD9Vf+9fqvPLEr3XJhYGLA9uyPCnLFBJvY=;
  b=FkYIJD+UsvyF493tGhYNbQZ8402/aXA/D7KU5igHSH+KJ/S1pDLwiTAu
   RTH+TlDRKX/ZE4W0DwNNRRpeThBbNFqFvbInYjcJhPcHo3dNK2DRZZ0Up
   OS2r1C5frDc6fbhu0OdCN2aUNF9avJZddOMwN1bVA9eucpIgwgrLP7fDq
   dzcT9HblbgKNtxIDncuxfdMrfROCKHqtApz5ui27nDxOhRaxlyrpw99oJ
   ZRgYlxoBSkR/G9CKECVqjjnGXDn6E27nr/wnnaKjPT6UD3XkoxLgldt7C
   eatnEnbIsdB5jcKLJu81fo+UylWLN6KH/jzEWPoXy6cht5KXBS0yf14uI
   A==;
X-CSE-ConnectionGUID: 5e1841D7SGuciL7bw69R/w==
X-CSE-MsgGUID: DRqdkCnYTrqqIQ/uY4nBVg==
X-IronPort-AV: E=McAfee;i="6800,10657,11691"; a="71097379"
X-IronPort-AV: E=Sophos;i="6.21,272,1763452800"; 
   d="scan'208";a="71097379"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Feb 2026 23:20:12 -0800
X-CSE-ConnectionGUID: SZruVSUGSVKx31sX06iJdw==
X-CSE-MsgGUID: iHg32OyzR0uL8UFmuyrmBg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,272,1763452800"; 
   d="scan'208";a="214569016"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 03 Feb 2026 23:20:10 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vnXBI-00000000hY0-1lhB;
	Wed, 04 Feb 2026 07:20:08 +0000
Date: Wed, 04 Feb 2026 15:19:33 +0800
From: kernel test robot <lkp@intel.com>
To: Yury Norov <yury.norov@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [norov:prtpbf 9/12]
 drivers/fpga/intel-m10-bmc-sec-update.c:186:24: error: call to undeclared
 function 'rest_of_page'; ISO C99 and later do not support implicit function
 declarations
Message-ID: <202602041503.f2KnEqes-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/norov/linux prtpbf
head:   7ce80be35d0b91a2cf3294261a9482f668394edc
commit: e5419ab54092eb719d6a817698572b46fef4c05a [9/12] fpga: m10bmc-sec: switch show_canceled_csk() to using scnprintf()
config: riscv-randconfig-002-20260204 (https://download.01.org/0day-ci/archive/20260204/202602041503.f2KnEqes-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 9b8addffa70cee5b2acc5454712d9cf78ce45710)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260204/202602041503.f2KnEqes-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602041503.f2KnEqes-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/fpga/intel-m10-bmc-sec-update.c:11:
   In file included from include/linux/mfd/intel-m10-bmc.h:13:
   In file included from include/linux/regmap.h:20:
   In file included from include/linux/iopoll.h:14:
   In file included from include/linux/io.h:12:
   In file included from arch/riscv/include/asm/io.h:140:
   include/asm-generic/io.h:838:2: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     838 |         insb(addr, buffer, count);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~
   arch/riscv/include/asm/io.h:108:53: note: expanded from macro 'insb'
     108 | #define insb(addr, buffer, count) __insb(PCI_IOBASE + (addr), buffer, count)
         |                                          ~~~~~~~~~~ ^
   In file included from drivers/fpga/intel-m10-bmc-sec-update.c:11:
   In file included from include/linux/mfd/intel-m10-bmc.h:13:
   In file included from include/linux/regmap.h:20:
   In file included from include/linux/iopoll.h:14:
   In file included from include/linux/io.h:12:
   In file included from arch/riscv/include/asm/io.h:140:
   include/asm-generic/io.h:846:2: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     846 |         insw(addr, buffer, count);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~
   arch/riscv/include/asm/io.h:109:53: note: expanded from macro 'insw'
     109 | #define insw(addr, buffer, count) __insw(PCI_IOBASE + (addr), buffer, count)
         |                                          ~~~~~~~~~~ ^
   In file included from drivers/fpga/intel-m10-bmc-sec-update.c:11:
   In file included from include/linux/mfd/intel-m10-bmc.h:13:
   In file included from include/linux/regmap.h:20:
   In file included from include/linux/iopoll.h:14:
   In file included from include/linux/io.h:12:
   In file included from arch/riscv/include/asm/io.h:140:
   include/asm-generic/io.h:854:2: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     854 |         insl(addr, buffer, count);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~
   arch/riscv/include/asm/io.h:110:53: note: expanded from macro 'insl'
     110 | #define insl(addr, buffer, count) __insl(PCI_IOBASE + (addr), buffer, count)
         |                                          ~~~~~~~~~~ ^
   In file included from drivers/fpga/intel-m10-bmc-sec-update.c:11:
   In file included from include/linux/mfd/intel-m10-bmc.h:13:
   In file included from include/linux/regmap.h:20:
   In file included from include/linux/iopoll.h:14:
   In file included from include/linux/io.h:12:
   In file included from arch/riscv/include/asm/io.h:140:
   include/asm-generic/io.h:863:2: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     863 |         outsb(addr, buffer, count);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/riscv/include/asm/io.h:122:55: note: expanded from macro 'outsb'
     122 | #define outsb(addr, buffer, count) __outsb(PCI_IOBASE + (addr), buffer, count)
         |                                            ~~~~~~~~~~ ^
   In file included from drivers/fpga/intel-m10-bmc-sec-update.c:11:
   In file included from include/linux/mfd/intel-m10-bmc.h:13:
   In file included from include/linux/regmap.h:20:
   In file included from include/linux/iopoll.h:14:
   In file included from include/linux/io.h:12:
   In file included from arch/riscv/include/asm/io.h:140:
   include/asm-generic/io.h:872:2: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     872 |         outsw(addr, buffer, count);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/riscv/include/asm/io.h:123:55: note: expanded from macro 'outsw'
     123 | #define outsw(addr, buffer, count) __outsw(PCI_IOBASE + (addr), buffer, count)
         |                                            ~~~~~~~~~~ ^
   In file included from drivers/fpga/intel-m10-bmc-sec-update.c:11:
   In file included from include/linux/mfd/intel-m10-bmc.h:13:
   In file included from include/linux/regmap.h:20:
   In file included from include/linux/iopoll.h:14:
   In file included from include/linux/io.h:12:
   In file included from arch/riscv/include/asm/io.h:140:
   include/asm-generic/io.h:881:2: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     881 |         outsl(addr, buffer, count);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/riscv/include/asm/io.h:124:55: note: expanded from macro 'outsl'
     124 | #define outsl(addr, buffer, count) __outsl(PCI_IOBASE + (addr), buffer, count)
         |                                            ~~~~~~~~~~ ^
   In file included from drivers/fpga/intel-m10-bmc-sec-update.c:11:
   In file included from include/linux/mfd/intel-m10-bmc.h:13:
   In file included from include/linux/regmap.h:20:
   In file included from include/linux/iopoll.h:14:
   In file included from include/linux/io.h:12:
   In file included from arch/riscv/include/asm/io.h:140:
   include/asm-generic/io.h:1209:55: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    1209 |         return (port > MMIO_UPPER_LIMIT) ? NULL : PCI_IOBASE + port;
         |                                                   ~~~~~~~~~~ ^
>> drivers/fpga/intel-m10-bmc-sec-update.c:186:24: error: call to undeclared function 'rest_of_page'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     186 |         return scnprintf(buf, rest_of_page(buf), "%*pbl\n", CSK_BIT_LEN, csk_map);
         |                               ^
   7 warnings and 1 error generated.


vim +/rest_of_page +186 drivers/fpga/intel-m10-bmc-sec-update.c

  > 11	#include <linux/mfd/intel-m10-bmc.h>
    12	#include <linux/mod_devicetable.h>
    13	#include <linux/module.h>
    14	#include <linux/platform_device.h>
    15	#include <linux/slab.h>
    16	
    17	struct m10bmc_sec;
    18	
    19	struct m10bmc_sec_ops {
    20		int (*rsu_status)(struct m10bmc_sec *sec);
    21	};
    22	
    23	struct m10bmc_sec {
    24		struct device *dev;
    25		struct intel_m10bmc *m10bmc;
    26		struct fw_upload *fwl;
    27		char *fw_name;
    28		u32 fw_name_id;
    29		bool cancel_request;
    30		const struct m10bmc_sec_ops *ops;
    31	};
    32	
    33	static DEFINE_XARRAY_ALLOC(fw_upload_xa);
    34	
    35	/* Root Entry Hash (REH) support */
    36	#define REH_SHA256_SIZE		32
    37	#define REH_SHA384_SIZE		48
    38	#define REH_MAGIC		GENMASK(15, 0)
    39	#define REH_SHA_NUM_BYTES	GENMASK(31, 16)
    40	
    41	static int m10bmc_sec_write(struct m10bmc_sec *sec, const u8 *buf, u32 offset, u32 size)
    42	{
    43		struct intel_m10bmc *m10bmc = sec->m10bmc;
    44		unsigned int stride = regmap_get_reg_stride(m10bmc->regmap);
    45		u32 write_count = size / stride;
    46		u32 leftover_offset = write_count * stride;
    47		u32 leftover_size = size - leftover_offset;
    48		u32 leftover_tmp = 0;
    49		int ret;
    50	
    51		if (sec->m10bmc->flash_bulk_ops)
    52			return sec->m10bmc->flash_bulk_ops->write(m10bmc, buf, offset, size);
    53	
    54		if (WARN_ON_ONCE(stride > sizeof(leftover_tmp)))
    55			return -EINVAL;
    56	
    57		ret = regmap_bulk_write(m10bmc->regmap, M10BMC_STAGING_BASE + offset,
    58					buf + offset, write_count);
    59		if (ret)
    60			return ret;
    61	
    62		/* If size is not aligned to stride, handle the remainder bytes with regmap_write() */
    63		if (leftover_size) {
    64			memcpy(&leftover_tmp, buf + leftover_offset, leftover_size);
    65			ret = regmap_write(m10bmc->regmap, M10BMC_STAGING_BASE + offset + leftover_offset,
    66					   leftover_tmp);
    67			if (ret)
    68				return ret;
    69		}
    70	
    71		return 0;
    72	}
    73	
    74	static int m10bmc_sec_read(struct m10bmc_sec *sec, u8 *buf, u32 addr, u32 size)
    75	{
    76		struct intel_m10bmc *m10bmc = sec->m10bmc;
    77		unsigned int stride = regmap_get_reg_stride(m10bmc->regmap);
    78		u32 read_count = size / stride;
    79		u32 leftover_offset = read_count * stride;
    80		u32 leftover_size = size - leftover_offset;
    81		u32 leftover_tmp;
    82		int ret;
    83	
    84		if (sec->m10bmc->flash_bulk_ops)
    85			return sec->m10bmc->flash_bulk_ops->read(m10bmc, buf, addr, size);
    86	
    87		if (WARN_ON_ONCE(stride > sizeof(leftover_tmp)))
    88			return -EINVAL;
    89	
    90		ret = regmap_bulk_read(m10bmc->regmap, addr, buf, read_count);
    91		if (ret)
    92			return ret;
    93	
    94		/* If size is not aligned to stride, handle the remainder bytes with regmap_read() */
    95		if (leftover_size) {
    96			ret = regmap_read(m10bmc->regmap, addr + leftover_offset, &leftover_tmp);
    97			if (ret)
    98				return ret;
    99			memcpy(buf + leftover_offset, &leftover_tmp, leftover_size);
   100		}
   101	
   102		return 0;
   103	}
   104	
   105	
   106	static ssize_t
   107	show_root_entry_hash(struct device *dev, u32 exp_magic,
   108			     u32 prog_addr, u32 reh_addr, char *buf)
   109	{
   110		struct m10bmc_sec *sec = dev_get_drvdata(dev);
   111		int sha_num_bytes, i, ret, cnt = 0;
   112		u8 hash[REH_SHA384_SIZE];
   113		u32 magic;
   114	
   115		ret = m10bmc_sec_read(sec, (u8 *)&magic, prog_addr, sizeof(magic));
   116		if (ret)
   117			return ret;
   118	
   119		if (FIELD_GET(REH_MAGIC, magic) != exp_magic)
   120			return sysfs_emit(buf, "hash not programmed\n");
   121	
   122		sha_num_bytes = FIELD_GET(REH_SHA_NUM_BYTES, magic) / 8;
   123		if (sha_num_bytes != REH_SHA256_SIZE &&
   124		    sha_num_bytes != REH_SHA384_SIZE) {
   125			dev_err(sec->dev, "%s bad sha num bytes %d\n", __func__,
   126				sha_num_bytes);
   127			return -EINVAL;
   128		}
   129	
   130		ret = m10bmc_sec_read(sec, hash, reh_addr, sha_num_bytes);
   131		if (ret) {
   132			dev_err(dev, "failed to read root entry hash\n");
   133			return ret;
   134		}
   135	
   136		for (i = 0; i < sha_num_bytes; i++)
   137			cnt += sprintf(buf + cnt, "%02x", hash[i]);
   138		cnt += sprintf(buf + cnt, "\n");
   139	
   140		return cnt;
   141	}
   142	
   143	#define DEVICE_ATTR_SEC_REH_RO(_name)						\
   144	static ssize_t _name##_root_entry_hash_show(struct device *dev, \
   145						    struct device_attribute *attr, \
   146						    char *buf) \
   147	{										\
   148		struct m10bmc_sec *sec = dev_get_drvdata(dev);				\
   149		const struct m10bmc_csr_map *csr_map = sec->m10bmc->info->csr_map;	\
   150											\
   151		return show_root_entry_hash(dev, csr_map->_name##_magic,		\
   152					    csr_map->_name##_prog_addr,			\
   153					    csr_map->_name##_reh_addr,			\
   154					    buf);					\
   155	}										\
   156	static DEVICE_ATTR_RO(_name##_root_entry_hash)
   157	
   158	DEVICE_ATTR_SEC_REH_RO(bmc);
   159	DEVICE_ATTR_SEC_REH_RO(sr);
   160	DEVICE_ATTR_SEC_REH_RO(pr);
   161	
   162	#define CSK_BIT_LEN		128U
   163	#define CSK_32ARRAY_SIZE	DIV_ROUND_UP(CSK_BIT_LEN, 32)
   164	
   165	static ssize_t
   166	show_canceled_csk(struct device *dev, u32 addr, char *buf)
   167	{
   168		unsigned int i, size = CSK_32ARRAY_SIZE * sizeof(u32);
   169		struct m10bmc_sec *sec = dev_get_drvdata(dev);
   170		DECLARE_BITMAP(csk_map, CSK_BIT_LEN);
   171		__le32 csk_le32[CSK_32ARRAY_SIZE];
   172		u32 csk32[CSK_32ARRAY_SIZE];
   173		int ret;
   174	
   175		ret = m10bmc_sec_read(sec, (u8 *)&csk_le32, addr, size);
   176		if (ret) {
   177			dev_err(sec->dev, "failed to read CSK vector\n");
   178			return ret;
   179		}
   180	
   181		for (i = 0; i < CSK_32ARRAY_SIZE; i++)
   182			csk32[i] = le32_to_cpu(((csk_le32[i])));
   183	
   184		bitmap_from_arr32(csk_map, csk32, CSK_BIT_LEN);
   185		bitmap_complement(csk_map, csk_map, CSK_BIT_LEN);
 > 186		return scnprintf(buf, rest_of_page(buf), "%*pbl\n", CSK_BIT_LEN, csk_map);
   187	}
   188	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
