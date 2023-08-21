Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E6054A31
	for <oe-kbuild-all@lists.linux.dev>; Mon, 21 Aug 2023 16:23:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692635034; x=1724171034;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=df0pNlWExys7JXxdYFyuoQG4di6JR0h4kHkCThFvois=;
  b=UUdcCskkez3Qbn26tm1SnD1RRlEMQOgYIX6EsnOfd/ryG3w/4HUvh8lf
   EeEq9JuVpNfSyqKcX5FpHZ1hbAUXyphQJtXxRqyzCNUPUS2YYGgBQfH3r
   YLnMzbvxwAhaY3N/yLsxkwY/58NUdWyR/Vd89oB6K1xSepayV6flIUiUd
   9qRVbaqvqnLcf8fM3DOt+MAr18XDjSq9M0dcbWEktWe6ophpJiHpAFJUa
   hNbdH+yAVB8Z/7Wc4v974vbh5mXrSqmTPBfKzWFUnIW+2fJ2YEm1YpI2e
   4/9GGQQZtbCB0cSOHvN9yJsetD+S1ugacZcLUqaB7lFJe/a0vC4c2sDMU
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10809"; a="373607403"
X-IronPort-AV: E=Sophos;i="6.01,190,1684825200"; 
   d="scan'208";a="373607403"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Aug 2023 09:19:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10809"; a="765433672"
X-IronPort-AV: E=Sophos;i="6.01,190,1684825200"; 
   d="scan'208";a="765433672"
Received: from lkp-server02.sh.intel.com (HELO 6809aa828f2a) ([10.239.97.151])
  by orsmga008.jf.intel.com with ESMTP; 21 Aug 2023 09:19:50 -0700
Received: from kbuild by 6809aa828f2a with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qY7d7-0000gW-1a;
	Mon, 21 Aug 2023 16:19:49 +0000
Date: Tue, 22 Aug 2023 00:18:56 +0800
From: kernel test robot <lkp@intel.com>
To: David Howells <dhowells@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [dhowells-fs:ceph-iter 20/30] drivers/block/rbd.c:2741:10: warning:
 #warning needs fixing
Message-ID: <202308220005.oicMmXaj-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git ceph-iter
head:   d98064c4bf02eba42e22917aecccfb339c094d26
commit: 0ec6ade2238b50514b25dff59d86b19b76b1bc2d [20/30] rbd: Switch from using bvec_iter to iov_iter
config: loongarch-allyesconfig (https://download.01.org/0day-ci/archive/20230822/202308220005.oicMmXaj-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230822/202308220005.oicMmXaj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308220005.oicMmXaj-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/block/rbd.c: In function 'rbd_obj_read_from_parent':
>> drivers/block/rbd.c:2741:10: warning: #warning needs fixing [-Wcpp]
    2741 |         #warning needs fixing
         |          ^~~~~~~


vim +2741 drivers/block/rbd.c

  2705	
  2706	static int rbd_obj_read_from_parent(struct rbd_obj_request *obj_req)
  2707	{
  2708		struct rbd_img_request *img_req = obj_req->img_request;
  2709		struct rbd_device *parent = img_req->rbd_dev->parent;
  2710		struct rbd_img_request *child_img_req;
  2711		int ret;
  2712	
  2713		child_img_req = kmem_cache_alloc(rbd_img_request_cache, GFP_NOIO);
  2714		if (!child_img_req)
  2715			return -ENOMEM;
  2716	
  2717		rbd_img_request_init(child_img_req, parent, OBJ_OP_READ);
  2718		__set_bit(IMG_REQ_CHILD, &child_img_req->flags);
  2719		child_img_req->obj_request = obj_req;
  2720	
  2721		down_read(&parent->header_rwsem);
  2722		rbd_img_capture_header(child_img_req);
  2723		up_read(&parent->header_rwsem);
  2724	
  2725		dout("%s child_img_req %p for obj_req %p\n", __func__, child_img_req,
  2726		     obj_req);
  2727	
  2728	#if 0 //////////////////// TODO
  2729		if (!rbd_img_is_write(img_req)) {
  2730			ret = rbd_img_fill_request(child_img_req,
  2731						   obj_req->img_extents,
  2732						   obj_req->num_img_extents,
  2733						   &obj_req->iter);
  2734		} else {
  2735			ret = rbd_img_fill_request(img_req,
  2736						   obj_req->img_extents,
  2737						   obj_req->num_img_extents,
  2738						   &obj_req->copyup_buf->iter);
  2739		}
  2740	#else
> 2741		#warning needs fixing
  2742		ret = -ENOMEM;
  2743		BUG();
  2744	#endif
  2745		if (ret) {
  2746			rbd_img_request_destroy(child_img_req);
  2747			return ret;
  2748		}
  2749	
  2750		/* avoid parent chain recursion */
  2751		rbd_img_schedule(child_img_req, 0);
  2752		return 0;
  2753	}
  2754	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
