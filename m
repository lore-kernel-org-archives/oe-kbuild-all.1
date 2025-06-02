Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0CBDC8CE
	for <oe-kbuild-all@lists.linux.dev>; Mon,  2 Jun 2025 02:56:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748832980; cv=none; b=TBAwEYckc5yhrunXvNQbMe8ciJ/ldBmP13vG2R6gBg0jfWtpEQGMLpiFa0trkPaZ6QJw6fcuM2nuPG4psNLHAV5bedhSR83kj9+2FbCgkLyQCsiZAAJIGjfrQq8y/Q/5tzswHlAvy/ibdJS+KDAuHs3GsVbq8XJzM9f4mp/1v2c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748832980; c=relaxed/simple;
	bh=zLAse4vydSJAVXLkKUaZHAwYmL7ZtFQmUJ5lbVmcFIo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=GrCK2XdGN0IbC/xDpS/vyUguIclDIeqgV6n04tv4hOQLgTvsWN/crNBfCC35bcnCXFYlcjCtbG3OrcLQ3+kzpzOW5OtsEU+LiItxWK58dgEvEIyASVTL0Yhtxa+sRaD7saRJJ1E0vzh2c4TLvPB1IXeDch26dmVVcI8Oav3tWLQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gNj5H2hN; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gNj5H2hN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748832979; x=1780368979;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=zLAse4vydSJAVXLkKUaZHAwYmL7ZtFQmUJ5lbVmcFIo=;
  b=gNj5H2hN04DFAcKOd++B+uTYaoACvNUhkbaEYfziFbQKQRL89FemW5Y7
   ndOT6d5XKKJeSgCs0xfv23rukFXK+oeo5U3FzvYP2r8IEvVB4UMXok7Vy
   P/is4IfGqFEj+JIZ2r0xrAeJhLLYZaTblmbEXazjL5rY9Ar4UxnwppIwm
   aMspTOqLcTO3wBS/uc5WWoZwZ6U5g9YPO/7OKL0X54WLmqwhq6rldcTOP
   MOBqj5hYXX6imk+iqSeV9d9R6awH6anxcXOKH7CHzOgogXIJTts8ELCz+
   sEfIGak/q8B9cIA8eQfeJBR/HWL+hSQT6Nbozom1RvCN8BbxuyJwNqnxZ
   Q==;
X-CSE-ConnectionGUID: 3e5y9MZBR8yEGwd0IQ2IVg==
X-CSE-MsgGUID: L5Vjiz+KRu6Ll+zib/zSVw==
X-IronPort-AV: E=McAfee;i="6700,10204,11450"; a="50939212"
X-IronPort-AV: E=Sophos;i="6.16,202,1744095600"; 
   d="scan'208";a="50939212"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jun 2025 19:56:17 -0700
X-CSE-ConnectionGUID: fQVgFnhwSzauuo2KH+ADVQ==
X-CSE-MsgGUID: GnsPHxoHR8KS4J76fj0UGg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,202,1744095600"; 
   d="scan'208";a="167606637"
Received: from igk-lkp-server01.igk.intel.com (HELO b69e6467d450) ([10.211.3.150])
  by fmviesa002.fm.intel.com with ESMTP; 01 Jun 2025 19:56:16 -0700
Received: from kbuild by b69e6467d450 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uLvLS-0001Es-0n;
	Mon, 02 Jun 2025 02:56:14 +0000
Date: Mon, 2 Jun 2025 10:55:52 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12-desktop 141/141]
 drivers/base/power/wakeup.c:1219:5: warning: no previous prototype for
 function 'wakeup_sources_stats_open'
Message-ID: <202506021008.9QyeAmAX-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android16-6.12-desktop
head:   5f21a2173d4a9a0b933a59ed744e706ec8cf04f3
commit: 5df128deb8f2e04a46acb77df6aec44b1d343583 [141/141] ANDROID: Allow vendor modules to get wakeup sources data.
config: x86_64-randconfig-2005-20250503 (https://download.01.org/0day-ci/archive/20250602/202506021008.9QyeAmAX-lkp@intel.com/config)
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250602/202506021008.9QyeAmAX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506021008.9QyeAmAX-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/base/power/wakeup.c:1219:5: warning: no previous prototype for function 'wakeup_sources_stats_open' [-Wmissing-prototypes]
    1219 | int wakeup_sources_stats_open(struct inode *inode, struct file *file)
         |     ^
   drivers/base/power/wakeup.c:1219:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    1219 | int wakeup_sources_stats_open(struct inode *inode, struct file *file)
         | ^
         | static 
   1 warning generated.


vim +/wakeup_sources_stats_open +1219 drivers/base/power/wakeup.c

  1218	
> 1219	int wakeup_sources_stats_open(struct inode *inode, struct file *file)
  1220	{
  1221		return seq_open_private(file, &wakeup_sources_stats_seq_ops, sizeof(int));
  1222	}
  1223	EXPORT_SYMBOL_GPL(wakeup_sources_stats_open);
  1224	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
