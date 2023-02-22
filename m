Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35268A20
	for <oe-kbuild-all@lists.linux.dev>; Wed, 22 Feb 2023 00:03:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677024190; x=1708560190;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=epyd3QksYFiJJ74Tc2rcXaGFKrh/A+RaElz44nVqtEU=;
  b=POIh6mz1JuV2JoF9HDUXrK4+NnRcGZQ9mn4aIXMggWVVULd7q/3cr72x
   2YhtorsvK+fYsiWmhq5yeJ5hHoHRJ7cidTBTV1EGcCf05Hl7wDG6/bb+U
   MFtSS3O6hIp/uHs0xb51y3egHw2e3lb1pGRNLyUJBXqlQJltzckJ8QP0P
   Qzu85ZL/ZhpZDMVW6FobpLZ9QZIfNRQLbjlANyVpbIRvWknZo6w9R96xr
   R7bFTRh1XNIVGeLfaCKMFCD0+kPFyNCP5erhT9F4EDuFRA2U3kstpnE96
   4mzXJLBEw+z+QzFO996J8Z0dMmyZUIzKbv5Grz9TE+7Spzb0akwR4SQ4d
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10628"; a="334150617"
X-IronPort-AV: E=Sophos;i="5.97,317,1669104000"; 
   d="scan'208";a="334150617"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Feb 2023 16:02:55 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10628"; a="704251646"
X-IronPort-AV: E=Sophos;i="5.97,317,1669104000"; 
   d="scan'208";a="704251646"
Received: from lkp-server01.sh.intel.com (HELO eac18b5d7d93) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 21 Feb 2023 16:02:51 -0800
Received: from kbuild by eac18b5d7d93 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pUcaw-0000OH-03;
	Wed, 22 Feb 2023 00:02:50 +0000
Date: Wed, 22 Feb 2023 08:02:15 +0800
From: kernel test robot <lkp@intel.com>
To: Florian Eckert <fe@dev.tdt.de>, u.kleine-koenig@pengutronix.de,
	gregkh@linuxfoundation.org, jirislaby@kernel.org, pavel@ucw.cz,
	lee@kernel.org
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-leds@vger.kernel.org, Eckert.Florian@googlemail.com
Subject: Re: [PATCH v5 2/2] trigger: ledtrig-tty: add additional modes
Message-ID: <202302220740.2RKDHnof-lkp@intel.com>
References: <20230221081901.15557-3-fe@dev.tdt.de>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230221081901.15557-3-fe@dev.tdt.de>

Hi Florian,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on tty/tty-testing]
[also build test WARNING on tty/tty-next tty/tty-linus staging/staging-testing staging/staging-next staging/staging-linus pavel-leds/for-next linus/master v6.2 next-20230221]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Florian-Eckert/tty-new-helper-function-tty_get_mget/20230221-162126
base:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/tty.git tty-testing
patch link:    https://lore.kernel.org/r/20230221081901.15557-3-fe%40dev.tdt.de
patch subject: [PATCH v5 2/2] trigger: ledtrig-tty: add additional modes
reproduce:
        # https://github.com/intel-lab-lkp/linux/commit/445b7555bccd279bf106995ee42f5dbef2e97c8b
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Florian-Eckert/tty-new-helper-function-tty_get_mget/20230221-162126
        git checkout 445b7555bccd279bf106995ee42f5dbef2e97c8b
        make menuconfig
        # enable CONFIG_COMPILE_TEST, CONFIG_WARN_MISSING_DOCUMENTS, CONFIG_WARN_ABI_ERRORS
        make htmldocs

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302220740.2RKDHnof-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Documentation/ABI/testing/sysfs-class-led-trigger-tty:9: WARNING: Unexpected indentation.
>> Documentation/ABI/testing/sysfs-class-led-trigger-tty:9: WARNING: Block quote ends without a blank line; unexpected unindent.

vim +9 Documentation/ABI/testing/sysfs-class-led-trigger-tty

   > 9	Date:		January 2023

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
