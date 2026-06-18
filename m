Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 764EE2D94AB
	for <oe-kbuild-all@lists.linux.dev>; Thu, 18 Jun 2026 06:01:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781762476; cv=none; b=SXwOebAh4TXFJ1EWZ6pv5rECl77gC3m3yuHwxFPIi0quJG57ypVJJHbUywbkO0nEnYxxHISA/sv8TwDahWDA05PW7vLM9pwfvd/aZPXlXDECxGWUlF/h2orGGDFq15tMbWWTiTH/uXqZbs+JySgHSnY+vzFCMv4xuH+L3+DhC/0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781762476; c=relaxed/simple;
	bh=2xwEkeJHnm1cJcdxuueukhbqSbJKNJ7NKcjAfssq32o=;
	h=Date:From:To:Cc:Subject:Message-ID; b=khqAQpFmPdZUAyVIARA02v6dAgNchX2Tk/M45VAGRaocxwW1n0jL1EWzAIMNeGazzqBPBztnY9hWWnfvOAh1oxbIzRuz02am+ydudQpb9HI/e0/FKS4+18MFh186KHW2RIUw2mazPIt6At0N7Vl71VVWTnM5zNxaB7gu5qV424M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=i9tevOal; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="i9tevOal"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781762475; x=1813298475;
  h=date:from:to:cc:subject:message-id;
  bh=2xwEkeJHnm1cJcdxuueukhbqSbJKNJ7NKcjAfssq32o=;
  b=i9tevOal25Kt/RDbmu/+p63NpW7zmwoAo+jB8XSRlJc10SrwuEiKiukC
   je1uuZ+KLJK57fw4+kd22aQy8miSMBPvDNlaDxcLpJQL8jZZj/u0X706w
   SaCK0W6mseaHtlFZupLjM2L2Kvhpd1D9svSC2j852Zo3rMX+ioohHB7vs
   hC6Q7co+855Y+VeY8LbPCVfsQLBFpJh0X7DJy+kJk7koH7ZLFBzwvH6hw
   xXb2wa93qciwmsLQ+gr5y55Z8O1axnpY3dUEsLZsXnykfSRWZtgyecWer
   zNTpf387cEHuYVvbulFqiUxAZOaDsY4Il327IG0XxoqeaSYoy++y5li/Y
   Q==;
X-CSE-ConnectionGUID: o/j1xri1QPWfri905URXKQ==
X-CSE-MsgGUID: k6HtwfERR0CW8c4lm3VfmQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11820"; a="81572382"
X-IronPort-AV: E=Sophos;i="6.24,210,1774335600"; 
   d="scan'208";a="81572382"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jun 2026 23:01:13 -0700
X-CSE-ConnectionGUID: xC4jHjZmRni4o6KLLssXuA==
X-CSE-MsgGUID: T4hxLbyBRdGJCSm3cHKTWA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,210,1774335600"; 
   d="scan'208";a="286389936"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 17 Jun 2026 23:01:11 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wa5oK-00000000VHc-3fjO;
	Thu, 18 Jun 2026 06:01:08 +0000
Date: Thu, 18 Jun 2026 14:00:42 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6-2025-06 4/4]
 drivers/block/loop.c:1967:6: warning: no previous prototype for
 'loop_process_cmd_list'
Message-ID: <202606181221.KK1o7lns-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android15-6.6-2025-06
head:   85490001cfe93283299435daf1c5d8552e2602fd
commit: e43346421ebd0b52ea04356fbc7ddeae108a4415 [4/4] ANDROID: loop: export loop_process_cmd_list
config: i386-buildonly-randconfig-006-20260618 (https://download.01.org/0day-ci/archive/20260618/202606181221.KK1o7lns-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260618/202606181221.KK1o7lns-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606181221.KK1o7lns-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/block/loop.c:1967:6: warning: no previous prototype for 'loop_process_cmd_list' [-Wmissing-prototypes]
    1967 | void loop_process_cmd_list(struct list_head *cmd_list, struct gendisk *disk)
         |      ^~~~~~~~~~~~~~~~~~~~~


vim +/loop_process_cmd_list +1967 drivers/block/loop.c

  1966	
> 1967	void loop_process_cmd_list(struct list_head *cmd_list, struct gendisk *disk)
  1968	{
  1969		struct loop_device *lo = disk->private_data;
  1970		loop_process_work(NULL, cmd_list, lo);
  1971	}
  1972	EXPORT_SYMBOL_GPL(loop_process_cmd_list);
  1973	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
