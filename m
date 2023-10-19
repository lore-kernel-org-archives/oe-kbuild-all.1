Received: from mail2-relais-roc.national.inria.fr (mail2-relais-roc.national.inria.fr [192.134.164.83])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EDB34667B
	for <oe-kbuild-all@lists.linux.dev>; Thu, 19 Oct 2023 05:27:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=inria.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=inria.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=inria.fr header.i=@inria.fr header.b="AT39VDLt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=inria.fr; s=dc;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=R7u2UjmRDNm343amMJG/FrPI4tGf9Ke9s/6+Rpu37e8=;
  b=AT39VDLtzNn932wWfzQVCUA+ZRk/eUpJwfe97fPBfjh0F/NylcdUtkfx
   ugK83A+RFHk8RmwYTHf5+tdrObtOnJ37sMH2S3arwZIKJ38N2PGIEsWZl
   rRiKAf3tk8BFuilXPYFGR89/K1zS7zovJ5sHhtcz4sN7zwbuix9M206kJ
   s=;
Authentication-Results: mail2-relais-roc.national.inria.fr; dkim=none (message not signed) header.i=none; spf=SoftFail smtp.mailfrom=julia.lawall@inria.fr; dmarc=fail (p=none dis=none) d=inria.fr
X-IronPort-AV: E=Sophos;i="6.03,236,1694728800"; 
   d="scan'208";a="132009292"
Received: from unknown (HELO hadrien) ([87.129.180.234])
  by mail2-relais-roc.national.inria.fr with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Oct 2023 07:27:50 +0200
Date: Thu, 19 Oct 2023 07:27:49 +0200 (CEST)
From: Julia Lawall <julia.lawall@inria.fr>
To: Andreas Gruenbacher <agruenba@redhat.com>
cc: cluster-devel@redhat.com, oe-kbuild-all@lists.linux.dev
Subject: [gfs2:extents 14/14] fs/gfs2/extents.c:123:23-27: WARNING use
 flexible-array member instead
 (https://www.kernel.org/doc/html/latest/process/deprecated.html#zero-length-and-one-element-arrays)
 (fwd)
Message-ID: <a8791f89-ed7b-1649-3b53-72349899c5d@inria.fr>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII



---------- Forwarded message ----------
Date: Thu, 19 Oct 2023 05:56:44 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: [gfs2:extents 14/14] fs/gfs2/extents.c:123:23-27: WARNING use
    flexible-array member instead
    (https://www.kernel.org/doc/html/latest/process/deprecated.html#zero-length-
    and-one-element-arrays)

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: cluster-devel@redhat.com
TO: Andreas Gruenbacher <agruenba@redhat.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/gfs2/linux-gfs2.git extents
head:   86474c69cac46872bd311318c02fb8e9e25abd10
commit: 86474c69cac46872bd311318c02fb8e9e25abd10 [14/14] gfs2: Add some initial extents-based inode code
:::::: branch date: 9 days ago
:::::: commit date: 9 days ago
config: x86_64-randconfig-101-20231018 (https://download.01.org/0day-ci/archive/20231019/202310190541.0impmnL4-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231019/202310190541.0impmnL4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202310190541.0impmnL4-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> fs/gfs2/extents.c:123:23-27: WARNING use flexible-array member instead (https://www.kernel.org/doc/html/latest/process/deprecated.html#zero-length-and-one-element-arrays)

vim +123 fs/gfs2/extents.c

86474c69cac468 Andreas Gruenbacher 2021-03-25  115
86474c69cac468 Andreas Gruenbacher 2021-03-25  116  /*
86474c69cac468 Andreas Gruenbacher 2021-03-25  117   * The path components in struct gfs2_extent_path are stored in "reverse"
86474c69cac468 Andreas Gruenbacher 2021-03-25  118   * order: the leaf is stored first, and when the tree grows at the root,
86474c69cac468 Andreas Gruenbacher 2021-03-25  119   * this happens at the end of the array.
86474c69cac468 Andreas Gruenbacher 2021-03-25  120   */
86474c69cac468 Andreas Gruenbacher 2021-03-25  121  struct gfs2_extent_path {
86474c69cac468 Andreas Gruenbacher 2021-03-25  122  	unsigned int p_height;
86474c69cac468 Andreas Gruenbacher 2021-03-25 @123  	struct gfs2_extent_pc p_pc[1];
86474c69cac468 Andreas Gruenbacher 2021-03-25  124  };
86474c69cac468 Andreas Gruenbacher 2021-03-25  125

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
