Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 662391C3030
	for <oe-kbuild-all@lists.linux.dev>; Wed, 23 Oct 2024 16:26:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729700813; cv=none; b=orfju0FLUq8HqUuLiJVydQNhiCI1WXGbFFIeOIGnUCYBGcACZokZcF2dFnCGboTX0ENGKs+U7AnZvk+/Snwm39rmBLo0WDUlA7DJEuJHK1YOxAeALjuhbr+4k65lAdLOy2/euitd8udgseAIGN9x1sZ7xyyXatyBUeEW+lmxAvM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729700813; c=relaxed/simple;
	bh=FKrD13tnqCrQ0H4RYycZq8/l98yCfT5O+l3iDlyigCE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=aS4prv+aiZOZrZpWeONt6LtIJDgLHuUhnEeh7dIdxGbUqaiMAimhu8s3N2qtKtkhxzdOH5pD4ZG+EjQtHyJsSmauGnYDpcJDDdOjNneKJvUIJCx8wx7oxIC3DTGLIbnvJWGI0zqMEfBZ2LmFPPF12aRYhGUPtJpdxMH9dQNRwsQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=abThgrod; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="abThgrod"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729700811; x=1761236811;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=FKrD13tnqCrQ0H4RYycZq8/l98yCfT5O+l3iDlyigCE=;
  b=abThgrodd0yORfzl3GUDXeQ+AniYifct4RgL6sggESrRQLELncyqzudV
   mFiOKs0rtOs/srWGFfOXmjQJzxHmvsQNFR6XD37sNGoYTUcpSXAREy6ek
   aReilzEgK1Mn5AzSw5/vlzOkqMyYwRRb98dE3yjq36ex9LJK1cJrASGin
   Rq2bbANuP8pIPn6ep652mjj2bP8h9HXVfM5tQgRCKY+lMxcbyOEuohbOF
   oq0YyqkAMjqgHHiGgP7vivISUbud1hTXa4Rk7A+cn3st4zxbUZJorqmeX
   v5yywQsXM3TXicO3USsIDcSbZCgT4ARnPf6DQOH31y2BU3fMr8LtPYiN5
   w==;
X-CSE-ConnectionGUID: diJUwBw+TDiACnpBD6pkMQ==
X-CSE-MsgGUID: wsooy+C+TreqBt+sfc7foA==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="29081152"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="29081152"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Oct 2024 09:26:51 -0700
X-CSE-ConnectionGUID: FO2mCBqRRoy5OajoJlVgFA==
X-CSE-MsgGUID: K4eeM3RxTVmFz84W5xh1ag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,226,1725346800"; 
   d="scan'208";a="84261200"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 23 Oct 2024 09:26:48 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t3eC5-000V9Y-0V;
	Wed, 23 Oct 2024 16:26:45 +0000
Date: Thu, 24 Oct 2024 00:26:36 +0800
From: kernel test robot <lkp@intel.com>
To: kaixuxia@tencent.com, frankjpliu@tencent.com, kasong@tencent.com,
	sagazchen@tencent.com, kernelxing@tencent.com,
	aurelianliu@tencent.com, deshengwu@tencent.com,
	flyingpeng@tencent.com, jingqunli@tencent.com, jason.zeng@intel.com,
	wu.zheng@intel.com, yingbao.jia@intel.com, pei.p.jia@intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [opencloudos:next 11987/13046] net/core/netclassid_cgroup.c:331:17:
 warning: 'strncpy' specified bound depends on the length of the source
 argument
Message-ID: <202410240035.lSlCcYd8-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Honglin,

FYI, the error/warning still remains.

tree:   https://gitee.com/OpenCloudOS/OpenCloudOS-Kernel.git next
head:   ce9f9d823a41831d622fa11e29c3d620c044f51b
commit: 669bbf19cd74db8ba957c288e9482d9dc10d68e1 [11987/13046] rue/net: init netcls traffic controller
config: x86_64-defconfig (https://download.01.org/0day-ci/archive/20241024/202410240035.lSlCcYd8-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241024/202410240035.lSlCcYd8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410240035.lSlCcYd8-lkp@intel.com/

All warnings (new ones prefixed by >>):

   net/core/netclassid_cgroup.c:100:5: warning: no previous prototype for 'cls_cgroup_stats_init' [-Wmissing-prototypes]
     100 | int cls_cgroup_stats_init(struct cls_cgroup_stats *stats)
         |     ^~~~~~~~~~~~~~~~~~~~~
   net/core/netclassid_cgroup.c:129:6: warning: no previous prototype for 'cls_cgroup_stats_destroy' [-Wmissing-prototypes]
     129 | void cls_cgroup_stats_destroy(struct cls_cgroup_stats *stats)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~
   net/core/netclassid_cgroup.c:257:5: warning: no previous prototype for 'net_cgroup_notify_prio_change' [-Wmissing-prototypes]
     257 | int net_cgroup_notify_prio_change(struct cgroup_subsys_state *css,
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/core/netclassid_cgroup.c:409:5: warning: no previous prototype for 'read_class_stat' [-Wmissing-prototypes]
     409 | int read_class_stat(struct seq_file *sf, void *v)
         |     ^~~~~~~~~~~~~~~
   net/core/netclassid_cgroup.c:421:5: warning: no previous prototype for 'rx_dump' [-Wmissing-prototypes]
     421 | int rx_dump(struct seq_file *sf, void *v)
         |     ^~~~~~~
   net/core/netclassid_cgroup.c:428:5: warning: no previous prototype for 'tx_dump' [-Wmissing-prototypes]
     428 | int tx_dump(struct seq_file *sf, void *v)
         |     ^~~~~~~
   net/core/netclassid_cgroup.c: In function 'write_dev_bps_config':
>> net/core/netclassid_cgroup.c:331:17: warning: 'strncpy' specified bound depends on the length of the source argument [-Wstringop-truncation]
     331 |                 strncpy(bw_config[dev->ifindex].name, dev->name,
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     332 |                         strlen(dev->name));
         |                         ~~~~~~~~~~~~~~~~~~


vim +/strncpy +331 net/core/netclassid_cgroup.c

   264	
   265	static ssize_t write_dev_bps_config(struct kernfs_open_file *of,
   266					    char *buf, size_t nbytes, loff_t off)
   267	{
   268		struct net_device *dev;
   269		struct net *net = current->nsproxy->net_ns;
   270		char tok[27] = {0};
   271		unsigned long v[4] = {0};
   272		int len;
   273		int ret = -EINVAL;
   274	
   275		if (sscanf(buf, "%16s%n", tok, &len) != 1)
   276			return ret;
   277		buf += len;
   278	
   279		dev = dev_get_by_name(net, tok);
   280		if (!dev) {
   281			pr_err("Netdev name %s not found!\n", tok);
   282			return -ENODEV;
   283		}
   284	
   285		if (dev->ifindex >= MAX_NIC_SUPPORT) {
   286			pr_err("Netdev %s index(%d) too large!\n", tok, dev->ifindex);
   287			goto out_finish;
   288		}
   289	
   290		while (true) {
   291			char *p;
   292			unsigned long val = 0;
   293	
   294			if (sscanf(buf, "%26s%n", tok, &len) != 1)
   295				break;
   296			if (tok[0] == '\0')
   297				break;
   298			buf += len;
   299	
   300			p = tok;
   301			strsep(&p, "=");
   302			if (!p || kstrtoul(p, 10, &val) || !val)
   303				goto out_finish;
   304	
   305			if (!strcmp(tok, "disable") && val == 1) {
   306				kfree(bw_config[dev->ifindex].name);
   307				bw_config[dev->ifindex].name = NULL;
   308				ret = nbytes;
   309				goto out_finish;
   310			} else if (!strcmp(tok, "rx_bps_min")) {
   311				v[0] = val;
   312			} else if (!strcmp(tok, "rx_bps_max")) {
   313				v[1] = val;
   314			} else if (!strcmp(tok, "tx_bps_min")) {
   315				v[2] = val;
   316			} else if (!strcmp(tok, "tx_bps_max")) {
   317				v[3] = val;
   318			} else {
   319				goto out_finish;
   320			}
   321		}
   322	
   323		if (v[0] && v[1] && v[2] && v[3]) {
   324			if (v[0] < 0 || v[0] > v[1] || v[2] < 0 || v[2] > v[3])
   325				goto out_finish;
   326			/* release old config info */
   327			kfree(bw_config[dev->ifindex].name);
   328	
   329			len = strlen(dev->name) + 1;
   330			bw_config[dev->ifindex].name = kzalloc(len, GFP_KERNEL);
 > 331			strncpy(bw_config[dev->ifindex].name, dev->name,
   332				strlen(dev->name));
   333	
   334			bw_config[dev->ifindex].rx_bps_min = v[0];
   335			bw_config[dev->ifindex].rx_bps_max = v[1];
   336			bw_config[dev->ifindex].tx_bps_min = v[2];
   337			bw_config[dev->ifindex].tx_bps_max = v[3];
   338	
   339			if (READ_ONCE(netcls_modfunc.write_rx_bps_minmax) &&
   340			    READ_ONCE(netcls_modfunc.write_tx_bps_minmax)) {
   341				netcls_modfunc.write_rx_bps_minmax(dev->ifindex,
   342							v[0], v[1]);
   343				netcls_modfunc.write_tx_bps_minmax(dev->ifindex,
   344							v[2], v[3]);
   345			}
   346			ret = nbytes;
   347		}
   348	
   349	out_finish:
   350		dev_put(dev);
   351		return ret;
   352	}
   353	
   354	static int read_dev_bps_config(struct seq_file *sf, void *v)
   355	{
   356		int i;
   357	
   358		for (i = 0; i < MAX_NIC_SUPPORT; i++)
   359			if (bw_config[i].name)
   360				seq_printf(sf,
   361					   "%s rx_bps_min=%lu rx_bps_max=%lu tx_bps_min=%lu tx_bps_max=%lu\n",
   362					   bw_config[i].name,
   363					   bw_config[i].rx_bps_min,
   364					   bw_config[i].rx_bps_max,
   365					   bw_config[i].tx_bps_min,
   366					   bw_config[i].tx_bps_max);
   367		return 0;
   368	}
   369	
   370	int netqos_notifier(struct notifier_block *this,
   371			    unsigned long event, void *ptr)
   372	{
   373		struct net_device *dev = netdev_notifier_info_to_dev(ptr);
   374		struct net *net = dev_net(dev);
   375	
   376		if (!net_eq(net, &init_net))
   377			return NOTIFY_DONE;
   378	
   379		switch (event) {
   380		case NETDEV_UNREGISTER:
   381			if (dev->ifindex < MAX_NIC_SUPPORT &&
   382			    bw_config[dev->ifindex].name) {
   383				kfree(bw_config[dev->ifindex].name);
   384				bw_config[dev->ifindex].name = NULL;
   385			}
   386			break;
   387		}
   388	
   389		return NOTIFY_DONE;
   390	}
   391	EXPORT_SYMBOL_GPL(netqos_notifier);
   392	
   393	static int write_rx_min_rwnd_segs(struct cgroup_subsys_state *css,
   394					  struct cftype *cft, u64 value)
   395	{
   396		if (READ_ONCE(netcls_modfunc.write_rx_min_rwnd_segs))
   397			return netcls_modfunc.write_rx_min_rwnd_segs(css, cft, value);
   398		return 0;
   399	}
   400	
   401	static u64 read_rx_min_rwnd_segs(struct cgroup_subsys_state *css,
   402					 struct cftype *cft)
   403	{
   404		if (READ_ONCE(netcls_modfunc.read_rx_min_rwnd_segs))
   405			return netcls_modfunc.read_rx_min_rwnd_segs(css, cft);
   406		return 0;
   407	}
   408	
   409	int read_class_stat(struct seq_file *sf, void *v)
   410	{
   411		struct cgroup_subsys_state *css = seq_css(sf);
   412	
   413		if (READ_ONCE(netcls_modfunc.read_rx_stat) &&
   414		    READ_ONCE(netcls_modfunc.read_tx_stat)) {
   415			netcls_modfunc.read_rx_stat(css, sf);
   416			netcls_modfunc.read_tx_stat(css, sf);
   417		}
   418		return 0;
   419	}
   420	
 > 421	int rx_dump(struct seq_file *sf, void *v)
   422	{
   423		if (READ_ONCE(netcls_modfunc.dump_rx_tb))
   424			netcls_modfunc.dump_rx_tb(sf);
   425		return 0;
   426	}
   427	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
