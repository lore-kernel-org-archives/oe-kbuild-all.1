Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 393951EB5E
	for <oe-kbuild-all@lists.linux.dev>; Fri, 24 Nov 2023 11:48:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ikHvDHWr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700826534; x=1732362534;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=uqId6zMuMhvDHmlmV42WGubXhezRvBD0oz7twIBi+O4=;
  b=ikHvDHWreiIvI0qsFKWyW9PJI5dvq13tHX1bO2CgB4pLm/cA5tjE/rUA
   3ZO0G7q42wMlRTDm6byV/ZtHY1ewhQEd9rfpEbznXRfFURvjpQGdmn4Wx
   YAvlIzBpIzKIKudfhNkWob8d1MHdVu2dyKVgc5dEtuHhK68U9lbUT8y4W
   A9QxycEBp0cnhXTenHX3nzT2m9ujK76Cc8KlPipe6ue3brXmgBzSkEmh4
   QFs/BpxCrMsHv3PSbA3SY7gUIo0hSi1GaEGf7SfFqv8GL/gXXCqUVTIDY
   YVbgQaCBxztx843fysRkwIyg51LTE4l1P8P3I/koEOTiR8jf3cC3gx9my
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10902"; a="377449248"
X-IronPort-AV: E=Sophos;i="6.04,223,1695711600"; 
   d="scan'208";a="377449248"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Nov 2023 03:48:52 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10902"; a="1014884525"
X-IronPort-AV: E=Sophos;i="6.04,223,1695711600"; 
   d="scan'208";a="1014884525"
Received: from lkp-server01.sh.intel.com (HELO d584ee6ebdcc) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 24 Nov 2023 03:48:51 -0800
Received: from kbuild by d584ee6ebdcc with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r6Ufx-0002iM-2A;
	Fri, 24 Nov 2023 11:48:49 +0000
Date: Fri, 24 Nov 2023 19:48:12 +0800
From: kernel test robot <lkp@intel.com>
To: Bart Van Assche <bvanassche@acm.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [bvanassche:data-lifetime 7/17] fs/gfs2/lops.c:495:5: error: 'struct
 bio' has no member named 'bi_write_hint'
Message-ID: <202311241432.1CWDQj4x-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/bvanassche/linux data-lifetime
head:   55dd5212f449b924a239d1a7325e8e7457436407
commit: 5a0ebc01d9b1685c71b05843293accca6ec3128f [7/17] block: Restore the per-bio/request data lifetime fields
config: x86_64-buildonly-randconfig-003-20231123 (https://download.01.org/0day-ci/archive/20231124/202311241432.1CWDQj4x-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231124/202311241432.1CWDQj4x-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311241432.1CWDQj4x-lkp@intel.com/

All errors (new ones prefixed by >>):

   fs/gfs2/lops.c: In function 'gfs2_chain_bio':
>> fs/gfs2/lops.c:495:5: error: 'struct bio' has no member named 'bi_write_hint'
     new->bi_write_hint = prev->bi_write_hint;
        ^~
   fs/gfs2/lops.c:495:27: error: 'struct bio' has no member named 'bi_write_hint'
     new->bi_write_hint = prev->bi_write_hint;
                              ^~


vim +495 fs/gfs2/lops.c

   487	
   488	static struct bio *gfs2_chain_bio(struct bio *prev, unsigned int nr_iovecs)
   489	{
   490		struct bio *new;
   491	
   492		new = bio_alloc(prev->bi_bdev, nr_iovecs, prev->bi_opf, GFP_NOIO);
   493		bio_clone_blkg_association(new, prev);
   494		new->bi_iter.bi_sector = bio_end_sector(prev);
 > 495		new->bi_write_hint = prev->bi_write_hint;
   496		bio_chain(new, prev);
   497		submit_bio(prev);
   498		return new;
   499	}
   500	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
