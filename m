Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 718921E505
	for <oe-kbuild-all@lists.linux.dev>; Wed, 28 Jan 2026 00:31:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769560304; cv=none; b=IQd3bIWr7vpuNhEjX2FX5nhYSQM9RsaHKXqPxa6kHjWAcU2Xgvp+YfZc6KLooiZa3mSG5uMhdgmJe00kk3UkI2ys+UwuO4s1z5ztq6Co6zPqOvWYbCIAfEt6uwWeVBaPIafjK3Rwk8at1cl6YTK672YV5ybmJtC3njGMUis2nMU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769560304; c=relaxed/simple;
	bh=zF/rAA7SR1fxGTAx9Q1QtsU0LOaDJ62LH4zuaETMZV0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=BU4Oz7puhqA+1SLCXHsm9mXjr95SNVoGDKhUBkcNRtzzMSZ1HeYXamE1+uVgxzFjJYqfGDIzyrsPoaSeopO5UzGW7EhWkcli4cla6fh+ippiXyyphKy2Ltv8PyvgI2pETixcGuocHV0DJ4VdIQNIridPhqoqks0EDmIoOGocTIM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BuYSKjNZ; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BuYSKjNZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769560302; x=1801096302;
  h=date:from:to:cc:subject:message-id;
  bh=zF/rAA7SR1fxGTAx9Q1QtsU0LOaDJ62LH4zuaETMZV0=;
  b=BuYSKjNZAHbkdb/b88Xq4x77YarD872EmSLCxOd6H+rzs+41/l7/s5s/
   dj5xITUf+oplvWFb+V6LsV1QgbrCL2IRzf/UdnYElbV/Y78i4ydzEgpk2
   IbblUhnSTn+4S/PkpMkLbNuSQvDUeaR47bFThO5+O7TIaccKy1Z9ofyec
   RpXNZvxFmavquuAbR4gGOq62Sv/2b+Y8Khx0U+x2BeUTOzIwsMDY3jID1
   h0YmW+3bkHweNbzciaIfSjZWTO+h50Zw8DDDXpeJck/aKulxAwEL7L+M/
   MZs16ruEhGBrwOSumhKsUWL6fX/P1kSjKig4H6jYb+3AmdWA8IZg2DrOI
   Q==;
X-CSE-ConnectionGUID: Nj+MNls9RL+/5ZnqH92V3Q==
X-CSE-MsgGUID: w17UIwlZS3aL9j06QSRyJw==
X-IronPort-AV: E=McAfee;i="6800,10657,11684"; a="70662696"
X-IronPort-AV: E=Sophos;i="6.21,257,1763452800"; 
   d="scan'208";a="70662696"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jan 2026 16:31:42 -0800
X-CSE-ConnectionGUID: XgN7zG59RZ+5HQTtjhG4Fw==
X-CSE-MsgGUID: r8f1EEvaR7SWLDI7VohL+g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,257,1763452800"; 
   d="scan'208";a="212590575"
Received: from igk-lkp-server01.igk.intel.com (HELO afc5bfd7f602) ([10.211.93.152])
  by fmviesa005.fm.intel.com with ESMTP; 27 Jan 2026 16:31:40 -0800
Received: from kbuild by afc5bfd7f602 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vktT8-000000001xP-2CwY;
	Wed, 28 Jan 2026 00:31:38 +0000
Date: Wed, 28 Jan 2026 01:31:10 +0100
From: kernel test robot <lkp@intel.com>
To: Johannes Thumshirn <johannes.thumshirn@wdc.com>
Cc: oe-kbuild-all@lists.linux.dev, 0day robot <lkp@intel.com>
Subject: drivers/vhost/vringh.c:559:33: error: lvalue required as
 unary '&' operand
Message-ID: <202601280148.8Z2rFqjo-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/intel-lab-lkp/linux/commits/Johannes-Thumshirn/virtio-silence-KCSAN-warning-in-virtqueue_get_buf_ctx_split/20260127-235023
head:   d43eaf1d749bfdaff9cd06104bb8838d105ab33b
commit: d43eaf1d749bfdaff9cd06104bb8838d105ab33b virtio: silence KCSAN warning in virtqueue_kick_prepare
date:   9 hours ago
config: x86_64-rhel-9.4-ltp (https://download.01.org/0day-ci/archive/20260128/202601280148.8Z2rFqjo-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260128/202601280148.8Z2rFqjo-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601280148.8Z2rFqjo-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/vhost/vringh.c: In function '__vringh_notify_enable':
>> drivers/vhost/vringh.c:559:33: error: lvalue required as unary '&' operand
     559 |                 if (putu16(vrh, &vring_avail_event(&vrh->vring),
         |                                 ^
   drivers/vhost/vringh.c:562:36: error: lvalue required as unary '&' operand
     562 |                                    &vring_avail_event(&vrh->vring));
         |                                    ^


vim +559 drivers/vhost/vringh.c

f87d0fbb579818 Rusty Russell      2013-03-20  542  
f87d0fbb579818 Rusty Russell      2013-03-20  543  static inline bool __vringh_notify_enable(struct vringh *vrh,
b9f7ac8c72894c Michael S. Tsirkin 2014-12-12  544  					  int (*getu16)(const struct vringh *vrh,
b9f7ac8c72894c Michael S. Tsirkin 2014-12-12  545  							u16 *val, const __virtio16 *p),
b9f7ac8c72894c Michael S. Tsirkin 2014-12-12  546  					  int (*putu16)(const struct vringh *vrh,
b9f7ac8c72894c Michael S. Tsirkin 2014-12-12  547  							__virtio16 *p, u16 val))
f87d0fbb579818 Rusty Russell      2013-03-20  548  {
f87d0fbb579818 Rusty Russell      2013-03-20  549  	u16 avail;
f87d0fbb579818 Rusty Russell      2013-03-20  550  
f87d0fbb579818 Rusty Russell      2013-03-20  551  	if (!vrh->event_indices) {
f87d0fbb579818 Rusty Russell      2013-03-20  552  		/* Old-school; update flags. */
b9f7ac8c72894c Michael S. Tsirkin 2014-12-12  553  		if (putu16(vrh, &vrh->vring.used->flags, 0) != 0) {
f87d0fbb579818 Rusty Russell      2013-03-20  554  			vringh_bad("Clearing used flags %p",
f87d0fbb579818 Rusty Russell      2013-03-20  555  				   &vrh->vring.used->flags);
f87d0fbb579818 Rusty Russell      2013-03-20  556  			return true;
f87d0fbb579818 Rusty Russell      2013-03-20  557  		}
f87d0fbb579818 Rusty Russell      2013-03-20  558  	} else {
b9f7ac8c72894c Michael S. Tsirkin 2014-12-12 @559  		if (putu16(vrh, &vring_avail_event(&vrh->vring),
f87d0fbb579818 Rusty Russell      2013-03-20  560  			   vrh->last_avail_idx) != 0) {
f87d0fbb579818 Rusty Russell      2013-03-20  561  			vringh_bad("Updating avail event index %p",
f87d0fbb579818 Rusty Russell      2013-03-20  562  				   &vring_avail_event(&vrh->vring));
f87d0fbb579818 Rusty Russell      2013-03-20  563  			return true;
f87d0fbb579818 Rusty Russell      2013-03-20  564  		}
f87d0fbb579818 Rusty Russell      2013-03-20  565  	}
f87d0fbb579818 Rusty Russell      2013-03-20  566  
f87d0fbb579818 Rusty Russell      2013-03-20  567  	/* They could have slipped one in as we were doing that: make
f87d0fbb579818 Rusty Russell      2013-03-20  568  	 * sure it's written, then check again. */
f87d0fbb579818 Rusty Russell      2013-03-20  569  	virtio_mb(vrh->weak_barriers);
f87d0fbb579818 Rusty Russell      2013-03-20  570  
b9f7ac8c72894c Michael S. Tsirkin 2014-12-12  571  	if (getu16(vrh, &avail, &vrh->vring.avail->idx) != 0) {
f87d0fbb579818 Rusty Russell      2013-03-20  572  		vringh_bad("Failed to check avail idx at %p",
f87d0fbb579818 Rusty Russell      2013-03-20  573  			   &vrh->vring.avail->idx);
f87d0fbb579818 Rusty Russell      2013-03-20  574  		return true;
f87d0fbb579818 Rusty Russell      2013-03-20  575  	}
f87d0fbb579818 Rusty Russell      2013-03-20  576  
f87d0fbb579818 Rusty Russell      2013-03-20  577  	/* This is unlikely, so we just leave notifications enabled
f87d0fbb579818 Rusty Russell      2013-03-20  578  	 * (if we're using event_indices, we'll only get one
f87d0fbb579818 Rusty Russell      2013-03-20  579  	 * notification anyway). */
f87d0fbb579818 Rusty Russell      2013-03-20  580  	return avail == vrh->last_avail_idx;
f87d0fbb579818 Rusty Russell      2013-03-20  581  }
f87d0fbb579818 Rusty Russell      2013-03-20  582  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
