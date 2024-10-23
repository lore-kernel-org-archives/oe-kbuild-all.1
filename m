Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 003F91BD039
	for <oe-kbuild-all@lists.linux.dev>; Wed, 23 Oct 2024 18:51:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729709462; cv=none; b=DG8errID2KYX5dB4onpAK/HFKHAsfU4DwRLa7aUoPlD6WGQ7iBeNLboSknNIZrxYCIey9KtKfzM5sdhU8DYWjTSsc+CopzhcuVkXak63Wn5rP8D2ypODxtHA7OPs7ZYnqQKUzNRqoFdwyT0CrdRBbe8csZyLoaeWSABxBScjyn4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729709462; c=relaxed/simple;
	bh=tBNlGRKHi1fUI48CIUsJ60A/pZR0GVHHLm3iL8oAvEk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Y7b+BBUdjl+9OfqNKHtuheJW+cvcQLwbFKs5ikYNqfT6W2BmRa5EQTH8dooRm/c6k8xfJxppAp2+SpOzYpUNXN6QEPblCT6rHOMWCjSl/Xc0dS2NvDuiQbztAGu3AsKSfLExumPLkrteSLxPMKh5P2pm+SD9IThuegQGHagob3Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jHxWglqv; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jHxWglqv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729709461; x=1761245461;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=tBNlGRKHi1fUI48CIUsJ60A/pZR0GVHHLm3iL8oAvEk=;
  b=jHxWglqvM7GTw9m4IF7cDnsxEQQQWyW8/twGKeUD4ncJmrzOi93rzCyP
   1+lhm4zDqfHZykSSRHdWuQ/7BLr2BGhKx+trtke1oqgdDMpYTkEdwgEVp
   SBub0pog3oQ9zFAugXPX9JjjBqC6km7PMGd6A/R8c8C/EX3NizNR0+ty1
   Dq9Mq6EqXjSx1SzjjekeEQBrPDgjyRLW8dl1Nx9cqImK38jo20B9XrI2g
   K3LJfnlNyhqXBAFcHNbNnHajIh136oLbmozEhJbBv5rfKXkpNf1gLYFlR
   nQsjh9zLvfb8uHcDcSZ17ThNs3QiCcytx0Ayfv3mxtrdYKiZcWhnFX7Gc
   A==;
X-CSE-ConnectionGUID: 1/BT/RZrQIiMdC+0zkIOiA==
X-CSE-MsgGUID: 5TVPjUclRnWeO/7rYrax6w==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="29095067"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="29095067"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Oct 2024 11:51:00 -0700
X-CSE-ConnectionGUID: XczaIow+R2yoagMvntAdJA==
X-CSE-MsgGUID: 3H035JkjQyeXx/MVmpShmg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,226,1725346800"; 
   d="scan'208";a="103658714"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 23 Oct 2024 11:50:57 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t3gRa-000VIs-2c;
	Wed, 23 Oct 2024 18:50:54 +0000
Date: Thu, 24 Oct 2024 02:50:30 +0800
From: kernel test robot <lkp@intel.com>
To: kaixuxia@tencent.com, frankjpliu@tencent.com, kasong@tencent.com,
	sagazchen@tencent.com, kernelxing@tencent.com,
	aurelianliu@tencent.com, deshengwu@tencent.com,
	flyingpeng@tencent.com, jingqunli@tencent.com, jason.zeng@intel.com,
	wu.zheng@intel.com, yingbao.jia@intel.com, pei.p.jia@intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [opencloudos:next 11990/13046] net/core/netclassid_cgroup.c:590:17:
 warning: 'strncpy' output truncated before terminating nul copying as many
 bytes from a string as its length
Message-ID: <202410240216.axx5hywS-lkp@intel.com>
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
commit: 9a447c5cb97d4648c380d9e26ffc6c9a99c05f69 [11990/13046] rue/net: add total bandwidth limit for multiprio preemption
config: x86_64-defconfig (https://download.01.org/0day-ci/archive/20241024/202410240216.axx5hywS-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241024/202410240216.axx5hywS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410240216.axx5hywS-lkp@intel.com/

All warnings (new ones prefixed by >>):

   net/core/netclassid_cgroup.c:128:5: warning: no previous prototype for 'cls_cgroup_stats_init' [-Wmissing-prototypes]
     128 | int cls_cgroup_stats_init(struct cls_cgroup_stats *stats)
         |     ^~~~~~~~~~~~~~~~~~~~~
   net/core/netclassid_cgroup.c:157:6: warning: no previous prototype for 'cls_cgroup_stats_destroy' [-Wmissing-prototypes]
     157 | void cls_cgroup_stats_destroy(struct cls_cgroup_stats *stats)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~
   net/core/netclassid_cgroup.c:486:5: warning: no previous prototype for 'net_cgroup_notify_prio_change' [-Wmissing-prototypes]
     486 | int net_cgroup_notify_prio_change(struct cgroup_subsys_state *css,
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/core/netclassid_cgroup.c:684:5: warning: no previous prototype for 'read_class_stat' [-Wmissing-prototypes]
     684 | int read_class_stat(struct seq_file *sf, void *v)
         |     ^~~~~~~~~~~~~~~
   net/core/netclassid_cgroup.c:696:5: warning: no previous prototype for 'rx_dump' [-Wmissing-prototypes]
     696 | int rx_dump(struct seq_file *sf, void *v)
         |     ^~~~~~~
   net/core/netclassid_cgroup.c:703:5: warning: no previous prototype for 'tx_dump' [-Wmissing-prototypes]
     703 | int tx_dump(struct seq_file *sf, void *v)
         |     ^~~~~~~
   net/core/netclassid_cgroup.c:710:5: warning: no previous prototype for 'bps_limit_dump' [-Wmissing-prototypes]
     710 | int bps_limit_dump(struct seq_file *sf, void *v)
         |     ^~~~~~~~~~~~~~
   net/core/netclassid_cgroup.c: In function 'write_dev_bps_config':
>> net/core/netclassid_cgroup.c:590:17: warning: 'strncpy' output truncated before terminating nul copying as many bytes from a string as its length [-Wstringop-truncation]
     590 |                 strncpy(bw_config[ifindex].name, dev_name, strlen(dev_name));
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/strncpy +590 net/core/netclassid_cgroup.c

   493	
   494	static ssize_t write_dev_bps_config(struct kernfs_open_file *of,
   495					    char *buf, size_t nbytes, loff_t off)
   496	{
   497		int len, ifindex = -1;
   498		struct net_device *dev;
   499		struct net *net = current->nsproxy->net_ns;
   500		char tok[27] = {0};
   501		long v[4] = {-1, -1, -1, -1};
   502		int ret = -EINVAL;
   503		char *dev_name = NULL;
   504		bool set_all_dev = false;
   505		char *name = NULL;
   506	
   507		if (sscanf(buf, "%16s%n", tok, &len) != 1)
   508			return ret;
   509		buf += len;
   510	
   511		if (strlen(tok) == 3 && !strcmp(tok, "all")) {
   512			dev_name = "all";
   513			ifindex = MAX_NIC_SUPPORT;
   514			set_all_dev = true;
   515		} else {
   516			dev = dev_get_by_name(net, tok);
   517			if (!dev) {
   518				pr_err("Netdev name %s not found!\n", tok);
   519				return -ENODEV;
   520			}
   521	
   522			if (dev->ifindex >= MAX_NIC_SUPPORT) {
   523				pr_err("Netdev %s index(%d) too large!\n", tok,
   524				       dev->ifindex);
   525				goto out_finish;
   526			}
   527			ifindex = dev->ifindex;
   528			dev_name = dev->name;
   529		}
   530	
   531		while (true) {
   532			char *p;
   533			unsigned long val = 0;
   534	
   535			if (sscanf(buf, "%26s%n", tok, &len) != 1)
   536				break;
   537			if (tok[0] == '\0')
   538				break;
   539			buf += len;
   540	
   541			p = tok;
   542			strsep(&p, "=");
   543			if (!p || kstrtoul(p, 10, &val) || val < 0)
   544				goto out_finish;
   545	
   546			if (!strcmp(tok, "disable") && val == 1) {
   547				kfree(bw_config[ifindex].name);
   548				bw_config[ifindex].name = NULL;
   549				ret = nbytes;
   550				if (set_all_dev) {
   551					tx_throttle_all_enabled = 0;
   552					rx_throttle_all_enabled = 0;
   553				}
   554				goto out_finish;
   555			} else if (!strcmp(tok, "rx_bps_min")) {
   556				v[0] = val;
   557			} else if (!strcmp(tok, "rx_bps_max")) {
   558				v[1] = val;
   559			} else if (!strcmp(tok, "tx_bps_min")) {
   560				v[2] = val;
   561			} else if (!strcmp(tok, "tx_bps_max")) {
   562				v[3] = val;
   563			} else {
   564				goto out_finish;
   565			}
   566		}
   567	
   568		if ((v[0] > -1 && v[1] > -1) || (v[2] > -1 && v[3] > -1)) {
   569			if (v[0] < -1 || v[0] > v[1] || v[2] < -1 || v[2] > v[3])
   570				goto out_finish;
   571	
   572			if ((v[0] == -1 || v[1] == -1) && (v[0] > -1 || v[1] > -1))
   573				goto out_finish;
   574	
   575			if ((v[2] == -1 || v[3] == -1) && (v[2] > -1 || v[3] > -1))
   576				goto out_finish;
   577	
   578			len = strlen(dev_name) + 1;
   579			name = kzalloc(len, GFP_KERNEL);
   580			if (!name) {
   581				pr_err("Netdev %s index(%d) alloc name failed!\n",
   582				       dev_name, ifindex);
   583				goto out_finish;
   584			}
   585	
   586			/* release old config info */
   587			kfree(bw_config[ifindex].name);
   588	
   589			bw_config[ifindex].name = name;
 > 590			strncpy(bw_config[ifindex].name, dev_name, strlen(dev_name));
   591	
   592			if (v[0] > -1 && v[1] > -1 &&
   593			    READ_ONCE(netcls_modfunc.write_rx_bps_minmax)) {
   594				bw_config[ifindex].rx_bps_min = v[0];
   595				bw_config[ifindex].rx_bps_max = v[1];
   596				netcls_modfunc.write_rx_bps_minmax(ifindex,
   597						bw_config[ifindex].rx_bps_min,
   598						bw_config[ifindex].rx_bps_max,
   599						set_all_dev);
   600			}
   601	
   602			if (v[2] > -1 && v[3] > -1 &&
   603			    READ_ONCE(netcls_modfunc.write_tx_bps_minmax)) {
   604				bw_config[ifindex].tx_bps_min = v[2];
   605				bw_config[ifindex].tx_bps_max = v[3];
   606				netcls_modfunc.write_tx_bps_minmax(ifindex,
   607						bw_config[ifindex].tx_bps_min,
   608						bw_config[ifindex].tx_bps_max,
   609						set_all_dev);
   610			}
   611	
   612			if (set_all_dev) {
   613				if (bw_config[ifindex].rx_bps_min &&
   614				    bw_config[ifindex].rx_bps_max)
   615					rx_throttle_all_enabled = 1;
   616				if (bw_config[ifindex].tx_bps_min &&
   617				    bw_config[ifindex].tx_bps_max)
   618					tx_throttle_all_enabled = 1;
   619			}
   620			ret = nbytes;
   621		}
   622	
   623	out_finish:
   624		if (!set_all_dev)
   625			dev_put(dev);
   626		return ret;
   627	}
   628	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
