Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F69617C4
	for <oe-kbuild-all@lists.linux.dev>; Wed, 16 Aug 2023 05:05:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692162304; x=1723698304;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=NAt/0Qk/D8dIgi2ijgp9hAnTPFOpIpFTEMLFKhs/g/E=;
  b=IMR7lQxZtQqYFx47vxGj9F+mEtiecBeytuzXQe5dB6fTEeKIOxfoe6l3
   7b34+HwE4RbfoOAxEma0+5idsFXdUFCnIPHBNB9xHuvwavcJShNyG+pwA
   i0qbIxaDEEdouxtHvfLDdfjU43JEMeePKmVDwnkL75Y0i9GG+NJaRNPfN
   fUwHX1ntDicg4toB1LHqpVh9JygtyC7pNxUiQXj4dxyo4QGfW6foy9M7e
   1imLO8DmKWtZYMNOwnnaHh4UckNqvLMHsIWFIUeUDht86WFJ8lD5e9y2b
   BVKSv90zFS0+beGy8useOfz6y7x5E3Am5c6H1TT+wP4mL1RspBfrrAH7b
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10803"; a="371352493"
X-IronPort-AV: E=Sophos;i="6.01,175,1684825200"; 
   d="scan'208";a="371352493"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Aug 2023 22:04:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10803"; a="1064688371"
X-IronPort-AV: E=Sophos;i="6.01,175,1684825200"; 
   d="scan'208";a="1064688371"
Received: from lkp-server02.sh.intel.com (HELO b5fb8d9e1ffc) ([10.239.97.151])
  by fmsmga005.fm.intel.com with ESMTP; 15 Aug 2023 22:04:49 -0700
Received: from kbuild by b5fb8d9e1ffc with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qW8i8-0001WN-1w;
	Wed, 16 Aug 2023 05:04:48 +0000
Date: Wed, 16 Aug 2023 13:04:03 +0800
From: kernel test robot <lkp@intel.com>
To: Jordan Niethe <jniethe5@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, linuxppc-dev@lists.ozlabs.org,
	Michael Ellerman <mpe@ellerman.id.au>
Subject: [powerpc:topic/ppc-kvm 3/6]
 arch/powerpc/kvm/guest-state-buffer.c:505: warning: expecting prototype for
 kvmppc_gsm_init(). Prototype was for kvmppc_gsm_new() instead
Message-ID: <202308161359.9d2Z52f5-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git topic/ppc-kvm
head:   c95bf4c16099f2ed29a7f6949559bc4187d30710
commit: 596bda338f11c9d2f860439733e5239100803d6c [3/6] KVM: PPC: Add helper library for Guest State Buffers
config: powerpc-allmodconfig (https://download.01.org/0day-ci/archive/20230816/202308161359.9d2Z52f5-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230816/202308161359.9d2Z52f5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308161359.9d2Z52f5-lkp@intel.com/

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
