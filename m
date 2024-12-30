Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC11A199E94
	for <oe-kbuild-all@lists.linux.dev>; Mon, 30 Dec 2024 20:44:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735591485; cv=none; b=XbZ8YkHufO24PLa7Q1jDyQoQWbTXjMsU1sn7oxXMLB7f7//fyLM1y72BCmQuaaXtB9gY54aqYCFzBLPRHiKln7pysYPZTrHMIpXtN+mptcDNhGbmfAmQrGoWkYz3rmTq5KhbZscv120q7UQUdxkZE6rk1ndu47ZJ1RtXcaZFGvo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735591485; c=relaxed/simple;
	bh=hDTbWbztV7unRzz9pJXRzzejdz9aYE5fQyX73bZwnqI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=mkpPEcg+8wN/ioz9cyUAbJGq9tcUfaA39/S6V+JNUGAz/w7CdOhSFicSg0riFN+8kl1quXK+1D805QGp1A9E/5BCZu988OgGiPCcW7dSSv5cxrP99an3KMMg5LbeN6mphGmKG8daofhMUdK6xQ/8MiBu3WmxQ3N/oiLeql847pc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XNVexlwa; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XNVexlwa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735591483; x=1767127483;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=hDTbWbztV7unRzz9pJXRzzejdz9aYE5fQyX73bZwnqI=;
  b=XNVexlwamRPBPp23N9PH02guWVdHONzAyQE784e/wWnCNdLRvKbnbo8i
   8XF0gYVw4R3IVA+8v2aEkkWaesWX8BwnGEoqOeT4s8HlfrjAJ/cENjSq8
   yUoNGA1IJfqF2Dnyhttt7v+ncmx5lK8hEOQlw0SpjCePQaFGStQVP8uIY
   BPQpqPjs/elvC9tXVaUX9H6WZ7RrSqYXJHvugGAgvb9VOS9qx85RvomH8
   1M1qPaNdMjtifhQcC5JjVziLijKkd+xFZzIIGGqzn6l+OeCpyHwx6dQKE
   A826PS/ynLMWuxPv/dTzKhjX//eQ+aEL4L7HleNM5t4vpt7TbWUlCWo6b
   A==;
X-CSE-ConnectionGUID: 9uoy3q1pRx2Nya6645Bc3Q==
X-CSE-MsgGUID: XPD+w0j5S+ml3+TNq0DUrQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11301"; a="36040342"
X-IronPort-AV: E=Sophos;i="6.12,277,1728975600"; 
   d="scan'208";a="36040342"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Dec 2024 12:44:42 -0800
X-CSE-ConnectionGUID: oqNPzpGySDGXRg3O4g1MSQ==
X-CSE-MsgGUID: 2Gsq0mDXQbKojmQDta+aTA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="138220336"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 30 Dec 2024 12:44:41 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tSMcw-0006O1-38;
	Mon, 30 Dec 2024 20:44:38 +0000
Date: Tue, 31 Dec 2024 04:44:19 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Yang Yingliang <yangyingliang@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1356/1356] ERROR:
 "netlink_kernel_release" [fs/ext4/ext4.ko] undefined!
Message-ID: <202412310428.apoNWdMg-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Zhao,

FYI, the error/warning still remains.

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   4dc4cec05b40921a3db85d24f97f1142272e4abf
commit: 6636f4434a9c5c9c645694db206188ee5a6626dd [1356/1356] ext4: report error to userspace by netlink
config: x86_64-buildonly-randconfig-003-20241228 (https://download.01.org/0day-ci/archive/20241231/202412310428.apoNWdMg-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241231/202412310428.apoNWdMg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412310428.apoNWdMg-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ERROR: "netlink_kernel_release" [fs/ext4/ext4.ko] undefined!
>> ERROR: "init_net" [fs/ext4/ext4.ko] undefined!
>> ERROR: "__alloc_skb" [fs/ext4/ext4.ko] undefined!
>> ERROR: "netlink_broadcast" [fs/ext4/ext4.ko] undefined!
>> ERROR: "kfree_skb" [fs/ext4/ext4.ko] undefined!
>> ERROR: "__netlink_kernel_create" [fs/ext4/ext4.ko] undefined!
>> ERROR: "__nlmsg_put" [fs/ext4/ext4.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
