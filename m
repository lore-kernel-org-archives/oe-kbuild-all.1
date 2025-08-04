Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DC861F30BB
	for <oe-kbuild-all@lists.linux.dev>; Mon,  4 Aug 2025 07:53:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754294034; cv=none; b=F+BBPAHddN5Dpznp6rEzpKMuR/3CcXitAXskGx095mJuKtBk09x7qEzlNj4ezYj+yk7MDRIxQ6b4dwlBOljBNQcLsD3w8CofxH8HoF6XtiDg2kUillTjBWXFdMvE7oG1kJfEtq1rOibWI99jjY4a4JPMexjDYss2Q9IoI+smtbU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754294034; c=relaxed/simple;
	bh=to200H1ni3+gUQjiN26L2HjC9XQ3OXsOVLJdDwMBeS0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=SeDOdEbwDwthbzU0PzH8U14NIyb+JDZb2F0G6reY26+Gt09nJMuj8nq7/0uXJdYt/pItopTMoXxu22caKmyzG713OJlrbaY3m24ZTosqZcCNzP3s5IEkelge9y+Rql6AOnA8rCNvS/tCBXhdf001UAMyVPZ+MbVmx6Hqi91Ni+A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZLrEAd0f; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZLrEAd0f"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754294032; x=1785830032;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=to200H1ni3+gUQjiN26L2HjC9XQ3OXsOVLJdDwMBeS0=;
  b=ZLrEAd0ftK1RQOfsZ+5u25uG3GqS/YqpBNYk9UAl91agSO8jlCTbXnnv
   hey0R+GoNGrh0Jbjs+h+BpUAcNJPi/Z+BgbZHkxOIENEDcIATDPYjEQKh
   o6wZsmiucjEWPn9wsdmoJrLjf/hzdhldjqtqj7W70NnqYCk6nRcu5Xt+/
   MdngJNHAwHFJF+vQ7oxnc8AHwibY8+lXKsTCDUz8Jyo335e+67tZ5ltBD
   c/W3u4nlxCmGdXBVeLYEqCs6gC/FmOJnamVQk5LNY4mpJzqi6coa/4O6d
   2u8HRCdsT/XyEMB0HvMVt2qseJJohjwMQFvFE2DBtz8D1SHKGSzy6/q2o
   g==;
X-CSE-ConnectionGUID: GQwJimB0QNCVvt1vpz3Epw==
X-CSE-MsgGUID: sz8nMLbjQpyUGFdTqm5CRA==
X-IronPort-AV: E=McAfee;i="6800,10657,11511"; a="79101471"
X-IronPort-AV: E=Sophos;i="6.17,258,1747724400"; 
   d="scan'208";a="79101471"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Aug 2025 00:53:51 -0700
X-CSE-ConnectionGUID: ZAw+7bJwS0WZ7YMdef/YBQ==
X-CSE-MsgGUID: kqP75HSJSj67kljFOMujyQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,258,1747724400"; 
   d="scan'208";a="195024994"
Received: from igk-lkp-server01.igk.intel.com (HELO b3b7d4258b7c) ([10.91.175.65])
  by orviesa002.jf.intel.com with ESMTP; 04 Aug 2025 00:53:51 -0700
Received: from kbuild by b3b7d4258b7c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uiq0y-0001kN-29;
	Mon, 04 Aug 2025 07:53:48 +0000
Date: Mon, 4 Aug 2025 09:53:47 +0200
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Baokun Li <libaokun1@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 3094/3094] fs/cachefiles/ondemand.c:23:25:
 warning: implicit conversion from 'enum cachefiles_obj_ref_trace' to 'enum
 fscache_obj_ref_trace'
Message-ID: <202508040931.hrn1mWAF-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   6d337ce6e80ff095f25a2ccd842ebcf349fa4bfa
commit: 2937cd5f8c58bd8e7895f6b2698057721442248e [3094/3094] cachefiles: notify the user daemon when looking up cookie
config: x86_64-buildonly-randconfig-2003-20250804 (https://download.01.org/0day-ci/archive/20250804/202508040931.hrn1mWAF-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14+deb12u1) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250804/202508040931.hrn1mWAF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508040931.hrn1mWAF-lkp@intel.com/

All warnings (new ones prefixed by >>):

   fs/cachefiles/ondemand.c: In function 'cachefiles_ondemand_fd_release':
>> fs/cachefiles/ondemand.c:23:25: warning: implicit conversion from 'enum cachefiles_obj_ref_trace' to 'enum fscache_obj_ref_trace' [-Wenum-conversion]
      23 |                         cachefiles_obj_put_ondemand_fd);
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/cachefiles/ondemand.c: In function 'cachefiles_ondemand_get_fd':
   fs/cachefiles/ondemand.c:145:25: warning: implicit conversion from 'enum cachefiles_obj_ref_trace' to 'enum fscache_obj_ref_trace' [-Wenum-conversion]
     145 |                         cachefiles_obj_get_ondemand_fd) ? 0 : -EAGAIN;
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/cachefiles/ondemand.c:191:25: warning: implicit conversion from 'enum cachefiles_obj_ref_trace' to 'enum fscache_obj_ref_trace' [-Wenum-conversion]
     191 |                         cachefiles_obj_put_ondemand_fd);
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +23 fs/cachefiles/ondemand.c

     7	
     8	static int cachefiles_ondemand_fd_release(struct inode *inode,
     9						  struct file *file)
    10	{
    11		struct cachefiles_object *object = file->private_data;
    12		int object_id = object->ondemand_id;
    13		struct cachefiles_cache *cache;
    14	
    15		cache = container_of(object->fscache.cache,
    16				     struct cachefiles_cache, cache);
    17	
    18		object->ondemand_id = CACHEFILES_ONDEMAND_ID_CLOSED;
    19		xa_lock(&cache->ondemand_ids.idr_rt);
    20		idr_remove(&cache->ondemand_ids, object_id);
    21		xa_unlock(&cache->ondemand_ids.idr_rt);
    22		object->fscache.cache->ops->put_object(&object->fscache,
  > 23				cachefiles_obj_put_ondemand_fd);
    24		return 0;
    25	}
    26	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
