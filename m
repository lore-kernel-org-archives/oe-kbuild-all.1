Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C309D44C6A
	for <oe-kbuild-all@lists.linux.dev>; Mon, 11 Mar 2024 15:19:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710170390; cv=none; b=C6S26XnwDVAHdW3HWVyKCC8GfQGudZkVYDlukcsVaOjQRB8W4A+4efQIo7ob7jHrwlOU+8qkRt3GXoR7Y10ZpW907A8o6MH3TrytfaIX768nm6mdVt0mueckEqPGccoko35sAHy3m34LZFOAkNZIRZ3gAV9JLLDEb38QCXG5z1I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710170390; c=relaxed/simple;
	bh=o132cQB0t6xhPJqGGf6DFFClm74k7/l4N5xJHra/MqI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qnrvivzZENwYGhU7ZkMQB3E16ixHbEOvN+z0pvUHXwfJlmxj2g+wG7l//vG85RgLsAsMBf+wRuVMLzCIHRRW51J0eoKAJ4ozrQi5DFxUJquFK3jAml3LhGNV5NQFbO4lK/0AqIQo6/FmFpWjIWw/FbI5xTJsbIzOpVFgl0KlD/4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lWdavI9V; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lWdavI9V"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1710170388; x=1741706388;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=o132cQB0t6xhPJqGGf6DFFClm74k7/l4N5xJHra/MqI=;
  b=lWdavI9VAR/8BLvza0yvnVp9l+Zx53v0Mp4+fk8xfHyTQumoP06NEGbL
   W83IXDa1w/+4aDQ3erk6LP583RyjyxW+RaJH981E/Ugqr6X5VtTZC/cdg
   x7gUr7SmC9KB2jzPEAQgo3q8taKjGtoeVocl9bqGfRNhP5b8wE7DCT0ae
   iBjoFLPEGeVoqlJHC+mUAsbaI+q5HGyppcx4875rKomqRuHcf/OUV6zF3
   32ehyTnq7vgYIyqCiEZ4Dn8GAWjjmPRWQ9XQakLKtDY9zvsa7y/nP0j9W
   yu/4S7xky61n7Lb+E4LqjdJ9ja5mfBmO7aFpfvqhXOc51vfXb/PwdEoOs
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11010"; a="4962720"
X-IronPort-AV: E=Sophos;i="6.07,117,1708416000"; 
   d="scan'208";a="4962720"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Mar 2024 08:19:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,117,1708416000"; 
   d="scan'208";a="15846209"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 11 Mar 2024 08:19:46 -0700
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rjhRH-0009Ch-2f;
	Mon, 11 Mar 2024 15:19:43 +0000
Date: Mon, 11 Mar 2024 23:19:33 +0800
From: kernel test robot <lkp@intel.com>
To: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH vhost v2 1/4] virtio: find_vqs: pass struct instead of
 multi parameters
Message-ID: <202403112341.wl8NPpPC-lkp@intel.com>
References: <20240311072113.67673-2-xuanzhuo@linux.alibaba.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240311072113.67673-2-xuanzhuo@linux.alibaba.com>

Hi Xuan,

kernel test robot noticed the following build errors:

[auto build test ERROR on remoteproc/rproc-next]
[also build test ERROR on s390/features linus/master v6.8 next-20240308]
[cannot apply to uml/next uml/fixes]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Xuan-Zhuo/virtio-find_vqs-pass-struct-instead-of-multi-parameters/20240311-152448
base:   git://git.kernel.org/pub/scm/linux/kernel/git/remoteproc/linux.git rproc-next
patch link:    https://lore.kernel.org/r/20240311072113.67673-2-xuanzhuo%40linux.alibaba.com
patch subject: [PATCH vhost v2 1/4] virtio: find_vqs: pass struct instead of multi parameters
config: arm64-defconfig (https://download.01.org/0day-ci/archive/20240311/202403112341.wl8NPpPC-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240311/202403112341.wl8NPpPC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403112341.wl8NPpPC-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/virtio/virtio_pci_modern.c: In function 'vp_modern_create_avq':
>> drivers/virtio/virtio_pci_modern.c:761:22: error: assignment of read-only location '*cfg.names'
     761 |         cfg.names[0] = avq->name;
         |                      ^


vim +761 drivers/virtio/virtio_pci_modern.c

   735	
   736	static int vp_modern_create_avq(struct virtio_device *vdev)
   737	{
   738		struct virtio_pci_device *vp_dev = to_vp_device(vdev);
   739		vq_callback_t *callbacks[] = { NULL };
   740		struct virtio_vq_config cfg = {};
   741		struct virtio_pci_admin_vq *avq;
   742		struct virtqueue *vq;
   743		const char *names[1];
   744		u16 admin_q_num;
   745	
   746		cfg.nvqs = 1;
   747		cfg.callbacks = callbacks;
   748		cfg.names = names;
   749	
   750		if (!virtio_has_feature(vdev, VIRTIO_F_ADMIN_VQ))
   751			return 0;
   752	
   753		admin_q_num = vp_modern_avq_num(&vp_dev->mdev);
   754		if (!admin_q_num)
   755			return -EINVAL;
   756	
   757		avq = &vp_dev->admin_vq;
   758		avq->vq_index = vp_modern_avq_index(&vp_dev->mdev);
   759		sprintf(avq->name, "avq.%u", avq->vq_index);
   760	
 > 761		cfg.names[0] = avq->name;
   762		cfg.cfg_idx = 0;
   763		vq = vp_dev->setup_vq(vp_dev, &vp_dev->admin_vq.info, avq->vq_index,
   764				      &cfg, VIRTIO_MSI_NO_VECTOR);
   765		if (IS_ERR(vq)) {
   766			dev_err(&vdev->dev, "failed to setup admin virtqueue, err=%ld",
   767				PTR_ERR(vq));
   768			return PTR_ERR(vq);
   769		}
   770	
   771		vp_modern_set_queue_enable(&vp_dev->mdev, avq->info.vq->index, true);
   772		return 0;
   773	}
   774	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
