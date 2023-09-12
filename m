Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D3CE11CAD
	for <oe-kbuild-all@lists.linux.dev>; Tue, 12 Sep 2023 23:15:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694560534; x=1726096534;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=LJZGJFi7GZz4wA9x2VjN00+2e/nzonJhFIZL6HEpirQ=;
  b=TlJILGZ+nSNCjkDgTJDw7Ou6M+uMULpPTz0TmxcJxlor2EboVvMmaI12
   VqD/j5rGP5JmAz+3+KwaVPDG3dDQ+NUx6w/4j6rk/1Pe0J4I/mESGWIlt
   S3wgz/8S1eEQcX3nF1diRLGzRYl5cWQGGfhudnN/ZDepjp5j6HUk4aiye
   5Qf61CHKdQTs6YsoIWjfOyhMufC37Qbr9CwV3Mj+386capIT25kRT/Htb
   HSI04ooMDHmKfaf+FLD4sf+tjka2F0IwerXfm5shB7LU/T/AOtc8B20nm
   chrfkyrfQ0ToLU9hDcyOpCOwHCQVHmSTjGNMDvJ9qPUok8V5+m0ehudv4
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10831"; a="368783614"
X-IronPort-AV: E=Sophos;i="6.02,141,1688454000"; 
   d="scan'208";a="368783614"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Sep 2023 16:15:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10831"; a="990675275"
X-IronPort-AV: E=Sophos;i="6.02,141,1688454000"; 
   d="scan'208";a="990675275"
Received: from lkp-server02.sh.intel.com (HELO 47e905db7d2b) ([10.239.97.151])
  by fmsmga006.fm.intel.com with ESMTP; 12 Sep 2023 16:15:06 -0700
Received: from kbuild by 47e905db7d2b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qgCb2-0000Pd-1E;
	Tue, 12 Sep 2023 23:15:04 +0000
Date: Wed, 13 Sep 2023 07:14:56 +0800
From: kernel test robot <lkp@intel.com>
To: Jordan Niethe <jniethe5@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, linuxppc-dev@lists.ozlabs.org,
	Michael Ellerman <mpe@ellerman.id.au>
Subject: [powerpc:topic/ppc-kvm 8/11]
 arch/powerpc/kvm/guest-state-buffer.c:505: warning: expecting prototype for
 kvmppc_gsm_init(). Prototype was for kvmppc_gsm_new() instead
Message-ID: <202309130700.eRu2IdWo-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git topic/ppc-kvm
head:   5af8497e01ed97410b2f19ca8320a3bcdcfe267b
commit: c531e958f40241e921456e7b77574a25f713a2e5 [8/11] KVM: PPC: Add helper library for Guest State Buffers
config: powerpc-ppc64_defconfig (https://download.01.org/0day-ci/archive/20230913/202309130700.eRu2IdWo-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230913/202309130700.eRu2IdWo-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309130700.eRu2IdWo-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/powerpc/kvm/guest-state-buffer.c:505: warning: expecting prototype for kvmppc_gsm_init(). Prototype was for kvmppc_gsm_new() instead
>> arch/powerpc/kvm/guest-state-buffer.c:565: warning: expecting prototype for kvmppc_gsm_fill_info(). Prototype was for kvmppc_gsm_refresh_info() instead


vim +505 arch/powerpc/kvm/guest-state-buffer.c

   493	
   494	/**
   495	 * kvmppc_gsm_init() - creates a new guest state message
   496	 * @ops: callbacks
   497	 * @data: private data
   498	 * @flags: guest wide or thread wide
   499	 * @gfp_flags: GFP allocation flags
   500	 *
   501	 * Returns an initialized guest state message.
   502	 */
   503	struct kvmppc_gs_msg *kvmppc_gsm_new(struct kvmppc_gs_msg_ops *ops, void *data,
   504					     unsigned long flags, gfp_t gfp_flags)
 > 505	{
   506		struct kvmppc_gs_msg *gsm;
   507	
   508		gsm = kzalloc(sizeof(*gsm), gfp_flags);
   509		if (!gsm)
   510			return NULL;
   511	
   512		kvmppc_gsm_init(gsm, ops, data, flags);
   513	
   514		return gsm;
   515	}
   516	EXPORT_SYMBOL_GPL(kvmppc_gsm_new);
   517	
   518	/**
   519	 * kvmppc_gsm_size() - creates a new guest state message
   520	 * @gsm: self
   521	 *
   522	 * Returns the size required for the message.
   523	 */
   524	size_t kvmppc_gsm_size(struct kvmppc_gs_msg *gsm)
   525	{
   526		if (gsm->ops->get_size)
   527			return gsm->ops->get_size(gsm);
   528		return 0;
   529	}
   530	EXPORT_SYMBOL_GPL(kvmppc_gsm_size);
   531	
   532	/**
   533	 * kvmppc_gsm_free() - free guest state message
   534	 * @gsm: guest state message
   535	 *
   536	 * Returns the size required for the message.
   537	 */
   538	void kvmppc_gsm_free(struct kvmppc_gs_msg *gsm)
   539	{
   540		kfree(gsm);
   541	}
   542	EXPORT_SYMBOL_GPL(kvmppc_gsm_free);
   543	
   544	/**
   545	 * kvmppc_gsm_fill_info() - serialises message to guest state buffer format
   546	 * @gsm: self
   547	 * @gsb: buffer to serialise into
   548	 */
   549	int kvmppc_gsm_fill_info(struct kvmppc_gs_msg *gsm, struct kvmppc_gs_buff *gsb)
   550	{
   551		if (!gsm->ops->fill_info)
   552			return -EINVAL;
   553	
   554		return gsm->ops->fill_info(gsb, gsm);
   555	}
   556	EXPORT_SYMBOL_GPL(kvmppc_gsm_fill_info);
   557	
   558	/**
   559	 * kvmppc_gsm_fill_info() - deserialises from guest state buffer
   560	 * @gsm: self
   561	 * @gsb: buffer to serialise from
   562	 */
   563	int kvmppc_gsm_refresh_info(struct kvmppc_gs_msg *gsm,
   564				    struct kvmppc_gs_buff *gsb)
 > 565	{

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
