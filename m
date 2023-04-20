Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76814944E
	for <oe-kbuild-all@lists.linux.dev>; Thu, 20 Apr 2023 21:55:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1682027700; x=1713563700;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=I5r1u0eU3gugUPhHqWyl/ExJbb1ucIyawDI82f7f2Vc=;
  b=D3Cmnz5am4Qrw93nPj8wHw6VyOV2sKqZr7JQINcTQighOu1ZpstSSLuI
   99dyMhnn5J89qAoIzr7azh6bLVs7YJMLGnnnth6nBrBazSNStndgyfFzy
   ntX/tXyqJeB7eIHeps5auXZ2EILzvX5wHazpGhgeZdml+5+4YG6PdPYzI
   ONI++GidKtzg5+EufYS2ZD3X17xVn4Q5lsVJK3S3v93CJhvw+mlSPqyCb
   QvHCX0JIB7krLyBrT77MxQmQM6Qy2NvR/lpbrRlirn0YL++HLLAbsb+6V
   TVGJbTrr8GiPDM6TSf2dnQw86COIV6JEWq997K6nKpfEtlq/DK2sJIzwi
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10686"; a="408793399"
X-IronPort-AV: E=Sophos;i="5.99,213,1677571200"; 
   d="scan'208";a="408793399"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Apr 2023 14:54:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10686"; a="692068686"
X-IronPort-AV: E=Sophos;i="5.99,213,1677571200"; 
   d="scan'208";a="692068686"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 20 Apr 2023 14:54:56 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ppcEx-000g8C-0p;
	Thu, 20 Apr 2023 21:54:55 +0000
Date: Fri, 21 Apr 2023 05:54:28 +0800
From: kernel test robot <lkp@intel.com>
To: Scott Mayhew <smayhew@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH 5/5] SUNRPC: store GSS creds in keyrings
Message-ID: <202304210551.vkZBdczN-lkp@intel.com>
References: <20230420202004.239116-6-smayhew@redhat.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230420202004.239116-6-smayhew@redhat.com>

Hi Scott,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on trondmy-nfs/linux-next]
[also build test WARNING on linus/master v6.3-rc7 next-20230420]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Scott-Mayhew/keys-export-keyring_ptr_to_key/20230421-042202
base:   git://git.linux-nfs.org/projects/trondmy/linux-nfs.git linux-next
patch link:    https://lore.kernel.org/r/20230420202004.239116-6-smayhew%40redhat.com
patch subject: [RFC PATCH 5/5] SUNRPC: store GSS creds in keyrings
config: m68k-allyesconfig (https://download.01.org/0day-ci/archive/20230421/202304210551.vkZBdczN-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/6a654188690846a7c5e1de83e390a2bce53d79a8
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Scott-Mayhew/keys-export-keyring_ptr_to_key/20230421-042202
        git checkout 6a654188690846a7c5e1de83e390a2bce53d79a8
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=m68k olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=m68k SHELL=/bin/bash net/sunrpc/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304210551.vkZBdczN-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> net/sunrpc/auth_gss/auth_gss.c:1675:6: warning: no previous prototype for 'gss_key_revoke' [-Wmissing-prototypes]
    1675 | void gss_key_revoke(struct key *key)
         |      ^~~~~~~~~~~~~~
>> net/sunrpc/auth_gss/auth_gss.c:1691:6: warning: no previous prototype for 'gss_describe' [-Wmissing-prototypes]
    1691 | void gss_describe(const struct key *key, struct seq_file *m)
         |      ^~~~~~~~~~~~
>> net/sunrpc/auth_gss/auth_gss.c:1704:5: warning: no previous prototype for 'gss_key_instantiate' [-Wmissing-prototypes]
    1704 | int gss_key_instantiate(struct key *key, struct key_preparsed_payload *prep)
         |     ^~~~~~~~~~~~~~~~~~~


vim +/gss_key_revoke +1675 net/sunrpc/auth_gss/auth_gss.c

  1674	
> 1675	void gss_key_revoke(struct key *key)
  1676	{
  1677		struct gss_cred *cred = key->payload.data[0];
  1678	
  1679		if (cred && put_rpccred(&cred->gc_base))
  1680			key->payload.data[0] = NULL;
  1681	}
  1682	
  1683	void gss_key_destroy(struct key *key)
  1684	{
  1685		struct gss_cred *cred = key->payload.data[0];
  1686	
  1687		if (cred && put_rpccred(&cred->gc_base))
  1688			key->payload.data[0] = NULL;
  1689	}
  1690	
> 1691	void gss_describe(const struct key *key, struct seq_file *m)
  1692	{
  1693		struct gss_cred *gss_cred = key->payload.data[0];
  1694	
  1695		if (!gss_cred)
  1696			return;
  1697	
  1698		seq_puts(m, key->description);
  1699		if (key_is_positive(key)) {
  1700			seq_printf(m, " gc: %px", gss_cred);
  1701		}
  1702	}
  1703	
> 1704	int gss_key_instantiate(struct key *key, struct key_preparsed_payload *prep)
  1705	{
  1706		if (prep->datalen != key->type->def_datalen)
  1707			return -EINVAL;
  1708	
  1709		rcu_assign_keypointer(key, (struct gss_cred *)prep->data);
  1710		return 0;
  1711	}
  1712	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
