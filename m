Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3669D185B48
	for <oe-kbuild-all@lists.linux.dev>; Thu, 24 Apr 2025 14:32:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745505141; cv=none; b=Yem5qw6j2s5tOJBWWUWrOCavKE1rOcVEKAebmLt9E03Jfx00syixHnWf5MkvoFRlWH4InDHVu4kqlisBECNGXc4jHRguETTNTExWjhhlO8tyUUV++eq+izDqmLfL8jKyIrkMQzEvYECTDfB2VhFI8exOTnqJJH03VHyEJCV6sqE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745505141; c=relaxed/simple;
	bh=NJElYbMrMhWkM3E5PhtoyPuNgcBAa6+42gVaoZyeqbI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=aV2anVh7Cqm74Bx1A8ds8ofD6UOV1SldqmFfBo5KvBF8oKDb3AWny314wwsRbk85C+VDDA03dXTnQ8P/ihy4gqLzzc4fGIY4hm34DtKwi3f9vLrPhmu536LVew+OZ3N8ZLChEJ4KD1NxAqJDmoq27vkcTKkIqPABpnoEFm/Spog=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Y8PdIKSD; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Y8PdIKSD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745505140; x=1777041140;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=NJElYbMrMhWkM3E5PhtoyPuNgcBAa6+42gVaoZyeqbI=;
  b=Y8PdIKSDcw7aGcMvZ8dnRxsgHD+x6fiNJStjC0KxddmrKbhNB/Zgab3C
   R5FRP0gOrMwBAvr4mvskdRfqVu/WhKVGW+PX5G9B7FIdiSLYtq7/r2UAZ
   P+9uz2S2eWFEdBDtJIOg6Jf4widKR0R7OjE9PtNDkZn2koMPeuEtAARIN
   srFonjN8HlzIOgzmQ4HVEcG5Zkyt7gceWPYN5479ykRrLIiC2GSsyjVOT
   IeizKMfP49GxvuMpDNmKmmgGcpA+9hFa7K7OcoIWyvqHHls9kZWbhkXjq
   b19e1hR48slrzg5RyleoXdu3KDixs/+Jt8UrB3hUsIIKKnzGQ4FDg1wA6
   w==;
X-CSE-ConnectionGUID: QjDBgC9CS4K1vRaEp7+YYw==
X-CSE-MsgGUID: C6h8vSJgTDCbZgykF98cxQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11413"; a="57341011"
X-IronPort-AV: E=Sophos;i="6.15,236,1739865600"; 
   d="scan'208";a="57341011"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Apr 2025 07:32:19 -0700
X-CSE-ConnectionGUID: s7KV24pcSVCuY7Wk6w/N7A==
X-CSE-MsgGUID: /JJCtsB1TMOhbcFaQGp3fQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,236,1739865600"; 
   d="scan'208";a="133540971"
Received: from lkp-server01.sh.intel.com (HELO 050dd05385d1) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 24 Apr 2025 07:32:17 -0700
Received: from kbuild by 050dd05385d1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u7xcd-0004DV-1B;
	Thu, 24 Apr 2025 14:32:15 +0000
Date: Thu, 24 Apr 2025 22:31:57 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Xie XiuQi <xiexiuqi@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1592/1592] sas_expander.c:undefined
 reference to `ata_dev_same_device'
Message-ID: <202504250048.uf9ktecm-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Jason,

FYI, the error/warning still remains.

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   08111f03f1ec65598372cfe9bf64f366d575671e
commit: d856ec500c97835c591ffacc005f514509f1a931 [1592/1592] scsi: libsas: check if the same sata device when flutter
config: x86_64-buildonly-randconfig-003-20250424 (https://download.01.org/0day-ci/archive/20250425/202504250048.uf9ktecm-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250425/202504250048.uf9ktecm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504250048.uf9ktecm-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: warning: arch/x86/lib/csum-copy_64.o: missing .note.GNU-stack section implies executable stack
   ld: NOTE: This behaviour is deprecated and will be removed in a future version of the linker
   ld: warning: arch/x86/lib/csum-copy_64.o: missing .note.GNU-stack section implies executable stack
   ld: NOTE: This behaviour is deprecated and will be removed in a future version of the linker
   ld: warning: .tmp_vmlinux1 has a LOAD segment with RWX permissions
   ld: drivers/scsi/libsas/sas_expander.o: in function `sas_rediscover_dev':
>> sas_expander.c:(.text.unlikely+0x38c): undefined reference to `ata_dev_same_device'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
