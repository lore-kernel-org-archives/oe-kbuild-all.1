Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEF161FDD
	for <oe-kbuild-all@lists.linux.dev>; Tue, 20 Jun 2023 07:32:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1687246323; x=1718782323;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=yfuoAhgXzoobUMBk2rpF4U6tM/apHTaVwpccQ/Mkz8c=;
  b=NmGX3YRys1h4oDLPbeY/Wll7T8tzz2tken4eHaWeMV1H59bXAH6NDKz2
   3YBZybl49c/XdEQi4kaZuJ7Yn/gHrmox5/tQD7dPCHkraF2wvUx36kL/i
   ZzoV6Gz8iwFp812DSj4+Q004htQKAVCo1lmb02hkMnvLZyQahFbYDBjx6
   F2HB4tgw950UkZ2pgsSnA/C/vvndKk86gTAPxEvCVAYgxmCIfatoqImSR
   EXUiSh5Qqd942TcGPiwZCQwQGKJt32SeBDS7SKytAh/sfUbQ0rDV35UdF
   pucnCu2Vf1CRJROj687JPTn1Ymv0HJJg90IMNO+B3Y+hYn2IRdtWLHbJ7
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10746"; a="423456294"
X-IronPort-AV: E=Sophos;i="6.00,256,1681196400"; 
   d="scan'208";a="423456294"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jun 2023 00:32:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10746"; a="691333688"
X-IronPort-AV: E=Sophos;i="6.00,256,1681196400"; 
   d="scan'208";a="691333688"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 20 Jun 2023 00:32:01 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qBVqL-0005ds-06;
	Tue, 20 Jun 2023 07:32:01 +0000
Date: Tue, 20 Jun 2023 15:31:31 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android13-5.15 9/10]
 drivers/media/pci/mantis/mantis_dma.c:212: undefined reference to
 `dvb_dmx_swfilter_204'
Message-ID: <202306201513.Z7CTr0b8-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Todd,

First bad commit (maybe != root cause):

tree:   https://android.googlesource.com/kernel/common android13-5.15
head:   c6d386b8a6c4b9cfaee609fb1a0f291ba70e99f9
commit: ecb7d6b1064c1733ee9e84742cb0a4323389ef6c [9/10] ANDROID: remove inclusions from hook definition headers
config: i386-randconfig-c001-20230620 (https://download.01.org/0day-ci/archive/20230620/202306201513.Z7CTr0b8-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230620/202306201513.Z7CTr0b8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306201513.Z7CTr0b8-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: warning: arch/x86/power/hibernate_asm_32.o: missing .note.GNU-stack section implies executable stack
   ld: NOTE: This behaviour is deprecated and will be removed in a future version of the linker
   ld: warning: arch/x86/power/hibernate_asm_32.o: missing .note.GNU-stack section implies executable stack
   ld: NOTE: This behaviour is deprecated and will be removed in a future version of the linker
   ld: drivers/media/pci/mantis/mantis_dma.o: in function `mantis_dma_xfer':
>> drivers/media/pci/mantis/mantis_dma.c:212: undefined reference to `dvb_dmx_swfilter_204'
>> ld: drivers/media/pci/mantis/mantis_dma.c:212: undefined reference to `dvb_dmx_swfilter'
   ld: drivers/media/pci/mantis/mantis_dvb.o: in function `mantis_dvb_init':
>> drivers/media/pci/mantis/mantis_dvb.c:142: undefined reference to `dvb_register_adapter'
>> ld: drivers/media/pci/mantis/mantis_dvb.c:167: undefined reference to `dvb_dmx_init'
>> ld: drivers/media/pci/mantis/mantis_dvb.c:179: undefined reference to `dvb_dmxdev_init'
>> ld: drivers/media/pci/mantis/mantis_dvb.c:221: undefined reference to `dvb_register_frontend'
>> ld: drivers/media/pci/mantis/mantis_dvb.c:257: undefined reference to `dvb_unregister_adapter'
>> ld: drivers/media/pci/mantis/mantis_dvb.c:251: undefined reference to `dvb_dmxdev_release'
>> ld: drivers/media/pci/mantis/mantis_dvb.c:254: undefined reference to `dvb_dmx_release'
>> ld: drivers/media/pci/mantis/mantis_dvb.c:241: undefined reference to `dvb_unregister_frontend'
>> ld: drivers/media/pci/mantis/mantis_dvb.c:242: undefined reference to `dvb_frontend_detach'
   ld: drivers/media/pci/mantis/mantis_dvb.o: in function `mantis_dvb_exit':
>> drivers/media/pci/mantis/mantis_dvb.c:272: undefined reference to `dvb_unregister_frontend'
   ld: drivers/media/pci/mantis/mantis_dvb.c:273: undefined reference to `dvb_frontend_detach'
   ld: drivers/media/pci/mantis/mantis_dvb.c:282: undefined reference to `dvb_dmxdev_release'
   ld: drivers/media/pci/mantis/mantis_dvb.c:283: undefined reference to `dvb_dmx_release'
   ld: drivers/media/pci/mantis/mantis_dvb.c:286: undefined reference to `dvb_unregister_adapter'
   ld: drivers/media/pci/mantis/mantis_evm.o: in function `mantis_hifevm_work':
>> drivers/media/pci/mantis/mantis_evm.c:50: undefined reference to `dvb_ca_en50221_camchange_irq'
>> ld: drivers/media/pci/mantis/mantis_evm.c:41: undefined reference to `dvb_ca_en50221_camchange_irq'
   ld: drivers/media/pci/mantis/mantis_ca.o: in function `mantis_ca_slot_reset':
>> drivers/media/pci/mantis/mantis_ca.c:91: undefined reference to `dvb_ca_en50221_camready_irq'
   ld: drivers/media/pci/mantis/mantis_ca.o: in function `mantis_ca_init':
>> drivers/media/pci/mantis/mantis_ca.c:169: undefined reference to `dvb_ca_en50221_init'
   ld: drivers/media/pci/mantis/mantis_ca.o: in function `mantis_ca_exit':
>> drivers/media/pci/mantis/mantis_ca.c:193: undefined reference to `dvb_ca_en50221_release'
   ld: drivers/media/pci/mantis/mantis_pcmcia.o: in function `mantis_pcmcia_init':
>> drivers/media/pci/mantis/mantis_pcmcia.c:88: undefined reference to `dvb_ca_en50221_camchange_irq'
>> ld: drivers/media/pci/mantis/mantis_pcmcia.c:95: undefined reference to `dvb_ca_en50221_camchange_irq'

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for ARCH_HAS_NONLEAF_PMD_YOUNG
   Depends on [n]: PGTABLE_LEVELS [=2]>2
   Selected by [y]:
   - X86 [=y]


vim +212 drivers/media/pci/mantis/mantis_dma.c

41e840b13e111b drivers/media/dvb/mantis/mantis_dma.c Manu Abraham  2009-12-02  201  
41e840b13e111b drivers/media/dvb/mantis/mantis_dma.c Manu Abraham  2009-12-02  202  
4cf709c9aba062 drivers/media/pci/mantis/mantis_dma.c Allen Pais    2020-08-17  203  void mantis_dma_xfer(struct tasklet_struct *t)
41e840b13e111b drivers/media/dvb/mantis/mantis_dma.c Manu Abraham  2009-12-02  204  {
4cf709c9aba062 drivers/media/pci/mantis/mantis_dma.c Allen Pais    2020-08-17  205  	struct mantis_pci *mantis = from_tasklet(mantis, t, tasklet);
33c79630dd9fb7 drivers/media/dvb/mantis/mantis_dma.c Manu Abraham  2009-12-03  206  	struct mantis_hwconfig *config = mantis->hwconfig;
41e840b13e111b drivers/media/dvb/mantis/mantis_dma.c Manu Abraham  2009-12-02  207  
79d06d4dff733e drivers/media/dvb/mantis/mantis_dma.c Marko Ristola 2010-08-07  208  	while (mantis->last_block != mantis->busy_block) {
b3b961448f7023 drivers/media/dvb/mantis/mantis_dma.c Manu Abraham  2009-12-04  209  		dprintk(MANTIS_DEBUG, 1, "last block=[%d] finished block=[%d]",
79d06d4dff733e drivers/media/dvb/mantis/mantis_dma.c Marko Ristola 2010-08-07  210  			mantis->last_block, mantis->busy_block);
41e840b13e111b drivers/media/dvb/mantis/mantis_dma.c Manu Abraham  2009-12-02  211  
33c79630dd9fb7 drivers/media/dvb/mantis/mantis_dma.c Manu Abraham  2009-12-03 @212  		(config->ts_size ? dvb_dmx_swfilter_204 : dvb_dmx_swfilter)

:::::: The code at line 212 was first introduced by commit
:::::: 33c79630dd9fb7658dbb885a22e3a8127b16a38a V4L/DVB (13714): [MB86A16] FIX/Code simplification: use hwconfig->ts_size instead of ts_size

:::::: TO: Manu Abraham <abraham.manu@gmail.com>
:::::: CC: Mauro Carvalho Chehab <mchehab@redhat.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
