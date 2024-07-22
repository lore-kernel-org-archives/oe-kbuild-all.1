Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FF3E168A9
	for <oe-kbuild-all@lists.linux.dev>; Mon, 22 Jul 2024 04:39:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721623154; cv=none; b=bAjKLLtjIvauFE0+r+7OZwBjIpb6ryXrIm7KdqTxjo399dvd6uuChrUFiMLKwx/+C2Db6ealpU9WfCJ5zz54Qu+nyKCIKqIUacPPPqnhAF5HPOxmehtiLu+SJDFvBX9Pd2/z/WwGDayqX02YjuZAz26+AcQoEgj4zVP9A705YaM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721623154; c=relaxed/simple;
	bh=jkaiA3yUfwN8dY0shPLC0XRpY1x9GviYVAanHn1ObCc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=uztQfsVHTRvYXhgSOKxXgZMdxLqFALRigzLATpcDVs3niXbleSWr4MmkeaZSBwYMVm8Bq74BkPTXxw2WjUP9TyloUiSL9xAplK0Sup3o8UMpagw9h8fOYvpXBkLt+KEAh0YVdO+qNXhBZ+EqPs3p0PUo8PdStxWMfbAK05VqfEc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HPmwq5P0; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HPmwq5P0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1721623153; x=1753159153;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=jkaiA3yUfwN8dY0shPLC0XRpY1x9GviYVAanHn1ObCc=;
  b=HPmwq5P0TXHu3cBfxn73v9ThGn2AtzkjHLyGI+2aAnURObjySe8yuD/N
   yyG0VR92iE7Zmt1MqOoM7fOyxUeTzyqrPhO8splq0V5zosNHw1Cajf20O
   Iyryo7pGSC1Aust1wpJC4Ai7u51Bdsj6P/a1GV9NitVDJm1aH9XA/YM+n
   naHdoxoRp8cCTzv0WgftM0+g7lN99a71JFGd7s9lv1xcCG18c2Ai67PGN
   jQLu9f8bdAnyGNqg35SaV9SjgtU1Hn2+2MrCzsThwoD4Ep0AWrfNXDx9D
   FSBpzAFDow8yedz/2arA/zi2soyYXss5HKTFA3vXplHEdmA0LNGeMwh6W
   Q==;
X-CSE-ConnectionGUID: +DM4wT/WT3ef0G7yRlokMw==
X-CSE-MsgGUID: 0xemfdehRcedhDXLrr8LOA==
X-IronPort-AV: E=McAfee;i="6700,10204,11140"; a="18789350"
X-IronPort-AV: E=Sophos;i="6.09,227,1716274800"; 
   d="scan'208";a="18789350"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jul 2024 21:39:11 -0700
X-CSE-ConnectionGUID: QnanfFt5TjGAFRQ7vJWHfQ==
X-CSE-MsgGUID: 1Ls7k2slTpSw6B0PUirfrw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,227,1716274800"; 
   d="scan'208";a="56595913"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 21 Jul 2024 21:39:09 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sVkpG-000ks4-2P;
	Mon, 22 Jul 2024 04:39:06 +0000
Date: Mon, 22 Jul 2024 12:38:31 +0800
From: kernel test robot <lkp@intel.com>
To: Tiezhu Yang <yangtiezhu@loongson.cn>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Huacai Chen <chenhuacai@kernel.org>,
	Jinyang He <hejinyang@loongson.cn>,
	Youling Tang <tangyouling@loongson.cn>
Subject: arch/loongarch/kernel/alternative.o: warning: objtool:
 apply_alternatives+0xa0: unreachable instruction
Message-ID: <202407221208.6SSBeN9H-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   7846b618e0a4c3e08888099d1d4512722b39ca99
commit: cb8a2ef0848ca80d67d6d56e2df757cfdf6b3355 LoongArch: Add ORC stack unwinder support
date:   4 months ago
config: loongarch-randconfig-001-20240722 (https://download.01.org/0day-ci/archive/20240722/202407221208.6SSBeN9H-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240722/202407221208.6SSBeN9H-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407221208.6SSBeN9H-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/9p/vfs_file.o: warning: objtool: v9fs_file_do_lock+0x64: unreachable instruction
--
>> fs/iomap/buffered-io.o: warning: objtool: iomap_write_begin+0x80: unreachable instruction
--
>> kernel/cgroup/cgroup.o: warning: objtool: compare_css_sets+0xc8: unreachable instruction
>> kernel/cgroup/cgroup.o: warning: objtool: cgroup_setup_root+0x2dc: unreachable instruction
>> kernel/cgroup/cgroup.o: warning: objtool: cgroup_destroy_root+0x4c: unreachable instruction
>> kernel/cgroup/cgroup.o: warning: objtool: cgroup_init_subsys+0x98: unreachable instruction
>> kernel/cgroup/cgroup.o: warning: objtool: cgroup_init+0x50: unreachable instruction
--
   drivers/target/target_core_transport.c: In function 'transport_dump_vpd_ident':
   drivers/target/target_core_transport.c:1263:59: warning: '%s' directive output may be truncated writing up to 253 bytes into a region of size 221 [-Wformat-truncation=]
    1263 |                         "T10 VPD ASCII Device Identifier: %s\n",
         |                                                           ^~
   drivers/target/target_core_transport.c:1262:17: note: 'snprintf' output between 35 and 288 bytes into a destination of size 254
    1262 |                 snprintf(buf, sizeof(buf),
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~
    1263 |                         "T10 VPD ASCII Device Identifier: %s\n",
         |                         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    1264 |                         &vpd->device_identifier[0]);
         |                         ~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/target/target_core_transport.c:1268:59: warning: '%s' directive output may be truncated writing up to 253 bytes into a region of size 221 [-Wformat-truncation=]
    1268 |                         "T10 VPD UTF-8 Device Identifier: %s\n",
         |                                                           ^~
   drivers/target/target_core_transport.c:1267:17: note: 'snprintf' output between 35 and 288 bytes into a destination of size 254
    1267 |                 snprintf(buf, sizeof(buf),
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~
    1268 |                         "T10 VPD UTF-8 Device Identifier: %s\n",
         |                         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    1269 |                         &vpd->device_identifier[0]);
         |                         ~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/target/target_core_transport.c:1258:60: warning: '%s' directive output may be truncated writing up to 253 bytes into a region of size 220 [-Wformat-truncation=]
    1258 |                         "T10 VPD Binary Device Identifier: %s\n",
         |                                                            ^~
   drivers/target/target_core_transport.c:1257:17: note: 'snprintf' output between 36 and 289 bytes into a destination of size 254
    1257 |                 snprintf(buf, sizeof(buf),
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~
    1258 |                         "T10 VPD Binary Device Identifier: %s\n",
         |                         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    1259 |                         &vpd->device_identifier[0]);
         |                         ~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/target/target_core_transport.o: warning: objtool: target_init_cmd+0x60: unreachable instruction
--
>> drivers/base/regmap/regmap-irq.o: warning: objtool: regmap_irq_thread+0x2bc: unreachable instruction
--
>> drivers/mtd/nand/raw/nand_base.o: warning: objtool: nand_fill_oob+0xa4: unreachable instruction
>> drivers/mtd/nand/raw/nand_base.o: warning: objtool: nand_transfer_oob+0x94: unreachable instruction
--
>> drivers/mtd/nand/raw/nand_bbt.o: warning: objtool: verify_bbt_descr+0x78: unreachable instruction
--
>> fs/f2fs/inode.o: warning: objtool: __f2fs_crc32.isra.0+0x54: unreachable instruction
>> fs/f2fs/inode.o: warning: objtool: f2fs_evict_inode+0x110: unreachable instruction
--
>> fs/f2fs/node.o: warning: objtool: set_node_addr+0xc0: unreachable instruction
>> fs/f2fs/node.o: warning: objtool: __flush_nat_entry_set.isra.0+0x170: unreachable instruction
>> fs/f2fs/node.o: warning: objtool: f2fs_truncate_inode_blocks+0x250: unreachable instruction
>> fs/f2fs/node.o: warning: objtool: f2fs_alloc_nid+0xc4: unreachable instruction
>> fs/f2fs/node.o: warning: objtool: f2fs_alloc_nid_failed+0x60: unreachable instruction
>> fs/f2fs/node.o: warning: objtool: f2fs_destroy_node_manager+0xcc: unreachable instruction
--
>> fs/f2fs/segment.o: warning: objtool: get_new_segment+0x14c: unreachable instruction
>> fs/f2fs/segment.o: warning: objtool: current_sit_addr.isra.0+0x50: unreachable instruction
>> fs/f2fs/segment.o: warning: objtool: __locate_dirty_segment+0x11c: unreachable instruction
>> fs/f2fs/segment.o: warning: objtool: update_sit_entry+0x15c: unreachable instruction
>> fs/f2fs/segment.o: warning: objtool: __submit_discard_cmd+0x1f4: unreachable instruction
>> fs/f2fs/segment.o: warning: objtool: __issue_discard_cmd+0x15c: unreachable instruction
>> fs/f2fs/segment.o: warning: objtool: f2fs_allocate_data_block+0x124: unreachable instruction
>> fs/f2fs/segment.o: warning: objtool: f2fs_do_replace_block+0x254: unreachable instruction
>> fs/f2fs/segment.o: warning: objtool: f2fs_flush_sit_entries+0x340: unreachable instruction
--
   fs/f2fs/data.o: warning: objtool: f2fs_submit_write_bio+0xe8: unreachable instruction
>> fs/f2fs/data.o: warning: objtool: f2fs_merge_page_bio+0x1a4: unreachable instruction
..


objdump-func vmlinux.o apply_alternatives:

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
