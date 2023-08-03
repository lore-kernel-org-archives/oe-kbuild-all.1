Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 004A425173
	for <oe-kbuild-all@lists.linux.dev>; Thu,  3 Aug 2023 20:52:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691095979; x=1722631979;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=zED3kdg3ZRxf/2pJOvBBe7+N26q1v5zZu+U8ltvXaeI=;
  b=Uro7/8DxWtxJdVOf6pQyOHCveYzdlCwGYp6ltyuhXyIqGnDloAtOFAlL
   8fMNfi9B+OzuEfuVRhzVtodds+lwtV6/pnOLby78bGZ10CcrRQLTErrSl
   rgxSIO77MM0o1q05Ukp8x2PuKzblnGpLkj7b4wkz+JYwmfsuEKodQPB8+
   A/eb7enT9ZktpvbvDy8xG72oLRUynK5OhagrrQ+QyC7Es0kkSz6874n48
   Ug1yP3n+x5FIyTohGXiKaJ0R9Zyw/tOtN2R1fR90DyZleRaN5knFU3E9l
   3DwuJIJamTDrEa+SZ6IP7hPvP+nvrsS/qo7MP2oP82yNId8znPZB+uppS
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10791"; a="400953043"
X-IronPort-AV: E=Sophos;i="6.01,253,1684825200"; 
   d="scan'208";a="400953043"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Aug 2023 13:52:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10791"; a="1060446752"
X-IronPort-AV: E=Sophos;i="6.01,253,1684825200"; 
   d="scan'208";a="1060446752"
Received: from lkp-server01.sh.intel.com (HELO d1ccc7e87e8f) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 03 Aug 2023 13:52:49 -0700
Received: from kbuild by d1ccc7e87e8f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qRfJQ-0002Lb-1Z;
	Thu, 03 Aug 2023 20:52:48 +0000
Date: Fri, 4 Aug 2023 04:52:29 +0800
From: kernel test robot <lkp@intel.com>
To: Nayna Jain <nayna@linux.ibm.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Michael Ellerman <mpe@ellerman.id.au>, linux-doc@vger.kernel.org
Subject: arch/powerpc/platforms/pseries/plpks.c:186: warning: This comment
 starts with '/**', but isn't a kernel-doc comment. Refer
 Documentation/doc-guide/kernel-doc.rst
Message-ID: <202308040430.GxmPAnwZ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   7bafbd4027ae86572f308c4ddf93120c90126332
commit: 2454a7af0f2a42918aa972147a0bec38e6656cd8 powerpc/pseries: define driver for Platform KeyStore
date:   1 year ago
config: powerpc-ppc64_defconfig (https://download.01.org/0day-ci/archive/20230804/202308040430.GxmPAnwZ-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230804/202308040430.GxmPAnwZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308040430.GxmPAnwZ-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/powerpc/platforms/pseries/plpks.c:186: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
    * Label is combination of label attributes + name.


vim +186 arch/powerpc/platforms/pseries/plpks.c

   184	
   185	/**
 > 186	 * Label is combination of label attributes + name.
   187	 * Label attributes are used internally by kernel and not exposed to the user.
   188	 */
   189	static struct label *construct_label(char *component, u8 varos, u8 *name,
   190					     u16 namelen)
   191	{
   192		struct label *label;
   193		size_t slen;
   194	
   195		if (!name || namelen > MAX_NAME_SIZE)
   196			return ERR_PTR(-EINVAL);
   197	
   198		slen = strlen(component);
   199		if (component && slen > sizeof(label->attr.prefix))
   200			return ERR_PTR(-EINVAL);
   201	
   202		label = kzalloc(sizeof(*label), GFP_KERNEL);
   203		if (!label)
   204			return ERR_PTR(-ENOMEM);
   205	
   206		if (component)
   207			memcpy(&label->attr.prefix, component, slen);
   208	
   209		label->attr.version = LABEL_VERSION;
   210		label->attr.os = varos;
   211		label->attr.length = MAX_LABEL_ATTR_SIZE;
   212		memcpy(&label->name, name, namelen);
   213	
   214		label->size = sizeof(struct label_attr) + namelen;
   215	
   216		return label;
   217	}
   218	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
