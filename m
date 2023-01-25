Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCE871842
	for <oe-kbuild-all@lists.linux.dev>; Wed, 25 Jan 2023 09:29:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674638994; x=1706174994;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Iib1gOh8mT+FDy8DZl6H+FgLTsEkN7huold2ibuCi1o=;
  b=KJELZHHjpfiPlmCXWwpj2ki8P0NDgcoiINnCAUCHccjIHP5oGSadgfQ1
   3xoiOqrJ1ECm1r2dmweTRPJMDKhs+m3sZ9QKyjgcEXE5SQ1uTiNU5TX4z
   P/lauKs85pu5CdWxmS3URMeo9YcR7ZIDPB1Q+6DN1NuXP13ORo1eZcKl7
   cc63PeQGdj50tSZriSePDClxW2McFiSTMkYPaLsliocarMNxVvgB5tm4J
   bFJTZF/ncSn7uKnZeURlKVqcG6WAo9nGkpM+BzwMrJr0ApDz+f2JgQyqA
   cMFD9xT7gyajakDIwbGL9YkuyDJpC5suU9vVNBa7s+cmMCqy7C/6lug8L
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10600"; a="310092167"
X-IronPort-AV: E=Sophos;i="5.97,244,1669104000"; 
   d="scan'208";a="310092167"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jan 2023 01:29:54 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10600"; a="804938298"
X-IronPort-AV: E=Sophos;i="5.97,244,1669104000"; 
   d="scan'208";a="804938298"
Received: from lkp-server01.sh.intel.com (HELO 5646d64e7320) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 25 Jan 2023 01:29:52 -0800
Received: from kbuild by 5646d64e7320 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pKc6J-0007CY-26;
	Wed, 25 Jan 2023 09:29:51 +0000
Date: Wed, 25 Jan 2023 17:29:02 +0800
From: kernel test robot <lkp@intel.com>
To: Mario Kicherer <dev@kicherer.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-hwmon@vger.kernel.org,
	Guenter Roeck <linux@roeck-us.net>, linux-doc@vger.kernel.org
Subject: [groeck-staging:hwmon-next 40/41] htmldocs:
 Documentation/hwmon/mc34vr500.rst: WARNING: document isn't included in any
 toctree
Message-ID: <202301251734.bFyrYeeG-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-next
head:   ecabca1a36d59ec32fa315f3dc2e81784670b25b
commit: be5d5218ef86618ad7b0cd7abf34550e048944a8 [40/41] docs: hwmon: add docs for the NXP MC34VR500 PMIC
reproduce:
        # https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git/commit/?id=be5d5218ef86618ad7b0cd7abf34550e048944a8
        git remote add groeck-staging https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git
        git fetch --no-tags groeck-staging hwmon-next
        git checkout be5d5218ef86618ad7b0cd7abf34550e048944a8
        make menuconfig
        # enable CONFIG_COMPILE_TEST, CONFIG_WARN_MISSING_DOCUMENTS, CONFIG_WARN_ABI_ERRORS
        make htmldocs

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> Documentation/hwmon/mc34vr500.rst: WARNING: document isn't included in any toctree

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
