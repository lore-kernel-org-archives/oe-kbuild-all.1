Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C878142900
	for <oe-kbuild-all@lists.linux.dev>; Mon, 19 Aug 2024 11:42:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724067779; cv=none; b=cDd4rkl/KyQdr7fidFixqBlJ/eRs2jpRt5wtDYwB2fwI7Zm6oLT8D93HqWW97imZxXfiGNn5zpK2xY9gPgbaK/g8w67lb8YaVJGb+6uJ3Oxh3UIHt8M3O7jORqCddpiYKWjQdHAcO+ui2AMwDl8AlHyLixQWZQDM8gnhQwrk044=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724067779; c=relaxed/simple;
	bh=kp/L4HXX41beGPivspfrd7eqFobGz4zsKhEhfXgsY0A=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=LuIiaGnaAuDjSOz7rz+gfqQP6/+ZNmlngJntAwF1+I+ZYLzPOjGfjtCOutoqf19nNe1xIVrrz5Y9I9D8LmIfsF+TFVFF1Rhu4JG43rLrGQ69tudfhVeIj9PfFsv+vt613jqUS75oDOq9zJwmrUjrUBi2Zk7NH859UIkEmOBZGFI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TP4FW1QX; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TP4FW1QX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724067777; x=1755603777;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=kp/L4HXX41beGPivspfrd7eqFobGz4zsKhEhfXgsY0A=;
  b=TP4FW1QXtrfbOBV5Sd/vJII+H/OrRExUkMPDI3CpRfFe+TrcffHC774v
   jZa/58MSAcoZgem1Dcn219fGMjJpcTBTv8tR6yH5So8DNGHqqRpYgNdRn
   csi1pPE7har9P6ElbGvUiX9F6lM+fc8k+VmA1a58Ebxz6f6vAVFbBrYZg
   gr8/bA8VIz/61hM9VxXY9MkpiUSZzK89XPCFTm4S5h7wR2XmcBxg6nRCY
   5vxXGQnwA5g+0ngNQ2EHJ/KpS3DZ6f7csj7vUm4kvnUJ16s+CnvZ0Co1D
   pvD88zNMdJ/ydRzKUXd5gmTYARezBj2Wc3fmR6KCSusThV0JN4ESuaqlN
   w==;
X-CSE-ConnectionGUID: u8JnXkfSTRGqQjDlHZy0ng==
X-CSE-MsgGUID: ezVvHeclTtu74Na7yy3KKA==
X-IronPort-AV: E=McAfee;i="6700,10204,11168"; a="33460745"
X-IronPort-AV: E=Sophos;i="6.10,159,1719903600"; 
   d="scan'208";a="33460745"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Aug 2024 04:42:57 -0700
X-CSE-ConnectionGUID: UgzstSwjRZC/cBooNVkd9w==
X-CSE-MsgGUID: awyaJ5ocTyWYwkOIPKaGVw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,159,1719903600"; 
   d="scan'208";a="97820731"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 19 Aug 2024 04:42:53 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sg0mg-0008wk-2q;
	Mon, 19 Aug 2024 11:42:50 +0000
Date: Mon, 19 Aug 2024 19:42:29 +0800
From: kernel test robot <lkp@intel.com>
To: jasperwang@tencent.com, kaixuxia@tencent.com, frankjpliu@tencent.com,
	kasong@tencent.com, sagazchen@tencent.com, kernelxing@tencent.com,
	aurelianliu@tencent.com, deshengwu@tencent.com,
	flyingpeng@tencent.com, jason.zeng@intel.com, wu.zheng@intel.com,
	yingbao.jia@intel.com, pei.p.jia@intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [opencloudos:next 9908/9920] drivers/ata/libahci.c:210:5: warning:
 no previous prototype for 'get_ahci_em_messages'
Message-ID: <202408191944.mGrQdHFU-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/OpenCloudOS/OpenCloudOS-Kernel.git next
head:   ded8f0c62cf3929b2366c3747012f1e23effd709
commit: 7163102e0aaa3f66d264a6076436c717a13762a1 [9908/9920] ata: ahci: Add support for AHCI SGPIO Enclosure Management
config: x86_64-defconfig (https://download.01.org/0day-ci/archive/20240819/202408191944.mGrQdHFU-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240819/202408191944.mGrQdHFU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408191944.mGrQdHFU-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/ata/libahci.c:210:5: warning: no previous prototype for 'get_ahci_em_messages' [-Wmissing-prototypes]
     210 | int get_ahci_em_messages(void)
         |     ^~~~~~~~~~~~~~~~~~~~
--
>> drivers/ata/ahci_zhaoxin_sgpio.c:31:5: warning: no previous prototype for 'ahci_wait_em_reset' [-Wmissing-prototypes]
      31 | int ahci_wait_em_reset(struct sgpio_zhaoxin *sgpio_zhaoxin, u32 retry)
         |     ^~~~~~~~~~~~~~~~~~
>> drivers/ata/ahci_zhaoxin_sgpio.c:55:6: warning: no previous prototype for 'ahci_zhaoxin_set_em_sgpio' [-Wmissing-prototypes]
      55 | void ahci_zhaoxin_set_em_sgpio(struct sgpio_zhaoxin *sgpio_zhaoxin)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/ata/ahci_zhaoxin_sgpio.c:99:6: warning: no previous prototype for 'ahci_zhaoxin_set_em_sgpio_gpmode' [-Wmissing-prototypes]
      99 | void ahci_zhaoxin_set_em_sgpio_gpmode(struct sgpio_zhaoxin *sgpio_zhaoxin)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/ata/ahci_zhaoxin_sgpio.c:601:6: warning: no previous prototype for 'set_em_messages' [-Wmissing-prototypes]
     601 | void set_em_messages(struct sgpio_zhaoxin *sgpio_zhaoxin)
         |      ^~~~~~~~~~~~~~~
>> drivers/ata/ahci_zhaoxin_sgpio.c:621:5: warning: no previous prototype for 'add_sgpio_zhaoxin' [-Wmissing-prototypes]
     621 | int add_sgpio_zhaoxin(void)
         |     ^~~~~~~~~~~~~~~~~
>> drivers/ata/ahci_zhaoxin_sgpio.c:673:6: warning: no previous prototype for 'remove_sgpio_zhaoxin' [-Wmissing-prototypes]
     673 | void remove_sgpio_zhaoxin(void)
         |      ^~~~~~~~~~~~~~~~~~~~


vim +/get_ahci_em_messages +210 drivers/ata/libahci.c

   209	
 > 210	int get_ahci_em_messages(void)
   211	{
   212		return ahci_em_messages;
   213	}
   214	EXPORT_SYMBOL_GPL(get_ahci_em_messages);
   215	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
