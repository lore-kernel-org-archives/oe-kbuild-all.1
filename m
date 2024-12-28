Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A78E33985
	for <oe-kbuild-all@lists.linux.dev>; Sat, 28 Dec 2024 20:52:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735419164; cv=none; b=LI5dMki33lrI/yf3GdLsCrCzx9m5w76+Q26A+cPcDX9YtgXtOvIBj+EIBVHrvJ2bKUmSCRXMB3Mt6HSCrsO9kwnlp6vUhH5t63I1PI50+xxAbejQJ2c6ITfXn9HbP2EOz+afWf3m2VoazwZu4hzIaaIw+pUBcMS6zrMPUqhpfEs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735419164; c=relaxed/simple;
	bh=ITR1l1hERU9rD28LuXdkNY4YYM5cKoxnbOU+7JJAT6M=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=UlRknsbkTdnTcGjP/5LzmYhoU9CYHRBLczY50MnH5FQoog8qeixwReo2U8azYWJuUow5IU9VeRJf2IMZHtUQ4ektIazMRdEcz9kGvqzJi4kXs5DOrVGNzzuGw9BeMBz+tE/Iy2HWc3uX0TwyFG9AY+ycwaRpohMr+K8IdLB0sbM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=m7er0+r2; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="m7er0+r2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735419162; x=1766955162;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ITR1l1hERU9rD28LuXdkNY4YYM5cKoxnbOU+7JJAT6M=;
  b=m7er0+r2M5pBDFJ9DxVUMKZwcM2E1c5vTQTCM1fW7TygR5ddRv3eqENA
   q84FU+mkMVdbeXlqIcATxr8EeFdLEsXtNDrwjcy6F9mMVeUy5bssjhjuq
   hA4ouYi2piTjfJy1T3Gjltu2kKqkrZuZljj8H4vIonX+YqkWHsU/2qI84
   XUYtdK7ds3Mi/lpkgkWdRSLL5S2MCLAATlObwGPiQa33ufDPvE52cbsgz
   QSNB+3vHH147L0/Ljf3rYilnpO594nGCGMfphrX6O8SN+oV6LjNrMEn5k
   xGAnyd4J2uxSC6rUTbqzwESB/6TW0S2voIBX2fsFCPPX9Cs9Txe60OJPD
   A==;
X-CSE-ConnectionGUID: W00LCMfGRzygVfvywt8yLA==
X-CSE-MsgGUID: l+u4gAGYRZ2bfan316kXiQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11299"; a="46450494"
X-IronPort-AV: E=Sophos;i="6.12,273,1728975600"; 
   d="scan'208";a="46450494"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Dec 2024 12:52:41 -0800
X-CSE-ConnectionGUID: AaKLne75QnWAzzq65177AQ==
X-CSE-MsgGUID: 0cGrOAbQQ9CmW4PuWgaPTQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="100266263"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 28 Dec 2024 12:52:41 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tRdna-0004Iy-1K;
	Sat, 28 Dec 2024 20:52:38 +0000
Date: Sun, 29 Dec 2024 04:52:04 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Zizhi Wo <wozizhi@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 2589/2589] fs/dirty_pages.o: warning: objtool:
 seq_read_dirty()+0x112: unreachable instruction
Message-ID: <202412290447.CV8oCAhR-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   4848f81edc2027721953fee5ded81f909a833e26
commit: 5a1ee7023c691ec9881a70d8d0c00f6f018a7b05 [2589/2589] fs/dirty_pages: fix some errors in seq_read_dirty()
config: x86_64-buildonly-randconfig-002-20241218 (https://download.01.org/0day-ci/archive/20241229/202412290447.CV8oCAhR-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241229/202412290447.CV8oCAhR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412290447.CV8oCAhR-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/dirty_pages.o: warning: objtool: seq_read_dirty()+0x112: unreachable instruction

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
