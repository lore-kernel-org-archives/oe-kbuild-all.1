Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8CC2E56E
	for <oe-kbuild-all@lists.linux.dev>; Tue,  1 Oct 2024 02:13:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727748833; cv=none; b=Jo4hqAMCoi6yUTGPvBzigEtmbOtIXQTopBaGCOuDnvldQGd4Rnjk/3FAshYW/Fnp9djTzzQtrz4VzHtrIOCqWtrjURsFNJeYmVJvdCmre7Ct1iNsYNd7osZ8S1cHsUgWWBV3ED7Oxcwysdvbt0b05LnI/9o5g7kgR/gNI38AXWw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727748833; c=relaxed/simple;
	bh=xeJotWdowQe0iDJwsbFgCOlyPXQGjRl2ldryY8qjdRc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=gZz9yItNip6T6BYviy0BNAe7SLfP0Y2QaXty+j5YpACyUsm2b+wEC6ql2wIAVID46V+J9IKeFPU8yKWsTyOacRmvhv0SRnSpMzdzxGtQD9AlzT6Q0cYJ629fjbotdA3Dl2UGcqY9uFAgkuwkgFLvloZRYhZj6rftuq2Rl6v/GQs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EADFwqnD; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EADFwqnD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727748832; x=1759284832;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=xeJotWdowQe0iDJwsbFgCOlyPXQGjRl2ldryY8qjdRc=;
  b=EADFwqnD+vqNxXGRng03dsSH98RUf6dw4AcUQFMhKwNsK7ALSBril26M
   KMiIjHp5A5nlMTFscEQ/7H8zCOeF7inRzk30Q3DOcy0OP3JK2wd1RnOhI
   OaugcrCLtCrD865RIPY+uljNoJ/KyYD/OegVuly95ug677B6JFl0iZNUv
   6oETLxNZNb6epqeq7JZeZ2JNPdj6/+SLdjQU/eJtli0flBEpwzmDPk5l7
   pCyyKAZUSikxoXi6AFFNGTo5AVbeQqVPFLIdY9dNWiV05IornJ7kYAF9l
   Pqz63pKVr1KlNwd+dKh0q0EVNgBi9sx5J9wsRcRJgGmbRZq9X/drdUjP7
   Q==;
X-CSE-ConnectionGUID: 1RlKjRg7Tz+tzG8F0xXQog==
X-CSE-MsgGUID: YkJZc+rURbyq5xv843RBxg==
X-IronPort-AV: E=McAfee;i="6700,10204,11211"; a="26370508"
X-IronPort-AV: E=Sophos;i="6.11,167,1725346800"; 
   d="scan'208";a="26370508"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Sep 2024 19:13:49 -0700
X-CSE-ConnectionGUID: zDVchXHoT8SE8OJ7iIwvcw==
X-CSE-MsgGUID: mA7DbgJgRty5+n8JM6qPkA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,167,1725346800"; 
   d="scan'208";a="110981092"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 30 Sep 2024 19:13:47 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1svSOX-000Q99-1o;
	Tue, 01 Oct 2024 02:13:45 +0000
Date: Tue, 1 Oct 2024 10:13:42 +0800
From: kernel test robot <lkp@intel.com>
To: Alexander Fomichev <a.fomichev@yadro.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-ntb@googlegroups.com,
	Jon Mason <jdmason@kudzu.us>, Dave Jiang <dave.jiang@intel.com>
Subject: [jonmason-ntb:ntb-perf-latency 2/5]
 drivers/ntb/test/ntb_perf.c:1185:35: error: implicit declaration of function
 'get_random_int'; did you mean 'get_random_long'?
Message-ID: <202410011058.UeOHJeYT-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/jonmason/ntb ntb-perf-latency
head:   259175ed1ca5c7b82c8948657de24b15b99162d0
commit: 1361021161161af720f27081dc7cbda6e3c6f6d0 [2/5] ntb_perf: extend with poll latency measurement
config: arm-randconfig-002-20241001 (https://download.01.org/0day-ci/archive/20241001/202410011058.UeOHJeYT-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241001/202410011058.UeOHJeYT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410011058.UeOHJeYT-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/ntb/test/ntb_perf.c: In function 'perf_init_pl':
>> drivers/ntb/test/ntb_perf.c:1185:35: error: implicit declaration of function 'get_random_int'; did you mean 'get_random_long'? [-Wimplicit-function-declaration]
    1185 |                         *bp = (u8)get_random_int();
         |                                   ^~~~~~~~~~~~~~
         |                                   get_random_long


vim +1185 drivers/ntb/test/ntb_perf.c

  1166	
  1167	static int perf_init_pl(struct perf_poll_lat_data *pldata)
  1168	{
  1169		struct perf_ctx *perf = pldata->perf;
  1170		struct perf_peer *peer = perf->test_peer;
  1171		u8 *bp;
  1172	
  1173		pldata->src = kmalloc_node(peer->outbuf_size, GFP_KERNEL,
  1174					 dev_to_node(&perf->ntb->dev));
  1175		if (!pldata->src)
  1176			return -ENOMEM;
  1177	
  1178		/*
  1179		 * Prepare random data to send, guaranteed exclusion of 0x00 (unreceived)
  1180		 * and 0xFF (stop_word)
  1181		 */
  1182		get_random_bytes(pldata->src, peer->outbuf_size);
  1183		for (bp = pldata->src; bp < (u8 *) pldata->src + peer->outbuf_size; bp++)
  1184			while (*bp == 0 || *bp == stop_word)
> 1185				*bp = (u8)get_random_int();
  1186	
  1187		memset(peer->inbuf, 0, peer->inbuf_size);
  1188	
  1189		return 0;
  1190	}
  1191	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
