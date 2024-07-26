Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA19A6AAD
	for <oe-kbuild-all@lists.linux.dev>; Fri, 26 Jul 2024 00:38:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721954313; cv=none; b=b2HmuGpCwDO5OKqPI2yeT4W7L85j6DxOaDzF+9ZTzGR2bHkUv+WvJ6YAzK3jD8ljNWk3PhsHD/4a9KaBr1iO5rZeY8GuMY9DlH+kOYoMO9tGYlGLm7W4M3f5frtO2HdcHk65FcKEbJnbeBn5tolU79Ypjq4r/gUN/dk9qewYooM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721954313; c=relaxed/simple;
	bh=13fVH2RsERPqjmIpy1ZU+vBArgrtv42VMumf4nLIMig=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=BLUpYkUVnC06dzua7n97G/q57T5bS5Vh9PdlIb3+8tm0mJDKegjTLh2iTeuQ57kXiCQKXY+71wo5lKf5lPyTC9N9Xp4XLOzTVRpNQeaLne+aFzKXKiOLZBDzU99gsjXGL3WvnzFBTCQFEiueGcTKuXhN+Hf3N8HssDlRuN/qQLs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kuGGccCZ; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kuGGccCZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1721954311; x=1753490311;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=13fVH2RsERPqjmIpy1ZU+vBArgrtv42VMumf4nLIMig=;
  b=kuGGccCZHpPtiyVVkTbsXY8n/IzsPcMUoRXB/HPzpDhAIobLQoFNRQLF
   CqTvpommL6n23wj/imAL9t2i6XgzF5SnSu41GAo8fRlPxpBMZI1EmVQTR
   Qdwq0feQEnDVx03DPSluAZcev9p7yNe0bHh9iKp64tray+guxMRNgngrk
   RsPXMe46HiYX7jkCW/pzPa6CBcbvbe7xT+RcOgClG+soikwIuqDD8UVki
   92tRZWauBo7M/FOjUY6SsXxw2tpTdksFOluygnpUpGN3pcyHeGFvuPF/q
   Dw/jCQdW0VO69ychOEabTwdHt0wkiICC2i9SquCroN2vN62s6hIb/DseE
   A==;
X-CSE-ConnectionGUID: B1YsYiMzTUeUxNyS1Gg19w==
X-CSE-MsgGUID: GL2PblGVQLW0iDToOpJsOQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11144"; a="22645545"
X-IronPort-AV: E=Sophos;i="6.09,237,1716274800"; 
   d="scan'208";a="22645545"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jul 2024 17:38:30 -0700
X-CSE-ConnectionGUID: TvxuR1WQQ7WsT8UFm0ivsQ==
X-CSE-MsgGUID: CT3uebsGQP+WfIWgfjCYPg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,237,1716274800"; 
   d="scan'208";a="52774161"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 25 Jul 2024 17:38:29 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sX8yZ-000odI-06;
	Fri, 26 Jul 2024 00:38:27 +0000
Date: Fri, 26 Jul 2024 08:38:21 +0800
From: kernel test robot <lkp@intel.com>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Nicolas Schier <nicolas@fjasle.eu>
Subject: ERROR: modpost: "__delay" [drivers/net/mdio/mdio-cavium.ko]
 undefined!
Message-ID: <202407260828.NQM5BhqE-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Masahiro,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   1722389b0d863056d78287a120a1d6cadb8d4f7b
commit: f73edc8951b2de515b5ecc8a357ccd47dd41077e kbuild: unify two modpost invocations
date:   1 year, 10 months ago
config: sh-allmodconfig (https://download.01.org/0day-ci/archive/20240726/202407260828.NQM5BhqE-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240726/202407260828.NQM5BhqE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407260828.NQM5BhqE-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "__delay" [drivers/net/mdio/mdio-cavium.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
