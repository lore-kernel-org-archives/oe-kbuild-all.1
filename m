Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAB3F1DFF8
	for <oe-kbuild-all@lists.linux.dev>; Thu, 19 Oct 2023 12:07:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ea1MussP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697717234; x=1729253234;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=alWLyD/WjF9yCXyB9Y6o2XkfwIckiOm55/wKpyiMAHc=;
  b=ea1MussPZnv+GLk6/vxZwutBZKhKmHeI8rvDjWT+meDONpU8JQ/iUPRs
   TdqSH555NjcF05p+G5eHQgw/7q3zlgYueVNOhlKDHbq25HQ+8h1IbhkZw
   Zn9zRD8nvMiBypIEXF2XI5U65sGWumMmRbwSl88ttQUthSMroGvdvZNDD
   syUV3De89LGC93yYRD+CckpDgfAwtdTs8zhQMh4mpJ3VTly5PShO517Ex
   uXoA3OmtKpxKds1dnXgz2+E6a/fqzcHJAhpo7MPByPUab/wqgRO2L6VvA
   HgxLUX2QPfqvDF60SQ3lpC5RkBNe/7XBxeOwuP8t1b2EDFz2Ni4qXKwdX
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10867"; a="366473296"
X-IronPort-AV: E=Sophos;i="6.03,237,1694761200"; 
   d="scan'208";a="366473296"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Oct 2023 05:07:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10867"; a="1088342759"
X-IronPort-AV: E=Sophos;i="6.03,237,1694761200"; 
   d="scan'208";a="1088342759"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 19 Oct 2023 05:07:09 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qtRnv-00025Y-0O;
	Thu, 19 Oct 2023 12:07:07 +0000
Date: Thu, 19 Oct 2023 20:06:18 +0800
From: kernel test robot <lkp@intel.com>
To: Benjamin Coddington <bcodding@redhat.com>,
	trond.myklebust@hammerspace.com, anna@kernel.org
Cc: oe-kbuild-all@lists.linux.dev, linux-nfs@vger.kernel.org
Subject: Re: [PATCH 2/2] NFSv4: Allow per-mount tuning of READDIR attrs
Message-ID: <202310191902.6BOby9rI-lkp@intel.com>
References: <bd900de1d19bc56e6df5b44379f373617acc894e.1697577945.git.bcodding@redhat.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bd900de1d19bc56e6df5b44379f373617acc894e.1697577945.git.bcodding@redhat.com>

Hi Benjamin,

kernel test robot noticed the following build errors:

[auto build test ERROR on trondmy-nfs/linux-next]
[also build test ERROR on linus/master v6.6-rc6 next-20231019]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Benjamin-Coddington/NFSv4-Always-ask-for-type-with-READDIR/20231018-053217
base:   git://git.linux-nfs.org/projects/trondmy/linux-nfs.git linux-next
patch link:    https://lore.kernel.org/r/bd900de1d19bc56e6df5b44379f373617acc894e.1697577945.git.bcodding%40redhat.com
patch subject: [PATCH 2/2] NFSv4: Allow per-mount tuning of READDIR attrs
config: nios2-defconfig (https://download.01.org/0day-ci/archive/20231019/202310191902.6BOby9rI-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231019/202310191902.6BOby9rI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310191902.6BOby9rI-lkp@intel.com/

All errors (new ones prefixed by >>):

   fs/nfs/client.c: In function 'nfs_server_copy_userdata':
>> fs/nfs/client.c:925:22: error: 'struct nfs_server' has no member named 'readdir_attrs'
     925 |         memcpy(target->readdir_attrs, source->readdir_attrs,
         |                      ^~
   fs/nfs/client.c:925:45: error: 'struct nfs_server' has no member named 'readdir_attrs'
     925 |         memcpy(target->readdir_attrs, source->readdir_attrs,
         |                                             ^~
   fs/nfs/client.c:926:38: error: 'struct nfs_server' has no member named 'readdir_attrs'
     926 |                         sizeof(target->readdir_attrs));
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
   fs/nfs/sysfs.c:338:23: error: 'struct nfs_server' has no member named 'readdir_attrs'
     338 |                 server->readdir_attrs[0] = attrs[0];
         |                       ^~
   fs/nfs/sysfs.c:340:23: error: 'struct nfs_server' has no member named 'readdir_attrs'
     340 |                 server->readdir_attrs[1] = attrs[1];
         |                       ^~
   fs/nfs/sysfs.c:342:23: error: 'struct nfs_server' has no member named 'readdir_attrs'
     342 |                 server->readdir_attrs[2] = attrs[2];
         |                       ^~
   fs/nfs/sysfs.c: In function 'v4_readdir_attrs_show':
>> fs/nfs/sysfs.c:284:1: error: control reaches end of non-void function [-Werror=return-type]
     284 | }
         | ^
   cc1: some warnings being treated as errors


vim +925 fs/nfs/client.c

   908	
   909	/*
   910	 * Copy useful information when duplicating a server record
   911	 */
   912	void nfs_server_copy_userdata(struct nfs_server *target, struct nfs_server *source)
   913	{
   914		target->flags = source->flags;
   915		target->rsize = source->rsize;
   916		target->wsize = source->wsize;
   917		target->acregmin = source->acregmin;
   918		target->acregmax = source->acregmax;
   919		target->acdirmin = source->acdirmin;
   920		target->acdirmax = source->acdirmax;
   921		target->caps = source->caps;
   922		target->options = source->options;
   923		target->auth_info = source->auth_info;
   924		target->port = source->port;
 > 925		memcpy(target->readdir_attrs, source->readdir_attrs,
   926				sizeof(target->readdir_attrs));
   927	}
   928	EXPORT_SYMBOL_GPL(nfs_server_copy_userdata);
   929	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
