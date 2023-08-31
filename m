Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 007A01AA85
	for <oe-kbuild-all@lists.linux.dev>; Thu, 31 Aug 2023 22:30:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693521012; x=1725057012;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=RGirLIvRklnwCYm5okulpIgDPqOb4RTyFMHVm773sU8=;
  b=NE44ES7jT2iogAGRw+jqm2uEuXHL8YgX2Fb6bizuSeTxJHf7TABgrcXz
   j/8CS5R+BjWGnQDNlPdK8/QM/h7oGUfKuGs5S7SmTkyZL7aEGs6oW6f3g
   LP9faRRtNaCC9ScRJsq2WLTnApA+YhYqzUpeM+jUqn9KLzMSHpV0TLl+/
   QvgepEMtGQcWZyvU2VLdz4+jpPiIla4WvDkpWQTiaR8QAuikJ2ZZPwZNG
   2G6pMj7HOxrfY7ocWzNZVp3o2K90/5HmlWGmFWsd3Jx5JlRfl+UpiLmd2
   3a/GSksaRASOL8Q0N4nYsmJer42Vy9+ERVzNDRRFJA8dgWGSLb9uDBRaZ
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10819"; a="366307972"
X-IronPort-AV: E=Sophos;i="6.02,218,1688454000"; 
   d="scan'208";a="366307972"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Aug 2023 15:30:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10819"; a="805199526"
X-IronPort-AV: E=Sophos;i="6.02,218,1688454000"; 
   d="scan'208";a="805199526"
Received: from lkp-server01.sh.intel.com (HELO 5d8055a4f6aa) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 31 Aug 2023 15:30:10 -0700
Received: from kbuild by 5d8055a4f6aa with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qbqAy-0000bf-29;
	Thu, 31 Aug 2023 22:30:08 +0000
Date: Fri, 1 Sep 2023 06:29:56 +0800
From: kernel test robot <lkp@intel.com>
To: Benjamin Coddington <bcodding@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH] NFSv4: add sysctl for setting READDIR attrs
Message-ID: <202309010659.wsQKgkml-lkp@intel.com>
References: <8f752f70daf73016e20c49508f825e8c2c94f5e7.1693494824.git.bcodding@redhat.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8f752f70daf73016e20c49508f825e8c2c94f5e7.1693494824.git.bcodding@redhat.com>

Hi Benjamin,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on trondmy-nfs/linux-next]
[also build test ERROR on linus/master v6.5 next-20230831]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Benjamin-Coddington/NFSv4-add-sysctl-for-setting-READDIR-attrs/20230831-231736
base:   git://git.linux-nfs.org/projects/trondmy/linux-nfs.git linux-next
patch link:    https://lore.kernel.org/r/8f752f70daf73016e20c49508f825e8c2c94f5e7.1693494824.git.bcodding%40redhat.com
patch subject: [RFC PATCH] NFSv4: add sysctl for setting READDIR attrs
config: alpha-defconfig (https://download.01.org/0day-ci/archive/20230901/202309010659.wsQKgkml-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230901/202309010659.wsQKgkml-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309010659.wsQKgkml-lkp@intel.com/

All errors (new ones prefixed by >>):

   fs/nfs/client.c: In function 'nfs_server_copy_userdata':
>> fs/nfs/client.c:923:22: error: 'struct nfs_server' has no member named 'readdir_attrs'
     923 |         memcpy(target->readdir_attrs, source->readdir_attrs,
         |                      ^~
   fs/nfs/client.c:923:45: error: 'struct nfs_server' has no member named 'readdir_attrs'
     923 |         memcpy(target->readdir_attrs, source->readdir_attrs,
         |                                             ^~
   fs/nfs/client.c:924:38: error: 'struct nfs_server' has no member named 'readdir_attrs'
     924 |                         sizeof(target->readdir_attrs));
         |                                      ^~
--
   fs/nfs/sysfs.c: In function 'v4_readdir_attrs_show':
>> fs/nfs/sysfs.c:281:31: error: 'struct nfs_server' has no member named 'readdir_attrs'
     281 |                         server->readdir_attrs[0],
         |                               ^~
   fs/nfs/sysfs.c:282:31: error: 'struct nfs_server' has no member named 'readdir_attrs'
     282 |                         server->readdir_attrs[1],
         |                               ^~
   fs/nfs/sysfs.c:283:31: error: 'struct nfs_server' has no member named 'readdir_attrs'
     283 |                         server->readdir_attrs[2]);
         |                               ^~
   fs/nfs/sysfs.c: In function 'v4_readdir_attrs_store':
   fs/nfs/sysfs.c:315:23: error: 'struct nfs_server' has no member named 'readdir_attrs'
     315 |                 server->readdir_attrs[0] = attrs[0];
         |                       ^~
   fs/nfs/sysfs.c:317:23: error: 'struct nfs_server' has no member named 'readdir_attrs'
     317 |                 server->readdir_attrs[1] = attrs[1];
         |                       ^~
   fs/nfs/sysfs.c:319:23: error: 'struct nfs_server' has no member named 'readdir_attrs'
     319 |                 server->readdir_attrs[2] = attrs[2];
         |                       ^~
   fs/nfs/sysfs.c: In function 'v4_readdir_attrs_show':
   fs/nfs/sysfs.c:284:1: error: control reaches end of non-void function [-Werror=return-type]
     284 | }
         | ^
   cc1: some warnings being treated as errors


vim +923 fs/nfs/client.c

   906	
   907	/*
   908	 * Copy useful information when duplicating a server record
   909	 */
   910	void nfs_server_copy_userdata(struct nfs_server *target, struct nfs_server *source)
   911	{
   912		target->flags = source->flags;
   913		target->rsize = source->rsize;
   914		target->wsize = source->wsize;
   915		target->acregmin = source->acregmin;
   916		target->acregmax = source->acregmax;
   917		target->acdirmin = source->acdirmin;
   918		target->acdirmax = source->acdirmax;
   919		target->caps = source->caps;
   920		target->options = source->options;
   921		target->auth_info = source->auth_info;
   922		target->port = source->port;
 > 923		memcpy(target->readdir_attrs, source->readdir_attrs,
   924				sizeof(target->readdir_attrs));
   925	}
   926	EXPORT_SYMBOL_GPL(nfs_server_copy_userdata);
   927	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
