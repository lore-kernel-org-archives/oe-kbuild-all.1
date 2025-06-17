Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EFE628A720
	for <oe-kbuild-all@lists.linux.dev>; Tue, 17 Jun 2025 05:40:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750138857; cv=none; b=WVUFHSNGwdlE0O+Hs8s1WiIHC+tuSCH8b9J0ZI+gkKBjTg51Uk93l5q3feoQzt8PRPOaxyQ5X4DzD/eycnhlk/AaQvFD/AjM02ppFrnY9myilmwEYI/piNmbmzhVr+wtEWxJsHw5pcQk6vudVU0XsMJMREsVaIjDxl9pneM5xiI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750138857; c=relaxed/simple;
	bh=uIIvh4JbW27BNMBVJkB7COTZfRBpI47LUpAvUTSVuOw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=TeIvx2Cb+XJ1Muc/dA80oe2MfMjrfTFwdN0W512zbnUXI/AkV+Bt9eGIgGCYCdaoq55V47u8oUlekSvVEU6j0slqaw/jEXIdEUwtIi9PrfR4oU6CK3eGc2p5vrjetQUu6ZgF7WbtRyTa6Wt1EdzH4hoQSRCy84qCUVsuQIjhL1w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Dqxpwme9; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Dqxpwme9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750138853; x=1781674853;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=uIIvh4JbW27BNMBVJkB7COTZfRBpI47LUpAvUTSVuOw=;
  b=Dqxpwme94sgdDy7gj2savz798IBb2cLyDEEdHzR8F137RcLw9H00u7Ui
   7aeoROi+8gHKhxtic7m01ginkvm+OiJO8q/BGMJBmHvo2lcY7nlZfut3U
   e1EN9o6p0GrN0RToGLjCdXyB8mM/fN2Fw9AsyzI5BkeQbGy0rF5fqyIjw
   Uv3YB7H0/i+WJadzaL+83YJluQcnCe9MKZ+604A4zEYLBrLn7NcdjI4Ff
   OWzmkZ+St1XvY1fJlUXsDPKcrT4EHAFhmsNIY7zImorqhyoH6e+o956/3
   vC11El7jk/ikQ6yuPLDHYw0wk8gazMw543Q4X+Hd9QanA/zu8m1aSALoS
   Q==;
X-CSE-ConnectionGUID: wOHIHtqXRvG6aCZg1PC62A==
X-CSE-MsgGUID: wA88+umPSCy6bt+7t0mGjQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11465"; a="52212774"
X-IronPort-AV: E=Sophos;i="6.16,242,1744095600"; 
   d="scan'208";a="52212774"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jun 2025 22:40:51 -0700
X-CSE-ConnectionGUID: heB8zjYZTtiIb1AHwVBy0A==
X-CSE-MsgGUID: 1UHG6dblQcynyRLgtMv02A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,242,1744095600"; 
   d="scan'208";a="148576833"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 16 Jun 2025 22:40:49 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uRP3u-000FdA-2Y;
	Tue, 17 Jun 2025 05:40:46 +0000
Date: Tue, 17 Jun 2025 13:40:00 +0800
From: kernel test robot <lkp@intel.com>
To: Frank Wunderlich <frank-w@public-files.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [frank-w-bpi-r2-4.14:6.16-r4pro 46/56]
 drivers/net/dsa/mxl862xx/mxl862xx.c:134:28: sparse: sparse: incorrect type
 in initializer (different base types)
Message-ID: <202506171318.8jPPGreK-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Frank,

First bad commit (maybe != root cause):

tree:   https://github.com/frank-w/BPI-R2-4.14 6.16-r4pro
head:   de2eef5af7055f0bc1f2c29e4025169aa41126ae
commit: 26735c484d3c2541d97c5f65e0ec69cec1592f0b [46/56] net-dsa-add-mxl862xx-special-tag-support
config: hexagon-randconfig-r112-20250617 (https://download.01.org/0day-ci/archive/20250617/202506171318.8jPPGreK-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project f819f46284f2a79790038e1f6649172789734ae8)
reproduce: (https://download.01.org/0day-ci/archive/20250617/202506171318.8jPPGreK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506171318.8jPPGreK-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/net/dsa/mxl862xx/mxl862xx.c:134:28: sparse: sparse: incorrect type in initializer (different base types) @@     expected restricted __le16 [usertype] reg @@     got int @@
   drivers/net/dsa/mxl862xx/mxl862xx.c:134:28: sparse:     expected restricted __le16 [usertype] reg
   drivers/net/dsa/mxl862xx/mxl862xx.c:134:28: sparse:     got int
>> drivers/net/dsa/mxl862xx/mxl862xx.c:144:21: sparse: sparse: incorrect type in return expression (different base types) @@     expected int @@     got restricted __le16 [addressable] [usertype] data @@
   drivers/net/dsa/mxl862xx/mxl862xx.c:144:21: sparse:     expected int
   drivers/net/dsa/mxl862xx/mxl862xx.c:144:21: sparse:     got restricted __le16 [addressable] [usertype] data
>> drivers/net/dsa/mxl862xx/mxl862xx.c:153:24: sparse: sparse: incorrect type in initializer (different base types) @@     expected restricted __le16 [usertype] reg @@     got int reg @@
   drivers/net/dsa/mxl862xx/mxl862xx.c:153:24: sparse:     expected restricted __le16 [usertype] reg
   drivers/net/dsa/mxl862xx/mxl862xx.c:153:24: sparse:     got int reg
>> drivers/net/dsa/mxl862xx/mxl862xx.c:154:25: sparse: sparse: incorrect type in initializer (different base types) @@     expected restricted __le16 [usertype] data @@     got unsigned short [usertype] data @@
   drivers/net/dsa/mxl862xx/mxl862xx.c:154:25: sparse:     expected restricted __le16 [usertype] data
   drivers/net/dsa/mxl862xx/mxl862xx.c:154:25: sparse:     got unsigned short [usertype] data
>> drivers/net/dsa/mxl862xx/mxl862xx.c:231:44: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le16 [usertype] bridge_port_id @@     got int @@
   drivers/net/dsa/mxl862xx/mxl862xx.c:231:44: sparse:     expected restricted __le16 [usertype] bridge_port_id
   drivers/net/dsa/mxl862xx/mxl862xx.c:231:44: sparse:     got int
>> drivers/net/dsa/mxl862xx/mxl862xx.c:246:46: sparse: sparse: restricted __le16 degrades to integer
>> drivers/net/dsa/mxl862xx/mxl862xx.c:256:48: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le16 @@     got unsigned long @@
   drivers/net/dsa/mxl862xx/mxl862xx.c:256:48: sparse:     expected restricted __le16
   drivers/net/dsa/mxl862xx/mxl862xx.c:256:48: sparse:     got unsigned long
>> drivers/net/dsa/mxl862xx/mxl862xx.c:261:47: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le16 [addressable] [assigned] [usertype] bridge_id @@     got int bridge_id @@
   drivers/net/dsa/mxl862xx/mxl862xx.c:261:47: sparse:     expected restricted __le16 [addressable] [assigned] [usertype] bridge_id
   drivers/net/dsa/mxl862xx/mxl862xx.c:261:47: sparse:     got int bridge_id
   drivers/net/dsa/mxl862xx/mxl862xx.c:269:64: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le16 @@     got unsigned long @@
   drivers/net/dsa/mxl862xx/mxl862xx.c:269:64: sparse:     expected restricted __le16
   drivers/net/dsa/mxl862xx/mxl862xx.c:269:64: sparse:     got unsigned long
>> drivers/net/dsa/mxl862xx/mxl862xx.c:288:42: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le16 [usertype] bridge_port_id @@     got unsigned short [usertype] bridge_port_cpu @@
   drivers/net/dsa/mxl862xx/mxl862xx.c:288:42: sparse:     expected restricted __le16 [usertype] bridge_port_id
   drivers/net/dsa/mxl862xx/mxl862xx.c:288:42: sparse:     got unsigned short [usertype] bridge_port_cpu
>> drivers/net/dsa/mxl862xx/mxl862xx.c:305:47: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le16 [assigned] [usertype] bridge_id @@     got int bridge_id @@
   drivers/net/dsa/mxl862xx/mxl862xx.c:305:47: sparse:     expected restricted __le16 [assigned] [usertype] bridge_id
   drivers/net/dsa/mxl862xx/mxl862xx.c:305:47: sparse:     got int bridge_id
>> drivers/net/dsa/mxl862xx/mxl862xx.c:306:52: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le16 [assigned] [usertype] bridge_port_id @@     got unsigned short [usertype] bridge_port_cpu @@
   drivers/net/dsa/mxl862xx/mxl862xx.c:306:52: sparse:     expected restricted __le16 [assigned] [usertype] bridge_port_id
   drivers/net/dsa/mxl862xx/mxl862xx.c:306:52: sparse:     got unsigned short [usertype] bridge_port_cpu
   drivers/net/dsa/mxl862xx/mxl862xx.c:307:56: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le16 @@     got unsigned long @@
   drivers/net/dsa/mxl862xx/mxl862xx.c:307:56: sparse:     expected restricted __le16
   drivers/net/dsa/mxl862xx/mxl862xx.c:307:56: sparse:     got unsigned long
>> drivers/net/dsa/mxl862xx/mxl862xx.c:349:46: sparse: sparse: incorrect type in initializer (different base types) @@     expected restricted __le16 [usertype] number_of_ctp_port @@     got int @@
   drivers/net/dsa/mxl862xx/mxl862xx.c:349:46: sparse:     expected restricted __le16 [usertype] number_of_ctp_port
   drivers/net/dsa/mxl862xx/mxl862xx.c:349:46: sparse:     got int
>> drivers/net/dsa/mxl862xx/mxl862xx.c:351:38: sparse: sparse: incorrect type in initializer (different base types) @@     expected restricted __le16 [usertype] first_ctp_port_id @@     got int @@
   drivers/net/dsa/mxl862xx/mxl862xx.c:351:38: sparse:     expected restricted __le16 [usertype] first_ctp_port_id
   drivers/net/dsa/mxl862xx/mxl862xx.c:351:38: sparse:     got int
>> drivers/net/dsa/mxl862xx/mxl862xx.c:373:25: sparse: sparse: incorrect type in initializer (different base types) @@     expected restricted __le16 [usertype] addr @@     got int @@
   drivers/net/dsa/mxl862xx/mxl862xx.c:373:25: sparse:     expected restricted __le16 [usertype] addr
   drivers/net/dsa/mxl862xx/mxl862xx.c:373:25: sparse:     got int
>> drivers/net/dsa/mxl862xx/mxl862xx.c:374:32: sparse: sparse: incorrect type in initializer (different base types) @@     expected restricted __le16 [usertype] data @@     got unsigned long @@
   drivers/net/dsa/mxl862xx/mxl862xx.c:374:32: sparse:     expected restricted __le16 [usertype] data
   drivers/net/dsa/mxl862xx/mxl862xx.c:374:32: sparse:     got unsigned long
>> drivers/net/dsa/mxl862xx/mxl862xx.c:375:25: sparse: sparse: incorrect type in initializer (different base types) @@     expected restricted __le16 [usertype] mask @@     got unsigned long @@
   drivers/net/dsa/mxl862xx/mxl862xx.c:375:25: sparse:     expected restricted __le16 [usertype] mask
   drivers/net/dsa/mxl862xx/mxl862xx.c:375:25: sparse:     got unsigned long
   drivers/net/dsa/mxl862xx/mxl862xx.c:378:25: sparse: sparse: incorrect type in initializer (different base types) @@     expected restricted __le16 [usertype] addr @@     got int @@
   drivers/net/dsa/mxl862xx/mxl862xx.c:378:25: sparse:     expected restricted __le16 [usertype] addr
   drivers/net/dsa/mxl862xx/mxl862xx.c:378:25: sparse:     got int
   drivers/net/dsa/mxl862xx/mxl862xx.c:379:32: sparse: sparse: incorrect type in initializer (different base types) @@     expected restricted __le16 [usertype] data @@     got unsigned long @@
   drivers/net/dsa/mxl862xx/mxl862xx.c:379:32: sparse:     expected restricted __le16 [usertype] data
   drivers/net/dsa/mxl862xx/mxl862xx.c:379:32: sparse:     got unsigned long
   drivers/net/dsa/mxl862xx/mxl862xx.c:380:25: sparse: sparse: incorrect type in initializer (different base types) @@     expected restricted __le16 [usertype] mask @@     got unsigned long @@
   drivers/net/dsa/mxl862xx/mxl862xx.c:380:25: sparse:     expected restricted __le16 [usertype] mask
   drivers/net/dsa/mxl862xx/mxl862xx.c:380:25: sparse:     got unsigned long
>> drivers/net/dsa/mxl862xx/mxl862xx.c:499:41: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le16 [usertype] extended_vlan_block_id @@     got unsigned short [usertype] block_id @@
   drivers/net/dsa/mxl862xx/mxl862xx.c:499:41: sparse:     expected restricted __le16 [usertype] extended_vlan_block_id
   drivers/net/dsa/mxl862xx/mxl862xx.c:499:41: sparse:     got unsigned short [usertype] block_id
>> drivers/net/dsa/mxl862xx/mxl862xx.c:500:30: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le16 [usertype] entry_index @@     got unsigned short [usertype] entry_idx @@
   drivers/net/dsa/mxl862xx/mxl862xx.c:500:30: sparse:     expected restricted __le16 [usertype] entry_index
   drivers/net/dsa/mxl862xx/mxl862xx.c:500:30: sparse:     got unsigned short [usertype] entry_idx
>> drivers/net/dsa/mxl862xx/mxl862xx.c:534:46: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le16 [usertype] number_of_entries @@     got unsigned short [usertype] filters_max @@
   drivers/net/dsa/mxl862xx/mxl862xx.c:534:46: sparse:     expected restricted __le16 [usertype] number_of_entries
   drivers/net/dsa/mxl862xx/mxl862xx.c:534:46: sparse:     got unsigned short [usertype] filters_max
>> drivers/net/dsa/mxl862xx/mxl862xx.c:540:38: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned short [usertype] block_id @@     got restricted __le16 [addressable] [usertype] extended_vlan_block_id @@
   drivers/net/dsa/mxl862xx/mxl862xx.c:540:38: sparse:     expected unsigned short [usertype] block_id
   drivers/net/dsa/mxl862xx/mxl862xx.c:540:38: sparse:     got restricted __le16 [addressable] [usertype] extended_vlan_block_id
>> drivers/net/dsa/mxl862xx/mxl862xx.c:560:41: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le16 [addressable] [usertype] extended_vlan_block_id @@     got unsigned short [usertype] block_id @@
   drivers/net/dsa/mxl862xx/mxl862xx.c:560:41: sparse:     expected restricted __le16 [addressable] [usertype] extended_vlan_block_id
   drivers/net/dsa/mxl862xx/mxl862xx.c:560:41: sparse:     got unsigned short [usertype] block_id
>> drivers/net/dsa/mxl862xx/mxl862xx.c:562:30: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le16 [addressable] [usertype] entry_index @@     got int @@
   drivers/net/dsa/mxl862xx/mxl862xx.c:562:30: sparse:     expected restricted __le16 [addressable] [usertype] entry_index
   drivers/net/dsa/mxl862xx/mxl862xx.c:562:30: sparse:     got int
>> drivers/net/dsa/mxl862xx/mxl862xx.c:576:77: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned short [usertype] final_filters_idx @@     got restricted __le16 [addressable] [assigned] [usertype] entry_index @@
   drivers/net/dsa/mxl862xx/mxl862xx.c:576:77: sparse:     expected unsigned short [usertype] final_filters_idx
   drivers/net/dsa/mxl862xx/mxl862xx.c:576:77: sparse:     got restricted __le16 [addressable] [assigned] [usertype] entry_index
>> drivers/net/dsa/mxl862xx/mxl862xx.c:580:41: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le16 [addressable] [assigned] [usertype] extended_vlan_block_id @@     got unsigned short [usertype] block_id @@
   drivers/net/dsa/mxl862xx/mxl862xx.c:580:41: sparse:     expected restricted __le16 [addressable] [assigned] [usertype] extended_vlan_block_id
   drivers/net/dsa/mxl862xx/mxl862xx.c:580:41: sparse:     got unsigned short [usertype] block_id
>> drivers/net/dsa/mxl862xx/mxl862xx.c:582:30: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le16 [addressable] [assigned] [usertype] entry_index @@     got int @@
   drivers/net/dsa/mxl862xx/mxl862xx.c:582:30: sparse:     expected restricted __le16 [addressable] [assigned] [usertype] entry_index
   drivers/net/dsa/mxl862xx/mxl862xx.c:582:30: sparse:     got int
   drivers/net/dsa/mxl862xx/mxl862xx.c:597:77: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned short [usertype] final_filters_idx @@     got restricted __le16 [addressable] [assigned] [usertype] entry_index @@
   drivers/net/dsa/mxl862xx/mxl862xx.c:597:77: sparse:     expected unsigned short [usertype] final_filters_idx
   drivers/net/dsa/mxl862xx/mxl862xx.c:597:77: sparse:     got restricted __le16 [addressable] [assigned] [usertype] entry_index
   drivers/net/dsa/mxl862xx/mxl862xx.c:628:41: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le16 [addressable] [usertype] extended_vlan_block_id @@     got unsigned short [usertype] block_id @@
   drivers/net/dsa/mxl862xx/mxl862xx.c:628:41: sparse:     expected restricted __le16 [addressable] [usertype] extended_vlan_block_id
   drivers/net/dsa/mxl862xx/mxl862xx.c:628:41: sparse:     got unsigned short [usertype] block_id
   drivers/net/dsa/mxl862xx/mxl862xx.c:631:30: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le16 [addressable] [usertype] entry_index @@     got int @@
   drivers/net/dsa/mxl862xx/mxl862xx.c:631:30: sparse:     expected restricted __le16 [addressable] [usertype] entry_index
   drivers/net/dsa/mxl862xx/mxl862xx.c:631:30: sparse:     got int
>> drivers/net/dsa/mxl862xx/mxl862xx.c:639:44: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [addressable] [assigned] [usertype] vid_val @@     got unsigned short [usertype] vid @@
   drivers/net/dsa/mxl862xx/mxl862xx.c:639:44: sparse:     expected restricted __le32 [addressable] [assigned] [usertype] vid_val
   drivers/net/dsa/mxl862xx/mxl862xx.c:639:44: sparse:     got unsigned short [usertype] vid
>> drivers/net/dsa/mxl862xx/mxl862xx.c:661:33: sparse: sparse: incorrect type in assignment (different base types) @@     expected signed short @@     got restricted __le16 [addressable] [assigned] [usertype] entry_index @@
   drivers/net/dsa/mxl862xx/mxl862xx.c:661:33: sparse:     expected signed short
   drivers/net/dsa/mxl862xx/mxl862xx.c:661:33: sparse:     got restricted __le16 [addressable] [assigned] [usertype] entry_index
   drivers/net/dsa/mxl862xx/mxl862xx.c:669:41: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le16 [addressable] [assigned] [usertype] extended_vlan_block_id @@     got unsigned short [usertype] block_id @@
   drivers/net/dsa/mxl862xx/mxl862xx.c:669:41: sparse:     expected restricted __le16 [addressable] [assigned] [usertype] extended_vlan_block_id
   drivers/net/dsa/mxl862xx/mxl862xx.c:669:41: sparse:     got unsigned short [usertype] block_id
   drivers/net/dsa/mxl862xx/mxl862xx.c:671:30: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le16 [addressable] [assigned] [usertype] entry_index @@     got int @@
   drivers/net/dsa/mxl862xx/mxl862xx.c:671:30: sparse:     expected restricted __le16 [addressable] [assigned] [usertype] entry_index
   drivers/net/dsa/mxl862xx/mxl862xx.c:671:30: sparse:     got int
   drivers/net/dsa/mxl862xx/mxl862xx.c:686:77: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned short [usertype] final_filters_idx @@     got restricted __le16 [addressable] [assigned] [usertype] entry_index @@
   drivers/net/dsa/mxl862xx/mxl862xx.c:686:77: sparse:     expected unsigned short [usertype] final_filters_idx
   drivers/net/dsa/mxl862xx/mxl862xx.c:686:77: sparse:     got restricted __le16 [addressable] [assigned] [usertype] entry_index
   drivers/net/dsa/mxl862xx/mxl862xx.c:690:41: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le16 [addressable] [assigned] [usertype] extended_vlan_block_id @@     got unsigned short [usertype] block_id @@
   drivers/net/dsa/mxl862xx/mxl862xx.c:690:41: sparse:     expected restricted __le16 [addressable] [assigned] [usertype] extended_vlan_block_id
   drivers/net/dsa/mxl862xx/mxl862xx.c:690:41: sparse:     got unsigned short [usertype] block_id
   drivers/net/dsa/mxl862xx/mxl862xx.c:692:30: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le16 [addressable] [assigned] [usertype] entry_index @@     got int @@
   drivers/net/dsa/mxl862xx/mxl862xx.c:692:30: sparse:     expected restricted __le16 [addressable] [assigned] [usertype] entry_index
   drivers/net/dsa/mxl862xx/mxl862xx.c:692:30: sparse:     got int
   drivers/net/dsa/mxl862xx/mxl862xx.c:707:77: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned short [usertype] final_filters_idx @@     got restricted __le16 [addressable] [assigned] [usertype] entry_index @@
   drivers/net/dsa/mxl862xx/mxl862xx.c:707:77: sparse:     expected unsigned short [usertype] final_filters_idx
   drivers/net/dsa/mxl862xx/mxl862xx.c:707:77: sparse:     got restricted __le16 [addressable] [assigned] [usertype] entry_index
   drivers/net/dsa/mxl862xx/mxl862xx.c:711:41: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le16 [addressable] [assigned] [usertype] extended_vlan_block_id @@     got unsigned short [usertype] block_id @@
   drivers/net/dsa/mxl862xx/mxl862xx.c:711:41: sparse:     expected restricted __le16 [addressable] [assigned] [usertype] extended_vlan_block_id
   drivers/net/dsa/mxl862xx/mxl862xx.c:711:41: sparse:     got unsigned short [usertype] block_id
   drivers/net/dsa/mxl862xx/mxl862xx.c:713:30: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le16 [addressable] [assigned] [usertype] entry_index @@     got int @@
   drivers/net/dsa/mxl862xx/mxl862xx.c:713:30: sparse:     expected restricted __le16 [addressable] [assigned] [usertype] entry_index
   drivers/net/dsa/mxl862xx/mxl862xx.c:713:30: sparse:     got int
   drivers/net/dsa/mxl862xx/mxl862xx.c:728:77: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned short [usertype] final_filters_idx @@     got restricted __le16 [addressable] [assigned] [usertype] entry_index @@
   drivers/net/dsa/mxl862xx/mxl862xx.c:728:77: sparse:     expected unsigned short [usertype] final_filters_idx
   drivers/net/dsa/mxl862xx/mxl862xx.c:728:77: sparse:     got restricted __le16 [addressable] [assigned] [usertype] entry_index
   drivers/net/dsa/mxl862xx/mxl862xx.c:762:41: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le16 [addressable] [usertype] extended_vlan_block_id @@     got unsigned short [usertype] block_id @@
   drivers/net/dsa/mxl862xx/mxl862xx.c:762:41: sparse:     expected restricted __le16 [addressable] [usertype] extended_vlan_block_id
   drivers/net/dsa/mxl862xx/mxl862xx.c:762:41: sparse:     got unsigned short [usertype] block_id
   drivers/net/dsa/mxl862xx/mxl862xx.c:765:30: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le16 [addressable] [usertype] entry_index @@     got int @@
   drivers/net/dsa/mxl862xx/mxl862xx.c:765:30: sparse:     expected restricted __le16 [addressable] [usertype] entry_index
   drivers/net/dsa/mxl862xx/mxl862xx.c:765:30: sparse:     got int
   drivers/net/dsa/mxl862xx/mxl862xx.c:773:44: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [addressable] [assigned] [usertype] vid_val @@     got unsigned short [usertype] vid @@
   drivers/net/dsa/mxl862xx/mxl862xx.c:773:44: sparse:     expected restricted __le32 [addressable] [assigned] [usertype] vid_val
   drivers/net/dsa/mxl862xx/mxl862xx.c:773:44: sparse:     got unsigned short [usertype] vid
   drivers/net/dsa/mxl862xx/mxl862xx.c:788:33: sparse: sparse: incorrect type in assignment (different base types) @@     expected signed short @@     got restricted __le16 [addressable] [assigned] [usertype] entry_index @@
   drivers/net/dsa/mxl862xx/mxl862xx.c:788:33: sparse:     expected signed short
   drivers/net/dsa/mxl862xx/mxl862xx.c:788:33: sparse:     got restricted __le16 [addressable] [assigned] [usertype] entry_index
   drivers/net/dsa/mxl862xx/mxl862xx.c:792:41: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le16 [addressable] [assigned] [usertype] extended_vlan_block_id @@     got unsigned short [usertype] block_id @@
   drivers/net/dsa/mxl862xx/mxl862xx.c:792:41: sparse:     expected restricted __le16 [addressable] [assigned] [usertype] extended_vlan_block_id
   drivers/net/dsa/mxl862xx/mxl862xx.c:792:41: sparse:     got unsigned short [usertype] block_id
   drivers/net/dsa/mxl862xx/mxl862xx.c:795:30: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le16 [addressable] [assigned] [usertype] entry_index @@     got int @@
   drivers/net/dsa/mxl862xx/mxl862xx.c:795:30: sparse:     expected restricted __le16 [addressable] [assigned] [usertype] entry_index
   drivers/net/dsa/mxl862xx/mxl862xx.c:795:30: sparse:     got int
   drivers/net/dsa/mxl862xx/mxl862xx.c:803:44: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [addressable] [assigned] [usertype] vid_val @@     got unsigned short [usertype] vid @@
   drivers/net/dsa/mxl862xx/mxl862xx.c:803:44: sparse:     expected restricted __le32 [addressable] [assigned] [usertype] vid_val
   drivers/net/dsa/mxl862xx/mxl862xx.c:803:44: sparse:     got unsigned short [usertype] vid
   drivers/net/dsa/mxl862xx/mxl862xx.c:818:33: sparse: sparse: incorrect type in assignment (different base types) @@     expected signed short @@     got restricted __le16 [addressable] [assigned] [usertype] entry_index @@
   drivers/net/dsa/mxl862xx/mxl862xx.c:818:33: sparse:     expected signed short
   drivers/net/dsa/mxl862xx/mxl862xx.c:818:33: sparse:     got restricted __le16 [addressable] [assigned] [usertype] entry_index
   drivers/net/dsa/mxl862xx/mxl862xx.c:844:41: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le16 [addressable] [usertype] extended_vlan_block_id @@     got unsigned short [usertype] block_id @@
   drivers/net/dsa/mxl862xx/mxl862xx.c:844:41: sparse:     expected restricted __le16 [addressable] [usertype] extended_vlan_block_id
   drivers/net/dsa/mxl862xx/mxl862xx.c:844:41: sparse:     got unsigned short [usertype] block_id
   drivers/net/dsa/mxl862xx/mxl862xx.c:847:30: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le16 [addressable] [usertype] entry_index @@     got int @@
   drivers/net/dsa/mxl862xx/mxl862xx.c:847:30: sparse:     expected restricted __le16 [addressable] [usertype] entry_index
   drivers/net/dsa/mxl862xx/mxl862xx.c:847:30: sparse:     got int
>> drivers/net/dsa/mxl862xx/mxl862xx.c:860:47: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [addressable] [assigned] [usertype] vid_val @@     got unsigned short @@
   drivers/net/dsa/mxl862xx/mxl862xx.c:860:47: sparse:     expected restricted __le32 [addressable] [assigned] [usertype] vid_val
   drivers/net/dsa/mxl862xx/mxl862xx.c:860:47: sparse:     got unsigned short
   drivers/net/dsa/mxl862xx/mxl862xx.c:870:39: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned short [usertype] final_filters_idx @@     got restricted __le16 [addressable] [assigned] [usertype] entry_index @@
   drivers/net/dsa/mxl862xx/mxl862xx.c:870:39: sparse:     expected unsigned short [usertype] final_filters_idx
   drivers/net/dsa/mxl862xx/mxl862xx.c:870:39: sparse:     got restricted __le16 [addressable] [assigned] [usertype] entry_index
   drivers/net/dsa/mxl862xx/mxl862xx.c:875:41: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le16 [addressable] [assigned] [usertype] extended_vlan_block_id @@     got unsigned short [usertype] block_id @@
   drivers/net/dsa/mxl862xx/mxl862xx.c:875:41: sparse:     expected restricted __le16 [addressable] [assigned] [usertype] extended_vlan_block_id
   drivers/net/dsa/mxl862xx/mxl862xx.c:875:41: sparse:     got unsigned short [usertype] block_id
   drivers/net/dsa/mxl862xx/mxl862xx.c:876:30: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le16 [addressable] [assigned] [usertype] entry_index @@     got int @@
   drivers/net/dsa/mxl862xx/mxl862xx.c:876:30: sparse:     expected restricted __le16 [addressable] [assigned] [usertype] entry_index
   drivers/net/dsa/mxl862xx/mxl862xx.c:876:30: sparse:     got int
   drivers/net/dsa/mxl862xx/mxl862xx.c:889:47: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [addressable] [assigned] [usertype] vid_val @@     got unsigned short @@
   drivers/net/dsa/mxl862xx/mxl862xx.c:889:47: sparse:     expected restricted __le32 [addressable] [assigned] [usertype] vid_val
   drivers/net/dsa/mxl862xx/mxl862xx.c:889:47: sparse:     got unsigned short
   drivers/net/dsa/mxl862xx/mxl862xx.c:899:39: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned short [usertype] final_filters_idx @@     got restricted __le16 [addressable] [assigned] [usertype] entry_index @@
   drivers/net/dsa/mxl862xx/mxl862xx.c:899:39: sparse:     expected unsigned short [usertype] final_filters_idx
   drivers/net/dsa/mxl862xx/mxl862xx.c:899:39: sparse:     got restricted __le16 [addressable] [assigned] [usertype] entry_index
   drivers/net/dsa/mxl862xx/mxl862xx.c:903:41: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le16 [addressable] [assigned] [usertype] extended_vlan_block_id @@     got unsigned short [usertype] block_id @@
   drivers/net/dsa/mxl862xx/mxl862xx.c:903:41: sparse:     expected restricted __le16 [addressable] [assigned] [usertype] extended_vlan_block_id
   drivers/net/dsa/mxl862xx/mxl862xx.c:903:41: sparse:     got unsigned short [usertype] block_id
   drivers/net/dsa/mxl862xx/mxl862xx.c:904:30: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le16 [addressable] [assigned] [usertype] entry_index @@     got int @@
   drivers/net/dsa/mxl862xx/mxl862xx.c:904:30: sparse:     expected restricted __le16 [addressable] [assigned] [usertype] entry_index
   drivers/net/dsa/mxl862xx/mxl862xx.c:904:30: sparse:     got int
   drivers/net/dsa/mxl862xx/mxl862xx.c:917:47: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [addressable] [assigned] [usertype] vid_val @@     got unsigned short @@
   drivers/net/dsa/mxl862xx/mxl862xx.c:917:47: sparse:     expected restricted __le32 [addressable] [assigned] [usertype] vid_val
   drivers/net/dsa/mxl862xx/mxl862xx.c:917:47: sparse:     got unsigned short
   drivers/net/dsa/mxl862xx/mxl862xx.c:927:39: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned short [usertype] final_filters_idx @@     got restricted __le16 [addressable] [assigned] [usertype] entry_index @@
   drivers/net/dsa/mxl862xx/mxl862xx.c:927:39: sparse:     expected unsigned short [usertype] final_filters_idx
   drivers/net/dsa/mxl862xx/mxl862xx.c:927:39: sparse:     got restricted __le16 [addressable] [assigned] [usertype] entry_index
   drivers/net/dsa/mxl862xx/mxl862xx.c:952:41: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le16 [addressable] [usertype] extended_vlan_block_id @@     got unsigned short [usertype] block_id @@
   drivers/net/dsa/mxl862xx/mxl862xx.c:952:41: sparse:     expected restricted __le16 [addressable] [usertype] extended_vlan_block_id
   drivers/net/dsa/mxl862xx/mxl862xx.c:952:41: sparse:     got unsigned short [usertype] block_id
   drivers/net/dsa/mxl862xx/mxl862xx.c:970:55: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [addressable] [assigned] [usertype] vid_val @@     got unsigned short @@
   drivers/net/dsa/mxl862xx/mxl862xx.c:970:55: sparse:     expected restricted __le32 [addressable] [assigned] [usertype] vid_val
   drivers/net/dsa/mxl862xx/mxl862xx.c:970:55: sparse:     got unsigned short
>> drivers/net/dsa/mxl862xx/mxl862xx.c:974:55: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [addressable] [assigned] [usertype] vid_val @@     got unsigned short [usertype] pvid @@
   drivers/net/dsa/mxl862xx/mxl862xx.c:974:55: sparse:     expected restricted __le32 [addressable] [assigned] [usertype] vid_val
   drivers/net/dsa/mxl862xx/mxl862xx.c:974:55: sparse:     got unsigned short [usertype] pvid
   drivers/net/dsa/mxl862xx/mxl862xx.c:993:55: sparse: sparse: incorrect type in assignment (different base types) @@     expected signed short @@     got restricted __le16 [addressable] [assigned] [usertype] entry_index @@
   drivers/net/dsa/mxl862xx/mxl862xx.c:993:55: sparse:     expected signed short
   drivers/net/dsa/mxl862xx/mxl862xx.c:993:55: sparse:     got restricted __le16 [addressable] [assigned] [usertype] entry_index
   drivers/net/dsa/mxl862xx/mxl862xx.c:1011:38: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le16 [addressable] [assigned] [usertype] entry_index @@     got int @@
   drivers/net/dsa/mxl862xx/mxl862xx.c:1011:38: sparse:     expected restricted __le16 [addressable] [assigned] [usertype] entry_index
   drivers/net/dsa/mxl862xx/mxl862xx.c:1011:38: sparse:     got int
   drivers/net/dsa/mxl862xx/mxl862xx.c:1024:55: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [addressable] [assigned] [usertype] vid_val @@     got unsigned short @@
   drivers/net/dsa/mxl862xx/mxl862xx.c:1024:55: sparse:     expected restricted __le32 [addressable] [assigned] [usertype] vid_val
   drivers/net/dsa/mxl862xx/mxl862xx.c:1024:55: sparse:     got unsigned short
   drivers/net/dsa/mxl862xx/mxl862xx.c:1034:47: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned short [usertype] final_filters_idx @@     got restricted __le16 [addressable] [assigned] [usertype] entry_index @@
   drivers/net/dsa/mxl862xx/mxl862xx.c:1034:47: sparse:     expected unsigned short [usertype] final_filters_idx
   drivers/net/dsa/mxl862xx/mxl862xx.c:1034:47: sparse:     got restricted __le16 [addressable] [assigned] [usertype] entry_index
   drivers/net/dsa/mxl862xx/mxl862xx.c:1040:41: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le16 [addressable] [assigned] [usertype] extended_vlan_block_id @@     got unsigned short [usertype] block_id @@
   drivers/net/dsa/mxl862xx/mxl862xx.c:1040:41: sparse:     expected restricted __le16 [addressable] [assigned] [usertype] extended_vlan_block_id
   drivers/net/dsa/mxl862xx/mxl862xx.c:1040:41: sparse:     got unsigned short [usertype] block_id
   drivers/net/dsa/mxl862xx/mxl862xx.c:1041:30: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le16 [addressable] [assigned] [usertype] entry_index @@     got int @@
   drivers/net/dsa/mxl862xx/mxl862xx.c:1041:30: sparse:     expected restricted __le16 [addressable] [assigned] [usertype] entry_index
   drivers/net/dsa/mxl862xx/mxl862xx.c:1041:30: sparse:     got int
   drivers/net/dsa/mxl862xx/mxl862xx.c:1054:47: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [addressable] [assigned] [usertype] vid_val @@     got unsigned short @@
   drivers/net/dsa/mxl862xx/mxl862xx.c:1054:47: sparse:     expected restricted __le32 [addressable] [assigned] [usertype] vid_val
   drivers/net/dsa/mxl862xx/mxl862xx.c:1054:47: sparse:     got unsigned short
   drivers/net/dsa/mxl862xx/mxl862xx.c:1064:39: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned short [usertype] final_filters_idx @@     got restricted __le16 [addressable] [assigned] [usertype] entry_index @@
   drivers/net/dsa/mxl862xx/mxl862xx.c:1064:39: sparse:     expected unsigned short [usertype] final_filters_idx
   drivers/net/dsa/mxl862xx/mxl862xx.c:1064:39: sparse:     got restricted __le16 [addressable] [assigned] [usertype] entry_index
   drivers/net/dsa/mxl862xx/mxl862xx.c:1068:41: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le16 [addressable] [assigned] [usertype] extended_vlan_block_id @@     got unsigned short [usertype] block_id @@
   drivers/net/dsa/mxl862xx/mxl862xx.c:1068:41: sparse:     expected restricted __le16 [addressable] [assigned] [usertype] extended_vlan_block_id
   drivers/net/dsa/mxl862xx/mxl862xx.c:1068:41: sparse:     got unsigned short [usertype] block_id
   drivers/net/dsa/mxl862xx/mxl862xx.c:1069:30: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le16 [addressable] [assigned] [usertype] entry_index @@     got int @@
   drivers/net/dsa/mxl862xx/mxl862xx.c:1069:30: sparse:     expected restricted __le16 [addressable] [assigned] [usertype] entry_index
   drivers/net/dsa/mxl862xx/mxl862xx.c:1069:30: sparse:     got int
   drivers/net/dsa/mxl862xx/mxl862xx.c:1082:47: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [addressable] [assigned] [usertype] vid_val @@     got unsigned short @@
   drivers/net/dsa/mxl862xx/mxl862xx.c:1082:47: sparse:     expected restricted __le32 [addressable] [assigned] [usertype] vid_val
   drivers/net/dsa/mxl862xx/mxl862xx.c:1082:47: sparse:     got unsigned short
   drivers/net/dsa/mxl862xx/mxl862xx.c:1092:39: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned short [usertype] final_filters_idx @@     got restricted __le16 [addressable] [assigned] [usertype] entry_index @@
   drivers/net/dsa/mxl862xx/mxl862xx.c:1092:39: sparse:     expected unsigned short [usertype] final_filters_idx
   drivers/net/dsa/mxl862xx/mxl862xx.c:1092:39: sparse:     got restricted __le16 [addressable] [assigned] [usertype] entry_index
   drivers/net/dsa/mxl862xx/mxl862xx.c:1111:41: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le16 [addressable] [usertype] extended_vlan_block_id @@     got unsigned short [usertype] block_id @@
   drivers/net/dsa/mxl862xx/mxl862xx.c:1111:41: sparse:     expected restricted __le16 [addressable] [usertype] extended_vlan_block_id
   drivers/net/dsa/mxl862xx/mxl862xx.c:1111:41: sparse:     got unsigned short [usertype] block_id
   drivers/net/dsa/mxl862xx/mxl862xx.c:1115:38: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le16 [addressable] [usertype] entry_index @@     got int @@
   drivers/net/dsa/mxl862xx/mxl862xx.c:1115:38: sparse:     expected restricted __le16 [addressable] [usertype] entry_index
   drivers/net/dsa/mxl862xx/mxl862xx.c:1115:38: sparse:     got int
>> drivers/net/dsa/mxl862xx/mxl862xx.c:1117:38: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le16 [addressable] [usertype] entry_index @@     got unsigned short @@
   drivers/net/dsa/mxl862xx/mxl862xx.c:1117:38: sparse:     expected restricted __le16 [addressable] [usertype] entry_index
   drivers/net/dsa/mxl862xx/mxl862xx.c:1117:38: sparse:     got unsigned short
   drivers/net/dsa/mxl862xx/mxl862xx.c:1128:55: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [addressable] [assigned] [usertype] vid_val @@     got unsigned short [usertype] pvid @@
   drivers/net/dsa/mxl862xx/mxl862xx.c:1128:55: sparse:     expected restricted __le32 [addressable] [assigned] [usertype] vid_val
   drivers/net/dsa/mxl862xx/mxl862xx.c:1128:55: sparse:     got unsigned short [usertype] pvid
   drivers/net/dsa/mxl862xx/mxl862xx.c:1207:41: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le16 [addressable] [usertype] extended_vlan_block_id @@     got unsigned short [usertype] block_id @@
   drivers/net/dsa/mxl862xx/mxl862xx.c:1207:41: sparse:     expected restricted __le16 [addressable] [usertype] extended_vlan_block_id
   drivers/net/dsa/mxl862xx/mxl862xx.c:1207:41: sparse:     got unsigned short [usertype] block_id
   drivers/net/dsa/mxl862xx/mxl862xx.c:1208:30: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le16 [addressable] [usertype] entry_index @@     got unsigned short @@
   drivers/net/dsa/mxl862xx/mxl862xx.c:1208:30: sparse:     expected restricted __le16 [addressable] [usertype] entry_index
   drivers/net/dsa/mxl862xx/mxl862xx.c:1208:30: sparse:     got unsigned short
   drivers/net/dsa/mxl862xx/mxl862xx.c:1220:41: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le16 [addressable] [assigned] [usertype] extended_vlan_block_id @@     got unsigned short [usertype] block_id @@
   drivers/net/dsa/mxl862xx/mxl862xx.c:1220:41: sparse:     expected restricted __le16 [addressable] [assigned] [usertype] extended_vlan_block_id
   drivers/net/dsa/mxl862xx/mxl862xx.c:1220:41: sparse:     got unsigned short [usertype] block_id
>> drivers/net/dsa/mxl862xx/mxl862xx.c:1221:30: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le16 [addressable] [assigned] [usertype] entry_index @@     got unsigned short @@
   drivers/net/dsa/mxl862xx/mxl862xx.c:1221:30: sparse:     expected restricted __le16 [addressable] [assigned] [usertype] entry_index
   drivers/net/dsa/mxl862xx/mxl862xx.c:1221:30: sparse:     got unsigned short
   drivers/net/dsa/mxl862xx/mxl862xx.c:1233:41: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le16 [addressable] [assigned] [usertype] extended_vlan_block_id @@     got unsigned short [usertype] block_id @@
   drivers/net/dsa/mxl862xx/mxl862xx.c:1233:41: sparse:     expected restricted __le16 [addressable] [assigned] [usertype] extended_vlan_block_id
   drivers/net/dsa/mxl862xx/mxl862xx.c:1233:41: sparse:     got unsigned short [usertype] block_id
   drivers/net/dsa/mxl862xx/mxl862xx.c:1234:30: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le16 [addressable] [assigned] [usertype] entry_index @@     got unsigned short @@
   drivers/net/dsa/mxl862xx/mxl862xx.c:1234:30: sparse:     expected restricted __le16 [addressable] [assigned] [usertype] entry_index
   drivers/net/dsa/mxl862xx/mxl862xx.c:1234:30: sparse:     got unsigned short
   drivers/net/dsa/mxl862xx/mxl862xx.c:1252:41: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le16 [addressable] [assigned] [usertype] extended_vlan_block_id @@     got unsigned short [usertype] block_id @@
   drivers/net/dsa/mxl862xx/mxl862xx.c:1252:41: sparse:     expected restricted __le16 [addressable] [assigned] [usertype] extended_vlan_block_id
   drivers/net/dsa/mxl862xx/mxl862xx.c:1252:41: sparse:     got unsigned short [usertype] block_id
   drivers/net/dsa/mxl862xx/mxl862xx.c:1254:30: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le16 [addressable] [assigned] [usertype] entry_index @@     got int @@
   drivers/net/dsa/mxl862xx/mxl862xx.c:1254:30: sparse:     expected restricted __le16 [addressable] [assigned] [usertype] entry_index
   drivers/net/dsa/mxl862xx/mxl862xx.c:1254:30: sparse:     got int
   drivers/net/dsa/mxl862xx/mxl862xx.c:1258:44: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [addressable] [assigned] [usertype] vid_val @@     got unsigned short [usertype] vid @@
   drivers/net/dsa/mxl862xx/mxl862xx.c:1258:44: sparse:     expected restricted __le32 [addressable] [assigned] [usertype] vid_val
   drivers/net/dsa/mxl862xx/mxl862xx.c:1258:44: sparse:     got unsigned short [usertype] vid
   drivers/net/dsa/mxl862xx/mxl862xx.c:1273:47: sparse: sparse: incorrect type in assignment (different base types) @@     expected signed short @@     got restricted __le16 [addressable] [assigned] [usertype] entry_index @@
   drivers/net/dsa/mxl862xx/mxl862xx.c:1273:47: sparse:     expected signed short
   drivers/net/dsa/mxl862xx/mxl862xx.c:1273:47: sparse:     got restricted __le16 [addressable] [assigned] [usertype] entry_index
   drivers/net/dsa/mxl862xx/mxl862xx.c:1277:41: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le16 [addressable] [assigned] [usertype] extended_vlan_block_id @@     got unsigned short [usertype] block_id @@
   drivers/net/dsa/mxl862xx/mxl862xx.c:1277:41: sparse:     expected restricted __le16 [addressable] [assigned] [usertype] extended_vlan_block_id
   drivers/net/dsa/mxl862xx/mxl862xx.c:1277:41: sparse:     got unsigned short [usertype] block_id
   drivers/net/dsa/mxl862xx/mxl862xx.c:1279:30: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le16 [addressable] [assigned] [usertype] entry_index @@     got int @@
   drivers/net/dsa/mxl862xx/mxl862xx.c:1279:30: sparse:     expected restricted __le16 [addressable] [assigned] [usertype] entry_index
   drivers/net/dsa/mxl862xx/mxl862xx.c:1279:30: sparse:     got int
   drivers/net/dsa/mxl862xx/mxl862xx.c:1283:44: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [addressable] [assigned] [usertype] vid_val @@     got unsigned short [usertype] vid @@
   drivers/net/dsa/mxl862xx/mxl862xx.c:1283:44: sparse:     expected restricted __le32 [addressable] [assigned] [usertype] vid_val
   drivers/net/dsa/mxl862xx/mxl862xx.c:1283:44: sparse:     got unsigned short [usertype] vid
   drivers/net/dsa/mxl862xx/mxl862xx.c:1297:47: sparse: sparse: incorrect type in assignment (different base types) @@     expected signed short @@     got restricted __le16 [addressable] [assigned] [usertype] entry_index @@
   drivers/net/dsa/mxl862xx/mxl862xx.c:1297:47: sparse:     expected signed short
   drivers/net/dsa/mxl862xx/mxl862xx.c:1297:47: sparse:     got restricted __le16 [addressable] [assigned] [usertype] entry_index
   drivers/net/dsa/mxl862xx/mxl862xx.c:1329:49: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le16 [addressable] [usertype] extended_vlan_block_id @@     got unsigned short [usertype] block_id @@
   drivers/net/dsa/mxl862xx/mxl862xx.c:1329:49: sparse:     expected restricted __le16 [addressable] [usertype] extended_vlan_block_id
   drivers/net/dsa/mxl862xx/mxl862xx.c:1329:49: sparse:     got unsigned short [usertype] block_id
   drivers/net/dsa/mxl862xx/mxl862xx.c:1331:33: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le16 [addressable] [usertype] entry_index @@     got int @@
   drivers/net/dsa/mxl862xx/mxl862xx.c:1331:33: sparse:     expected restricted __le16 [addressable] [usertype] entry_index
   drivers/net/dsa/mxl862xx/mxl862xx.c:1331:33: sparse:     got int
   drivers/net/dsa/mxl862xx/mxl862xx.c:1346:85: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned short [usertype] final_filters_idx @@     got restricted __le16 [addressable] [assigned] [usertype] entry_index @@
   drivers/net/dsa/mxl862xx/mxl862xx.c:1346:85: sparse:     expected unsigned short [usertype] final_filters_idx
   drivers/net/dsa/mxl862xx/mxl862xx.c:1346:85: sparse:     got restricted __le16 [addressable] [assigned] [usertype] entry_index
   drivers/net/dsa/mxl862xx/mxl862xx.c:1352:41: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le16 [addressable] [assigned] [usertype] extended_vlan_block_id @@     got unsigned short [usertype] block_id @@
   drivers/net/dsa/mxl862xx/mxl862xx.c:1352:41: sparse:     expected restricted __le16 [addressable] [assigned] [usertype] extended_vlan_block_id
   drivers/net/dsa/mxl862xx/mxl862xx.c:1352:41: sparse:     got unsigned short [usertype] block_id
   drivers/net/dsa/mxl862xx/mxl862xx.c:1354:30: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le16 [addressable] [assigned] [usertype] entry_index @@     got int @@
   drivers/net/dsa/mxl862xx/mxl862xx.c:1354:30: sparse:     expected restricted __le16 [addressable] [assigned] [usertype] entry_index
   drivers/net/dsa/mxl862xx/mxl862xx.c:1354:30: sparse:     got int
   drivers/net/dsa/mxl862xx/mxl862xx.c:1368:77: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned short [usertype] final_filters_idx @@     got restricted __le16 [addressable] [assigned] [usertype] entry_index @@
   drivers/net/dsa/mxl862xx/mxl862xx.c:1368:77: sparse:     expected unsigned short [usertype] final_filters_idx
   drivers/net/dsa/mxl862xx/mxl862xx.c:1368:77: sparse:     got restricted __le16 [addressable] [assigned] [usertype] entry_index
   drivers/net/dsa/mxl862xx/mxl862xx.c:1372:41: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le16 [addressable] [assigned] [usertype] extended_vlan_block_id @@     got unsigned short [usertype] block_id @@
   drivers/net/dsa/mxl862xx/mxl862xx.c:1372:41: sparse:     expected restricted __le16 [addressable] [assigned] [usertype] extended_vlan_block_id
   drivers/net/dsa/mxl862xx/mxl862xx.c:1372:41: sparse:     got unsigned short [usertype] block_id
   drivers/net/dsa/mxl862xx/mxl862xx.c:1374:30: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le16 [addressable] [assigned] [usertype] entry_index @@     got int @@
   drivers/net/dsa/mxl862xx/mxl862xx.c:1374:30: sparse:     expected restricted __le16 [addressable] [assigned] [usertype] entry_index
   drivers/net/dsa/mxl862xx/mxl862xx.c:1374:30: sparse:     got int
   drivers/net/dsa/mxl862xx/mxl862xx.c:1389:77: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned short [usertype] final_filters_idx @@     got restricted __le16 [addressable] [assigned] [usertype] entry_index @@
   drivers/net/dsa/mxl862xx/mxl862xx.c:1389:77: sparse:     expected unsigned short [usertype] final_filters_idx
   drivers/net/dsa/mxl862xx/mxl862xx.c:1389:77: sparse:     got restricted __le16 [addressable] [assigned] [usertype] entry_index
   drivers/net/dsa/mxl862xx/mxl862xx.c:1406:41: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le16 [addressable] [assigned] [usertype] extended_vlan_block_id @@     got unsigned short [usertype] block_id @@
   drivers/net/dsa/mxl862xx/mxl862xx.c:1406:41: sparse:     expected restricted __le16 [addressable] [assigned] [usertype] extended_vlan_block_id
   drivers/net/dsa/mxl862xx/mxl862xx.c:1406:41: sparse:     got unsigned short [usertype] block_id
   drivers/net/dsa/mxl862xx/mxl862xx.c:1409:30: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le16 [addressable] [assigned] [usertype] entry_index @@     got int @@
   drivers/net/dsa/mxl862xx/mxl862xx.c:1409:30: sparse:     expected restricted __le16 [addressable] [assigned] [usertype] entry_index
   drivers/net/dsa/mxl862xx/mxl862xx.c:1409:30: sparse:     got int
   drivers/net/dsa/mxl862xx/mxl862xx.c:1417:44: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [addressable] [assigned] [usertype] vid_val @@     got unsigned short [usertype] vid @@
   drivers/net/dsa/mxl862xx/mxl862xx.c:1417:44: sparse:     expected restricted __le32 [addressable] [assigned] [usertype] vid_val
   drivers/net/dsa/mxl862xx/mxl862xx.c:1417:44: sparse:     got unsigned short [usertype] vid
   drivers/net/dsa/mxl862xx/mxl862xx.c:1439:33: sparse: sparse: incorrect type in assignment (different base types) @@     expected signed short @@     got restricted __le16 [addressable] [assigned] [usertype] entry_index @@
   drivers/net/dsa/mxl862xx/mxl862xx.c:1439:33: sparse:     expected signed short
   drivers/net/dsa/mxl862xx/mxl862xx.c:1439:33: sparse:     got restricted __le16 [addressable] [assigned] [usertype] entry_index
   drivers/net/dsa/mxl862xx/mxl862xx.c:1469:41: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le16 [addressable] [usertype] extended_vlan_block_id @@     got unsigned short [usertype] block_id @@
   drivers/net/dsa/mxl862xx/mxl862xx.c:1469:41: sparse:     expected restricted __le16 [addressable] [usertype] extended_vlan_block_id
   drivers/net/dsa/mxl862xx/mxl862xx.c:1469:41: sparse:     got unsigned short [usertype] block_id
   drivers/net/dsa/mxl862xx/mxl862xx.c:1471:30: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le16 [addressable] [usertype] entry_index @@     got int @@
   drivers/net/dsa/mxl862xx/mxl862xx.c:1471:30: sparse:     expected restricted __le16 [addressable] [usertype] entry_index
   drivers/net/dsa/mxl862xx/mxl862xx.c:1471:30: sparse:     got int
   drivers/net/dsa/mxl862xx/mxl862xx.c:1485:39: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned short [usertype] final_filters_idx @@     got restricted __le16 [addressable] [assigned] [usertype] entry_index @@
   drivers/net/dsa/mxl862xx/mxl862xx.c:1485:39: sparse:     expected unsigned short [usertype] final_filters_idx
   drivers/net/dsa/mxl862xx/mxl862xx.c:1485:39: sparse:     got restricted __le16 [addressable] [assigned] [usertype] entry_index
   drivers/net/dsa/mxl862xx/mxl862xx.c:1490:41: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le16 [addressable] [assigned] [usertype] extended_vlan_block_id @@     got unsigned short [usertype] block_id @@
   drivers/net/dsa/mxl862xx/mxl862xx.c:1490:41: sparse:     expected restricted __le16 [addressable] [assigned] [usertype] extended_vlan_block_id
   drivers/net/dsa/mxl862xx/mxl862xx.c:1490:41: sparse:     got unsigned short [usertype] block_id
   drivers/net/dsa/mxl862xx/mxl862xx.c:1492:30: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le16 [addressable] [assigned] [usertype] entry_index @@     got int @@
   drivers/net/dsa/mxl862xx/mxl862xx.c:1492:30: sparse:     expected restricted __le16 [addressable] [assigned] [usertype] entry_index
   drivers/net/dsa/mxl862xx/mxl862xx.c:1492:30: sparse:     got int
   drivers/net/dsa/mxl862xx/mxl862xx.c:1506:39: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned short [usertype] final_filters_idx @@     got restricted __le16 [addressable] [assigned] [usertype] entry_index @@
   drivers/net/dsa/mxl862xx/mxl862xx.c:1506:39: sparse:     expected unsigned short [usertype] final_filters_idx
   drivers/net/dsa/mxl862xx/mxl862xx.c:1506:39: sparse:     got restricted __le16 [addressable] [assigned] [usertype] entry_index
   drivers/net/dsa/mxl862xx/mxl862xx.c:1537:41: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le16 [addressable] [usertype] extended_vlan_block_id @@     got unsigned short [usertype] block_id @@
   drivers/net/dsa/mxl862xx/mxl862xx.c:1537:41: sparse:     expected restricted __le16 [addressable] [usertype] extended_vlan_block_id
   drivers/net/dsa/mxl862xx/mxl862xx.c:1537:41: sparse:     got unsigned short [usertype] block_id
   drivers/net/dsa/mxl862xx/mxl862xx.c:1540:30: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le16 [addressable] [usertype] entry_index @@     got int @@
   drivers/net/dsa/mxl862xx/mxl862xx.c:1540:30: sparse:     expected restricted __le16 [addressable] [usertype] entry_index
   drivers/net/dsa/mxl862xx/mxl862xx.c:1540:30: sparse:     got int
   drivers/net/dsa/mxl862xx/mxl862xx.c:1549:44: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [addressable] [assigned] [usertype] vid_val @@     got unsigned short [usertype] vid @@
   drivers/net/dsa/mxl862xx/mxl862xx.c:1549:44: sparse:     expected restricted __le32 [addressable] [assigned] [usertype] vid_val
   drivers/net/dsa/mxl862xx/mxl862xx.c:1549:44: sparse:     got unsigned short [usertype] vid
   drivers/net/dsa/mxl862xx/mxl862xx.c:1575:33: sparse: sparse: incorrect type in assignment (different base types) @@     expected signed short @@     got restricted __le16 [addressable] [assigned] [usertype] entry_index @@
   drivers/net/dsa/mxl862xx/mxl862xx.c:1575:33: sparse:     expected signed short
   drivers/net/dsa/mxl862xx/mxl862xx.c:1575:33: sparse:     got restricted __le16 [addressable] [assigned] [usertype] entry_index
   drivers/net/dsa/mxl862xx/mxl862xx.c:1613:41: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le16 [addressable] [usertype] extended_vlan_block_id @@     got unsigned short [usertype] block_id @@
   drivers/net/dsa/mxl862xx/mxl862xx.c:1613:41: sparse:     expected restricted __le16 [addressable] [usertype] extended_vlan_block_id
   drivers/net/dsa/mxl862xx/mxl862xx.c:1613:41: sparse:     got unsigned short [usertype] block_id
   drivers/net/dsa/mxl862xx/mxl862xx.c:1615:30: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le16 [addressable] [usertype] entry_index @@     got int @@
   drivers/net/dsa/mxl862xx/mxl862xx.c:1615:30: sparse:     expected restricted __le16 [addressable] [usertype] entry_index
   drivers/net/dsa/mxl862xx/mxl862xx.c:1615:30: sparse:     got int
   drivers/net/dsa/mxl862xx/mxl862xx.c:1626:78: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned short [usertype] final_filters_idx @@     got restricted __le16 [addressable] [assigned] [usertype] entry_index @@
   drivers/net/dsa/mxl862xx/mxl862xx.c:1626:78: sparse:     expected unsigned short [usertype] final_filters_idx
   drivers/net/dsa/mxl862xx/mxl862xx.c:1626:78: sparse:     got restricted __le16 [addressable] [assigned] [usertype] entry_index
   drivers/net/dsa/mxl862xx/mxl862xx.c:1630:41: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le16 [addressable] [assigned] [usertype] extended_vlan_block_id @@     got unsigned short [usertype] block_id @@
   drivers/net/dsa/mxl862xx/mxl862xx.c:1630:41: sparse:     expected restricted __le16 [addressable] [assigned] [usertype] extended_vlan_block_id
   drivers/net/dsa/mxl862xx/mxl862xx.c:1630:41: sparse:     got unsigned short [usertype] block_id
   drivers/net/dsa/mxl862xx/mxl862xx.c:1632:30: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le16 [addressable] [assigned] [usertype] entry_index @@     got int @@
   drivers/net/dsa/mxl862xx/mxl862xx.c:1632:30: sparse:     expected restricted __le16 [addressable] [assigned] [usertype] entry_index
   drivers/net/dsa/mxl862xx/mxl862xx.c:1632:30: sparse:     got int
   drivers/net/dsa/mxl862xx/mxl862xx.c:1643:78: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned short [usertype] final_filters_idx @@     got restricted __le16 [addressable] [assigned] [usertype] entry_index @@
   drivers/net/dsa/mxl862xx/mxl862xx.c:1643:78: sparse:     expected unsigned short [usertype] final_filters_idx
   drivers/net/dsa/mxl862xx/mxl862xx.c:1643:78: sparse:     got restricted __le16 [addressable] [assigned] [usertype] entry_index
   drivers/net/dsa/mxl862xx/mxl862xx.c:1647:41: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le16 [addressable] [assigned] [usertype] extended_vlan_block_id @@     got unsigned short [usertype] block_id @@
   drivers/net/dsa/mxl862xx/mxl862xx.c:1647:41: sparse:     expected restricted __le16 [addressable] [assigned] [usertype] extended_vlan_block_id
   drivers/net/dsa/mxl862xx/mxl862xx.c:1647:41: sparse:     got unsigned short [usertype] block_id
   drivers/net/dsa/mxl862xx/mxl862xx.c:1649:30: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le16 [addressable] [assigned] [usertype] entry_index @@     got int @@
   drivers/net/dsa/mxl862xx/mxl862xx.c:1649:30: sparse:     expected restricted __le16 [addressable] [assigned] [usertype] entry_index
   drivers/net/dsa/mxl862xx/mxl862xx.c:1649:30: sparse:     got int
   drivers/net/dsa/mxl862xx/mxl862xx.c:1666:55: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [addressable] [assigned] [usertype] vid_val @@     got unsigned short @@
   drivers/net/dsa/mxl862xx/mxl862xx.c:1666:55: sparse:     expected restricted __le32 [addressable] [assigned] [usertype] vid_val
   drivers/net/dsa/mxl862xx/mxl862xx.c:1666:55: sparse:     got unsigned short
   drivers/net/dsa/mxl862xx/mxl862xx.c:1670:55: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [addressable] [assigned] [usertype] vid_val @@     got unsigned short [usertype] pvid @@
   drivers/net/dsa/mxl862xx/mxl862xx.c:1670:55: sparse:     expected restricted __le32 [addressable] [assigned] [usertype] vid_val
   drivers/net/dsa/mxl862xx/mxl862xx.c:1670:55: sparse:     got unsigned short [usertype] pvid
   drivers/net/dsa/mxl862xx/mxl862xx.c:1690:78: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned short [usertype] final_filters_idx @@     got restricted __le16 [addressable] [assigned] [usertype] entry_index @@
   drivers/net/dsa/mxl862xx/mxl862xx.c:1690:78: sparse:     expected unsigned short [usertype] final_filters_idx
   drivers/net/dsa/mxl862xx/mxl862xx.c:1690:78: sparse:     got restricted __le16 [addressable] [assigned] [usertype] entry_index
   drivers/net/dsa/mxl862xx/mxl862xx.c:1695:41: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le16 [addressable] [assigned] [usertype] extended_vlan_block_id @@     got unsigned short [usertype] block_id @@
   drivers/net/dsa/mxl862xx/mxl862xx.c:1695:41: sparse:     expected restricted __le16 [addressable] [assigned] [usertype] extended_vlan_block_id
   drivers/net/dsa/mxl862xx/mxl862xx.c:1695:41: sparse:     got unsigned short [usertype] block_id
   drivers/net/dsa/mxl862xx/mxl862xx.c:1697:30: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le16 [addressable] [assigned] [usertype] entry_index @@     got int @@
   drivers/net/dsa/mxl862xx/mxl862xx.c:1697:30: sparse:     expected restricted __le16 [addressable] [assigned] [usertype] entry_index
   drivers/net/dsa/mxl862xx/mxl862xx.c:1697:30: sparse:     got int
   drivers/net/dsa/mxl862xx/mxl862xx.c:1712:78: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned short [usertype] final_filters_idx @@     got restricted __le16 [addressable] [assigned] [usertype] entry_index @@
   drivers/net/dsa/mxl862xx/mxl862xx.c:1712:78: sparse:     expected unsigned short [usertype] final_filters_idx
   drivers/net/dsa/mxl862xx/mxl862xx.c:1712:78: sparse:     got restricted __le16 [addressable] [assigned] [usertype] entry_index
   drivers/net/dsa/mxl862xx/mxl862xx.c:1717:41: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le16 [addressable] [assigned] [usertype] extended_vlan_block_id @@     got unsigned short [usertype] block_id @@
   drivers/net/dsa/mxl862xx/mxl862xx.c:1717:41: sparse:     expected restricted __le16 [addressable] [assigned] [usertype] extended_vlan_block_id
   drivers/net/dsa/mxl862xx/mxl862xx.c:1717:41: sparse:     got unsigned short [usertype] block_id
   drivers/net/dsa/mxl862xx/mxl862xx.c:1719:30: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le16 [addressable] [assigned] [usertype] entry_index @@     got int @@
   drivers/net/dsa/mxl862xx/mxl862xx.c:1719:30: sparse:     expected restricted __le16 [addressable] [assigned] [usertype] entry_index
   drivers/net/dsa/mxl862xx/mxl862xx.c:1719:30: sparse:     got int
   drivers/net/dsa/mxl862xx/mxl862xx.c:1735:78: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned short [usertype] final_filters_idx @@     got restricted __le16 [addressable] [assigned] [usertype] entry_index @@
   drivers/net/dsa/mxl862xx/mxl862xx.c:1735:78: sparse:     expected unsigned short [usertype] final_filters_idx
   drivers/net/dsa/mxl862xx/mxl862xx.c:1735:78: sparse:     got restricted __le16 [addressable] [assigned] [usertype] entry_index
   drivers/net/dsa/mxl862xx/mxl862xx.c:1750:41: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le16 [addressable] [assigned] [usertype] extended_vlan_block_id @@     got unsigned short [usertype] block_id @@
   drivers/net/dsa/mxl862xx/mxl862xx.c:1750:41: sparse:     expected restricted __le16 [addressable] [assigned] [usertype] extended_vlan_block_id
   drivers/net/dsa/mxl862xx/mxl862xx.c:1750:41: sparse:     got unsigned short [usertype] block_id
   drivers/net/dsa/mxl862xx/mxl862xx.c:1753:30: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le16 [addressable] [assigned] [usertype] entry_index @@     got int @@
   drivers/net/dsa/mxl862xx/mxl862xx.c:1753:30: sparse:     expected restricted __le16 [addressable] [assigned] [usertype] entry_index
   drivers/net/dsa/mxl862xx/mxl862xx.c:1753:30: sparse:     got int
   drivers/net/dsa/mxl862xx/mxl862xx.c:1760:44: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [addressable] [assigned] [usertype] vid_val @@     got unsigned short [usertype] vid @@
   drivers/net/dsa/mxl862xx/mxl862xx.c:1760:44: sparse:     expected restricted __le32 [addressable] [assigned] [usertype] vid_val
   drivers/net/dsa/mxl862xx/mxl862xx.c:1760:44: sparse:     got unsigned short [usertype] vid
   drivers/net/dsa/mxl862xx/mxl862xx.c:1764:47: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [addressable] [assigned] [usertype] vid_val @@     got unsigned short @@
   drivers/net/dsa/mxl862xx/mxl862xx.c:1764:47: sparse:     expected restricted __le32 [addressable] [assigned] [usertype] vid_val
   drivers/net/dsa/mxl862xx/mxl862xx.c:1764:47: sparse:     got unsigned short
   drivers/net/dsa/mxl862xx/mxl862xx.c:1782:33: sparse: sparse: incorrect type in assignment (different base types) @@     expected signed short @@     got restricted __le16 [addressable] [assigned] [usertype] entry_index @@
   drivers/net/dsa/mxl862xx/mxl862xx.c:1782:33: sparse:     expected signed short
   drivers/net/dsa/mxl862xx/mxl862xx.c:1782:33: sparse:     got restricted __le16 [addressable] [assigned] [usertype] entry_index
   drivers/net/dsa/mxl862xx/mxl862xx.c:1786:41: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le16 [addressable] [assigned] [usertype] extended_vlan_block_id @@     got unsigned short [usertype] block_id @@
   drivers/net/dsa/mxl862xx/mxl862xx.c:1786:41: sparse:     expected restricted __le16 [addressable] [assigned] [usertype] extended_vlan_block_id
   drivers/net/dsa/mxl862xx/mxl862xx.c:1786:41: sparse:     got unsigned short [usertype] block_id
   drivers/net/dsa/mxl862xx/mxl862xx.c:1789:30: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le16 [addressable] [assigned] [usertype] entry_index @@     got int @@
   drivers/net/dsa/mxl862xx/mxl862xx.c:1789:30: sparse:     expected restricted __le16 [addressable] [assigned] [usertype] entry_index
   drivers/net/dsa/mxl862xx/mxl862xx.c:1789:30: sparse:     got int
   drivers/net/dsa/mxl862xx/mxl862xx.c:1796:44: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [addressable] [assigned] [usertype] vid_val @@     got unsigned short [usertype] vid @@
   drivers/net/dsa/mxl862xx/mxl862xx.c:1796:44: sparse:     expected restricted __le32 [addressable] [assigned] [usertype] vid_val
   drivers/net/dsa/mxl862xx/mxl862xx.c:1796:44: sparse:     got unsigned short [usertype] vid
   drivers/net/dsa/mxl862xx/mxl862xx.c:1800:47: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [addressable] [assigned] [usertype] vid_val @@     got unsigned short @@
   drivers/net/dsa/mxl862xx/mxl862xx.c:1800:47: sparse:     expected restricted __le32 [addressable] [assigned] [usertype] vid_val
   drivers/net/dsa/mxl862xx/mxl862xx.c:1800:47: sparse:     got unsigned short
   drivers/net/dsa/mxl862xx/mxl862xx.c:1818:33: sparse: sparse: incorrect type in assignment (different base types) @@     expected signed short @@     got restricted __le16 [addressable] [assigned] [usertype] entry_index @@
   drivers/net/dsa/mxl862xx/mxl862xx.c:1818:33: sparse:     expected signed short
   drivers/net/dsa/mxl862xx/mxl862xx.c:1818:33: sparse:     got restricted __le16 [addressable] [assigned] [usertype] entry_index
   drivers/net/dsa/mxl862xx/mxl862xx.c:1858:41: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le16 [addressable] [usertype] extended_vlan_block_id @@     got unsigned short [usertype] block_id @@
   drivers/net/dsa/mxl862xx/mxl862xx.c:1858:41: sparse:     expected restricted __le16 [addressable] [usertype] extended_vlan_block_id
   drivers/net/dsa/mxl862xx/mxl862xx.c:1858:41: sparse:     got unsigned short [usertype] block_id
   drivers/net/dsa/mxl862xx/mxl862xx.c:1861:30: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le16 [addressable] [usertype] entry_index @@     got int @@
   drivers/net/dsa/mxl862xx/mxl862xx.c:1861:30: sparse:     expected restricted __le16 [addressable] [usertype] entry_index
   drivers/net/dsa/mxl862xx/mxl862xx.c:1861:30: sparse:     got int
   drivers/net/dsa/mxl862xx/mxl862xx.c:1868:44: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [addressable] [assigned] [usertype] vid_val @@     got unsigned short [usertype] vid @@
   drivers/net/dsa/mxl862xx/mxl862xx.c:1868:44: sparse:     expected restricted __le32 [addressable] [assigned] [usertype] vid_val
   drivers/net/dsa/mxl862xx/mxl862xx.c:1868:44: sparse:     got unsigned short [usertype] vid
>> drivers/net/dsa/mxl862xx/mxl862xx.c:1871:47: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le16 [addressable] [assigned] [usertype] new_bridge_port_id @@     got unsigned short [usertype] bridge_port_cpu @@
   drivers/net/dsa/mxl862xx/mxl862xx.c:1871:47: sparse:     expected restricted __le16 [addressable] [assigned] [usertype] new_bridge_port_id
   drivers/net/dsa/mxl862xx/mxl862xx.c:1871:47: sparse:     got unsigned short [usertype] bridge_port_cpu
   drivers/net/dsa/mxl862xx/mxl862xx.c:1885:33: sparse: sparse: incorrect type in assignment (different base types) @@     expected signed short @@     got restricted __le16 [addressable] [assigned] [usertype] entry_index @@
   drivers/net/dsa/mxl862xx/mxl862xx.c:1885:33: sparse:     expected signed short
   drivers/net/dsa/mxl862xx/mxl862xx.c:1885:33: sparse:     got restricted __le16 [addressable] [assigned] [usertype] entry_index
   drivers/net/dsa/mxl862xx/mxl862xx.c:1889:41: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le16 [addressable] [assigned] [usertype] extended_vlan_block_id @@     got unsigned short [usertype] block_id @@
   drivers/net/dsa/mxl862xx/mxl862xx.c:1889:41: sparse:     expected restricted __le16 [addressable] [assigned] [usertype] extended_vlan_block_id
   drivers/net/dsa/mxl862xx/mxl862xx.c:1889:41: sparse:     got unsigned short [usertype] block_id
   drivers/net/dsa/mxl862xx/mxl862xx.c:1892:30: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le16 [addressable] [assigned] [usertype] entry_index @@     got int @@
   drivers/net/dsa/mxl862xx/mxl862xx.c:1892:30: sparse:     expected restricted __le16 [addressable] [assigned] [usertype] entry_index
   drivers/net/dsa/mxl862xx/mxl862xx.c:1892:30: sparse:     got int
   drivers/net/dsa/mxl862xx/mxl862xx.c:1899:44: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [addressable] [assigned] [usertype] vid_val @@     got unsigned short [usertype] vid @@
   drivers/net/dsa/mxl862xx/mxl862xx.c:1899:44: sparse:     expected restricted __le32 [addressable] [assigned] [usertype] vid_val
   drivers/net/dsa/mxl862xx/mxl862xx.c:1899:44: sparse:     got unsigned short [usertype] vid
   drivers/net/dsa/mxl862xx/mxl862xx.c:1902:47: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le16 [addressable] [assigned] [usertype] new_bridge_port_id @@     got unsigned short [usertype] bridge_port_cpu @@
   drivers/net/dsa/mxl862xx/mxl862xx.c:1902:47: sparse:     expected restricted __le16 [addressable] [assigned] [usertype] new_bridge_port_id
   drivers/net/dsa/mxl862xx/mxl862xx.c:1902:47: sparse:     got unsigned short [usertype] bridge_port_cpu
   drivers/net/dsa/mxl862xx/mxl862xx.c:1916:33: sparse: sparse: incorrect type in assignment (different base types) @@     expected signed short @@     got restricted __le16 [addressable] [assigned] [usertype] entry_index @@
   drivers/net/dsa/mxl862xx/mxl862xx.c:1916:33: sparse:     expected signed short
   drivers/net/dsa/mxl862xx/mxl862xx.c:1916:33: sparse:     got restricted __le16 [addressable] [assigned] [usertype] entry_index
   drivers/net/dsa/mxl862xx/mxl862xx.c:1946:41: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le16 [addressable] [usertype] extended_vlan_block_id @@     got unsigned short [usertype] block_id @@
   drivers/net/dsa/mxl862xx/mxl862xx.c:1946:41: sparse:     expected restricted __le16 [addressable] [usertype] extended_vlan_block_id
   drivers/net/dsa/mxl862xx/mxl862xx.c:1946:41: sparse:     got unsigned short [usertype] block_id
   drivers/net/dsa/mxl862xx/mxl862xx.c:1948:30: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le16 [addressable] [usertype] entry_index @@     got unsigned short @@
   drivers/net/dsa/mxl862xx/mxl862xx.c:1948:30: sparse:     expected restricted __le16 [addressable] [usertype] entry_index
   drivers/net/dsa/mxl862xx/mxl862xx.c:1948:30: sparse:     got unsigned short
   drivers/net/dsa/mxl862xx/mxl862xx.c:1968:41: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le16 [addressable] [assigned] [usertype] extended_vlan_block_id @@     got unsigned short [usertype] block_id @@
   drivers/net/dsa/mxl862xx/mxl862xx.c:1968:41: sparse:     expected restricted __le16 [addressable] [assigned] [usertype] extended_vlan_block_id
   drivers/net/dsa/mxl862xx/mxl862xx.c:1968:41: sparse:     got unsigned short [usertype] block_id
   drivers/net/dsa/mxl862xx/mxl862xx.c:1970:30: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le16 [addressable] [assigned] [usertype] entry_index @@     got unsigned short @@
   drivers/net/dsa/mxl862xx/mxl862xx.c:1970:30: sparse:     expected restricted __le16 [addressable] [assigned] [usertype] entry_index
   drivers/net/dsa/mxl862xx/mxl862xx.c:1970:30: sparse:     got unsigned short
   drivers/net/dsa/mxl862xx/mxl862xx.c:1990:41: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le16 [addressable] [assigned] [usertype] extended_vlan_block_id @@     got unsigned short [usertype] block_id @@
   drivers/net/dsa/mxl862xx/mxl862xx.c:1990:41: sparse:     expected restricted __le16 [addressable] [assigned] [usertype] extended_vlan_block_id
   drivers/net/dsa/mxl862xx/mxl862xx.c:1990:41: sparse:     got unsigned short [usertype] block_id
   drivers/net/dsa/mxl862xx/mxl862xx.c:1992:30: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le16 [addressable] [assigned] [usertype] entry_index @@     got unsigned short @@
   drivers/net/dsa/mxl862xx/mxl862xx.c:1992:30: sparse:     expected restricted __le16 [addressable] [assigned] [usertype] entry_index
   drivers/net/dsa/mxl862xx/mxl862xx.c:1992:30: sparse:     got unsigned short
   drivers/net/dsa/mxl862xx/mxl862xx.c:2011:55: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [addressable] [assigned] [usertype] vid_val @@     got unsigned short [usertype] pvid @@
   drivers/net/dsa/mxl862xx/mxl862xx.c:2011:55: sparse:     expected restricted __le32 [addressable] [assigned] [usertype] vid_val
   drivers/net/dsa/mxl862xx/mxl862xx.c:2011:55: sparse:     got unsigned short [usertype] pvid
   drivers/net/dsa/mxl862xx/mxl862xx.c:2021:41: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le16 [addressable] [assigned] [usertype] extended_vlan_block_id @@     got unsigned short [usertype] block_id @@
   drivers/net/dsa/mxl862xx/mxl862xx.c:2021:41: sparse:     expected restricted __le16 [addressable] [assigned] [usertype] extended_vlan_block_id
   drivers/net/dsa/mxl862xx/mxl862xx.c:2021:41: sparse:     got unsigned short [usertype] block_id
   drivers/net/dsa/mxl862xx/mxl862xx.c:2023:30: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le16 [addressable] [assigned] [usertype] entry_index @@     got unsigned short @@
   drivers/net/dsa/mxl862xx/mxl862xx.c:2023:30: sparse:     expected restricted __le16 [addressable] [assigned] [usertype] entry_index
   drivers/net/dsa/mxl862xx/mxl862xx.c:2023:30: sparse:     got unsigned short
   drivers/net/dsa/mxl862xx/mxl862xx.c:2037:41: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le16 [addressable] [assigned] [usertype] extended_vlan_block_id @@     got unsigned short [usertype] block_id @@
   drivers/net/dsa/mxl862xx/mxl862xx.c:2037:41: sparse:     expected restricted __le16 [addressable] [assigned] [usertype] extended_vlan_block_id
   drivers/net/dsa/mxl862xx/mxl862xx.c:2037:41: sparse:     got unsigned short [usertype] block_id
   drivers/net/dsa/mxl862xx/mxl862xx.c:2039:30: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le16 [addressable] [assigned] [usertype] entry_index @@     got unsigned short @@
   drivers/net/dsa/mxl862xx/mxl862xx.c:2039:30: sparse:     expected restricted __le16 [addressable] [assigned] [usertype] entry_index
   drivers/net/dsa/mxl862xx/mxl862xx.c:2039:30: sparse:     got unsigned short
   drivers/net/dsa/mxl862xx/mxl862xx.c:2061:41: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le16 [addressable] [assigned] [usertype] extended_vlan_block_id @@     got unsigned short [usertype] block_id @@
   drivers/net/dsa/mxl862xx/mxl862xx.c:2061:41: sparse:     expected restricted __le16 [addressable] [assigned] [usertype] extended_vlan_block_id
   drivers/net/dsa/mxl862xx/mxl862xx.c:2061:41: sparse:     got unsigned short [usertype] block_id
   drivers/net/dsa/mxl862xx/mxl862xx.c:2064:30: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le16 [addressable] [assigned] [usertype] entry_index @@     got int @@
   drivers/net/dsa/mxl862xx/mxl862xx.c:2064:30: sparse:     expected restricted __le16 [addressable] [assigned] [usertype] entry_index
   drivers/net/dsa/mxl862xx/mxl862xx.c:2064:30: sparse:     got int
   drivers/net/dsa/mxl862xx/mxl862xx.c:2071:44: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [addressable] [assigned] [usertype] vid_val @@     got unsigned short [usertype] vid @@
   drivers/net/dsa/mxl862xx/mxl862xx.c:2071:44: sparse:     expected restricted __le32 [addressable] [assigned] [usertype] vid_val
   drivers/net/dsa/mxl862xx/mxl862xx.c:2071:44: sparse:     got unsigned short [usertype] vid
   drivers/net/dsa/mxl862xx/mxl862xx.c:2083:33: sparse: sparse: incorrect type in assignment (different base types) @@     expected signed short @@     got restricted __le16 [addressable] [assigned] [usertype] entry_index @@
   drivers/net/dsa/mxl862xx/mxl862xx.c:2083:33: sparse:     expected signed short
   drivers/net/dsa/mxl862xx/mxl862xx.c:2083:33: sparse:     got restricted __le16 [addressable] [assigned] [usertype] entry_index
   drivers/net/dsa/mxl862xx/mxl862xx.c:2087:41: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le16 [addressable] [assigned] [usertype] extended_vlan_block_id @@     got unsigned short [usertype] block_id @@
   drivers/net/dsa/mxl862xx/mxl862xx.c:2087:41: sparse:     expected restricted __le16 [addressable] [assigned] [usertype] extended_vlan_block_id
   drivers/net/dsa/mxl862xx/mxl862xx.c:2087:41: sparse:     got unsigned short [usertype] block_id
   drivers/net/dsa/mxl862xx/mxl862xx.c:2090:30: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le16 [addressable] [assigned] [usertype] entry_index @@     got int @@
   drivers/net/dsa/mxl862xx/mxl862xx.c:2090:30: sparse:     expected restricted __le16 [addressable] [assigned] [usertype] entry_index
   drivers/net/dsa/mxl862xx/mxl862xx.c:2090:30: sparse:     got int
   drivers/net/dsa/mxl862xx/mxl862xx.c:2097:44: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [addressable] [assigned] [usertype] vid_val @@     got unsigned short [usertype] vid @@
   drivers/net/dsa/mxl862xx/mxl862xx.c:2097:44: sparse:     expected restricted __le32 [addressable] [assigned] [usertype] vid_val
   drivers/net/dsa/mxl862xx/mxl862xx.c:2097:44: sparse:     got unsigned short [usertype] vid
   drivers/net/dsa/mxl862xx/mxl862xx.c:2109:33: sparse: sparse: incorrect type in assignment (different base types) @@     expected signed short @@     got restricted __le16 [addressable] [assigned] [usertype] entry_index @@
   drivers/net/dsa/mxl862xx/mxl862xx.c:2109:33: sparse:     expected signed short
   drivers/net/dsa/mxl862xx/mxl862xx.c:2109:33: sparse:     got restricted __le16 [addressable] [assigned] [usertype] entry_index
>> drivers/net/dsa/mxl862xx/mxl862xx.c:2285:65: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le16 [assigned] [usertype] egress_extended_vlan_block_id @@     got unsigned short [usertype] block_id @@
   drivers/net/dsa/mxl862xx/mxl862xx.c:2285:65: sparse:     expected restricted __le16 [assigned] [usertype] egress_extended_vlan_block_id
   drivers/net/dsa/mxl862xx/mxl862xx.c:2285:65: sparse:     got unsigned short [usertype] block_id
>> drivers/net/dsa/mxl862xx/mxl862xx.c:2288:66: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le16 [assigned] [usertype] ingress_extended_vlan_block_id @@     got unsigned short [usertype] block_id @@
   drivers/net/dsa/mxl862xx/mxl862xx.c:2288:66: sparse:     expected restricted __le16 [assigned] [usertype] ingress_extended_vlan_block_id
   drivers/net/dsa/mxl862xx/mxl862xx.c:2288:66: sparse:     got unsigned short [usertype] block_id
   drivers/net/dsa/mxl862xx/mxl862xx.c:2351:65: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le16 [assigned] [usertype] egress_extended_vlan_block_id @@     got unsigned short [usertype] block_id @@
   drivers/net/dsa/mxl862xx/mxl862xx.c:2351:65: sparse:     expected restricted __le16 [assigned] [usertype] egress_extended_vlan_block_id
   drivers/net/dsa/mxl862xx/mxl862xx.c:2351:65: sparse:     got unsigned short [usertype] block_id
   drivers/net/dsa/mxl862xx/mxl862xx.c:2354:66: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le16 [assigned] [usertype] ingress_extended_vlan_block_id @@     got unsigned short [usertype] block_id @@
   drivers/net/dsa/mxl862xx/mxl862xx.c:2354:66: sparse:     expected restricted __le16 [assigned] [usertype] ingress_extended_vlan_block_id
   drivers/net/dsa/mxl862xx/mxl862xx.c:2354:66: sparse:     got unsigned short [usertype] block_id
   drivers/net/dsa/mxl862xx/mxl862xx.c:2371:36: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le16 [usertype] bridge_port_id @@     got int @@
   drivers/net/dsa/mxl862xx/mxl862xx.c:2371:36: sparse:     expected restricted __le16 [usertype] bridge_port_id
   drivers/net/dsa/mxl862xx/mxl862xx.c:2371:36: sparse:     got int
   drivers/net/dsa/mxl862xx/mxl862xx.c:2376:51: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le16 [assigned] [usertype] egress_extended_vlan_block_id @@     got unsigned short [usertype] block_id @@
   drivers/net/dsa/mxl862xx/mxl862xx.c:2376:51: sparse:     expected restricted __le16 [assigned] [usertype] egress_extended_vlan_block_id
   drivers/net/dsa/mxl862xx/mxl862xx.c:2376:51: sparse:     got unsigned short [usertype] block_id
   drivers/net/dsa/mxl862xx/mxl862xx.c:2379:52: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le16 [assigned] [usertype] ingress_extended_vlan_block_id @@     got unsigned short [usertype] block_id @@
   drivers/net/dsa/mxl862xx/mxl862xx.c:2379:52: sparse:     expected restricted __le16 [assigned] [usertype] ingress_extended_vlan_block_id
   drivers/net/dsa/mxl862xx/mxl862xx.c:2379:52: sparse:     got unsigned short [usertype] block_id
>> drivers/net/dsa/mxl862xx/mxl862xx.c:2507:41: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned short [usertype] bridge_id @@     got restricted __le16 [addressable] [usertype] bridge_id @@
   drivers/net/dsa/mxl862xx/mxl862xx.c:2507:41: sparse:     expected unsigned short [usertype] bridge_id
   drivers/net/dsa/mxl862xx/mxl862xx.c:2507:41: sparse:     got restricted __le16 [addressable] [usertype] bridge_id
>> drivers/net/dsa/mxl862xx/mxl862xx.c:2557:32: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le16 [usertype] bridge_id @@     got unsigned short [usertype] bridge_id @@
   drivers/net/dsa/mxl862xx/mxl862xx.c:2557:32: sparse:     expected restricted __le16 [usertype] bridge_id
   drivers/net/dsa/mxl862xx/mxl862xx.c:2557:32: sparse:     got unsigned short [usertype] bridge_id
>> drivers/net/dsa/mxl862xx/mxl862xx.c:2623:35: sparse: sparse: incorrect type in initializer (different base types) @@     expected restricted __le16 [usertype] bridge_port_id @@     got int @@
   drivers/net/dsa/mxl862xx/mxl862xx.c:2623:35: sparse:     expected restricted __le16 [usertype] bridge_port_id
   drivers/net/dsa/mxl862xx/mxl862xx.c:2623:35: sparse:     got int
>> drivers/net/dsa/mxl862xx/mxl862xx.c:2726:25: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [addressable] [assigned] [usertype] age_timer @@     got unsigned int @@
   drivers/net/dsa/mxl862xx/mxl862xx.c:2726:25: sparse:     expected restricted __le32 [addressable] [assigned] [usertype] age_timer
   drivers/net/dsa/mxl862xx/mxl862xx.c:2726:25: sparse:     got unsigned int
   drivers/net/dsa/mxl862xx/mxl862xx.c:2756:49: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned short [usertype] bridge_id @@     got restricted __le16 [addressable] [usertype] bridge_id @@
   drivers/net/dsa/mxl862xx/mxl862xx.c:2756:49: sparse:     expected unsigned short [usertype] bridge_id
   drivers/net/dsa/mxl862xx/mxl862xx.c:2756:49: sparse:     got restricted __le16 [addressable] [usertype] bridge_id
   drivers/net/dsa/mxl862xx/mxl862xx.c:2793:57: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le16 [assigned] [usertype] egress_extended_vlan_block_id @@     got unsigned short [usertype] block_id @@
   drivers/net/dsa/mxl862xx/mxl862xx.c:2793:57: sparse:     expected restricted __le16 [assigned] [usertype] egress_extended_vlan_block_id
   drivers/net/dsa/mxl862xx/mxl862xx.c:2793:57: sparse:     got unsigned short [usertype] block_id
   drivers/net/dsa/mxl862xx/mxl862xx.c:2796:58: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le16 [assigned] [usertype] ingress_extended_vlan_block_id @@     got unsigned short [usertype] block_id @@
   drivers/net/dsa/mxl862xx/mxl862xx.c:2796:58: sparse:     expected restricted __le16 [assigned] [usertype] ingress_extended_vlan_block_id
   drivers/net/dsa/mxl862xx/mxl862xx.c:2796:58: sparse:     got unsigned short [usertype] block_id
   drivers/net/dsa/mxl862xx/mxl862xx.c:2809:44: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le16 [usertype] bridge_port_id @@     got int @@
   drivers/net/dsa/mxl862xx/mxl862xx.c:2809:44: sparse:     expected restricted __le16 [usertype] bridge_port_id
   drivers/net/dsa/mxl862xx/mxl862xx.c:2809:44: sparse:     got int
   drivers/net/dsa/mxl862xx/mxl862xx.c:2813:59: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le16 [assigned] [usertype] egress_extended_vlan_block_id @@     got unsigned short [usertype] block_id @@
   drivers/net/dsa/mxl862xx/mxl862xx.c:2813:59: sparse:     expected restricted __le16 [assigned] [usertype] egress_extended_vlan_block_id
   drivers/net/dsa/mxl862xx/mxl862xx.c:2813:59: sparse:     got unsigned short [usertype] block_id
   drivers/net/dsa/mxl862xx/mxl862xx.c:2816:60: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le16 [assigned] [usertype] ingress_extended_vlan_block_id @@     got unsigned short [usertype] block_id @@
   drivers/net/dsa/mxl862xx/mxl862xx.c:2816:60: sparse:     expected restricted __le16 [assigned] [usertype] ingress_extended_vlan_block_id
   drivers/net/dsa/mxl862xx/mxl862xx.c:2816:60: sparse:     got unsigned short [usertype] block_id
>> drivers/net/dsa/mxl862xx/mxl862xx.c:2836:51: sparse: sparse: incorrect type in initializer (different base types) @@     expected restricted __le16 [usertype] bridge_id @@     got unsigned short [usertype] bridge_id @@
   drivers/net/dsa/mxl862xx/mxl862xx.c:2836:51: sparse:     expected restricted __le16 [usertype] bridge_id
   drivers/net/dsa/mxl862xx/mxl862xx.c:2836:51: sparse:     got unsigned short [usertype] bridge_id
>> drivers/net/dsa/mxl862xx/mxl862xx.c:2975:28: sparse: sparse: incorrect type in initializer (different base types) @@     expected restricted __le16 [usertype] port_id @@     got int @@
   drivers/net/dsa/mxl862xx/mxl862xx.c:2975:28: sparse:     expected restricted __le16 [usertype] port_id
   drivers/net/dsa/mxl862xx/mxl862xx.c:2975:28: sparse:     got int
>> drivers/net/dsa/mxl862xx/mxl862xx.c:3046:28: sparse: sparse: incorrect type in initializer (different base types) @@     expected restricted __le16 [usertype] port_id @@     got unsigned int @@
   drivers/net/dsa/mxl862xx/mxl862xx.c:3046:28: sparse:     expected restricted __le16 [usertype] port_id
   drivers/net/dsa/mxl862xx/mxl862xx.c:3046:28: sparse:     got unsigned int
   drivers/net/dsa/mxl862xx/mxl862xx.c:3067:28: sparse: sparse: incorrect type in initializer (different base types) @@     expected restricted __le16 [usertype] port_id @@     got unsigned int @@
   drivers/net/dsa/mxl862xx/mxl862xx.c:3067:28: sparse:     expected restricted __le16 [usertype] port_id
   drivers/net/dsa/mxl862xx/mxl862xx.c:3067:28: sparse:     got unsigned int
   drivers/net/dsa/mxl862xx/mxl862xx.c:3074:28: sparse: sparse: incorrect type in initializer (different base types) @@     expected restricted __le16 [usertype] port_id @@     got unsigned int @@
   drivers/net/dsa/mxl862xx/mxl862xx.c:3074:28: sparse:     expected restricted __le16 [usertype] port_id
   drivers/net/dsa/mxl862xx/mxl862xx.c:3074:28: sparse:     got unsigned int
   drivers/net/dsa/mxl862xx/mxl862xx.c:3147:28: sparse: sparse: incorrect type in initializer (different base types) @@     expected restricted __le16 [usertype] port_id @@     got int @@
   drivers/net/dsa/mxl862xx/mxl862xx.c:3147:28: sparse:     expected restricted __le16 [usertype] port_id
   drivers/net/dsa/mxl862xx/mxl862xx.c:3147:28: sparse:     got int
>> drivers/net/dsa/mxl862xx/mxl862xx.c:3278:28: sparse: sparse: incorrect type in initializer (different base types) @@     expected restricted __le32 [usertype] port_id @@     got int @@
   drivers/net/dsa/mxl862xx/mxl862xx.c:3278:28: sparse:     expected restricted __le32 [usertype] port_id
   drivers/net/dsa/mxl862xx/mxl862xx.c:3278:28: sparse:     got int
>> drivers/net/dsa/mxl862xx/mxl862xx.c:3279:28: sparse: sparse: incorrect type in initializer (different base types) @@     expected restricted __le16 [usertype] tci @@     got int @@
   drivers/net/dsa/mxl862xx/mxl862xx.c:3279:28: sparse:     expected restricted __le16 [usertype] tci
   drivers/net/dsa/mxl862xx/mxl862xx.c:3279:28: sparse:     got int
>> drivers/net/dsa/mxl862xx/mxl862xx.c:3294:27: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le16 [addressable] [usertype] fid @@     got unsigned short [usertype] bridge_id @@
   drivers/net/dsa/mxl862xx/mxl862xx.c:3294:27: sparse:     expected restricted __le16 [addressable] [usertype] fid
   drivers/net/dsa/mxl862xx/mxl862xx.c:3294:27: sparse:     got unsigned short [usertype] bridge_id
   drivers/net/dsa/mxl862xx/mxl862xx.c:3310:28: sparse: sparse: incorrect type in initializer (different base types) @@     expected restricted __le16 [usertype] tci @@     got int @@
   drivers/net/dsa/mxl862xx/mxl862xx.c:3310:28: sparse:     expected restricted __le16 [usertype] tci
   drivers/net/dsa/mxl862xx/mxl862xx.c:3310:28: sparse:     got int
   drivers/net/dsa/mxl862xx/mxl862xx.c:3321:27: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le16 [addressable] [usertype] fid @@     got unsigned short [usertype] bridge_id @@
   drivers/net/dsa/mxl862xx/mxl862xx.c:3321:27: sparse:     expected restricted __le16 [addressable] [usertype] fid
   drivers/net/dsa/mxl862xx/mxl862xx.c:3321:27: sparse:     got unsigned short [usertype] bridge_id
>> drivers/net/dsa/mxl862xx/mxl862xx.c:3351:26: sparse: sparse: restricted __le32 degrades to integer
   drivers/net/dsa/mxl862xx/mxl862xx.c:3352:44: sparse: sparse: restricted __le16 degrades to integer
>> drivers/net/dsa/mxl862xx/mxl862xx.c:3393:41: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le16 [assigned] [usertype] bridge_id @@     got unsigned short [assigned] [usertype] bridge_id @@
   drivers/net/dsa/mxl862xx/mxl862xx.c:3393:41: sparse:     expected restricted __le16 [assigned] [usertype] bridge_id
   drivers/net/dsa/mxl862xx/mxl862xx.c:3393:41: sparse:     got unsigned short [assigned] [usertype] bridge_id

vim +134 drivers/net/dsa/mxl862xx/mxl862xx.c

594c8e2819ea1f Frank Wunderlich 2025-06-13  128  
594c8e2819ea1f Frank Wunderlich 2025-06-13  129  static int mxl862xx_phy_read_mmd(struct mxl862xx_priv *priv, int port, int devadd, int reg)
594c8e2819ea1f Frank Wunderlich 2025-06-13  130  {
594c8e2819ea1f Frank Wunderlich 2025-06-13  131  	struct mdio_relay_data param = {
594c8e2819ea1f Frank Wunderlich 2025-06-13  132  		.phy = port,
594c8e2819ea1f Frank Wunderlich 2025-06-13  133  		.mmd = devadd,
594c8e2819ea1f Frank Wunderlich 2025-06-13 @134  		.reg = reg & 0xffff,
594c8e2819ea1f Frank Wunderlich 2025-06-13  135  	};
594c8e2819ea1f Frank Wunderlich 2025-06-13  136  	int ret;
594c8e2819ea1f Frank Wunderlich 2025-06-13  137  
594c8e2819ea1f Frank Wunderlich 2025-06-13  138  	ret = MXL862XX_API_READ(priv, INT_GPHY_READ, param);
594c8e2819ea1f Frank Wunderlich 2025-06-13  139  	if (ret) {
594c8e2819ea1f Frank Wunderlich 2025-06-13  140  		pr_err("mxl862xx: failed to read mmd on port %d\n", port);
594c8e2819ea1f Frank Wunderlich 2025-06-13  141  		return ret;
594c8e2819ea1f Frank Wunderlich 2025-06-13  142  	}
594c8e2819ea1f Frank Wunderlich 2025-06-13  143  
594c8e2819ea1f Frank Wunderlich 2025-06-13 @144  	return param.data;
594c8e2819ea1f Frank Wunderlich 2025-06-13  145  }
594c8e2819ea1f Frank Wunderlich 2025-06-13  146  
594c8e2819ea1f Frank Wunderlich 2025-06-13  147  static int mxl862xx_phy_write_mmd(struct mxl862xx_priv *priv, int port,
594c8e2819ea1f Frank Wunderlich 2025-06-13  148  				  int devadd, int reg, u16 data)
594c8e2819ea1f Frank Wunderlich 2025-06-13  149  {
594c8e2819ea1f Frank Wunderlich 2025-06-13  150  	struct mdio_relay_data param = {
594c8e2819ea1f Frank Wunderlich 2025-06-13  151  		.phy = port,
594c8e2819ea1f Frank Wunderlich 2025-06-13  152  		.mmd = devadd,
594c8e2819ea1f Frank Wunderlich 2025-06-13 @153  		.reg = reg,
594c8e2819ea1f Frank Wunderlich 2025-06-13 @154  		.data = data,
594c8e2819ea1f Frank Wunderlich 2025-06-13  155  	};
594c8e2819ea1f Frank Wunderlich 2025-06-13  156  	int ret;
594c8e2819ea1f Frank Wunderlich 2025-06-13  157  
594c8e2819ea1f Frank Wunderlich 2025-06-13  158  	ret = MXL862XX_API_WRITE(priv, INT_GPHY_WRITE, param);
594c8e2819ea1f Frank Wunderlich 2025-06-13  159  	if (ret)
594c8e2819ea1f Frank Wunderlich 2025-06-13  160  		pr_err("mxl862xx: failed to write mmd on port %d\n", port);
594c8e2819ea1f Frank Wunderlich 2025-06-13  161  
594c8e2819ea1f Frank Wunderlich 2025-06-13  162  	return ret;
594c8e2819ea1f Frank Wunderlich 2025-06-13  163  }
594c8e2819ea1f Frank Wunderlich 2025-06-13  164  
594c8e2819ea1f Frank Wunderlich 2025-06-13  165  static int mxl862xx_phy_read(struct dsa_switch *ds, int port, int reg)
594c8e2819ea1f Frank Wunderlich 2025-06-13  166  {
594c8e2819ea1f Frank Wunderlich 2025-06-13  167  	return mxl862xx_phy_read_mmd(ds->priv, port, 0, reg);
594c8e2819ea1f Frank Wunderlich 2025-06-13  168  }
594c8e2819ea1f Frank Wunderlich 2025-06-13  169  
594c8e2819ea1f Frank Wunderlich 2025-06-13  170  static int mxl862xx_phy_write(struct dsa_switch *ds, int port, int reg,
594c8e2819ea1f Frank Wunderlich 2025-06-13  171  			      u16 data)
594c8e2819ea1f Frank Wunderlich 2025-06-13  172  {
594c8e2819ea1f Frank Wunderlich 2025-06-13  173  	return mxl862xx_phy_write_mmd(ds->priv, port, 0, reg, data);
594c8e2819ea1f Frank Wunderlich 2025-06-13  174  }
594c8e2819ea1f Frank Wunderlich 2025-06-13  175  
594c8e2819ea1f Frank Wunderlich 2025-06-13  176  static int mxl862xx_mmd_write(struct dsa_switch *ds, int reg, u16 data)
594c8e2819ea1f Frank Wunderlich 2025-06-13  177  {
594c8e2819ea1f Frank Wunderlich 2025-06-13  178  	struct mxl862xx_priv *priv = ds->priv;
594c8e2819ea1f Frank Wunderlich 2025-06-13  179  	int ret;
594c8e2819ea1f Frank Wunderlich 2025-06-13  180  
594c8e2819ea1f Frank Wunderlich 2025-06-13  181  	mutex_lock_nested(&priv->bus->mdio_lock, MDIO_MUTEX_NESTED);
594c8e2819ea1f Frank Wunderlich 2025-06-13  182  	ret = mxl862xx_write(priv, reg, data);
594c8e2819ea1f Frank Wunderlich 2025-06-13  183  	mutex_unlock(&priv->bus->mdio_lock);
594c8e2819ea1f Frank Wunderlich 2025-06-13  184  
594c8e2819ea1f Frank Wunderlich 2025-06-13  185  	return ret;
594c8e2819ea1f Frank Wunderlich 2025-06-13  186  }
594c8e2819ea1f Frank Wunderlich 2025-06-13  187  
594c8e2819ea1f Frank Wunderlich 2025-06-13  188  static int mxl862xx_update_bridge_conf_port(struct dsa_switch *ds, u8 port,
594c8e2819ea1f Frank Wunderlich 2025-06-13  189  					    struct net_device *bridge, int action)
594c8e2819ea1f Frank Wunderlich 2025-06-13  190  {
594c8e2819ea1f Frank Wunderlich 2025-06-13  191  	struct mxl862xx_priv *priv = ds->priv;
594c8e2819ea1f Frank Wunderlich 2025-06-13  192  	u8 phy_ports = priv->hw_info->phy_ports;
594c8e2819ea1f Frank Wunderlich 2025-06-13  193  	u8 cpu_port = priv->hw_info->cpu_port;
594c8e2819ea1f Frank Wunderlich 2025-06-13  194  	u8 i;
594c8e2819ea1f Frank Wunderlich 2025-06-13  195  	bool vlan_sp_tag = (priv->port_info[cpu_port].tag_protocol == DSA_TAG_PROTO_MXL862_8021Q);
594c8e2819ea1f Frank Wunderlich 2025-06-13  196  
594c8e2819ea1f Frank Wunderlich 2025-06-13  197  	/*struct dsa_port *dp = dsa_to_port(priv->ds, port), *other_dp;
594c8e2819ea1f Frank Wunderlich 2025-06-13  198  	 * struct mxl862xx_port_info *other_p;
594c8e2819ea1f Frank Wunderlich 2025-06-13  199  	 *int other_port;
594c8e2819ea1f Frank Wunderlich 2025-06-13  200  	 */
594c8e2819ea1f Frank Wunderlich 2025-06-13  201  	int ret;
594c8e2819ea1f Frank Wunderlich 2025-06-13  202  
594c8e2819ea1f Frank Wunderlich 2025-06-13  203  	if (!dsa_is_cpu_port(ds, port)) {
594c8e2819ea1f Frank Wunderlich 2025-06-13  204  		int bridge_id = priv->port_info[i].bridge_id;
594c8e2819ea1f Frank Wunderlich 2025-06-13  205  
594c8e2819ea1f Frank Wunderlich 2025-06-13  206  		if (action)
594c8e2819ea1f Frank Wunderlich 2025-06-13  207  			priv->bridge_portmap[bridge_id] |= BIT(DSA_MXL_PORT(port));
594c8e2819ea1f Frank Wunderlich 2025-06-13  208  		else
594c8e2819ea1f Frank Wunderlich 2025-06-13  209  			priv->bridge_portmap[bridge_id] &= ~BIT(DSA_MXL_PORT(port));
594c8e2819ea1f Frank Wunderlich 2025-06-13  210  	}
594c8e2819ea1f Frank Wunderlich 2025-06-13  211  
594c8e2819ea1f Frank Wunderlich 2025-06-13  212  	/* Update switch according to local bridge port map */
594c8e2819ea1f Frank Wunderlich 2025-06-13  213  	/* Add this port to the port maps of other ports skiping it's own map */
594c8e2819ea1f Frank Wunderlich 2025-06-13  214  	for (i = 0; i < phy_ports; i++) {
594c8e2819ea1f Frank Wunderlich 2025-06-13  215  		struct mxl862xx_bridge_port_config br_port_cfg = { };
594c8e2819ea1f Frank Wunderlich 2025-06-13  216  		int bridge_id = priv->port_info[i].bridge_id;
594c8e2819ea1f Frank Wunderlich 2025-06-13  217  
594c8e2819ea1f Frank Wunderlich 2025-06-13  218  		if (!(dsa_is_user_port(ds, i)))
594c8e2819ea1f Frank Wunderlich 2025-06-13  219  			continue;
594c8e2819ea1f Frank Wunderlich 2025-06-13  220  
594c8e2819ea1f Frank Wunderlich 2025-06-13  221  		/* Case for standalone bridges assigned only to single user and CPU ports.
594c8e2819ea1f Frank Wunderlich 2025-06-13  222  		 * Used only for initial ports isolation
594c8e2819ea1f Frank Wunderlich 2025-06-13  223  		 */
594c8e2819ea1f Frank Wunderlich 2025-06-13  224  		if (bridge && i != port)
594c8e2819ea1f Frank Wunderlich 2025-06-13  225  			continue;
594c8e2819ea1f Frank Wunderlich 2025-06-13  226  
594c8e2819ea1f Frank Wunderlich 2025-06-13  227  		/* Do not reconfigure any standalone bridge if this is bridge join scenario */
594c8e2819ea1f Frank Wunderlich 2025-06-13  228  		if (bridge && !priv->port_info[i].bridge)
594c8e2819ea1f Frank Wunderlich 2025-06-13  229  			continue;
594c8e2819ea1f Frank Wunderlich 2025-06-13  230  
594c8e2819ea1f Frank Wunderlich 2025-06-13 @231  		br_port_cfg.bridge_port_id = DSA_MXL_PORT(i);
594c8e2819ea1f Frank Wunderlich 2025-06-13  232  		br_port_cfg.mask |=
594c8e2819ea1f Frank Wunderlich 2025-06-13  233  			MXL862XX_BRIDGE_PORT_CONFIG_MASK_BRIDGE_PORT_MAP |
594c8e2819ea1f Frank Wunderlich 2025-06-13  234  			MXL862XX_BRIDGE_PORT_CONFIG_MASK_BRIDGE_ID;
594c8e2819ea1f Frank Wunderlich 2025-06-13  235  
594c8e2819ea1f Frank Wunderlich 2025-06-13  236  		ret = MXL862XX_API_READ(priv, MXL862XX_BRIDGEPORT_CONFIGGET, br_port_cfg);
594c8e2819ea1f Frank Wunderlich 2025-06-13  237  		if (ret) {
594c8e2819ea1f Frank Wunderlich 2025-06-13  238  			dev_err(ds->dev, "failed to set bridge port configuration on port %d\n",
594c8e2819ea1f Frank Wunderlich 2025-06-13  239  				port);
594c8e2819ea1f Frank Wunderlich 2025-06-13  240  			return ret;;
594c8e2819ea1f Frank Wunderlich 2025-06-13  241  		}
594c8e2819ea1f Frank Wunderlich 2025-06-13  242  
594c8e2819ea1f Frank Wunderlich 2025-06-13  243  		/* Skip port map update if for the existing bridge the port
594c8e2819ea1f Frank Wunderlich 2025-06-13  244  		 * is not assigned there.
594c8e2819ea1f Frank Wunderlich 2025-06-13  245  		 */
594c8e2819ea1f Frank Wunderlich 2025-06-13 @246  		if (i != port && (br_port_cfg.bridge_id != bridge_id ||
594c8e2819ea1f Frank Wunderlich 2025-06-13  247  				  br_port_cfg.bridge_id == 0))
594c8e2819ea1f Frank Wunderlich 2025-06-13  248  			continue;
594c8e2819ea1f Frank Wunderlich 2025-06-13  249  
594c8e2819ea1f Frank Wunderlich 2025-06-13  250  		br_port_cfg.mask |=
594c8e2819ea1f Frank Wunderlich 2025-06-13  251  			MXL862XX_BRIDGE_PORT_CONFIG_MASK_BRIDGE_PORT_MAP |
594c8e2819ea1f Frank Wunderlich 2025-06-13  252  			MXL862XX_BRIDGE_PORT_CONFIG_MASK_BRIDGE_ID |
594c8e2819ea1f Frank Wunderlich 2025-06-13  253  			MXL862XX_BRIDGE_PORT_CONFIG_MASK_MC_SRC_MAC_LEARNING;
594c8e2819ea1f Frank Wunderlich 2025-06-13  254  
594c8e2819ea1f Frank Wunderlich 2025-06-13  255  		/* Skip the port itself in it's own portmap */
594c8e2819ea1f Frank Wunderlich 2025-06-13 @256  		br_port_cfg.bridge_port_map[0] =
594c8e2819ea1f Frank Wunderlich 2025-06-13  257  			priv->bridge_portmap[bridge_id] & ~(BIT(i + 1));
594c8e2819ea1f Frank Wunderlich 2025-06-13  258  
594c8e2819ea1f Frank Wunderlich 2025-06-13  259  		if (action) {
594c8e2819ea1f Frank Wunderlich 2025-06-13  260  			br_port_cfg.src_mac_learning_disable = !bridge;
594c8e2819ea1f Frank Wunderlich 2025-06-13 @261  			br_port_cfg.bridge_id = bridge_id;
594c8e2819ea1f Frank Wunderlich 2025-06-13  262  		} else {
594c8e2819ea1f Frank Wunderlich 2025-06-13  263  			/* When port is removed from the bridge, assign it back to the default
594c8e2819ea1f Frank Wunderlich 2025-06-13  264  			 * bridge 0
594c8e2819ea1f Frank Wunderlich 2025-06-13  265  			 */
594c8e2819ea1f Frank Wunderlich 2025-06-13  266  			br_port_cfg.src_mac_learning_disable = true;
594c8e2819ea1f Frank Wunderlich 2025-06-13  267  			/* Cleanup the port own map leaving only the CPU port mapping. */
594c8e2819ea1f Frank Wunderlich 2025-06-13  268  			if (i == port) {
594c8e2819ea1f Frank Wunderlich 2025-06-13 @269  				br_port_cfg.bridge_port_map[0] = BIT(DSA_MXL_PORT(cpu_port));
594c8e2819ea1f Frank Wunderlich 2025-06-13  270  				br_port_cfg.bridge_id = 0;
594c8e2819ea1f Frank Wunderlich 2025-06-13  271  			}
594c8e2819ea1f Frank Wunderlich 2025-06-13  272  		}
594c8e2819ea1f Frank Wunderlich 2025-06-13  273  
594c8e2819ea1f Frank Wunderlich 2025-06-13  274  		ret = MXL862XX_API_WRITE(priv, MXL862XX_BRIDGEPORT_CONFIGSET, br_port_cfg);
594c8e2819ea1f Frank Wunderlich 2025-06-13  275  		if (ret) {
594c8e2819ea1f Frank Wunderlich 2025-06-13  276  			dev_err(ds->dev, "failed to set bridge port configuration on port %d\n", port);
594c8e2819ea1f Frank Wunderlich 2025-06-13  277  			return ret;
594c8e2819ea1f Frank Wunderlich 2025-06-13  278  		}
594c8e2819ea1f Frank Wunderlich 2025-06-13  279  	}
594c8e2819ea1f Frank Wunderlich 2025-06-13  280  
594c8e2819ea1f Frank Wunderlich 2025-06-13  281  	/* Configure additional bridge port for VLAN based tagging */
594c8e2819ea1f Frank Wunderlich 2025-06-13  282  	if (vlan_sp_tag) {
594c8e2819ea1f Frank Wunderlich 2025-06-13  283  		int bridge_id = priv->port_info[port].bridge_id;
594c8e2819ea1f Frank Wunderlich 2025-06-13  284  		uint16_t bridge_port_cpu = port + 1 + 16;
594c8e2819ea1f Frank Wunderlich 2025-06-13  285  		struct mxl862xx_bridge_port_alloc bpa_param = { };
594c8e2819ea1f Frank Wunderlich 2025-06-13  286  		struct mxl862xx_bridge_port_config br_port_cfg = { };
594c8e2819ea1f Frank Wunderlich 2025-06-13  287  
594c8e2819ea1f Frank Wunderlich 2025-06-13 @288  		bpa_param.bridge_port_id = bridge_port_cpu;
594c8e2819ea1f Frank Wunderlich 2025-06-13  289  
594c8e2819ea1f Frank Wunderlich 2025-06-13  290  		if (action) {
594c8e2819ea1f Frank Wunderlich 2025-06-13  291  			/* add */
594c8e2819ea1f Frank Wunderlich 2025-06-13  292  			ret = MXL862XX_API_READ(priv, MXL862XX_BRIDGEPORT_ALLOC, bpa_param);
594c8e2819ea1f Frank Wunderlich 2025-06-13  293  			if (ret) {
594c8e2819ea1f Frank Wunderlich 2025-06-13  294  				dev_err(ds->dev,
594c8e2819ea1f Frank Wunderlich 2025-06-13  295  					"%s: Port:%d failed to prepare associated bridge port\n",
594c8e2819ea1f Frank Wunderlich 2025-06-13  296  					__func__, port);
594c8e2819ea1f Frank Wunderlich 2025-06-13  297  				return ret;
594c8e2819ea1f Frank Wunderlich 2025-06-13  298  			}
594c8e2819ea1f Frank Wunderlich 2025-06-13  299  
594c8e2819ea1f Frank Wunderlich 2025-06-13  300  			br_port_cfg.mask |=
594c8e2819ea1f Frank Wunderlich 2025-06-13  301  				MXL862XX_BRIDGE_PORT_CONFIG_MASK_BRIDGE_PORT_MAP |
594c8e2819ea1f Frank Wunderlich 2025-06-13  302  				MXL862XX_BRIDGE_PORT_CONFIG_MASK_BRIDGE_ID |
594c8e2819ea1f Frank Wunderlich 2025-06-13  303  				MXL862XX_BRIDGE_PORT_CONFIG_MASK_EGRESS_CTP_MAPPING |
594c8e2819ea1f Frank Wunderlich 2025-06-13  304  				MXL862XX_BRIDGE_PORT_CONFIG_MASK_MC_SRC_MAC_LEARNING;
594c8e2819ea1f Frank Wunderlich 2025-06-13 @305  			br_port_cfg.bridge_id = bridge_id;
594c8e2819ea1f Frank Wunderlich 2025-06-13 @306  			br_port_cfg.bridge_port_id = bridge_port_cpu;
594c8e2819ea1f Frank Wunderlich 2025-06-13 @307  			br_port_cfg.bridge_port_map[0] = BIT(port + 1);
594c8e2819ea1f Frank Wunderlich 2025-06-13  308  			br_port_cfg.dest_logical_port_id = cpu_port + 1;
594c8e2819ea1f Frank Wunderlich 2025-06-13  309  			br_port_cfg.src_mac_learning_disable = true;
594c8e2819ea1f Frank Wunderlich 2025-06-13  310  
594c8e2819ea1f Frank Wunderlich 2025-06-13  311  			ret = MXL862XX_API_WRITE(priv, MXL862XX_BRIDGEPORT_CONFIGSET, br_port_cfg);
594c8e2819ea1f Frank Wunderlich 2025-06-13  312  			if (ret) {
594c8e2819ea1f Frank Wunderlich 2025-06-13  313  				dev_err(ds->dev,
594c8e2819ea1f Frank Wunderlich 2025-06-13  314  				"%s: Configuration of cpu bridge port:%d  for port:%d on bridge:%d failed with ret=%d\n",
594c8e2819ea1f Frank Wunderlich 2025-06-13  315  				__func__, bridge_port_cpu, port, bridge_id, ret);
594c8e2819ea1f Frank Wunderlich 2025-06-13  316  				return ret;
594c8e2819ea1f Frank Wunderlich 2025-06-13  317  			}
594c8e2819ea1f Frank Wunderlich 2025-06-13  318  
594c8e2819ea1f Frank Wunderlich 2025-06-13  319  			/* Add bridge cpu port to portmap */
594c8e2819ea1f Frank Wunderlich 2025-06-13  320  			priv->bridge_portmap[bridge_id] |= BIT(bridge_port_cpu);
594c8e2819ea1f Frank Wunderlich 2025-06-13  321  			priv->port_info[port].bridge_port_cpu = bridge_port_cpu;
594c8e2819ea1f Frank Wunderlich 2025-06-13  322  		} else {
594c8e2819ea1f Frank Wunderlich 2025-06-13  323  			/* remove */
594c8e2819ea1f Frank Wunderlich 2025-06-13  324  			ret = MXL862XX_API_WRITE(priv, MXL862XX_BRIDGEPORT_FREE, bpa_param);
594c8e2819ea1f Frank Wunderlich 2025-06-13  325  			if (ret) {
594c8e2819ea1f Frank Wunderlich 2025-06-13  326  				dev_err(ds->dev,
594c8e2819ea1f Frank Wunderlich 2025-06-13  327  					"%s: Port:%d failed to free associated bridge port\n",
594c8e2819ea1f Frank Wunderlich 2025-06-13  328  					__func__, port);
594c8e2819ea1f Frank Wunderlich 2025-06-13  329  				return ret;
594c8e2819ea1f Frank Wunderlich 2025-06-13  330  			}
594c8e2819ea1f Frank Wunderlich 2025-06-13  331  			/* Remove bridge cpu port from portmap */
594c8e2819ea1f Frank Wunderlich 2025-06-13  332  			priv->bridge_portmap[bridge_id] &= ~BIT(bridge_port_cpu);
594c8e2819ea1f Frank Wunderlich 2025-06-13  333  			priv->port_info[port].bridge_port_cpu = 0;
594c8e2819ea1f Frank Wunderlich 2025-06-13  334  		}
594c8e2819ea1f Frank Wunderlich 2025-06-13  335  	}
594c8e2819ea1f Frank Wunderlich 2025-06-13  336  
594c8e2819ea1f Frank Wunderlich 2025-06-13  337  	return 0;
594c8e2819ea1f Frank Wunderlich 2025-06-13  338  }
594c8e2819ea1f Frank Wunderlich 2025-06-13  339  

:::::: The code at line 134 was first introduced by commit
:::::: 594c8e2819ea1ff1397f9572a5c8d15228d27586 net: dsa: add mxl862xx driver

:::::: TO: Frank Wunderlich <frank-w@public-files.de>
:::::: CC: Frank Wunderlich <frank-w@public-files.de>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
