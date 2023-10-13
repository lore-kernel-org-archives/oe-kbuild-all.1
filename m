Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCC1313AD6
	for <oe-kbuild-all@lists.linux.dev>; Fri, 13 Oct 2023 11:34:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NZfZjWRD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697196873; x=1728732873;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=DxdmK/ffT4++Zn6tlU19+pb04zn9XA3oplXWVP9RfX0=;
  b=NZfZjWRDGzaDBBYx9FTw62PFz+xSzw+Hknu74xXIA8Sr8dizQzdwY8p5
   rOmsfW1ZFndeKiREt+fuOOSqTJrxVyoCw1h9wadz5uNaWjDam0jvX2/tg
   wtOkW7O0s3wnbQknUBuSZ6CVdc+9K/eGVo7Oc9qAaw7P/pxRJPh7cqAfT
   s0L9Q/KoSJ5jBgph401UlOACTv6zIDj+kmQElXtR2iNdEb0HTpd1wKiPX
   4Oj5R64h8rnOPsGQgj10Ywt2+4+4NV0a+TLGfUY1nK82iH7YbAOfYVT7T
   PrzwIl5gexrpkBdOX3UvDD9biPDCHPEoRViQO2ghv6W8Wste8RCwUTOZq
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10861"; a="388013510"
X-IronPort-AV: E=Sophos;i="6.03,222,1694761200"; 
   d="scan'208";a="388013510"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Oct 2023 04:34:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10861"; a="825026434"
X-IronPort-AV: E=Sophos;i="6.03,222,1694761200"; 
   d="scan'208";a="825026434"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by fmsmga004.fm.intel.com with ESMTP; 13 Oct 2023 04:34:30 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qrGR2-0004gf-03;
	Fri, 13 Oct 2023 11:34:28 +0000
Date: Fri, 13 Oct 2023 19:33:28 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:pr/642 2280/30000] sound/soc/fsl/fsl_dsp.c:639:13:
 warning: 'dsp_load_firmware' defined but not used
Message-ID: <202310131956.uSDVzkgk-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Freescale/linux-fslc pr/642
head:   c8b7cf62c7fea8456dec789d550b8006d73b8f04
commit: 45efd194bfb758a98e1f3b64250fb019843b93ff [2280/30000] Merge branch 'audio/next' into next
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20231013/202310131956.uSDVzkgk-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231013/202310131956.uSDVzkgk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310131956.uSDVzkgk-lkp@intel.com/

All warnings (new ones prefixed by >>):

   sound/soc/fsl/fsl_dsp.c: In function 'fsl_dsp_client_register':
   sound/soc/fsl/fsl_dsp.c:153:24: warning: variable 'dev' set but not used [-Wunused-but-set-variable]
     153 |         struct device *dev;
         |                        ^~~
   sound/soc/fsl/fsl_dsp.c: At top level:
   sound/soc/fsl/fsl_dsp.c:341:6: warning: no previous prototype for 'resource_release' [-Wmissing-prototypes]
     341 | void resource_release(struct fsl_dsp *dsp_priv)
         |      ^~~~~~~~~~~~~~~~
   sound/soc/fsl/fsl_dsp.c:718:5: warning: no previous prototype for 'dsp_mu_init' [-Wmissing-prototypes]
     718 | int dsp_mu_init(struct fsl_dsp *dsp_priv)
         |     ^~~~~~~~~~~
>> sound/soc/fsl/fsl_dsp.c:639:13: warning: 'dsp_load_firmware' defined but not used [-Wunused-function]
     639 | static void dsp_load_firmware(const struct firmware *fw, void *context)
         |             ^~~~~~~~~~~~~~~~~


vim +/dsp_load_firmware +639 sound/soc/fsl/fsl_dsp.c

4520379e9ce7b7 sound/soc/fsl/fsl_hifi4.c Shengjiu Wang 2017-06-01  638  
6b7b1ae0ecddc2 sound/soc/fsl/fsl_dsp.c   Weiguang Kong 2018-04-18 @639  static void dsp_load_firmware(const struct firmware *fw, void *context)
4520379e9ce7b7 sound/soc/fsl/fsl_hifi4.c Shengjiu Wang 2017-06-01  640  {
6b7b1ae0ecddc2 sound/soc/fsl/fsl_dsp.c   Weiguang Kong 2018-04-18  641  	struct fsl_dsp *dsp_priv = context;
6b7b1ae0ecddc2 sound/soc/fsl/fsl_dsp.c   Weiguang Kong 2018-04-18  642  	struct device *dev = dsp_priv->dev;
4520379e9ce7b7 sound/soc/fsl/fsl_hifi4.c Shengjiu Wang 2017-06-01  643  	Elf32_Ehdr *ehdr; /* Elf header structure pointer */
4520379e9ce7b7 sound/soc/fsl/fsl_hifi4.c Shengjiu Wang 2017-06-01  644  	Elf32_Shdr *shdr; /* Section header structure pointer */
c20260581b086b sound/soc/fsl/fsl_hifi4.c Shengjiu Wang 2017-10-19  645  	Elf32_Addr  sh_addr;
4520379e9ce7b7 sound/soc/fsl/fsl_hifi4.c Shengjiu Wang 2017-06-01  646  	unsigned char *strtab = 0; /* String table pointer */
4520379e9ce7b7 sound/soc/fsl/fsl_hifi4.c Shengjiu Wang 2017-06-01  647  	unsigned char *image; /* Binary image pointer */
4520379e9ce7b7 sound/soc/fsl/fsl_hifi4.c Shengjiu Wang 2017-06-01  648  	int i; /* Loop counter */
62bd3cf2038786 sound/soc/fsl/fsl_hifi4.c Shengjiu Wang 2017-08-09  649  	unsigned long addr;
4520379e9ce7b7 sound/soc/fsl/fsl_hifi4.c Shengjiu Wang 2017-06-01  650  
62bd3cf2038786 sound/soc/fsl/fsl_hifi4.c Shengjiu Wang 2017-08-09  651  	if (!fw) {
62bd3cf2038786 sound/soc/fsl/fsl_hifi4.c Shengjiu Wang 2017-08-09  652  		dev_info(dev, "external firmware not found\n");
62bd3cf2038786 sound/soc/fsl/fsl_hifi4.c Shengjiu Wang 2017-08-09  653  		return;
62bd3cf2038786 sound/soc/fsl/fsl_hifi4.c Shengjiu Wang 2017-08-09  654  	}
62bd3cf2038786 sound/soc/fsl/fsl_hifi4.c Shengjiu Wang 2017-08-09  655  
62bd3cf2038786 sound/soc/fsl/fsl_hifi4.c Shengjiu Wang 2017-08-09  656  	addr = (unsigned long)fw->data;
4520379e9ce7b7 sound/soc/fsl/fsl_hifi4.c Shengjiu Wang 2017-06-01  657  	ehdr = (Elf32_Ehdr *)addr;
4520379e9ce7b7 sound/soc/fsl/fsl_hifi4.c Shengjiu Wang 2017-06-01  658  
4520379e9ce7b7 sound/soc/fsl/fsl_hifi4.c Shengjiu Wang 2017-06-01  659  	/* Find the section header string table for output info */
4520379e9ce7b7 sound/soc/fsl/fsl_hifi4.c Shengjiu Wang 2017-06-01  660  	shdr = (Elf32_Shdr *)(addr + ehdr->e_shoff +
4520379e9ce7b7 sound/soc/fsl/fsl_hifi4.c Shengjiu Wang 2017-06-01  661  			(ehdr->e_shstrndx * sizeof(Elf32_Shdr)));
4520379e9ce7b7 sound/soc/fsl/fsl_hifi4.c Shengjiu Wang 2017-06-01  662  
4520379e9ce7b7 sound/soc/fsl/fsl_hifi4.c Shengjiu Wang 2017-06-01  663  	strtab = (unsigned char *)(addr + shdr->sh_offset);
4520379e9ce7b7 sound/soc/fsl/fsl_hifi4.c Shengjiu Wang 2017-06-01  664  
4520379e9ce7b7 sound/soc/fsl/fsl_hifi4.c Shengjiu Wang 2017-06-01  665  	/* Load each appropriate section */
4520379e9ce7b7 sound/soc/fsl/fsl_hifi4.c Shengjiu Wang 2017-06-01  666  	for (i = 0; i < ehdr->e_shnum; ++i) {
4520379e9ce7b7 sound/soc/fsl/fsl_hifi4.c Shengjiu Wang 2017-06-01  667  		shdr = (Elf32_Shdr *)(addr + ehdr->e_shoff +
4520379e9ce7b7 sound/soc/fsl/fsl_hifi4.c Shengjiu Wang 2017-06-01  668  				(i * sizeof(Elf32_Shdr)));
4520379e9ce7b7 sound/soc/fsl/fsl_hifi4.c Shengjiu Wang 2017-06-01  669  
4520379e9ce7b7 sound/soc/fsl/fsl_hifi4.c Shengjiu Wang 2017-06-01  670  		if (!(shdr->sh_flags & SHF_ALLOC) ||
4520379e9ce7b7 sound/soc/fsl/fsl_hifi4.c Shengjiu Wang 2017-06-01  671  			shdr->sh_addr == 0 || shdr->sh_size == 0)
4520379e9ce7b7 sound/soc/fsl/fsl_hifi4.c Shengjiu Wang 2017-06-01  672  			continue;
4520379e9ce7b7 sound/soc/fsl/fsl_hifi4.c Shengjiu Wang 2017-06-01  673  
4520379e9ce7b7 sound/soc/fsl/fsl_hifi4.c Shengjiu Wang 2017-06-01  674  		dev_dbg(dev, "%sing %s @ 0x%08lx (%ld bytes)\n",
4520379e9ce7b7 sound/soc/fsl/fsl_hifi4.c Shengjiu Wang 2017-06-01  675  			(shdr->sh_type == SHT_NOBITS) ? "Clear" : "Load",
1ac4dce34cf996 sound/soc/fsl/fsl_dsp.c   Daniel Baluta 2018-11-13  676  			&strtab[shdr->sh_name], (unsigned long)shdr->sh_addr,
4520379e9ce7b7 sound/soc/fsl/fsl_hifi4.c Shengjiu Wang 2017-06-01  677  			(long)shdr->sh_size);
f4fa46fed6abbe sound/soc/fsl/fsl_hifi4.c Weiguang Kong 2017-06-28  678  
c20260581b086b sound/soc/fsl/fsl_hifi4.c Shengjiu Wang 2017-10-19  679  		sh_addr = shdr->sh_addr;
c20260581b086b sound/soc/fsl/fsl_hifi4.c Shengjiu Wang 2017-10-19  680  
a3101ecf1ae97c sound/soc/fsl/fsl_hifi4.c Weiguang Kong 2017-10-23  681  		if (shdr->sh_type == SHT_NOBITS) {
6b7b1ae0ecddc2 sound/soc/fsl/fsl_dsp.c   Weiguang Kong 2018-04-18  682  			memset_dsp((void *)(dsp_priv->sdram_vir_addr +
6b7b1ae0ecddc2 sound/soc/fsl/fsl_dsp.c   Weiguang Kong 2018-04-18  683  				(sh_addr - dsp_priv->sdram_phys_addr)),
a3101ecf1ae97c sound/soc/fsl/fsl_hifi4.c Weiguang Kong 2017-10-23  684  				0,
a3101ecf1ae97c sound/soc/fsl/fsl_hifi4.c Weiguang Kong 2017-10-23  685  				shdr->sh_size);
a3101ecf1ae97c sound/soc/fsl/fsl_hifi4.c Weiguang Kong 2017-10-23  686  		} else {
a3101ecf1ae97c sound/soc/fsl/fsl_hifi4.c Weiguang Kong 2017-10-23  687  			image = (unsigned char *)addr + shdr->sh_offset;
f4fa46fed6abbe sound/soc/fsl/fsl_hifi4.c Weiguang Kong 2017-06-28  688  			if ((!strcmp(&strtab[shdr->sh_name], ".rodata")) ||
f4fa46fed6abbe sound/soc/fsl/fsl_hifi4.c Weiguang Kong 2017-06-28  689  				(!strcmp(&strtab[shdr->sh_name], ".text"))   ||
f4fa46fed6abbe sound/soc/fsl/fsl_hifi4.c Weiguang Kong 2017-06-28  690  				(!strcmp(&strtab[shdr->sh_name], ".data"))   ||
f4fa46fed6abbe sound/soc/fsl/fsl_hifi4.c Weiguang Kong 2017-06-28  691  				(!strcmp(&strtab[shdr->sh_name], ".bss"))
f4fa46fed6abbe sound/soc/fsl/fsl_hifi4.c Weiguang Kong 2017-06-28  692  			) {
6b7b1ae0ecddc2 sound/soc/fsl/fsl_dsp.c   Weiguang Kong 2018-04-18  693  				memcpy_dsp((void *)(dsp_priv->sdram_vir_addr
6b7b1ae0ecddc2 sound/soc/fsl/fsl_dsp.c   Weiguang Kong 2018-04-18  694  				  + (sh_addr - dsp_priv->sdram_phys_addr)),
a3101ecf1ae97c sound/soc/fsl/fsl_hifi4.c Weiguang Kong 2017-10-23  695  				  (const void *)image,
4520379e9ce7b7 sound/soc/fsl/fsl_hifi4.c Shengjiu Wang 2017-06-01  696  				  shdr->sh_size);
4520379e9ce7b7 sound/soc/fsl/fsl_hifi4.c Shengjiu Wang 2017-06-01  697  			} else {
8184e47416f8e5 sound/soc/fsl/fsl_dsp.c   Daniel Baluta 2018-05-23  698  				/* sh_addr is from DSP view, we need to
8184e47416f8e5 sound/soc/fsl/fsl_dsp.c   Daniel Baluta 2018-05-23  699  				 * fixup addr because we load the firmware from
8184e47416f8e5 sound/soc/fsl/fsl_dsp.c   Daniel Baluta 2018-05-23  700  				 * the ARM core side
8184e47416f8e5 sound/soc/fsl/fsl_dsp.c   Daniel Baluta 2018-05-23  701  				 */
8184e47416f8e5 sound/soc/fsl/fsl_dsp.c   Daniel Baluta 2018-05-23  702  				sh_addr -= dsp_priv->fixup_offset;
8184e47416f8e5 sound/soc/fsl/fsl_dsp.c   Daniel Baluta 2018-05-23  703  
6b7b1ae0ecddc2 sound/soc/fsl/fsl_dsp.c   Weiguang Kong 2018-04-18  704  				memcpy_dsp((void *)(dsp_priv->regs +
6b7b1ae0ecddc2 sound/soc/fsl/fsl_dsp.c   Weiguang Kong 2018-04-18  705  						(sh_addr - dsp_priv->paddr)),
4520379e9ce7b7 sound/soc/fsl/fsl_hifi4.c Shengjiu Wang 2017-06-01  706  						(const void *)image,
4520379e9ce7b7 sound/soc/fsl/fsl_hifi4.c Shengjiu Wang 2017-06-01  707  						shdr->sh_size);
4520379e9ce7b7 sound/soc/fsl/fsl_hifi4.c Shengjiu Wang 2017-06-01  708  			}
4520379e9ce7b7 sound/soc/fsl/fsl_hifi4.c Shengjiu Wang 2017-06-01  709  		}
a3101ecf1ae97c sound/soc/fsl/fsl_hifi4.c Weiguang Kong 2017-10-23  710  	}
4520379e9ce7b7 sound/soc/fsl/fsl_hifi4.c Shengjiu Wang 2017-06-01  711  
4520379e9ce7b7 sound/soc/fsl/fsl_hifi4.c Shengjiu Wang 2017-06-01  712  	/* start the core */
6b7b1ae0ecddc2 sound/soc/fsl/fsl_dsp.c   Weiguang Kong 2018-04-18  713  	imx_sc_pm_cpu_start(dsp_priv->dsp_ipcHandle,
6b7b1ae0ecddc2 sound/soc/fsl/fsl_dsp.c   Weiguang Kong 2018-04-18  714  					IMX_SC_R_DSP, true, dsp_priv->iram);
4520379e9ce7b7 sound/soc/fsl/fsl_hifi4.c Shengjiu Wang 2017-06-01  715  }
4520379e9ce7b7 sound/soc/fsl/fsl_hifi4.c Shengjiu Wang 2017-06-01  716  

:::::: The code at line 639 was first introduced by commit
:::::: 6b7b1ae0ecddc26b44c1510370ed27511dbb1fdb MLK-17747: dsp: use the name of dsp instead of hifi

:::::: TO: Weiguang Kong <weiguang.kong@nxp.com>
:::::: CC: Dong Aisheng <aisheng.dong@nxp.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
