Received: from mgamail.intel.com (unknown [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96F8D375
	for <oe-kbuild-all@lists.linux.dev>; Sun, 30 Jul 2023 03:32:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690687940; x=1722223940;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=j0F6LxRFCsBMALG0W+QZnOYyO0rI7Lyx6W+tTUqLeUc=;
  b=Tuk7tRcnzWDLOlI1jmxibVJkByTADKwIh2SWwJ6JQ0SwXdWv+bG7t64S
   Y1+O7jBuNO6jvjWTq1gawCniUChgLde5f6OzCwAyyagW792i+6ApNGhce
   J1gAQ9arqg2amktHkT2tEP2UlOV5k2QLUUc4/BnejuJ6/6VcZgCOOHVHk
   0hIxpfsIPDJtj8tBwvMOHEa+CPPF3Z3kYccHsztRAsQ7cfWmEpbZ2XPh1
   0f43cLIIJW+LbIO7NPnaDxTU0aXurDZZqjTHa/o2fAswq29xTzKNJgWWY
   xOpRu+E8TBQBPW2J6hd4BfETyX9YwwMq5hF/NGC/gJQXu8NIFYWEbRZ9p
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10786"; a="367691716"
X-IronPort-AV: E=Sophos;i="6.01,240,1684825200"; 
   d="scan'208";a="367691716"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jul 2023 20:32:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10786"; a="817907764"
X-IronPort-AV: E=Sophos;i="6.01,240,1684825200"; 
   d="scan'208";a="817907764"
Received: from lkp-server02.sh.intel.com (HELO 953e8cd98f7d) ([10.239.97.151])
  by FMSMGA003.fm.intel.com with ESMTP; 29 Jul 2023 20:32:18 -0700
Received: from kbuild by 953e8cd98f7d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qPxAH-0004Q7-36;
	Sun, 30 Jul 2023 03:32:17 +0000
Date: Sun, 30 Jul 2023 11:32:04 +0800
From: kernel test robot <lkp@intel.com>
To: Shengjiu Wang <shengjiu.wang@nxp.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH v2 4/7] media: v4l2: Add audio capture and output
 support
Message-ID: <202307301151.HTc9FizM-lkp@intel.com>
References: <1690265540-25999-5-git-send-email-shengjiu.wang@nxp.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1690265540-25999-5-git-send-email-shengjiu.wang@nxp.com>

Hi Shengjiu,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on broonie-sound/for-next]
[also build test WARNING on media-tree/master tiwai-sound/for-next tiwai-sound/for-linus linus/master v6.5-rc3 next-20230728]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Shengjiu-Wang/ASoC-fsl_asrc-define-functions-for-memory-to-memory-usage/20230725-144857
base:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next
patch link:    https://lore.kernel.org/r/1690265540-25999-5-git-send-email-shengjiu.wang%40nxp.com
patch subject: [RFC PATCH v2 4/7] media: v4l2: Add audio capture and output support
reproduce: (https://download.01.org/0day-ci/archive/20230730/202307301151.HTc9FizM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307301151.HTc9FizM-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Documentation/output/videodev2.h.rst:6: WARNING: undefined label: v4l2-buf-type-audio-capture (if the link has no caption the label must precede a section header)
>> Documentation/output/videodev2.h.rst:6: WARNING: undefined label: v4l2-buf-type-audio-output (if the link has no caption the label must precede a section header)

vim +6 Documentation/output/videodev2.h.rst

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
