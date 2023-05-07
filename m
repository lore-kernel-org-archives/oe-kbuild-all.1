Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D181C3239
	for <oe-kbuild-all@lists.linux.dev>; Sun,  7 May 2023 20:22:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683490963; x=1715026963;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=lovJotiqOZIfXvJKi8tUbUOAb3IiRsyro5/6OYTWHVw=;
  b=LaN1qrIo9I0oSkO7o4GmQAWVRzJMTOtosQAETZBeq56Pbr+s1UqeOlsc
   xa+2LFDGLxOj5G9dVfJm9YxVUqpOe+/wOuL5gjhGaSWupVvS/HL9F1tTa
   JEZaDmRrdtYyujVztKXxlu8J3a+63iR2TVk/lRK2ux440VfxJi36f1q+o
   unnlVQKD/9SSFZPw1ZF2zIeGdFX7lwR1hIjUxhzSzJhZm8QCNG2kOk2Gz
   Gn19g76DsnahI4K9knw7lAxDuNhUGzI9CIPfxLaRH9X4jpboUhwPKCCxm
   vLJFu8ADW2zmaL9S+qNgKyqA1UZjjLcVKoj+6vhlFLWRAZnZaX5J6GiJZ
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10703"; a="435829461"
X-IronPort-AV: E=Sophos;i="5.99,257,1677571200"; 
   d="scan'208";a="435829461"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2023 13:22:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10703"; a="763147733"
X-IronPort-AV: E=Sophos;i="5.99,257,1677571200"; 
   d="scan'208";a="763147733"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 07 May 2023 13:22:41 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pvku1-0000qr-0F;
	Sun, 07 May 2023 20:22:41 +0000
Date: Mon, 8 May 2023 04:22:27 +0800
From: kernel test robot <lkp@intel.com>
To: Manisha Chinthapally <manisha.chinthapally@intel.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Faycal Benmlih <faycal.benmlih@intel.com>
Subject: drivers/platform/x86/socwatch/sw_telem.c:239:33: sparse: sparse:
 cast removes address space '__iomem' of expression
Message-ID: <202305080412.KEMnYKbb-lkp@intel.com>
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
date:   2 years, 7 months ago
config: i386-randconfig-s003 (https://download.01.org/0day-ci/archive/20230508/202305080412.KEMnYKbb-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
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
        make W=1 C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=i386 SHELL=/bin/bash drivers/platform/x86/socperf/ drivers/platform/x86/socwatch/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202305080412.KEMnYKbb-lkp@intel.com/

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
   273	/**
   274	 * setup_pmc_mbox -- Setup PMC virtual mappings
   275	 *
   276	 * Returns: true if setup successfully
   277	 */
   278	static bool setup_pmc_mbox(void)
   279	{
   280		s_pmcIPCCmdAddr = (u64 *)ioremap_cache(
   281				(unsigned long)s_mchBarAddrs[TELEM_IPC1BAR_CFG] +
   282				PMC_IPC_CMD, 0x4);
   283		s_pmcIPCStsAddr = (u64 *)ioremap_cache(
   284				(unsigned long)s_mchBarAddrs[TELEM_IPC1BAR_CFG] +
   285				PMC_IPC_STATUS, 0x4);
   286		s_pmcIPCWBufAddr = (u64 *)ioremap_cache(
   287				(unsigned long)s_mchBarAddrs[TELEM_IPC1BAR_CFG] +
   288				PMC_IPC_WRITE_BUFFER, 0x4);
   289		s_pmcIPCRBufAddr = (u64 *)ioremap_cache(
   290				(unsigned long)s_mchBarAddrs[TELEM_IPC1BAR_CFG] +
   291				PMC_IPC_READ_BUFFER, 0x4);
   292		s_telemEventInfo[TELEM_PMC].ssram_virt_addr = (u64 *)ioremap_cache(
   293				(unsigned long)s_mchBarAddrs[TELEM_SSRAMBAR_CFG] +
   294				IOSS_TELEM_SSRAM_OFFSET, TELEM_SSRAM_SIZE);
   295	
   296		return (s_pmcIPCCmdAddr && s_pmcIPCStsAddr &&
   297			s_pmcIPCWBufAddr && s_pmcIPCRBufAddr &&
   298			s_telemEventInfo[TELEM_PMC].ssram_virt_addr);
   299	}
   300	
   301	/**
   302	 * destroy_pmc_mbox -- Unmap PMC virtual addresses
   303	 */
   304	static void destroy_pmc_mbox(void)
   305	{
   306		if (s_pmcIPCCmdAddr) {
   307			iounmap(s_pmcIPCCmdAddr);
   308			s_pmcIPCCmdAddr = NULL;
   309		}
   310		if (s_pmcIPCStsAddr) {
   311			iounmap(s_pmcIPCStsAddr);
   312			s_pmcIPCStsAddr = NULL;
   313		}
   314		if (s_pmcIPCWBufAddr) {
 > 315			iounmap(s_pmcIPCWBufAddr);
   316			s_pmcIPCWBufAddr = NULL;
   317		}
   318		if (s_pmcIPCRBufAddr) {
   319			iounmap(s_pmcIPCRBufAddr);
   320			s_pmcIPCRBufAddr = NULL;
   321		}
   322		if (s_telemEventInfo[TELEM_PMC].ssram_virt_addr) {
   323			iounmap(s_telemEventInfo[TELEM_PMC].ssram_virt_addr);
   324			s_telemEventInfo[TELEM_PMC].ssram_virt_addr = NULL;
   325		}
   326	}
   327	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
