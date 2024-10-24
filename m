Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4D2E1FC7D8
	for <oe-kbuild-all@lists.linux.dev>; Thu, 24 Oct 2024 17:38:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729791494; cv=none; b=KEh+9jJ9TC0nNNQenB1QGMPgZgsHB723ob+g0YJtOdOjLBeIxiIjtakPfzy2Uc98eHb9ysu+3HJvWvTaBcaYWwlg83kXuUiEMbjHYdpzo02ZliUA6/wiXnHAKk8XZ5tH3Zgvpfnm86Wc7PHY6jFkaIw6sD657MwdOtCcrPWy1a4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729791494; c=relaxed/simple;
	bh=JQlK9Js31W/MBJfsjyZodmRpDZ4UYtd3uRAwTaF+Pfo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=fiFrORGA+XkdlOe22AmSGaPBPStI/cwzfJzlxlsssdupYuNCD7AuFQD31yBnr7HRhe0f93weJhcU8/+f9O5xCMNL6ZFIf/7qdCxxWJuxkojL61O0nyW4+bJRUEgD2wJ8PUCtJ/gjRqQHkKM1Ufg3ifQfBxwyXhpXIOpVX6w6t+o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eIpkN4fz; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eIpkN4fz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729791492; x=1761327492;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=JQlK9Js31W/MBJfsjyZodmRpDZ4UYtd3uRAwTaF+Pfo=;
  b=eIpkN4fzRi8cFAe1HHffelMe4VsSmpSe7kiM9LitMU/IVICGu6hIuMuP
   O+V3P0MjDav/7VkZsNhS7wPIPV9bY0NKNEm+aVhQTXWjssRKYvUVIX3yZ
   0Tkv86WLZZA/oDO6AOBGfzhAscQHAjeFN1CTfSsXapVyWhOzzWra3tZ1a
   r1Vpk4IswVs9MZCp+gJyFZaw0qlXKOFTJQORqKVybHoNx4cW9MWTw2dAr
   j/NTbSL5abV4oXM5nGTqp2prGyxGqYGLksEQLa1PbDoBrI8vn9rPStkcE
   AN7mfiR6ASMj8xaaVSspG7rSQbdpKUGW9E8fCGetw7ayonwCJdISTCfcB
   w==;
X-CSE-ConnectionGUID: XfqOlUs0T5WOtHMwfICrag==
X-CSE-MsgGUID: mON5kPQfQSeka4+brJAVSg==
X-IronPort-AV: E=McAfee;i="6700,10204,11235"; a="40028696"
X-IronPort-AV: E=Sophos;i="6.11,229,1725346800"; 
   d="scan'208";a="40028696"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Oct 2024 10:38:10 -0700
X-CSE-ConnectionGUID: 0ScAU7a5SkKKlfhN2g4Mhw==
X-CSE-MsgGUID: tlEayYB/TW2mMhXHyVgI/w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,229,1725346800"; 
   d="scan'208";a="80247296"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 24 Oct 2024 10:38:09 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t41mh-000WnB-0N;
	Thu, 24 Oct 2024 17:38:07 +0000
Date: Fri, 25 Oct 2024 01:37:08 +0800
From: kernel test robot <lkp@intel.com>
To: Sean Christopherson <seanjc@google.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	"Borislav Petkov (AMD)" <bp@alien8.de>
Subject: sound/soc/soc-core.o: warning: objtool:
 snd_soc_daifmt_parse_format+0x28a: unreachable instruction
Message-ID: <202410250126.0eXFyl64-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   c2ee9f594da826bea183ed14f2cc029c719bf4da
commit: fe42754b94a42d08cf9501790afc25c4f6a5f631 cpu: Re-enable CPU mitigations by default for !X86 architectures
date:   6 months ago
config: x86_64-randconfig-r061-20241024 (https://download.01.org/0day-ci/archive/20241025/202410250126.0eXFyl64-lkp@intel.com/config)
compiler: clang version 19.1.2 (https://github.com/llvm/llvm-project 7ba7d8e2f7b6445b60679da826210cdde29eaf8b)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241025/202410250126.0eXFyl64-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410250126.0eXFyl64-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from sound/soc/soc-core.c:36:
   In file included from include/sound/pcm.h:15:
   In file included from include/linux/mm.h:2208:
   include/linux/vmstat.h:522:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     522 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   1 warning generated.
>> sound/soc/soc-core.o: warning: objtool: snd_soc_daifmt_parse_format+0x28a: unreachable instruction
--
   In file included from sound/soc/codecs/max98090.c:9:
   In file included from include/linux/i2c.h:19:
   In file included from include/linux/regulator/consumer.h:35:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:21:
   In file included from include/linux/mm.h:2208:
   include/linux/vmstat.h:522:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     522 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   1 warning generated.
>> sound/soc/codecs/max98090.o: warning: objtool: max98090_jack_work+0xa8: can't find switch jump table
--
   In file included from sound/soc/codecs/rt5640.c:16:
   In file included from include/linux/i2c.h:19:
   In file included from include/linux/regulator/consumer.h:35:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:21:
   In file included from include/linux/mm.h:2208:
   include/linux/vmstat.h:522:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     522 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   1 warning generated.
>> sound/soc/codecs/rt5640.o: warning: objtool: rt5640_probe+0x12c: unreachable instruction

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
