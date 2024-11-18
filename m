Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB3F61AF0A3
	for <oe-kbuild-all@lists.linux.dev>; Mon, 18 Nov 2024 15:08:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731942531; cv=none; b=oIfwZ78IZHc5LP/faoFpv5iv+Nn4HJbph8bVGpOBGlA8YkDgWzGZeB32XmD+79ebBfaZdfX8e10J5PmYLxxFpM9iPmc9KKcyPXl2ZZ/3flhqHE81SoNeAQhDEJH1w5Xp7R8I0Iplarxy1T0Df+vvs1/sa8/5vEyJ7dRA1/s8ZXM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731942531; c=relaxed/simple;
	bh=F2l/OBP1piqJEuXGfyXEAQntD3eYyXsvy8tUnGS0qHQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=gR8zQ1x9fP/+Cs/NL6A3+qVUA3Pq6UVHv2WClRW8zzBZN1X5u/mbJWYNJfcvFlnAkf1QZdkMmluVoLLce5MNNFpjksme08+X32/JIpMZSTpHTQeXP6Z5v8+InnW5Cf2tUt6OAEVCk+TICHw/t/vvkgb7FVuTFvtQHMB9QRbzNq8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VqjZpuQv; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VqjZpuQv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731942530; x=1763478530;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=F2l/OBP1piqJEuXGfyXEAQntD3eYyXsvy8tUnGS0qHQ=;
  b=VqjZpuQvvOTHxwnEX82k/Fpf7AqWWBcQg/AWIteylZtKluuIotNq2vJC
   9fNC0IfyDOHXqJ6GvWVhjhY9DyFTEbyu/ANiukN0BPpYuOPV/qnCPdtKY
   +ppOrQ+oh10FtIv2R+NugnMXLQ1rAiwsuOlJhzmkkhQPh6wh2qgQQWka6
   /qEu0RDpFQn5BO1rzyaG+ki89VjMUSSb6jymCUj6LNxGKDnp36thivsVf
   tQnr/f/lPfgcKNaQAbFUEJLZ+LHk0H/5strJbxw1K7ylJKoooU5fOyadR
   9tyx+8JMUc0j4saCyeGLxXgt4yoYh8x9PxEx+/lVMKQ9CiHBAVEbpqor4
   Q==;
X-CSE-ConnectionGUID: QruQZNqYTYegfxHoPZluLQ==
X-CSE-MsgGUID: NfZQG7H4T4SlDyPmPcDzMQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11260"; a="19513824"
X-IronPort-AV: E=Sophos;i="6.12,164,1728975600"; 
   d="scan'208";a="19513824"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2024 07:08:47 -0800
X-CSE-ConnectionGUID: i561q2QkRdCumgdKxaKr4w==
X-CSE-MsgGUID: jd2nJ0lCTWSI3suXwG25pw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,164,1728975600"; 
   d="scan'208";a="94059470"
Received: from lkp-server01.sh.intel.com (HELO 1e3cc1889ffb) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 18 Nov 2024 07:08:46 -0800
Received: from kbuild by 1e3cc1889ffb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tD3Mp-0002UX-2y;
	Mon, 18 Nov 2024 15:08:43 +0000
Date: Mon, 18 Nov 2024 23:08:25 +0800
From: kernel test robot <lkp@intel.com>
To: Sean Anderson <sean.anderson@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: [linux-next:master 6937/12140]
 drivers/gpu/drm/xlnx/zynqmp_dp.c:2312:46: error: '_preemphasis' directive
 output may be truncated writing 12 bytes into a region of size between 4 and
 14
Message-ID: <202411182231.OwxnsjHa-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Sean,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   ae58226b89ac0cffa05ba7357733776542e40216
commit: 28edaacb821c69241f6c0be6bbd29f7145f1b44f [6937/12140] drm: zynqmp_dp: Add debugfs interface for compliance testing
config: parisc-randconfig-r063-20241117 (https://download.01.org/0day-ci/archive/20241118/202411182231.OwxnsjHa-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241118/202411182231.OwxnsjHa-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411182231.OwxnsjHa-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/gpu/drm/xlnx/zynqmp_dp.c: In function 'zynqmp_dp_bridge_debugfs_init':
>> drivers/gpu/drm/xlnx/zynqmp_dp.c:2312:46: error: '_preemphasis' directive output may be truncated writing 12 bytes into a region of size between 4 and 14 [-Werror=format-truncation=]
    2312 |                 snprintf(name, sizeof(name), fmt, i);
         |                                              ^~~
   drivers/gpu/drm/xlnx/zynqmp_dp.c:2312:17: note: 'snprintf' output between 18 and 28 bytes into a destination of size 19
    2312 |                 snprintf(name, sizeof(name), fmt, i);
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/gpu/drm/xlnx/zynqmp_dp.c:2317:53: error: '_swing' directive output may be truncated writing 6 bytes into a region of size between 4 and 14 [-Werror=format-truncation=]
    2317 |                 snprintf(name, sizeof(name), "lane%d_swing", i);
         |                                                     ^~~~~~
   drivers/gpu/drm/xlnx/zynqmp_dp.c:2317:17: note: 'snprintf' output between 12 and 22 bytes into a destination of size 19
    2317 |                 snprintf(name, sizeof(name), "lane%d_swing", i);
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   cc1: all warnings being treated as errors


vim +/_preemphasis +2312 drivers/gpu/drm/xlnx/zynqmp_dp.c

  2278	
  2279	DEFINE_DEBUGFS_ATTRIBUTE(fops_zynqmp_dp_ignore_hpd, zynqmp_dp_ignore_hpd_get,
  2280				 zynqmp_dp_ignore_hpd_set, "%llu\n");
  2281	
  2282	static void zynqmp_dp_bridge_debugfs_init(struct drm_bridge *bridge,
  2283						  struct dentry *root)
  2284	{
  2285		struct zynqmp_dp *dp = bridge_to_dp(bridge);
  2286		struct dentry *test;
  2287		int i;
  2288	
  2289		dp->test.bw_code = DP_LINK_BW_5_4;
  2290		dp->test.link_cnt = dp->num_lanes;
  2291	
  2292		test = debugfs_create_dir("test", root);
  2293	#define CREATE_FILE(name) \
  2294		debugfs_create_file(#name, 0600, test, dp, &fops_zynqmp_dp_##name)
  2295		CREATE_FILE(pattern);
  2296		CREATE_FILE(enhanced);
  2297		CREATE_FILE(downspread);
  2298		CREATE_FILE(active);
  2299		CREATE_FILE(custom);
  2300		CREATE_FILE(rate);
  2301		CREATE_FILE(lanes);
  2302		CREATE_FILE(ignore_aux_errors);
  2303		CREATE_FILE(ignore_hpd);
  2304	
  2305		for (i = 0; i < dp->num_lanes; i++) {
  2306			static const char fmt[] = "lane%d_preemphasis";
  2307			char name[sizeof(fmt)];
  2308	
  2309			dp->debugfs_train_set[i].dp = dp;
  2310			dp->debugfs_train_set[i].lane = i;
  2311	
> 2312			snprintf(name, sizeof(name), fmt, i);
  2313			debugfs_create_file(name, 0600, test,
  2314					    &dp->debugfs_train_set[i],
  2315					    &fops_zynqmp_dp_preemphasis);
  2316	
> 2317			snprintf(name, sizeof(name), "lane%d_swing", i);
  2318			debugfs_create_file(name, 0600, test,
  2319					    &dp->debugfs_train_set[i],
  2320					    &fops_zynqmp_dp_swing);
  2321		}
  2322	}
  2323	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
