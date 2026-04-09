Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1297C223339
	for <oe-kbuild-all@lists.linux.dev>; Thu,  9 Apr 2026 06:05:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775714758; cv=none; b=B8TpZjH1ZFX+JKpe6qslYA8Ys4iOJ8Qa2hyzgP94IGcZL6JuUK7rtthQ0mzTvQdwJ26joseRQ8ExTC3fp6l3P2htw7oC5IjwAwFDY6BwNPavgXHSsOX+CDQjz/id/Ip3e0ljcwLBrQYyiQAqCyx29PBaSErDt6+DsReZIfKMV1U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775714758; c=relaxed/simple;
	bh=aVho+y2IngdH05PFPZ/K2prIMKJJxqXSJG6a58iNzUQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=EU+HyKujFkLntAmYxq2j9UMJXYKBo0D7aTyS5m/YoTHcR3Up9P1ZtmmD7yyP6v20om+TV+77PmpTU7cqGf5NoxRm1kCMVlpOMSTR78uvYKAAQKYD8gfqI7tmR6lhk5qbqjwkgHs7EKZK0RQAt8wIWDWdm6Eb+93r5x6Qhv80Mkc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PIablMNc; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PIablMNc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775714757; x=1807250757;
  h=date:from:to:cc:subject:message-id;
  bh=aVho+y2IngdH05PFPZ/K2prIMKJJxqXSJG6a58iNzUQ=;
  b=PIablMNcIAQgDzWQfBE2+OPROFAQFB6X4CR6+tFh/riZijudmOKGdMO7
   zmCXaPX6h+RbRW6/qXph/f6TvEpxX/FtbHj1pj5FYaKrPR/0EyIQa/Bmh
   x2EdxChfXVLkdiz5Z8bejePyVdAhH0bJpp8KmOA95J5cIBNd6mwPTAuYu
   SI9j63yuoIcvvvzPBAVABynugJzgehwm/c82ANuiTRASTgEvPl7ic4yK5
   6+fFvhJ11V1sEie/1TlqZUb6Mm9Mfu76f54M/3TvF8iuFbNQ64AQ5J9iw
   iYlxvkN9tN7/se1I9wibeZFUKQx/JSBwbEX23kAxkHlPBjh5sNZNUM0gJ
   g==;
X-CSE-ConnectionGUID: iOAI6FsFRaum2A3SMXORZg==
X-CSE-MsgGUID: wln8RX7ESfyxNknOJbXqKQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11753"; a="87411387"
X-IronPort-AV: E=Sophos;i="6.23,169,1770624000"; 
   d="scan'208";a="87411387"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Apr 2026 23:05:56 -0700
X-CSE-ConnectionGUID: KJQ8zzKPTqW1ELLNuYugBQ==
X-CSE-MsgGUID: uy+JkBLnRJ6Lqmrja3n9ww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,169,1770624000"; 
   d="scan'208";a="224374302"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by fmviesa010.fm.intel.com with ESMTP; 08 Apr 2026 23:05:55 -0700
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wAiWX-00000000Acz-0Hiu;
	Thu, 09 Apr 2026 06:05:53 +0000
Date: Thu, 09 Apr 2026 08:05:28 +0200
From: kernel test robot <lkp@intel.com>
To: Richard Fitzgerald <rf@opensource.cirrus.com>
Cc: oe-kbuild-all@lists.linux.dev, Mark Brown <broonie@kernel.org>,
 Charles Keepax <ckeepax@opensource.cirrus.com>
Subject: [broonie-sound:for-next 11/13] Warning:
 sound/soc/sdca/sdca_interrupts.c:566 function parameter 'dev' not described
 in 'sdca_irq_cleanup'
Message-ID: <202604090800.koxM6j6O-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next
head:   1d68e4b0c19b3a98e8073685d05dccd757fa0a2c
commit: 0b8757b220f94421bd4ff50cce03886387c4e71c [11/13] ASoC: SDCA: Unregister IRQ handlers on module remove
config: x86_64-rhel-9.4-ltp (https://download.01.org/0day-ci/archive/20260409/202604090800.koxM6j6O-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260409/202604090800.koxM6j6O-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604090800.koxM6j6O-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: sound/soc/sdca/sdca_interrupts.c:566 function parameter 'dev' not described in 'sdca_irq_cleanup'
>> Warning: sound/soc/sdca/sdca_interrupts.c:566 function parameter 'dev' not described in 'sdca_irq_cleanup'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
