Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBA6B2C21DF
	for <oe-kbuild-all@lists.linux.dev>; Sat, 20 Dec 2025 17:48:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766252918; cv=none; b=ClpFx+f30Ggip5gwYslENkzydeyfR1Eef9fnMYbsonprqHT8LNrHb46jJ63xT/tA2nUBgdedi2s2khzWUYFtw4Dl0CE2AcuyUL32hs/cFwOxG4NdmoaTU5oaQY0CuROOfcCv5QmG8frWyMBnLdHL2YR2iSciC8DdNb78bG0SnYo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766252918; c=relaxed/simple;
	bh=EmnBmBTi/8paiZjyJ8ykdAfFJJ6P/9go0RGJIg/foK8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=QUAzmanWJXEWIFJyqXunebZRvTVYwkGOzWofucVVpqEUhV6NC2t5HaBpI+gcWcKX9QuY6rRbHq4R7XzkmNo2d1tBlI0Pc0f6lIUEo5h8qQH2DB34On7sBGMJXWzSEav5voMGayElchHhfLdXrs4vrSRN3Xy7nmyKgCrBDpjTpFM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FoPQqDjW; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FoPQqDjW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766252916; x=1797788916;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=EmnBmBTi/8paiZjyJ8ykdAfFJJ6P/9go0RGJIg/foK8=;
  b=FoPQqDjWxStZG7znaIIumsE9cRzqD3ovsvmd18wL3FiiVvLPd3m6i3c9
   eEqw8zAGRKnGDvLvPzj+Rg2nj7r8nMR34X16GBmEB/2x0f3J5ooK3VqW/
   zvY0sRWf7ZW7Nv9D9UavBJsZnNzTeBxyMglI8ON+A2WFEIoF50jzBkP1v
   FS+cs4QoppwkyOkHXS3qTG9ODc89dHohfkwA2a248QLC7MIYTBp5TTuLu
   5m7QFRuSTZ1AA/HI9B/KqdfGw4IR8UnxpuKhmi5dojvApUb/ExErWAjxu
   iqXK1g1BVCV70968+0+u82jx069HmUUzLhKVEN470vPz9c2gqwvIEHo9Q
   A==;
X-CSE-ConnectionGUID: yUU9lUdgThCIxA78uIpuWw==
X-CSE-MsgGUID: ymSxM6CdS+aGEo91CUnTGw==
X-IronPort-AV: E=McAfee;i="6800,10657,11648"; a="70751775"
X-IronPort-AV: E=Sophos;i="6.21,164,1763452800"; 
   d="scan'208";a="70751775"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Dec 2025 09:48:35 -0800
X-CSE-ConnectionGUID: o6m88LtaRX6IcEBXlh6cRA==
X-CSE-MsgGUID: yeXgWORES0GWLzyw9sJxKg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,164,1763452800"; 
   d="scan'208";a="198894024"
Received: from lkp-server01.sh.intel.com (HELO 0d09efa1b85f) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 20 Dec 2025 09:48:34 -0800
Received: from kbuild by 0d09efa1b85f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vX14B-000000004yD-2Q5b;
	Sat, 20 Dec 2025 17:48:31 +0000
Date: Sun, 21 Dec 2025 01:47:52 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Shuai Wu <wushuai51@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 3547/3547]
 drivers/net/ethernet/huawei/hinic3/cqm/cqm_main.c:1159:6: warning: '%s'
 directive output may be truncated writing up to 63 bytes into a region of
 size 15
Message-ID: <202512210108.l9B1EKna-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   04473ee9ed912a16fff0d8846ad565bbf3d63c77
commit: 4213ff7957de370c1cfe528c2bad1eb2e499038a [3547/3547] net/ethernet/huawei/hinic3: Add the CQM on which the RDMA depends
config: arm64-randconfig-003-20251216 (https://download.01.org/0day-ci/archive/20251221/202512210108.l9B1EKna-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 10.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251221/202512210108.l9B1EKna-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512210108.l9B1EKna-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/net/ethernet/huawei/hinic3/cqm/cqm_main.c: In function 'cqm_mem_init':
>> drivers/net/ethernet/huawei/hinic3/cqm/cqm_main.c:1159:6: warning: '%s' directive output may be truncated writing up to 63 bytes into a region of size 15 [-Wformat-truncation=]
    1159 |     "%s%s%02u", cqm_handle->name, VRAM_CQM_FAKE_MEM_BASE, i);
         |      ^~
   drivers/net/ethernet/huawei/hinic3/cqm/cqm_main.c:1159:5: note: directive argument in the range [0, 4294967293]
    1159 |     "%s%s%02u", cqm_handle->name, VRAM_CQM_FAKE_MEM_BASE, i);
         |     ^~~~~~~~~~
   drivers/net/ethernet/huawei/hinic3/cqm/cqm_main.c:1158:3: note: 'snprintf' output between 5 and 76 bytes into a destination of size 15
    1158 |   snprintf(fake_cqm_handle->name, VRAM_NAME_MAX_LEN - 1,
         |   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    1159 |     "%s%s%02u", cqm_handle->name, VRAM_CQM_FAKE_MEM_BASE, i);
         |     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
--
   drivers/net/ethernet/huawei/hinic3/cqm/cqm_bat_cla.c: In function 'cqm_cla_xyz':
>> drivers/net/ethernet/huawei/hinic3/cqm/cqm_bat_cla.c:893:28: warning: '%s' directive output may be truncated writing up to 63 bytes into a region of size 15 [-Wformat-truncation=]
     893 |    VRAM_NAME_MAX_LEN - 1, "%s%s", cla_table->name, VRAM_CQM_CLA_COORD_X);
         |                            ^~
   drivers/net/ethernet/huawei/hinic3/cqm/cqm_bat_cla.c:892:2: note: 'snprintf' output between 2 and 65 bytes into a destination of size 15
     892 |  snprintf(cla_x_buf->buf_info.buf_vram_name,
         |  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     893 |    VRAM_NAME_MAX_LEN - 1, "%s%s", cla_table->name, VRAM_CQM_CLA_COORD_X);
         |    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/huawei/hinic3/cqm/cqm_bat_cla.c:896:28: warning: '%s' directive output may be truncated writing up to 63 bytes into a region of size 15 [-Wformat-truncation=]
     896 |    VRAM_NAME_MAX_LEN - 1, "%s%s", cla_table->name, VRAM_CQM_CLA_COORD_Y);
         |                            ^~
   drivers/net/ethernet/huawei/hinic3/cqm/cqm_bat_cla.c:895:2: note: 'snprintf' output between 2 and 65 bytes into a destination of size 15
     895 |  snprintf(cla_y_buf->buf_info.buf_vram_name,
         |  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     896 |    VRAM_NAME_MAX_LEN - 1, "%s%s", cla_table->name, VRAM_CQM_CLA_COORD_Y);
         |    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/huawei/hinic3/cqm/cqm_bat_cla.c:899:28: warning: '%s' directive output may be truncated writing up to 63 bytes into a region of size 15 [-Wformat-truncation=]
     899 |    VRAM_NAME_MAX_LEN - 1, "%s%s", cla_table->name, VRAM_CQM_CLA_COORD_Z);
         |                            ^~
   drivers/net/ethernet/huawei/hinic3/cqm/cqm_bat_cla.c:898:2: note: 'snprintf' output between 2 and 65 bytes into a destination of size 15
     898 |  snprintf(cla_z_buf->buf_info.buf_vram_name,
         |  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     899 |    VRAM_NAME_MAX_LEN - 1, "%s%s", cla_table->name, VRAM_CQM_CLA_COORD_Z);
         |    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/huawei/hinic3/cqm/cqm_bat_cla.c: In function 'cqm_cla_init_entry':
   drivers/net/ethernet/huawei/hinic3/cqm/cqm_bat_cla.c:1297:6: warning: '%s' directive output may be truncated writing up to 63 bytes into a region of size 15 [-Wformat-truncation=]
    1297 |     "%s%s%s%02u", cqm_handle->name, VRAM_CQM_CLA_BASE,
         |      ^~
   drivers/net/ethernet/huawei/hinic3/cqm/cqm_bat_cla.c:1296:3: note: 'snprintf' output between 5 and 76 bytes into a destination of size 15
    1296 |   snprintf(cla_table->name, VRAM_NAME_MAX_LEN - 1,
         |   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    1297 |     "%s%s%s%02u", cqm_handle->name, VRAM_CQM_CLA_BASE,
         |     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    1298 |     VRAM_CQM_CLA_TYPE_BASE, cla_table->type);
         |     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
--
   drivers/net/ethernet/huawei/hinic3/cqm/cqm_bitmap_table.c:51: warning: Function parameter or member 'addr' not described in 'cqm_swab64'
   drivers/net/ethernet/huawei/hinic3/cqm/cqm_bitmap_table.c:51: warning: Function parameter or member 'cnt' not described in 'cqm_swab64'
>> drivers/net/ethernet/huawei/hinic3/cqm/cqm_bitmap_table.c:51: warning: expecting prototype for Prototype(). Prototype was for cqm_swab64() instead
   drivers/net/ethernet/huawei/hinic3/cqm/cqm_bitmap_table.c:74: warning: Function parameter or member 'addr' not described in 'cqm_swab32'
   drivers/net/ethernet/huawei/hinic3/cqm/cqm_bitmap_table.c:74: warning: Function parameter or member 'cnt' not described in 'cqm_swab32'
>> drivers/net/ethernet/huawei/hinic3/cqm/cqm_bitmap_table.c:74: warning: expecting prototype for Prototype(). Prototype was for cqm_swab32() instead
   drivers/net/ethernet/huawei/hinic3/cqm/cqm_bitmap_table.c:96: warning: Function parameter or member 'data' not described in 'cqm_shift'
>> drivers/net/ethernet/huawei/hinic3/cqm/cqm_bitmap_table.c:96: warning: expecting prototype for Prototype(). Prototype was for cqm_shift() instead
   drivers/net/ethernet/huawei/hinic3/cqm/cqm_bitmap_table.c:119: warning: Function parameter or member 'data' not described in 'cqm_check_align'
>> drivers/net/ethernet/huawei/hinic3/cqm/cqm_bitmap_table.c:119: warning: expecting prototype for Prototype(). Prototype was for cqm_check_align() instead
   drivers/net/ethernet/huawei/hinic3/cqm/cqm_bitmap_table.c:155: warning: Function parameter or member 'size' not described in 'cqm_kmalloc_align'
   drivers/net/ethernet/huawei/hinic3/cqm/cqm_bitmap_table.c:155: warning: Function parameter or member 'flags' not described in 'cqm_kmalloc_align'
   drivers/net/ethernet/huawei/hinic3/cqm/cqm_bitmap_table.c:155: warning: Function parameter or member 'align_order' not described in 'cqm_kmalloc_align'
>> drivers/net/ethernet/huawei/hinic3/cqm/cqm_bitmap_table.c:155: warning: expecting prototype for Prototype(). Prototype was for cqm_kmalloc_align() instead
   drivers/net/ethernet/huawei/hinic3/cqm/cqm_bitmap_table.c:187: warning: Function parameter or member 'addr' not described in 'cqm_kfree_align'
>> drivers/net/ethernet/huawei/hinic3/cqm/cqm_bitmap_table.c:187: warning: expecting prototype for Prototype(). Prototype was for cqm_kfree_align() instead
   drivers/net/ethernet/huawei/hinic3/cqm/cqm_bitmap_table.c:474: warning: Function parameter or member 'cqm_handle' not described in 'cqm_buf_alloc'
   drivers/net/ethernet/huawei/hinic3/cqm/cqm_bitmap_table.c:474: warning: Function parameter or member 'buf' not described in 'cqm_buf_alloc'
   drivers/net/ethernet/huawei/hinic3/cqm/cqm_bitmap_table.c:474: warning: Function parameter or member 'direct' not described in 'cqm_buf_alloc'
>> drivers/net/ethernet/huawei/hinic3/cqm/cqm_bitmap_table.c:474: warning: expecting prototype for Prototype(). Prototype was for cqm_buf_alloc() instead
   drivers/net/ethernet/huawei/hinic3/cqm/cqm_bitmap_table.c:545: warning: Function parameter or member 'buf' not described in 'cqm_buf_free'
   drivers/net/ethernet/huawei/hinic3/cqm/cqm_bitmap_table.c:545: warning: Function parameter or member 'cqm_handle' not described in 'cqm_buf_free'
>> drivers/net/ethernet/huawei/hinic3/cqm/cqm_bitmap_table.c:545: warning: expecting prototype for Prototype(). Prototype was for cqm_buf_free() instead
   drivers/net/ethernet/huawei/hinic3/cqm/cqm_bitmap_table.c:771: warning: Function parameter or member 'bitmap' not described in 'cqm_single_bitmap_init'
>> drivers/net/ethernet/huawei/hinic3/cqm/cqm_bitmap_table.c:771: warning: expecting prototype for Prototype(). Prototype was for cqm_single_bitmap_init() instead
   drivers/net/ethernet/huawei/hinic3/cqm/cqm_bitmap_table.c:841: warning: Function parameter or member 'cqm_handle' not described in 'cqm_bitmap_init'
>> drivers/net/ethernet/huawei/hinic3/cqm/cqm_bitmap_table.c:841: warning: expecting prototype for Prototype(). Prototype was for cqm_bitmap_init() instead
   drivers/net/ethernet/huawei/hinic3/cqm/cqm_bitmap_table.c:937: warning: Function parameter or member 'cqm_handle' not described in 'cqm_bitmap_uninit'
>> drivers/net/ethernet/huawei/hinic3/cqm/cqm_bitmap_table.c:937: warning: expecting prototype for Prototype(). Prototype was for cqm_bitmap_uninit() instead
   drivers/net/ethernet/huawei/hinic3/cqm/cqm_bitmap_table.c:975: warning: Function parameter or member 'table' not described in 'cqm_bitmap_check_range'
   drivers/net/ethernet/huawei/hinic3/cqm/cqm_bitmap_table.c:975: warning: Function parameter or member 'step' not described in 'cqm_bitmap_check_range'
   drivers/net/ethernet/huawei/hinic3/cqm/cqm_bitmap_table.c:975: warning: Function parameter or member 'max_num' not described in 'cqm_bitmap_check_range'
   drivers/net/ethernet/huawei/hinic3/cqm/cqm_bitmap_table.c:975: warning: Function parameter or member 'begin' not described in 'cqm_bitmap_check_range'
   drivers/net/ethernet/huawei/hinic3/cqm/cqm_bitmap_table.c:975: warning: Function parameter or member 'count' not described in 'cqm_bitmap_check_range'
>> drivers/net/ethernet/huawei/hinic3/cqm/cqm_bitmap_table.c:975: warning: expecting prototype for Prototype(). Prototype was for cqm_bitmap_check_range() instead
   drivers/net/ethernet/huawei/hinic3/cqm/cqm_bitmap_table.c:1055: warning: Function parameter or member 'bitmap' not described in 'cqm_bitmap_alloc'
   drivers/net/ethernet/huawei/hinic3/cqm/cqm_bitmap_table.c:1055: warning: Function parameter or member 'step' not described in 'cqm_bitmap_alloc'
   drivers/net/ethernet/huawei/hinic3/cqm/cqm_bitmap_table.c:1055: warning: Function parameter or member 'count' not described in 'cqm_bitmap_alloc'
   drivers/net/ethernet/huawei/hinic3/cqm/cqm_bitmap_table.c:1055: warning: Function parameter or member 'update_last' not described in 'cqm_bitmap_alloc'
>> drivers/net/ethernet/huawei/hinic3/cqm/cqm_bitmap_table.c:1055: warning: expecting prototype for Prototype(). Prototype was for cqm_bitmap_alloc() instead
   drivers/net/ethernet/huawei/hinic3/cqm/cqm_bitmap_table.c:1108: warning: Function parameter or member 'bitmap' not described in 'cqm_bitmap_alloc_low2bit_align'
   drivers/net/ethernet/huawei/hinic3/cqm/cqm_bitmap_table.c:1108: warning: Function parameter or member 'low2bit' not described in 'cqm_bitmap_alloc_low2bit_align'
   drivers/net/ethernet/huawei/hinic3/cqm/cqm_bitmap_table.c:1108: warning: Function parameter or member 'update_last' not described in 'cqm_bitmap_alloc_low2bit_align'
>> drivers/net/ethernet/huawei/hinic3/cqm/cqm_bitmap_table.c:1108: warning: expecting prototype for Prototype(). Prototype was for cqm_bitmap_alloc_low2bit_align() instead
   drivers/net/ethernet/huawei/hinic3/cqm/cqm_bitmap_table.c:1154: warning: Function parameter or member 'bitmap' not described in 'cqm_bitmap_alloc_reserved'
   drivers/net/ethernet/huawei/hinic3/cqm/cqm_bitmap_table.c:1154: warning: Function parameter or member 'count' not described in 'cqm_bitmap_alloc_reserved'
   drivers/net/ethernet/huawei/hinic3/cqm/cqm_bitmap_table.c:1154: warning: Function parameter or member 'index' not described in 'cqm_bitmap_alloc_reserved'
>> drivers/net/ethernet/huawei/hinic3/cqm/cqm_bitmap_table.c:1154: warning: expecting prototype for Prototype(). Prototype was for cqm_bitmap_alloc_reserved() instead
   drivers/net/ethernet/huawei/hinic3/cqm/cqm_bitmap_table.c:1189: warning: Function parameter or member 'bitmap' not described in 'cqm_bitmap_free'
   drivers/net/ethernet/huawei/hinic3/cqm/cqm_bitmap_table.c:1189: warning: Function parameter or member 'index' not described in 'cqm_bitmap_free'
   drivers/net/ethernet/huawei/hinic3/cqm/cqm_bitmap_table.c:1189: warning: Function parameter or member 'count' not described in 'cqm_bitmap_free'
>> drivers/net/ethernet/huawei/hinic3/cqm/cqm_bitmap_table.c:1189: warning: expecting prototype for Prototype(). Prototype was for cqm_bitmap_free() instead
   drivers/net/ethernet/huawei/hinic3/cqm/cqm_bitmap_table.c:1212: warning: Function parameter or member 'obj_table' not described in 'cqm_single_object_table_init'
>> drivers/net/ethernet/huawei/hinic3/cqm/cqm_bitmap_table.c:1212: warning: expecting prototype for Prototype(). Prototype was for cqm_single_object_table_init() instead
   drivers/net/ethernet/huawei/hinic3/cqm/cqm_bitmap_table.c:1232: warning: Function parameter or member 'cqm_handle' not described in 'cqm_object_table_init'
>> drivers/net/ethernet/huawei/hinic3/cqm/cqm_bitmap_table.c:1232: warning: expecting prototype for Prototype(). Prototype was for cqm_object_table_init() instead
   drivers/net/ethernet/huawei/hinic3/cqm/cqm_bitmap_table.c:1299: warning: Function parameter or member 'cqm_handle' not described in 'cqm_object_table_uninit'
>> drivers/net/ethernet/huawei/hinic3/cqm/cqm_bitmap_table.c:1299: warning: expecting prototype for Prototype(). Prototype was for cqm_object_table_uninit() instead
   drivers/net/ethernet/huawei/hinic3/cqm/cqm_bitmap_table.c:1334: warning: Function parameter or member 'cqm_handle' not described in 'cqm_object_table_insert'
   drivers/net/ethernet/huawei/hinic3/cqm/cqm_bitmap_table.c:1334: warning: Function parameter or member 'object_table' not described in 'cqm_object_table_insert'
   drivers/net/ethernet/huawei/hinic3/cqm/cqm_bitmap_table.c:1334: warning: Function parameter or member 'index' not described in 'cqm_object_table_insert'
   drivers/net/ethernet/huawei/hinic3/cqm/cqm_bitmap_table.c:1334: warning: Function parameter or member 'obj' not described in 'cqm_object_table_insert'
   drivers/net/ethernet/huawei/hinic3/cqm/cqm_bitmap_table.c:1334: warning: Function parameter or member 'bh' not described in 'cqm_object_table_insert'
>> drivers/net/ethernet/huawei/hinic3/cqm/cqm_bitmap_table.c:1334: warning: expecting prototype for Prototype(). Prototype was for cqm_object_table_insert() instead
   drivers/net/ethernet/huawei/hinic3/cqm/cqm_bitmap_table.c:1376: warning: Function parameter or member 'cqm_handle' not described in 'cqm_object_table_remove'
   drivers/net/ethernet/huawei/hinic3/cqm/cqm_bitmap_table.c:1376: warning: Function parameter or member 'object_table' not described in 'cqm_object_table_remove'
   drivers/net/ethernet/huawei/hinic3/cqm/cqm_bitmap_table.c:1376: warning: Function parameter or member 'index' not described in 'cqm_object_table_remove'
   drivers/net/ethernet/huawei/hinic3/cqm/cqm_bitmap_table.c:1376: warning: Function parameter or member 'obj' not described in 'cqm_object_table_remove'
   drivers/net/ethernet/huawei/hinic3/cqm/cqm_bitmap_table.c:1376: warning: Function parameter or member 'bh' not described in 'cqm_object_table_remove'
   drivers/net/ethernet/huawei/hinic3/cqm/cqm_bitmap_table.c:1376: warning: expecting prototype for Prototype(). Prototype was for cqm_object_table_remove() instead
   drivers/net/ethernet/huawei/hinic3/cqm/cqm_bitmap_table.c:1413: warning: Function parameter or member 'cqm_handle' not described in 'cqm_object_table_get'
   drivers/net/ethernet/huawei/hinic3/cqm/cqm_bitmap_table.c:1413: warning: Function parameter or member 'object_table' not described in 'cqm_object_table_get'
   drivers/net/ethernet/huawei/hinic3/cqm/cqm_bitmap_table.c:1413: warning: Function parameter or member 'index' not described in 'cqm_object_table_get'
   drivers/net/ethernet/huawei/hinic3/cqm/cqm_bitmap_table.c:1413: warning: Function parameter or member 'bh' not described in 'cqm_object_table_get'
   drivers/net/ethernet/huawei/hinic3/cqm/cqm_bitmap_table.c:1413: warning: expecting prototype for Prototype(). Prototype was for cqm_object_table_get() instead


vim +1159 drivers/net/ethernet/huawei/hinic3/cqm/cqm_main.c

  1129	
  1130	/**
  1131	 * Prototype    : cqm_fake_mem_init
  1132	 * Description  : Initialize resources of the extended fake function.
  1133	 * Input        : struct tag_cqm_handle *cqm_handle: Parent CQM handle of the current PF
  1134	 * Output       : None
  1135	 * Return Value : s32
  1136	 * 1.Date         : 2020/4/15
  1137	 *   Modification : Created function
  1138	 */
  1139	static s32 cqm_fake_mem_init(struct tag_cqm_handle *cqm_handle)
  1140	{
  1141		struct hinic3_hwdev *handle = cqm_handle->ex_handle;
  1142		struct tag_cqm_handle *fake_cqm_handle = NULL;
  1143		s32 child_func_number;
  1144		u32 i;
  1145	
  1146		if (cqm_handle->func_capability.fake_func_type !=
  1147		    CQM_FAKE_FUNC_PARENT)
  1148			return CQM_SUCCESS;
  1149	
  1150		child_func_number = cqm_get_child_func_number(cqm_handle);
  1151		if (child_func_number == CQM_FAIL) {
  1152			cqm_err(handle->dev_hdl, CQM_WRONG_VALUE(child_func_number));
  1153			return CQM_FAIL;
  1154		}
  1155	
  1156		for (i = 0; i < (u32)child_func_number; i++) {
  1157			fake_cqm_handle = cqm_handle->fake_cqm_handle[i];
  1158			snprintf(fake_cqm_handle->name, VRAM_NAME_MAX_LEN - 1,
> 1159				 "%s%s%02u", cqm_handle->name, VRAM_CQM_FAKE_MEM_BASE, i);
  1160	
  1161			if (cqm_bat_init(fake_cqm_handle) != CQM_SUCCESS) {
  1162				cqm_err(handle->dev_hdl,
  1163					CQM_FUNCTION_FAIL(cqm_bat_init));
  1164				goto err;
  1165			}
  1166	
  1167			if (cqm_cla_init(fake_cqm_handle) != CQM_SUCCESS) {
  1168				cqm_err(handle->dev_hdl,
  1169					CQM_FUNCTION_FAIL(cqm_cla_init));
  1170				goto err;
  1171			}
  1172	
  1173			if (cqm_bitmap_init(fake_cqm_handle) != CQM_SUCCESS) {
  1174				cqm_err(handle->dev_hdl,
  1175					CQM_FUNCTION_FAIL(cqm_bitmap_init));
  1176				goto err;
  1177			}
  1178	
  1179			if (cqm_object_table_init(fake_cqm_handle) != CQM_SUCCESS) {
  1180				cqm_err(handle->dev_hdl,
  1181					CQM_FUNCTION_FAIL(cqm_object_table_init));
  1182				goto err;
  1183			}
  1184		}
  1185	
  1186		return CQM_SUCCESS;
  1187	
  1188	err:
  1189		cqm_fake_mem_uninit(cqm_handle);
  1190		return CQM_FAIL;
  1191	}
  1192	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
