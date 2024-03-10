Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0731922618
	for <oe-kbuild-all@lists.linux.dev>; Sun, 10 Mar 2024 15:09:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710083357; cv=none; b=QuRe/RtpDeNhhCVD0q9BQH7y2wkVIf2V/cJi3xY3/zmSpROfSM/8o2EavaH0+OY4qo6sylJ3wlj7e6iKVDaELqVseAWB4hPEXOknR4aQIl3wok/JTdQq33UYgD4TiL/oYvBTcg7NZIMHOnXA/W3xbcX+VM3Y0c7JLvwWtenuLEE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710083357; c=relaxed/simple;
	bh=5eVhH7VUzWgz5cJ3iAlQhz0F4TgYZHFFyF9uiroXSzQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=efy7H13icMoLGzYCQZctrh0pu/RqQi8nH/nDpGz1Nzn/yyUy1GtGJfyp/swsUzkrh0WCB7zwFMoomxLk9MBLBrcNSTVUlDLiahJv4x6UDUEH5H9WNU/zWcMtWmWMe4KFxCmVlOQkEIrNNxY/3EG7DimJc1KXXnGgJNOMXS4wMgQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RtsQd2N1; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RtsQd2N1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1710083355; x=1741619355;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=5eVhH7VUzWgz5cJ3iAlQhz0F4TgYZHFFyF9uiroXSzQ=;
  b=RtsQd2N1d+YkjKy+nxYcVxrvfk0+EuKJ+BzSOZLO54F0Hdaa+rYENpTK
   S9+FkOIodKu4pcfIGGCZ7/T0lFpTFp67KVazgdwUryWLMBgi3TfbsePOv
   Z0r0uyP0Mfi9Pl58gK1M5jxcVNjHwATim48XEYyH62e6iKd+QLhCxkztE
   ckumQLldfCKesDINvOr3uPxWiJvGR2WRWjNWNCOJZcqJa/Rwj5r4a+Iyf
   aFUtvW85DhWDB/F2MEDFOhmVlK46nq1INHUl2+nkjIuDsXDLxkDU2VWlu
   m1wr0ub/+C/OzTJzcaldXStCjwhAUcplAWTOzu6B2V0/L6B9kpHnDQzSn
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11009"; a="30193642"
X-IronPort-AV: E=Sophos;i="6.07,114,1708416000"; 
   d="scan'208";a="30193642"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Mar 2024 08:09:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,114,1708416000"; 
   d="scan'208";a="15634753"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 10 Mar 2024 08:09:10 -0700
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rjKnU-0008Jn-0P;
	Sun, 10 Mar 2024 15:09:08 +0000
Date: Sun, 10 Mar 2024 23:08:25 +0800
From: kernel test robot <lkp@intel.com>
To: jasperwang@tencent.com, kaixuxia@tencent.com, frankjpliu@tencent.com,
	kasong@tencent.com, sagazchen@tencent.com, kernelxing@tencent.com,
	aurelianliu@tencent.com, jason.zeng@intel.com, wu.zheng@intel.com,
	yingbao.jia@intel.com, pei.p.jia@intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [opencloudos:linux-5.4/next 24817/27506] net/toa/toa.c:213:17:
 sparse: sparse: incorrect type in initializer (different address spaces)
Message-ID: <202403102352.SL1kvVfU-lkp@intel.com>
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
commit: 42d24297c006076ae13080d43bae627d5b492514 [24817/27506] net: csig toa patch
config: x86_64-randconfig-121-20240305 (https://download.01.org/0day-ci/archive/20240310/202403102352.SL1kvVfU-lkp@intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240310/202403102352.SL1kvVfU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403102352.SL1kvVfU-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   net/toa/toa.c:49:15: sparse: sparse: symbol 'sk_data_ready_addr' was not declared. Should it be static?
   net/toa/toa.c:55:24: sparse: sparse: symbol 'toa_stats' was not declared. Should it be static?
   net/toa/toa.c:164:64: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __be16 [usertype] sport @@     got unsigned short [usertype] @@
   net/toa/toa.c:164:64: sparse:     expected restricted __be16 [usertype] sport
   net/toa/toa.c:164:64: sparse:     got unsigned short [usertype]
   net/toa/toa.c:166:63: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __be32 [usertype] vmip @@     got unsigned int [usertype] @@
   net/toa/toa.c:166:63: sparse:     expected restricted __be32 [usertype] vmip
   net/toa/toa.c:166:63: sparse:     got unsigned int [usertype]
   net/toa/toa.c:176:64: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __be16 [usertype] vport @@     got unsigned short [usertype] @@
   net/toa/toa.c:176:64: sparse:     expected restricted __be16 [usertype] vport
   net/toa/toa.c:176:64: sparse:     got unsigned short [usertype]
   net/toa/toa.c:178:62: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __be32 [usertype] vip @@     got unsigned int [usertype] @@
   net/toa/toa.c:178:62: sparse:     expected restricted __be32 [usertype] vip
   net/toa/toa.c:178:62: sparse:     got unsigned int [usertype]
>> net/toa/toa.c:213:17: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got struct toa_stat_mib * @@
   net/toa/toa.c:213:17: sparse:     expected void const [noderef] __percpu *__vpp_verify
   net/toa/toa.c:213:17: sparse:     got struct toa_stat_mib *
   net/toa/toa.c:232:33: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got struct toa_stat_mib * @@
   net/toa/toa.c:232:33: sparse:     expected void const [noderef] __percpu *__vpp_verify
   net/toa/toa.c:232:33: sparse:     got struct toa_stat_mib *
   net/toa/toa.c:237:33: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got struct toa_stat_mib * @@
   net/toa/toa.c:237:33: sparse:     expected void const [noderef] __percpu *__vpp_verify
   net/toa/toa.c:237:33: sparse:     got struct toa_stat_mib *
   net/toa/toa.c:259:25: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got struct toa_stat_mib * @@
   net/toa/toa.c:259:25: sparse:     expected void const [noderef] __percpu *__vpp_verify
   net/toa/toa.c:259:25: sparse:     got struct toa_stat_mib *
   net/toa/toa.c:262:17: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got struct toa_stat_mib * @@
   net/toa/toa.c:262:17: sparse:     expected void const [noderef] __percpu *__vpp_verify
   net/toa/toa.c:262:17: sparse:     got struct toa_stat_mib *
   net/toa/toa.c:281:17: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got struct toa_stat_mib * @@
   net/toa/toa.c:281:17: sparse:     expected void const [noderef] __percpu *__vpp_verify
   net/toa/toa.c:281:17: sparse:     got struct toa_stat_mib *
   net/toa/toa.c:297:33: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got struct toa_stat_mib * @@
   net/toa/toa.c:297:33: sparse:     expected void const [noderef] __percpu *__vpp_verify
   net/toa/toa.c:297:33: sparse:     got struct toa_stat_mib *
   net/toa/toa.c:304:33: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got struct toa_stat_mib * @@
   net/toa/toa.c:304:33: sparse:     expected void const [noderef] __percpu *__vpp_verify
   net/toa/toa.c:304:33: sparse:     got struct toa_stat_mib *
   net/toa/toa.c:325:25: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got struct toa_stat_mib * @@
   net/toa/toa.c:325:25: sparse:     expected void const [noderef] __percpu *__vpp_verify
   net/toa/toa.c:325:25: sparse:     got struct toa_stat_mib *
   net/toa/toa.c:328:17: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got struct toa_stat_mib * @@
   net/toa/toa.c:328:17: sparse:     expected void const [noderef] __percpu *__vpp_verify
   net/toa/toa.c:328:17: sparse:     got struct toa_stat_mib *
   net/toa/toa.c:365:25: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got struct toa_stat_mib * @@
   net/toa/toa.c:365:25: sparse:     expected void const [noderef] __percpu *__vpp_verify
   net/toa/toa.c:365:25: sparse:     got struct toa_stat_mib *
   net/toa/toa.c:367:25: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got struct toa_stat_mib * @@
   net/toa/toa.c:367:25: sparse:     expected void const [noderef] __percpu *__vpp_verify
   net/toa/toa.c:367:25: sparse:     got struct toa_stat_mib *
   net/toa/toa.c:395:25: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got struct toa_stat_mib * @@
   net/toa/toa.c:395:25: sparse:     expected void const [noderef] __percpu *__vpp_verify
   net/toa/toa.c:395:25: sparse:     got struct toa_stat_mib *
   net/toa/toa.c:397:25: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got struct toa_stat_mib * @@
   net/toa/toa.c:397:25: sparse:     expected void const [noderef] __percpu *__vpp_verify
   net/toa/toa.c:397:25: sparse:     got struct toa_stat_mib *
   net/toa/toa.c:446:41: sparse: sparse: cast to restricted __be16
   net/toa/toa.c:486:33: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got struct toa_stat_mib * @@
   net/toa/toa.c:486:33: sparse:     expected void const [noderef] __percpu *__vpp_verify
   net/toa/toa.c:486:33: sparse:     got struct toa_stat_mib *
   net/toa/toa.c:490:47: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __be16 [usertype] sin_port @@     got unsigned short [addressable] [usertype] port @@
   net/toa/toa.c:490:47: sparse:     expected restricted __be16 [usertype] sin_port
   net/toa/toa.c:490:47: sparse:     got unsigned short [addressable] [usertype] port
   net/toa/toa.c:491:54: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __be32 [usertype] s_addr @@     got unsigned int [addressable] [usertype] ip @@
   net/toa/toa.c:491:54: sparse:     expected restricted __be32 [usertype] s_addr
   net/toa/toa.c:491:54: sparse:     got unsigned int [addressable] [usertype] ip
   net/toa/toa.c:493:33: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got struct toa_stat_mib * @@
   net/toa/toa.c:493:33: sparse:     expected void const [noderef] __percpu *__vpp_verify
   net/toa/toa.c:493:33: sparse:     got struct toa_stat_mib *
   net/toa/toa.c:498:25: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got struct toa_stat_mib * @@
   net/toa/toa.c:498:25: sparse:     expected void const [noderef] __percpu *__vpp_verify
   net/toa/toa.c:498:25: sparse:     got struct toa_stat_mib *
   net/toa/toa.c:501:17: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got struct toa_stat_mib * @@
   net/toa/toa.c:501:17: sparse:     expected void const [noderef] __percpu *__vpp_verify
   net/toa/toa.c:501:17: sparse:     got struct toa_stat_mib *
   net/toa/toa.c:527:33: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got struct toa_stat_mib * @@
   net/toa/toa.c:527:33: sparse:     expected void const [noderef] __percpu *__vpp_verify
   net/toa/toa.c:527:33: sparse:     got struct toa_stat_mib *
   net/toa/toa.c:528:48: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __be16 [usertype] sin6_port @@     got unsigned short [addressable] [usertype] port @@
   net/toa/toa.c:528:48: sparse:     expected restricted __be16 [usertype] sin6_port
   net/toa/toa.c:528:48: sparse:     got unsigned short [addressable] [usertype] port
   net/toa/toa.c:529:94: sparse: sparse: incorrect type in argument 5 (different base types) @@     expected restricted __be32 [usertype] w4 @@     got unsigned int [addressable] [usertype] ip @@
   net/toa/toa.c:529:94: sparse:     expected restricted __be32 [usertype] w4
   net/toa/toa.c:529:94: sparse:     got unsigned int [addressable] [usertype] ip
   net/toa/toa.c:531:33: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got struct toa_stat_mib * @@
   net/toa/toa.c:531:33: sparse:     expected void const [noderef] __percpu *__vpp_verify
   net/toa/toa.c:531:33: sparse:     got struct toa_stat_mib *
   net/toa/toa.c:534:25: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got struct toa_stat_mib * @@
   net/toa/toa.c:534:25: sparse:     expected void const [noderef] __percpu *__vpp_verify
   net/toa/toa.c:534:25: sparse:     got struct toa_stat_mib *
   net/toa/toa.c:537:17: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got struct toa_stat_mib * @@
   net/toa/toa.c:537:17: sparse:     expected void const [noderef] __percpu *__vpp_verify
   net/toa/toa.c:537:17: sparse:     got struct toa_stat_mib *
   net/toa/toa.c:572:25: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got struct toa_stat_mib * @@
   net/toa/toa.c:572:25: sparse:     expected void const [noderef] __percpu *__vpp_verify
   net/toa/toa.c:572:25: sparse:     got struct toa_stat_mib *
   net/toa/toa.c:574:25: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got struct toa_stat_mib * @@
   net/toa/toa.c:574:25: sparse:     expected void const [noderef] __percpu *__vpp_verify
   net/toa/toa.c:574:25: sparse:     got struct toa_stat_mib *
   net/toa/toa.c:600:25: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got struct toa_stat_mib * @@
   net/toa/toa.c:600:25: sparse:     expected void const [noderef] __percpu *__vpp_verify
   net/toa/toa.c:600:25: sparse:     got struct toa_stat_mib *
   net/toa/toa.c:602:25: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got struct toa_stat_mib * @@
   net/toa/toa.c:602:25: sparse:     expected void const [noderef] __percpu *__vpp_verify
   net/toa/toa.c:602:25: sparse:     got struct toa_stat_mib *
   net/toa/toa.c:724:65: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got struct toa_stat_mib * @@
   net/toa/toa.c:724:65: sparse:     expected void const [noderef] __percpu *__vpp_verify
   net/toa/toa.c:724:65: sparse:     got struct toa_stat_mib *
   net/toa/toa.c:758:17: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got struct toa_stat_mib * @@
   net/toa/toa.c:758:17: sparse:     expected void const [noderef] __percpu *__vpp_verify
   net/toa/toa.c:758:17: sparse:     got struct toa_stat_mib *
   net/toa/toa.c:766:17: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got struct toa_stat_mib * @@
   net/toa/toa.c:766:17: sparse:     expected void const [noderef] __percpu *__vpp_verify
   net/toa/toa.c:766:17: sparse:     got struct toa_stat_mib *
   net/toa/toa.c:800:17: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got struct toa_stat_mib * @@
   net/toa/toa.c:800:17: sparse:     expected void const [noderef] __percpu *__vpp_verify
   net/toa/toa.c:800:17: sparse:     got struct toa_stat_mib *
   net/toa/toa.c:809:17: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got struct toa_stat_mib * @@
   net/toa/toa.c:809:17: sparse:     expected void const [noderef] __percpu *__vpp_verify
   net/toa/toa.c:809:17: sparse:     got struct toa_stat_mib *
   net/toa/toa.c:815:48: sparse: sparse: incorrect type in argument 3 (different base types) @@     expected unsigned int [usertype] value @@     got restricted __be32 [usertype] i_vmip @@
   net/toa/toa.c:815:48: sparse:     expected unsigned int [usertype] value
   net/toa/toa.c:815:48: sparse:     got restricted __be32 [usertype] i_vmip
   net/toa/toa.c:816:49: sparse: sparse: incorrect type in argument 3 (different base types) @@     expected unsigned short [usertype] value @@     got restricted __be16 [usertype] i_sport @@
   net/toa/toa.c:816:49: sparse:     expected unsigned short [usertype] value
   net/toa/toa.c:816:49: sparse:     got restricted __be16 [usertype] i_sport
   net/toa/toa.c:817:47: sparse: sparse: incorrect type in argument 3 (different base types) @@     expected unsigned int [usertype] value @@     got restricted __be32 [usertype] i_vip @@
   net/toa/toa.c:817:47: sparse:     expected unsigned int [usertype] value
   net/toa/toa.c:817:47: sparse:     got restricted __be32 [usertype] i_vip
   net/toa/toa.c:818:49: sparse: sparse: incorrect type in argument 3 (different base types) @@     expected unsigned short [usertype] value @@     got restricted __be16 [usertype] i_vport @@
   net/toa/toa.c:818:49: sparse:     expected unsigned short [usertype] value
   net/toa/toa.c:818:49: sparse:     got restricted __be16 [usertype] i_vport
   net/toa/toa.c:827:17: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got struct toa_stat_mib * @@
   net/toa/toa.c:827:17: sparse:     expected void const [noderef] __percpu *__vpp_verify
   net/toa/toa.c:827:17: sparse:     got struct toa_stat_mib *
   net/toa/toa.c:842:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got struct toa_stat_mib * @@
   net/toa/toa.c:842:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   net/toa/toa.c:842:9: sparse:     got struct toa_stat_mib *
   net/toa/toa.c:847:17: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got struct toa_stat_mib * @@
   net/toa/toa.c:847:17: sparse:     expected void const [noderef] __percpu *__vpp_verify
   net/toa/toa.c:847:17: sparse:     got struct toa_stat_mib *
   net/toa/toa.c:852:17: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got struct toa_stat_mib * @@
   net/toa/toa.c:852:17: sparse:     expected void const [noderef] __percpu *__vpp_verify
   net/toa/toa.c:852:17: sparse:     got struct toa_stat_mib *
   net/toa/toa.c:909:32: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct toa_stat_mib *[addressable] [toplevel] ext_stats @@     got struct toa_stat_mib [noderef] __percpu * @@
   net/toa/toa.c:909:32: sparse:     expected struct toa_stat_mib *[addressable] [toplevel] ext_stats
   net/toa/toa.c:909:32: sparse:     got struct toa_stat_mib [noderef] __percpu *
>> net/toa/toa.c:938:29: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void [noderef] __percpu *__pdata @@     got struct toa_stat_mib *[addressable] [toplevel] ext_stats @@
   net/toa/toa.c:938:29: sparse:     expected void [noderef] __percpu *__pdata
   net/toa/toa.c:938:29: sparse:     got struct toa_stat_mib *[addressable] [toplevel] ext_stats
>> net/toa/toa.c:955:29: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void [noderef] __percpu *__pdata @@     got struct toa_stat_mib *[addressable] [assigned] [toplevel] ext_stats @@
   net/toa/toa.c:955:29: sparse:     expected void [noderef] __percpu *__pdata
   net/toa/toa.c:955:29: sparse:     got struct toa_stat_mib *[addressable] [assigned] [toplevel] ext_stats

vim +213 net/toa/toa.c

   120	
   121	
   122	/*
   123	 * Funcs for vtoa hooks
   124	 */
   125	
   126	/* Parse TCP options in skb, try to get client ip, port, vpcid, vmip, vport
   127	 * @param skb [in] received skb, it should be a ack/get-ack packet.
   128	 * @return 0 if we don't get client ip/port , vpcid and vmip/vport;
   129	 * 1 we get vtoa data;
   130	 * -1 something wrong .
   131	 */
   132	static int get_vtoa_data(struct sk_buff *skb, struct sock *sk)
   133	{
   134		struct tcphdr *th;
   135		int length;
   136		unsigned char *ptr;
   137		int is_toa = 0;
   138	
   139		/*TOA_DBG("get_vtoa_data called\n");*/
   140	
   141		if (NULL != skb) {
   142			th = tcp_hdr(skb);
   143			length = (th->doff * 4) - sizeof(struct tcphdr);
   144			ptr = (unsigned char *) (th + 1);
   145	
   146			while (length > 0) {
   147				int opcode = *ptr++;
   148				int opsize;
   149				switch (opcode) {
   150				case TCPOPT_EOL:
   151					return -1;
   152				case TCPOPT_NOP:/* Ref: RFC 793 section 3.1 */
   153					length--;
   154					continue;
   155				default:
   156					opsize = *ptr++;
   157					if (opsize < 2)	/* "silly options" */
   158						return -1;
   159					if (opsize > length)
   160						/* don't parse partial options */
   161						return -1;
   162					if (TCPOPT_REAL_CLIENTIP == opcode
   163						&& TCPOLEN_REAL_CLIENTIP == opsize) {
   164						sk->sk_tvpc_info.sport =
   165								*((__u16 *)(ptr));
 > 166						sk->sk_tvpc_info.vmip =
   167								*((__u32 *)(ptr + 2));
   168						is_toa++;
   169					} else if (TCPOPT_VM_VPCID == opcode
   170							&& TCPOLEN_VM_VPCID == opsize) {
   171						sk->sk_tvpc_info.vpcid =
   172								*((__u32 *)(ptr));
   173						is_toa++;
   174					} else if (TCPOPT_VIP == opcode
   175							&& TCPOLEN_VIP == opsize) {
   176						sk->sk_tvpc_info.vport =
   177							*((__u16 *)(ptr));
   178						sk->sk_tvpc_info.vip =
   179							*((__u32 *)(ptr + 2));
   180						is_toa++;
   181					}
   182					ptr += opsize - 2;
   183					length -= opsize;
   184				}
   185			}
   186			TOA_DBG("%s tcp source:%u dest:%u vpcid:%u vmip:%pI4 sport:%u vip:%pI4 vport:%u\n",
   187				__func__, ntohs(th->source), ntohs(th->dest), sk->sk_tvpc_info.vpcid,
   188				&sk->sk_tvpc_info.vmip, sk->sk_tvpc_info.sport,
   189				&sk->sk_tvpc_info.vip, sk->sk_tvpc_info.vport);
   190		}
   191		return is_toa;
   192	}
   193	
   194	/* get client ip from socket
   195	 * @param sock [in] the socket to getpeername() or getsockname()
   196	 * @param uaddr [out] the place to put client ip, port
   197	 * @param uaddr_len [out] lenth of @uaddr
   198	 * @peer [in] if(peer), try to get remote address; if(!peer), try to get local address
   199	 * @return return what the original inet_getname() returns.
   200	 */
   201	static int
   202	inet_getname_vtoa(struct socket *sock,
   203			  struct sockaddr *uaddr,
   204			  int peer)
   205	{
   206		int retval = 0;
   207		struct sock *sk = sock->sk;
   208		struct sockaddr_in *sin = (struct sockaddr_in *) uaddr;
   209	
   210		/* call orginal one */
   211		retval = inet_getname(sock, uaddr, peer);
   212		if (disable_getpeername & VTOA_GETPEERNAME_IPV4_DISABLE){
 > 213			TOA_INC_STATS(ext_stats,
   214				GETNAME_VTOA_GETPEERNAME_IPV4_ERR_CNT);
   215			TOA_DBG("%s called, toa ipv getpeername disable\n", __func__);
   216			return retval;
   217		}
   218	
   219		TOA_DBG("%s called, sk_data_ready:%px retval:%d peer:%d vmip:%x sport:%u vip:%x vport:%u\n",
   220			__func__, sk?sk->sk_data_ready:NULL, retval, peer,
   221			sk?sk->sk_tvpc_info.vmip:0, sk?ntohs(sk->sk_tvpc_info.sport):0,
   222			sk?sk->sk_tvpc_info.vip:0, sk?ntohs(sk->sk_tvpc_info.vport):0);
   223	
   224		/* set our value if need */
   225		if (retval == sizeof(struct sockaddr_in) && peer && sk) {
   226			if (sk_data_ready_addr == (unsigned long) sk->sk_data_ready) {
   227				/*syscall accept must go here,
   228				 *so change the client ip/port and vip/vport here
   229				*/
   230				if (0 != sk->sk_tvpc_info.vmip
   231					&& 0 != sk->sk_tvpc_info.sport) {
   232					TOA_INC_STATS(ext_stats, GETNAME_TOA_OK_CNT);
   233					sin->sin_port = sk->sk_tvpc_info.sport;
   234					sin->sin_addr.s_addr = sk->sk_tvpc_info.vmip;
   235				} else if (0 == sk->sk_tvpc_info.vmip
   236					&& 0 == sk->sk_tvpc_info.sport) {
   237					TOA_INC_STATS(ext_stats,
   238							SYN_RECV_SOCK_NO_TOA_CNT);
   239					sk->sk_tvpc_info.sport = sin->sin_port;
   240					sk->sk_tvpc_info.vmip = sin->sin_addr.s_addr;
   241				} else
   242					TOA_INFO("vmip or sport can not 0.\n");
   243	
   244				/*do not get vip and vport,
   245				 *maybe vpcgw do not pass them,
   246				 *maybe it is a flow just for this host
   247				*/
   248				if (0 == sk->sk_tvpc_info.vip
   249					&& 0 == sk->sk_tvpc_info.vport) {
   250					struct sockaddr_in addr;
   251					if (inet_getname(sock, (struct sockaddr *)&addr,
   252						0) == sizeof(struct sockaddr_in)) {
   253						sk->sk_tvpc_info.vport = addr.sin_port;
   254						sk->sk_tvpc_info.vip =
   255							addr.sin_addr.s_addr;
   256					}
   257				}
   258			} else {
   259				TOA_INC_STATS(ext_stats, GETNAME_TOA_BYPASS_CNT);
   260			}
   261		} else { /* no need to get client ip */
   262			TOA_INC_STATS(ext_stats, GETNAME_TOA_EMPTY_CNT);
   263		}
   264	
   265		return retval;
   266	}
   267	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
