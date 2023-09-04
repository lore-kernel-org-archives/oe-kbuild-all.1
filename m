Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A31AB3212
	for <oe-kbuild-all@lists.linux.dev>; Mon,  4 Sep 2023 23:16:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693869362; x=1725405362;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=pRETUAj1cBrSLM5hdtA4JEZ/vWa9oGz3LJmWlj0VuBI=;
  b=c8/RARjbcDOt3bAly5Fc0spaHv1cFp4fHjihQQ/0F+w7Jk4MPYIxwTZ8
   tfdAbDU43D6nRBD37wnak/oALc3t3Tmn2AAmgRFOTytrekEyNxIUB0W5O
   LvM8XTJUGXGKX3UHtsJvdbi5hpL2edxr/0U3rQltuDisGykfL9VTWySpS
   PXoWGOWhBgYjbh4KvStQySi/GsXuonM5JKcN2QR0Su98n+mwj3ISf5fZ3
   kJGbH6M7XFx2DJR62NRHAnkbKQbw31LeCWfr/7zRPpzPJ9Iyz/dOSTh8Z
   yyDSGp9Yu2QhK4ZOMoEdUwKbskNcmGBu7dow2hoUEFmPAMUPfoL/6NqDd
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10823"; a="366887215"
X-IronPort-AV: E=Sophos;i="6.02,227,1688454000"; 
   d="scan'208";a="366887215"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Sep 2023 16:15:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10823"; a="744054463"
X-IronPort-AV: E=Sophos;i="6.02,227,1688454000"; 
   d="scan'208";a="744054463"
Received: from lkp-server02.sh.intel.com (HELO e0b2ea88afd5) ([10.239.97.151])
  by fmsmga007.fm.intel.com with ESMTP; 04 Sep 2023 16:15:48 -0700
Received: from kbuild by e0b2ea88afd5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qdInK-0000uF-14;
	Mon, 04 Sep 2023 23:15:46 +0000
Date: Tue, 5 Sep 2023 07:15:11 +0800
From: kernel test robot <lkp@intel.com>
To: Christoph Hellwig <hch@lst.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [hch-misc:fs-kill_sb 17/19] fs/nfs/super.c:1243:16: error: implicit
 declaration of function 'nfs_fscache_get_super_cookie'
Message-ID: <202309050722.9apalNjl-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.infradead.org/users/hch/misc.git fs-kill_sb
head:   31aeed05bb9e3121a8a1d7ffb5e7a449ec9aed4e
commit: 8853ecdbefb7e3f4e80d0cb519d7833a56e2ae94 [17/19] NFS: move nfs_kill_super to fs_context.c
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20230905/202309050722.9apalNjl-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230905/202309050722.9apalNjl-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309050722.9apalNjl-lkp@intel.com/

All errors (new ones prefixed by >>):

   fs/nfs/super.c: In function 'nfs_get_cache_cookie':
>> fs/nfs/super.c:1243:16: error: implicit declaration of function 'nfs_fscache_get_super_cookie' [-Werror=implicit-function-declaration]
    1243 |         return nfs_fscache_get_super_cookie(sb, uniq, ulen);
         |                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors
--
   In file included from fs/nfs/fs_context.c:24:
   fs/nfs/fscache.h: In function 'nfs_netfs_inode_init':
>> fs/nfs/fscache.h:83:41: error: 'nfs_netfs_ops' undeclared (first use in this function); did you mean 'nfs_netfs_put'?
      83 |         netfs_inode_init(&nfsi->netfs, &nfs_netfs_ops);
         |                                         ^~~~~~~~~~~~~
         |                                         nfs_netfs_put
   fs/nfs/fscache.h:83:41: note: each undeclared identifier is reported only once for each function it appears in
   fs/nfs/fscache.h: In function 'nfs_netfs_set_pgio_header':
>> fs/nfs/fscache.h:151:26: error: invalid use of undefined type 'struct nfs_pageio_descriptor'
     151 |         hdr->netfs = desc->pg_netfs;
         |                          ^~
   fs/nfs/fscache.h: In function 'nfs_netfs_set_pageio_descriptor':
   fs/nfs/fscache.h:156:13: error: invalid use of undefined type 'struct nfs_pageio_descriptor'
     156 |         desc->pg_netfs = hdr->netfs;
         |             ^~
   fs/nfs/fscache.h: In function 'nfs_netfs_reset_pageio_descriptor':
   fs/nfs/fscache.h:160:13: error: invalid use of undefined type 'struct nfs_pageio_descriptor'
     160 |         desc->pg_netfs = NULL;
         |             ^~


vim +/nfs_fscache_get_super_cookie +1243 fs/nfs/super.c

275a5d24bf56b2 Trond Myklebust  2007-05-16  1212  
39ffb9218e41b1 Trond Myklebust  2012-05-16  1213  #ifdef CONFIG_NFS_FSCACHE
a6b5a28eb56c3f Dave Wysochanski 2020-11-14  1214  static int nfs_get_cache_cookie(struct super_block *sb,
f2aedb713c2844 David Howells    2019-12-10  1215  				struct nfs_fs_context *ctx)
2311b9439ce8c5 Bryan Schumaker  2012-05-10  1216  {
c4271c6e37c321 Trond Myklebust  2012-12-21  1217  	struct nfs_server *nfss = NFS_SB(sb);
2311b9439ce8c5 Bryan Schumaker  2012-05-10  1218  	char *uniq = NULL;
2311b9439ce8c5 Bryan Schumaker  2012-05-10  1219  	int ulen = 0;
2311b9439ce8c5 Bryan Schumaker  2012-05-10  1220  
c4271c6e37c321 Trond Myklebust  2012-12-21  1221  	nfss->fscache = NULL;
c4271c6e37c321 Trond Myklebust  2012-12-21  1222  
f2aedb713c2844 David Howells    2019-12-10  1223  	if (!ctx)
a6b5a28eb56c3f Dave Wysochanski 2020-11-14  1224  		return 0;
f2aedb713c2844 David Howells    2019-12-10  1225  
f2aedb713c2844 David Howells    2019-12-10  1226  	if (ctx->clone_data.sb) {
f2aedb713c2844 David Howells    2019-12-10  1227  		struct nfs_server *mnt_s = NFS_SB(ctx->clone_data.sb);
c4271c6e37c321 Trond Myklebust  2012-12-21  1228  		if (!(mnt_s->options & NFS_OPTION_FSCACHE))
a6b5a28eb56c3f Dave Wysochanski 2020-11-14  1229  			return 0;
a6b5a28eb56c3f Dave Wysochanski 2020-11-14  1230  		if (mnt_s->fscache_uniq) {
a6b5a28eb56c3f Dave Wysochanski 2020-11-14  1231  			uniq = mnt_s->fscache_uniq;
a6b5a28eb56c3f Dave Wysochanski 2020-11-14  1232  			ulen = strlen(uniq);
9c91fa36b61798 YueHaibing       2019-10-25  1233  		}
f2aedb713c2844 David Howells    2019-12-10  1234  	} else {
f2aedb713c2844 David Howells    2019-12-10  1235  		if (!(ctx->options & NFS_OPTION_FSCACHE))
a6b5a28eb56c3f Dave Wysochanski 2020-11-14  1236  			return 0;
f2aedb713c2844 David Howells    2019-12-10  1237  		if (ctx->fscache_uniq) {
f2aedb713c2844 David Howells    2019-12-10  1238  			uniq = ctx->fscache_uniq;
f2aedb713c2844 David Howells    2019-12-10  1239  			ulen = strlen(ctx->fscache_uniq);
f2aedb713c2844 David Howells    2019-12-10  1240  		}
f2aedb713c2844 David Howells    2019-12-10  1241  	}
2311b9439ce8c5 Bryan Schumaker  2012-05-10  1242  
a6b5a28eb56c3f Dave Wysochanski 2020-11-14 @1243  	return nfs_fscache_get_super_cookie(sb, uniq, ulen);
2311b9439ce8c5 Bryan Schumaker  2012-05-10  1244  }
39ffb9218e41b1 Trond Myklebust  2012-05-16  1245  #else
a6b5a28eb56c3f Dave Wysochanski 2020-11-14  1246  static int nfs_get_cache_cookie(struct super_block *sb,
f2aedb713c2844 David Howells    2019-12-10  1247  				struct nfs_fs_context *ctx)
39ffb9218e41b1 Trond Myklebust  2012-05-16  1248  {
a6b5a28eb56c3f Dave Wysochanski 2020-11-14  1249  	return 0;
39ffb9218e41b1 Trond Myklebust  2012-05-16  1250  }
39ffb9218e41b1 Trond Myklebust  2012-05-16  1251  #endif
2311b9439ce8c5 Bryan Schumaker  2012-05-10  1252  

:::::: The code at line 1243 was first introduced by commit
:::::: a6b5a28eb56c3f4988f7ff5290b954ba296e309a nfs: Convert to new fscache volume/cookie API

:::::: TO: Dave Wysochanski <dwysocha@redhat.com>
:::::: CC: David Howells <dhowells@redhat.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
