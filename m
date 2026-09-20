Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47781376A03
	for <oe-kbuild-all@lists.linux.dev>; Sun, 20 Sep 2026 10:36:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789900575; cv=none; b=H2ysb1J7M/FZyMnQE9eJibOaXAsixck6jOAY/jZmOK5/kn5ecSHU7yVR2zPaxtGiEMq3Yq7w7PLJu/YN6g84PXfdhC+x0GxFT4b4aClGK0v7RMsP6kQBhaiSHi0VYkjJWO3BkmR0UfQrsKm0HYa1Jr5nz5X70LFd/cvPM6BV4SY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789900575; c=relaxed/simple;
	bh=rEhR9aFxcCoV42/+7Ov2Y1SyYTYrrqmcHqFPQPrvm40=;
	h=Date:From:To:Cc:Subject:Message-ID; b=T2qv53h1vAAlj2+YWl36N2RyoE3gziwr3zD/X0cHt8MjQ70W1tkjlQdRip9wtD61FAU0qE9uB9Cm1bFzViGMOf42/W2Bsn/vzM0ffbO+0ZpIZ/XWMbCqBWzknE+tdqwTEUQFBJJ0ygQYCtvLw6gXIn43EHgP4XbP3+WidMBqQs4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MSsTsvxi; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MSsTsvxi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789900573; x=1821436573;
  h=date:from:to:cc:subject:message-id;
  bh=rEhR9aFxcCoV42/+7Ov2Y1SyYTYrrqmcHqFPQPrvm40=;
  b=MSsTsvxixQR5cpaRYkL7EiG8FgD2b0ZspOioRrcCFFkrg6AXuaGHX1Nc
   8iNSIaLIMSigWNiQljvbwjGim3b4fPgN0vjD1UFesbbyhP1pK3NuliHXc
   FbL1jexfXB1WYJ44qdzNdJvE8VGl6h9ATB92CbLUAP6aodc8S/s+i064i
   0y8532fK6re7lPaaI9gwnViSooER9CQzm+2xLWn20ch+BkemxgnjzpI2x
   96jxwVHNB+Slj0GVPLCx6u4xk8HkHfeMJumKC4PhO5Rc8zZiJ2TFYlHX3
   G+tm1bjAp+yJhQJfciJIerKyXyWj/jLoe+5brKDWkJ+I6NopmpllZ3oh1
   g==;
X-CSE-ConnectionGUID: jyG8ArEvT4GHOJOomzx9Zw==
X-CSE-MsgGUID: Ucz2TjzARduB1vqgP5dRJA==
X-IronPort-AV: E=McAfee;i="6800,10657,11910"; a="90531965"
X-IronPort-AV: E=Sophos;i="6.27,111,1787036400"; 
   d="scan'208";a="90531965"
Received: from fmviesa011.fm.intel.com ([10.60.135.151])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Sep 2026 03:36:11 -0700
X-CSE-ConnectionGUID: B9ZfPbg/TeS369S8I8QVzQ==
X-CSE-MsgGUID: gWoi7odNTHOnbBsQfeQ0Qw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,111,1787036400"; 
   d="scan'208";a="3295019"
Received: from lkp-server01.sh.intel.com (HELO 462990a40a85) ([10.239.97.150])
  by fmviesa011.fm.intel.com with ESMTP; 20 Sep 2026 03:36:10 -0700
Received: from kbuild by 462990a40a85 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x8Etz-00000000CHb-2w02;
	Sun, 20 Sep 2026 10:36:07 +0000
Date: Sun, 20 Sep 2026 18:35:57 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android17-6.18-2026-06 1/1]
 sound/soc/intel/avs/path.c:137:38: warning: 'strcmp' reading 1 or more bytes
 from a region of size 0
Message-ID: <202609201833.CtXj4rUA-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Cezary,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android17-6.18-2026-06
head:   52885947a5175518322f92c59e02b6786c08dbd4
commit: 595b7f155b926460a00776cc581e4dcd01220006 [1/1] ASoC: Intel: avs: Conditional-path support
config: arm-allyesconfig (https://download.01.org/0day-ci/archive/20260920/202609201833.CtXj4rUA-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260920/202609201833.CtXj4rUA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 595b7f155b92 ("ASoC: Intel: avs: Conditional-path support")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609201833.CtXj4rUA-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In function 'avs_tplg_path_template_id_equal',
       inlined from 'avs_condpath_find_match' at sound/soc/intel/avs/path.c:160:6,
       inlined from 'avs_condpaths_walk' at sound/soc/intel/avs/path.c:1269:13:
>> sound/soc/intel/avs/path.c:137:38: warning: 'strcmp' reading 1 or more bytes from a region of size 0 [-Wstringop-overread]
     137 |         return id->id == id2->id && !strcmp(id->tplg_name, id2->tplg_name);
         |                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from sound/soc/intel/avs/path.h:14,
                    from sound/soc/intel/avs/path.c:15:
   sound/soc/intel/avs/topology.h: In function 'avs_condpaths_walk':
   sound/soc/intel/avs/topology.h:150:13: note: at offset 4 into source object 'id' of size 4
     150 |         u32 id;
         |             ^~
   sound/soc/intel/avs/topology.h:150:13: note: at offset 4 into source object 'id' of size 4


vim +/strcmp +137 sound/soc/intel/avs/path.c

   133	
   134	static bool avs_tplg_path_template_id_equal(struct avs_tplg_path_template_id *id,
   135						    struct avs_tplg_path_template_id *id2)
   136	{
 > 137		return id->id == id2->id && !strcmp(id->tplg_name, id2->tplg_name);
   138	}
   139	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
