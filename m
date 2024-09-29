Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF617127E18
	for <oe-kbuild-all@lists.linux.dev>; Sun, 29 Sep 2024 20:44:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727642660; cv=none; b=c0gCdmrIw/crbjU4JxSqUSwxk0CtOmD090jBjvlGBK3duH9frBNtoCWc2mxY6iPvANb73876u705pBMU8aN4YHTqiHqB/46wGKiH59wpWq7TPU72mpybUQcRZgbLvTyA3lMseaQCl8vESjxyox17dSchrnQVOYp0E3u2jHI2PZc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727642660; c=relaxed/simple;
	bh=ZIsx5h+XSq4Oo4tCmeFbCVEPZSNsI6QCCLzM8ccJ18U=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=sKA+Fb5LhHOQ67HHac+CkU8mh9Bfb1JxfDZIncyYErMAYGqKMkp9OQtDv9wFIX+Ny5nJfkHbtiehJfnieFTBJgUtkZykoRkh+sOr91/X1zV8IKPxmXqaZcphBk+nEYKtO17DlXEjKMz/zJ6sJllnzVpCMfOBFIG4yRJeeA4kqJo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=A7Id84R8; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="A7Id84R8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727642659; x=1759178659;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ZIsx5h+XSq4Oo4tCmeFbCVEPZSNsI6QCCLzM8ccJ18U=;
  b=A7Id84R8OFmoF9uMwIhQ7nEwZQFJUTB8LEvfgROAmfG4v9MCYaXLMZNo
   +sAjPK2wVnRCQ77wK5LGZcO3kg0gOANTRedcm29ZP1VVI61N/YyZe7fNQ
   waavrbyCI/x9IeCJA2RUF6JsZ4kjP5KORbYJlMKU4ZjPmhIBA0X32JFCh
   l+lgyJUI+QsGXCv6KyfN9k1yOS9bRyzaKaqub0ZzJxz64RSobgvzxWlyV
   hL2rH1WsJmnGvzCoJb3ciAoHkULh6Q7l2fxe6EXUnBo2fq9C91vmqTMT3
   gW2iHwlx89POPajNyoR8fgi+bnvG/Bw6auBVMeeEwb4uGcec/nEa43bT/
   g==;
X-CSE-ConnectionGUID: ev5sZxgwQACh1pO2kHVX3w==
X-CSE-MsgGUID: w935xOM3Qb+LT6rV4lbUuA==
X-IronPort-AV: E=McAfee;i="6700,10204,11210"; a="26817193"
X-IronPort-AV: E=Sophos;i="6.11,164,1725346800"; 
   d="scan'208";a="26817193"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Sep 2024 13:44:16 -0700
X-CSE-ConnectionGUID: +oqNCVU3R06Vf0BWHbQHFA==
X-CSE-MsgGUID: XHaciymTQBWmq4i3UNmjqA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,164,1725346800"; 
   d="scan'208";a="73066198"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 29 Sep 2024 13:44:12 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sv0m2-000Ohh-0h;
	Sun, 29 Sep 2024 20:44:10 +0000
Date: Mon, 30 Sep 2024 04:44:09 +0800
From: kernel test robot <lkp@intel.com>
To: kaixuxia@tencent.com, frankjpliu@tencent.com, kasong@tencent.com,
	sagazchen@tencent.com, kernelxing@tencent.com,
	aurelianliu@tencent.com, deshengwu@tencent.com,
	flyingpeng@tencent.com, jingqunli@tencent.com, jason.zeng@intel.com,
	wu.zheng@intel.com, yingbao.jia@intel.com, pei.p.jia@intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [opencloudos:next 11988/12031] net/core/netclassid_cgroup.c:515:5:
 warning: no previous prototype for 'bps_limit_dump'
Message-ID: <202409300437.ZQGDcLgn-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/OpenCloudOS/OpenCloudOS-Kernel.git next
head:   6c7ba3824d4ec8a20ab384fa7b838eeb7e5b4e5f
commit: ca0f6ddd217803ae350424336308109cc6ca6fdc [11988/12031] rue/net: add rx && tx rate limit for per cgroup
config: x86_64-defconfig (https://download.01.org/0day-ci/archive/20240930/202409300437.ZQGDcLgn-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240930/202409300437.ZQGDcLgn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409300437.ZQGDcLgn-lkp@intel.com/

All warnings (new ones prefixed by >>):

   net/core/netclassid_cgroup.c:122:5: warning: no previous prototype for 'cls_cgroup_stats_init' [-Wmissing-prototypes]
     122 | int cls_cgroup_stats_init(struct cls_cgroup_stats *stats)
         |     ^~~~~~~~~~~~~~~~~~~~~
   net/core/netclassid_cgroup.c:151:6: warning: no previous prototype for 'cls_cgroup_stats_destroy' [-Wmissing-prototypes]
     151 | void cls_cgroup_stats_destroy(struct cls_cgroup_stats *stats)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~
   net/core/netclassid_cgroup.c:337:5: warning: no previous prototype for 'net_cgroup_notify_prio_change' [-Wmissing-prototypes]
     337 | int net_cgroup_notify_prio_change(struct cgroup_subsys_state *css,
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/core/netclassid_cgroup.c:489:5: warning: no previous prototype for 'read_class_stat' [-Wmissing-prototypes]
     489 | int read_class_stat(struct seq_file *sf, void *v)
         |     ^~~~~~~~~~~~~~~
   net/core/netclassid_cgroup.c:501:5: warning: no previous prototype for 'rx_dump' [-Wmissing-prototypes]
     501 | int rx_dump(struct seq_file *sf, void *v)
         |     ^~~~~~~
   net/core/netclassid_cgroup.c:508:5: warning: no previous prototype for 'tx_dump' [-Wmissing-prototypes]
     508 | int tx_dump(struct seq_file *sf, void *v)
         |     ^~~~~~~
>> net/core/netclassid_cgroup.c:515:5: warning: no previous prototype for 'bps_limit_dump' [-Wmissing-prototypes]
     515 | int bps_limit_dump(struct seq_file *sf, void *v)
         |     ^~~~~~~~~~~~~~
   net/core/netclassid_cgroup.c: In function 'write_dev_bps_config':
   net/core/netclassid_cgroup.c:411:17: warning: 'strncpy' specified bound depends on the length of the source argument [-Wstringop-truncation]
     411 |                 strncpy(bw_config[dev->ifindex].name, dev->name,
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     412 |                         strlen(dev->name));
         |                         ~~~~~~~~~~~~~~~~~~


vim +/bps_limit_dump +515 net/core/netclassid_cgroup.c

   514	
 > 515	int bps_limit_dump(struct seq_file *sf, void *v)
   516	{
   517		struct cgroup_subsys_state *css = seq_css(sf);
   518	
   519		if (READ_ONCE(netcls_modfunc.dump_rx_bps_limit_tb) &&
   520		    READ_ONCE(netcls_modfunc.dump_tx_bps_limit_tb)) {
   521			netcls_modfunc.dump_rx_bps_limit_tb(css, sf);
   522			netcls_modfunc.dump_tx_bps_limit_tb(css, sf);
   523		}
   524		return 0;
   525	}
   526	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
