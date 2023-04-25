Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 304747B
	for <oe-kbuild-all@lists.linux.dev>; Tue, 25 Apr 2023 09:37:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1682415456; x=1713951456;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=USF+nHtjEl9ODEKwScwWikHmSP5tzxfXjyg9H1n9TfQ=;
  b=VfWTG+OoMa662++jzoP1Jmf0BT8iOUaueU11O5g5evMmXydrb8emK6lf
   Ma7wUyVV1JZooAICrDZX+/TmsJFOD9dmK0OOf6jFrc9SSYSOfr0PY7qmB
   Nyvweetsqbgw+u8fOO3GozEzJ8ymDlCUUWvaQMCJLWrhiEadb2kW/uYAt
   r+ihaKUgV28yBYJXj1opJgMu1k5VdhArjZo/Cl+gaK50kR1zmPvPjaAtr
   6FGhU2ZJPhgnIsK0fH6g5QQiinu3NXK9ezVsSCL59icR62jM3/Tx0mHNT
   bT513BKRhULqbgPdTeNe4Ebarswn/EWMPbQ7OhcjvU4sY7CMMCZnOos4d
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10690"; a="349505334"
X-IronPort-AV: E=Sophos;i="5.99,225,1677571200"; 
   d="scan'208";a="349505334"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Apr 2023 02:37:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10690"; a="758041070"
X-IronPort-AV: E=Sophos;i="5.99,225,1677571200"; 
   d="scan'208";a="758041070"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 25 Apr 2023 02:37:34 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1prF72-000jHM-2l;
	Tue, 25 Apr 2023 09:37:28 +0000
Date: Tue, 25 Apr 2023 17:36:44 +0800
From: kernel test robot <lkp@intel.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [morimoto:sound-dai-ops-2023-04-25-v2 35/58]
 sound/soc/sof/amd/renoir.c:27:37: warning: 'renoir_sof_dai_ops' defined but
 not used
Message-ID: <202304251741.UIEXASrE-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/morimoto/linux sound-dai-ops-2023-04-25-v2
head:   95707df62ebc8850d4cc2a5fd9b2674d218e1c93
commit: c28434a42df4f75f25fe6ab8389d032646e85404 [35/58] ASoC: sof: merge DAI call back functions into ops
config: x86_64-allmodconfig (https://download.01.org/0day-ci/archive/20230425/202304251741.UIEXASrE-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce (this is a W=1 build):
        # https://github.com/morimoto/linux/commit/c28434a42df4f75f25fe6ab8389d032646e85404
        git remote add morimoto https://github.com/morimoto/linux
        git fetch --no-tags morimoto sound-dai-ops-2023-04-25-v2
        git checkout c28434a42df4f75f25fe6ab8389d032646e85404
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=x86_64 olddefconfig
        make W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash sound/soc/sof/amd/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304251741.UIEXASrE-lkp@intel.com/

All warnings (new ones prefixed by >>):

   sound/soc/sof/amd/renoir.c:28:18: error: 'acp_dai_probe' undeclared here (not in a function)
      28 |         .probe = acp_dai_probe,
         |                  ^~~~~~~~~~~~~
>> sound/soc/sof/amd/renoir.c:27:37: warning: 'renoir_sof_dai_ops' defined but not used [-Wunused-const-variable=]
      27 | static const struct snd_soc_dai_ops renoir_sof_dai_ops = {
         |                                     ^~~~~~~~~~~~~~~~~~
--
   sound/soc/sof/amd/rembrandt.c:29:18: error: 'acp_dai_probe' undeclared here (not in a function)
      29 |         .probe = acp_dai_probe,
         |                  ^~~~~~~~~~~~~
>> sound/soc/sof/amd/rembrandt.c:28:37: warning: 'rembrandt_sof_dai_ops' defined but not used [-Wunused-const-variable=]
      28 | static const struct snd_soc_dai_ops rembrandt_sof_dai_ops = {
         |                                     ^~~~~~~~~~~~~~~~~~~~~


vim +/renoir_sof_dai_ops +27 sound/soc/sof/amd/renoir.c

    26	
  > 27	static const struct snd_soc_dai_ops renoir_sof_dai_ops = {
    28		.probe = acp_dai_probe,
    29	};
    30	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
