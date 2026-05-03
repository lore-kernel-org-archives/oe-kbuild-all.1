Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25ABE14AD20
	for <oe-kbuild-all@lists.linux.dev>; Sun,  3 May 2026 00:08:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777766935; cv=none; b=Z/c3sZe0d9eW7INpR61ch7ahTrmJN7nfDjDxbVDvyJSjF1nKf8g3M8BnWNKon6Rq13J+fhVkU88J8xMRCHgjrrwmZoIfa8/MkCLJJOrusiB2aM20qdbSj3Za8PpbkqVE3Xims7Ur4lzFfYxk+sJ5xE19TkMPPvOalNgm9WKebDU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777766935; c=relaxed/simple;
	bh=IjDrJBgIvtgpDKQWsJc3zLIPS1UJqwhJeMrBGW5lkfs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ROqeEjL5FPm7i57VlGlewbES5CtfqFyyKDXToKLmFEUIJ9VBYQbJVQcHoAYf8Pp8nHzbDZ1PFoclM3eNvhW0FjQPWc9w8KEwkm21QrmEf5dDtMpHiiNLZI+GeLHBP4P3bE0H0wktm3UEtvIAwoOFALI47Nqa+25M8ZGy9EcoLrc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cX3U6G+1; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cX3U6G+1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777766934; x=1809302934;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=IjDrJBgIvtgpDKQWsJc3zLIPS1UJqwhJeMrBGW5lkfs=;
  b=cX3U6G+1e7utAgodUKIPYJiCpAhrrAmHaFYTKNGT4PA52G2LmzCyUZlY
   riToMho3XhIQHQQucYXBmTYBmrBB44UEwhdcGIYUIah5akOvGg17TNo8+
   P4Pgx+RMzFMvMeHYfHWL4er/luha8Ln24HH4ddcowBiYr9jA6ImRTJmFV
   6+BXlzQ30Kgd9xUySSofnhSt8/qvHLFmQKdvl0B/aGLiq4Kz5DEtFW8T6
   THlWRTgzheD15HXh5uNeEgOalp4GCkZ8MaaTjFGVe0V/7kqi4tw/dh8JU
   TwU4HckDDS+6z2MuZLqXuVcnEgoDeFd+wdy/NArMMQngyn91uRRs+vLNx
   g==;
X-CSE-ConnectionGUID: BWYBXLgpSlu+R4xrbgfMiQ==
X-CSE-MsgGUID: lUI6Rh83SraoAmgdUKhEqA==
X-IronPort-AV: E=McAfee;i="6800,10657,11774"; a="77842294"
X-IronPort-AV: E=Sophos;i="6.23,212,1770624000"; 
   d="scan'208";a="77842294"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 May 2026 17:08:49 -0700
X-CSE-ConnectionGUID: 1Y/MXHnnSO+9VTsFIAbk3g==
X-CSE-MsgGUID: rBQDWArdTvm0K5YBluUQsg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,212,1770624000"; 
   d="scan'208";a="273281121"
Received: from lkp-server01.sh.intel.com (HELO 781826d00641) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 02 May 2026 17:08:47 -0700
Received: from kbuild by 781826d00641 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wJKO4-000000001vb-1Pxw;
	Sun, 03 May 2026 00:08:44 +0000
Date: Sun, 3 May 2026 08:08:11 +0800
From: kernel test robot <lkp@intel.com>
To: Maxwell Doose <m32285159@gmail.com>, songqiang1304521@gmail.com,
	jic23@kernel.org
Cc: oe-kbuild-all@lists.linux.dev, David Lechner <dlechner@baylibre.com>,
	Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>, linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4] iio: magnetometer: rm3100: Modernize locking and
 refactor control flow
Message-ID: <202605030817.kUz9B6MC-lkp@intel.com>
References: <20260430021439.67591-1-m32285159@gmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260430021439.67591-1-m32285159@gmail.com>

Hi Maxwell,

kernel test robot noticed the following build warnings:

[auto build test WARNING on jic23-iio/togreg]
[also build test WARNING on linus/master v7.1-rc1 next-20260430]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Maxwell-Doose/iio-magnetometer-rm3100-Modernize-locking-and-refactor-control-flow/20260502-014808
base:   https://git.kernel.org/pub/scm/linux/kernel/git/jic23/iio.git togreg
patch link:    https://lore.kernel.org/r/20260430021439.67591-1-m32285159%40gmail.com
patch subject: [PATCH v4] iio: magnetometer: rm3100: Modernize locking and refactor control flow
config: s390-randconfig-r071-20260503 (https://download.01.org/0day-ci/archive/20260503/202605030817.kUz9B6MC-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 15.2.0
smatch: v0.5.0-9065-ge9cc34fd
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260503/202605030817.kUz9B6MC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605030817.kUz9B6MC-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: drivers/iio/magnetometer/rm3100-core.c:467 expecting prototype for rm3100_guarded_regmap_bulk_read(). Prototype was for rm3100_regmap_bulk_read_locked() instead

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
