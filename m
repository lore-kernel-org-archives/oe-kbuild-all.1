Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D79228AAFD
	for <oe-kbuild-all@lists.linux.dev>; Wed,  7 May 2025 15:37:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746632234; cv=none; b=IerCjRQqboLbcrN+gir1h8hi9X0V4ihWXx5L3RtvroDQlwk9kZTo9ZODXm6j43X5k13wUoV/ndWxwDsdH3uxr8HWDR815K9ZOvNsiByy1V4Q2H6N2HJ3vGHxcUDcDb1qksS4ge8IRfixJnFuULpsBaLuxmBAxFz1mvQi0vcNWZI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746632234; c=relaxed/simple;
	bh=nmWeR6nB6UTMWygh4MqhYWaG7Kx6uzivElRD2BLIAz4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=hlceejuptJ1Yx1izwkniAGL7feXq+PMYC7GmJubGAzK0CXeplKncMAPfmLUaw7fsona/et3FxtJ2xqrkPPh94bcG8yncQjl2g1tgjh23ZL0rYNC/oqR4EflCg2+jPW8CL5kp6MuwNATcvsLvFRMLHYlyspuWZbzRoS8AZ9m2M0g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ejl9z8v0; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ejl9z8v0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746632233; x=1778168233;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=nmWeR6nB6UTMWygh4MqhYWaG7Kx6uzivElRD2BLIAz4=;
  b=ejl9z8v0YRwbzoowkwfyRCV4ATcrMkzd1+Pbs+sYUVvLlGjE2WV1i7z5
   Vw8IRAonlKatjv98n2Y/4W/PxSoGzC3U1IaREcV9G/oWgxS6rWctgOiRM
   sA53NfP0ovwOxmiTE2deYoMQhqUk3elWTMWzqp3OX0z5UmMAhDRnO5RQO
   eQbLzCNoLiu4mOSOGBY8hS5gX7JVZaRCnS9TeLJS8avsfKmgSQ8MCqjmX
   iIkdrPcK0NPilm8/S3GkrnfaO3E2cWJJ0Tawpu9UMv9JPTdHWmnDQTkbY
   Rf31BekZORth0pt7foVbBHBp9MUOFsIfvcMOXkQTaEqFg/LVU/T9aysEI
   g==;
X-CSE-ConnectionGUID: k8Ss0zWgSZaBUIIVz0b7ug==
X-CSE-MsgGUID: AeNq9mBJQ3yWSaNrCtbLJA==
X-IronPort-AV: E=McAfee;i="6700,10204,11426"; a="48510172"
X-IronPort-AV: E=Sophos;i="6.15,269,1739865600"; 
   d="scan'208";a="48510172"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2025 08:37:05 -0700
X-CSE-ConnectionGUID: EuiDGuNkS8+5ltVYUGdkpQ==
X-CSE-MsgGUID: NmpyA1sIQdypZKUan6zINA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,269,1739865600"; 
   d="scan'208";a="173182595"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 07 May 2025 08:37:04 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uCgpS-00085t-1U;
	Wed, 07 May 2025 15:37:02 +0000
Date: Wed, 7 May 2025 23:36:26 +0800
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [linux-next:master 4136/5419] fs/bcachefs/super.c:2145:52: sparse:
 sparse: invalid assignment: &=
Message-ID: <202505072348.ayv0VtF7-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   08710e696081d58163c8078e0e096be6d35c5fad
commit: 4ca0496d63c1fe9420aa4d54f6f62e71e535ab2d [4136/5419] bcachefs: BCH_MEMBER_RESIZE_ON_MOUNT
config: microblaze-randconfig-r111-20250417 (https://download.01.org/0day-ci/archive/20250507/202505072348.ayv0VtF7-lkp@intel.com/config)
compiler: microblaze-linux-gcc (GCC) 10.5.0
reproduce: (https://download.01.org/0day-ci/archive/20250507/202505072348.ayv0VtF7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505072348.ayv0VtF7-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   fs/bcachefs/super.c: note: in included file:
   fs/bcachefs/bcachefs.h:1015:9: sparse: sparse: array of flexible structures
>> fs/bcachefs/super.c:2145:52: sparse: sparse: invalid assignment: &=
   fs/bcachefs/super.c:2145:52: sparse:    left side has type restricted __le64
   fs/bcachefs/super.c:2145:52: sparse:    right side has type unsigned long long
   fs/bcachefs/super.c:2192:9: sparse: sparse: context imbalance in 'bdev_get_fs' - wrong count at exit
   fs/bcachefs/super.c:2204:13: sparse: sparse: context imbalance in 'bch2_fs_bdev_mark_dead' - unexpected unlock
   fs/bcachefs/super.c:2247:13: sparse: sparse: context imbalance in 'bch2_fs_bdev_sync' - unexpected unlock

vim +2145 fs/bcachefs/super.c

  2118	
  2119	int bch2_fs_resize_on_mount(struct bch_fs *c)
  2120	{
  2121		down_write(&c->state_lock);
  2122	
  2123		for_each_online_member(c, ca) {
  2124			u64 old_nbuckets = ca->mi.nbuckets;
  2125			u64 new_nbuckets = div64_u64(get_capacity(ca->disk_sb.bdev->bd_disk),
  2126						 ca->mi.bucket_size);
  2127	
  2128			if (ca->mi.resize_on_mount &&
  2129			    new_nbuckets > ca->mi.nbuckets) {
  2130				bch_info(ca, "resizing to size %llu", new_nbuckets * ca->mi.bucket_size);
  2131				int ret = bch2_dev_buckets_resize(c, ca, new_nbuckets);
  2132				bch_err_fn(ca, ret);
  2133				if (ret) {
  2134					percpu_ref_put(&ca->io_ref[READ]);
  2135					up_write(&c->state_lock);
  2136					return ret;
  2137				}
  2138	
  2139				mutex_lock(&c->sb_lock);
  2140				struct bch_member *m =
  2141					bch2_members_v2_get_mut(c->disk_sb.sb, ca->dev_idx);
  2142				m->nbuckets = cpu_to_le64(new_nbuckets);
  2143				SET_BCH_MEMBER_RESIZE_ON_MOUNT(m, false);
  2144	
> 2145				c->disk_sb.sb->features[0] &= ~BIT_ULL(BCH_FEATURE_small_image);
  2146				bch2_write_super(c);
  2147				mutex_unlock(&c->sb_lock);
  2148	
  2149				if (ca->mi.freespace_initialized) {
  2150					ret = __bch2_dev_resize_alloc(ca, old_nbuckets, new_nbuckets);
  2151					if (ret) {
  2152						percpu_ref_put(&ca->io_ref[READ]);
  2153						up_write(&c->state_lock);
  2154						return ret;
  2155					}
  2156				}
  2157			}
  2158		}
  2159	
  2160		bch2_recalc_capacity(c);
  2161		up_write(&c->state_lock);
  2162		return 0;
  2163	}
  2164	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
