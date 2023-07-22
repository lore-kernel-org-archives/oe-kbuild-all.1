Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB5EE11C9A
	for <oe-kbuild-all@lists.linux.dev>; Sat, 22 Jul 2023 09:46:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690019160; x=1721555160;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=s5AAqnIhbbbmDTNvuB2OB/PaRhlO68ytuYmm2Z7sBFw=;
  b=mhTy2YZsiouZwGYgGNgySUUTmo1zXukG8d1X883CQ4O2CTU5qz592I6K
   R5dV/eqwrsulV1Qw9BDlIsbdBrDtd3h2UH8+1csvZfOmy/sUfS2UPanWW
   mQDkQhJkQJg7tGkMmVgg039Di4TluF8KwIzojAuV5PQhDQiru6Pvgb6V8
   kjvUkypllpvF6F8Ky4BTEHq+pzm7821bk/tsZ+0OFZ5lHm82SZnRxt3kU
   fCeD8EWSn/5kppMkh7E8pA8qKyPPRcryP9X8TY1lBPGkWS+kuqxCpzeS5
   6Fiz2QVUb2i+uvSdTIb1qlrM7iafq1muh0+mfOwlyMIgEdMgnXQBTiEu1
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10778"; a="433413617"
X-IronPort-AV: E=Sophos;i="6.01,224,1684825200"; 
   d="scan'208";a="433413617"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jul 2023 02:46:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10778"; a="815288954"
X-IronPort-AV: E=Sophos;i="6.01,224,1684825200"; 
   d="scan'208";a="815288954"
Received: from lkp-server02.sh.intel.com (HELO 36946fcf73d7) ([10.239.97.151])
  by FMSMGA003.fm.intel.com with ESMTP; 22 Jul 2023 02:46:00 -0700
Received: from kbuild by 36946fcf73d7 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qN9BX-0008E9-1F;
	Sat, 22 Jul 2023 09:45:59 +0000
Date: Sat, 22 Jul 2023 17:45:46 +0800
From: kernel test robot <lkp@intel.com>
To: Xiaoguang Xing <xiaoguang.xing@sophgo.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [csky-linux:sg2042-master-qspinlock-64ilp32_v3 8/67]
 pcie-cadence-sophgo.c:undefined reference to
 `cdns_pcie_get_parent_irq_domain'
Message-ID: <202307221718.qzeGrHVc-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/c-sky/csky-linux sg2042-master-qspinlock-64ilp32_v3
head:   7f9f76d36814ed6fcbca4c27a5d2ec3724c46add
commit: 7b0ad6270e48635cd221c2a13a361542f3dcb947 [8/67] driver: pcie: Add sophgo sg2042 soc support
config: s390-allyesconfig (https://download.01.org/0day-ci/archive/20230722/202307221718.qzeGrHVc-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230722/202307221718.qzeGrHVc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307221718.qzeGrHVc-lkp@intel.com/

All errors (new ones prefixed by >>):

   s390-linux-ld: drivers/pci/controller/cadence/pcie-cadence-sophgo.o: in function `cdns_pcie_host_probe':
>> pcie-cadence-sophgo.c:(.text+0x34d2): undefined reference to `cdns_pcie_get_parent_irq_domain'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
