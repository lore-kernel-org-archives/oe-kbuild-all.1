Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79E873F44F7
	for <oe-kbuild-all@lists.linux.dev>; Tue,  2 Jun 2026 17:07:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780420071; cv=none; b=PwK/XNz1x9vanlOdd2V2S1jUqfKb8UBEeh0eNUiyJibMwge3WxIwKRvDV27D1RWzJD6kefGYynkwP6wjGbzJL2uGOSptK+L8XaH+5VsQYN+dv8+9+D4WfUiL7tYjuvnyevwF/uMI732p3hTS2Xb9sF25cZ0MERe1Ti5tzQHVrDU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780420071; c=relaxed/simple;
	bh=3Lftt1hVs1EqVxUuw82hviABKeAZ8dQrwTdQtWcQnyc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=tyqie3XeOqlzLrCpIVkWsvCjEyoUPxuZ/Ub7LxmEBIPm/ON5EQgPp3bw/ocNSgcwbmTIF6WkXowXnz8bLHsgV0SYJt29a7Y3nhkiRgFtYkPe3H2vHHNkaiz1xBYNLz99XZmYl3Quez10sUhVDNLP0ZkUkdrql0F3LjnKu4y3Q0g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Le1+KZ5k; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Le1+KZ5k"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780420071; x=1811956071;
  h=date:from:to:cc:subject:message-id;
  bh=3Lftt1hVs1EqVxUuw82hviABKeAZ8dQrwTdQtWcQnyc=;
  b=Le1+KZ5kEgA0I6POVUddJstCcECkrqfTDZVQrlWC/OBOMAEuKaFo1S5I
   qpXu5yaBdtrJqXTMBWeboVZ96lrS0aNIJLr0OKJuApEf9NtUB8/+Jccau
   7jkQ9CzCHtZlY2N5IsNsYW76/BifxlEfK51kTFpQWvIdMQ/IqNq7ilKGM
   wuhiAmKxVtN2bgnMLNvRMppvy2QC+qb5n6YvWafkwaIv29asEgSkqNekZ
   R4UTZBK0YK8CYi5MI+yj2viPU8B5/gzid4diptBiLgpHkvnHGRCoa4dhP
   431drbWQaIxnvUUVMMbBaS1p0rROmLNJ6ULW+Fjlv1BjCYFG/kKZrBDE0
   w==;
X-CSE-ConnectionGUID: xAudfidFSBuxLTfp/83Mjg==
X-CSE-MsgGUID: lxHJPVxISgmxd4KYYLH2xA==
X-IronPort-AV: E=McAfee;i="6800,10657,11805"; a="80244996"
X-IronPort-AV: E=Sophos;i="6.24,183,1774335600"; 
   d="scan'208";a="80244996"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jun 2026 10:07:50 -0700
X-CSE-ConnectionGUID: +QIqXgKpS4G6q0y3j7grYw==
X-CSE-MsgGUID: x/WAfPyNQiK+7CRdwTu5kg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,183,1774335600"; 
   d="scan'208";a="244050967"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 02 Jun 2026 10:07:48 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wUSaf-00000000CKo-3oKJ;
	Tue, 02 Jun 2026 17:07:45 +0000
Date: Wed, 03 Jun 2026 01:07:06 +0800
From: kernel test robot <lkp@intel.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [morimoto:sound-cleanup-2026-06-01-3 290/290]
 sound/soc/soc-component.c:1949:55: warning: initialization of 'struct
 snd_soc_component *' from 'int' makes pointer from integer without a cast
Message-ID: <202606030041.KdkXrIOe-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/morimoto/linux sound-cleanup-2026-06-01-3
head:   1ef39bbdce9099b285b9702e22c4defc277e42dd
commit: 65d71bb7bc31ce188d488d8e1f2bc901c7128948 [290/290] ASoC: soc-component: remove compatible definition
config: nios2-allmodconfig (https://download.01.org/0day-ci/archive/20260603/202606030041.KdkXrIOe-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260603/202606030041.KdkXrIOe-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606030041.KdkXrIOe-lkp@intel.com/

All warnings (new ones prefixed by >>):

   sound/soc/soc-component.c: In function 'snd_soc_component_unregister_by_driver':
   sound/soc/soc-component.c:1949:55: error: implicit declaration of function 'snd_soc_lookup_component_nolocked'; did you mean 'snd_soc_tplg_component_load'? [-Werror=implicit-function-declaration]
    1949 |                 struct snd_soc_component *component = snd_soc_lookup_component_nolocked(dev, driver_name);
         |                                                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                                                       snd_soc_tplg_component_load
>> sound/soc/soc-component.c:1949:55: warning: initialization of 'struct snd_soc_component *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
   cc1: some warnings being treated as errors


vim +1949 sound/soc/soc-component.c

c538402ce106a9 Kuninori Morimoto 2026-05-27  1930  
c538402ce106a9 Kuninori Morimoto 2026-05-27  1931  /**
c538402ce106a9 Kuninori Morimoto 2026-05-27  1932   * snd_soc_component_unregister_by_driver - Unregister component using a given driver
c538402ce106a9 Kuninori Morimoto 2026-05-27  1933   * from the ASoC core
c538402ce106a9 Kuninori Morimoto 2026-05-27  1934   *
c538402ce106a9 Kuninori Morimoto 2026-05-27  1935   * @dev: The device to unregister
c538402ce106a9 Kuninori Morimoto 2026-05-27  1936   * @component_driver: The component driver to unregister
c538402ce106a9 Kuninori Morimoto 2026-05-27  1937   */
c538402ce106a9 Kuninori Morimoto 2026-05-27  1938  void snd_soc_component_unregister_by_driver(struct device *dev,
c538402ce106a9 Kuninori Morimoto 2026-05-27  1939  					    const struct snd_soc_component_driver *component_driver)
c538402ce106a9 Kuninori Morimoto 2026-05-27  1940  {
c538402ce106a9 Kuninori Morimoto 2026-05-27  1941  	const char *driver_name = NULL;
c538402ce106a9 Kuninori Morimoto 2026-05-27  1942  
c538402ce106a9 Kuninori Morimoto 2026-05-27  1943  	if (component_driver)
c538402ce106a9 Kuninori Morimoto 2026-05-27  1944  		driver_name = component_driver->name;
c538402ce106a9 Kuninori Morimoto 2026-05-27  1945  
c538402ce106a9 Kuninori Morimoto 2026-05-27  1946  	guard(mutex)(&client_mutex);
c538402ce106a9 Kuninori Morimoto 2026-05-27  1947  
c538402ce106a9 Kuninori Morimoto 2026-05-27  1948  	while (1) {
c538402ce106a9 Kuninori Morimoto 2026-05-27 @1949  		struct snd_soc_component *component = snd_soc_lookup_component_nolocked(dev, driver_name);

:::::: The code at line 1949 was first introduced by commit
:::::: c538402ce106a9ead46629e7b974b6c45a11a3ab ASoC: soc-component: move snd_soc_register_[un]component() to soc-component.c

:::::: TO: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
:::::: CC: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
