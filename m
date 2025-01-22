Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B4261AF0DB
	for <oe-kbuild-all@lists.linux.dev>; Wed, 22 Jan 2025 07:21:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737530470; cv=none; b=Q8Jm+nua7cnJYlW+RbuP5y//XXHZDhIDGgLIk6XWNX14srTIBUdLqE2xr1lhGHb0TaRXYKKoe1SjuMkDYIaYAlhPr2PpPYsYqI9+TMJwzP72rutvWiJEMGyfleluFsHD8RWSmA3ak/5nZr0IBUoCPzwl1+alQ1yvBxoldMbsLUY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737530470; c=relaxed/simple;
	bh=QxZewpo7wTFz1ATVCMSkhgR2UrgZOKowNnAWlnRFZ1k=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=gkYHB+JsX2QQrj60JL9BdRjY7xACPZP6+w4DTHuR4Qgi9sW+Rdq4N6tLBOWdTzdT5flvcs6mRK9OnyZQUtKt3K+nwt1MxihnvV6xttPT+1eyqcQXG9ZgueDntqTBmJiIhDcR2/uz9mlmBTXK+INR2BdYP47aMsLWxdbyR9eNP0A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QdnRk3Kz; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QdnRk3Kz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737530468; x=1769066468;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=QxZewpo7wTFz1ATVCMSkhgR2UrgZOKowNnAWlnRFZ1k=;
  b=QdnRk3KzADHnxiUqw7NfV1afDIBgYCt5tZRCKzbZtQNJ+4YT8gDxD0DR
   3MGZxZx2YHlaCdhs+aa34T62Mn9Mrxh50ohoEs+dbM6LeSsb6RzBwVYiz
   DuQE3EDZmxImIiy0wCSCJdPNlov5a7bfo4edKuWJ4uj/svJqLk3HgJoNE
   z52mVslERgbtJ6RmKqFXSNwdP4ZUjscw4viVMghUx9jZbm+fmRgEjuEq6
   DNo3r4JdRq0s0J+qfvldSpY6TqsCHVNcHJq4bMNDJ3dZVM12MnVZ5laU1
   qLt2FoFN3SOLPgqzy251+9PPaqF/5GmJ67N1UjwEZbvvmnfxmywXWQC8e
   g==;
X-CSE-ConnectionGUID: mHGoHc3CRd2KpBsr6aXNNQ==
X-CSE-MsgGUID: cXDWc2XSRbGovwLz8uXEMw==
X-IronPort-AV: E=McAfee;i="6700,10204,11322"; a="37672900"
X-IronPort-AV: E=Sophos;i="6.13,224,1732608000"; 
   d="scan'208";a="37672900"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jan 2025 23:21:07 -0800
X-CSE-ConnectionGUID: aJ3rnCSRS925uS6IS8syYw==
X-CSE-MsgGUID: cOGssFNsTniR4JtJ88PICQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="112125628"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 21 Jan 2025 23:21:06 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1taV2t-000Zbn-02;
	Wed, 22 Jan 2025 07:21:03 +0000
Date: Wed, 22 Jan 2025 15:20:53 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Zheng Zengkai <zhengzengkai@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 1834/1834]
 drivers/net/ethernet/huawei/bma/kbox_drv/kbox_ram_drive.c:41:30: sparse:
 sparse: symbol 'kbox_fops' was not declared. Should it be static?
Message-ID: <202501221527.POAEXa7r-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   75c81bcddd82381fbd4cef477a5b56eb2fe56697
commit: cd2978286f40089fcd83f74ffdff733bfbe1e52a [1834/1834] Huawei BMA: Adding Huawei BMA driver: host_kbox_drv
config: x86_64-randconfig-121-20250122 (https://download.01.org/0day-ci/archive/20250122/202501221527.POAEXa7r-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250122/202501221527.POAEXa7r-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501221527.POAEXa7r-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/net/ethernet/huawei/bma/kbox_drv/kbox_ram_drive.c:41:30: sparse: sparse: symbol 'kbox_fops' was not declared. Should it be static?
--
   drivers/net/ethernet/huawei/bma/kbox_drv/kbox_ram_op.c:51:28: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/huawei/bma/kbox_drv/kbox_ram_op.c:42:6: sparse: sparse: symbol 'kbox_write_to_pci' was not declared. Should it be static?
   drivers/net/ethernet/huawei/bma/kbox_drv/kbox_ram_op.c:120:27: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/huawei/bma/kbox_drv/kbox_ram_op.c:111:6: sparse: sparse: symbol 'kbox_read_from_pci' was not declared. Should it be static?
   drivers/net/ethernet/huawei/bma/kbox_drv/kbox_ram_op.c:179:28: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/huawei/bma/kbox_drv/kbox_ram_op.c:172:6: sparse: sparse: symbol 'kbox_memset_pci' was not declared. Should it be static?
   drivers/net/ethernet/huawei/bma/kbox_drv/kbox_ram_op.c:360:26: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected char *user_buf @@     got char [noderef] __user *data @@
   drivers/net/ethernet/huawei/bma/kbox_drv/kbox_ram_op.c:360:26: sparse:     expected char *user_buf
   drivers/net/ethernet/huawei/bma/kbox_drv/kbox_ram_op.c:360:26: sparse:     got char [noderef] __user *data
   drivers/net/ethernet/huawei/bma/kbox_drv/kbox_ram_op.c:395:34: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void [noderef] __user *to @@     got char *user_buf @@
   drivers/net/ethernet/huawei/bma/kbox_drv/kbox_ram_op.c:395:34: sparse:     expected void [noderef] __user *to
   drivers/net/ethernet/huawei/bma/kbox_drv/kbox_ram_op.c:395:34: sparse:     got char *user_buf
>> drivers/net/ethernet/huawei/bma/kbox_drv/kbox_ram_op.c:422:32: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected char const *user_buf @@     got char const [noderef] __user *data @@
   drivers/net/ethernet/huawei/bma/kbox_drv/kbox_ram_op.c:422:32: sparse:     expected char const *user_buf
   drivers/net/ethernet/huawei/bma/kbox_drv/kbox_ram_op.c:422:32: sparse:     got char const [noderef] __user *data
   drivers/net/ethernet/huawei/bma/kbox_drv/kbox_ram_op.c:453:51: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void const [noderef] __user *from @@     got char const *user_buf @@
   drivers/net/ethernet/huawei/bma/kbox_drv/kbox_ram_op.c:453:51: sparse:     expected void const [noderef] __user *from
   drivers/net/ethernet/huawei/bma/kbox_drv/kbox_ram_op.c:453:51: sparse:     got char const *user_buf

vim +/kbox_fops +41 drivers/net/ethernet/huawei/bma/kbox_drv/kbox_ram_drive.c

    40	
  > 41	const struct file_operations kbox_fops = {
    42		.owner = THIS_MODULE,
    43		.read = kbox_read,
    44		.write = kbox_write,
    45		.unlocked_ioctl = kbox_ioctl,
    46		.mmap = kbox_mmap,
    47		.open = kbox_open,
    48		.release = kbox_release,
    49	};
    50	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
