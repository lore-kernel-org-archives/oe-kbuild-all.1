Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 816DF395266
	for <oe-kbuild-all@lists.linux.dev>; Wed, 20 May 2026 23:12:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779318772; cv=none; b=ER1PoGF9xvxDhp8dsapfUehNRUhhtK8vDWc4nhc6+yHsKRuZZ8WROAeoCxlooRnNvYwq2lacME5YKbDQadMg0KIAhCmil0hZ8qGiepqyOH35VLO6vGTQA/bBON2OBiHI/rrt3CO46SjHG34p7NBlF1gUbLk3iyX09ScQ/hS9uXQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779318772; c=relaxed/simple;
	bh=Sxvvufs2Ec+0ep9xlt+slYUDEx/V5xfFBWwd9vLO+vs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jRmWU1EP1FyjaHRkj/M9DPsgScYsRzjx+ek3Ldwy8WFbqHZUhrdAdsdKu72uPTCdyK1RkoPnCJYoW7HsL9lyQpCrJbLM58x4syhOTYQ95FoOruSBS59jYdAcsDh1+ibdxG36J6x+6JlF8z2MmCxupvm6HpbUauggo0XcORaHcH8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eby6FZfm; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eby6FZfm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779318770; x=1810854770;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Sxvvufs2Ec+0ep9xlt+slYUDEx/V5xfFBWwd9vLO+vs=;
  b=eby6FZfmyYM01T9j11QfKS5u2oq8VY59MSWxdhVcqhjqxDKoWdFQy9Qf
   ePdP9pCa7Pb8e2f2R6YqOYX1vx40MUM/HUpQt85hK5F1Y1W3QaMQTYrqQ
   K5yXjaz6hxrM/X4vcUowg0x2YNSSUhnQbVy9WwbC8WmjdeYcHv73FIZe5
   T0M9WysvLD/dHqPQEeihpJOez7aYrD4oEDIhkHfal5NBoGJhkg1HJVjzQ
   8X8/5UDdz8Ep0dhye7Fpbca+oDJYN/PuSxwBopGj+yBjymVb/1It2Z6v9
   0aW8b77tI1R8jNrJxMdA67OZwO8NzrMenNvNydJR7c86TGS8sAUHN3FbK
   g==;
X-CSE-ConnectionGUID: +dlmnTIIQAS4ldDiyWSUcw==
X-CSE-MsgGUID: 9H/4BMKRQKWuOp94lIrT8w==
X-IronPort-AV: E=McAfee;i="6800,10657,11792"; a="91623222"
X-IronPort-AV: E=Sophos;i="6.23,245,1770624000"; 
   d="scan'208";a="91623222"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 May 2026 16:12:50 -0700
X-CSE-ConnectionGUID: qwMb1zaLS0iVTfvtUG609g==
X-CSE-MsgGUID: rEK3q4mgSRGwi38bI7S5Vg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,245,1770624000"; 
   d="scan'208";a="270701254"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by orviesa002.jf.intel.com with ESMTP; 20 May 2026 16:12:47 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wPq5i-00000000AfZ-2YHm;
	Wed, 20 May 2026 23:12:42 +0000
Date: Thu, 21 May 2026 01:12:04 +0200
From: kernel test robot <lkp@intel.com>
To: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
	broonie@kernel.org
Cc: oe-kbuild-all@lists.linux.dev, lgirdwood@gmail.com, perex@perex.cz,
	tiwai@suse.com, matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com, sharq0406@gmail.com,
	kuninori.morimoto.gx@renesas.com, ckeepax@opensource.cirrus.com,
	srinivas.kandagatla@oss.qualcomm.com, linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH 2/2] ASoC: mt8173-max98090: use standard callback to set
 jack
Message-ID: <202605210132.USry3Haw-lkp@intel.com>
References: <20260520132930.54333-3-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260520132930.54333-3-srinivas.kandagatla@oss.qualcomm.com>

Hi Srinivas,

kernel test robot noticed the following build warnings:

[auto build test WARNING on broonie-sound/for-next]
[also build test WARNING on linus/master v7.1-rc4 next-20260520]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Srinivas-Kandagatla/ASoC-codecs-max98090-use-component-set_jack-callback/20260520-213646
base:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next
patch link:    https://lore.kernel.org/r/20260520132930.54333-3-srinivas.kandagatla%40oss.qualcomm.com
patch subject: [PATCH 2/2] ASoC: mt8173-max98090: use standard callback to set jack
config: x86_64-rhel-9.4-ltp (https://download.01.org/0day-ci/archive/20260521/202605210132.USry3Haw-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260521/202605210132.USry3Haw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605210132.USry3Haw-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: sound/soc/codecs/max98090.c:2353 function parameter 'data' not described in 'max98090_set_jack'
>> Warning: sound/soc/codecs/max98090.c:2353 function parameter 'data' not described in 'max98090_set_jack'

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
