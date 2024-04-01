Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35B1E4F5ED
	for <oe-kbuild-all@lists.linux.dev>; Mon,  1 Apr 2024 18:59:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711997956; cv=none; b=Ofa+3hzD+jphgmOaAagFJ+0zjGsVYgOSIu7fRFZNXWxy/lFRboGeAICa68G4Mi50KXGYlQhfvlvYrjwQ+TTDxm3kND9It6fArSNq9OqT0QRjfz+TuXDiWz4UKUVLhUMfZBXwKx/jN7oZVYrDB9bV+LMTNvGZQ8F1iBeAqzjR4pE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711997956; c=relaxed/simple;
	bh=Mv664ytXMOZdsEdR3kl7HhIaVLYvU7PXUhXt5BrJvTY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=QQ6s5QdW3rhf0KuWKQ5krvsmoEmr/nPex7CLHTGosBllgl5J1NKtoX5/rMqbJjMYgIoERmb0bS+iFKN/LUf4GKy1QwUVpx16tztkpnBwud400HI3tG3QPppaM7KslQSZXqZOVVfb1ObfToxAaY6CM8fJU7N3wLpZbvqVWTOO4Jk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iQoCA0DE; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iQoCA0DE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711997954; x=1743533954;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Mv664ytXMOZdsEdR3kl7HhIaVLYvU7PXUhXt5BrJvTY=;
  b=iQoCA0DE18drzhoAMJKGI/6qtSGpXwqjzCiVxgD0HI7z8IKmEFkoS5ak
   No0ZcYI7MqL2NGs10oCRt5ruz9c3m+zLZs33d9FYhixSHHmFSlQSaKpez
   G705W0c2nNTjn7qcoHs/8kDPiUmUYET2c85CeQZAeHE+C1VczP9diq3mj
   7tpQuDFMontp0U/sU1VeVQo35IZ+cMUuj1DCTI2VTGbAm5qJ5zsDIXq14
   LDHGnNwHg+kgWzy4bgFYl18i2b2dTaRaAdnNiGeExJcuKSX4IrYKSKl6s
   +ygFVHuBMVvjBFzlbKPjfVQ9/VVx0Q1xhnyzogvAAP0SDLw8mJPEP+e7f
   A==;
X-CSE-ConnectionGUID: xk8oEX/4Rxm6X53H3FVdMg==
X-CSE-MsgGUID: gLIdnxslRLCBPPXxdjTJAg==
X-IronPort-AV: E=McAfee;i="6600,9927,11031"; a="10922442"
X-IronPort-AV: E=Sophos;i="6.07,172,1708416000"; 
   d="scan'208";a="10922442"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Apr 2024 11:59:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,172,1708416000"; 
   d="scan'208";a="49009819"
Received: from lkp-server02.sh.intel.com (HELO 90ee3aa53dbd) ([10.239.97.151])
  by fmviesa001.fm.intel.com with ESMTP; 01 Apr 2024 11:59:12 -0700
Received: from kbuild by 90ee3aa53dbd with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rrMsA-0000Yh-0D;
	Mon, 01 Apr 2024 18:59:10 +0000
Date: Tue, 2 Apr 2024 02:58:23 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Yang Yingliang <yangyingliang@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 14777/22019]
 drivers/scsi/huawei/hifc/hifc_lld.o: warning: objtool: missing symbol for
 section .init.text
Message-ID: <202404020221.D3ktuarV-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   bca07979c0a7054331b91c892163a0d214cffcbe
commit: 7fc993d55d1b54ae40e29dfac825a18d04d644c6 [14777/22019] scsi/hifc: add hifc driver FC service module
config: x86_64-buildonly-randconfig-006-20240401 (https://download.01.org/0day-ci/archive/20240402/202404020221.D3ktuarV-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240402/202404020221.D3ktuarV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404020221.D3ktuarV-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/scsi/huawei/hifc/hifc_lld.c:22:
   In file included from drivers/scsi/huawei/hifc/hifc_knl_adp.h:30:
   In file included from include/scsi/scsi_host.h:12:
   In file included from include/linux/blk-mq.h:5:
   In file included from include/linux/blkdev.h:16:
   include/linux/pagemap.h:425:21: warning: cast from 'int (*)(struct file *, struct page *)' to 'filler_t *' (aka 'int (*)(void *, struct page *)') converts to incompatible function type [-Wcast-function-type-strict]
     425 |         filler_t *filler = (filler_t *)mapping->a_ops->readpage;
         |                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/scsi/huawei/hifc/hifc_lld.c:333:7: warning: no previous prototype for function 'hifc_get_ppf_hwdev_by_pdev' [-Wmissing-prototypes]
     333 | void *hifc_get_ppf_hwdev_by_pdev(struct pci_dev *pdev)
         |       ^
   drivers/scsi/huawei/hifc/hifc_lld.c:333:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     333 | void *hifc_get_ppf_hwdev_by_pdev(struct pci_dev *pdev)
         | ^
         | static 
   drivers/scsi/huawei/hifc/hifc_lld.c:362:6: warning: no previous prototype for function 'hifc_event_process' [-Wmissing-prototypes]
     362 | void hifc_event_process(void *adapter, struct hifc_event_info *event)
         |      ^
   drivers/scsi/huawei/hifc/hifc_lld.c:362:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     362 | void hifc_event_process(void *adapter, struct hifc_event_info *event)
         | ^
         | static 
   3 warnings generated.
>> drivers/scsi/huawei/hifc/hifc_lld.o: warning: objtool: missing symbol for section .init.text

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
