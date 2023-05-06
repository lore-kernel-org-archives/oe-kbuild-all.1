Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1075E8465
	for <oe-kbuild-all@lists.linux.dev>; Sat,  6 May 2023 12:55:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683377718; x=1714913718;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=NQ6wCfyoHyDNspXQ5XCpgLu3HkADePGJt66eht8gTUY=;
  b=lmng2/0kmT5IYsJIywuXWe8gYErhtPRFC2qxEAeI0rjOprrQMxipLNBe
   OjETZP67GfehavGIter5K3bXyju8N0LtskbLmuRpVdizVZJUlYcqX5aXq
   3mJevzNqPjx83/SyStUy+O5xso3SnC9WDf45y8+IoVr8Q/AHz8jY36dTh
   TzS36Ulb77Z9N4BFj27yevoWokpX83j8jT+04F+86hwjnHJ1F5J/a0DBm
   nc9ub0/IethyV5niW15TtWyUKi2ADzSxfFc+jAO72GtlzaIEniaS1QePg
   62PyVXFz4/PgiKp9kbHqsLWZn1QWvYY7eBucbongVH4IuDHecSAdb6R0j
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10702"; a="352434739"
X-IronPort-AV: E=Sophos;i="5.99,255,1677571200"; 
   d="scan'208";a="352434739"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 May 2023 05:55:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10702"; a="692031101"
X-IronPort-AV: E=Sophos;i="5.99,255,1677571200"; 
   d="scan'208";a="692031101"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 06 May 2023 05:55:16 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pvHRT-0000JF-1H;
	Sat, 06 May 2023 12:55:15 +0000
Date: Sat, 6 May 2023 20:54:21 +0800
From: kernel test robot <lkp@intel.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-media@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: [sailus-media-tree:metadata 10/11] htmldocs:
 Documentation/output/videodev2.h.rst:6: WARNING: undefined label:
 v4l2-fmt-flag-meta-line-based (if the link has no caption the label must
 precede a section header)
Message-ID: <202305062027.tzv2gT5B-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://linuxtv.org/sailus/media_tree.git metadata
head:   edce6cf3cf2b2adb0c7717bb918cd84c5f2b4810
commit: 26aac41bc63221fb4bc8cca72ae53da3a3d443e1 [10/11] media: v4l: Support line-based metadata capture
reproduce:
        git remote add sailus-media-tree git://linuxtv.org/sailus/media_tree.git
        git fetch --no-tags sailus-media-tree metadata
        git checkout 26aac41bc63221fb4bc8cca72ae53da3a3d443e1
        make menuconfig
        # enable CONFIG_COMPILE_TEST, CONFIG_WARN_MISSING_DOCUMENTS, CONFIG_WARN_ABI_ERRORS
        make htmldocs

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202305062027.tzv2gT5B-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Documentation/output/videodev2.h.rst:6: WARNING: undefined label: v4l2-fmt-flag-meta-line-based (if the link has no caption the label must precede a section header)

vim +6 Documentation/output/videodev2.h.rst

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
