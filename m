Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EDAC523E
	for <oe-kbuild-all@lists.linux.dev>; Sun, 11 Jun 2023 17:51:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686505874; x=1718041874;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=xYKAcdrJ39rdgCYXNRMarqKIDpIvzW5PC63ZEqfAMHQ=;
  b=Jq/a1N5HgDCtxhW2k2rWGaWsJh24vfaeMaNW17u1+UjpepD69g10rJ82
   hx0mdGXjqwO3K4p8pKNt7tGc+fG7W8IXj2RDpFDukDO8TWy7uqa/kWmKB
   NcgLbt9o44v2475qgjPjcFLqATa58M3UFU/FjZXkzEIp2iaInfPbHUnz2
   F6haB+EAJm1NKxWBgoQhx5gXubYGWIaS/F+ZxSByFFqnEVyVRVy6pR8PY
   nqBhVOp19OLDvU/RBVWiNWJIz40Rr8gfe1ylZzYihhZqOLNVUlbiavGXN
   p6vA9XYS6Rw1hsvFIjJoa/zOCAOX0hr2k5ofXOm7ZzFzO0wT6DLnZ+GWA
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10738"; a="357881639"
X-IronPort-AV: E=Sophos;i="6.00,234,1681196400"; 
   d="scan'208";a="357881639"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jun 2023 10:51:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10738"; a="800773183"
X-IronPort-AV: E=Sophos;i="6.00,234,1681196400"; 
   d="scan'208";a="800773183"
Received: from lkp-server01.sh.intel.com (HELO 15ab08e44a81) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 11 Jun 2023 10:51:12 -0700
Received: from kbuild by 15ab08e44a81 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q8PDb-000B1p-1E;
	Sun, 11 Jun 2023 17:51:11 +0000
Date: Mon, 12 Jun 2023 01:50:33 +0800
From: kernel test robot <lkp@intel.com>
To: Sabrina Dubroca <sd@queasysnail.net>, netdev@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, Sabrina Dubroca <sd@queasysnail.net>,
	kuba@kernel.org
Subject: Re: [PATCH net-next] netdevsim: add dummy macsec offload
Message-ID: <202306120146.8tukbUAq-lkp@intel.com>
References: <0b87a0b7f9faf82de05c5689fbe8b8b4a83aa25d.1686494112.git.sd@queasysnail.net>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0b87a0b7f9faf82de05c5689fbe8b8b4a83aa25d.1686494112.git.sd@queasysnail.net>

Hi Sabrina,

kernel test robot noticed the following build warnings:

[auto build test WARNING on net-next/main]

url:    https://github.com/intel-lab-lkp/linux/commits/Sabrina-Dubroca/netdevsim-add-dummy-macsec-offload/20230611-234644
base:   net-next/main
patch link:    https://lore.kernel.org/r/0b87a0b7f9faf82de05c5689fbe8b8b4a83aa25d.1686494112.git.sd%40queasysnail.net
patch subject: [PATCH net-next] netdevsim: add dummy macsec offload
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20230612/202306120146.8tukbUAq-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build):
        git remote add net-next https://git.kernel.org/pub/scm/linux/kernel/git/davem/net-next.git
        git fetch net-next main
        git checkout net-next/main
        b4 shazam https://lore.kernel.org/r/0b87a0b7f9faf82de05c5689fbe8b8b4a83aa25d.1686494112.git.sd@queasysnail.net
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=x86_64 olddefconfig
        make W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash drivers/net/netdevsim/

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306120146.8tukbUAq-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/net/netdevsim/macsec.c: In function 'nsim_macsec_add_txsa':
>> drivers/net/netdevsim/macsec.c:274:27: warning: variable 'secy' set but not used [-Wunused-but-set-variable]
     274 |         struct nsim_secy *secy;
         |                           ^~~~
   drivers/net/netdevsim/macsec.c: In function 'nsim_macsec_upd_txsa':
   drivers/net/netdevsim/macsec.c:294:27: warning: variable 'secy' set but not used [-Wunused-but-set-variable]
     294 |         struct nsim_secy *secy;
         |                           ^~~~
   drivers/net/netdevsim/macsec.c: In function 'nsim_macsec_del_txsa':
   drivers/net/netdevsim/macsec.c:314:27: warning: variable 'secy' set but not used [-Wunused-but-set-variable]
     314 |         struct nsim_secy *secy;
         |                           ^~~~


vim +/secy +274 drivers/net/netdevsim/macsec.c

   270	
   271	static int nsim_macsec_add_txsa(struct macsec_context *ctx)
   272	{
   273		struct netdevsim *ns = netdev_priv(ctx->netdev);
 > 274		struct nsim_secy *secy;
   275		int idx;
   276	
   277		idx = nsim_macsec_find_secy(ns, ctx->secy->sci);
   278		if (idx < 0) {
   279			netdev_err(ctx->netdev, "%s: sci %08llx not found in secy table\n",
   280				   __func__, be64_to_cpu(ctx->secy->sci));
   281			return -ENOENT;
   282		}
   283		secy = &ns->macsec.nsim_secy[idx];
   284	
   285		netdev_dbg(ctx->netdev, "%s: SECY with sci %08llx, AN %u\n",
   286			   __func__, be64_to_cpu(ctx->secy->sci), ctx->sa.assoc_num);
   287	
   288		return 0;
   289	}
   290	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
