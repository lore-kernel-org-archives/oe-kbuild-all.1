Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B2F12583
	for <oe-kbuild-all@lists.linux.dev>; Wed, 29 Mar 2023 14:08:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680098902; x=1711634902;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=4J/oLpR+LsybDTNXpkfVHwQtZat7VxkCiGdAK6F4CCM=;
  b=aVfX8DNLtfdIvhLUDWW3pC8o/Kc9ND18t3vUapC9MfGN4WayqVjM/ng7
   NLFud7ismUCiLrUqxEqQG8w3craVmCz7F8APbNZRbcgT+dH4UuQzOkkGZ
   hVw5DTsjReboi6TxZk6uv+1ZF+NN1Kg/8IAZN9DUwJYyUD1Jltdxuf9WD
   vAI3Z7JM/NmLwi/u+zUUoh8sz/8fV61Eo7J5mOaBYvwHyi7G0NNHiDGEB
   OLbdx14gWFhn5bqxQ6Ya6wNmzAKvdGHqZDV4etwTtGh+Do6e7lRfLCMDF
   GGiFoLl7TRz7I5uKsPLY8N9dXqLmzyUVgxI5n8fB574eQx/VmECt3A7BL
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10664"; a="405829142"
X-IronPort-AV: E=Sophos;i="5.98,301,1673942400"; 
   d="scan'208";a="405829142"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Mar 2023 07:07:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10664"; a="686833827"
X-IronPort-AV: E=Sophos;i="5.98,301,1673942400"; 
   d="scan'208";a="686833827"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 29 Mar 2023 07:07:54 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1phWSv-000JbY-14;
	Wed, 29 Mar 2023 14:07:53 +0000
Date: Wed, 29 Mar 2023 22:07:30 +0800
From: kernel test robot <lkp@intel.com>
To: Manisha Chinthapally <manisha.chinthapally@intel.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Faycal Benmlih <faycal.benmlih@intel.com>
Subject: drivers/platform/x86/socwatch/sw_telem.c:239:33: sparse: sparse:
 cast removes address space '__iomem' of expression
Message-ID: <202303292238.8FLsmHIy-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/mchinth/linux sep_socwatch_linux_5_10
head:   c55df4a2b60fc7c6c4d00fd9f9fb447087833513
commit: 4a8adda8065c4c6944ffedd3025605c845c262a5 SEP/SOCWATCH resolve build errors after rebasing to linux v5.6-rc3
date:   2 years, 6 months ago
config: i386-randconfig-s002 (https://download.01.org/0day-ci/archive/20230329/202303292238.8FLsmHIy-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce:
        # apt-get install sparse
        # sparse version: v0.6.4-39-gce1a6720-dirty
        # https://github.com/mchinth/linux/commit/4a8adda8065c4c6944ffedd3025605c845c262a5
        git remote add mchinth https://github.com/mchinth/linux
        git fetch --no-tags mchinth sep_socwatch_linux_5_10
        git checkout 4a8adda8065c4c6944ffedd3025605c845c262a5
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=i386 olddefconfig
        make W=1 C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=i386 SHELL=/bin/bash drivers/platform/x86/sepdk/pax/ drivers/platform/x86/socperf/ drivers/platform/x86/socwatch/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303292238.8FLsmHIy-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/platform/x86/socwatch/sw_telem.c:239:33: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/platform/x86/socwatch/sw_telem.c:242:28: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/platform/x86/socwatch/sw_telem.c:245:58: sparse: sparse: cast removes address space '__iomem' of expression
>> drivers/platform/x86/socwatch/sw_telem.c:260:25: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got unsigned long long volatile [usertype] *static [assigned] [toplevel] s_punitInterfaceAddr @@
   drivers/platform/x86/socwatch/sw_telem.c:260:25: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/platform/x86/socwatch/sw_telem.c:260:25: sparse:     got unsigned long long volatile [usertype] *static [assigned] [toplevel] s_punitInterfaceAddr
   drivers/platform/x86/socwatch/sw_telem.c:264:25: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got unsigned long long volatile [usertype] *static [assigned] [toplevel] s_punitDataAddr @@
   drivers/platform/x86/socwatch/sw_telem.c:264:25: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/platform/x86/socwatch/sw_telem.c:264:25: sparse:     got unsigned long long volatile [usertype] *static [assigned] [toplevel] s_punitDataAddr
>> drivers/platform/x86/socwatch/sw_telem.c:268:54: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got unsigned long long volatile [usertype] *ssram_virt_addr @@
   drivers/platform/x86/socwatch/sw_telem.c:268:54: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/platform/x86/socwatch/sw_telem.c:268:54: sparse:     got unsigned long long volatile [usertype] *ssram_virt_addr
   drivers/platform/x86/socwatch/sw_telem.c:280:28: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/platform/x86/socwatch/sw_telem.c:283:28: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/platform/x86/socwatch/sw_telem.c:286:29: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/platform/x86/socwatch/sw_telem.c:289:29: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/platform/x86/socwatch/sw_telem.c:292:56: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/platform/x86/socwatch/sw_telem.c:307:25: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got unsigned long long volatile [usertype] *static [assigned] [toplevel] s_pmcIPCCmdAddr @@
   drivers/platform/x86/socwatch/sw_telem.c:307:25: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/platform/x86/socwatch/sw_telem.c:307:25: sparse:     got unsigned long long volatile [usertype] *static [assigned] [toplevel] s_pmcIPCCmdAddr
   drivers/platform/x86/socwatch/sw_telem.c:311:25: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got unsigned long long volatile [usertype] *static [assigned] [toplevel] s_pmcIPCStsAddr @@
   drivers/platform/x86/socwatch/sw_telem.c:311:25: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/platform/x86/socwatch/sw_telem.c:311:25: sparse:     got unsigned long long volatile [usertype] *static [assigned] [toplevel] s_pmcIPCStsAddr
   drivers/platform/x86/socwatch/sw_telem.c:315:25: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got unsigned long long volatile [usertype] *static [assigned] [toplevel] s_pmcIPCWBufAddr @@
   drivers/platform/x86/socwatch/sw_telem.c:315:25: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/platform/x86/socwatch/sw_telem.c:315:25: sparse:     got unsigned long long volatile [usertype] *static [assigned] [toplevel] s_pmcIPCWBufAddr
   drivers/platform/x86/socwatch/sw_telem.c:319:25: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got unsigned long long volatile [usertype] *static [assigned] [toplevel] s_pmcIPCRBufAddr @@
   drivers/platform/x86/socwatch/sw_telem.c:319:25: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/platform/x86/socwatch/sw_telem.c:319:25: sparse:     got unsigned long long volatile [usertype] *static [assigned] [toplevel] s_pmcIPCRBufAddr
   drivers/platform/x86/socwatch/sw_telem.c:323:52: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got unsigned long long volatile [usertype] *ssram_virt_addr @@
   drivers/platform/x86/socwatch/sw_telem.c:323:52: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/platform/x86/socwatch/sw_telem.c:323:52: sparse:     got unsigned long long volatile [usertype] *ssram_virt_addr
>> drivers/platform/x86/socwatch/sw_telem.c:671:5: sparse: sparse: symbol 'read_telem' was not declared. Should it be static?
--
>> drivers/platform/x86/socwatch/sw_trace_notifier_provider.c:1634:67: sparse: sparse: incorrect type in argument 2 (different base types) @@     expected unsigned int flags @@     got restricted gfp_t @@
   drivers/platform/x86/socwatch/sw_trace_notifier_provider.c:1634:67: sparse:     expected unsigned int flags
   drivers/platform/x86/socwatch/sw_trace_notifier_provider.c:1634:67: sparse:     got restricted gfp_t

vim +/__iomem +239 drivers/platform/x86/socwatch/sw_telem.c

   231	
   232	/**
   233	 * setup_punit_mbox -- Setup P-Unit virtual mappings
   234	 *
   235	 * Returns: true if setup successfully
   236	 */
   237	static bool setup_punit_mbox(void)
   238	{
 > 239		s_punitInterfaceAddr = (u64 *)ioremap_cache(
   240					(unsigned long)s_mchBarAddrs[TELEM_MCHBAR_CFG] +
   241					PUNIT_MAILBOX_INTERFACE_OFFSET, 0x4);
   242		s_punitDataAddr = (u64 *)ioremap_cache(
   243					(unsigned long)s_mchBarAddrs[TELEM_MCHBAR_CFG] +
   244					PUNIT_MAILBOX_DATA_OFFSET, 0x4);
   245		s_telemEventInfo[TELEM_PUNIT].ssram_virt_addr = (u64 *)ioremap_cache(
   246					(unsigned long)
   247						s_mchBarAddrs[TELEM_SSRAMBAR_CFG] +
   248					PSS_TELEM_SSRAM_OFFSET, TELEM_SSRAM_SIZE);
   249	
   250		return (s_punitInterfaceAddr && s_punitDataAddr &&
   251			s_telemEventInfo[TELEM_PUNIT].ssram_virt_addr);
   252	}
   253	
   254	/**
   255	 * destroy_punit_mbox -- Unmap p-unit virtual addresses
   256	 */
   257	static void destroy_punit_mbox(void)
   258	{
   259		if (s_punitInterfaceAddr) {
 > 260			iounmap(s_punitInterfaceAddr);
   261			s_punitInterfaceAddr = NULL;
   262		}
   263		if (s_punitDataAddr) {
   264			iounmap(s_punitDataAddr);
   265			s_punitDataAddr = NULL;
   266		}
   267		if (s_telemEventInfo[TELEM_PUNIT].ssram_virt_addr) {
 > 268			iounmap(s_telemEventInfo[TELEM_PUNIT].ssram_virt_addr);
   269			s_telemEventInfo[TELEM_PUNIT].ssram_virt_addr = NULL;
   270		}
   271	}
   272	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
