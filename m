Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C58B17547
	for <oe-kbuild-all@lists.linux.dev>; Sat,  7 Sep 2024 02:28:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725676139; cv=none; b=Zge5DnIg/Tewap/sNoYFp3AxPTJ1ntVvTdSC+xFQ+JQlv491rh+/fYhhgKyPq6Opw2HOawNTKZMmBrLsVawrHxs2pMNcegP4csm8ZSwc8viS0k/Ny/m/Xw+hdTm50lYwNnnDKpaVOXDvgo1CzsPxKiY/xNGAPQpDWZZWf74WqlU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725676139; c=relaxed/simple;
	bh=EfChNY0siJ3rfyr74+IUV0O5b/V8nxl/RCyJ6x1RCVk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=jMZqmdAkNLrsYcQJERvygF9nIp56kPNrKbwQEYbFgaSaWzYD6UiNrJmdTNHjd3GPR9NJfZEuirjA5xlIOcDkKa/JcUDVUee7gLILcnIGWG2jicP/blqkYkmA/MdN0Y7PBnEqkwiDIEh4MZO/wf8cc71HGC9gHRUnDeSCSnVX578=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KUr5rJJy; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KUr5rJJy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725676137; x=1757212137;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=EfChNY0siJ3rfyr74+IUV0O5b/V8nxl/RCyJ6x1RCVk=;
  b=KUr5rJJyHtkd56dz+wEL0ZCnbtRvm930t+WXl/Spp9MFINv1atK2fEnx
   lBNapgJ8QsujoJQOS1ro4qkKELV27a5etMsy29mZMVMiKRgkv7jayZ2Tx
   qa6AgjjfUIojray/7vZHD/HnkDZ6jIXMCyHGFVyt+9OKIlhHZe2Kl6r3o
   IUu1LOG/5rHEpBjtSNQhPQ5Pd4X4w5AOSq8q3EYwK5hcr6ekbV9zq2XFQ
   GnNfOeNfJ86j0pEJDU9Ew0e47LT6YSG/0T3Bsa28clQDg/Sq6HIQX2W5S
   FwrW2afirHEHFAfQc9ueCywTDYBTdA3xzNofa3f6C+kWfAsAn3gFVqr3i
   A==;
X-CSE-ConnectionGUID: m80gwXEuTFO1fvet4JG7Gg==
X-CSE-MsgGUID: QUCUCnSmQwOrbmNRrwW8qA==
X-IronPort-AV: E=McAfee;i="6700,10204,11187"; a="24322831"
X-IronPort-AV: E=Sophos;i="6.10,209,1719903600"; 
   d="scan'208";a="24322831"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Sep 2024 19:28:56 -0700
X-CSE-ConnectionGUID: E2SRJOehQX+cpM9dFrkMGA==
X-CSE-MsgGUID: ZWmE8ezLTUy3axCX4lE7NQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,209,1719903600"; 
   d="scan'208";a="66152410"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 06 Sep 2024 19:28:55 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1smlC1-000C3F-1f;
	Sat, 07 Sep 2024 02:28:53 +0000
Date: Sat, 7 Sep 2024 10:28:14 +0800
From: kernel test robot <lkp@intel.com>
To: Chandan Babu R <chandanbabu@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: [linux-next:master 10091/10296] fs/xfs/xfs_trace.h:1458:undefined
 reference to `filemap_fsnotify_fault'
Message-ID: <202409071053.NVH8MvT1-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   9aaeb87ce1e966169a57f53a02ba05b30880ffb8
commit: 4cff4fd3ffa14cca5c8021493fef50b432c87c7c [10091/10296] Merge branch 'for-next' of git://git.kernel.org/pub/scm/fs/xfs/xfs-linux.git
config: riscv-randconfig-r036-20230531 (https://download.01.org/0day-ci/archive/20240907/202409071053.NVH8MvT1-lkp@intel.com/config)
compiler: riscv32-linux-gcc (GCC) 13.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240907/202409071053.NVH8MvT1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409071053.NVH8MvT1-lkp@intel.com/

All errors (new ones prefixed by >>):

   riscv32-linux-ld: fs/xfs/xfs_file.o: in function `trace_xfs_file_direct_write':
>> fs/xfs/xfs_trace.h:1458:(.text+0x1f8c): undefined reference to `filemap_fsnotify_fault'


vim +1458 fs/xfs/xfs_trace.h

f8adb4d574cf8c fs/xfs/linux-2.6/xfs_trace.h Li Zefan          2010-05-24  1449  
0b1b213fcf3a84 fs/xfs/linux-2.6/xfs_trace.h Christoph Hellwig 2009-12-14  1450  #define DEFINE_RW_EVENT(name)		\
f8adb4d574cf8c fs/xfs/linux-2.6/xfs_trace.h Li Zefan          2010-05-24  1451  DEFINE_EVENT(xfs_file_class, name,	\
3e40b13c3b5710 fs/xfs/xfs_trace.h           Christoph Hellwig 2021-01-23  1452  	TP_PROTO(struct kiocb *iocb, struct iov_iter *iter),		\
3e40b13c3b5710 fs/xfs/xfs_trace.h           Christoph Hellwig 2021-01-23  1453  	TP_ARGS(iocb, iter))
3176c3e0ef3296 fs/xfs/xfs_trace.h           Christoph Hellwig 2016-07-20  1454  DEFINE_RW_EVENT(xfs_file_buffered_read);
3176c3e0ef3296 fs/xfs/xfs_trace.h           Christoph Hellwig 2016-07-20  1455  DEFINE_RW_EVENT(xfs_file_direct_read);
16d4d43595b478 fs/xfs/xfs_trace.h           Christoph Hellwig 2016-07-20  1456  DEFINE_RW_EVENT(xfs_file_dax_read);
0b1b213fcf3a84 fs/xfs/linux-2.6/xfs_trace.h Christoph Hellwig 2009-12-14  1457  DEFINE_RW_EVENT(xfs_file_buffered_write);
0b1b213fcf3a84 fs/xfs/linux-2.6/xfs_trace.h Christoph Hellwig 2009-12-14 @1458  DEFINE_RW_EVENT(xfs_file_direct_write);
16d4d43595b478 fs/xfs/xfs_trace.h           Christoph Hellwig 2016-07-20  1459  DEFINE_RW_EVENT(xfs_file_dax_write);
896f72d067a5e9 fs/xfs/xfs_trace.h           Christoph Hellwig 2021-01-23  1460  DEFINE_RW_EVENT(xfs_reflink_bounce_dio_write);
896f72d067a5e9 fs/xfs/xfs_trace.h           Christoph Hellwig 2021-01-23  1461  

:::::: The code at line 1458 was first introduced by commit
:::::: 0b1b213fcf3a8486ada99a2bab84ab8c6f51b264 xfs: event tracing support

:::::: TO: Christoph Hellwig <hch@infradead.org>
:::::: CC: Alex Elder <aelder@sgi.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
