Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6CA815E20F
	for <oe-kbuild-all@lists.linux.dev>; Tue,  2 Apr 2024 20:54:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712091259; cv=none; b=B/Eq6a+ypssfE9w0SAXJmHhHr0VIUVsLB4r+fdTN3mQTOUOM2CZW2DwnrfjLhkZDH5l4qcAwSzCujdwOACDZpVZOzoB0h8khuoqSJJLbhFtHQX0AY00k5f6M60vV5PkRz5Vmf2h3K6fwKB6QHFScyKCnCrwmFPiqN9PGTzX5GP4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712091259; c=relaxed/simple;
	bh=DAx820OErBNx6F5FPOjXZCyoHcYyLvedbh+BZwpnFC4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=LVcn8b6V+pY7+0DX1ItUXZ1uL1saYcHs56/4Hhagk+iJoLXiFbYXaaixWviZwnkFpwftltYFskx14zIteVjZVHeSCguUsJyxF1bjbOAd2jo1pgeKNjNAfrzr/FViC65a2I5f/MpVIH/+igPpFTRC2RAOJuIdD6GPAISrID+fsww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gohyOmIu; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gohyOmIu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712091258; x=1743627258;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=DAx820OErBNx6F5FPOjXZCyoHcYyLvedbh+BZwpnFC4=;
  b=gohyOmIuGJjwvCtYbzoRMp+hqCo33pYrW/evBPfMoghNu9zJ6u6qiXDC
   O+ZPDx/04jsgqfKaLyfb5X30c1CnfcxNAv3Ni5aV1JnW266c2mTI19bju
   9p2TYO6++RJJWMXfW2r6cufOBh9uGFOPN40gJq1DV2R/3qJq84ZfSm6mm
   IgrjLD0e8/Jez02BbARL2KT9TSwmH7l74T8yAp9pVXrhW7G16KCIqE8w3
   LOPehC9qt3mu07BbSLpkmHNe5XXDf+1RrzDQ6W8JWqK1PfhubOw3Wcp1O
   kE7qb7xeWRgttBC7Hm71sCCNmJ+e248meF8gbafjVJl6f7LolJMXeNtzn
   g==;
X-CSE-ConnectionGUID: iZm0FxS3R1WXFpANVIWRgA==
X-CSE-MsgGUID: w+05iHOPST24gsgKeD9IOg==
X-IronPort-AV: E=McAfee;i="6600,9927,11032"; a="32687751"
X-IronPort-AV: E=Sophos;i="6.07,176,1708416000"; 
   d="scan'208";a="32687751"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Apr 2024 13:54:17 -0700
X-CSE-ConnectionGUID: s8QbWqqDQhSz/H5BgLaHgA==
X-CSE-MsgGUID: r3KKCh3vSHyZDM7dt/yL8w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,176,1708416000"; 
   d="scan'208";a="18174253"
Received: from lkp-server02.sh.intel.com (HELO 90ee3aa53dbd) ([10.239.97.151])
  by orviesa009.jf.intel.com with ESMTP; 02 Apr 2024 13:54:16 -0700
Received: from kbuild by 90ee3aa53dbd with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rrl94-0001Xb-02;
	Tue, 02 Apr 2024 20:54:14 +0000
Date: Wed, 3 Apr 2024 04:53:24 +0800
From: kernel test robot <lkp@intel.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [axboe-block:read_iter 2/3] fs/userfaultfd.c:1194:21: error:
 implicit declaration of function 'iov_iter_count'
Message-ID: <202404030402.BawLZfjR-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.git read_iter
head:   1a84ffcd0664911af64861f2cb3a35193ef6b62e
commit: 5b864248e0ffa748d4e3cd65748ceb26a06da941 [2/3] userfaultfd: convert to ->read_iter()
config: m68k-defconfig (https://download.01.org/0day-ci/archive/20240403/202404030402.BawLZfjR-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240403/202404030402.BawLZfjR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404030402.BawLZfjR-lkp@intel.com/

All errors (new ones prefixed by >>):

   fs/userfaultfd.c: In function 'userfaultfd_read_iter':
>> fs/userfaultfd.c:1194:21: error: implicit declaration of function 'iov_iter_count' [-Werror=implicit-function-declaration]
    1194 |                 if (iov_iter_count(to) < sizeof(msg))
         |                     ^~~~~~~~~~~~~~
>> fs/userfaultfd.c:1199:24: error: implicit declaration of function 'copy_to_iter'; did you mean 'copy_to_user'? [-Werror=implicit-function-declaration]
    1199 |                 _ret = copy_to_iter(&msg, sizeof(msg), to);
         |                        ^~~~~~~~~~~~
         |                        copy_to_user
   cc1: some warnings being treated as errors


vim +/iov_iter_count +1194 fs/userfaultfd.c

  1179	
  1180	static ssize_t userfaultfd_read_iter(struct kiocb *iocb, struct iov_iter *to)
  1181	{
  1182		struct file *file = iocb->ki_filp;
  1183		struct userfaultfd_ctx *ctx = file->private_data;
  1184		ssize_t _ret, ret = 0;
  1185		struct uffd_msg msg;
  1186		struct inode *inode = file_inode(file);
  1187		bool no_wait;
  1188	
  1189		if (!userfaultfd_is_initialized(ctx))
  1190			return -EINVAL;
  1191	
  1192		no_wait = file->f_flags & O_NONBLOCK || iocb->ki_flags & IOCB_NOWAIT;
  1193		for (;;) {
> 1194			if (iov_iter_count(to) < sizeof(msg))
  1195				return ret ? ret : -EINVAL;
  1196			_ret = userfaultfd_ctx_read(ctx, no_wait, &msg, inode);
  1197			if (_ret < 0)
  1198				return ret ? ret : _ret;
> 1199			_ret = copy_to_iter(&msg, sizeof(msg), to);
  1200			if (_ret < 0)
  1201				return ret ? ret : -EFAULT;
  1202			ret += sizeof(msg);
  1203			/*
  1204			 * Allow to read more than one fault at time but only
  1205			 * block if waiting for the very first one.
  1206			 */
  1207			no_wait = true;
  1208		}
  1209	}
  1210	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
