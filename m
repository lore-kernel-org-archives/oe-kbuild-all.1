Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C207B65D
	for <oe-kbuild-all@lists.linux.dev>; Fri, 23 Feb 2024 01:57:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708653481; cv=none; b=g4qCAlQbAbJ/rRl8V6ssQPM2w3pPGTefNmIrvuHPkAPu//Stm9XvY/2yFmQd4BWxocoT42s0Oi3ZbEudWffIjmltNf08hiNDkY5uHwMWe+JM+C/d95QjBPHso3itX8UG+/RO56eCkau6k3C7OmRs1J3EASuMHOB8rvEEK40praw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708653481; c=relaxed/simple;
	bh=0T0Inu+UOhSiV3t4U2gc72aEXdpJbf+FiT8Bq/VP/OA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=rVu5xfEej8Nz6zNyaXJB66PvrosZGA8vZPn6yDC0zaayo9jj+TeTxUXRIvWCYLTWH2bviuUOzBd3vCYfb2H6MbNjiorlhd6sD4b2Av0A33JYmWO6qDCcW197k9fpjc4f7m/DbhViuh6hCsnEwkrbkORJk/IZ/Y0HDOkhRTDGRIk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=J0x3Y4RR; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="J0x3Y4RR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1708653480; x=1740189480;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=0T0Inu+UOhSiV3t4U2gc72aEXdpJbf+FiT8Bq/VP/OA=;
  b=J0x3Y4RRKCRV21EnrmEZj6tghJdvFg6l3SRdCUbkmuz8Q929g7AAyOOl
   KfEoaINW+To2DlcCZVJx5HoLONWHo5cTf8xGe8ugurjl9W46gxXc+r5IX
   1PI178C6aKsmjBf6fu9Uh5C0PSPjllPhwUIRpTEaHnY1Lhr4PXwRduhjC
   SJlTPMsWqpy/j2lMJguEvxPgIX0iCkJ/VYfC0dL3xTphPKwk8dLbmrhqT
   tCxDR6HyJuK6qub75df59k8+dgT784hcbIGyaNRHCenUf4jCOD5G9Uo2v
   oiHWqeN3qOLLtUUOuI+yASflBX67CgZs2Zql+FKYMYzwcFQXtMjrq6TIH
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10992"; a="3451130"
X-IronPort-AV: E=Sophos;i="6.06,179,1705392000"; 
   d="scan'208";a="3451130"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Feb 2024 17:57:59 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,179,1705392000"; 
   d="scan'208";a="5700446"
Received: from lkp-server02.sh.intel.com (HELO 3c78fa4d504c) ([10.239.97.151])
  by fmviesa009.fm.intel.com with ESMTP; 22 Feb 2024 17:57:57 -0800
Received: from kbuild by 3c78fa4d504c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rdKp1-0006xM-0J;
	Fri, 23 Feb 2024 01:57:55 +0000
Date: Fri, 23 Feb 2024 09:57:46 +0800
From: kernel test robot <lkp@intel.com>
To: Suren Baghdasaryan <surenb@google.com>
Cc: oe-kbuild-all@lists.linux.dev, Suren Baghdasaryan <surenb@google.com>,
	Kent Overstreet <kent.overstreet@linux.dev>,
	Kees Cook <keescook@chromium.org>
Subject: [surenbaghdasaryan:memalloc_prof_v4 23/36]
 drivers/char/tpm/tpm_ibmvtpm.c:525:43: sparse: sparse: incorrect type in
 assignment (different address spaces)
Message-ID: <202402230947.cSZaSREW-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/surenbaghdasaryan/linux.git memalloc_prof_v4
head:   0a5fa446156fb7ccba19a7ad02423f18aa1ac54d
commit: 396046fd0d6545124c79612978d2ee0044a6e6ac [23/36] mm/slab: enable slab allocation tagging for kmalloc and friends
config: powerpc64-randconfig-r111-20240223 (https://download.01.org/0day-ci/archive/20240223/202402230947.cSZaSREW-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project edd4aee4dd9b5b98b2576a6f783e4086173d902a)
reproduce: (https://download.01.org/0day-ci/archive/20240223/202402230947.cSZaSREW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402230947.cSZaSREW-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   drivers/char/tpm/tpm_ibmvtpm.c:125:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/char/tpm/tpm_ibmvtpm.c:125:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/char/tpm/tpm_ibmvtpm.c:125:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/char/tpm/tpm_ibmvtpm.c:126:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const * @@     got void [noderef] __iomem *rtce_buf @@
   drivers/char/tpm/tpm_ibmvtpm.c:126:9: sparse:     expected void const *
   drivers/char/tpm/tpm_ibmvtpm.c:126:9: sparse:     got void [noderef] __iomem *rtce_buf
   drivers/char/tpm/tpm_ibmvtpm.c:126:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const * @@     got void [noderef] __iomem *rtce_buf @@
   drivers/char/tpm/tpm_ibmvtpm.c:126:9: sparse:     expected void const *
   drivers/char/tpm/tpm_ibmvtpm.c:126:9: sparse:     got void [noderef] __iomem *rtce_buf
   drivers/char/tpm/tpm_ibmvtpm.c:126:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void * @@     got void [noderef] __iomem *rtce_buf @@
   drivers/char/tpm/tpm_ibmvtpm.c:126:9: sparse:     expected void *
   drivers/char/tpm/tpm_ibmvtpm.c:126:9: sparse:     got void [noderef] __iomem *rtce_buf
   drivers/char/tpm/tpm_ibmvtpm.c:229:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/char/tpm/tpm_ibmvtpm.c:229:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/char/tpm/tpm_ibmvtpm.c:229:9: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/char/tpm/tpm_ibmvtpm.c:366:30: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const *objp @@     got void [noderef] __iomem *rtce_buf @@
   drivers/char/tpm/tpm_ibmvtpm.c:366:30: sparse:     expected void const *objp
   drivers/char/tpm/tpm_ibmvtpm.c:366:30: sparse:     got void [noderef] __iomem *rtce_buf
>> drivers/char/tpm/tpm_ibmvtpm.c:525:43: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected void [noderef] __iomem *rtce_buf @@     got void *_res @@
   drivers/char/tpm/tpm_ibmvtpm.c:525:43: sparse:     expected void [noderef] __iomem *rtce_buf
   drivers/char/tpm/tpm_ibmvtpm.c:525:43: sparse:     got void *_res
   drivers/char/tpm/tpm_ibmvtpm.c:532:52: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void *ptr @@     got void [noderef] __iomem *rtce_buf @@
   drivers/char/tpm/tpm_ibmvtpm.c:532:52: sparse:     expected void *ptr
   drivers/char/tpm/tpm_ibmvtpm.c:532:52: sparse:     got void [noderef] __iomem *rtce_buf
   drivers/char/tpm/tpm_ibmvtpm.c:538:46: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const *objp @@     got void [noderef] __iomem *rtce_buf @@
   drivers/char/tpm/tpm_ibmvtpm.c:538:46: sparse:     expected void const *objp
   drivers/char/tpm/tpm_ibmvtpm.c:538:46: sparse:     got void [noderef] __iomem *rtce_buf
   drivers/char/tpm/tpm_ibmvtpm.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/xarray.h, ...):
   include/linux/page-flags.h:242:46: sparse: sparse: self-comparison always evaluates to false

vim +525 drivers/char/tpm/tpm_ibmvtpm.c

132f7629474424 Ashley Lai             2012-08-22  487  
132f7629474424 Ashley Lai             2012-08-22  488  /**
132f7629474424 Ashley Lai             2012-08-22  489   * ibmvtpm_crq_process - Process responded crq
132f7629474424 Ashley Lai             2012-08-22  490   *
93c12f293f8798 Winkler, Tomas         2016-11-23  491   * @crq:	crq to be processed
93c12f293f8798 Winkler, Tomas         2016-11-23  492   * @ibmvtpm:	vtpm device struct
93c12f293f8798 Winkler, Tomas         2016-11-23  493   *
132f7629474424 Ashley Lai             2012-08-22  494   */
132f7629474424 Ashley Lai             2012-08-22  495  static void ibmvtpm_crq_process(struct ibmvtpm_crq *crq,
132f7629474424 Ashley Lai             2012-08-22  496  				struct ibmvtpm_dev *ibmvtpm)
132f7629474424 Ashley Lai             2012-08-22  497  {
132f7629474424 Ashley Lai             2012-08-22  498  	int rc = 0;
132f7629474424 Ashley Lai             2012-08-22  499  
132f7629474424 Ashley Lai             2012-08-22  500  	switch (crq->valid) {
132f7629474424 Ashley Lai             2012-08-22  501  	case VALID_INIT_CRQ:
132f7629474424 Ashley Lai             2012-08-22  502  		switch (crq->msg) {
132f7629474424 Ashley Lai             2012-08-22  503  		case INIT_CRQ_RES:
132f7629474424 Ashley Lai             2012-08-22  504  			dev_info(ibmvtpm->dev, "CRQ initialized\n");
132f7629474424 Ashley Lai             2012-08-22  505  			rc = ibmvtpm_crq_send_init_complete(ibmvtpm);
132f7629474424 Ashley Lai             2012-08-22  506  			if (rc)
132f7629474424 Ashley Lai             2012-08-22  507  				dev_err(ibmvtpm->dev, "Unable to send CRQ init complete rc=%d\n", rc);
132f7629474424 Ashley Lai             2012-08-22  508  			return;
132f7629474424 Ashley Lai             2012-08-22  509  		case INIT_CRQ_COMP_RES:
132f7629474424 Ashley Lai             2012-08-22  510  			dev_info(ibmvtpm->dev,
132f7629474424 Ashley Lai             2012-08-22  511  				 "CRQ initialization completed\n");
132f7629474424 Ashley Lai             2012-08-22  512  			return;
132f7629474424 Ashley Lai             2012-08-22  513  		default:
132f7629474424 Ashley Lai             2012-08-22  514  			dev_err(ibmvtpm->dev, "Unknown crq message type: %d\n", crq->msg);
132f7629474424 Ashley Lai             2012-08-22  515  			return;
132f7629474424 Ashley Lai             2012-08-22  516  		}
132f7629474424 Ashley Lai             2012-08-22  517  	case IBMVTPM_VALID_CMD:
132f7629474424 Ashley Lai             2012-08-22  518  		switch (crq->msg) {
132f7629474424 Ashley Lai             2012-08-22  519  		case VTPM_GET_RTCE_BUFFER_SIZE_RES:
eb71f8a5e33fa1 honclo                 2015-02-12  520  			if (be16_to_cpu(crq->len) <= 0) {
132f7629474424 Ashley Lai             2012-08-22  521  				dev_err(ibmvtpm->dev, "Invalid rtce size\n");
132f7629474424 Ashley Lai             2012-08-22  522  				return;
132f7629474424 Ashley Lai             2012-08-22  523  			}
eb71f8a5e33fa1 honclo                 2015-02-12  524  			ibmvtpm->rtce_size = be16_to_cpu(crq->len);
132f7629474424 Ashley Lai             2012-08-22 @525  			ibmvtpm->rtce_buf = kmalloc(ibmvtpm->rtce_size,
60ecd86c4d9857 Hon Ching \(Vicky\  Lo 2015-10-07  526) 						    GFP_ATOMIC);
132f7629474424 Ashley Lai             2012-08-22  527  			if (!ibmvtpm->rtce_buf) {
132f7629474424 Ashley Lai             2012-08-22  528  				dev_err(ibmvtpm->dev, "Failed to allocate memory for rtce buffer\n");
132f7629474424 Ashley Lai             2012-08-22  529  				return;
132f7629474424 Ashley Lai             2012-08-22  530  			}
132f7629474424 Ashley Lai             2012-08-22  531  
132f7629474424 Ashley Lai             2012-08-22  532  			ibmvtpm->rtce_dma_handle = dma_map_single(ibmvtpm->dev,
132f7629474424 Ashley Lai             2012-08-22  533  				ibmvtpm->rtce_buf, ibmvtpm->rtce_size,
132f7629474424 Ashley Lai             2012-08-22  534  				DMA_BIDIRECTIONAL);
132f7629474424 Ashley Lai             2012-08-22  535  
132f7629474424 Ashley Lai             2012-08-22  536  			if (dma_mapping_error(ibmvtpm->dev,
132f7629474424 Ashley Lai             2012-08-22  537  					      ibmvtpm->rtce_dma_handle)) {
132f7629474424 Ashley Lai             2012-08-22  538  				kfree(ibmvtpm->rtce_buf);
132f7629474424 Ashley Lai             2012-08-22  539  				ibmvtpm->rtce_buf = NULL;
132f7629474424 Ashley Lai             2012-08-22  540  				dev_err(ibmvtpm->dev, "Failed to dma map rtce buffer\n");
132f7629474424 Ashley Lai             2012-08-22  541  			}
132f7629474424 Ashley Lai             2012-08-22  542  
132f7629474424 Ashley Lai             2012-08-22  543  			return;
132f7629474424 Ashley Lai             2012-08-22  544  		case VTPM_GET_VERSION_RES:
eb71f8a5e33fa1 honclo                 2015-02-12  545  			ibmvtpm->vtpm_version = be32_to_cpu(crq->data);
132f7629474424 Ashley Lai             2012-08-22  546  			return;
132f7629474424 Ashley Lai             2012-08-22  547  		case VTPM_TPM_COMMAND_RES:
b5666502700855 Ashley Lai             2012-09-12  548  			/* len of the data in rtce buffer */
eb71f8a5e33fa1 honclo                 2015-02-12  549  			ibmvtpm->res_len = be16_to_cpu(crq->len);
047d4226b0bca1 Stefan Berger          2021-08-12  550  			ibmvtpm->tpm_processing_cmd = 0;
b5666502700855 Ashley Lai             2012-09-12  551  			wake_up_interruptible(&ibmvtpm->wq);
132f7629474424 Ashley Lai             2012-08-22  552  			return;
132f7629474424 Ashley Lai             2012-08-22  553  		default:
132f7629474424 Ashley Lai             2012-08-22  554  			return;
132f7629474424 Ashley Lai             2012-08-22  555  		}
132f7629474424 Ashley Lai             2012-08-22  556  	}
132f7629474424 Ashley Lai             2012-08-22  557  	return;
132f7629474424 Ashley Lai             2012-08-22  558  }
132f7629474424 Ashley Lai             2012-08-22  559  

:::::: The code at line 525 was first introduced by commit
:::::: 132f7629474424418a5cdd666796ad3cfa4dc0c5 drivers/char/tpm: Add new device driver to support IBM vTPM

:::::: TO: Ashley Lai <adlai@linux.vnet.ibm.com>
:::::: CC: Kent Yoder <key@linux.vnet.ibm.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
