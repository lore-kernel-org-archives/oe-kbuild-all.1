Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3D3B31986E
	for <oe-kbuild-all@lists.linux.dev>; Sun,  1 Feb 2026 08:42:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769935372; cv=none; b=DhvUDX+/K8UsfEMbLbetfg9a7iMajujlq+1CmPYTBLwg4UoFAq+adR8pbeGbAJyFb6dC8dpW9B0tnnPPyJ8KOqYXDwnb2NpFx5JR0vPAQK7A53IbRO7kv5xBuSUdm9IQ0l/tniHFJp2cJkTw+xp9q1xeX2dJt864SqwYbeW/dQ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769935372; c=relaxed/simple;
	bh=HgiWnJM+mf3rUNLbH9B7OKoJ1DgLBVAhG3C+fgLUnUA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=unZksM88C1ln2cjOI/Dg77zxX1VIz89j/LONibkcc/s+KnkfYUduPmBrh03QRaTJG2Qu3Jl4+hZvvCOWOjfe51JQinC6DZBMdF1du985dRBPXEggRLeovwJ4EWkPRH6epcoTR+/xL8IfCBbHYfLX+d+LVIPY5Jiq4G7oBM3Svk0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Y8tf2bj8; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Y8tf2bj8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769935370; x=1801471370;
  h=date:from:to:cc:subject:message-id;
  bh=HgiWnJM+mf3rUNLbH9B7OKoJ1DgLBVAhG3C+fgLUnUA=;
  b=Y8tf2bj8PR3R7hGKNQsji9zyzCfEnCk0W7V/Gdwhvkxg3Rkmb73snJzi
   cWKJKbS3jzNCTWfyCa3Li66nIzr/2C30A9dzNBsRE/V4sldC8RoNd+X+E
   4YMYa/AWIOOD43ycDPsbF8qhMGM+yvUdi1ld58hJ8M36/HK605m/gsaX/
   H99kyMzAYTiVIIMu+knl09x7aBXVpsyJLM2zOBHKMSNrJ8MYcR5w0VS8a
   lbTJtrWHF6Hwa2c+J3cArjJOmUUOp4zC0FIx4oNM9Az6o4kbC8c83SfUT
   Vpcd2hZXfHdLS9piQ4J4fe5TzxI65p9y7ZZPKyu1VOWqpQ5W2IxsfG7I5
   w==;
X-CSE-ConnectionGUID: YG/+dTqXSvqA9DVPFwBHrw==
X-CSE-MsgGUID: ++Z5Pyg9QV2V6F757qWI7Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11688"; a="82548852"
X-IronPort-AV: E=Sophos;i="6.21,266,1763452800"; 
   d="scan'208";a="82548852"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Feb 2026 00:42:47 -0800
X-CSE-ConnectionGUID: bU+ffI72Q2+glm+NA4Arig==
X-CSE-MsgGUID: Q7QH/fMxTwyba/LttpSn7A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,266,1763452800"; 
   d="scan'208";a="209617697"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 01 Feb 2026 00:42:46 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vmT2Z-00000000efq-342X;
	Sun, 01 Feb 2026 08:42:43 +0000
Date: Sun, 01 Feb 2026 16:42:16 +0800
From: kernel test robot <lkp@intel.com>
To: Al Viro <viro@zeniv.linux.org.uk>
Cc: oe-kbuild-all@lists.linux.dev, linux-fsdevel@vger.kernel.org
Subject: [viro-vfs:for-wsamuel2 40/40]
 drivers/usb/gadget/function/f_fs.c:660:17: error: implicit declaration of
 function 'ffs_data_reset'; did you mean 'ffs_data_get'?
Message-ID: <202602011622.nYyDo3kh-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/viro/vfs.git for-wsamuel2
head:   9a8dd89bd5c65c4189f2bf6291f0f9a3d0df31c5
commit: 9a8dd89bd5c65c4189f2bf6291f0f9a3d0df31c5 [40/40] serialize ffs_ep0_open() on ffs->mutex, this time without ffs_data_reset() under ->mutex
config: s390-randconfig-001-20260201 (https://download.01.org/0day-ci/archive/20260201/202602011622.nYyDo3kh-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 13.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260201/202602011622.nYyDo3kh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602011622.nYyDo3kh-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   drivers/usb/gadget/function/f_fs.c: In function 'ffs_ep0_open':
>> drivers/usb/gadget/function/f_fs.c:660:17: error: implicit declaration of function 'ffs_data_reset'; did you mean 'ffs_data_get'? [-Werror=implicit-function-declaration]
     660 |                 ffs_data_reset(ffs);
         |                 ^~~~~~~~~~~~~~
         |                 ffs_data_get
   drivers/usb/gadget/function/f_fs.c: At top level:
>> drivers/usb/gadget/function/f_fs.c:2089:13: warning: conflicting types for 'ffs_data_reset'; have 'void(struct ffs_data *)'
    2089 | static void ffs_data_reset(struct ffs_data *ffs);
         |             ^~~~~~~~~~~~~~
>> drivers/usb/gadget/function/f_fs.c:2089:13: error: static declaration of 'ffs_data_reset' follows non-static declaration
   drivers/usb/gadget/function/f_fs.c:660:17: note: previous implicit declaration of 'ffs_data_reset' with type 'void(struct ffs_data *)'
     660 |                 ffs_data_reset(ffs);
         |                 ^~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +660 drivers/usb/gadget/function/f_fs.c

   640	
   641	static int ffs_ep0_open(struct inode *inode, struct file *file)
   642	{
   643		struct ffs_data *ffs = inode->i_sb->s_fs_info;
   644		int ret;
   645	
   646		/* Acquire mutex */
   647		ret = ffs_mutex_lock(&ffs->mutex, file->f_flags & O_NONBLOCK);
   648		if (ret < 0)
   649			return ret;
   650	
   651		if (ffs->state == FFS_CLOSING) {
   652			mutex_unlock(&ffs->mutex);
   653			return -EBUSY;
   654		}
   655	
   656		if (atomic_add_return(1, &ffs->opened) == 1 &&
   657				ffs->state == FFS_DEACTIVATED) {
   658			ffs->state = FFS_CLOSING;
   659			mutex_unlock(&ffs->mutex);
 > 660			ffs_data_reset(ffs);
   661		} else {
   662			mutex_unlock(&ffs->mutex);
   663		}
   664		file->private_data = ffs;
   665	
   666		return stream_open(inode, file);
   667	}
   668	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
