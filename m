Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57317C2F3
	for <oe-kbuild-all@lists.linux.dev>; Mon, 14 Aug 2023 16:57:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692032253; x=1723568253;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=hL6SoRoriOXxueSPCRJgRN37dtYHH2QpDtoRpeWSRCI=;
  b=Qq2T1uVXaixgv9Ug9gg/6BFIFkPvR0dLoDM3qN6P4daEaStd00lDome0
   sEgm4mtdYukE73qTh70t498kp2GAmdqHsswQ5e0al0reuuSerVJLM41IJ
   ncN2yfx0YrXmO8FxD6C1eZpA0afDgZLJpLgc81NCpD6Vns5tP2AZlvWF8
   oXTmKp5u2onUgBa0mMEIcfiLeHUcM3rB8QJiq00dGirkb+6RVwL3wTV21
   LySfgIMhJgPONb7EVdmATccRGmTIccsZE9pLdsJ5z6gYizPI/LyB9xZtC
   8MKaNcYRmoZz/wE+ZN51K7LOGPsF1LC4tWhcMA+r/h+XHwHGnuRiUFiz+
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10802"; a="458448579"
X-IronPort-AV: E=Sophos;i="6.01,173,1684825200"; 
   d="scan'208";a="458448579"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Aug 2023 09:57:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10802"; a="683372417"
X-IronPort-AV: E=Sophos;i="6.01,173,1684825200"; 
   d="scan'208";a="683372417"
Received: from lkp-server02.sh.intel.com (HELO b5fb8d9e1ffc) ([10.239.97.151])
  by orsmga003.jf.intel.com with ESMTP; 14 Aug 2023 09:57:27 -0700
Received: from kbuild by b5fb8d9e1ffc with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qVash-0000Ie-2C;
	Mon, 14 Aug 2023 16:57:27 +0000
Date: Tue, 15 Aug 2023 00:57:10 +0800
From: kernel test robot <lkp@intel.com>
To: Hannes Reinecke <hare@suse.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [hare-nvme:tls.v13 12/19] drivers/nvme/host/fabrics.c:634:15: error:
 implicit declaration of function 'key_lookup'; did you mean 'vma_lookup'?
Message-ID: <202308150022.a09VIyuH-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/hare/nvme.git tls.v13
head:   ce525e34ae9d3f5ed12f23caea57c0aa2e8359ee
commit: d523697c96a38b1358cefed16ded3d32dfe171d2 [12/19] nvme-fabrics: parse options 'keyring' and 'tls_key'
config: i386-randconfig-r005-20230814 (https://download.01.org/0day-ci/archive/20230815/202308150022.a09VIyuH-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230815/202308150022.a09VIyuH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308150022.a09VIyuH-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   drivers/nvme/host/fabrics.c: In function 'nvmf_parse_key':
>> drivers/nvme/host/fabrics.c:634:15: error: implicit declaration of function 'key_lookup'; did you mean 'vma_lookup'? [-Werror=implicit-function-declaration]
     634 |         key = key_lookup(key_id);
         |               ^~~~~~~~~~
         |               vma_lookup
>> drivers/nvme/host/fabrics.c:634:13: warning: assignment to 'struct key *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     634 |         key = key_lookup(key_id);
         |             ^
   cc1: some warnings being treated as errors


vim +634 drivers/nvme/host/fabrics.c

   624	
   625	static struct key *nvmf_parse_key(int key_id, char *key_type)
   626	{
   627		struct key *key;
   628	
   629		if (!IS_ENABLED(CONFIG_NVME_TCP_TLS)) {
   630			pr_err("TLS is not supported\n");
   631			return ERR_PTR(-EINVAL);
   632		}
   633	
 > 634		key = key_lookup(key_id);
   635		if (IS_ERR(key))
   636			pr_err("%s %08x not found\n", key_type, key_id);
   637		else
   638			pr_debug("Using %s %08x\n", key_type, key_id);
   639		return key;
   640	}
   641	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
