Received: from mail3-relais-sop.national.inria.fr (mail3-relais-sop.national.inria.fr [192.134.164.104])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C8541CCDE
	for <oe-kbuild-all@lists.linux.dev>; Sat, 12 Aug 2023 11:10:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=inria.fr; s=dc;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=yRalS9/mWMVw32Dip6cBfx36qM2ohydM8kAe0yexGNo=;
  b=jf20jUQiE01r8GMdTfFZvXMBPSTC+lH2yoM2lhlZr9PLeCTeCuJUB2Mf
   Zo9uevmc3bGfgkY5H1vHkJxtGSUTWKvV6DADMg9nRNvMH4v16aeShxJ9I
   kWk1JVWQfZSGRrEfszDlw26Wy9bUFBXlutneKkq8DwPgEu0S8Q6wNJ1O/
   E=;
Authentication-Results: mail3-relais-sop.national.inria.fr; dkim=none (message not signed) header.i=none; spf=SoftFail smtp.mailfrom=julia.lawall@inria.fr; dmarc=fail (p=none dis=none) d=inria.fr
X-IronPort-AV: E=Sophos;i="6.01,168,1684792800"; 
   d="scan'208";a="63399379"
Received: from 231.85.89.92.rev.sfr.net (HELO hadrien) ([92.89.85.231])
  by mail3-relais-sop.national.inria.fr with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Aug 2023 13:10:05 +0200
Date: Sat, 12 Aug 2023 13:10:04 +0200 (CEST)
From: Julia Lawall <julia.lawall@inria.fr>
X-X-Sender: jll@hadrien
To: Hugh Dickins <hughd@google.com>
cc: Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>, 
    Carlos Maiolino <cmaiolino@redhat.com>, 
    Christian Brauner <christianvanbrauner@gmail.com>, 
    oe-kbuild-all@lists.linux.dev
Subject: [brauner-vfs:vfs.tmpfs 15/19] mm/shmem.c:3611:8-15: ERROR: PTR_ERR
 applied after initialization to constant on line 3607 (fwd)
Message-ID: <alpine.DEB.2.22.394.2308121307551.3315@hadrien>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

Maybe it would be nice to transform this to a more traditional
if (IS_ERR(...)) return ...
and then the branch code with a return 0 at the end rather than relying on
the PTR_ERR of NULL to return 0.

julia


---------- Forwarded message ----------
Date: Sat, 12 Aug 2023 18:47:30 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: [brauner-vfs:vfs.tmpfs 15/19] mm/shmem.c:3611:8-15: ERROR: PTR_ERR
    applied after initialization to constant on line 3607

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: Christian Brauner <christianvanbrauner@gmail.com>
TO: Hugh Dickins <hughd@google.com>
CC: Christian Brauner <brauner@kernel.org>
CC: Jan Kara <jack@suse.cz>
CC: Carlos Maiolino <cmaiolino@redhat.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/vfs/vfs.git vfs.tmpfs
head:   aa5b9178c01905d7691512b366cf2886dfe2680c
commit: 5de75970c9fd7220e394b76e6d20fbafa1369b5a [15/19] xattr: simple_xattr_set() return old_xattr to be freed
:::::: branch date: 23 hours ago
:::::: commit date: 3 days ago
config: openrisc-randconfig-r052-20230812 (https://download.01.org/0day-ci/archive/20230812/202308121841.cgYdEdbt-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230812/202308121841.cgYdEdbt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202308121841.cgYdEdbt-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> mm/shmem.c:3611:8-15: ERROR: PTR_ERR applied after initialization to constant on line 3607

vim +3611 mm/shmem.c

b09e0fa4b4ea66 Eric Paris          2011-05-24  3593
aa7c5241c380ad Andreas Gruenbacher 2015-12-02  3594  static int shmem_xattr_handler_set(const struct xattr_handler *handler,
39f60c1ccee72c Christian Brauner   2023-01-13  3595  				   struct mnt_idmap *idmap,
5930122683dff5 Al Viro             2016-05-27  3596  				   struct dentry *unused, struct inode *inode,
5930122683dff5 Al Viro             2016-05-27  3597  				   const char *name, const void *value,
5930122683dff5 Al Viro             2016-05-27  3598  				   size_t size, int flags)
b09e0fa4b4ea66 Eric Paris          2011-05-24  3599  {
5930122683dff5 Al Viro             2016-05-27  3600  	struct shmem_inode_info *info = SHMEM_I(inode);
5de75970c9fd72 Hugh Dickins        2023-08-08  3601  	struct simple_xattr *old_xattr;
b09e0fa4b4ea66 Eric Paris          2011-05-24  3602
aa7c5241c380ad Andreas Gruenbacher 2015-12-02  3603  	name = xattr_full_name(handler, name);
5de75970c9fd72 Hugh Dickins        2023-08-08  3604  	old_xattr = simple_xattr_set(&info->xattrs, name, value, size, flags);
5de75970c9fd72 Hugh Dickins        2023-08-08  3605  	if (!IS_ERR(old_xattr)) {
5de75970c9fd72 Hugh Dickins        2023-08-08  3606  		simple_xattr_free(old_xattr);
5de75970c9fd72 Hugh Dickins        2023-08-08 @3607  		old_xattr = NULL;
36f05cab0a2c97 Jeff Layton         2022-09-09  3608  		inode->i_ctime = current_time(inode);
36f05cab0a2c97 Jeff Layton         2022-09-09  3609  		inode_inc_iversion(inode);
36f05cab0a2c97 Jeff Layton         2022-09-09  3610  	}
5de75970c9fd72 Hugh Dickins        2023-08-08 @3611  	return PTR_ERR(old_xattr);
b09e0fa4b4ea66 Eric Paris          2011-05-24  3612  }
b09e0fa4b4ea66 Eric Paris          2011-05-24  3613

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
