Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 539E584A32
	for <oe-kbuild-all@lists.linux.dev>; Tue, 22 Oct 2024 03:02:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729566134; cv=none; b=QKOcom41RH1fKC8Pxx/zt7VZOndMzk8UbWW3e7SPPMsQtI3V7g4kvXMBi/9YH/zpUbWYiwIAHaJnro7b3nlvASWJW9pNG5XhvQPY2EQRrxcGwK86ZzuXqcnI9btHuZ42uzv2xegUW/ALoYI246yG357tgQmomc7yvYcl4i4hQco=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729566134; c=relaxed/simple;
	bh=N9l9zNb/8MSV45PfrLECOSl+X5LnMoB/4F07bBuXYHg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QKyrzV4u9Ea2At45NCvNJOIwVN9Pg/EuKl+icPYc1sfqwHSx0/YVFBihHGl1BHgwbQbeMvdrh7L6SeRXMzVALW1aIZwZaAnrQhXuIw9yPB7cwzLjOtKJWfsQ45j1R3qHeoMjnD1shys6k3LKEjc4u+uV74k38YtlS1x9FERFQxw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DThMXdFb; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DThMXdFb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729566132; x=1761102132;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=N9l9zNb/8MSV45PfrLECOSl+X5LnMoB/4F07bBuXYHg=;
  b=DThMXdFbMVSG/BBOr58coeqMBmZk1CB5vU4HmG5rBOw5Faoc2i2STbQc
   u5dJpBOBYt/ZZHpYMcl1+qhgMigGK/Gt298kPuyTtm8tnzW26GM1+9KEF
   o4iiF45a/WzzhpVCexX4OrlhRvUzB5rrFCs92B9oq/gyFwUTwFXhC4eFR
   z16y2Zy+qUwKvm58DS+e1dizqeazt9gGEHEt2cqrzsvBv14MF76BXog8Y
   55KbuFnvObcGWswwKY6Fhz9gfFgPHWolYrc7w1gHcmYvP5MyoR1FiOWrD
   LD7xceSTJO+i/QgL0YYfpy3gwutFZdjbkuVFq0en1Ubag0uyngCeOLxvP
   g==;
X-CSE-ConnectionGUID: 5rf5nEGDSEap0Uc903rBuw==
X-CSE-MsgGUID: ygsRWwn6RoW7gDQB/dGVHQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11232"; a="32885579"
X-IronPort-AV: E=Sophos;i="6.11,222,1725346800"; 
   d="scan'208";a="32885579"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Oct 2024 20:02:09 -0700
X-CSE-ConnectionGUID: PCU+A86/RsWkggCGLFIv0Q==
X-CSE-MsgGUID: L8VBlMHBTkyvOBN4PBEunw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,222,1725346800"; 
   d="scan'208";a="79799434"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 21 Oct 2024 20:02:08 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t359p-000SyC-36;
	Tue, 22 Oct 2024 03:02:05 +0000
Date: Tue, 22 Oct 2024 11:01:06 +0800
From: kernel test robot <lkp@intel.com>
To: Denis Kenzior <denkenz@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH v1 03/10] net: qrtr: support identical node ids
Message-ID: <202410221040.w67ud4O6-lkp@intel.com>
References: <20241018181842.1368394-4-denkenz@gmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241018181842.1368394-4-denkenz@gmail.com>

Hi Denis,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on net/main]
[also build test WARNING on net-next/main linus/master horms-ipvs/master v6.12-rc4 next-20241021]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Denis-Kenzior/net-qrtr-ns-validate-msglen-before-ctrl_pkt-use/20241019-022353
base:   net/main
patch link:    https://lore.kernel.org/r/20241018181842.1368394-4-denkenz%40gmail.com
patch subject: [RFC PATCH v1 03/10] net: qrtr: support identical node ids
config: i386-allmodconfig (https://download.01.org/0day-ci/archive/20241022/202410221040.w67ud4O6-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241022/202410221040.w67ud4O6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410221040.w67ud4O6-lkp@intel.com/

All warnings (new ones prefixed by >>):

   net/qrtr/af_qrtr.c: In function 'qrtr_node_assign':
>> net/qrtr/af_qrtr.c:429:43: warning: left shift count >= width of type [-Wshift-count-overflow]
     429 |         key = (unsigned long)node->ep->id << 32 | nid;
         |                                           ^~

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for GET_FREE_REGION
   Depends on [n]: SPARSEMEM [=n]
   Selected by [m]:
   - RESOURCE_KUNIT_TEST [=m] && RUNTIME_TESTING_MENU [=y] && KUNIT [=m]


vim +429 net/qrtr/af_qrtr.c

   412	
   413	/* Assign node id to node.
   414	 *
   415	 * This is mostly useful for automatic node id assignment, based on
   416	 * the source id in the incoming packet.
   417	 */
   418	static void qrtr_node_assign(struct qrtr_node *node, unsigned int nid)
   419	{
   420		unsigned long flags;
   421		unsigned long key;
   422	
   423		if (nid == QRTR_EP_NID_AUTO)
   424			return;
   425	
   426		spin_lock_irqsave(&qrtr_nodes_lock, flags);
   427	
   428		/* Always insert with the endpoint_id + node_id */
 > 429		key = (unsigned long)node->ep->id << 32 | nid;
   430		radix_tree_insert(&qrtr_nodes, key, node);
   431	
   432		if (!radix_tree_lookup(&qrtr_nodes, nid))
   433			radix_tree_insert(&qrtr_nodes, nid, node);
   434	
   435		if (node->nid == QRTR_EP_NID_AUTO)
   436			node->nid = nid;
   437		spin_unlock_irqrestore(&qrtr_nodes_lock, flags);
   438	}
   439	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
