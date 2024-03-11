Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1AD117D2
	for <oe-kbuild-all@lists.linux.dev>; Mon, 11 Mar 2024 03:42:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710128541; cv=none; b=X86l4R9/6ltrKWHXPJnzMzRcxqTNz68HIaxOf11dq/d7uY2Un7JlO+2bugjhFoRcFpuuNZs8r8KfmSI+nP+n2FvaetzJx/TH4jaJD99ysqdf0Bm89s0pjP0LQSwUAvFAm9e3JwwVl7ZONck9Lo5ldelgEloEirWb2Okk0D8FWUI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710128541; c=relaxed/simple;
	bh=yR1ZriXov0u7hkf5JUKDp624rQNanLbuqchej2AMyyg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=MuyYV6FGvBWbNNMfK+8ZXmcpq3Mue9cy2WOl+2MDvSOraZ3wcHDlzfdfn6zs+WlQZNV7O7hp0q1wTnxoYDQCgCUU9WTkkSBi3SUSo3rBghDQchTu2rPR0zWS9GWTz2n73Y+FchdY7alTkHOp9VGsDKGRP/PY56gyTTJoxlfIi8I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PkC9vSAD; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PkC9vSAD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1710128539; x=1741664539;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=yR1ZriXov0u7hkf5JUKDp624rQNanLbuqchej2AMyyg=;
  b=PkC9vSADWZmLYh/5opJO+lDZiLzpxxTKeJxJtY+HafigKZcXq6PZdw4Y
   bppyASBIJpi7P/S7CdrhfTQcLbgQLWWFoX16MKzCQbHB5LNIBeWQRPjZO
   BzAZV/WrEm17smRMGjo/46np0zSYIB5dREohMMzUKOtCkrC1ub/LabP+J
   hW+TFO+abyjWPgmHKVev00hRPuy3u0Zx9L0MJXXo+sb8U1UCvwB4jqvrz
   wFol+fRH2c3uJXuR5tqZ+LnPI6PH1JZ5m4Ue5dQrP0/hqLpQYKwRK6gpL
   EsC+rCdDUvNz94czjjWw/c5GXG8yhoY+iI6xOGzUPNlG1JR3aTjNLxzqX
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11009"; a="4891192"
X-IronPort-AV: E=Sophos;i="6.07,115,1708416000"; 
   d="scan'208";a="4891192"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Mar 2024 20:42:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,115,1708416000"; 
   d="scan'208";a="15684512"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 10 Mar 2024 20:42:12 -0700
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rjWYD-0008rr-0f;
	Mon, 11 Mar 2024 03:42:09 +0000
Date: Mon, 11 Mar 2024 11:42:07 +0800
From: kernel test robot <lkp@intel.com>
To: jasperwang@tencent.com, kaixuxia@tencent.com, frankjpliu@tencent.com,
	kasong@tencent.com, sagazchen@tencent.com, kernelxing@tencent.com,
	aurelianliu@tencent.com, jason.zeng@intel.com, wu.zheng@intel.com,
	yingbao.jia@intel.com, pei.p.jia@intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [opencloudos:linux-5.4/next 26627/27506]
 net/core/netclassid_cgroup.c:593:17: warning: 'strncpy' output truncated
 before terminating nul copying as many bytes from a string as its length
Message-ID: <202403111151.EiYQtTal-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/OpenCloudOS/OpenCloudOS-Kernel.git linux-5.4/next
head:   3ba333344123321f5f312e69966bbc8e5533561f
commit: f59c17da7eb27bbfb9c4fad3b2776f9f224ff95a [26627/27506] rue/net: add total bandwidth limit for multiprio preemption
config: arm64-randconfig-r052-20240308 (https://download.01.org/0day-ci/archive/20240311/202403111151.EiYQtTal-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240311/202403111151.EiYQtTal-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403111151.EiYQtTal-lkp@intel.com/

All warnings (new ones prefixed by >>):

   net/core/netclassid_cgroup.c:128:5: warning: no previous prototype for 'cls_cgroup_stats_init' [-Wmissing-prototypes]
     128 | int cls_cgroup_stats_init(struct cls_cgroup_stats *stats)
         |     ^~~~~~~~~~~~~~~~~~~~~
   net/core/netclassid_cgroup.c:157:6: warning: no previous prototype for 'cls_cgroup_stats_destroy' [-Wmissing-prototypes]
     157 | void cls_cgroup_stats_destroy(struct cls_cgroup_stats *stats)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~
   net/core/netclassid_cgroup.c: In function 'write_bps_limit':
   net/core/netclassid_cgroup.c:338:51: warning: comparison of unsigned expression in '>= 0' is always true [-Wtype-limits]
     338 |                 if (!strcmp(tok, "rx_bps") && val >= 0)
         |                                                   ^~
   net/core/netclassid_cgroup.c:340:56: warning: comparison of unsigned expression in '>= 0' is always true [-Wtype-limits]
     340 |                 else if (!strcmp(tok, "tx_bps") && val >= 0)
         |                                                        ^~
   net/core/netclassid_cgroup.c: At top level:
   net/core/netclassid_cgroup.c:489:5: warning: no previous prototype for 'net_cgroup_notify_prio_change' [-Wmissing-prototypes]
     489 | int net_cgroup_notify_prio_change(struct cgroup_subsys_state *css,
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/core/netclassid_cgroup.c: In function 'write_dev_bps_config':
   net/core/netclassid_cgroup.c:546:56: warning: comparison of unsigned expression in '< 0' is always false [-Wtype-limits]
     546 |                 if (!p || kstrtoul(p, 10, &val) || val < 0)
         |                                                        ^
   net/core/netclassid_cgroup.c: At top level:
   net/core/netclassid_cgroup.c:687:5: warning: no previous prototype for 'read_class_stat' [-Wmissing-prototypes]
     687 | int read_class_stat(struct seq_file *sf, void *v)
         |     ^~~~~~~~~~~~~~~
   net/core/netclassid_cgroup.c:699:5: warning: no previous prototype for 'rx_dump' [-Wmissing-prototypes]
     699 | int rx_dump(struct seq_file *sf, void *v)
         |     ^~~~~~~
   net/core/netclassid_cgroup.c:706:5: warning: no previous prototype for 'tx_dump' [-Wmissing-prototypes]
     706 | int tx_dump(struct seq_file *sf, void *v)
         |     ^~~~~~~
   net/core/netclassid_cgroup.c:713:5: warning: no previous prototype for 'bps_limit_dump' [-Wmissing-prototypes]
     713 | int bps_limit_dump(struct seq_file *sf, void *v)
         |     ^~~~~~~~~~~~~~
   net/core/netclassid_cgroup.c: In function 'write_dev_bps_config':
>> net/core/netclassid_cgroup.c:593:17: warning: 'strncpy' output truncated before terminating nul copying as many bytes from a string as its length [-Wstringop-truncation]
     593 |                 strncpy(bw_config[ifindex].name, dev_name, strlen(dev_name));
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/core/netclassid_cgroup.c:593:17: note: length computed here
     593 |                 strncpy(bw_config[ifindex].name, dev_name, strlen(dev_name));
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> net/core/netclassid_cgroup.c:593:17: warning: 'strncpy' output truncated before terminating nul copying as many bytes from a string as its length [-Wstringop-truncation]
     593 |                 strncpy(bw_config[ifindex].name, dev_name, strlen(dev_name));
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/core/netclassid_cgroup.c:593:17: note: length computed here
     593 |                 strncpy(bw_config[ifindex].name, dev_name, strlen(dev_name));
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> net/core/netclassid_cgroup.c:593:17: warning: 'strncpy' output truncated before terminating nul copying as many bytes from a string as its length [-Wstringop-truncation]
     593 |                 strncpy(bw_config[ifindex].name, dev_name, strlen(dev_name));
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/core/netclassid_cgroup.c:593:17: note: length computed here
     593 |                 strncpy(bw_config[ifindex].name, dev_name, strlen(dev_name));
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> net/core/netclassid_cgroup.c:593:17: warning: 'strncpy' output truncated before terminating nul copying as many bytes from a string as its length [-Wstringop-truncation]
     593 |                 strncpy(bw_config[ifindex].name, dev_name, strlen(dev_name));
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/core/netclassid_cgroup.c:593:17: note: length computed here
     593 |                 strncpy(bw_config[ifindex].name, dev_name, strlen(dev_name));
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/strncpy +593 net/core/netclassid_cgroup.c

   496	
   497	static ssize_t write_dev_bps_config(struct kernfs_open_file *of,
   498					    char *buf, size_t nbytes, loff_t off)
   499	{
   500		int len, ifindex = -1;
   501		struct net_device *dev;
   502		struct net *net = current->nsproxy->net_ns;
   503		char tok[27] = {0};
   504		long v[4] = {-1, -1, -1, -1};
   505		int ret = -EINVAL;
   506		char *dev_name = NULL;
   507		bool set_all_dev = false;
   508		char *name = NULL;
   509	
   510		if (sscanf(buf, "%16s%n", tok, &len) != 1)
   511			return ret;
   512		buf += len;
   513	
   514		if (strlen(tok) == 3 && !strcmp(tok, "all")) {
   515			dev_name = "all";
   516			ifindex = MAX_NIC_SUPPORT;
   517			set_all_dev = true;
   518		} else {
   519			dev = dev_get_by_name(net, tok);
   520			if (!dev) {
   521				pr_err("Netdev name %s not found!\n", tok);
   522				return -ENODEV;
   523			}
   524	
   525			if (dev->ifindex >= MAX_NIC_SUPPORT) {
   526				pr_err("Netdev %s index(%d) too large!\n", tok,
   527				       dev->ifindex);
   528				goto out_finish;
   529			}
   530			ifindex = dev->ifindex;
   531			dev_name = dev->name;
   532		}
   533	
   534		while (true) {
   535			char *p;
   536			unsigned long val = 0;
   537	
   538			if (sscanf(buf, "%26s%n", tok, &len) != 1)
   539				break;
   540			if (tok[0] == '\0')
   541				break;
   542			buf += len;
   543	
   544			p = tok;
   545			strsep(&p, "=");
   546			if (!p || kstrtoul(p, 10, &val) || val < 0)
   547				goto out_finish;
   548	
   549			if (!strcmp(tok, "disable") && val == 1) {
   550				kfree(bw_config[ifindex].name);
   551				bw_config[ifindex].name = NULL;
   552				ret = nbytes;
   553				if (set_all_dev) {
   554					tx_throttle_all_enabled = 0;
   555					rx_throttle_all_enabled = 0;
   556				}
   557				goto out_finish;
   558			} else if (!strcmp(tok, "rx_bps_min")) {
   559				v[0] = val;
   560			} else if (!strcmp(tok, "rx_bps_max")) {
   561				v[1] = val;
   562			} else if (!strcmp(tok, "tx_bps_min")) {
   563				v[2] = val;
   564			} else if (!strcmp(tok, "tx_bps_max")) {
   565				v[3] = val;
   566			} else {
   567				goto out_finish;
   568			}
   569		}
   570	
   571		if ((v[0] > -1 && v[1] > -1) || (v[2] > -1 && v[3] > -1)) {
   572			if (v[0] < -1 || v[0] > v[1] || v[2] < -1 || v[2] > v[3])
   573				goto out_finish;
   574	
   575			if ((v[0] == -1 || v[1] == -1) && (v[0] > -1 || v[1] > -1))
   576				goto out_finish;
   577	
   578			if ((v[2] == -1 || v[3] == -1) && (v[2] > -1 || v[3] > -1))
   579				goto out_finish;
   580	
   581			len = strlen(dev_name) + 1;
   582			name = kzalloc(len, GFP_KERNEL);
   583			if (!name) {
   584				pr_err("Netdev %s index(%d) alloc name failed!\n",
   585				       dev_name, ifindex);
   586				goto out_finish;
   587			}
   588	
   589			/* release old config info */
   590			kfree(bw_config[ifindex].name);
   591	
   592			bw_config[ifindex].name = name;
 > 593			strncpy(bw_config[ifindex].name, dev_name, strlen(dev_name));
   594	
   595			if (v[0] > -1 && v[1] > -1 &&
   596			    READ_ONCE(netcls_modfunc.write_rx_bps_minmax)) {
   597				bw_config[ifindex].rx_bps_min = v[0];
   598				bw_config[ifindex].rx_bps_max = v[1];
   599				netcls_modfunc.write_rx_bps_minmax(ifindex,
   600						bw_config[ifindex].rx_bps_min,
   601						bw_config[ifindex].rx_bps_max,
   602						set_all_dev);
   603			}
   604	
   605			if (v[2] > -1 && v[3] > -1 &&
   606			    READ_ONCE(netcls_modfunc.write_tx_bps_minmax)) {
   607				bw_config[ifindex].tx_bps_min = v[2];
   608				bw_config[ifindex].tx_bps_max = v[3];
   609				netcls_modfunc.write_tx_bps_minmax(ifindex,
   610						bw_config[ifindex].tx_bps_min,
   611						bw_config[ifindex].tx_bps_max,
   612						set_all_dev);
   613			}
   614	
   615			if (set_all_dev) {
   616				if (bw_config[ifindex].rx_bps_min &&
   617				    bw_config[ifindex].rx_bps_max)
   618					rx_throttle_all_enabled = 1;
   619				if (bw_config[ifindex].tx_bps_min &&
   620				    bw_config[ifindex].tx_bps_max)
   621					tx_throttle_all_enabled = 1;
   622			}
   623			ret = nbytes;
   624		}
   625	
   626	out_finish:
   627		if (!set_all_dev)
   628			dev_put(dev);
   629		return ret;
   630	}
   631	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
