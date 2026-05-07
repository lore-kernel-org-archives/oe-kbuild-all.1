Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D64E3FB7DC
	for <oe-kbuild-all@lists.linux.dev>; Thu,  7 May 2026 14:18:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778163485; cv=none; b=LjqxnrcGbBJmTtrEzt438SaSBWp/k6iCzCA0hy+IJmwK3fBkXAw+Z/2j2gf3l9wFv/ugqxK3RWjxg+vP7OhmA3M1Q3LnqEnaZ1YzulbedOKEypk9y/TazgCeAVR/hg6ilAkUuCqTxRD36pIsiR6sBEqbl2Knx2SMzN/HWgc/RDM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778163485; c=relaxed/simple;
	bh=ac/GwWO/JZh+zjSXu6bB52gZyQYOlMM79bLV25g8hMc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=VBWnRuDQH2ENIp+uX8hk8Akh1uzRegPW43B4wS19AtduM3/0W+3ZntW3acHA7R8GxVVsV7mefJv6JqkgZtbJmeBF2AE0TMemHhpYL++9PfcMavu3Qd+vi2bDlkY6JssjfBQNiKZ9HzP6T+UZKe5TVWeN9JJ8eVXpLFtXLw7jsUo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KjgxQYYk; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KjgxQYYk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778163480; x=1809699480;
  h=date:from:to:cc:subject:message-id;
  bh=ac/GwWO/JZh+zjSXu6bB52gZyQYOlMM79bLV25g8hMc=;
  b=KjgxQYYkE0t5+YzP4W4I1fThyhEM6NZd4AHq83cVpAxZZvpsvvpAQl9j
   rj3RB6U9I11PAO3iTGHoFJteRWsi9uW9Cl968p4mPEFOKtgDt5IZrPJ4V
   1CG4bzYYV2XYcVRp41n6IFGKqutgvc5JUL5hU7kMjj/97HT9qh/pI9wkd
   Bgns7E5GmvJqL/W0ZFtsFOY2eeCydrn98Ma8uEsUzHIiQmFbZqAv105o8
   oQxXvXol9FWgvb5UAqAURc9gPP2rmgXx3iYN71Ubl4Ccqxd+HPgpJoNoe
   Ffq6JejO03MJatnPFDar9K0i9KBBhNGGgWDY0tKp1H5ydu7zOllestpjT
   w==;
X-CSE-ConnectionGUID: JLKMkVC+TAqAFE3uaeamSQ==
X-CSE-MsgGUID: ekvauf1gRTe5+V8MrW+IMg==
X-IronPort-AV: E=McAfee;i="6800,10657,11779"; a="79222801"
X-IronPort-AV: E=Sophos;i="6.23,221,1770624000"; 
   d="scan'208";a="79222801"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2026 07:17:57 -0700
X-CSE-ConnectionGUID: zEDl7wufQ2+BzP66K0GRdg==
X-CSE-MsgGUID: 1Hjj/F/AQiyYjrzaIWJDNg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,221,1770624000"; 
   d="scan'208";a="230081655"
Received: from lkp-server01.sh.intel.com (HELO d6e19f2f5857) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 07 May 2026 07:17:55 -0700
Received: from kbuild by d6e19f2f5857 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wKzY1-0000000008l-1IrJ;
	Thu, 07 May 2026 14:17:53 +0000
Date: Thu, 07 May 2026 22:17:23 +0800
From: kernel test robot <lkp@intel.com>
To: Frank Wunderlich <frank-w@public-files.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [frank-w-bpi-r2-4.14:7.1-rc 103/157]
 drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:135:28: sparse: sparse:
 incorrect type in initializer (different base types)
Message-ID: <202605072216.tmnm7p9r-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Daniel,

First bad commit (maybe != root cause):

tree:   https://github.com/frank-w/BPI-R2-4.14 7.1-rc
head:   ce3735b05f8971cb2a88ba66c5df025751f12b10
commit: a9109c9c908350d83006dc4466373742dc00dca2 [103/157] net: dsa: add 802.1Q VLAN-based tag driver for MxL862xx
config: parisc-randconfig-r112-20260507 (https://download.01.org/0day-ci/archive/20260507/202605072216.tmnm7p9r-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 11.5.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260507/202605072216.tmnm7p9r-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605072216.tmnm7p9r-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:135:28: sparse: sparse: incorrect type in initializer (different base types) @@     expected restricted __le16 [usertype] reg @@     got int @@
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:135:28: sparse:     expected restricted __le16 [usertype] reg
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:135:28: sparse:     got int
>> drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:143:21: sparse: sparse: incorrect type in return expression (different base types) @@     expected int @@     got restricted __le16 [addressable] [usertype] data @@
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:143:21: sparse:     expected int
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:143:21: sparse:     got restricted __le16 [addressable] [usertype] data
>> drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:152:24: sparse: sparse: incorrect type in initializer (different base types) @@     expected restricted __le16 [usertype] reg @@     got int reg @@
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:152:24: sparse:     expected restricted __le16 [usertype] reg
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:152:24: sparse:     got int reg
>> drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:153:25: sparse: sparse: incorrect type in initializer (different base types) @@     expected restricted __le16 [usertype] data @@     got unsigned short [usertype] data @@
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:153:25: sparse:     expected restricted __le16 [usertype] data
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:153:25: sparse:     got unsigned short [usertype] data
>> drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:244:44: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le16 [usertype] bridge_port_id @@     got unsigned char [assigned] [usertype] i @@
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:244:44: sparse:     expected restricted __le16 [usertype] bridge_port_id
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:244:44: sparse:     got unsigned char [assigned] [usertype] i
>> drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:259:46: sparse: sparse: restricted __le16 degrades to integer
>> drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:269:48: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le16 @@     got unsigned long @@
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:269:48: sparse:     expected restricted __le16
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:269:48: sparse:     got unsigned long
>> drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:274:47: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le16 [addressable] [assigned] [usertype] bridge_id @@     got int bridge_id @@
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:274:47: sparse:     expected restricted __le16 [addressable] [assigned] [usertype] bridge_id
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:274:47: sparse:     got int bridge_id
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:282:64: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le16 @@     got unsigned long @@
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:282:64: sparse:     expected restricted __le16
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:282:64: sparse:     got unsigned long
>> drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:301:42: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le16 [usertype] bridge_port_id @@     got unsigned short [usertype] bridge_port_cpu @@
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:301:42: sparse:     expected restricted __le16 [usertype] bridge_port_id
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:301:42: sparse:     got unsigned short [usertype] bridge_port_cpu
>> drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:318:47: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le16 [assigned] [usertype] bridge_id @@     got int bridge_id @@
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:318:47: sparse:     expected restricted __le16 [assigned] [usertype] bridge_id
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:318:47: sparse:     got int bridge_id
>> drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:319:52: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le16 [assigned] [usertype] bridge_port_id @@     got unsigned short [usertype] bridge_port_cpu @@
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:319:52: sparse:     expected restricted __le16 [assigned] [usertype] bridge_port_id
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:319:52: sparse:     got unsigned short [usertype] bridge_port_cpu
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:320:56: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le16 @@     got unsigned long @@
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:320:56: sparse:     expected restricted __le16
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:320:56: sparse:     got unsigned long
>> drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:389:46: sparse: sparse: incorrect type in initializer (different base types) @@     expected restricted __le16 [usertype] number_of_ctp_port @@     got int @@
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:389:46: sparse:     expected restricted __le16 [usertype] number_of_ctp_port
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:389:46: sparse:     got int
>> drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:391:38: sparse: sparse: incorrect type in initializer (different base types) @@     expected restricted __le16 [usertype] first_ctp_port_id @@     got unsigned char [usertype] port @@
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:391:38: sparse:     expected restricted __le16 [usertype] first_ctp_port_id
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:391:38: sparse:     got unsigned char [usertype] port
>> drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:413:25: sparse: sparse: incorrect type in initializer (different base types) @@     expected restricted __le16 [usertype] addr @@     got int @@
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:413:25: sparse:     expected restricted __le16 [usertype] addr
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:413:25: sparse:     got int
>> drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:414:32: sparse: sparse: incorrect type in initializer (different base types) @@     expected restricted __le16 [usertype] data @@     got unsigned long @@
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:414:32: sparse:     expected restricted __le16 [usertype] data
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:414:32: sparse:     got unsigned long
>> drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:415:25: sparse: sparse: incorrect type in initializer (different base types) @@     expected restricted __le16 [usertype] mask @@     got unsigned long @@
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:415:25: sparse:     expected restricted __le16 [usertype] mask
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:415:25: sparse:     got unsigned long
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:418:25: sparse: sparse: incorrect type in initializer (different base types) @@     expected restricted __le16 [usertype] addr @@     got int @@
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:418:25: sparse:     expected restricted __le16 [usertype] addr
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:418:25: sparse:     got int
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:419:32: sparse: sparse: incorrect type in initializer (different base types) @@     expected restricted __le16 [usertype] data @@     got unsigned long @@
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:419:32: sparse:     expected restricted __le16 [usertype] data
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:419:32: sparse:     got unsigned long
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:420:25: sparse: sparse: incorrect type in initializer (different base types) @@     expected restricted __le16 [usertype] mask @@     got unsigned long @@
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:420:25: sparse:     expected restricted __le16 [usertype] mask
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:420:25: sparse:     got unsigned long
>> drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:542:41: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le16 [usertype] extended_vlan_block_id @@     got unsigned short [usertype] block_id @@
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:542:41: sparse:     expected restricted __le16 [usertype] extended_vlan_block_id
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:542:41: sparse:     got unsigned short [usertype] block_id
>> drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:543:30: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le16 [usertype] entry_index @@     got unsigned short [usertype] entry_idx @@
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:543:30: sparse:     expected restricted __le16 [usertype] entry_index
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:543:30: sparse:     got unsigned short [usertype] entry_idx
>> drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:577:46: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le16 [usertype] number_of_entries @@     got unsigned short [usertype] filters_max @@
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:577:46: sparse:     expected restricted __le16 [usertype] number_of_entries
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:577:46: sparse:     got unsigned short [usertype] filters_max
>> drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:583:38: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned short [usertype] block_id @@     got restricted __le16 [addressable] [usertype] extended_vlan_block_id @@
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:583:38: sparse:     expected unsigned short [usertype] block_id
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:583:38: sparse:     got restricted __le16 [addressable] [usertype] extended_vlan_block_id
>> drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:603:41: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le16 [addressable] [usertype] extended_vlan_block_id @@     got unsigned short [usertype] block_id @@
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:603:41: sparse:     expected restricted __le16 [addressable] [usertype] extended_vlan_block_id
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:603:41: sparse:     got unsigned short [usertype] block_id
>> drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:605:30: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le16 [addressable] [usertype] entry_index @@     got int @@
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:605:30: sparse:     expected restricted __le16 [addressable] [usertype] entry_index
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:605:30: sparse:     got int
>> drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:619:77: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned short [usertype] final_filters_idx @@     got restricted __le16 [addressable] [assigned] [usertype] entry_index @@
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:619:77: sparse:     expected unsigned short [usertype] final_filters_idx
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:619:77: sparse:     got restricted __le16 [addressable] [assigned] [usertype] entry_index
>> drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:623:41: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le16 [addressable] [assigned] [usertype] extended_vlan_block_id @@     got unsigned short [usertype] block_id @@
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:623:41: sparse:     expected restricted __le16 [addressable] [assigned] [usertype] extended_vlan_block_id
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:623:41: sparse:     got unsigned short [usertype] block_id
>> drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:625:30: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le16 [addressable] [assigned] [usertype] entry_index @@     got int @@
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:625:30: sparse:     expected restricted __le16 [addressable] [assigned] [usertype] entry_index
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:625:30: sparse:     got int
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:640:77: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned short [usertype] final_filters_idx @@     got restricted __le16 [addressable] [assigned] [usertype] entry_index @@
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:640:77: sparse:     expected unsigned short [usertype] final_filters_idx
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:640:77: sparse:     got restricted __le16 [addressable] [assigned] [usertype] entry_index
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:671:41: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le16 [addressable] [usertype] extended_vlan_block_id @@     got unsigned short [usertype] block_id @@
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:671:41: sparse:     expected restricted __le16 [addressable] [usertype] extended_vlan_block_id
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:671:41: sparse:     got unsigned short [usertype] block_id
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:674:30: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le16 [addressable] [usertype] entry_index @@     got int @@
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:674:30: sparse:     expected restricted __le16 [addressable] [usertype] entry_index
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:674:30: sparse:     got int
>> drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:682:44: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [addressable] [assigned] [usertype] vid_val @@     got unsigned short [usertype] vid @@
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:682:44: sparse:     expected restricted __le32 [addressable] [assigned] [usertype] vid_val
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:682:44: sparse:     got unsigned short [usertype] vid
>> drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:704:33: sparse: sparse: incorrect type in assignment (different base types) @@     expected signed short @@     got restricted __le16 [addressable] [assigned] [usertype] entry_index @@
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:704:33: sparse:     expected signed short
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:704:33: sparse:     got restricted __le16 [addressable] [assigned] [usertype] entry_index
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:712:41: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le16 [addressable] [assigned] [usertype] extended_vlan_block_id @@     got unsigned short [usertype] block_id @@
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:712:41: sparse:     expected restricted __le16 [addressable] [assigned] [usertype] extended_vlan_block_id
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:712:41: sparse:     got unsigned short [usertype] block_id
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:714:30: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le16 [addressable] [assigned] [usertype] entry_index @@     got int @@
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:714:30: sparse:     expected restricted __le16 [addressable] [assigned] [usertype] entry_index
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:714:30: sparse:     got int
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:729:77: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned short [usertype] final_filters_idx @@     got restricted __le16 [addressable] [assigned] [usertype] entry_index @@
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:729:77: sparse:     expected unsigned short [usertype] final_filters_idx
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:729:77: sparse:     got restricted __le16 [addressable] [assigned] [usertype] entry_index
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:733:41: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le16 [addressable] [assigned] [usertype] extended_vlan_block_id @@     got unsigned short [usertype] block_id @@
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:733:41: sparse:     expected restricted __le16 [addressable] [assigned] [usertype] extended_vlan_block_id
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:733:41: sparse:     got unsigned short [usertype] block_id
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:735:30: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le16 [addressable] [assigned] [usertype] entry_index @@     got int @@
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:735:30: sparse:     expected restricted __le16 [addressable] [assigned] [usertype] entry_index
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:735:30: sparse:     got int
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:750:77: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned short [usertype] final_filters_idx @@     got restricted __le16 [addressable] [assigned] [usertype] entry_index @@
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:750:77: sparse:     expected unsigned short [usertype] final_filters_idx
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:750:77: sparse:     got restricted __le16 [addressable] [assigned] [usertype] entry_index
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:754:41: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le16 [addressable] [assigned] [usertype] extended_vlan_block_id @@     got unsigned short [usertype] block_id @@
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:754:41: sparse:     expected restricted __le16 [addressable] [assigned] [usertype] extended_vlan_block_id
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:754:41: sparse:     got unsigned short [usertype] block_id
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:756:30: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le16 [addressable] [assigned] [usertype] entry_index @@     got int @@
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:756:30: sparse:     expected restricted __le16 [addressable] [assigned] [usertype] entry_index
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:756:30: sparse:     got int
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:771:77: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned short [usertype] final_filters_idx @@     got restricted __le16 [addressable] [assigned] [usertype] entry_index @@
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:771:77: sparse:     expected unsigned short [usertype] final_filters_idx
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:771:77: sparse:     got restricted __le16 [addressable] [assigned] [usertype] entry_index
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:805:41: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le16 [addressable] [usertype] extended_vlan_block_id @@     got unsigned short [usertype] block_id @@
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:805:41: sparse:     expected restricted __le16 [addressable] [usertype] extended_vlan_block_id
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:805:41: sparse:     got unsigned short [usertype] block_id
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:808:30: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le16 [addressable] [usertype] entry_index @@     got int @@
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:808:30: sparse:     expected restricted __le16 [addressable] [usertype] entry_index
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:808:30: sparse:     got int
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:816:44: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [addressable] [assigned] [usertype] vid_val @@     got unsigned short [usertype] vid @@
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:816:44: sparse:     expected restricted __le32 [addressable] [assigned] [usertype] vid_val
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:816:44: sparse:     got unsigned short [usertype] vid
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:831:33: sparse: sparse: incorrect type in assignment (different base types) @@     expected signed short @@     got restricted __le16 [addressable] [assigned] [usertype] entry_index @@
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:831:33: sparse:     expected signed short
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:831:33: sparse:     got restricted __le16 [addressable] [assigned] [usertype] entry_index
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:835:41: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le16 [addressable] [assigned] [usertype] extended_vlan_block_id @@     got unsigned short [usertype] block_id @@
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:835:41: sparse:     expected restricted __le16 [addressable] [assigned] [usertype] extended_vlan_block_id
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:835:41: sparse:     got unsigned short [usertype] block_id
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:838:30: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le16 [addressable] [assigned] [usertype] entry_index @@     got int @@
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:838:30: sparse:     expected restricted __le16 [addressable] [assigned] [usertype] entry_index
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:838:30: sparse:     got int
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:846:44: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [addressable] [assigned] [usertype] vid_val @@     got unsigned short [usertype] vid @@
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:846:44: sparse:     expected restricted __le32 [addressable] [assigned] [usertype] vid_val
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:846:44: sparse:     got unsigned short [usertype] vid
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:861:33: sparse: sparse: incorrect type in assignment (different base types) @@     expected signed short @@     got restricted __le16 [addressable] [assigned] [usertype] entry_index @@
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:861:33: sparse:     expected signed short
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:861:33: sparse:     got restricted __le16 [addressable] [assigned] [usertype] entry_index
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:887:41: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le16 [addressable] [usertype] extended_vlan_block_id @@     got unsigned short [usertype] block_id @@
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:887:41: sparse:     expected restricted __le16 [addressable] [usertype] extended_vlan_block_id
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:887:41: sparse:     got unsigned short [usertype] block_id
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:890:30: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le16 [addressable] [usertype] entry_index @@     got int @@
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:890:30: sparse:     expected restricted __le16 [addressable] [usertype] entry_index
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:890:30: sparse:     got int
>> drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:903:47: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [addressable] [assigned] [usertype] vid_val @@     got unsigned short @@
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:903:47: sparse:     expected restricted __le32 [addressable] [assigned] [usertype] vid_val
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:903:47: sparse:     got unsigned short
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:913:39: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned short [usertype] final_filters_idx @@     got restricted __le16 [addressable] [assigned] [usertype] entry_index @@
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:913:39: sparse:     expected unsigned short [usertype] final_filters_idx
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:913:39: sparse:     got restricted __le16 [addressable] [assigned] [usertype] entry_index
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:918:41: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le16 [addressable] [assigned] [usertype] extended_vlan_block_id @@     got unsigned short [usertype] block_id @@
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:918:41: sparse:     expected restricted __le16 [addressable] [assigned] [usertype] extended_vlan_block_id
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:918:41: sparse:     got unsigned short [usertype] block_id
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:919:30: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le16 [addressable] [assigned] [usertype] entry_index @@     got int @@
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:919:30: sparse:     expected restricted __le16 [addressable] [assigned] [usertype] entry_index
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:919:30: sparse:     got int
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:932:47: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [addressable] [assigned] [usertype] vid_val @@     got unsigned short @@
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:932:47: sparse:     expected restricted __le32 [addressable] [assigned] [usertype] vid_val
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:932:47: sparse:     got unsigned short
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:942:39: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned short [usertype] final_filters_idx @@     got restricted __le16 [addressable] [assigned] [usertype] entry_index @@
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:942:39: sparse:     expected unsigned short [usertype] final_filters_idx
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:942:39: sparse:     got restricted __le16 [addressable] [assigned] [usertype] entry_index
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:946:41: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le16 [addressable] [assigned] [usertype] extended_vlan_block_id @@     got unsigned short [usertype] block_id @@
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:946:41: sparse:     expected restricted __le16 [addressable] [assigned] [usertype] extended_vlan_block_id
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:946:41: sparse:     got unsigned short [usertype] block_id
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:947:30: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le16 [addressable] [assigned] [usertype] entry_index @@     got int @@
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:947:30: sparse:     expected restricted __le16 [addressable] [assigned] [usertype] entry_index
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:947:30: sparse:     got int
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:960:47: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [addressable] [assigned] [usertype] vid_val @@     got unsigned short @@
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:960:47: sparse:     expected restricted __le32 [addressable] [assigned] [usertype] vid_val
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:960:47: sparse:     got unsigned short
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:970:39: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned short [usertype] final_filters_idx @@     got restricted __le16 [addressable] [assigned] [usertype] entry_index @@
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:970:39: sparse:     expected unsigned short [usertype] final_filters_idx
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:970:39: sparse:     got restricted __le16 [addressable] [assigned] [usertype] entry_index
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:995:41: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le16 [addressable] [usertype] extended_vlan_block_id @@     got unsigned short [usertype] block_id @@
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:995:41: sparse:     expected restricted __le16 [addressable] [usertype] extended_vlan_block_id
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:995:41: sparse:     got unsigned short [usertype] block_id
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:1013:55: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [addressable] [assigned] [usertype] vid_val @@     got unsigned short @@
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:1013:55: sparse:     expected restricted __le32 [addressable] [assigned] [usertype] vid_val
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:1013:55: sparse:     got unsigned short
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:1017:55: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [addressable] [assigned] [usertype] vid_val @@     got unsigned short [usertype] pvid @@
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:1017:55: sparse:     expected restricted __le32 [addressable] [assigned] [usertype] vid_val
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:1017:55: sparse:     got unsigned short [usertype] pvid
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:1036:55: sparse: sparse: incorrect type in assignment (different base types) @@     expected signed short @@     got restricted __le16 [addressable] [assigned] [usertype] entry_index @@
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:1036:55: sparse:     expected signed short
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:1036:55: sparse:     got restricted __le16 [addressable] [assigned] [usertype] entry_index
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:1054:38: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le16 [addressable] [assigned] [usertype] entry_index @@     got int @@
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:1054:38: sparse:     expected restricted __le16 [addressable] [assigned] [usertype] entry_index
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:1054:38: sparse:     got int
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:1067:55: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [addressable] [assigned] [usertype] vid_val @@     got unsigned short @@
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:1067:55: sparse:     expected restricted __le32 [addressable] [assigned] [usertype] vid_val
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:1067:55: sparse:     got unsigned short
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:1077:47: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned short [usertype] final_filters_idx @@     got restricted __le16 [addressable] [assigned] [usertype] entry_index @@
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:1077:47: sparse:     expected unsigned short [usertype] final_filters_idx
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:1077:47: sparse:     got restricted __le16 [addressable] [assigned] [usertype] entry_index
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:1083:41: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le16 [addressable] [assigned] [usertype] extended_vlan_block_id @@     got unsigned short [usertype] block_id @@
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:1083:41: sparse:     expected restricted __le16 [addressable] [assigned] [usertype] extended_vlan_block_id
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:1083:41: sparse:     got unsigned short [usertype] block_id
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:1084:30: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le16 [addressable] [assigned] [usertype] entry_index @@     got int @@
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:1084:30: sparse:     expected restricted __le16 [addressable] [assigned] [usertype] entry_index
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:1084:30: sparse:     got int
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:1097:47: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [addressable] [assigned] [usertype] vid_val @@     got unsigned short @@
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:1097:47: sparse:     expected restricted __le32 [addressable] [assigned] [usertype] vid_val
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:1097:47: sparse:     got unsigned short
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:1107:39: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned short [usertype] final_filters_idx @@     got restricted __le16 [addressable] [assigned] [usertype] entry_index @@
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:1107:39: sparse:     expected unsigned short [usertype] final_filters_idx
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:1107:39: sparse:     got restricted __le16 [addressable] [assigned] [usertype] entry_index
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:1111:41: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le16 [addressable] [assigned] [usertype] extended_vlan_block_id @@     got unsigned short [usertype] block_id @@
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:1111:41: sparse:     expected restricted __le16 [addressable] [assigned] [usertype] extended_vlan_block_id
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:1111:41: sparse:     got unsigned short [usertype] block_id
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:1112:30: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le16 [addressable] [assigned] [usertype] entry_index @@     got int @@
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:1112:30: sparse:     expected restricted __le16 [addressable] [assigned] [usertype] entry_index
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:1112:30: sparse:     got int
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:1125:47: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [addressable] [assigned] [usertype] vid_val @@     got unsigned short @@
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:1125:47: sparse:     expected restricted __le32 [addressable] [assigned] [usertype] vid_val
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:1125:47: sparse:     got unsigned short
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:1135:39: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned short [usertype] final_filters_idx @@     got restricted __le16 [addressable] [assigned] [usertype] entry_index @@
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:1135:39: sparse:     expected unsigned short [usertype] final_filters_idx
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:1135:39: sparse:     got restricted __le16 [addressable] [assigned] [usertype] entry_index
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:1154:41: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le16 [addressable] [usertype] extended_vlan_block_id @@     got unsigned short [usertype] block_id @@
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:1154:41: sparse:     expected restricted __le16 [addressable] [usertype] extended_vlan_block_id
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:1154:41: sparse:     got unsigned short [usertype] block_id
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:1158:38: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le16 [addressable] [usertype] entry_index @@     got int @@
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:1158:38: sparse:     expected restricted __le16 [addressable] [usertype] entry_index
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:1158:38: sparse:     got int
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:1161:38: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le16 [addressable] [usertype] entry_index @@     got int @@
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:1161:38: sparse:     expected restricted __le16 [addressable] [usertype] entry_index
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:1161:38: sparse:     got int
>> drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:1162:86: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned short [usertype] final_filters_idx @@     got restricted __le16 [addressable] [usertype] entry_index @@
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:1162:86: sparse:     expected unsigned short [usertype] final_filters_idx
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:1162:86: sparse:     got restricted __le16 [addressable] [usertype] entry_index
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:1171:55: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [addressable] [assigned] [usertype] vid_val @@     got unsigned short [usertype] pvid @@
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:1171:55: sparse:     expected restricted __le32 [addressable] [assigned] [usertype] vid_val
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:1171:55: sparse:     got unsigned short [usertype] pvid
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:1250:41: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le16 [addressable] [usertype] extended_vlan_block_id @@     got unsigned short [usertype] block_id @@
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:1250:41: sparse:     expected restricted __le16 [addressable] [usertype] extended_vlan_block_id
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:1250:41: sparse:     got unsigned short [usertype] block_id
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:1251:30: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le16 [addressable] [usertype] entry_index @@     got int @@
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:1251:30: sparse:     expected restricted __le16 [addressable] [usertype] entry_index
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:1251:30: sparse:     got int
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:1261:39: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned short [usertype] final_filters_idx @@     got restricted __le16 [addressable] [assigned] [usertype] entry_index @@
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:1261:39: sparse:     expected unsigned short [usertype] final_filters_idx
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:1261:39: sparse:     got restricted __le16 [addressable] [assigned] [usertype] entry_index
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:1265:41: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le16 [addressable] [assigned] [usertype] extended_vlan_block_id @@     got unsigned short [usertype] block_id @@
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:1265:41: sparse:     expected restricted __le16 [addressable] [assigned] [usertype] extended_vlan_block_id
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:1265:41: sparse:     got unsigned short [usertype] block_id
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:1266:30: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le16 [addressable] [assigned] [usertype] entry_index @@     got int @@
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:1266:30: sparse:     expected restricted __le16 [addressable] [assigned] [usertype] entry_index
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:1266:30: sparse:     got int
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:1276:39: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned short [usertype] final_filters_idx @@     got restricted __le16 [addressable] [assigned] [usertype] entry_index @@
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:1276:39: sparse:     expected unsigned short [usertype] final_filters_idx
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:1276:39: sparse:     got restricted __le16 [addressable] [assigned] [usertype] entry_index
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:1280:41: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le16 [addressable] [assigned] [usertype] extended_vlan_block_id @@     got unsigned short [usertype] block_id @@
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:1280:41: sparse:     expected restricted __le16 [addressable] [assigned] [usertype] extended_vlan_block_id
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:1280:41: sparse:     got unsigned short [usertype] block_id
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:1281:30: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le16 [addressable] [assigned] [usertype] entry_index @@     got int @@
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:1281:30: sparse:     expected restricted __le16 [addressable] [assigned] [usertype] entry_index
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:1281:30: sparse:     got int
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:1291:39: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned short [usertype] final_filters_idx @@     got restricted __le16 [addressable] [assigned] [usertype] entry_index @@
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:1291:39: sparse:     expected unsigned short [usertype] final_filters_idx
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:1291:39: sparse:     got restricted __le16 [addressable] [assigned] [usertype] entry_index
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:1301:41: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le16 [addressable] [assigned] [usertype] extended_vlan_block_id @@     got unsigned short [usertype] block_id @@
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:1301:41: sparse:     expected restricted __le16 [addressable] [assigned] [usertype] extended_vlan_block_id
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:1301:41: sparse:     got unsigned short [usertype] block_id
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:1303:30: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le16 [addressable] [assigned] [usertype] entry_index @@     got int @@
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:1303:30: sparse:     expected restricted __le16 [addressable] [assigned] [usertype] entry_index
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:1303:30: sparse:     got int
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:1307:44: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [addressable] [assigned] [usertype] vid_val @@     got unsigned short [usertype] vid @@
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:1307:44: sparse:     expected restricted __le32 [addressable] [assigned] [usertype] vid_val
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:1307:44: sparse:     got unsigned short [usertype] vid
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:1322:47: sparse: sparse: incorrect type in assignment (different base types) @@     expected signed short @@     got restricted __le16 [addressable] [assigned] [usertype] entry_index @@
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:1322:47: sparse:     expected signed short
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:1322:47: sparse:     got restricted __le16 [addressable] [assigned] [usertype] entry_index
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:1326:41: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le16 [addressable] [assigned] [usertype] extended_vlan_block_id @@     got unsigned short [usertype] block_id @@
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:1326:41: sparse:     expected restricted __le16 [addressable] [assigned] [usertype] extended_vlan_block_id
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:1326:41: sparse:     got unsigned short [usertype] block_id
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:1328:30: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le16 [addressable] [assigned] [usertype] entry_index @@     got int @@
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:1328:30: sparse:     expected restricted __le16 [addressable] [assigned] [usertype] entry_index
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:1328:30: sparse:     got int
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:1332:44: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [addressable] [assigned] [usertype] vid_val @@     got unsigned short [usertype] vid @@
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:1332:44: sparse:     expected restricted __le32 [addressable] [assigned] [usertype] vid_val
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:1332:44: sparse:     got unsigned short [usertype] vid
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:1346:47: sparse: sparse: incorrect type in assignment (different base types) @@     expected signed short @@     got restricted __le16 [addressable] [assigned] [usertype] entry_index @@
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:1346:47: sparse:     expected signed short
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:1346:47: sparse:     got restricted __le16 [addressable] [assigned] [usertype] entry_index
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:1378:49: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le16 [addressable] [usertype] extended_vlan_block_id @@     got unsigned short [usertype] block_id @@
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:1378:49: sparse:     expected restricted __le16 [addressable] [usertype] extended_vlan_block_id
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:1378:49: sparse:     got unsigned short [usertype] block_id
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:1380:33: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le16 [addressable] [usertype] entry_index @@     got int @@
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:1380:33: sparse:     expected restricted __le16 [addressable] [usertype] entry_index
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:1380:33: sparse:     got int
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:1395:85: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned short [usertype] final_filters_idx @@     got restricted __le16 [addressable] [assigned] [usertype] entry_index @@
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:1395:85: sparse:     expected unsigned short [usertype] final_filters_idx
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:1395:85: sparse:     got restricted __le16 [addressable] [assigned] [usertype] entry_index
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:1401:41: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le16 [addressable] [assigned] [usertype] extended_vlan_block_id @@     got unsigned short [usertype] block_id @@
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:1401:41: sparse:     expected restricted __le16 [addressable] [assigned] [usertype] extended_vlan_block_id
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:1401:41: sparse:     got unsigned short [usertype] block_id
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:1403:30: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le16 [addressable] [assigned] [usertype] entry_index @@     got int @@
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:1403:30: sparse:     expected restricted __le16 [addressable] [assigned] [usertype] entry_index
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:1403:30: sparse:     got int
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:1417:77: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned short [usertype] final_filters_idx @@     got restricted __le16 [addressable] [assigned] [usertype] entry_index @@
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:1417:77: sparse:     expected unsigned short [usertype] final_filters_idx
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:1417:77: sparse:     got restricted __le16 [addressable] [assigned] [usertype] entry_index
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:1421:41: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le16 [addressable] [assigned] [usertype] extended_vlan_block_id @@     got unsigned short [usertype] block_id @@
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:1421:41: sparse:     expected restricted __le16 [addressable] [assigned] [usertype] extended_vlan_block_id
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:1421:41: sparse:     got unsigned short [usertype] block_id
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:1423:30: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le16 [addressable] [assigned] [usertype] entry_index @@     got int @@
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:1423:30: sparse:     expected restricted __le16 [addressable] [assigned] [usertype] entry_index
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:1423:30: sparse:     got int
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:1438:77: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned short [usertype] final_filters_idx @@     got restricted __le16 [addressable] [assigned] [usertype] entry_index @@
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:1438:77: sparse:     expected unsigned short [usertype] final_filters_idx
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:1438:77: sparse:     got restricted __le16 [addressable] [assigned] [usertype] entry_index
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:1455:41: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le16 [addressable] [assigned] [usertype] extended_vlan_block_id @@     got unsigned short [usertype] block_id @@
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:1455:41: sparse:     expected restricted __le16 [addressable] [assigned] [usertype] extended_vlan_block_id
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:1455:41: sparse:     got unsigned short [usertype] block_id
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:1458:30: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le16 [addressable] [assigned] [usertype] entry_index @@     got int @@
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:1458:30: sparse:     expected restricted __le16 [addressable] [assigned] [usertype] entry_index
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:1458:30: sparse:     got int
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:1466:44: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [addressable] [assigned] [usertype] vid_val @@     got unsigned short [usertype] vid @@
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:1466:44: sparse:     expected restricted __le32 [addressable] [assigned] [usertype] vid_val
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:1466:44: sparse:     got unsigned short [usertype] vid
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:1488:33: sparse: sparse: incorrect type in assignment (different base types) @@     expected signed short @@     got restricted __le16 [addressable] [assigned] [usertype] entry_index @@
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:1488:33: sparse:     expected signed short
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:1488:33: sparse:     got restricted __le16 [addressable] [assigned] [usertype] entry_index
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:1518:41: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le16 [addressable] [usertype] extended_vlan_block_id @@     got unsigned short [usertype] block_id @@
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:1518:41: sparse:     expected restricted __le16 [addressable] [usertype] extended_vlan_block_id
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:1518:41: sparse:     got unsigned short [usertype] block_id
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:1520:30: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le16 [addressable] [usertype] entry_index @@     got int @@
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:1520:30: sparse:     expected restricted __le16 [addressable] [usertype] entry_index
--
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:1586:41: sparse:     got unsigned short [usertype] block_id
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:1589:30: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le16 [addressable] [usertype] entry_index @@     got int @@
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:1589:30: sparse:     expected restricted __le16 [addressable] [usertype] entry_index
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:1589:30: sparse:     got int
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:1598:44: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [addressable] [assigned] [usertype] vid_val @@     got unsigned short [usertype] vid @@
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:1598:44: sparse:     expected restricted __le32 [addressable] [assigned] [usertype] vid_val
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:1598:44: sparse:     got unsigned short [usertype] vid
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:1624:33: sparse: sparse: incorrect type in assignment (different base types) @@     expected signed short @@     got restricted __le16 [addressable] [assigned] [usertype] entry_index @@
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:1624:33: sparse:     expected signed short
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:1624:33: sparse:     got restricted __le16 [addressable] [assigned] [usertype] entry_index
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:1662:41: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le16 [addressable] [usertype] extended_vlan_block_id @@     got unsigned short [usertype] block_id @@
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:1662:41: sparse:     expected restricted __le16 [addressable] [usertype] extended_vlan_block_id
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:1662:41: sparse:     got unsigned short [usertype] block_id
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:1664:30: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le16 [addressable] [usertype] entry_index @@     got int @@
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:1664:30: sparse:     expected restricted __le16 [addressable] [usertype] entry_index
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:1664:30: sparse:     got int
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:1675:78: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned short [usertype] final_filters_idx @@     got restricted __le16 [addressable] [assigned] [usertype] entry_index @@
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:1675:78: sparse:     expected unsigned short [usertype] final_filters_idx
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:1675:78: sparse:     got restricted __le16 [addressable] [assigned] [usertype] entry_index
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:1679:41: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le16 [addressable] [assigned] [usertype] extended_vlan_block_id @@     got unsigned short [usertype] block_id @@
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:1679:41: sparse:     expected restricted __le16 [addressable] [assigned] [usertype] extended_vlan_block_id
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:1679:41: sparse:     got unsigned short [usertype] block_id
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:1681:30: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le16 [addressable] [assigned] [usertype] entry_index @@     got int @@
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:1681:30: sparse:     expected restricted __le16 [addressable] [assigned] [usertype] entry_index
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:1681:30: sparse:     got int
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:1692:78: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned short [usertype] final_filters_idx @@     got restricted __le16 [addressable] [assigned] [usertype] entry_index @@
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:1692:78: sparse:     expected unsigned short [usertype] final_filters_idx
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:1692:78: sparse:     got restricted __le16 [addressable] [assigned] [usertype] entry_index
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:1696:41: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le16 [addressable] [assigned] [usertype] extended_vlan_block_id @@     got unsigned short [usertype] block_id @@
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:1696:41: sparse:     expected restricted __le16 [addressable] [assigned] [usertype] extended_vlan_block_id
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:1696:41: sparse:     got unsigned short [usertype] block_id
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:1698:30: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le16 [addressable] [assigned] [usertype] entry_index @@     got int @@
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:1698:30: sparse:     expected restricted __le16 [addressable] [assigned] [usertype] entry_index
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:1698:30: sparse:     got int
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:1715:55: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [addressable] [assigned] [usertype] vid_val @@     got unsigned short @@
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:1715:55: sparse:     expected restricted __le32 [addressable] [assigned] [usertype] vid_val
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:1715:55: sparse:     got unsigned short
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:1719:55: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [addressable] [assigned] [usertype] vid_val @@     got unsigned short [usertype] pvid @@
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:1719:55: sparse:     expected restricted __le32 [addressable] [assigned] [usertype] vid_val
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:1719:55: sparse:     got unsigned short [usertype] pvid
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:1739:78: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned short [usertype] final_filters_idx @@     got restricted __le16 [addressable] [assigned] [usertype] entry_index @@
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:1739:78: sparse:     expected unsigned short [usertype] final_filters_idx
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:1739:78: sparse:     got restricted __le16 [addressable] [assigned] [usertype] entry_index
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:1744:41: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le16 [addressable] [assigned] [usertype] extended_vlan_block_id @@     got unsigned short [usertype] block_id @@
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:1744:41: sparse:     expected restricted __le16 [addressable] [assigned] [usertype] extended_vlan_block_id
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:1744:41: sparse:     got unsigned short [usertype] block_id
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:1746:30: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le16 [addressable] [assigned] [usertype] entry_index @@     got int @@
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:1746:30: sparse:     expected restricted __le16 [addressable] [assigned] [usertype] entry_index
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:1746:30: sparse:     got int
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:1761:78: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned short [usertype] final_filters_idx @@     got restricted __le16 [addressable] [assigned] [usertype] entry_index @@
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:1761:78: sparse:     expected unsigned short [usertype] final_filters_idx
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:1761:78: sparse:     got restricted __le16 [addressable] [assigned] [usertype] entry_index
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:1766:41: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le16 [addressable] [assigned] [usertype] extended_vlan_block_id @@     got unsigned short [usertype] block_id @@
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:1766:41: sparse:     expected restricted __le16 [addressable] [assigned] [usertype] extended_vlan_block_id
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:1766:41: sparse:     got unsigned short [usertype] block_id
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:1768:30: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le16 [addressable] [assigned] [usertype] entry_index @@     got int @@
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:1768:30: sparse:     expected restricted __le16 [addressable] [assigned] [usertype] entry_index
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:1768:30: sparse:     got int
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:1784:78: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned short [usertype] final_filters_idx @@     got restricted __le16 [addressable] [assigned] [usertype] entry_index @@
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:1784:78: sparse:     expected unsigned short [usertype] final_filters_idx
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:1784:78: sparse:     got restricted __le16 [addressable] [assigned] [usertype] entry_index
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:1799:41: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le16 [addressable] [assigned] [usertype] extended_vlan_block_id @@     got unsigned short [usertype] block_id @@
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:1799:41: sparse:     expected restricted __le16 [addressable] [assigned] [usertype] extended_vlan_block_id
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:1799:41: sparse:     got unsigned short [usertype] block_id
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:1802:30: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le16 [addressable] [assigned] [usertype] entry_index @@     got int @@
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:1802:30: sparse:     expected restricted __le16 [addressable] [assigned] [usertype] entry_index
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:1802:30: sparse:     got int
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:1809:44: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [addressable] [assigned] [usertype] vid_val @@     got unsigned short [usertype] vid @@
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:1809:44: sparse:     expected restricted __le32 [addressable] [assigned] [usertype] vid_val
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:1809:44: sparse:     got unsigned short [usertype] vid
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:1813:47: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [addressable] [assigned] [usertype] vid_val @@     got unsigned short @@
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:1813:47: sparse:     expected restricted __le32 [addressable] [assigned] [usertype] vid_val
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:1813:47: sparse:     got unsigned short
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:1831:33: sparse: sparse: incorrect type in assignment (different base types) @@     expected signed short @@     got restricted __le16 [addressable] [assigned] [usertype] entry_index @@
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:1831:33: sparse:     expected signed short
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:1831:33: sparse:     got restricted __le16 [addressable] [assigned] [usertype] entry_index
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:1835:41: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le16 [addressable] [assigned] [usertype] extended_vlan_block_id @@     got unsigned short [usertype] block_id @@
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:1835:41: sparse:     expected restricted __le16 [addressable] [assigned] [usertype] extended_vlan_block_id
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:1835:41: sparse:     got unsigned short [usertype] block_id
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:1838:30: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le16 [addressable] [assigned] [usertype] entry_index @@     got int @@
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:1838:30: sparse:     expected restricted __le16 [addressable] [assigned] [usertype] entry_index
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:1838:30: sparse:     got int
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:1845:44: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [addressable] [assigned] [usertype] vid_val @@     got unsigned short [usertype] vid @@
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:1845:44: sparse:     expected restricted __le32 [addressable] [assigned] [usertype] vid_val
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:1845:44: sparse:     got unsigned short [usertype] vid
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:1849:47: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [addressable] [assigned] [usertype] vid_val @@     got unsigned short @@
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:1849:47: sparse:     expected restricted __le32 [addressable] [assigned] [usertype] vid_val
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:1849:47: sparse:     got unsigned short
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:1867:33: sparse: sparse: incorrect type in assignment (different base types) @@     expected signed short @@     got restricted __le16 [addressable] [assigned] [usertype] entry_index @@
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:1867:33: sparse:     expected signed short
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:1867:33: sparse:     got restricted __le16 [addressable] [assigned] [usertype] entry_index
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:1907:41: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le16 [addressable] [usertype] extended_vlan_block_id @@     got unsigned short [usertype] block_id @@
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:1907:41: sparse:     expected restricted __le16 [addressable] [usertype] extended_vlan_block_id
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:1907:41: sparse:     got unsigned short [usertype] block_id
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:1910:30: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le16 [addressable] [usertype] entry_index @@     got int @@
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:1910:30: sparse:     expected restricted __le16 [addressable] [usertype] entry_index
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:1910:30: sparse:     got int
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:1917:44: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [addressable] [assigned] [usertype] vid_val @@     got unsigned short [usertype] vid @@
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:1917:44: sparse:     expected restricted __le32 [addressable] [assigned] [usertype] vid_val
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:1917:44: sparse:     got unsigned short [usertype] vid
>> drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:1920:47: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le16 [addressable] [assigned] [usertype] new_bridge_port_id @@     got unsigned short [usertype] bridge_port_cpu @@
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:1920:47: sparse:     expected restricted __le16 [addressable] [assigned] [usertype] new_bridge_port_id
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:1920:47: sparse:     got unsigned short [usertype] bridge_port_cpu
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:1934:33: sparse: sparse: incorrect type in assignment (different base types) @@     expected signed short @@     got restricted __le16 [addressable] [assigned] [usertype] entry_index @@
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:1934:33: sparse:     expected signed short
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:1934:33: sparse:     got restricted __le16 [addressable] [assigned] [usertype] entry_index
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:1938:41: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le16 [addressable] [assigned] [usertype] extended_vlan_block_id @@     got unsigned short [usertype] block_id @@
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:1938:41: sparse:     expected restricted __le16 [addressable] [assigned] [usertype] extended_vlan_block_id
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:1938:41: sparse:     got unsigned short [usertype] block_id
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:1941:30: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le16 [addressable] [assigned] [usertype] entry_index @@     got int @@
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:1941:30: sparse:     expected restricted __le16 [addressable] [assigned] [usertype] entry_index
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:1941:30: sparse:     got int
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:1948:44: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [addressable] [assigned] [usertype] vid_val @@     got unsigned short [usertype] vid @@
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:1948:44: sparse:     expected restricted __le32 [addressable] [assigned] [usertype] vid_val
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:1948:44: sparse:     got unsigned short [usertype] vid
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:1951:47: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le16 [addressable] [assigned] [usertype] new_bridge_port_id @@     got unsigned short [usertype] bridge_port_cpu @@
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:1951:47: sparse:     expected restricted __le16 [addressable] [assigned] [usertype] new_bridge_port_id
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:1951:47: sparse:     got unsigned short [usertype] bridge_port_cpu
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:1965:33: sparse: sparse: incorrect type in assignment (different base types) @@     expected signed short @@     got restricted __le16 [addressable] [assigned] [usertype] entry_index @@
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:1965:33: sparse:     expected signed short
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:1965:33: sparse:     got restricted __le16 [addressable] [assigned] [usertype] entry_index
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:1995:41: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le16 [addressable] [usertype] extended_vlan_block_id @@     got unsigned short [usertype] block_id @@
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:1995:41: sparse:     expected restricted __le16 [addressable] [usertype] extended_vlan_block_id
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:1995:41: sparse:     got unsigned short [usertype] block_id
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:1997:30: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le16 [addressable] [usertype] entry_index @@     got int @@
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:1997:30: sparse:     expected restricted __le16 [addressable] [usertype] entry_index
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:1997:30: sparse:     got int
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:2013:78: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned short [usertype] final_filters_idx @@     got restricted __le16 [addressable] [assigned] [usertype] entry_index @@
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:2013:78: sparse:     expected unsigned short [usertype] final_filters_idx
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:2013:78: sparse:     got restricted __le16 [addressable] [assigned] [usertype] entry_index
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:2017:41: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le16 [addressable] [assigned] [usertype] extended_vlan_block_id @@     got unsigned short [usertype] block_id @@
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:2017:41: sparse:     expected restricted __le16 [addressable] [assigned] [usertype] extended_vlan_block_id
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:2017:41: sparse:     got unsigned short [usertype] block_id
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:2019:30: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le16 [addressable] [assigned] [usertype] entry_index @@     got int @@
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:2019:30: sparse:     expected restricted __le16 [addressable] [assigned] [usertype] entry_index
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:2019:30: sparse:     got int
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:2035:78: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned short [usertype] final_filters_idx @@     got restricted __le16 [addressable] [assigned] [usertype] entry_index @@
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:2035:78: sparse:     expected unsigned short [usertype] final_filters_idx
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:2035:78: sparse:     got restricted __le16 [addressable] [assigned] [usertype] entry_index
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:2039:41: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le16 [addressable] [assigned] [usertype] extended_vlan_block_id @@     got unsigned short [usertype] block_id @@
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:2039:41: sparse:     expected restricted __le16 [addressable] [assigned] [usertype] extended_vlan_block_id
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:2039:41: sparse:     got unsigned short [usertype] block_id
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:2041:30: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le16 [addressable] [assigned] [usertype] entry_index @@     got int @@
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:2041:30: sparse:     expected restricted __le16 [addressable] [assigned] [usertype] entry_index
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:2041:30: sparse:     got int
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:2058:55: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [addressable] [assigned] [usertype] vid_val @@     got unsigned short [usertype] pvid @@
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:2058:55: sparse:     expected restricted __le32 [addressable] [assigned] [usertype] vid_val
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:2058:55: sparse:     got unsigned short [usertype] pvid
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:2066:78: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned short [usertype] final_filters_idx @@     got restricted __le16 [addressable] [assigned] [usertype] entry_index @@
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:2066:78: sparse:     expected unsigned short [usertype] final_filters_idx
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:2066:78: sparse:     got restricted __le16 [addressable] [assigned] [usertype] entry_index
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:2070:41: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le16 [addressable] [assigned] [usertype] extended_vlan_block_id @@     got unsigned short [usertype] block_id @@
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:2070:41: sparse:     expected restricted __le16 [addressable] [assigned] [usertype] extended_vlan_block_id
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:2070:41: sparse:     got unsigned short [usertype] block_id
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:2072:30: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le16 [addressable] [assigned] [usertype] entry_index @@     got int @@
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:2072:30: sparse:     expected restricted __le16 [addressable] [assigned] [usertype] entry_index
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:2072:30: sparse:     got int
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:2082:78: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned short [usertype] final_filters_idx @@     got restricted __le16 [addressable] [assigned] [usertype] entry_index @@
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:2082:78: sparse:     expected unsigned short [usertype] final_filters_idx
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:2082:78: sparse:     got restricted __le16 [addressable] [assigned] [usertype] entry_index
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:2086:41: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le16 [addressable] [assigned] [usertype] extended_vlan_block_id @@     got unsigned short [usertype] block_id @@
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:2086:41: sparse:     expected restricted __le16 [addressable] [assigned] [usertype] extended_vlan_block_id
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:2086:41: sparse:     got unsigned short [usertype] block_id
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:2088:30: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le16 [addressable] [assigned] [usertype] entry_index @@     got int @@
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:2088:30: sparse:     expected restricted __le16 [addressable] [assigned] [usertype] entry_index
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:2088:30: sparse:     got int
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:2098:78: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned short [usertype] final_filters_idx @@     got restricted __le16 [addressable] [assigned] [usertype] entry_index @@
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:2098:78: sparse:     expected unsigned short [usertype] final_filters_idx
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:2098:78: sparse:     got restricted __le16 [addressable] [assigned] [usertype] entry_index
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:2109:41: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le16 [addressable] [assigned] [usertype] extended_vlan_block_id @@     got unsigned short [usertype] block_id @@
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:2109:41: sparse:     expected restricted __le16 [addressable] [assigned] [usertype] extended_vlan_block_id
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:2109:41: sparse:     got unsigned short [usertype] block_id
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:2112:30: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le16 [addressable] [assigned] [usertype] entry_index @@     got int @@
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:2112:30: sparse:     expected restricted __le16 [addressable] [assigned] [usertype] entry_index
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:2112:30: sparse:     got int
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:2119:44: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [addressable] [assigned] [usertype] vid_val @@     got unsigned short [usertype] vid @@
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:2119:44: sparse:     expected restricted __le32 [addressable] [assigned] [usertype] vid_val
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:2119:44: sparse:     got unsigned short [usertype] vid
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:2131:33: sparse: sparse: incorrect type in assignment (different base types) @@     expected signed short @@     got restricted __le16 [addressable] [assigned] [usertype] entry_index @@
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:2131:33: sparse:     expected signed short
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:2131:33: sparse:     got restricted __le16 [addressable] [assigned] [usertype] entry_index
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:2135:41: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le16 [addressable] [assigned] [usertype] extended_vlan_block_id @@     got unsigned short [usertype] block_id @@
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:2135:41: sparse:     expected restricted __le16 [addressable] [assigned] [usertype] extended_vlan_block_id
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:2135:41: sparse:     got unsigned short [usertype] block_id
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:2138:30: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le16 [addressable] [assigned] [usertype] entry_index @@     got int @@
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:2138:30: sparse:     expected restricted __le16 [addressable] [assigned] [usertype] entry_index
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:2138:30: sparse:     got int
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:2145:44: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [addressable] [assigned] [usertype] vid_val @@     got unsigned short [usertype] vid @@
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:2145:44: sparse:     expected restricted __le32 [addressable] [assigned] [usertype] vid_val
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:2145:44: sparse:     got unsigned short [usertype] vid
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:2157:33: sparse: sparse: incorrect type in assignment (different base types) @@     expected signed short @@     got restricted __le16 [addressable] [assigned] [usertype] entry_index @@
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:2157:33: sparse:     expected signed short
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:2157:33: sparse:     got restricted __le16 [addressable] [assigned] [usertype] entry_index
>> drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:2333:65: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le16 [assigned] [usertype] egress_extended_vlan_block_id @@     got unsigned short [usertype] block_id @@
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:2333:65: sparse:     expected restricted __le16 [assigned] [usertype] egress_extended_vlan_block_id
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:2333:65: sparse:     got unsigned short [usertype] block_id
>> drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:2336:66: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le16 [assigned] [usertype] ingress_extended_vlan_block_id @@     got unsigned short [usertype] block_id @@
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:2336:66: sparse:     expected restricted __le16 [assigned] [usertype] ingress_extended_vlan_block_id
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:2336:66: sparse:     got unsigned short [usertype] block_id
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:2399:65: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le16 [assigned] [usertype] egress_extended_vlan_block_id @@     got unsigned short [usertype] block_id @@
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:2399:65: sparse:     expected restricted __le16 [assigned] [usertype] egress_extended_vlan_block_id
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:2399:65: sparse:     got unsigned short [usertype] block_id
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:2402:66: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le16 [assigned] [usertype] ingress_extended_vlan_block_id @@     got unsigned short [usertype] block_id @@
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:2402:66: sparse:     expected restricted __le16 [assigned] [usertype] ingress_extended_vlan_block_id
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:2402:66: sparse:     got unsigned short [usertype] block_id
>> drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:2419:36: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le16 [usertype] bridge_port_id @@     got int port @@
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:2419:36: sparse:     expected restricted __le16 [usertype] bridge_port_id
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:2419:36: sparse:     got int port
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:2424:51: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le16 [assigned] [usertype] egress_extended_vlan_block_id @@     got unsigned short [usertype] block_id @@
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:2424:51: sparse:     expected restricted __le16 [assigned] [usertype] egress_extended_vlan_block_id
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:2424:51: sparse:     got unsigned short [usertype] block_id
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:2427:52: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le16 [assigned] [usertype] ingress_extended_vlan_block_id @@     got unsigned short [usertype] block_id @@
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:2427:52: sparse:     expected restricted __le16 [assigned] [usertype] ingress_extended_vlan_block_id
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:2427:52: sparse:     got unsigned short [usertype] block_id
>> drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:2555:41: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned short [usertype] bridge_id @@     got restricted __le16 [addressable] [usertype] bridge_id @@
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:2555:41: sparse:     expected unsigned short [usertype] bridge_id
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:2555:41: sparse:     got restricted __le16 [addressable] [usertype] bridge_id
>> drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:2605:32: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le16 [usertype] bridge_id @@     got unsigned short [usertype] bridge_id @@
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:2605:32: sparse:     expected restricted __le16 [usertype] bridge_id
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:2605:32: sparse:     got unsigned short [usertype] bridge_id
>> drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:2676:35: sparse: sparse: incorrect type in initializer (different base types) @@     expected restricted __le16 [usertype] bridge_port_id @@     got int port @@
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:2676:35: sparse:     expected restricted __le16 [usertype] bridge_port_id
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:2676:35: sparse:     got int port
>> drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:2784:25: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [addressable] [assigned] [usertype] age_timer @@     got unsigned int @@
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:2784:25: sparse:     expected restricted __le32 [addressable] [assigned] [usertype] age_timer
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:2784:25: sparse:     got unsigned int
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:2814:49: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned short [usertype] bridge_id @@     got restricted __le16 [addressable] [usertype] bridge_id @@
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:2814:49: sparse:     expected unsigned short [usertype] bridge_id
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:2814:49: sparse:     got restricted __le16 [addressable] [usertype] bridge_id
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:2851:57: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le16 [assigned] [usertype] egress_extended_vlan_block_id @@     got unsigned short [usertype] block_id @@
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:2851:57: sparse:     expected restricted __le16 [assigned] [usertype] egress_extended_vlan_block_id
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:2851:57: sparse:     got unsigned short [usertype] block_id
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:2854:58: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le16 [assigned] [usertype] ingress_extended_vlan_block_id @@     got unsigned short [usertype] block_id @@
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:2854:58: sparse:     expected restricted __le16 [assigned] [usertype] ingress_extended_vlan_block_id
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:2854:58: sparse:     got unsigned short [usertype] block_id
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:2867:44: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le16 [usertype] bridge_port_id @@     got int port @@
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:2867:44: sparse:     expected restricted __le16 [usertype] bridge_port_id
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:2867:44: sparse:     got int port
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:2871:59: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le16 [assigned] [usertype] egress_extended_vlan_block_id @@     got unsigned short [usertype] block_id @@
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:2871:59: sparse:     expected restricted __le16 [assigned] [usertype] egress_extended_vlan_block_id
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:2871:59: sparse:     got unsigned short [usertype] block_id
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:2874:60: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le16 [assigned] [usertype] ingress_extended_vlan_block_id @@     got unsigned short [usertype] block_id @@
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:2874:60: sparse:     expected restricted __le16 [assigned] [usertype] ingress_extended_vlan_block_id
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:2874:60: sparse:     got unsigned short [usertype] block_id
>> drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:2894:51: sparse: sparse: incorrect type in initializer (different base types) @@     expected restricted __le16 [usertype] bridge_id @@     got unsigned short [usertype] bridge_id @@
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:2894:51: sparse:     expected restricted __le16 [usertype] bridge_id
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:2894:51: sparse:     got unsigned short [usertype] bridge_id
>> drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:2990:28: sparse: sparse: incorrect type in initializer (different base types) @@     expected restricted __le16 [usertype] port_id @@     got int port @@
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:2990:28: sparse:     expected restricted __le16 [usertype] port_id
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:2990:28: sparse:     got int port
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:2993:28: sparse: sparse: incorrect type in initializer (different base types) @@     expected restricted __le16 [usertype] port_id @@     got int port @@
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:2993:28: sparse:     expected restricted __le16 [usertype] port_id
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:2993:28: sparse:     got int port
>> drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:3178:36: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le16 [usertype] bridge_port_id @@     got unsigned int [assigned] cpu_port @@
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:3178:36: sparse:     expected restricted __le16 [usertype] bridge_port_id
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:3178:36: sparse:     got unsigned int [assigned] cpu_port
>> drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:3179:40: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le16 @@     got unsigned short @@
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:3179:40: sparse:     expected restricted __le16
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:3179:40: sparse:     got unsigned short
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:3195:28: sparse: sparse: incorrect type in initializer (different base types) @@     expected restricted __le16 [usertype] port_id @@     got int port @@
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:3195:28: sparse:     expected restricted __le16 [usertype] port_id
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:3195:28: sparse:     got int port
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:3368:28: sparse: sparse: incorrect type in initializer (different base types) @@     expected restricted __le16 [usertype] port_id @@     got int port @@
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:3368:28: sparse:     expected restricted __le16 [usertype] port_id
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:3368:28: sparse:     got int port
>> drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:3506:28: sparse: sparse: incorrect type in initializer (different base types) @@     expected restricted __le32 [usertype] port_id @@     got int port @@
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:3506:28: sparse:     expected restricted __le32 [usertype] port_id
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:3506:28: sparse:     got int port
>> drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:3525:27: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le16 [addressable] [usertype] fid @@     got unsigned short [usertype] bridge_id @@
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:3525:27: sparse:     expected restricted __le16 [addressable] [usertype] fid
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:3525:27: sparse:     got unsigned short [usertype] bridge_id
>> drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:3527:35: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le16 [addressable] [usertype] tci @@     got int @@
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:3527:35: sparse:     expected restricted __le16 [addressable] [usertype] tci
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:3527:35: sparse:     got int
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:3551:27: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le16 [addressable] [usertype] tci @@     got int @@
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:3551:27: sparse:     expected restricted __le16 [addressable] [usertype] tci
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:3551:27: sparse:     got int
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:3561:27: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le16 [addressable] [usertype] fid @@     got unsigned short [usertype] bridge_id @@
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:3561:27: sparse:     expected restricted __le16 [addressable] [usertype] fid
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:3561:27: sparse:     got unsigned short [usertype] bridge_id
>> drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:3591:26: sparse: sparse: restricted __le32 degrades to integer
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:3592:44: sparse: sparse: restricted __le16 degrades to integer
>> drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:3633:41: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le16 [assigned] [usertype] bridge_id @@     got unsigned short [assigned] [usertype] bridge_id @@
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:3633:41: sparse:     expected restricted __le16 [assigned] [usertype] bridge_id
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:3633:41: sparse:     got unsigned short [assigned] [usertype] bridge_id
>> drivers/net/dsa/mxl862xx_downstream/mxl862xx.c:3854:18: sparse: sparse: unsigned value that used to be signed checked against zero?
   drivers/net/dsa/mxl862xx_downstream/mxl862xx.c: note: in included file (through include/linux/byteorder/big_endian.h, arch/parisc/include/uapi/asm/byteorder.h, arch/parisc/include/asm/bitops.h, ...):
   include/uapi/linux/byteorder/big_endian.h:83:32: sparse: signed value source

vim +135 drivers/net/dsa/mxl862xx_downstream/mxl862xx.c

fd031e0ddbac324 Frank Wunderlich 2026-03-07  129  
fd031e0ddbac324 Frank Wunderlich 2026-03-07  130  static int mxl862xx_phy_read_mmd(struct mxl862xx_priv *priv, int port, int devadd, int reg)
fd031e0ddbac324 Frank Wunderlich 2026-03-07  131  {
fd031e0ddbac324 Frank Wunderlich 2026-03-07  132  	struct mdio_relay_data param = {
fd031e0ddbac324 Frank Wunderlich 2026-03-07  133  		.phy = port,
fd031e0ddbac324 Frank Wunderlich 2026-03-07  134  		.mmd = devadd,
fd031e0ddbac324 Frank Wunderlich 2026-03-07 @135  		.reg = reg & 0xffff,
fd031e0ddbac324 Frank Wunderlich 2026-03-07  136  	};
fd031e0ddbac324 Frank Wunderlich 2026-03-07  137  	int ret;
fd031e0ddbac324 Frank Wunderlich 2026-03-07  138  
fd031e0ddbac324 Frank Wunderlich 2026-03-07  139  	ret = MXL862XX_API_READ(priv, INT_GPHY_READ, param);
fd031e0ddbac324 Frank Wunderlich 2026-03-07  140  	if (ret)
fd031e0ddbac324 Frank Wunderlich 2026-03-07  141  		return ret;
fd031e0ddbac324 Frank Wunderlich 2026-03-07  142  
fd031e0ddbac324 Frank Wunderlich 2026-03-07 @143  	return param.data;
fd031e0ddbac324 Frank Wunderlich 2026-03-07  144  }
fd031e0ddbac324 Frank Wunderlich 2026-03-07  145  
fd031e0ddbac324 Frank Wunderlich 2026-03-07  146  static int mxl862xx_phy_write_mmd(struct mxl862xx_priv *priv, int port,
fd031e0ddbac324 Frank Wunderlich 2026-03-07  147  				  int devadd, int reg, u16 data)
fd031e0ddbac324 Frank Wunderlich 2026-03-07  148  {
fd031e0ddbac324 Frank Wunderlich 2026-03-07  149  	struct mdio_relay_data param = {
fd031e0ddbac324 Frank Wunderlich 2026-03-07  150  		.phy = port,
fd031e0ddbac324 Frank Wunderlich 2026-03-07  151  		.mmd = devadd,
fd031e0ddbac324 Frank Wunderlich 2026-03-07 @152  		.reg = reg,
fd031e0ddbac324 Frank Wunderlich 2026-03-07 @153  		.data = data,
fd031e0ddbac324 Frank Wunderlich 2026-03-07  154  	};
fd031e0ddbac324 Frank Wunderlich 2026-03-07  155  	int ret;
fd031e0ddbac324 Frank Wunderlich 2026-03-07  156  
fd031e0ddbac324 Frank Wunderlich 2026-03-07  157  	ret = MXL862XX_API_WRITE(priv, INT_GPHY_WRITE, param);
fd031e0ddbac324 Frank Wunderlich 2026-03-07  158  	return ret;
fd031e0ddbac324 Frank Wunderlich 2026-03-07  159  }
fd031e0ddbac324 Frank Wunderlich 2026-03-07  160  
fd031e0ddbac324 Frank Wunderlich 2026-03-07  161  static int mxl862xx_phy_read(struct dsa_switch *ds, int port, int reg)
fd031e0ddbac324 Frank Wunderlich 2026-03-07  162  {
fd031e0ddbac324 Frank Wunderlich 2026-03-07  163  	return mxl862xx_phy_read_mmd(ds->priv, port, 0, reg);
fd031e0ddbac324 Frank Wunderlich 2026-03-07  164  }
fd031e0ddbac324 Frank Wunderlich 2026-03-07  165  
fd031e0ddbac324 Frank Wunderlich 2026-03-07  166  static int mxl862xx_phy_write(struct dsa_switch *ds, int port, int reg,
fd031e0ddbac324 Frank Wunderlich 2026-03-07  167  			      u16 data)
fd031e0ddbac324 Frank Wunderlich 2026-03-07  168  {
fd031e0ddbac324 Frank Wunderlich 2026-03-07  169  	return mxl862xx_phy_write_mmd(ds->priv, port, 0, reg, data);
fd031e0ddbac324 Frank Wunderlich 2026-03-07  170  }
fd031e0ddbac324 Frank Wunderlich 2026-03-07  171  
fd031e0ddbac324 Frank Wunderlich 2026-03-07  172  static int mxl862xx_mmd_write(struct dsa_switch *ds, int reg, u16 data)
fd031e0ddbac324 Frank Wunderlich 2026-03-07  173  {
fd031e0ddbac324 Frank Wunderlich 2026-03-07  174  	struct mxl862xx_priv *priv = ds->priv;
fd031e0ddbac324 Frank Wunderlich 2026-03-07  175  	int ret;
fd031e0ddbac324 Frank Wunderlich 2026-03-07  176  
fd031e0ddbac324 Frank Wunderlich 2026-03-07  177  	mutex_lock_nested(&priv->bus->mdio_lock, MDIO_MUTEX_NESTED);
fd031e0ddbac324 Frank Wunderlich 2026-03-07  178  	ret = mxl862xx_write(priv, reg, data);
fd031e0ddbac324 Frank Wunderlich 2026-03-07  179  	mutex_unlock(&priv->bus->mdio_lock);
fd031e0ddbac324 Frank Wunderlich 2026-03-07  180  
fd031e0ddbac324 Frank Wunderlich 2026-03-07  181  	return ret;
fd031e0ddbac324 Frank Wunderlich 2026-03-07  182  }
fd031e0ddbac324 Frank Wunderlich 2026-03-07  183  
fd031e0ddbac324 Frank Wunderlich 2026-03-07  184  static int mxl862xx_update_bridge_conf_port(struct dsa_switch *ds, u8 port,
fd031e0ddbac324 Frank Wunderlich 2026-03-07  185  					    struct net_device *bridge, int action)
fd031e0ddbac324 Frank Wunderlich 2026-03-07  186  {
fd031e0ddbac324 Frank Wunderlich 2026-03-07  187  	struct mxl862xx_priv *priv = ds->priv;
fd031e0ddbac324 Frank Wunderlich 2026-03-07  188  	u8 max_ports = priv->hw_info->max_ports;
fd031e0ddbac324 Frank Wunderlich 2026-03-07  189  	u8 cpu_port = priv->cpu_port;
fd031e0ddbac324 Frank Wunderlich 2026-03-07  190  	u8 i;
fd031e0ddbac324 Frank Wunderlich 2026-03-07  191  	bool vlan_sp_tag = (priv->port_info[cpu_port].tag_protocol == DSA_TAG_PROTO_MXL862_8021Q);
fd031e0ddbac324 Frank Wunderlich 2026-03-07  192  
fd031e0ddbac324 Frank Wunderlich 2026-03-07  193  	/*struct dsa_port *dp = dsa_to_port(priv->ds, port), *other_dp;
fd031e0ddbac324 Frank Wunderlich 2026-03-07  194  	 * struct mxl862xx_port_info *other_p;
fd031e0ddbac324 Frank Wunderlich 2026-03-07  195  	 *int other_port;
fd031e0ddbac324 Frank Wunderlich 2026-03-07  196  	 */
fd031e0ddbac324 Frank Wunderlich 2026-03-07  197  	int ret;
fd031e0ddbac324 Frank Wunderlich 2026-03-07  198  
fd031e0ddbac324 Frank Wunderlich 2026-03-07  199  	/* Update local bridge port map */
fd031e0ddbac324 Frank Wunderlich 2026-03-07  200  	for (i = 0; i < max_ports; i++) {
fd031e0ddbac324 Frank Wunderlich 2026-03-07  201  		int bridge_id = priv->port_info[i].bridge_id;
fd031e0ddbac324 Frank Wunderlich 2026-03-07  202  
fd031e0ddbac324 Frank Wunderlich 2026-03-07  203  		if (dsa_is_unused_port(ds, i))
fd031e0ddbac324 Frank Wunderlich 2026-03-07  204  			continue;
fd031e0ddbac324 Frank Wunderlich 2026-03-07  205  
fd031e0ddbac324 Frank Wunderlich 2026-03-07  206  		/* CPU port is assigned to all bridges and cannot be modified  */
fd031e0ddbac324 Frank Wunderlich 2026-03-07  207  		if ((dsa_is_cpu_port(ds, i)))
fd031e0ddbac324 Frank Wunderlich 2026-03-07  208  			continue;
fd031e0ddbac324 Frank Wunderlich 2026-03-07  209  
fd031e0ddbac324 Frank Wunderlich 2026-03-07  210  		/* Skip if bridge does not match, except the self port assignment  */
fd031e0ddbac324 Frank Wunderlich 2026-03-07  211  		if ((dsa_port_bridge_dev_get(dsa_to_port(ds, i)) != bridge) && (i != port))
fd031e0ddbac324 Frank Wunderlich 2026-03-07  212  			continue;
fd031e0ddbac324 Frank Wunderlich 2026-03-07  213  
fd031e0ddbac324 Frank Wunderlich 2026-03-07  214  		/* Case for standalone bridges assigned only to single user and CPU ports.
fd031e0ddbac324 Frank Wunderlich 2026-03-07  215  		 * Used only for initial ports isolation */
fd031e0ddbac324 Frank Wunderlich 2026-03-07  216  		if ((bridge == NULL) && (i != port))
fd031e0ddbac324 Frank Wunderlich 2026-03-07  217  			continue;
fd031e0ddbac324 Frank Wunderlich 2026-03-07  218  
fd031e0ddbac324 Frank Wunderlich 2026-03-07  219  		if (action)
fd031e0ddbac324 Frank Wunderlich 2026-03-07  220  			priv->bridge_portmap[bridge_id] |= BIT(DSA_MXL_PORT(port));
fd031e0ddbac324 Frank Wunderlich 2026-03-07  221  		else
fd031e0ddbac324 Frank Wunderlich 2026-03-07  222  			priv->bridge_portmap[bridge_id] &= ~BIT(DSA_MXL_PORT(port));
fd031e0ddbac324 Frank Wunderlich 2026-03-07  223  	}
fd031e0ddbac324 Frank Wunderlich 2026-03-07  224  
fd031e0ddbac324 Frank Wunderlich 2026-03-07  225  	/* Update switch according to local bridge port map */
fd031e0ddbac324 Frank Wunderlich 2026-03-07  226  	/* Add this port to the port maps of other ports skiping it's own map */
fd031e0ddbac324 Frank Wunderlich 2026-03-07  227  	for (i = 0; i < max_ports; i++) {
fd031e0ddbac324 Frank Wunderlich 2026-03-07  228  		struct mxl862xx_bridge_port_config br_port_cfg = { };
fd031e0ddbac324 Frank Wunderlich 2026-03-07  229  		int bridge_id = priv->port_info[i].bridge_id;
fd031e0ddbac324 Frank Wunderlich 2026-03-07  230  
fd031e0ddbac324 Frank Wunderlich 2026-03-07  231  		if (!(dsa_is_user_port(ds, i)))
fd031e0ddbac324 Frank Wunderlich 2026-03-07  232  			continue;
fd031e0ddbac324 Frank Wunderlich 2026-03-07  233  
fd031e0ddbac324 Frank Wunderlich 2026-03-07  234  		/* Case for standalone bridges assigned only to single user and CPU ports.
fd031e0ddbac324 Frank Wunderlich 2026-03-07  235  		 * Used only for initial ports isolation
fd031e0ddbac324 Frank Wunderlich 2026-03-07  236  		 */
fd031e0ddbac324 Frank Wunderlich 2026-03-07  237  		if (!bridge && i != port)
fd031e0ddbac324 Frank Wunderlich 2026-03-07  238  			continue;
fd031e0ddbac324 Frank Wunderlich 2026-03-07  239  
fd031e0ddbac324 Frank Wunderlich 2026-03-07  240  		/* Do not reconfigure any standalone bridge if this is bridge join scenario */
fd031e0ddbac324 Frank Wunderlich 2026-03-07  241  		if (bridge && !priv->port_info[i].bridge)
fd031e0ddbac324 Frank Wunderlich 2026-03-07  242  			continue;
fd031e0ddbac324 Frank Wunderlich 2026-03-07  243  
fd031e0ddbac324 Frank Wunderlich 2026-03-07 @244  		br_port_cfg.bridge_port_id = DSA_MXL_PORT(i);
fd031e0ddbac324 Frank Wunderlich 2026-03-07  245  		br_port_cfg.mask |=
fd031e0ddbac324 Frank Wunderlich 2026-03-07  246  			MXL862XX_BRIDGE_PORT_CONFIG_MASK_BRIDGE_PORT_MAP |
fd031e0ddbac324 Frank Wunderlich 2026-03-07  247  			MXL862XX_BRIDGE_PORT_CONFIG_MASK_BRIDGE_ID;
fd031e0ddbac324 Frank Wunderlich 2026-03-07  248  
fd031e0ddbac324 Frank Wunderlich 2026-03-07  249  		ret = MXL862XX_API_READ(priv, MXL862XX_BRIDGEPORT_CONFIGGET, br_port_cfg);
fd031e0ddbac324 Frank Wunderlich 2026-03-07  250  		if (ret) {
fd031e0ddbac324 Frank Wunderlich 2026-03-07  251  			dev_err(ds->dev, "failed to set bridge port configuration on port %d\n",
fd031e0ddbac324 Frank Wunderlich 2026-03-07  252  				port);
fd031e0ddbac324 Frank Wunderlich 2026-03-07  253  			return ret;
fd031e0ddbac324 Frank Wunderlich 2026-03-07  254  		}
fd031e0ddbac324 Frank Wunderlich 2026-03-07  255  
fd031e0ddbac324 Frank Wunderlich 2026-03-07  256  		/* Skip port map update if for the existing bridge the port
fd031e0ddbac324 Frank Wunderlich 2026-03-07  257  		 * is not assigned there.
fd031e0ddbac324 Frank Wunderlich 2026-03-07  258  		 */
fd031e0ddbac324 Frank Wunderlich 2026-03-07 @259  		if (i != port && (br_port_cfg.bridge_id != bridge_id ||
fd031e0ddbac324 Frank Wunderlich 2026-03-07  260  				  br_port_cfg.bridge_id == 0))
fd031e0ddbac324 Frank Wunderlich 2026-03-07  261  			continue;
fd031e0ddbac324 Frank Wunderlich 2026-03-07  262  
fd031e0ddbac324 Frank Wunderlich 2026-03-07  263  		br_port_cfg.mask |=
fd031e0ddbac324 Frank Wunderlich 2026-03-07  264  			MXL862XX_BRIDGE_PORT_CONFIG_MASK_BRIDGE_PORT_MAP |
fd031e0ddbac324 Frank Wunderlich 2026-03-07  265  			MXL862XX_BRIDGE_PORT_CONFIG_MASK_BRIDGE_ID |
fd031e0ddbac324 Frank Wunderlich 2026-03-07  266  			MXL862XX_BRIDGE_PORT_CONFIG_MASK_MC_SRC_MAC_LEARNING;
fd031e0ddbac324 Frank Wunderlich 2026-03-07  267  
fd031e0ddbac324 Frank Wunderlich 2026-03-07  268  		/* Skip the port itself in it's own portmap */
fd031e0ddbac324 Frank Wunderlich 2026-03-07 @269  		br_port_cfg.bridge_port_map[0] =
fd031e0ddbac324 Frank Wunderlich 2026-03-07  270  			priv->bridge_portmap[bridge_id] & ~(BIT(DSA_MXL_PORT(i)));
fd031e0ddbac324 Frank Wunderlich 2026-03-07  271  
fd031e0ddbac324 Frank Wunderlich 2026-03-07  272  		if (action) {
fd031e0ddbac324 Frank Wunderlich 2026-03-07  273  			br_port_cfg.src_mac_learning_disable = !bridge;
fd031e0ddbac324 Frank Wunderlich 2026-03-07 @274  			br_port_cfg.bridge_id = bridge_id;
fd031e0ddbac324 Frank Wunderlich 2026-03-07  275  		} else {
fd031e0ddbac324 Frank Wunderlich 2026-03-07  276  			/* When port is removed from the bridge, assign it back to the default
fd031e0ddbac324 Frank Wunderlich 2026-03-07  277  			 * bridge 0
fd031e0ddbac324 Frank Wunderlich 2026-03-07  278  			 */
fd031e0ddbac324 Frank Wunderlich 2026-03-07  279  			br_port_cfg.src_mac_learning_disable = true;
fd031e0ddbac324 Frank Wunderlich 2026-03-07  280  			/* Cleanup the port own map leaving only the CPU port mapping. */
fd031e0ddbac324 Frank Wunderlich 2026-03-07  281  			if (i == port) {
fd031e0ddbac324 Frank Wunderlich 2026-03-07  282  				br_port_cfg.bridge_port_map[0] = BIT(DSA_MXL_PORT(cpu_port));
fd031e0ddbac324 Frank Wunderlich 2026-03-07  283  				br_port_cfg.bridge_id = 0;
fd031e0ddbac324 Frank Wunderlich 2026-03-07  284  			}
fd031e0ddbac324 Frank Wunderlich 2026-03-07  285  		}
fd031e0ddbac324 Frank Wunderlich 2026-03-07  286  
fd031e0ddbac324 Frank Wunderlich 2026-03-07  287  		ret = MXL862XX_API_WRITE(priv, MXL862XX_BRIDGEPORT_CONFIGSET, br_port_cfg);
fd031e0ddbac324 Frank Wunderlich 2026-03-07  288  		if (ret) {
fd031e0ddbac324 Frank Wunderlich 2026-03-07  289  			dev_err(ds->dev, "failed to set bridge port configuration on port %d\n", port);
fd031e0ddbac324 Frank Wunderlich 2026-03-07  290  			return ret;
fd031e0ddbac324 Frank Wunderlich 2026-03-07  291  		}
fd031e0ddbac324 Frank Wunderlich 2026-03-07  292  	}
fd031e0ddbac324 Frank Wunderlich 2026-03-07  293  
fd031e0ddbac324 Frank Wunderlich 2026-03-07  294  	/* Configure additional bridge port for VLAN based tagging */
fd031e0ddbac324 Frank Wunderlich 2026-03-07  295  	if (vlan_sp_tag) {
fd031e0ddbac324 Frank Wunderlich 2026-03-07  296  		int bridge_id = priv->port_info[port].bridge_id;
fd031e0ddbac324 Frank Wunderlich 2026-03-07  297  		uint16_t bridge_port_cpu = DSA_MXL_PORT(port) + 16;
fd031e0ddbac324 Frank Wunderlich 2026-03-07  298  		struct mxl862xx_bridge_port_alloc bpa_param = { };
fd031e0ddbac324 Frank Wunderlich 2026-03-07  299  		struct mxl862xx_bridge_port_config br_port_cfg = { };
fd031e0ddbac324 Frank Wunderlich 2026-03-07  300  
fd031e0ddbac324 Frank Wunderlich 2026-03-07 @301  		bpa_param.bridge_port_id = bridge_port_cpu;
fd031e0ddbac324 Frank Wunderlich 2026-03-07  302  
fd031e0ddbac324 Frank Wunderlich 2026-03-07  303  		if (action) {
fd031e0ddbac324 Frank Wunderlich 2026-03-07  304  			/* add */
fd031e0ddbac324 Frank Wunderlich 2026-03-07  305  			ret = MXL862XX_API_READ(priv, MXL862XX_BRIDGEPORT_ALLOC, bpa_param);
fd031e0ddbac324 Frank Wunderlich 2026-03-07  306  			if (ret) {
fd031e0ddbac324 Frank Wunderlich 2026-03-07  307  				dev_err(ds->dev,
fd031e0ddbac324 Frank Wunderlich 2026-03-07  308  					"%s: Port:%d failed to prepare associated bridge port\n",
fd031e0ddbac324 Frank Wunderlich 2026-03-07  309  					__func__, port);
fd031e0ddbac324 Frank Wunderlich 2026-03-07  310  				return ret;
fd031e0ddbac324 Frank Wunderlich 2026-03-07  311  			}
fd031e0ddbac324 Frank Wunderlich 2026-03-07  312  
fd031e0ddbac324 Frank Wunderlich 2026-03-07  313  			br_port_cfg.mask |=
fd031e0ddbac324 Frank Wunderlich 2026-03-07  314  				MXL862XX_BRIDGE_PORT_CONFIG_MASK_BRIDGE_PORT_MAP |
fd031e0ddbac324 Frank Wunderlich 2026-03-07  315  				MXL862XX_BRIDGE_PORT_CONFIG_MASK_BRIDGE_ID |
fd031e0ddbac324 Frank Wunderlich 2026-03-07  316  				MXL862XX_BRIDGE_PORT_CONFIG_MASK_EGRESS_CTP_MAPPING |
fd031e0ddbac324 Frank Wunderlich 2026-03-07  317  				MXL862XX_BRIDGE_PORT_CONFIG_MASK_MC_SRC_MAC_LEARNING;
fd031e0ddbac324 Frank Wunderlich 2026-03-07 @318  			br_port_cfg.bridge_id = bridge_id;
fd031e0ddbac324 Frank Wunderlich 2026-03-07 @319  			br_port_cfg.bridge_port_id = bridge_port_cpu;
fd031e0ddbac324 Frank Wunderlich 2026-03-07  320  			br_port_cfg.bridge_port_map[0] = BIT(DSA_MXL_PORT(port));
fd031e0ddbac324 Frank Wunderlich 2026-03-07  321  			br_port_cfg.dest_logical_port_id = DSA_MXL_PORT(cpu_port);
fd031e0ddbac324 Frank Wunderlich 2026-03-07  322  			br_port_cfg.src_mac_learning_disable = true;
fd031e0ddbac324 Frank Wunderlich 2026-03-07  323  
fd031e0ddbac324 Frank Wunderlich 2026-03-07  324  			ret = MXL862XX_API_WRITE(priv, MXL862XX_BRIDGEPORT_CONFIGSET, br_port_cfg);
fd031e0ddbac324 Frank Wunderlich 2026-03-07  325  			if (ret) {
fd031e0ddbac324 Frank Wunderlich 2026-03-07  326  				dev_err(ds->dev,
fd031e0ddbac324 Frank Wunderlich 2026-03-07  327  				"%s: Configuration of cpu bridge port:%d  for port:%d on bridge:%d failed with ret=%d\n",
fd031e0ddbac324 Frank Wunderlich 2026-03-07  328  				__func__, bridge_port_cpu, port, bridge_id, ret);
fd031e0ddbac324 Frank Wunderlich 2026-03-07  329  				return ret;
fd031e0ddbac324 Frank Wunderlich 2026-03-07  330  			}
fd031e0ddbac324 Frank Wunderlich 2026-03-07  331  
fd031e0ddbac324 Frank Wunderlich 2026-03-07  332  			/* Add bridge cpu port to portmap */
fd031e0ddbac324 Frank Wunderlich 2026-03-07  333  			priv->bridge_portmap[bridge_id] |= BIT(bridge_port_cpu);
fd031e0ddbac324 Frank Wunderlich 2026-03-07  334  			priv->port_info[port].bridge_port_cpu = bridge_port_cpu;
fd031e0ddbac324 Frank Wunderlich 2026-03-07  335  		} else {
fd031e0ddbac324 Frank Wunderlich 2026-03-07  336  			/* remove */
fd031e0ddbac324 Frank Wunderlich 2026-03-07  337  			ret = MXL862XX_API_WRITE(priv, MXL862XX_BRIDGEPORT_FREE, bpa_param);
fd031e0ddbac324 Frank Wunderlich 2026-03-07  338  			if (ret) {
fd031e0ddbac324 Frank Wunderlich 2026-03-07  339  				dev_err(ds->dev,
fd031e0ddbac324 Frank Wunderlich 2026-03-07  340  					"%s: Port:%d failed to free associated bridge port\n",
fd031e0ddbac324 Frank Wunderlich 2026-03-07  341  					__func__, port);
fd031e0ddbac324 Frank Wunderlich 2026-03-07  342  				return ret;
fd031e0ddbac324 Frank Wunderlich 2026-03-07  343  			}
fd031e0ddbac324 Frank Wunderlich 2026-03-07  344  			/* Remove bridge cpu port from portmap */
fd031e0ddbac324 Frank Wunderlich 2026-03-07  345  			priv->bridge_portmap[bridge_id] &= ~BIT(bridge_port_cpu);
fd031e0ddbac324 Frank Wunderlich 2026-03-07  346  			priv->port_info[port].bridge_port_cpu = 0;
fd031e0ddbac324 Frank Wunderlich 2026-03-07  347  		}
fd031e0ddbac324 Frank Wunderlich 2026-03-07  348  	}
fd031e0ddbac324 Frank Wunderlich 2026-03-07  349  
fd031e0ddbac324 Frank Wunderlich 2026-03-07  350  	return 0;
fd031e0ddbac324 Frank Wunderlich 2026-03-07  351  }
fd031e0ddbac324 Frank Wunderlich 2026-03-07  352  

:::::: The code at line 135 was first introduced by commit
:::::: fd031e0ddbac3242dd2ce66e8be045dfab3af80a net: dsa: add mxl downstream driver from 6.19-main

:::::: TO: Frank Wunderlich <frank-w@public-files.de>
:::::: CC: Frank Wunderlich <frank-w@public-files.de>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
