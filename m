Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBF622DCF6B
	for <oe-kbuild-all@lists.linux.dev>; Thu, 11 Dec 2025 09:11:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765444316; cv=none; b=G+YMXMh01xnF0Ky52GgBmVKncJK0maivl4hu7k8KVJNDNRbGP87GoXFV0LdhVqXYk8+ceisUUS6cCtBCHqWv0Xr2gRbqdErGjwGGy6FPAzaeuumyZC0axII+mAfFo9/Q+Judu7BJX2FiaLqOlI92hV3xvVJt3vCZpWA6sp17WQ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765444316; c=relaxed/simple;
	bh=v2L6Vxkz12rpeClr7+hkjF8L0kJms/48YVDz43Zt73o=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=abdY6T/m85DeuYyRGzWvbJqS034zh0iOQ9Crez848sXUpRz3a+pGKTxzBEm2R3NQu1tXCmhcZp6kzgDeU9V8BzSV2G8ztgXqdZgu3D6ddPRBwLShETsM0P+hygcfodoywhhPzMXVBmKugrcrpmJQVxkPwJt7BBXB2bNThuMizis=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NykJPvfX; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NykJPvfX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765444314; x=1796980314;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=v2L6Vxkz12rpeClr7+hkjF8L0kJms/48YVDz43Zt73o=;
  b=NykJPvfXEs9YsXjHuvylz32USANVid0T2Q1AWmXrPUUKDMpUNHCBS5YD
   i51jceKX7RoJAwvCqnGrqMHOU2FR1oLiSRS4Hiark9/rDxh3S7bYt4Zt1
   SumhiCUsXM9u+EO9Dc2jMJTTNnEGg6wMr4Mj/r6kvb/G0xvJzpxsFOmSU
   17Dhtz0C2NBDjdHsEe3ua/xag8obP8oLBZqFQQjV2Ah/yQ3ZVMkCec6mz
   7rNa9uYpxIkdGPcnWVnAWSsBDWOQAiNHEQRrvZ8BzaA079Uedb1PJFT5J
   9leIXWuUyB8U6NW+M8sO3UkaEgM9Yy0GFtE0j4JVD2HGwTCc+SjF9xLi/
   Q==;
X-CSE-ConnectionGUID: ycZhPILaTnWw5JyCAaRH5A==
X-CSE-MsgGUID: JN2SaqQmSLGYIUi3WIKPSA==
X-IronPort-AV: E=McAfee;i="6800,10657,11638"; a="54970534"
X-IronPort-AV: E=Sophos;i="6.20,265,1758610800"; 
   d="scan'208";a="54970534"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Dec 2025 01:11:52 -0800
X-CSE-ConnectionGUID: EtS8V2yBSGSifv9wJ81sPg==
X-CSE-MsgGUID: MFEQCEKbTn+kha8sHzjc/g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,265,1758610800"; 
   d="scan'208";a="197574946"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 11 Dec 2025 01:11:50 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vTciC-000000004Rl-0yFh;
	Thu, 11 Dec 2025 09:11:48 +0000
Date: Thu, 11 Dec 2025 17:10:49 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Yongqiang Guo <guoyongqiang12@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 3508/3508]
 drivers/ub/urma/uburma/uburma_event.c:349:50: sparse: sparse: incorrect type
 in argument 2 (different address spaces)
Message-ID: <202512111728.ksAjCqeX-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   5930fa3740c518a9f6ba688fd0c1873d6f3adbce
commit: e8c3802f69b01ec0b063c1889c9232ca59ff339a [3508/3508] uburma: implement comprehensive jetty linking and transport features
config: arm64-randconfig-r112-20251210 (https://download.01.org/0day-ci/archive/20251211/202512111728.ksAjCqeX-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251211/202512111728.ksAjCqeX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512111728.ksAjCqeX-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   drivers/ub/urma/uburma/uburma_event.c:112:20: sparse: sparse: incompatible types in comparison expression (different address spaces):
   drivers/ub/urma/uburma/uburma_event.c:112:20: sparse:    void [noderef] __rcu *
   drivers/ub/urma/uburma/uburma_event.c:112:20: sparse:    void *
>> drivers/ub/urma/uburma/uburma_event.c:349:50: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void const [noderef] __user *from @@     got struct uburma_cmd_hdr * @@
   drivers/ub/urma/uburma/uburma_event.c:349:50: sparse:     expected void const [noderef] __user *from
   drivers/ub/urma/uburma/uburma_event.c:349:50: sparse:     got struct uburma_cmd_hdr *
   drivers/ub/urma/uburma/uburma_event.c:477:50: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void const [noderef] __user *from @@     got struct uburma_cmd_hdr * @@
   drivers/ub/urma/uburma/uburma_event.c:477:50: sparse:     expected void const [noderef] __user *from
   drivers/ub/urma/uburma/uburma_event.c:477:50: sparse:     got struct uburma_cmd_hdr *
   drivers/ub/urma/uburma/uburma_event.c:751:50: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void const [noderef] __user *from @@     got struct uburma_cmd_hdr * @@
   drivers/ub/urma/uburma/uburma_event.c:751:50: sparse:     expected void const [noderef] __user *from
   drivers/ub/urma/uburma/uburma_event.c:751:50: sparse:     got struct uburma_cmd_hdr *

vim +349 drivers/ub/urma/uburma/uburma_event.c

   338	
   339	static long uburma_jfce_ioctl(struct file *filp, unsigned int cmd,
   340				      unsigned long arg)
   341	{
   342		struct uburma_cmd_hdr hdr;
   343		struct uburma_uobj *uobj = filp->private_data;
   344		struct uburma_jfce_uobj *jfce =
   345			container_of(uobj, struct uburma_jfce_uobj, uobj);
   346		int ret;
   347	
   348		if (cmd == UBURMA_CMD_WAIT_JFC) {
 > 349			ret = (int)copy_from_user(&hdr, (struct uburma_cmd_hdr *)arg,
   350						  sizeof(struct uburma_cmd_hdr));
   351			if ((ret != 0) || (hdr.args_len > UBURMA_CMD_MAX_ARGS_SIZE) ||
   352			    (hdr.args_len == 0 || hdr.args_addr == 0 ||
   353			     hdr.command >= UBURMA_EVENT_CMD_MAX)) {
   354				ret = -EINVAL;
   355			} else {
   356				ret = uburma_jfce_wait(jfce, filp, &hdr);
   357			}
   358		} else {
   359			ret = -ENOIOCTLCMD;
   360		}
   361		return (long)ret;
   362	}
   363	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
