Received: from mail3-relais-sop.national.inria.fr (mail3-relais-sop.national.inria.fr [192.134.164.104])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B92FE446C5
	for <oe-kbuild-all@lists.linux.dev>; Tue,  5 Dec 2023 13:09:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=inria.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=inria.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=inria.fr header.i=@inria.fr header.b="I7LtOjSY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=inria.fr; s=dc;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=3hv4cBuDdyoMYcKslo29be47lLFWNQGOVVHt0RLVmIY=;
  b=I7LtOjSY4C/jCK96NJ3fInrUPyFJTm38Ma6IxIwZIKEU+xaMgghKCIOH
   pjLCTvfB/6uloawbxMoWoRa/qLzJzAGBpqih55kWwZzGS+aAYKznlwXVb
   ZB54VKWpnIsqfz21HuMcNE914Qt6vU3goKdg2BLwZ9kGBPnmQbDyjaHnN
   I=;
Authentication-Results: mail3-relais-sop.national.inria.fr; dkim=none (message not signed) header.i=none; spf=SoftFail smtp.mailfrom=julia.lawall@inria.fr; dmarc=fail (p=none dis=none) d=inria.fr
X-IronPort-AV: E=Sophos;i="6.04,252,1695679200"; 
   d="scan'208";a="73462616"
Received: from dt-lawall.paris.inria.fr ([128.93.67.65])
  by mail3-relais-sop.national.inria.fr with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Dec 2023 14:08:13 +0100
Date: Tue, 5 Dec 2023 14:08:12 +0100 (CET)
From: Julia Lawall <julia.lawall@inria.fr>
To: Kent Overstreet <kmo@daterainc.com>
cc: linux-kernel@vger.kernel.org, oe-kbuild-all@lists.linux.dev, lkp@intel.com
Subject: fs/bcachefs/move.c:33:17-31: WARNING use flexible-array member
 instead (https://www.kernel.org/doc/html/latest/process/deprecated.html#zero-length-and-one-element-arrays)
 (fwd)
Message-ID: <899284eb-ef1d-44dd-9d57-86cb9b72bed7@inria.fr>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII



---------- Forwarded message ----------
Date: Tue, 5 Dec 2023 14:36:13 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: fs/bcachefs/move.c:33:17-31: WARNING use flexible-array member instead
    (https://www.kernel.org/doc/html/latest/process/deprecated.html#zero-length-
    and-one-element-arrays)

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Kent Overstreet <kmo@daterainc.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   bee0e7762ad2c6025b9f5245c040fcc36ef2bde8
commit: 1c6fdbd8f2465ddfb73a01ec620cbf3d14044e1a bcachefs: Initial commit
date:   6 weeks ago
:::::: branch date: 9 hours ago
:::::: commit date: 6 weeks ago
config: x86_64-randconfig-104-20231204 (https://download.01.org/0day-ci/archive/20231205/202312051447.F7YFxmFt-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce: (https://download.01.org/0day-ci/archive/20231205/202312051447.F7YFxmFt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202312051447.F7YFxmFt-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> fs/bcachefs/move.c:33:17-31: WARNING use flexible-array member instead (https://www.kernel.org/doc/html/latest/process/deprecated.html#zero-length-and-one-element-arrays)
--
>> fs/bcachefs/fs.c:437:1-7: preceding lock on line 351
   fs/bcachefs/fs.c:1559:4-10: preceding lock on line 1549
--
>> fs/bcachefs/journal.c:806:1-7: preceding lock on line 731
>> fs/bcachefs/journal.c:806:1-7: preceding lock on line 731
   fs/bcachefs/journal.c:806:1-7: preceding lock on line 767
--
>> fs/bcachefs/fs.c:235:12-13: WARNING opportunity for min()
--
>> fs/bcachefs/journal.c:624:20-21: WARNING opportunity for min()
   fs/bcachefs/journal.c:417:12-13: WARNING opportunity for min()
--
>> fs/bcachefs/journal_io.c:256:5-8: Unneeded variable: "ret". Return "  0" on line 263
   fs/bcachefs/journal_io.c:272:5-8: Unneeded variable: "ret". Return "  0" on line 288

vim +33 fs/bcachefs/move.c

1c6fdbd8f2465d Kent Overstreet 2017-03-16  20
1c6fdbd8f2465d Kent Overstreet 2017-03-16  21  struct moving_io {
1c6fdbd8f2465d Kent Overstreet 2017-03-16  22  	struct list_head	list;
1c6fdbd8f2465d Kent Overstreet 2017-03-16  23  	struct closure		cl;
1c6fdbd8f2465d Kent Overstreet 2017-03-16  24  	bool			read_completed;
1c6fdbd8f2465d Kent Overstreet 2017-03-16  25
1c6fdbd8f2465d Kent Overstreet 2017-03-16  26  	unsigned		read_sectors;
1c6fdbd8f2465d Kent Overstreet 2017-03-16  27  	unsigned		write_sectors;
1c6fdbd8f2465d Kent Overstreet 2017-03-16  28
1c6fdbd8f2465d Kent Overstreet 2017-03-16  29  	struct bch_read_bio	rbio;
1c6fdbd8f2465d Kent Overstreet 2017-03-16  30
1c6fdbd8f2465d Kent Overstreet 2017-03-16  31  	struct migrate_write	write;
1c6fdbd8f2465d Kent Overstreet 2017-03-16  32  	/* Must be last since it is variable size */
1c6fdbd8f2465d Kent Overstreet 2017-03-16 @33  	struct bio_vec		bi_inline_vecs[0];
1c6fdbd8f2465d Kent Overstreet 2017-03-16  34  };
1c6fdbd8f2465d Kent Overstreet 2017-03-16  35

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
