Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA429368D6D
	for <oe-kbuild-all@lists.linux.dev>; Mon, 22 Jun 2026 09:04:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782119103; cv=none; b=HtwPK+NnBMjxo1SYhCCallOyykI0QbCBWXIOvHhEAtuFkCI+C1OGoxPvfpoWO6S9qPkQlC88Qvo4H3daFtwpUdDLYsXSZkjUgDn6lSEJiBicqa9MXGDN+QJByZF07K/e66KzM5s5G4bkASu+WBKFOaCQc/syYMzYEk8DGnBXQbk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782119103; c=relaxed/simple;
	bh=6kfvego95WLmZF8VVBsc+c9tY4bJDtUuhudZW89ZxF0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=fbkHuARG2BaT31j2cBnJdRWCnrYAHcdN99reeDCuNs669B2vXAOFOvOfNmyM/RJYOoWm0mBm1Ira87BEhYOmoKb8GROKqTlz/x0a/oxGHaUwuep7OywVcN51Ntc7di11lNXw1fvFrVv4l3ztVjBt9MzNsPD71Ee1LwMLHQcbZ4A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=R2441aCd; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="R2441aCd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782119095; x=1813655095;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=6kfvego95WLmZF8VVBsc+c9tY4bJDtUuhudZW89ZxF0=;
  b=R2441aCdVrtKBFy1an/o+SAS6HdqY/ccoF/i69nB21Z6P7O/kz7rTIYl
   vAZgs2bJ5tvHKmCVgOiZOm+CJUY2o0riu+FK7G678vbduAc3TyemjdUJ/
   QXRsb/aHBcLp+QLdf3ftprmtFCo8pRYbCHCz5tM51KGErIU4SzZNQTxfo
   fnN3d4v8hXB3LCHvxOeTTbNrIBWJIRY9t0OCMwT1SNi/GWZ+UdMAfFKXx
   RpVra1bgoQYGf51jq6coPle4DtW5B5BIQRhFN8VihFgZ5il+59bOAkB4o
   j+IPHOCx6WhEAgir5+SVjpqoVDIVQtfZinN0cYqLCdxd6kMHzMOUkUk3V
   g==;
X-CSE-ConnectionGUID: LPVynEjBQ3q+TwhpojG/MQ==
X-CSE-MsgGUID: 0Fajun5fRNGn5ChAPcEU9Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11824"; a="93438670"
X-IronPort-AV: E=Sophos;i="6.24,218,1774335600"; 
   d="scan'208";a="93438670"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jun 2026 02:04:54 -0700
X-CSE-ConnectionGUID: Ofibqf2ZQvO6uf4W3vYP/g==
X-CSE-MsgGUID: Dv+MthjnQea7QcOW6CxHKA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,218,1774335600"; 
   d="scan'208";a="251094641"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa004.fm.intel.com with ESMTP; 22 Jun 2026 02:04:51 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wbaZy-000000000rJ-3qWc;
	Mon, 22 Jun 2026 09:04:40 +0000
Date: Mon, 22 Jun 2026 17:04:16 +0800
From: kernel test robot <lkp@intel.com>
To: Jim Cromie <jim.cromie@gmail.com>,
 =?utf-8?Q?"=C5=81ukasz?= Bartosik" <ukaszb@chromium.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jimc:wk-merge 17/72] Warning: lib/dynamic_debug.c:668
 expecting prototype for param_set_dyndbg_classes(). Prototype was for
 param_set_dyndbg_module_classes() instead
Message-ID: <202606221621.Li7UNwks-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

tree:   https://github.com/jimc/linux.git wk-merge
head:   0868bbdcf86c3008826415c2c24eb4c254764023
commit: 57cbbbbefdcc4c03709c52a56a02722e7b6b1b15 [17/72] dyndbg: refactor param_set_dyndbg_classes and below
config: sh-allmodconfig (https://download.01.org/0day-ci/archive/20260622/202606221621.Li7UNwks-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260622/202606221621.Li7UNwks-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606221621.Li7UNwks-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: lib/dynamic_debug.c:668 expecting prototype for param_set_dyndbg_classes(). Prototype was for param_set_dyndbg_module_classes() instead

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
