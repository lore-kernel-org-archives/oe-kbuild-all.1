Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 429646FD0
	for <oe-kbuild-all@lists.linux.dev>; Thu,  6 Apr 2023 14:14:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680790497; x=1712326497;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=KNXFwfsNDeT4WqA11iXXgLWXJnFpxbYCsiWpVtQ/11s=;
  b=FU2ohntKtNDihxnIEqPp8n5UMIbG8ukEHyps+6v1vwe0HtYknZd+joSo
   EWYJZ8F+15NQkn2jNgKJeRbzTIph5iyoIIl4Zt0FaBdHCErihQh+D3TzO
   quOsr4Uy97XQy8xCP0Kz44pjxq/x8ZdS2A5Z6Jvy1nMowtMtNzK5qkSxK
   1Z4KgrQDFDHGZSkndaX/0MB10u0kRjJitGsxjookaaCrhT86NrUOdHx+Z
   Vj8fATyAfzIPn0WshWOef3Zbe59N8+7l4+shnARh6+OtZeAIqSGP1emFr
   ZapyZC95FaVuGHI1mmRhZKZxkyvY1y7hj5k2W0UJgU+RyRqP74rZFdrrW
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10672"; a="340232866"
X-IronPort-AV: E=Sophos;i="5.98,323,1673942400"; 
   d="scan'208";a="340232866"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Apr 2023 07:14:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10672"; a="1016893973"
X-IronPort-AV: E=Sophos;i="5.98,323,1673942400"; 
   d="scan'208";a="1016893973"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 06 Apr 2023 07:14:55 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pkQO6-000RQU-20;
	Thu, 06 Apr 2023 14:14:54 +0000
Date: Thu, 6 Apr 2023 22:14:38 +0800
From: kernel test robot <lkp@intel.com>
To: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>,
	alsa-devel@alsa-project.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH] docs: sound: kernel-api: writing-an-alsa-driver.rst:
 polishing
Message-ID: <202304062227.WvZq9Td4-lkp@intel.com>
References: <20230405201220.2197863-1-oswald.buddenhagen@gmx.de>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230405201220.2197863-1-oswald.buddenhagen@gmx.de>

Hi Oswald,

kernel test robot noticed the following build warnings:

[auto build test WARNING on tiwai-sound/for-next]
[also build test WARNING on next-20230406]
[cannot apply to tiwai-sound/for-linus linus/master v6.3-rc5]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Oswald-Buddenhagen/docs-sound-kernel-api-writing-an-alsa-driver-rst-polishing/20230406-042253
base:   https://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git for-next
patch link:    https://lore.kernel.org/r/20230405201220.2197863-1-oswald.buddenhagen%40gmx.de
patch subject: [PATCH] docs: sound: kernel-api: writing-an-alsa-driver.rst: polishing
reproduce:
        # https://github.com/intel-lab-lkp/linux/commit/7d621283190964e9edd72b8960fe9819339d62d8
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Oswald-Buddenhagen/docs-sound-kernel-api-writing-an-alsa-driver-rst-polishing/20230406-042253
        git checkout 7d621283190964e9edd72b8960fe9819339d62d8
        make menuconfig
        # enable CONFIG_COMPILE_TEST, CONFIG_WARN_MISSING_DOCUMENTS, CONFIG_WARN_ABI_ERRORS
        make htmldocs

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304062227.WvZq9Td4-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Documentation/sound/kernel-api/writing-an-alsa-driver.rst:3992: WARNING: Literal block expected; none found.
>> Documentation/sound/kernel-api/writing-an-alsa-driver.rst:4004: WARNING: Unexpected indentation.

vim +3992 Documentation/sound/kernel-api/writing-an-alsa-driver.rst

7ddedebb03b7ec Takashi Iwai       2016-09-29  3989  
7d621283190964 Oswald Buddenhagen 2023-04-05  3990     Suppose you have a file xyz.c. Add the following two lines::
7ddedebb03b7ec Takashi Iwai       2016-09-29  3991  
7ddedebb03b7ec Takashi Iwai       2016-09-29 @3992    snd-xyz-objs := xyz.o
7ddedebb03b7ec Takashi Iwai       2016-09-29  3993    obj-$(CONFIG_SND_XYZ) += snd-xyz.o
7ddedebb03b7ec Takashi Iwai       2016-09-29  3994  
7ddedebb03b7ec Takashi Iwai       2016-09-29  3995  2. Create the Kconfig entry
7ddedebb03b7ec Takashi Iwai       2016-09-29  3996  
7d621283190964 Oswald Buddenhagen 2023-04-05  3997     Add the new entry of Kconfig for your xyz driver::
7d621283190964 Oswald Buddenhagen 2023-04-05  3998  
7d621283190964 Oswald Buddenhagen 2023-04-05  3999    config SND_XYZ 
7d621283190964 Oswald Buddenhagen 2023-04-05  4000      tristate "Foobar XYZ"
7d621283190964 Oswald Buddenhagen 2023-04-05  4001      depends on SND
7d621283190964 Oswald Buddenhagen 2023-04-05  4002      select SND_PCM
7d621283190964 Oswald Buddenhagen 2023-04-05  4003      help
7d621283190964 Oswald Buddenhagen 2023-04-05 @4004        Say Y here to include support for Foobar XYZ soundcard.
7d621283190964 Oswald Buddenhagen 2023-04-05  4005        To compile this driver as a module, choose M here:
7d621283190964 Oswald Buddenhagen 2023-04-05  4006        the module will be called snd-xyz.
7d621283190964 Oswald Buddenhagen 2023-04-05  4007  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
