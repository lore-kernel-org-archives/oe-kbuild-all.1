Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3106F1A0BFF
	for <oe-kbuild-all@lists.linux.dev>; Thu, 31 Oct 2024 14:44:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730385872; cv=none; b=tFzDSI2XpNvY3Kr8b8udDs/I5rCyx1O9HAJRKg3X7TijVolZyyOJFAzaLRuQhc/JDIDvJjuTbr6thUHx6uvuAtOAHUFEUVr/tRqeroiIesYsBH7Dx2WDSxt4RSUL1dnqT5/dqku8A/UaJhLBpXFtW4grwBfS73MrR+l133Pp6QE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730385872; c=relaxed/simple;
	bh=c3K96UJyC2sfBui9aoPMINbvQO+Hy7yI0/+W09ovgVE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=qtnHY6WZDvU5bA5P5G9vLWOihppKaG8SZzYJGlgN4uO+Q578DAkWC/JXKb+hshU1LquXnjNvlYRuFwGMqTWw01eHPYXxbeWWa7EyRZpvFR+ntUxYu6qtL4NGO8BW05T8HF5F/pWccaOzmljvs/tlCY7Q+z4nBdsCt6J9XV4P7zU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IPLu2Vsn; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IPLu2Vsn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730385869; x=1761921869;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=c3K96UJyC2sfBui9aoPMINbvQO+Hy7yI0/+W09ovgVE=;
  b=IPLu2VsnBw2cXpd+lF2ZOtzLQrxAszjsuVwsMupanOaOqoaA8zCaAYnU
   u1kTZfc4wnhqyx4/6xLd9nz0NLTeb0a8edokGLBtbc19yJ2E3NziwV/Pt
   Ib1xfy/+emq3wfNAtS/RutifkfEHHsiPcnhULMHNZxNC4SUdRWcMzkP0M
   6Iu+uE+Q//Q7vnJLTS4KQGrsxg7ymcN3BSsA23QhJC82EIVr2YIL4Fn/1
   U5xYLAcbWRdlbnKe/qxJz3Ptm/rQh7AOcjwknSbfwOBxYaiKtYtlOeieJ
   0vKMNMHhn4k5WFToSlykV+siK5mAWdUzau+pk2JzHskPrI/gmwjrPC9cs
   Q==;
X-CSE-ConnectionGUID: y6DuOTrNSYyRMtIRmTI0pw==
X-CSE-MsgGUID: 4+6FV5UhTjiHfal90xfbUg==
X-IronPort-AV: E=McAfee;i="6700,10204,11242"; a="47599957"
X-IronPort-AV: E=Sophos;i="6.11,247,1725346800"; 
   d="scan'208";a="47599957"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Oct 2024 07:44:28 -0700
X-CSE-ConnectionGUID: zVTxQPFjQwu+eySTiA7y1A==
X-CSE-MsgGUID: B2jFmGIgT42Qqxrd2s7cDQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,247,1725346800"; 
   d="scan'208";a="113493885"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 31 Oct 2024 07:44:28 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t6WPR-000gKa-1Z;
	Thu, 31 Oct 2024 14:44:25 +0000
Date: Thu, 31 Oct 2024 22:43:35 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, sanglipeng <sanglipeng1@jd.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 19333/30000] fs/ext4/fast_commit.o: warning:
 objtool: __ext4_fc_track_unlink()+0x275: unreachable instruction
Message-ID: <202410312220.K72H6v5s-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   c67d418d86fea7b8c2a11c7273229ffb0a7a57ed
commit: f2c902d8c653f8021f9761092a27f7b9db42b662 [19333/30000] tracing: Make tracepoint lockdep check actually test something
config: x86_64-buildonly-randconfig-001-20241030 (https://download.01.org/0day-ci/archive/20241031/202410312220.K72H6v5s-lkp@intel.com/config)
compiler: clang version 19.1.2 (https://github.com/llvm/llvm-project 7ba7d8e2f7b6445b60679da826210cdde29eaf8b)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241031/202410312220.K72H6v5s-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410312220.K72H6v5s-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/ext4/fast_commit.o: warning: objtool: __ext4_fc_track_unlink()+0x275: unreachable instruction

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
