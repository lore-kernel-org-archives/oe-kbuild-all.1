Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D702982899
	for <oe-kbuild-all@lists.linux.dev>; Wed, 30 Oct 2024 04:58:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730264340; cv=none; b=uWPkhy66CBogoIj3Q0dvEgN97OYMZaiaCw0PQ3cwglQkx4/6PZqIsuJa0cxx7ztzNgKSGvtRLjRg9btnDsAsfWBeRhAd62ZqCu+4KbfVJSjlAb0bYHBQwnU2hu1FCeHD2hEWJjJ13+celk5iIV8ignn4JCYQO7oFevlHH41cCHk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730264340; c=relaxed/simple;
	bh=Vey4MWA4TFHi3r5J/Vwkrf6AQ7M48MwyUC7JqNeoYco=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=PowfVgpZAVy6NaI+WqacUugrOVaAfsIJcwtNLeC6BOH44+1pFJ34f4J11CxcSvuO0mhv1FYycnifqu8epbSTpg79ISuFfObAqIdoVKDJKDB0TCByeQZFVzDeOEgikFyL0l1ktpa4uqfg+P9in4Yxm6c0aaKkcNi0uzNNMtQapoc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=C+ZoGYxz; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="C+ZoGYxz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730264337; x=1761800337;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Vey4MWA4TFHi3r5J/Vwkrf6AQ7M48MwyUC7JqNeoYco=;
  b=C+ZoGYxzq77fiSF7EQ6Qy8+eZgOQ9V2futLWL6mUYt9DdkXVHwk8iUfO
   ktZywT4HLHnHaDwOlEf9YreO0TWrjbhSBiLcbmHWTbpoKo72YPUuvpnat
   tBAyw96CuMyJ5d1YvD+k21KvmsmhK1H0SqmMoqFVJovXkz5NwxFSiNWbi
   XgydZJ+E4YbvXksM1r3dbGi5l8HrVTnPOVWk35bnTtPx3ZcL++VzwPku3
   3Y4l6dUsZ6TKETNqJTR5QPgaU+fEivbO+M+dA0WKIN/btXbJ4iJaFw2In
   kayzbXeL5Cyy+fvF+2W0NUaOUUzneOCZuOSaanU7AKITENUiTN35xG8fi
   A==;
X-CSE-ConnectionGUID: /saKl4HMTdK4TX7WQGoJgw==
X-CSE-MsgGUID: 6raVJtgHTLSZIKhe60/+WQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="30144911"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="30144911"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Oct 2024 21:58:57 -0700
X-CSE-ConnectionGUID: ZN2AzZ/WSR6spCOboE9N4w==
X-CSE-MsgGUID: g8kUSTE6Rx6CTmS5/7XW4w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,244,1725346800"; 
   d="scan'208";a="82358540"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 29 Oct 2024 21:58:55 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t60nE-000eWo-0i;
	Wed, 30 Oct 2024 04:58:52 +0000
Date: Wed, 30 Oct 2024 12:58:47 +0800
From: kernel test robot <lkp@intel.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [axboe-block:io_uring-rsrc 6/6] io_uring/rsrc.c:1086:22: warning:
 variable 'offset' set but not used
Message-ID: <202410301242.hwd3CISE-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.git io_uring-rsrc
head:   8b0d733b6f3b938e1fef6b8abc3bc9dcefb73551
commit: 8b0d733b6f3b938e1fef6b8abc3bc9dcefb73551 [6/6] io_uring/rsrc: add request -> io_rsrc_node mapper
config: x86_64-rhel-8.3 (https://download.01.org/0day-ci/archive/20241030/202410301242.hwd3CISE-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241030/202410301242.hwd3CISE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410301242.hwd3CISE-lkp@intel.com/

All warnings (new ones prefixed by >>):

   io_uring/rsrc.c: In function 'io_rsrc_map_request':
>> io_uring/rsrc.c:1086:22: warning: variable 'offset' set but not used [-Wunused-but-set-variable]
    1086 |         unsigned int offset;
         |                      ^~~~~~


vim +/offset +1086 io_uring/rsrc.c

  1078	
  1079	struct io_rsrc_node *io_rsrc_map_request(struct io_ring_ctx *ctx,
  1080						 struct request *req,
  1081						 void (*kbuf_fn)(struct io_rsrc_node *))
  1082	{
  1083		struct io_mapped_ubuf *imu = NULL;
  1084		struct io_rsrc_node *node = NULL;
  1085		struct req_iterator rq_iter;
> 1086		unsigned int offset;
  1087		struct bio_vec bv;
  1088		int nr_bvecs;
  1089	
  1090		if (!bio_has_data(req->bio))
  1091			goto out;
  1092	
  1093		nr_bvecs = 0;
  1094		rq_for_each_bvec(bv, req, rq_iter)
  1095			nr_bvecs++;
  1096		if (!nr_bvecs)
  1097			goto out;
  1098	
  1099		node = io_rsrc_node_alloc(ctx, IORING_RSRC_KBUFFER);
  1100		if (!node)
  1101			goto out;
  1102		node->buf = NULL;
  1103	
  1104		imu = kvmalloc(struct_size(imu, bvec, nr_bvecs), GFP_NOIO);
  1105		if (!imu)
  1106			goto out;
  1107	
  1108		imu->ubuf = 0;
  1109		imu->len = 0;
  1110		if (req->bio != req->biotail) {
  1111			int idx = 0;
  1112	
  1113			offset = 0;
  1114			rq_for_each_bvec(bv, req, rq_iter) {
  1115				imu->bvec[idx++] = bv;
  1116				imu->len += bv.bv_len;
  1117			}
  1118		} else {
  1119			struct bio *bio = req->bio;
  1120	
  1121			offset = bio->bi_iter.bi_bvec_done;
  1122			imu->bvec[0] = *__bvec_iter_bvec(bio->bi_io_vec, bio->bi_iter);
  1123			imu->len = imu->bvec[0].bv_len;
  1124		}
  1125		imu->nr_bvecs = nr_bvecs;
  1126		imu->folio_shift = PAGE_SHIFT;
  1127		refcount_set(&imu->refs, 1);
  1128		node->buf = imu;
  1129		node->kbuf_fn = kbuf_fn;
  1130		return node;
  1131	out:
  1132		if (node)
  1133			io_put_rsrc_node(node);
  1134		kfree(imu);
  1135		return NULL;
  1136	}
  1137	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
