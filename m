Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE41722FE13
	for <oe-kbuild-all@lists.linux.dev>; Tue, 11 Feb 2025 16:22:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739290955; cv=none; b=lngQdvddAjsGln2IIQ0ltI7Hna8YK0jWFEWO2GYGv9BBVcwRpye5/CdEKCm6rzltPtQnKygKKAxzzQ/Qy0slfGGd3a9n1QnIEm+dWxrgbA+T9jms+FiLQUnnQcpoMiLCYh6qvH9S8QRSe8DQqrN5F6rYQGEdoHRWb8pK1/Eev58=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739290955; c=relaxed/simple;
	bh=JCIQwqqW2Fsi6wkNEayZfqfx9o8WAehX5bcTGRBkY8M=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=tG7JJ+8sJ1myWVT5ddZoV0XFomfzH1luPIYgubwGlQ+k5vR2M5YGoNhmOgG2z0T9unOdv8mFBcRJSLhcjk35rkFoPeoIh05A3b1VMA0zMd40hkykBauHHy52Dfhfs+CPJBaM+EKvVnmSn656LW3CMoxuM02AV3eOZSr2IcXBKyo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=E0JsR8Nu; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="E0JsR8Nu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739290952; x=1770826952;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=JCIQwqqW2Fsi6wkNEayZfqfx9o8WAehX5bcTGRBkY8M=;
  b=E0JsR8Nu1muRs4ZrG9yvDI6Mhgx0D/QXkjGFbbn+amfmLQiDkOFF84sM
   wfYRPYoQexlaQ7jfKuQr3YDOhzAfDs6Q92Dkr/C1t2Jc2u71ImLAMdy6G
   uC8TNlwkF+a1e19x4W/Rorv8I/+/P4YEVkiTIaVX0Kj8Z+mjVWpWrw+gg
   y88gURtA4EH6F6+m4/AX10DOTyoE+ooFtDHCKoeYMJXNNiTW3jmb9IZlh
   mVMnvT0OYo3rODBN1i+jAxNXzu9cloJ3kr26s4c0F1heXlpxYthwCBXLM
   Ht9trIUya7xNQ3WyelYTzM7j5ANRb30w5wjscmMXLKCn1ga9gPAMM8YNv
   A==;
X-CSE-ConnectionGUID: euEr0dpUTJKUuRtwkcWuYg==
X-CSE-MsgGUID: y7f0SnG6S0WVqUK2pZdCDg==
X-IronPort-AV: E=McAfee;i="6700,10204,11342"; a="43848003"
X-IronPort-AV: E=Sophos;i="6.13,278,1732608000"; 
   d="scan'208";a="43848003"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Feb 2025 08:22:32 -0800
X-CSE-ConnectionGUID: nmVXLwrTSCaLRkpJZGwLJg==
X-CSE-MsgGUID: Rlf2lWV2QAyftxr90hfdvw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,278,1732608000"; 
   d="scan'208";a="112385507"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 11 Feb 2025 08:22:32 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tht1p-0014Ql-35;
	Tue, 11 Feb 2025 16:22:29 +0000
Date: Wed, 12 Feb 2025 00:22:00 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Xie XiuQi <xiexiuqi@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1423/1423] net/netfilter/nft_reject.o:
 warning: objtool: missing symbol for section .text
Message-ID: <202502120051.I8bb4X2D-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Florian,

FYI, the error/warning still remains.

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   6a6cc2b6b95dc80ae01221670e21a8059229a023
commit: 652d06efaf87f238d7bb96f3d63561c6cf65f910 [1423/1423] netfilter: nf_tables: avoid BUG_ON usage
config: x86_64-buildonly-randconfig-001-20250211 (https://download.01.org/0day-ci/archive/20250212/202502120051.I8bb4X2D-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250212/202502120051.I8bb4X2D-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502120051.I8bb4X2D-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> net/netfilter/nft_reject.o: warning: objtool: missing symbol for section .text

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
