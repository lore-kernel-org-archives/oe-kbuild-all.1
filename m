Received: from mgamail.intel.com (unknown [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 676AE1C29
	for <oe-kbuild-all@lists.linux.dev>; Sun, 30 Jul 2023 11:01:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690714908; x=1722250908;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=wiso5oU3Kpypc9NJKoMcvrn2onnjR3SCO1jZiPFr3ww=;
  b=l0w2ZDLK03vSC/seUExilIOog6yEFt5oAok/IaCf5IiwmbOeOMS8nfk9
   IljzVbCelNmoZXVJw/R6XS9HS3+8v6I6sDfKr/vTCyCPFuEY+V8fNba+s
   ZooXpHraSXvUU7Br6tloe1o+Wf3rSwY5aLfa+7NSnWhiVKcz36R9akTso
   Jr6sl98oFK6HcO8k+ftErHG6fKUEH3NBtKDLY6o1fNdwVO2hv9i+JCMF7
   GRlw9a6KMtwqhwn7DEUaU25aSEObNw1U2BqBS063p17XMx/T0YKTP6xAm
   eAiZA1P0gjxNNM7jTLh4ogu9g0eZi0La1wNM6GGOB1ttnBkUAUKSdCUhF
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10786"; a="348439592"
X-IronPort-AV: E=Sophos;i="6.01,242,1684825200"; 
   d="scan'208";a="348439592"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jul 2023 04:01:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10786"; a="841865085"
X-IronPort-AV: E=Sophos;i="6.01,242,1684825200"; 
   d="scan'208";a="841865085"
Received: from lkp-server02.sh.intel.com (HELO 953e8cd98f7d) ([10.239.97.151])
  by fmsmga002.fm.intel.com with ESMTP; 30 Jul 2023 04:01:45 -0700
Received: from kbuild by 953e8cd98f7d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qQ4BE-0004YZ-2V;
	Sun, 30 Jul 2023 11:01:44 +0000
Date: Sun, 30 Jul 2023 19:00:56 +0800
From: kernel test robot <lkp@intel.com>
To: Jani Nikula <jani.nikula@intel.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Luca Coelho <luciano.coelho@intel.com>, linux-doc@vger.kernel.org
Subject: [linux-next:master 379/5284] htmldocs:
 Documentation/gpu/rfc/i915_scheduler.rst:138: WARNING: Unknown directive
 type "c:namespace-push".
Message-ID: <202307301850.i9xFNWT6-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Jani,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   d7b3af5a77e8d8da28f435f313e069aea5bcf172
commit: f6757dfcfde722fdeaee371b66f63d7eb61dd7e4 [379/5284] drm/doc: fix duplicate declaration warning
reproduce: (https://download.01.org/0day-ci/archive/20230730/202307301850.i9xFNWT6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307301850.i9xFNWT6-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Documentation/gpu/rfc/i915_scheduler.rst:138: WARNING: Unknown directive type "c:namespace-push".
>> Documentation/gpu/rfc/i915_scheduler.rst:143: WARNING: Unknown directive type "c:namespace-pop".

vim +138 Documentation/gpu/rfc/i915_scheduler.rst

   137	
 > 138	.. c:namespace-push:: rfc
   139	
   140	.. kernel-doc:: include/uapi/drm/i915_drm.h
   141	        :functions: i915_context_engines_parallel_submit
   142	
 > 143	.. c:namespace-pop::
   144	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
