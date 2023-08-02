Received: from mgamail.intel.com (unknown [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25177184F
	for <oe-kbuild-all@lists.linux.dev>; Wed,  2 Aug 2023 06:28:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690957698; x=1722493698;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=JAqHigCANm/GHKxKWVCTL5vDntCZpuz1yr5nqOR1EPU=;
  b=YjQWCtPHzz2LksrVfjvF++QfBCDZIhUgYUAAhneNCM3HosTCDopJRhGE
   KsAQQeeWZK0bRQ0p0pWtOLV5TMRJHoLgZ26Bbp70+hyckZ81oh+nbcCHZ
   XhjqbEu/43DUlhA675rK21t/vkxk2NeJjsyXKBHN7gmQ4JoK02aHWYVq9
   dvy+m+aYipJ/2YijNjBDGhJHsZjqKZwUeNaImKEwQ7o7VJZn/69Z9G70k
   7m0I57kUTx0EhgbFgH8fuGmL6MMEoCxz+3ZIkRqFnwkwOtTh1oQrKj0oE
   VbU7KwTrhra8dxG4yy9wxCRrfBKuoYdy//LbimapvpAHQCcICpBA3N8xR
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10789"; a="349094314"
X-IronPort-AV: E=Sophos;i="6.01,248,1684825200"; 
   d="scan'208";a="349094314"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Aug 2023 23:28:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10789"; a="819062250"
X-IronPort-AV: E=Sophos;i="6.01,248,1684825200"; 
   d="scan'208";a="819062250"
Received: from lkp-server01.sh.intel.com (HELO d1ccc7e87e8f) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 01 Aug 2023 23:28:15 -0700
Received: from kbuild by d1ccc7e87e8f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qR5LC-0000wd-1T;
	Wed, 02 Aug 2023 06:28:14 +0000
Date: Wed, 2 Aug 2023 14:27:19 +0800
From: kernel test robot <lkp@intel.com>
To: Nilesh Javali <njavali@marvell.com>, martin.petersen@oracle.com
Cc: oe-kbuild-all@lists.linux.dev, linux-scsi@vger.kernel.org,
	GR-QLogic-Storage-Upstream@marvell.com, agurumurthy@marvell.com,
	sdeodhar@marvell.com
Subject: Re: [PATCH 01/10] qla2xxx: Add NVMe Disconnect support
Message-ID: <202308021445.txlNq7UC-lkp@intel.com>
References: <20230801114057.27039-2-njavali@marvell.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230801114057.27039-2-njavali@marvell.com>

Hi Nilesh,

kernel test robot noticed the following build errors:

[auto build test ERROR on 7e9609d2daea0ebe4add444b26b76479ecfda504]

url:    https://github.com/intel-lab-lkp/linux/commits/Nilesh-Javali/qla2xxx-Add-NVMe-Disconnect-support/20230801-194339
base:   7e9609d2daea0ebe4add444b26b76479ecfda504
patch link:    https://lore.kernel.org/r/20230801114057.27039-2-njavali%40marvell.com
patch subject: [PATCH 01/10] qla2xxx: Add NVMe Disconnect support
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20230802/202308021445.txlNq7UC-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230802/202308021445.txlNq7UC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308021445.txlNq7UC-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

WARNING: modpost: missing MODULE_DESCRIPTION() in vmlinux.o
WARNING: modpost: missing MODULE_DESCRIPTION() in arch/x86/kernel/cpu/mce/mce-inject.o
WARNING: modpost: missing MODULE_DESCRIPTION() in arch/x86/kvm/kvm.o
WARNING: modpost: missing MODULE_DESCRIPTION() in arch/x86/kvm/kvm-intel.o
WARNING: modpost: missing MODULE_DESCRIPTION() in mm/hwpoison-inject.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/cramfs/cramfs.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nfsd/nfsd.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/btrfs/btrfs.o
WARNING: modpost: missing MODULE_DESCRIPTION() in crypto/xor.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/acpi/nfit/nfit.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/block/brd.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/dax/hmem/dax_hmem.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/dax/device_dax.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/dax/kmem.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/dax/dax_pmem.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/scsi/isci/isci.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/nvme/host/nvme-core.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/nvme/host/nvme.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/net/netdevsim/netdevsim.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/cdrom/cdrom.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/devfreq/governor_simpleondemand.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/nvdimm/libnvdimm.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/nvdimm/nd_pmem.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/nvdimm/nd_btt.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/nvdimm/nd_e820.o
WARNING: modpost: missing MODULE_DESCRIPTION() in net/ipv4/ip_tunnel.o
WARNING: modpost: missing MODULE_DESCRIPTION() in net/ipv4/udp_tunnel.o
>> ERROR: modpost: "nvme_fc_rcv_ls_req" [drivers/scsi/qla2xxx/qla2xxx.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
