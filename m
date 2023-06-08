Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F14FA42
	for <oe-kbuild-all@lists.linux.dev>; Thu,  8 Jun 2023 01:23:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686187391; x=1717723391;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=e3DYXlKKS49Z8nebd52oAVu8uIIvzFgKmsYg9SjRVRk=;
  b=Yy8gvzMOqpoYRbU/KM9flbDWdD5A1N9AJYNHphuAPxrbMtTsWMafAq4N
   CcjM28a0cXXFiDQJ2LtUBLXrIaOVQ6X1AMxhEWGII2sXMN9Mp0yg1f+PM
   mnpek180Di2GcLfBU6KYXtsit1mr+ctkZYog6pzvEC5A9oqHuD/emP97I
   Ek2SIg0rZnx+a4uLA+VzMSXCOePvDwbLzv5gYmnoveoBZNUHxXnUaUG9R
   hDAuBnkdFJeaZ1XHWQUzihtHofD8F1Ht2+VyMggRSB0ZZcDYhKd+Wewka
   U/DF6XJ240KOSiVXDj14qyuqo9D9Hdf2VnG78IX/muSl12RaxH8icwwr8
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10734"; a="356020228"
X-IronPort-AV: E=Sophos;i="6.00,225,1681196400"; 
   d="scan'208";a="356020228"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jun 2023 18:23:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10734"; a="712905842"
X-IronPort-AV: E=Sophos;i="6.00,225,1681196400"; 
   d="scan'208";a="712905842"
Received: from lkp-server01.sh.intel.com (HELO 15ab08e44a81) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 07 Jun 2023 18:23:09 -0700
Received: from kbuild by 15ab08e44a81 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q74Mm-00075n-2N;
	Thu, 08 Jun 2023 01:23:08 +0000
Date: Thu, 8 Jun 2023 09:22:40 +0800
From: kernel test robot <lkp@intel.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH 1/4] ASoC: add new trigger ordering method
Message-ID: <202306080941.tsvlNi92-lkp@intel.com>
References: <873532hm8a.wl-kuninori.morimoto.gx@renesas.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <873532hm8a.wl-kuninori.morimoto.gx@renesas.com>

Hi Kuninori,

kernel test robot noticed the following build warnings:

[auto build test WARNING on broonie-sound/for-next]
[also build test WARNING on linus/master v6.4-rc5 next-20230607]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Kuninori-Morimoto/ASoC-add-new-trigger-ordering-method/20230608-074707
base:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next
patch link:    https://lore.kernel.org/r/873532hm8a.wl-kuninori.morimoto.gx%40renesas.com
patch subject: [PATCH 1/4] ASoC: add new trigger ordering method
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20230608/202306080941.tsvlNi92-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 12.3.0
reproduce (this is a W=1 build):
        mkdir -p ~/bin
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        git remote add broonie-sound https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git
        git fetch broonie-sound for-next
        git checkout broonie-sound/for-next
        b4 shazam https://lore.kernel.org/r/873532hm8a.wl-kuninori.morimoto.gx@renesas.com
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.3.0 ~/bin/make.cross W=1 O=build_dir ARCH=alpha olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.3.0 ~/bin/make.cross W=1 O=build_dir ARCH=alpha SHELL=/bin/bash sound/soc/

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306080941.tsvlNi92-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> sound/soc/soc-pcm.c:1075:1: warning: 'static' is not at beginning of declaration [-Wold-style-declaration]
    1075 | const static
         | ^~~~~
>> sound/soc/soc-pcm.c:1075:1: warning: type qualifiers ignored on function return type [-Wignored-qualifiers]


vim +/static +1075 sound/soc/soc-pcm.c

  1073	
  1074	#define TRIGGER_MAX 3
> 1075	const static
  1076	int (*trigger[][TRIGGER_MAX])(struct snd_pcm_substream *substream, int cmd, int rollback) = {
  1077		[SND_SOC_TRIGGER_ORDER_DEFAULT] = {
  1078			snd_soc_link_trigger,
  1079			snd_soc_pcm_component_trigger,
  1080			snd_soc_pcm_dai_trigger,
  1081		},
  1082		[SND_SOC_TRIGGER_ORDER_LDC] = {
  1083			snd_soc_link_trigger,
  1084			snd_soc_pcm_dai_trigger,
  1085			snd_soc_pcm_component_trigger,
  1086		},
  1087	};
  1088	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
