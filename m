Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 815ED3F9CC
	for <oe-kbuild-all@lists.linux.dev>; Sat,  7 Sep 2024 20:37:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725741458; cv=none; b=MKk+vloi+NX3gdBYs+x1p1PMKGcBUCFm7IFZyvMZCXwO//5KcYYVF46LHUZatEIH+tfc+GbpSfTSjPOcIm23WTv3dWex3/fgxdv6dK8jSyDRGVNLmW16sWA0otE+olDQ3KazdcVLUCBWmVu/APtc4z8Zgr2THVcqiwqLWPmuB6g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725741458; c=relaxed/simple;
	bh=4mANETC6gnEthzLMoZvc8aZVMJxz3W/hE7Q/D/lH2cI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=CrxDuQ574nYymQOJJq7JFP9YEZ16j6OwByJv580H3Ze3h/WBKOOMQMSYvf3YiJqEapOa+8lhYW4O2ZdhBzrCJlrt49EjSCGZdKfoU6RU5sEzEEKuFuLerxhVLO3NU00xC890szYCuAOnQbBQVgReJmbqWpXkD7bt+OdWAq63BCQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Dg3eKLZq; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Dg3eKLZq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725741456; x=1757277456;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=4mANETC6gnEthzLMoZvc8aZVMJxz3W/hE7Q/D/lH2cI=;
  b=Dg3eKLZqIBGjcbmjnyEFW4VyN+HC7xpBJmsQ8hxMw4YG2MZ3uXxQOyMR
   9teiwyGBZqsbB9/ory2ozJMrrOwb9f3XJGHalSPQU3Pc7ETn4pEYGsUYD
   g7tbsWeTBsVo4TQVY9qf9k7GDEP1j/OdkC4pPzT7wok1Pt5Wzdt2ye3DG
   JtNPSUlxK6ZVORjVRbsLfhOCcU9zthQvdiusTli5XHdI+PII4ZHeBI95w
   TOma1mXIdswEk2sacEdQNSwf7k7SrNC59WBiP/XdxRYnWRfKo1qZjs78r
   d40hKBRQC2BpElXZA9C/vbiBWynDNrghIdRGvPPgGKnJNjoEslL1h0tLY
   Q==;
X-CSE-ConnectionGUID: K06Z1f4ISMmu2NiLHamGiA==
X-CSE-MsgGUID: eT0V1KkFTC+41OLtDYxyaA==
X-IronPort-AV: E=McAfee;i="6700,10204,11188"; a="13424336"
X-IronPort-AV: E=Sophos;i="6.10,211,1719903600"; 
   d="scan'208";a="13424336"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Sep 2024 13:37:36 -0700
X-CSE-ConnectionGUID: 2VcMktYgTiiSOp3xKc0i/w==
X-CSE-MsgGUID: TyGqOPleR9yxpGHpzuq6eg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,211,1719903600"; 
   d="scan'208";a="70679578"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 07 Sep 2024 13:37:35 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sn2BZ-000CzP-07;
	Sat, 07 Sep 2024 20:37:33 +0000
Date: Sun, 8 Sep 2024 04:36:48 +0800
From: kernel test robot <lkp@intel.com>
To: David Howells <dhowells@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [dhowells-fs:ceph-iter 43/61] drivers/block/rbd.c:2745:10: warning:
 #warning needs fixing
Message-ID: <202409080413.q0t3UIld-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git ceph-iter
head:   6c59f154a1d493b31755ac17326124d804172fb2
commit: 7c05d26d256ee374483db177836b744874562f1b [43/61] [INCOMPLETE] rbd: Switch from using bvec_iter to iov_iter
config: i386-allmodconfig (https://download.01.org/0day-ci/archive/20240908/202409080413.q0t3UIld-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240908/202409080413.q0t3UIld-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409080413.q0t3UIld-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/block/rbd.c: In function 'rbd_obj_read_from_parent':
>> drivers/block/rbd.c:2745:10: warning: #warning needs fixing [-Wcpp]
    2745 |         #warning needs fixing
         |          ^~~~~~~


vim +2745 drivers/block/rbd.c

  2709	
  2710	static int rbd_obj_read_from_parent(struct rbd_obj_request *obj_req)
  2711	{
  2712		struct rbd_img_request *img_req = obj_req->img_request;
  2713		struct rbd_device *parent = img_req->rbd_dev->parent;
  2714		struct rbd_img_request *child_img_req;
  2715		int ret;
  2716	
  2717		child_img_req = kmem_cache_alloc(rbd_img_request_cache, GFP_NOIO);
  2718		if (!child_img_req)
  2719			return -ENOMEM;
  2720	
  2721		rbd_img_request_init(child_img_req, parent, OBJ_OP_READ);
  2722		__set_bit(IMG_REQ_CHILD, &child_img_req->flags);
  2723		child_img_req->obj_request = obj_req;
  2724	
  2725		down_read(&parent->header_rwsem);
  2726		rbd_img_capture_header(child_img_req);
  2727		up_read(&parent->header_rwsem);
  2728	
  2729		dout("%s child_img_req %p for obj_req %p\n", __func__, child_img_req,
  2730		     obj_req);
  2731	
  2732	#if 0 //////////////////// TODO
  2733		if (!rbd_img_is_write(img_req)) {
  2734			ret = rbd_img_fill_request(child_img_req,
  2735						   obj_req->img_extents,
  2736						   obj_req->num_img_extents,
  2737						   &obj_req->iter);
  2738		} else {
  2739			ret = rbd_img_fill_request(img_req,
  2740						   obj_req->img_extents,
  2741						   obj_req->num_img_extents,
  2742						   &obj_req->copyup_buf->iter);
  2743		}
  2744	#else
> 2745		#warning needs fixing
  2746		ret = -ENOMEM;
  2747		BUG();
  2748	#endif
  2749		if (ret) {
  2750			rbd_img_request_destroy(child_img_req);
  2751			return ret;
  2752		}
  2753	
  2754		/* avoid parent chain recursion */
  2755		rbd_img_schedule(child_img_req, 0);
  2756		return 0;
  2757	}
  2758	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
