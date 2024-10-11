Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 245C21E132B
	for <oe-kbuild-all@lists.linux.dev>; Fri, 11 Oct 2024 23:40:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728690047; cv=none; b=RLcKs//u1kreB1XGrIL8kxkWhjx/CZC+08vK0B4FkOhcR7IoM1KFHM7s2ruHeDsDpDMwEUuK19M+8a+19XPxWNZaNUMrWanS7Y8m8UvMePLCTVcpKoVrRaZygJ+nKVNMit8uHdemAmOe6p1M8N09VCEK7P0i2Tlr1SgQUpdxm9g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728690047; c=relaxed/simple;
	bh=uXeD2qi/RB1OTFnaXVxmGfHp7lD3rRvtaxvjlVq/U1Q=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=XwMzQTQyCv2ATTWSlFZb5LFFvMtA6yTDxfuHzerbXl+EVg4Y753S3t6T/Y4ATa7Uux+ExFbbxOLu7EPl+OuIL/ccBuIGs1T1Y4z3YZ6HZLN5VKLJ7UP2aBRAUrNlIxDqlEFWpJbHnDaK+IS1/T/XS1KcFEEtp7SLkLNPTbAqrco=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=V5o2VFKi; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="V5o2VFKi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728690045; x=1760226045;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=uXeD2qi/RB1OTFnaXVxmGfHp7lD3rRvtaxvjlVq/U1Q=;
  b=V5o2VFKi6m20MJviHu/PauPZYOgw9TyflQC58mD1N7DxMJwcGgfqzLix
   rlFOJ0Ojebfm6edpwAVH3GxWVjLzAzv837Rs0h6fBExYd1+huo+d07Su8
   joD9nvVCvTQ/ZrDnuArSPhEqBg9F6DCYVuIYuucok27LJ0jJsx7ZgEYzC
   U7INTCP7gLPlL8ZNCQ6ZzKberafAqfSQTIq2/v489ePevBeh74pkKrT9C
   JxqU82V4qzpJhB8bhR76isKcHqd+2aMAaH+WKqViSgSzVc22YUaRNRGKb
   jIz2+XVqkFMThwcnq0Ps8OsR7NgrIXmYmENKJr0gdzlLhVdwOMwaOMgMa
   w==;
X-CSE-ConnectionGUID: PqSkJz5gT+G4yKh5HVcDQQ==
X-CSE-MsgGUID: kGWvWzUlQtaPVi0vL8QjRw==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="32009653"
X-IronPort-AV: E=Sophos;i="6.11,197,1725346800"; 
   d="scan'208";a="32009653"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Oct 2024 16:40:44 -0700
X-CSE-ConnectionGUID: R0AVmtW8SfSNmzzulgBorg==
X-CSE-MsgGUID: 55JvLwRkQiuGEWODzcQIUQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,197,1725346800"; 
   d="scan'208";a="100359425"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 11 Oct 2024 16:40:43 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1szPFR-000CrF-18;
	Fri, 11 Oct 2024 23:40:41 +0000
Date: Sat, 12 Oct 2024 07:39:50 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, xiajingze <xiajingze1@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 10655/14350]
 drivers/iio/imu/bmi160/bmi160_core.o: warning: objtool: .text: unexpected
 end of section
Message-ID: <202410120718.Pcw8jZBK-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   f7c1291d7c3f15bc448cd93e29fa539386fe85fe
commit: 241ad43fe7e9c24d5ba4cdd1ec22e731cdd22d14 [10655/14350] Compiler: Add clang's PGO support for kernel.
config: x86_64-randconfig-121-20241012 (https://download.01.org/0day-ci/archive/20241012/202410120718.Pcw8jZBK-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241012/202410120718.Pcw8jZBK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410120718.Pcw8jZBK-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/iio/imu/bmi160/bmi160_core.o: warning: objtool: .text: unexpected end of section

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for PGP_PRELOAD
   Depends on [n]: CRYPTO [=y] && ASYMMETRIC_KEY_TYPE [=n]
   Selected by [y]:
   - PGP_PRELOAD_PUBLIC_KEYS [=y] && CRYPTO [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
