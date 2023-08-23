Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A956115B5
	for <oe-kbuild-all@lists.linux.dev>; Wed, 23 Aug 2023 02:46:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692758763; x=1724294763;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Bd4dNigM0uiXVU8EMEntGbdRWukePudO9Amgu03hebk=;
  b=WOjerjis9iG9JsFEc3V66PfsTsyE72ULjcwJ5eZV3Tb7cMkySFu+FHee
   6ApkgMMlOBnFpzyWs+cgNYhU2JMKs34cqVfkquX8J1eqsBsDyYWFFH/z1
   AoT/cjWaCD8ioNXLvxjmbTLdo4J3+DJnrmgHceN85ENAUKl+O6Zb0S3bT
   owGY5TaM4RC4rwrCHFDH2809GTBV6Hgdflw0irx8IyvvTFVNbUOa0wvCR
   nwQTB+1KmpKDgJqq+oHrnN5pe26jD52Rz1Ow3cqoKEJvLhcBjpCT6UkeH
   bRdvxaaL4QVNEVzy9qkWHQV7C8KsqLwlzgw8YrYZ6bgJAgVb1Z1VgoVJ1
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10810"; a="359032974"
X-IronPort-AV: E=Sophos;i="6.01,194,1684825200"; 
   d="scan'208";a="359032974"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Aug 2023 19:46:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10810"; a="910334527"
X-IronPort-AV: E=Sophos;i="6.01,194,1684825200"; 
   d="scan'208";a="910334527"
Received: from lkp-server02.sh.intel.com (HELO daf8bb0a381d) ([10.239.97.151])
  by orsmga005.jf.intel.com with ESMTP; 22 Aug 2023 19:45:59 -0700
Received: from kbuild by daf8bb0a381d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qYdsc-0000mG-1W;
	Wed, 23 Aug 2023 02:45:58 +0000
Date: Wed, 23 Aug 2023 10:45:22 +0800
From: kernel test robot <lkp@intel.com>
To: Manish Rangankar <mrangankar@marvell.com>
Cc: oe-kbuild-all@lists.linux.dev,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	Nilesh Javali <njavali@marvell.com>,
	Himanshu Madhani <himanshu.madhani@oracle.com>
Subject: [mkp-scsi:for-next 113/134] ERROR: modpost: "nvme_fc_rcv_ls_req"
 [drivers/scsi/qla2xxx/qla2xxx.ko] undefined!
Message-ID: <202308231003.WDN2hbAI-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mkp/scsi.git for-next
head:   091462cb57e4ac146f134e258c4f764662ba3961
commit: 875386b98857822b77ac7f95bdf367b70af5b78c [113/134] scsi: qla2xxx: Add Unsolicited LS Request and Response Support for NVMe
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20230823/202308231003.WDN2hbAI-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230823/202308231003.WDN2hbAI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308231003.WDN2hbAI-lkp@intel.com/

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
