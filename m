Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63ABB1FA4
	for <oe-kbuild-all@lists.linux.dev>; Tue,  5 Sep 2023 08:04:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693901095; x=1725437095;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Z4mumJJwy1Nqf1z4qjB04eG9VXsDiP5DaRguD14naeQ=;
  b=UQOJ0I5BsWhlkrPQBEyBpw3bWQ4ZJA4fZxDeu/57868o9F/XH0nEFBEt
   TFmK82B9gcBZqD3H766Lu+PZR+JSpybXDle5rbSc5j8AnkI4Tssbx+mn/
   eBiZFfyoD0adj0h0bP7Jm9o6gMDvYyNX3NPmg5WIqnSZBcd35qonWUwL6
   dMwrxbRwR+c1SuF0vFeI5hmTCSkCgI2yFq+egaDYpHAL0g2+PPgvpGSJ+
   Ig+3abY4tqEOLOFmPXoTq0fnio2N3TY8GfSbivz6+7RMadbcIh/6jXbfP
   isfePwT8UzFrdgOwAQKbK0MODWostRtChoNSJAMgTyuLo+MNd6PNlTkcW
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10823"; a="379455980"
X-IronPort-AV: E=Sophos;i="6.02,228,1688454000"; 
   d="scan'208";a="379455980"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Sep 2023 01:04:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10823"; a="864613175"
X-IronPort-AV: E=Sophos;i="6.02,228,1688454000"; 
   d="scan'208";a="864613175"
Received: from lkp-server02.sh.intel.com (HELO e0b2ea88afd5) ([10.239.97.151])
  by orsmga004.jf.intel.com with ESMTP; 05 Sep 2023 01:04:53 -0700
Received: from kbuild by e0b2ea88afd5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qdR3L-0001Pp-1l;
	Tue, 05 Sep 2023 08:04:51 +0000
Date: Tue, 5 Sep 2023 16:04:32 +0800
From: kernel test robot <lkp@intel.com>
To: Takashi Iwai <tiwai@suse.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH] ALSA: seq: Fix snd_seq_expand_var_event() call to
 user-space
Message-ID: <202309051537.s8UwEgnY-lkp@intel.com>
References: <20230905052631.18240-1-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230905052631.18240-1-tiwai@suse.de>

Hi Takashi,

kernel test robot noticed the following build warnings:

[auto build test WARNING on linus/master]
[also build test WARNING on v6.5 next-20230905]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Takashi-Iwai/ALSA-seq-Fix-snd_seq_expand_var_event-call-to-user-space/20230905-132920
base:   linus/master
patch link:    https://lore.kernel.org/r/20230905052631.18240-1-tiwai%40suse.de
patch subject: [PATCH] ALSA: seq: Fix snd_seq_expand_var_event() call to user-space
config: sparc64-defconfig (https://download.01.org/0day-ci/archive/20230905/202309051537.s8UwEgnY-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230905/202309051537.s8UwEgnY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309051537.s8UwEgnY-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from arch/sparc/include/asm/uaccess.h:8,
                    from include/linux/uaccess.h:11,
                    from include/linux/sched/task.h:11,
                    from include/linux/sched/signal.h:9,
                    from sound/core/seq/seq_memory.c:12:
   sound/core/seq/seq_memory.c: In function 'snd_seq_expand_var_event':
>> arch/sparc/include/asm/uaccess_64.h:243:20: warning: ignoring return value of '__clear_user' declared with attribute 'warn_unused_result' [-Wunused-result]
     243 | #define clear_user __clear_user
   sound/core/seq/seq_memory.c:194:25: note: in expansion of macro 'clear_user'
     194 |                         clear_user((__force void __user *)buf + len, newlen - len);
         |                         ^~~~~~~~~~


vim +243 arch/sparc/include/asm/uaccess_64.h

f5e706ad886b6a include/asm-sparc/uaccess_64.h Sam Ravnborg 2008-07-17  242  
f5e706ad886b6a include/asm-sparc/uaccess_64.h Sam Ravnborg 2008-07-17 @243  #define clear_user __clear_user
f5e706ad886b6a include/asm-sparc/uaccess_64.h Sam Ravnborg 2008-07-17  244  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
