Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED3CB2C80
	for <oe-kbuild-all@lists.linux.dev>; Sat, 23 Mar 2024 09:58:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711187940; cv=none; b=O9ZjakWjHIjSSSLvMsoqUQPP7e9Jy26/Z3JuvrXj4s5BgRFZsKBrV8KIjE9aFteWVAB+xjFkpv16Vjp/7RJDXUWjvAzsi1v2PbKDfyM/cpyjiScoy8eFmsoCQYE1x/DGRKw9YyKnNjsqroLeP4rALapFDTxq/xTPHtFikL9IqQU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711187940; c=relaxed/simple;
	bh=yv8yjMc9QRpqScHq/D8nFy9VvUL7OHm8JcXYxbt06BA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=S3aMcMvrttSRUSt7COGE4Uh/G44CZ3Meau6X3en8Ye/UkjgQs9mM4nCaTtosFPFbPrBk3xt2e19RMTB8Dw8q62iKGX9wS9pbBwI2cXe5KLlOZlL5ljaceEERqCgGkj4/EPlgjBTlj7Dvm3X16zJw/lX/9zFVISmHMUGWJ18yWyk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZyeXXMvr; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZyeXXMvr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711187938; x=1742723938;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=yv8yjMc9QRpqScHq/D8nFy9VvUL7OHm8JcXYxbt06BA=;
  b=ZyeXXMvrHEW2V5jXo1TSdF6LAwgq9RQgPhiKHvjWa/XjmPy6l0tMjmRQ
   cJFyTYYnfWe9ReFH3GTtga0s6jdZp5mvYHZzJf1+SfXH22pvFO3mhoY4n
   3iGd9Lac9GShor9jlKldZWWMD/3I3YSz7WqmK5qw9reoaoRY0YwPKgcy7
   UW9ktnbgmgEvRF8gSXAqa3lyV7VZBhXRSA2bai5RsgSPhBncv7ic0Sj4v
   DsMQ1FZbLDdugW4d/fn41lDqnxGDoKMC2TEfgQ84YF4vSFGPdvoqrgwr2
   aUYp7R8OBkvB9OQwUqrLAYLnf0FbkNzUmjSuAu5lj8CQLjGO2WE9cbOJt
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11021"; a="6096357"
X-IronPort-AV: E=Sophos;i="6.07,148,1708416000"; 
   d="scan'208";a="6096357"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Mar 2024 02:58:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,148,1708416000"; 
   d="scan'208";a="19838137"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 23 Mar 2024 02:58:55 -0700
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rny9M-000L31-0R;
	Sat, 23 Mar 2024 09:58:52 +0000
Date: Sat, 23 Mar 2024 17:58:44 +0800
From: kernel test robot <lkp@intel.com>
To: jasperwang@tencent.com, kaixuxia@tencent.com, frankjpliu@tencent.com,
	kasong@tencent.com, sagazchen@tencent.com, kernelxing@tencent.com,
	aurelianliu@tencent.com, jason.zeng@intel.com, wu.zheng@intel.com,
	yingbao.jia@intel.com, pei.p.jia@intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [opencloudos:next 20/48] ls2k500sfb.c:undefined reference to
 `fg_console'
Message-ID: <202403231726.8LdVIIeT-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/OpenCloudOS/OpenCloudOS-Kernel.git next
head:   e0ee18f8b8228a1b9598534057943383c2ed23a5
commit: 3a50da023fae0cfab612bffb333d4b1343299208 [20/48] fbdev: add ls2k500sfb driver for ls2k500 bmc.
config: x86_64-buildonly-randconfig-005-20240323 (https://download.01.org/0day-ci/archive/20240323/202403231726.8LdVIIeT-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240323/202403231726.8LdVIIeT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403231726.8LdVIIeT-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: vmlinux.o: in function `ls2k500sfb_events_fn':
>> ls2k500sfb.c:(.text+0xa574c0): undefined reference to `fg_console'
>> ld: ls2k500sfb.c:(.text+0xa574cb): undefined reference to `fg_console'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
