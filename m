Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.10
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794042950;
	b=tTv9oWOirU7rE2DJJ689Dt2xFz/UVOXSM5MMdr570aE2b1FHrpz+GLpDG5NcBLOJBsC6
	 4DejB008ZNgmBgSHGqOYOIdPIbWYcg8rSSHIRrgi5I8HUT8/xpDxbezSMlRsuID5stPzA
	 6yX/hzFh+brHJzgLLZPdmPIOiFikIgbRHhocogyR68FpdVDB81RppMTrt3I3RIrn4BW3E
	 tp616S5nL5K+0c6T3dNcqmfYhosolJhNTJNot9KxuwBohDi/MqpL4rJFi6KLJLlZJGzDu
	 NSPgP6b44365qjUTibRYbL7KjnriSb6yQfmUMX2NqTDtZ+97F7fJ37hb44hRKdduGiw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794042950;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=g+1qN6+n5Sw/zgIf9LJpGly7i360R5pGSxBJ2Gk0rqE=;
	b=Wl1UMmEdcKfTHiqbJ5MYG4Sq88zOMGM1OzyjA6RpojMXHGSQjtUBAqoY3CtJKM+wcp6i
	 0DYQOd0bPqZqqeSfhxu5x49hhajoJsnrZBnR2/fm91gvuSK1gmqJQdMs3MqjT7dOWQBJN
	 49QIELShCHwnOASDt+DKblIdVUOfFlG4M21Ky1p0gMCUEA8KCGAQVH7Ig/30O3El9A9Wq
	 3E+dQSN3coTD57aMUXR7r7KBEJF+bsVVKCqke+1XUaLzVSQ+RVwKUGJxV9o+4EfNoR6S5
	 01bkyP2Zg4j8iy++tOw/qRZljHUzWY29mg+SYuKZQWNAAYBq9/49Hm/sHL/otz1iwmw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=EQvWotrO;
	arc=none smtp.remote-ip=198.175.65.10
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31225606A326
	for <oe-kbuild-all@lists.linux.dev>; Sat,  7 Nov 2026 09:15:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 31225606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=EQvWotrO
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794042950; x=1825578950;
  h=date:from:to:cc:subject:message-id;
  bh=y3MSHg/VOLdYgPEVrHBIzamN3QNgrOsqj82pl/drgZI=;
  b=EQvWotrOgeXCpCu8Ao44OFOrarXPV6qB8vYgCLd5CMQjAl795tpTJsiA
   Y/tuZ9jbAsY2v5IsDPfI7Scr3SO6RJS6sdNEbjvqpszvbMeBRUDuKogU4
   u4cp47el3XtBzDSh9be/9PlEFukMyEhg9rDUd9MNTwSlrsq1qYj5ziTrK
   o16dc2sM6fsNPtzp4x7K9pu2rgQcnbUUTDvTtOb7+IDWQ+oCT2qA77iPm
   4uI0AhR42Gri/zx70Yuj3bvpQsKdZnXRoqIgi+iM9LQLeNBAVD+/99PUS
   5Gqguk3tSPs6CrEH7DGaUsU7usdKuNxickEcT9aZhWnq/r/JXiw7lke3j
   w==;
X-CSE-ConnectionGUID: Z6wcYZj2SfijnRpn0amlgA==
X-CSE-MsgGUID: 2yt7saKhQYa8/rIY7qAiqg==
X-IronPort-AV: E=McAfee;i="6800,10657,11958"; a="2749276"
X-IronPort-AV: E=Sophos;i="6.27,200,1787036400"; 
   d="scan'208";a="2749276"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Nov 2026 01:15:49 -0800
X-CSE-ConnectionGUID: t586UtoRRK+jri6fCM42sA==
X-CSE-MsgGUID: M/EbxyzHTV+jvEs/NqiT/Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,200,1787036400"; 
   d="scan'208";a="7814136"
Received: from igk-lkp-server01.igk.intel.com (HELO 58ca8a381a5c) ([10.211.93.152])
  by fmviesa009.fm.intel.com with ESMTP; 07 Nov 2026 01:15:47 -0800
Received: from kbuild by 58ca8a381a5c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xPcWU-00000000AcZ-2DNQ;
	Sat, 07 Nov 2026 09:15:42 +0000
Date: Sat, 07 Nov 2026 10:15:36 +0100
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12 20/20]
 drivers/android/wrapfd.c:2077:33: warning: cast to pointer from integer of
 different size
Message-ID: <202611071053.Pkp9bjCP-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

tree:   https://android.googlesource.com/kernel/common android16-6.12
head:   3962e99d7c7335f02f63527384d5ae487da648d1
commit: db3f3b27b0f1e3768035cf280295fba6a5653568 [20/20] ANDROID: wrapfd: polling support
config: i386-randconfig-r2308-20261107 (https://download.01.org/0day-ci/archive/20261107/202611071053.Pkp9bjCP-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
sparse: v0.6.5-rc1-21-g84ec0658
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261107/202611071053.Pkp9bjCP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611071053.Pkp9bjCP-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/android/wrapfd.c: In function 'process_monitors':
>> drivers/android/wrapfd.c:2077:33: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
    2077 |         if (copy_from_user(arr, (void __user *)monitors->arr,
         |                                 ^
   drivers/android/wrapfd.c:2161:26: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
    2161 |         if (copy_to_user((void __user *)monitors->results, results,
         |                          ^
   drivers/android/wrapfd.c: In function 'wrapfd_dev_query_events':
   drivers/android/wrapfd.c:2241:26: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
    2241 |         if (copy_to_user((void __user *)events.arr, arr,
         |                          ^


vim +2077 drivers/android/wrapfd.c

  2055	
  2056	static long process_monitors(struct file_monitor *file_mon,
  2057				     struct wrapfd_monitors *monitors, bool add)
  2058	{
  2059		struct wrap_event_info *tmp = NULL;
  2060		struct wrapfd_monitor *arr;
  2061		__u64 *results;
  2062		long ret = 0;
  2063	
  2064		if (!monitors->len || monitors->len > WRAPFD_MAX_NR_MONITORS)
  2065			return -EINVAL;
  2066	
  2067		arr = kzalloc_objs(struct wrapfd_monitor, monitors->len);
  2068		if (!arr)
  2069			return -ENOMEM;
  2070	
  2071		results = kzalloc_objs(__u64, monitors->len);
  2072		if (!results) {
  2073			ret = -ENOMEM;
  2074			goto free_arr;
  2075		}
  2076	
> 2077		if (copy_from_user(arr, (void __user *)monitors->arr,
  2078				   monitors->len * sizeof(struct wrapfd_monitor))) {
  2079			ret = -EFAULT;
  2080			goto free_res;
  2081		}
  2082	
  2083		/* Verify all inputs */
  2084		for (__u64 i = 0; i < monitors->len; i++) {
  2085			struct wrapfd_monitor *monitor = &arr[i];
  2086			struct wrap_event_info *event_info;
  2087			struct wrap_ctx *ctx;
  2088			struct file *file;
  2089			struct fd f;
  2090	
  2091			if (monitor->events & ~WRAPFD_EVENTS_MASK ||
  2092			    (monitor->events & WRAPFD_EVENTS_MASK) == 0) {
  2093				results[i] = -EINVAL;
  2094				continue;
  2095			}
  2096	
  2097			if (monitor->fd > INT_MAX) {
  2098				results[i] = -EBADF;
  2099				continue;
  2100			}
  2101	
  2102			f = fdget(monitor->fd);
  2103			file = fd_file(f);
  2104			if (!file || file->f_op != &wrap_fops) {
  2105				fdput(f);
  2106				results[i] = -EBADF;
  2107				continue;
  2108			}
  2109	
  2110			ctx = file->private_data;
  2111			if (add && !tmp) {
  2112				/*
  2113				 * Preallocate wrap_event_info before locking in case
  2114				 * we need it later.
  2115				 */
  2116				tmp = kzalloc_obj(*tmp);
  2117			}
  2118	
  2119			spin_lock(&ctx->lock);
  2120			spin_lock(&file_mon->event_lock);
  2121			event_info = find_wrap_event_info(file_mon, ctx);
  2122			if (event_info) {
  2123				/*
  2124				 * Do not allow monitoring the same wrapfd file
  2125				 * under different (dup'ed) FDs since that
  2126				 * would cause one wrapfd operation to generate
  2127				 * multiple events.
  2128				 */
  2129				if (monitor->fd != event_info->fd) {
  2130					results[i] = -EBUSY;
  2131					goto unlock;
  2132				}
  2133			}
  2134			if (add) {
  2135				if (!event_info) {
  2136					if (!tmp) {
  2137						results[i] = -ENOMEM;
  2138						goto unlock;
  2139					}
  2140					event_info = tmp;
  2141					tmp = NULL;
  2142					init_wrap_event_info(event_info, file_mon,
  2143							     ctx, monitor->fd);
  2144				}
  2145				event_info->monitored |= monitor->events;
  2146			} else {
  2147				if (event_info) {
  2148					event_info->monitored &= ~monitor->events;
  2149					if (!event_info->monitored)
  2150						free_wrap_event_info(event_info);
  2151				} else {
  2152					results[i] = -EINVAL;
  2153				}
  2154			}
  2155	unlock:
  2156			spin_unlock(&file_mon->event_lock);
  2157			spin_unlock(&ctx->lock);
  2158			fdput(f);
  2159		}
  2160		kfree(tmp);
  2161		if (copy_to_user((void __user *)monitors->results, results,
  2162				 monitors->len * sizeof(__u64)))
  2163			ret = -EFAULT;
  2164	free_res:
  2165		kfree(results);
  2166	free_arr:
  2167		kfree(arr);
  2168	
  2169		return ret;
  2170	}
  2171	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
