Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.10
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793238819;
	b=0/QI5KzAzzhquhrdK/gpXowALanOvxT40xD/ChNS8LI54s4aXqOybxJYq8oD7reRT/Xu
	 3l23Lv8ESha4TknymZAEEEYnMjSvbay0351MqQZ5PQoUFAF4NKeadlAvJjHEHb+RpcYEb
	 K5TEWs5D36F4Mhq1SF7bhy7tW0W8/Da9GMpndtsPQj5IkRitGXcdz/rVTG8gZisIrNQa2
	 Jwc//hcGygaTQWHpHC9rDg8api/34/Ot618xO31hWFfc85ccCoWt2Q/EH6EB32clVJFis
	 lKo2wEC3J4XJcwzSBzAgcL1ZgeXA/FlbojdmH0PDovosZd94FVM3S9U4k92sFboxu9w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793238819;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent:MIME-Version:Content-Type;
	bh=hsXWYWgMuwwLKps/wubLVvfQmkiKjZ8HX4vdHY3Yhiw=;
	b=oYlM/OeC9xgv2rvi0RWp0/wWi/AGTDJzSFLmIPHAF0y9aSjf+VuQe7jNG6EimqJJMiox
	 xwrecHlot7nlwQCcKIqyH6ctsty7DNBtICdoBysyw5T1VAqmKcFzLX5ru74QfePKRURPz
	 Ju6dNAQTEczYWZu1Iw9CiXfU/VICu7TVx5/7cK6buosMU+EQnontE5UaozZ5qcq1g9lOI
	 DsQnCYNyV74rUkA0TVisnpxhNgahyA3FLFLKtajo9RC/sKMwHZPxiSYcv2VUhf2ZgUQ+G
	 5DEw6GjGoTwOCy/VR8ccPceOu9BrpNdlKJ75+yx1LTp67FHUyFFhSA6CG9QKsavny9Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=biOzgisO;
	arc=none smtp.remote-ip=192.198.163.10
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D633606A31C
	for <oe-kbuild-all@lists.linux.dev>; Thu, 29 Oct 2026 01:53:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7D633606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=biOzgisO
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793238818; x=1824774818;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=OJ5E3OIq/gjO6irdH0wT/tyBrXlysIvBXAfHmzzwqeE=;
  b=biOzgisOvKj6f+X7pWguFppGiVAK47gF6SQ8wEW5WgikzMleBOCLZbH8
   aJnvQIW5Bsap0VwJq0PlBWslwBL0uy2I7+cilIyECoOjZEU+TdM3bjOyQ
   N2r6O6FBMsLaqX3LgPP2oyOZ7EykkmR/3HxbtXxfQe2tmlJdK7I/5lF6Z
   aDYj1qYTdz7BAJ9UU4BqosIcjyq/rJiPrXjKBrev/aCXIVBlaHRuetR+v
   De8CQrgCv8LzVOj7tXx2GwzAwxiVErDuvF4dl8wAA77L9QhC1TqQHAFc1
   AMwvCMhUlAYkdeyPzyJN3Y9YWBnVS/UgkFY//cjJ9tdDDJdMIUQPB9TCH
   Q==;
X-CSE-ConnectionGUID: fn+EsKxeSfCP+Y47vBnULw==
X-CSE-MsgGUID: rS3x21T+Qp2NZnU6/kTh4A==
X-IronPort-AV: E=McAfee;i="6800,10657,11949"; a="1876701"
X-IronPort-AV: E=Sophos;i="6.27,183,1787036400"; 
   d="scan'208";a="1876701"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Oct 2026 18:53:37 -0700
X-CSE-ConnectionGUID: HMzjkn2US5OFj9HsGz1tdQ==
X-CSE-MsgGUID: ywVXSH7jSqaMkOrpVFoR8g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,183,1787036400"; 
   d="scan'208";a="5089502"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 28 Oct 2026 18:53:35 -0700
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xMFKe-00000000ZSy-3ktI;
	Thu, 29 Oct 2026 01:53:32 +0000
Date: Thu, 29 Oct 2026 09:52:38 +0800
From: kernel test robot <lkp@intel.com>
To: Jim Cromie <jim.cromie@gmail.com>,
 =?utf-8?Q?"=C5=81ukasz?= Bartosik" <ukaszb@chromium.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jimc:dd-classmaps-v13-akpm 28/40] Warning:
 lib/dynamic_debug.c:740 expecting prototype for param_set_dyndbg_classes().
 Prototype was for param_set_dyndbg_module_classes() instead
Message-ID: <202610290927.uujcAeA3-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

tree:   https://github.com/jimc/linux.git dd-classmaps-v13-akpm
head:   a61a00820061f0c17a4416b3bf47eeb3f98c238d
commit: 6ee79369c7f2a0d78a4087eb30f12b2bae53f162 [28/40] dyndbg-API: promote DYNAMIC_DEBUG_CLASSMAP_PARAM to API
config: xtensa-randconfig-1001-20261029 (https://download.01.org/0day-ci/archive/20261029/202610290927.uujcAeA3-lkp@intel.com/config)
compiler: xtensa-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261029/202610290927.uujcAeA3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610290927.uujcAeA3-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: lib/dynamic_debug.c:740 expecting prototype for param_set_dyndbg_classes(). Prototype was for param_set_dyndbg_module_classes() instead

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
