Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13DA323C51D
	for <oe-kbuild-all@lists.linux.dev>; Thu, 20 Nov 2025 02:04:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763604291; cv=none; b=suWW3LAjjwBT65jXdSyUyZVfkST3QU2jr1eVt9mCCFRoN0mOlwOKh4YlXbfeZle08nQdTyNikCMAziYlShgWhGACwS73PfXN+tPBHimRvUMXcb9tnillIpYYDZKeq01Mja577Fqw5Y2xjWRzu5L8txcHfk8a5hi5k3kBMNliCD8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763604291; c=relaxed/simple;
	bh=nfs2UclGuWEFp7+HmBY6ia4JLSRaDy+UbYFgG7m2tQ0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=AE47DiGwCaVusYVkpU/1mYPzu5zd1r1I2ySe1FYqGEsKarZ++mDKEb9HwmbbRw5dyM3HuKO5kACHJHgFvpX3O2GlrsRky9JFcKkwSTPOaXUa2RlWyl2sP1Ep4k3PRDA43gZexBxgMLhh/meJfHIjwudzZ/qONj18Fb/qjIBW/uk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Oes2l5Ps; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Oes2l5Ps"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763604289; x=1795140289;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=nfs2UclGuWEFp7+HmBY6ia4JLSRaDy+UbYFgG7m2tQ0=;
  b=Oes2l5PsvXRESaYDC59cezYs79XL7hi7CgVbDLtg6Zbrte/8O95DJkZQ
   Dls2zLRBlHwqOgIJ6IoKcEScLRjLU4GdVpEnrIHsyFtaXJmcNZh7S4EdV
   VRR7NxS3h6K9Shz3WGqL/eHba6yOMw3uPpiJV9jh37dZSyatDSm7v6fLb
   WRxAcDWD2mMyYLYW8HbvqBR+RojQT0f/YljHk/6plgWuKSvgVaoRBlKhV
   XIB+nRIvSMWNww/7EEwnlU/JewpQrJ5uCqSP4+uT32j2D9zV06oh/eDvk
   VWbzFq7LRbP90izngfoymwDPupKH67sRQO/0hRk7psQXhxHbpcXbK0H7l
   g==;
X-CSE-ConnectionGUID: AYWPVWJlS9WwNXX4r1WKVw==
X-CSE-MsgGUID: 6bPhsQiYSkWpL5hQItXARg==
X-IronPort-AV: E=McAfee;i="6800,10657,11618"; a="76271113"
X-IronPort-AV: E=Sophos;i="6.19,316,1754982000"; 
   d="scan'208";a="76271113"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2025 18:04:47 -0800
X-CSE-ConnectionGUID: cz6xQ6wuQgmolxq2GBtWng==
X-CSE-MsgGUID: cXr9XygxSTeKR+yuvkO1Lg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,316,1754982000"; 
   d="scan'208";a="191014995"
Received: from igk-lkp-server01.igk.intel.com (HELO 9c39a92d400b) ([10.211.93.152])
  by orviesa009.jf.intel.com with ESMTP; 19 Nov 2025 18:04:47 -0800
Received: from kbuild by 9c39a92d400b with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vLu2N-000000001Kx-28CG;
	Thu, 20 Nov 2025 02:04:43 +0000
Date: Thu, 20 Nov 2025 03:03:59 +0100
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Liu Mingrui <liumingrui@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 3269/3269] htmldocs:
 Documentation/misc-devices/zcopy.rst:18: WARNING: Title underline too short.
Message-ID: <202511200347.5qevtABT-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   dfb9bd9242c2350c127d51a126976ed386e9cc48
commit: 3a1e43e597d3d6f872dd786af8dad22947c8239a [3269/3269] zcopy: Add ZCOPY documentation
reproduce: (https://download.01.org/0day-ci/archive/20251120/202511200347.5qevtABT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511200347.5qevtABT-lkp@intel.com/

All warnings (new ones prefixed by >>):

   WARNING: kernel-doc './scripts/kernel-doc -rst -enable-lineno -sphinx-version 8.2.3 -function HID quirks ./include/linux/hid.h' failed with return code 1
   WARNING: kernel-doc './scripts/kernel-doc -rst -enable-lineno -sphinx-version 8.2.3 ./include/linux/i2c-atr.h' failed with return code 1
   WARNING: kernel-doc './scripts/kernel-doc -rst -enable-lineno -sphinx-version 8.2.3 -internal ./include/linux/mutex.h' failed with return code 2
   WARNING: kernel-doc './scripts/kernel-doc -rst -enable-lineno -sphinx-version 8.2.3 -function klp_patch -function klp_object -function klp_func -function klp_callbacks -function klp_state ./include/linux/livepatch.h' failed with return code 1
   WARNING: kernel-doc './scripts/kernel-doc -rst -enable-lineno -sphinx-version 8.2.3 ./include/linux/seqlock.h' failed with return code 1
>> Documentation/misc-devices/zcopy.rst:18: WARNING: Title underline too short.
--
   Key features
   ----------- [docutils]
>> Documentation/misc-devices/zcopy.rst:18: WARNING: Title underline too short.
--
   WARNING: kernel-doc './scripts/kernel-doc -rst -enable-lineno -sphinx-version 8.2.3 ./include/linux/fprobe.h' failed with return code 1
   WARNING: kernel-doc './scripts/kernel-doc -rst -enable-lineno -sphinx-version 8.2.3 -internal ./include/linux/mutex.h' failed with return code 2
   Documentation/translations/zh_TW/dev-tools/index.rst:21: WARNING: toctree contains reference to nonexisting document 'translations/zh_TW/dev-tools/sparse' [toc.not_readable]
   WARNING: kernel-doc './scripts/kernel-doc -rst -enable-lineno -sphinx-version 8.2.3 ./include/linux/fwctl.h' failed with return code 1
   Documentation/arch/x86/hygon-secure-virtualization.rst: WARNING: document isn't included in any toctree [toc.not_included]
>> Documentation/misc-devices/zcopy.rst: WARNING: document isn't included in any toctree [toc.not_included]
   Documentation/mm/dynamic_hugetlb.rst: WARNING: document isn't included in any toctree [toc.not_included]
   Documentation/networking/device_drivers/ethernet/nebula-matrix/m18120.rst: WARNING: document isn't included in any toctree [toc.not_included]
   Documentation/networking/hinic3.rst: WARNING: document isn't included in any toctree [toc.not_included]
   Documentation/scsi/hisi_raid.rst: WARNING: document isn't included in any toctree [toc.not_included]
   Documentation/scsi/sssraid.rst: WARNING: document isn't included in any toctree [toc.not_included]
--
   Important constraints and requirements
   --------------------- [docutils]
   Documentation/misc-devices/zcopy.rst:61: ERROR: Unexpected indentation. [docutils]
>> Documentation/misc-devices/zcopy.rst:58: WARNING: Inline emphasis start-string without end-string. [docutils]
   Documentation/misc-devices/zcopy.rst:61: WARNING: Inline emphasis start-string without end-string. [docutils]
>> Documentation/misc-devices/zcopy.rst:64: WARNING: Block quote ends without a blank line; unexpected unindent. [docutils]
   WARNING: kernel-doc './scripts/kernel-doc -rst -enable-lineno -sphinx-version 8.2.3 ./include/linux/damon.h' failed with return code 1
   WARNING: kernel-doc './scripts/kernel-doc -rst -enable-lineno -sphinx-version 8.2.3 ./include/linux/highmem.h' failed with return code 1
   WARNING: kernel-doc './scripts/kernel-doc -rst -enable-lineno -sphinx-version 8.2.3 ./include/linux/highmem-internal.h' failed with return code 1
   WARNING: kernel-doc './scripts/kernel-doc -rst -enable-lineno -sphinx-version 8.2.3 ./include/linux/migrate.h' failed with return code 1
   Documentation/networking/device_drivers/ethernet/3snic/sssnic.rst:42: WARNING: Enumerated list ends without a blank line; unexpected unindent. [docutils]


vim +18 Documentation/misc-devices/zcopy.rst

    15	
    16	
    17	Key features
  > 18	-----------
    19	- Supports zero-copy communication between intra-node processes.
    20	- Handles both PTE-level small pages and PMD-level huge pages.
    21	- Preserves the read/write permissions of the source page in the target address space.
    22	
    23	
    24	Important constraints and requirements
    25	---------------------
    26	1. Callers must ensure the source address is already mapped to physical pages,
    27	while the destination address is unused (no existing mappings). If exists
    28	old mappings, the return value is -EAGAIN. For this case, caller should free
    29	the old dst_addr, and alloc a new one to try again.
    30	
    31	2. No internal locking is implemented in the PageAttach interface; Callers
    32	must manage memory mapping and release order to avoid race conditions.
    33	
    34	3. Source and destination must be different processes (not threads of the same process).
    35	
    36	4. Only user-space addresses are supported; kernel addresses cannot be mapped.
    37	
    38	5. Both source and destination processes must remain alive during the mapping operation.
    39	
    40	6. PUD-level huge pages are not supported in current implementation.
    41	
    42	7. The start address and size of both source and destination must be PMD-size-aligned.
    43	
    44	8. Callers are responsible for ensuring safe access to mapped pages after attachment,
    45	as permissions are inherited from the source.
    46	
    47	
    48	Use
    49	---
    50	Process a
    51	  src_addr= aligned_alloc(ALIGN_SIZE_2M, size);
    52	  memset(src_addr, 0, size);
    53	
    54	Process b
    55	  #define ALIGN_SIZE_2M 2097152
    56	  int fd = open(SLS_DEVICE, O_RDWR);
    57	
  > 58	  dst_addr= aligned_alloc(ALIGN_SIZE_2M, size);
    59	  res = zcopy(fd, (void *)src_addr, dst_addr, src_pid, dst_pid, size);
    60	  while(res.ret == -EAGAIN && retry--) {
    61	      free(dst_addr);
    62	      dst_addr= aligned_alloc(ALIGN_SIZE_2M, size);
    63	      res = zcopy(fd, (void *)src_addr, dst_addr, src_pid, dst_pid, aligned_size);
  > 64	  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
