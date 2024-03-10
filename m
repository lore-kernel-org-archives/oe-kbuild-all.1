Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 243811EA71
	for <oe-kbuild-all@lists.linux.dev>; Sun, 10 Mar 2024 10:16:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710065771; cv=none; b=c+fJH++BDI0uvzXAt4y3daAWf2Xd0mQhRW2qS1UjbKE4cvAMugBweglh1cLX7eMsgPeqdDQWTOi6xgsw/xkufoJKYFNKPiHiDNE9KFbx2Xdc+jNPOd8RYZnQJkG9StfAW189EnXcGXa9TvNn8dVc+nY3UAttMR4yTr7dglG5i9M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710065771; c=relaxed/simple;
	bh=rlar0yn0d7Q8Mzek495WwIXR/p+iGlZCSd3KQ9XFuX8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=rbozM/dNSKkemUVpRI0IhBj30S0kk/EFellmosKdUqQeURH/4QHixo+11MbudG4VJ3JRZgreEwqYdf/5uk4hccu+dUa2AJ5gjsW/6AQlECakM6tIoQpVyE1blFRJixmtCS4xiCPttI0E99UAgOKlZJ6LdQE0/TwBUYufQuDR2Ho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gGs2xgwA; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gGs2xgwA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1710065769; x=1741601769;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=rlar0yn0d7Q8Mzek495WwIXR/p+iGlZCSd3KQ9XFuX8=;
  b=gGs2xgwAG8HrlFn8SnDLHs0frH76O2IqpeveEX9K2D68Ra+0m3bOQv6F
   5UcJROG3Q//P3HGiflYsOubh+h3tSvFxK71OEipEodgz5LNMGVUVMQLiU
   oE0culSEC3JWZcr6kDgJhBgxxsGfSID8Rew+bGsYkvKZjrRFNd9fs5oRs
   lq48s8TAEvl4z5kouaC522cf4ZBFZSL4TYhZ53m+qK3/c8s8ZXqT7hxaU
   FTXL56aCgHfykvEZzlNgDUAqH5MNpbY8L9XwyUXco9KwhfLtAWRPHSgee
   NXrsu8DFLIu3muAOEelMuxZ2YUZqnkKvcg9iQXsDL/42CD6oO1EQrHRPi
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11008"; a="7691782"
X-IronPort-AV: E=Sophos;i="6.07,114,1708416000"; 
   d="scan'208";a="7691782"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Mar 2024 03:16:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,114,1708416000"; 
   d="scan'208";a="10982191"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 10 Mar 2024 03:16:05 -0700
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rjGDq-0008AN-2x;
	Sun, 10 Mar 2024 10:16:02 +0000
Date: Sun, 10 Mar 2024 18:16:00 +0800
From: kernel test robot <lkp@intel.com>
To: jasperwang@tencent.com, kaixuxia@tencent.com, frankjpliu@tencent.com,
	kasong@tencent.com, sagazchen@tencent.com, kernelxing@tencent.com,
	aurelianliu@tencent.com, jason.zeng@intel.com, wu.zheng@intel.com,
	yingbao.jia@intel.com, pei.p.jia@intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [opencloudos:linux-5.4/next 26624/27434]
 net/core/netclassid_cgroup.c:334:17: warning: 'strncpy' specified bound
 depends on the length of the source argument
Message-ID: <202403101818.RKGLUrjr-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/OpenCloudOS/OpenCloudOS-Kernel.git linux-5.4/next
head:   0e88d1c26496999d1b2e37f3393b602d28b03faf
commit: 39d03f23067d27d8eac741994056e9d9fe5643e1 [26624/27434] rue/net: init netcls traffic controller
config: arm64-randconfig-r052-20240308 (https://download.01.org/0day-ci/archive/20240310/202403101818.RKGLUrjr-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240310/202403101818.RKGLUrjr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403101818.RKGLUrjr-lkp@intel.com/

All warnings (new ones prefixed by >>):

   net/core/netclassid_cgroup.c:100:5: warning: no previous prototype for 'cls_cgroup_stats_init' [-Wmissing-prototypes]
     100 | int cls_cgroup_stats_init(struct cls_cgroup_stats *stats)
         |     ^~~~~~~~~~~~~~~~~~~~~
   net/core/netclassid_cgroup.c:129:6: warning: no previous prototype for 'cls_cgroup_stats_destroy' [-Wmissing-prototypes]
     129 | void cls_cgroup_stats_destroy(struct cls_cgroup_stats *stats)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~
   net/core/netclassid_cgroup.c:260:5: warning: no previous prototype for 'net_cgroup_notify_prio_change' [-Wmissing-prototypes]
     260 | int net_cgroup_notify_prio_change(struct cgroup_subsys_state *css,
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/core/netclassid_cgroup.c: In function 'write_dev_bps_config':
   net/core/netclassid_cgroup.c:327:26: warning: comparison of unsigned expression in '< 0' is always false [-Wtype-limits]
     327 |                 if (v[0] < 0 || v[0] > v[1] || v[2] < 0 || v[2] > v[3])
         |                          ^
   net/core/netclassid_cgroup.c:327:53: warning: comparison of unsigned expression in '< 0' is always false [-Wtype-limits]
     327 |                 if (v[0] < 0 || v[0] > v[1] || v[2] < 0 || v[2] > v[3])
         |                                                     ^
   net/core/netclassid_cgroup.c: At top level:
   net/core/netclassid_cgroup.c:412:5: warning: no previous prototype for 'read_class_stat' [-Wmissing-prototypes]
     412 | int read_class_stat(struct seq_file *sf, void *v)
         |     ^~~~~~~~~~~~~~~
   net/core/netclassid_cgroup.c:424:5: warning: no previous prototype for 'rx_dump' [-Wmissing-prototypes]
     424 | int rx_dump(struct seq_file *sf, void *v)
         |     ^~~~~~~
   net/core/netclassid_cgroup.c:431:5: warning: no previous prototype for 'tx_dump' [-Wmissing-prototypes]
     431 | int tx_dump(struct seq_file *sf, void *v)
         |     ^~~~~~~
   net/core/netclassid_cgroup.c: In function 'write_dev_bps_config':
>> net/core/netclassid_cgroup.c:334:17: warning: 'strncpy' specified bound depends on the length of the source argument [-Wstringop-truncation]
     334 |                 strncpy(bw_config[dev->ifindex].name, dev->name,
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     335 |                         strlen(dev->name));
         |                         ~~~~~~~~~~~~~~~~~~
   net/core/netclassid_cgroup.c:334:17: note: length computed here
     334 |                 strncpy(bw_config[dev->ifindex].name, dev->name,
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     335 |                         strlen(dev->name));
         |                         ~~~~~~~~~~~~~~~~~~


vim +/strncpy +334 net/core/netclassid_cgroup.c

   267	
   268	static ssize_t write_dev_bps_config(struct kernfs_open_file *of,
   269					    char *buf, size_t nbytes, loff_t off)
   270	{
   271		struct net_device *dev;
   272		struct net *net = current->nsproxy->net_ns;
   273		char tok[27] = {0};
   274		unsigned long v[4] = {0};
   275		int len;
   276		int ret = -EINVAL;
   277	
   278		if (sscanf(buf, "%16s%n", tok, &len) != 1)
   279			return ret;
   280		buf += len;
   281	
   282		dev = dev_get_by_name(net, tok);
   283		if (!dev) {
   284			pr_err("Netdev name %s not found!\n", tok);
   285			return -ENODEV;
   286		}
   287	
   288		if (dev->ifindex >= MAX_NIC_SUPPORT) {
   289			pr_err("Netdev %s index(%d) too large!\n", tok, dev->ifindex);
   290			goto out_finish;
   291		}
   292	
   293		while (true) {
   294			char *p;
   295			unsigned long val = 0;
   296	
   297			if (sscanf(buf, "%26s%n", tok, &len) != 1)
   298				break;
   299			if (tok[0] == '\0')
   300				break;
   301			buf += len;
   302	
   303			p = tok;
   304			strsep(&p, "=");
   305			if (!p || kstrtoul(p, 10, &val) || !val)
   306				goto out_finish;
   307	
   308			if (!strcmp(tok, "disable") && val == 1) {
   309				kfree(bw_config[dev->ifindex].name);
   310				bw_config[dev->ifindex].name = NULL;
   311				ret = nbytes;
   312				goto out_finish;
   313			} else if (!strcmp(tok, "rx_bps_min")) {
   314				v[0] = val;
   315			} else if (!strcmp(tok, "rx_bps_max")) {
   316				v[1] = val;
   317			} else if (!strcmp(tok, "tx_bps_min")) {
   318				v[2] = val;
   319			} else if (!strcmp(tok, "tx_bps_max")) {
   320				v[3] = val;
   321			} else {
   322				goto out_finish;
   323			}
   324		}
   325	
   326		if (v[0] && v[1] && v[2] && v[3]) {
   327			if (v[0] < 0 || v[0] > v[1] || v[2] < 0 || v[2] > v[3])
   328				goto out_finish;
   329			/* release old config info */
   330			kfree(bw_config[dev->ifindex].name);
   331	
   332			len = strlen(dev->name) + 1;
   333			bw_config[dev->ifindex].name = kzalloc(len, GFP_KERNEL);
 > 334			strncpy(bw_config[dev->ifindex].name, dev->name,
   335				strlen(dev->name));
   336	
   337			bw_config[dev->ifindex].rx_bps_min = v[0];
   338			bw_config[dev->ifindex].rx_bps_max = v[1];
   339			bw_config[dev->ifindex].tx_bps_min = v[2];
   340			bw_config[dev->ifindex].tx_bps_max = v[3];
   341	
   342			if (READ_ONCE(netcls_modfunc.write_rx_bps_minmax) &&
   343			    READ_ONCE(netcls_modfunc.write_tx_bps_minmax)) {
   344				netcls_modfunc.write_rx_bps_minmax(dev->ifindex,
   345							v[0], v[1]);
   346				netcls_modfunc.write_tx_bps_minmax(dev->ifindex,
   347							v[2], v[3]);
   348			}
   349			ret = nbytes;
   350		}
   351	
   352	out_finish:
   353		dev_put(dev);
   354		return ret;
   355	}
   356	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
