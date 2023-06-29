Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EF16FBF1
	for <oe-kbuild-all@lists.linux.dev>; Thu, 29 Jun 2023 22:26:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1688077564; x=1719613564;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=XDbEq6z0G5cJo1AA7vUnB0yASGsY1KqUcw6vztBNFik=;
  b=kQekDh3qKdz7S4ssav7kPXCWAlitGfzLsFCwda6lYgh3VewY6xlBbgwe
   oxU0wTGmy5WAgNW1hEkzRvhFimw3YsfGEwbqmXyIwJLbM1oTE20wUa1Kr
   I//GvTVOexFHwDKXMr6RLPH2z3cFw8MaPqZo4zwLWDlwzfaFA6lUxkPO8
   BxyA1rFXyueQx0eXHVXt7kxti2Yc5CkEb3dk1/ZhfungPwfdpjZChN1C9
   038culbDmRWI2r645zCJ1wjMnl9tQ9wWKzPAm0qkvAFI9VAPHYSt2H3v2
   mRuEC/nQjZdxt7jJlRNtjcfeXn8zDVvuSjm4zDA5oosi7zFMhrLjKJCKf
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10756"; a="364823855"
X-IronPort-AV: E=Sophos;i="6.01,169,1684825200"; 
   d="scan'208";a="364823855"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jun 2023 15:26:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10756"; a="711610838"
X-IronPort-AV: E=Sophos;i="6.01,169,1684825200"; 
   d="scan'208";a="711610838"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 29 Jun 2023 15:26:01 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qF05Q-000ESD-1I;
	Thu, 29 Jun 2023 22:26:00 +0000
Date: Fri, 30 Jun 2023 06:25:59 +0800
From: kernel test robot <lkp@intel.com>
To: Takashi Iwai <tiwai@suse.de>
Cc: oe-kbuild-all@lists.linux.dev, alsa-devel@alsa-project.org
Subject: [tiwai-sound:topic/midi20-gadget 56/56] f_midi2.c:undefined
 reference to `snd_ump_endpoint_new'
Message-ID: <202306300642.o48bLzoB-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git topic/midi20-gadget
head:   ed28b6939ebadd073e731ccf0f2c6ce4ab102ffd
commit: ed28b6939ebadd073e731ccf0f2c6ce4ab102ffd [56/56] usb: gadget: add support for USB MIDI 2.0 function driver (WIP)
config: x86_64-buildonly-randconfig-r001-20230629 (https://download.01.org/0day-ci/archive/20230630/202306300642.o48bLzoB-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230630/202306300642.o48bLzoB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306300642.o48bLzoB-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: drivers/usb/gadget/function/f_midi2.o: in function `f_midi2_create.constprop.0':
>> f_midi2.c:(.text+0x27f2): undefined reference to `snd_ump_endpoint_new'
>> ld: f_midi2.c:(.text+0x29a5): undefined reference to `snd_ump_block_new'
   ld: drivers/usb/gadget/function/f_midi2.o: in function `process_ump_transmit':
>> f_midi2.c:(.text+0x4a69): undefined reference to `snd_ump_transmit'
   ld: drivers/usb/gadget/function/f_midi2.o: in function `f_midi2_ep_out_complete':
>> f_midi2.c:(.text+0x5af1): undefined reference to `snd_ump_receive_ump_val'
>> ld: f_midi2.c:(.text+0x5bef): undefined reference to `snd_ump_receive'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
