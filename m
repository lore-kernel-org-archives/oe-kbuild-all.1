Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDC9B2B544
	for <oe-kbuild-all@lists.linux.dev>; Tue, 22 Aug 2023 17:55:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692726951; x=1724262951;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=IbYWvyJVEtrIfQWBHVF5nyyC5yEy2fc4TWbrJVFe7fU=;
  b=OXo12b1eHwVSsaZAQ+TUR0XoRDOTqZr/t8pQp6nyPE5zUytu3sLIz51M
   k6A5L8YBaZsZn+DFqmZDOKhnc367Mu4UhNphen74YNwB+MVpoDDyqgdv0
   LSJdz49rOeheVKUfBKYUdBD7Uf+8J/Xk1S/43E8Bz5yjbk8D1N0BPk/Nx
   mNMZSxY4ydbdkboHR6cie/LwbNzGk1XqWwmx/gclBoWgsvGSfbQupADFO
   5vzCvgv97/CcqjSOulmje9+k8GcGiziLkKZioVtNr4taKzjLDwV3E1ej/
   28ju7nAMENH6jCbSBKfybdYGbw3ZEoFOKapoBazx5R5xrx+0O82pxnGfs
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10809"; a="354289365"
X-IronPort-AV: E=Sophos;i="6.01,193,1684825200"; 
   d="scan'208";a="354289365"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Aug 2023 10:55:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.01,202,1684825200"; 
   d="scan'208";a="880042110"
Received: from lkp-server02.sh.intel.com (HELO daf8bb0a381d) ([10.239.97.151])
  by fmsmga001.fm.intel.com with ESMTP; 22 Aug 2023 10:55:52 -0700
Received: from kbuild by daf8bb0a381d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qYVbW-0000Oe-2E;
	Tue, 22 Aug 2023 17:55:46 +0000
Date: Wed, 23 Aug 2023 01:55:37 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android-4.19-stable 14446/30000]
 sound/core/pcm_lib.c:2601: warning: Function parameter or member 'usr' not
 described in 'snd_pcm_add_usr_ctls'
Message-ID: <202308230140.Q2cHHnql-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android-4.19-stable
head:   ef983429ea2180ce7f3b17f1c8f5bff8ae61c1fa
commit: 613434fe6ffb5996982901dcd6a89605548ae7e8 [14446/30000] ANDROID: GKI: ALSA: PCM: User control API implementation
config: x86_64-randconfig-006-20230822 (https://download.01.org/0day-ci/archive/20230823/202308230140.Q2cHHnql-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce: (https://download.01.org/0day-ci/archive/20230823/202308230140.Q2cHHnql-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308230140.Q2cHHnql-lkp@intel.com/

All warnings (new ones prefixed by >>):

   sound/core/pcm_lib.c:2512: warning: Function parameter or member 'volume' not described in 'snd_pcm_add_volume_ctls'
>> sound/core/pcm_lib.c:2601: warning: Function parameter or member 'usr' not described in 'snd_pcm_add_usr_ctls'
>> sound/core/pcm_lib.c:2601: warning: Function parameter or member 'max_kctrl_str_len' not described in 'snd_pcm_add_usr_ctls'


vim +2601 sound/core/pcm_lib.c

  2584	
  2585	/**
  2586	 * snd_pcm_add_usr_ctls - create user control elements
  2587	 * @pcm: the assigned PCM instance
  2588	 * @stream: stream direction
  2589	 * @max_length: the max length of the user parameter of stream
  2590	 * @private_value: the value passed to each kcontrol's private_value field
  2591	 * @info_ret: store struct snd_pcm_usr instance if non-NULL
  2592	 *
  2593	 * Create usr control elements assigned to the given PCM stream(s).
  2594	 * Returns zero if succeed, or a negative error value.
  2595	 */
  2596	int snd_pcm_add_usr_ctls(struct snd_pcm *pcm, int stream,
  2597				 const struct snd_pcm_usr_elem *usr,
  2598				 int max_length, int max_kctrl_str_len,
  2599				 unsigned long private_value,
  2600				 struct snd_pcm_usr **info_ret)
> 2601	{

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
