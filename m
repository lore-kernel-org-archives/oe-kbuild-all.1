Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 046DA13AD1C
	for <oe-kbuild-all@lists.linux.dev>; Wed,  4 Jun 2025 12:39:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749040765; cv=none; b=bjal3+Qf1R1zw9+6wCmv24zMXa4D+65BJkEM10rZ7C9KTKVyvFYwUM78FApTjNkGC86U0I8Cv6Tpo4UvyKibT08I3iSuXnl3p50/7pJVhqOogz5Uw/3D+gQMU2J2SKuZWtfrdxCKowAI3OFpMew/y+bN3Op8hDODh8QYBA9xSgY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749040765; c=relaxed/simple;
	bh=xTJrmu+5lrto+yZ7Ej7fNSowB5LV4GCeWgmoprvNErk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=T7prxu+878pl3gJsRzN7TfJhMNZ8Z1+Oi6MWX8leo5H12HBdGUfjymjAvXzSfcPeQDN6ri0QNXhuvwhxHUJKi4ftdvlimOE+wreAUl+lRzrWavkVUZSo3J1tRXin74SQ1X5QQO5oDidufMrDvWSqaADvyX5J4bZMRzIHmcWja9o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Z6SQga7A; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Z6SQga7A"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749040763; x=1780576763;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=xTJrmu+5lrto+yZ7Ej7fNSowB5LV4GCeWgmoprvNErk=;
  b=Z6SQga7AvOH8Tp1+ylMj3c4VpIbEvViE+VAIbkKtV6mPcylFvWR4abTN
   UGzJB6huzkhOyzdv6VRbReVKLXwzAQP3UTA6U5UL2T7gndeOR/c+TOgXU
   a4UP6TQ6vGCEhqfk3gwOG6Uk0gjyNWGi779f/whYoat8D8wuDk0dAZ5Gn
   /LI2qkgNQKKO+LJmRH4gAuuHePASI04An9kmZB2jdVPAKr7uMDoE0E2JQ
   PeeCxTc5KSkzdemBSK7YutOvX0O4/DqGKFZ54GEPixYdt4XWkmFMkWbO8
   wjo8XqBHCmiLUC2jzBzQfRtycKZP0+rPAEzezXZ83k+3OXGfmh25FOQ63
   w==;
X-CSE-ConnectionGUID: soN/pEC/SdCxgmkRnsKZMA==
X-CSE-MsgGUID: 5lTNeR9SS8KI6DmZ8YQVLA==
X-IronPort-AV: E=McAfee;i="6800,10657,11454"; a="51210043"
X-IronPort-AV: E=Sophos;i="6.16,209,1744095600"; 
   d="scan'208";a="51210043"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jun 2025 05:39:16 -0700
X-CSE-ConnectionGUID: aE9faFukRL2AyM7PNasw4w==
X-CSE-MsgGUID: /ShwXyEIQYyPheA12qD+Kg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,209,1744095600"; 
   d="scan'208";a="145772360"
Received: from igk-lkp-server01.igk.intel.com (HELO b69e6467d450) ([10.211.3.150])
  by orviesa007.jf.intel.com with ESMTP; 04 Jun 2025 05:39:14 -0700
Received: from kbuild by b69e6467d450 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uMnOh-0001hu-2c;
	Wed, 04 Jun 2025 12:39:11 +0000
Date: Wed, 4 Jun 2025 20:38:57 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android12-kiwi-5.10 0/131]
 drivers/soc/qcom/cmd-db.c:151:9: warning: 'strncpy' specified bound 8 equals
 destination size
Message-ID: <202506042034.tcs55zhb-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Lina,

First bad commit (maybe != root cause):

tree:   https://android.googlesource.com/kernel/common android12-kiwi-5.10
head:   9203085d68e4793796a32d611222a6e9e5b9b9d3
commit: d47a4b6ba18374654eeb479a8fa24f02a46bb1e6 [0/131] FROMLIST: soc: qcom: cmd-db: allow loading as a module
config: x86_64-buildonly-randconfig-2001-20250502 (https://download.01.org/0day-ci/archive/20250604/202506042034.tcs55zhb-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250604/202506042034.tcs55zhb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506042034.tcs55zhb-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/soc/qcom/cmd-db.c: In function 'cmd_db_get_header':
>> drivers/soc/qcom/cmd-db.c:151:9: warning: 'strncpy' specified bound 8 equals destination size [-Wstringop-truncation]
     151 |         strncpy(query, id, sizeof(query));
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/strncpy +151 drivers/soc/qcom/cmd-db.c

312416d9171a14 Mahesh Sivasubramanian 2018-04-10  137  
84fa36eb30f2e0 Stephen Boyd           2018-09-26  138  static int cmd_db_get_header(const char *id, const struct entry_header **eh,
84fa36eb30f2e0 Stephen Boyd           2018-09-26  139  			     const struct rsc_hdr **rh)
312416d9171a14 Mahesh Sivasubramanian 2018-04-10  140  {
84fa36eb30f2e0 Stephen Boyd           2018-09-26  141  	const struct rsc_hdr *rsc_hdr;
84fa36eb30f2e0 Stephen Boyd           2018-09-26  142  	const struct entry_header *ent;
312416d9171a14 Mahesh Sivasubramanian 2018-04-10  143  	int ret, i, j;
36b0aefdee6e20 Stephen Boyd           2018-04-19  144  	u8 query[8];
312416d9171a14 Mahesh Sivasubramanian 2018-04-10  145  
312416d9171a14 Mahesh Sivasubramanian 2018-04-10  146  	ret = cmd_db_ready();
312416d9171a14 Mahesh Sivasubramanian 2018-04-10  147  	if (ret)
312416d9171a14 Mahesh Sivasubramanian 2018-04-10  148  		return ret;
312416d9171a14 Mahesh Sivasubramanian 2018-04-10  149  
36b0aefdee6e20 Stephen Boyd           2018-04-19  150  	/* Pad out query string to same length as in DB */
36b0aefdee6e20 Stephen Boyd           2018-04-19 @151  	strncpy(query, id, sizeof(query));
36b0aefdee6e20 Stephen Boyd           2018-04-19  152  
312416d9171a14 Mahesh Sivasubramanian 2018-04-10  153  	for (i = 0; i < MAX_SLV_ID; i++) {
312416d9171a14 Mahesh Sivasubramanian 2018-04-10  154  		rsc_hdr = &cmd_db_header->header[i];
312416d9171a14 Mahesh Sivasubramanian 2018-04-10  155  		if (!rsc_hdr->slv_id)
312416d9171a14 Mahesh Sivasubramanian 2018-04-10  156  			break;
312416d9171a14 Mahesh Sivasubramanian 2018-04-10  157  
36b0aefdee6e20 Stephen Boyd           2018-04-19  158  		ent = rsc_to_entry_header(rsc_hdr);
36b0aefdee6e20 Stephen Boyd           2018-04-19  159  		for (j = 0; j < le16_to_cpu(rsc_hdr->cnt); j++, ent++) {
84fa36eb30f2e0 Stephen Boyd           2018-09-26  160  			if (memcmp(ent->id, query, sizeof(ent->id)) == 0) {
84fa36eb30f2e0 Stephen Boyd           2018-09-26  161  				if (eh)
84fa36eb30f2e0 Stephen Boyd           2018-09-26  162  					*eh = ent;
84fa36eb30f2e0 Stephen Boyd           2018-09-26  163  				if (rh)
84fa36eb30f2e0 Stephen Boyd           2018-09-26  164  					*rh = rsc_hdr;
312416d9171a14 Mahesh Sivasubramanian 2018-04-10  165  				return 0;
312416d9171a14 Mahesh Sivasubramanian 2018-04-10  166  			}
312416d9171a14 Mahesh Sivasubramanian 2018-04-10  167  		}
84fa36eb30f2e0 Stephen Boyd           2018-09-26  168  	}
312416d9171a14 Mahesh Sivasubramanian 2018-04-10  169  
312416d9171a14 Mahesh Sivasubramanian 2018-04-10  170  	return -ENODEV;
312416d9171a14 Mahesh Sivasubramanian 2018-04-10  171  }
312416d9171a14 Mahesh Sivasubramanian 2018-04-10  172  

:::::: The code at line 151 was first introduced by commit
:::::: 36b0aefdee6e203f3130d7444bf5103139ecbe25 soc: qcom: cmd-db: Make endian-agnostic

:::::: TO: Stephen Boyd <swboyd@chromium.org>
:::::: CC: Andy Gross <andy.gross@linaro.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
