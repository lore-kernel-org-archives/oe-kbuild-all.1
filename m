Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0604233DB
	for <oe-kbuild-all@lists.linux.dev>; Thu, 22 May 2025 09:33:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747906409; cv=none; b=vBzWzetjiFfpZ6qQgohkGkw8eb/9EDcviNZqMqNZ/rB/N2seYGylXetPRGDe03L5bNhbwEBOhczov9DOGlMlSRgWMNaU/S6h3eEtchZe0hI47n9VfgXshCxfTevaM25u4oSrCDO99KAMnte62vGhirJbMgaNR2HhTn8xzqf5ZB4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747906409; c=relaxed/simple;
	bh=HmgpfpaPlYoQaXqj2IgH9Bqjeh/mZuJRsD4G44zC8hw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ORDuhJo1O2uEzQ4D5k2PheiVYZGlccJVo4sMotNAB7R/tPLR03sy/Nm1rEk3fdRgWN6KuaUiUg1EFEEZet3bUMktd+Sw4jctDBFSCconTUW1cWt1a7xldgVvBi43yBGx6ePzH1kScvuA68378vJiHQr5IK0keaoUaCbi/NJoChc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Fol0/ZgR; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Fol0/ZgR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747906408; x=1779442408;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=HmgpfpaPlYoQaXqj2IgH9Bqjeh/mZuJRsD4G44zC8hw=;
  b=Fol0/ZgRo/GtnKwVqlyesF0kqAm0noVxjYhC2JoSeW8ywyzNjFSFovdI
   bq89uFBGVBvuaDuxccHv9z3ZbB8XQg00a61JhNPKHVhDmx0F1HKMQDAaG
   WXm/d5WxwhNK0oE5cVw5zCaCgHDdnmYXIK2htgqEG6jeHkzV2F7QYN3O0
   pdxEB/z06bdT6QRWgtqFt/6ZGv7AtaTvd36X/cBejWff43BKG0cfUgpOM
   D3YzaFQnPo9MUb5Yp67KsPxruJbrJS77HiHHds2vYRSHASYrlQKWv3m2S
   b47S0Jf02xGIfrAhW1QYUurCg08s9VLIu4YfXsIf94i7sRDgUgvw2IiH6
   g==;
X-CSE-ConnectionGUID: zMHX4EbrSv+iYPmLC2cW1Q==
X-CSE-MsgGUID: YNNpD/CpR4qBhlUmL/kHtg==
X-IronPort-AV: E=McAfee;i="6700,10204,11440"; a="72446562"
X-IronPort-AV: E=Sophos;i="6.15,305,1739865600"; 
   d="scan'208";a="72446562"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 May 2025 02:33:28 -0700
X-CSE-ConnectionGUID: N7T9lEncTKem5v1F0i96JQ==
X-CSE-MsgGUID: SNcyoQypQ4GcS7sXcOTqlA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,305,1739865600"; 
   d="scan'208";a="145479808"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 22 May 2025 02:33:27 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uI2Im-000PAO-1C;
	Thu, 22 May 2025 09:33:24 +0000
Date: Thu, 22 May 2025 17:33:04 +0800
From: kernel test robot <lkp@intel.com>
To: Keith Busch <kbusch@meta.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH 4/5] block: add support for vectored copies
Message-ID: <202505221748.iEs8h3w7-lkp@intel.com>
References: <20250521223107.709131-5-kbusch@meta.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250521223107.709131-5-kbusch@meta.com>

Hi Keith,

kernel test robot noticed the following build warnings:

[auto build test WARNING on axboe-block/for-next]
[also build test WARNING on next-20250521]
[cannot apply to linux-nvme/for-next brauner-vfs/vfs.all linus/master v6.15-rc7]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Keith-Busch/block-new-sector-copy-api/20250522-063316
base:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.git for-next
patch link:    https://lore.kernel.org/r/20250521223107.709131-5-kbusch%40meta.com
patch subject: [PATCH 4/5] block: add support for vectored copies
config: openrisc-allnoconfig (https://download.01.org/0day-ci/archive/20250522/202505221748.iEs8h3w7-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250522/202505221748.iEs8h3w7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505221748.iEs8h3w7-lkp@intel.com/

All warnings (new ones prefixed by >>):

   block/ioctl.c: In function 'blk_ioctl_copy_vec':
>> block/ioctl.c:275:33: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
     275 |                                 (void __user *)(cr.sources + i * sizeof(csrc)),
         |                                 ^


vim +275 block/ioctl.c

   243	
   244	static int blk_ioctl_copy_vec(struct block_device *bdev, blk_mode_t mode,
   245			void __user *argp)
   246	{
   247		sector_t align = bdev_logical_block_size(bdev) >> SECTOR_SHIFT;
   248		struct bio_vec *bv, fast_bv[UIO_FASTIOV];
   249		struct copy_range cr;
   250		int i, nr, ret;
   251		__u64 dst;
   252	
   253		if (!(mode & BLK_OPEN_WRITE))
   254			return -EBADF;
   255		if (copy_from_user(&cr, argp, sizeof(cr)))
   256			return -EFAULT;
   257		if (!(IS_ALIGNED(cr.dst_sector, align)))
   258			return -EINVAL;
   259	
   260		nr = cr.nr_ranges;
   261		if (nr <= UIO_FASTIOV) {
   262			bv = fast_bv;
   263		} else {
   264			bv = kmalloc_array(nr, sizeof(*bv), GFP_KERNEL);
   265			if (!bv)
   266				return -ENOMEM;
   267		}
   268	
   269		dst = cr.dst_sector;
   270		for (i = 0; i < nr; i++) {
   271			struct copy_source csrc;
   272			__u64 nr_sects, src;
   273	
   274			if (copy_from_user(&csrc,
 > 275					(void __user *)(cr.sources + i * sizeof(csrc)),
   276					sizeof(csrc))) {
   277				ret = -EFAULT;
   278				goto out;
   279			}
   280	
   281			nr_sects = csrc.nr_sectors;
   282			src = csrc.src_sector;
   283			if (!(IS_ALIGNED(src | nr_sects, align)) ||
   284			    (src < dst && src + nr_sects > dst) ||
   285			    (dst < src && dst + nr_sects > src)) {
   286				ret = -EINVAL;
   287				goto out;
   288			}
   289	
   290			bv[i].bv_sectors = nr_sects;
   291			bv[i].bv_sector = src;
   292		}
   293	
   294		ret = blkdev_copy_range(bdev, dst, bv, nr, GFP_KERNEL);
   295	out:
   296		if (bv != fast_bv)
   297			kfree(bv);
   298		return ret;
   299	}
   300	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
