Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5E4A6ABF
	for <oe-kbuild-all@lists.linux.dev>; Fri, 19 May 2023 11:45:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1684496709; x=1716032709;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=a7TYpBtocP6czdTNodjCsvGjcdu44a0JSAqMMfi1Xys=;
  b=D4iPNNN/1GwhVxgfmvMFQUVH6LU3ZJA91NYrXiC702oYt0CE9vDpTv4q
   pqTTTAN7TYBj3I/TJLpdA6cArV0/RFky9rhKkYUVeXmZ+I7UmmKzWcK9H
   F5CvFNUXNU46HKuva0kAlKPVSzV57gfqOSFXs+soUdvIjo2z9XmkTPt/y
   2ORHfZ36faXXJPQLCBjWHgcxQ0BkaNehBzA9sdGW5alJJlJ0qur1VjWNV
   P5PAuqo9GgkDrhxX8NOWZMhbyCU2V4E9umWdcAON0A38hMDzE1SoLNpMC
   SJzWBMuWJy64MiU9G9jgShsa1SH9WjTYXLnFK0RqyoEkIUBEvmkf4M5PN
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10714"; a="418044634"
X-IronPort-AV: E=Sophos;i="6.00,176,1681196400"; 
   d="scan'208";a="418044634"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 May 2023 04:45:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10714"; a="680028941"
X-IronPort-AV: E=Sophos;i="6.00,176,1681196400"; 
   d="scan'208";a="680028941"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 19 May 2023 04:45:08 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pzyXj-000AoA-2D;
	Fri, 19 May 2023 11:45:07 +0000
Date: Fri, 19 May 2023 19:44:20 +0800
From: kernel test robot <lkp@intel.com>
To: Takashi Iwai <tiwai@suse.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH 34/36] ALSA: seq: Print UMP Endpoint and Block
 information in proc outputs
Message-ID: <202305191902.DcxcK7QD-lkp@intel.com>
References: <20230519093114.28813-35-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230519093114.28813-35-tiwai@suse.de>

Hi Takashi,

kernel test robot noticed the following build warnings:

[auto build test WARNING on tiwai-sound/for-next]
[also build test WARNING on tiwai-sound/for-linus linus/master v6.4-rc2 next-20230519]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Takashi-Iwai/ALSA-rawmidi-Pass-rawmidi-directly-to-snd_rawmidi_kernel_open/20230519-173634
base:   https://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git for-next
patch link:    https://lore.kernel.org/r/20230519093114.28813-35-tiwai%40suse.de
patch subject: [PATCH 34/36] ALSA: seq: Print UMP Endpoint and Block information in proc outputs
config: m68k-allyesconfig (https://download.01.org/0day-ci/archive/20230519/202305191902.DcxcK7QD-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/9535297f3611942da6cc4a069bf0604ee42c5a4e
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Takashi-Iwai/ALSA-rawmidi-Pass-rawmidi-directly-to-snd_rawmidi_kernel_open/20230519-173634
        git checkout 9535297f3611942da6cc4a069bf0604ee42c5a4e
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=m68k olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=m68k SHELL=/bin/bash sound/core/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202305191902.DcxcK7QD-lkp@intel.com/

All warnings (new ones prefixed by >>):

   sound/core/seq/seq_clientmgr.c: In function 'dump_ump_info':
>> sound/core/seq/seq_clientmgr.c:2134:16: warning: the comparison will always evaluate as 'true' for the address of 'name' will never be NULL [-Waddress]
    2134 |         if (ep && ep->name)
         |                ^~
   In file included from include/sound/asound.h:24,
                    from include/sound/asequencer.h:11,
                    from include/sound/seq_kernel.h:10,
                    from sound/core/seq/seq_clientmgr.c:16:
   include/uapi/sound/asound.h:805:23: note: 'name' declared here
     805 |         unsigned char name[128];        /* endpoint name string */
         |                       ^~~~
   sound/core/seq/seq_clientmgr.c:2138:24: warning: the comparison will always evaluate as 'true' for the address of 'name' will never be NULL [-Waddress]
    2138 |                 if (bp && bp->name) {
         |                        ^~
   include/uapi/sound/asound.h:834:23: note: 'name' declared here
     834 |         unsigned char name[128];        /* block name string */
         |                       ^~~~


vim +2134 sound/core/seq/seq_clientmgr.c

  2122	
  2123	#ifdef CONFIG_SND_PROC_FS
  2124	static void dump_ump_info(struct snd_info_buffer *buffer,
  2125				  struct snd_seq_client *client)
  2126	{
  2127		struct snd_ump_endpoint_info *ep;
  2128		struct snd_ump_block_info *bp;
  2129		int i;
  2130	
  2131		if (!client->ump_info)
  2132			return;
  2133		ep = client->ump_info[SNDRV_SEQ_CLIENT_UMP_INFO_ENDPOINT];
> 2134		if (ep && ep->name)
  2135			snd_iprintf(buffer, "  UMP Endpoint: \"%s\"\n", ep->name);
  2136		for (i = 0; i < SNDRV_UMP_MAX_BLOCKS; i++) {
  2137			bp = client->ump_info[i + 1];
  2138			if (bp && bp->name) {
  2139				snd_iprintf(buffer, "  UMP Block %d: \"%s\" [%s]\n",
  2140					    i, bp->name,
  2141					    bp->active ? "Active" : "Inactive");
  2142				snd_iprintf(buffer, "    Groups: %d-%d\n",
  2143					    bp->first_group + 1,
  2144					    bp->first_group + bp->num_groups);
  2145			}
  2146		}
  2147	}
  2148	#endif
  2149	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
