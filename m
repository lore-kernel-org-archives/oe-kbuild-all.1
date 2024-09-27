Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13860381B1
	for <oe-kbuild-all@lists.linux.dev>; Fri, 27 Sep 2024 21:06:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727471206; cv=none; b=Pg6MNETKmMJeRQ5HoK0H3TeGYATru+hCJhHSbfV3/eZCMS1m9PurrPOe6AsnmBbtme4VY9ujnQmdH+V48JCkutFhYzpKPfiV392O24Qbn4D/Yt2uUgOlSXM07jMR4pycT8uSohz9OP0FaK+D3qeaj5zmZs8RqUWrqoIdEPOXAwA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727471206; c=relaxed/simple;
	bh=P/2Nk1hzfKYUyz6fV2zrEdJePF+SSrCfrp9Yqh5dNn4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=QhPj5JqnPdw+YiSrcLPJ5KXVKX65kAwOopDNU51g9lEiTlVIC+yR0DQHPbvERTOm24u/VAm1FsQLUg2RsUV028CXWWR8IplNBpsEjoAadiBW3KQr+0AmL0tCejpHzdT3yt3aiWluh2BIBLEownJxj3StmZiuo2kFzZdolkObA0s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OknQmKBf; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OknQmKBf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727471204; x=1759007204;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=P/2Nk1hzfKYUyz6fV2zrEdJePF+SSrCfrp9Yqh5dNn4=;
  b=OknQmKBfIv9LlLZyRwE/s/KtaFdtBNbLs0wApEsjdFjCJFOersaUGSjC
   eQsgdhsnOcDDXG2hjBvPFTv4aLfn2SNrW4L5vyKv3rSFbLxX+K8Z3dBC1
   jxpMGt2cRj3Mf60/E6DvIqVjgmSOalHvJKptJi/CvGejH+JVM+Sru4h1H
   M1RUFgHbJZ6ISATnvrQ7MqdfaPbV5zILsy/az0I0AQGu41cRklLB3c/7P
   MVFAjg6jWQXLf2LZbLSVAeJFqtuxp7PHYVje1Gitumf3M9hTZBH7PVRa0
   U2OMejE/KvFIMjFWrClW04VSqhqG9pLeL6N9feBiF95GkH35FdQKn+tWP
   Q==;
X-CSE-ConnectionGUID: iTrY0FKQTPG7bgqlILLAOQ==
X-CSE-MsgGUID: ndXuYuTARzq0EVrzfGinfg==
X-IronPort-AV: E=McAfee;i="6700,10204,11208"; a="52044642"
X-IronPort-AV: E=Sophos;i="6.11,159,1725346800"; 
   d="scan'208";a="52044642"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Sep 2024 14:06:43 -0700
X-CSE-ConnectionGUID: pl832SwgRWS0n+piXG3bdw==
X-CSE-MsgGUID: tBEYF5ixR262Nu9ppdKhjw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,159,1725346800"; 
   d="scan'208";a="72809465"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 27 Sep 2024 14:06:42 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1suIAi-000Mcq-0x;
	Fri, 27 Sep 2024 21:06:40 +0000
Date: Sat, 28 Sep 2024 05:06:21 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Yuan Can <yuancan@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 1683/14216] mm/memcontrol.c:3147:6: warning: no
 previous prototype for 'hisi_oom_recover'
Message-ID: <202409280536.wLGz5QQ3-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Weilong,

FYI, the error/warning still remains.

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   c9fe32fed709da98069e8215f6ecf39ea63f5355
commit: b498d9f1bacd40d583c0970cab02ad522127a7e7 [1683/14216] arm64/ascend: Add new enable_oom_killer interface for oom contrl
config: arm64-randconfig-002-20240928 (https://download.01.org/0day-ci/archive/20240928/202409280536.wLGz5QQ3-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240928/202409280536.wLGz5QQ3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409280536.wLGz5QQ3-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> mm/memcontrol.c:3147:6: warning: no previous prototype for 'hisi_oom_recover' [-Wmissing-prototypes]
    3147 | void hisi_oom_recover(struct obj_cgroup *objcg)
         |      ^~~~~~~~~~~~~~~~


vim +/hisi_oom_recover +3147 mm/memcontrol.c

  3145	
  3146	#ifdef CONFIG_ASCEND_OOM
> 3147	void hisi_oom_recover(struct obj_cgroup *objcg)
  3148	{
  3149		struct mem_cgroup *memcg;
  3150	
  3151		memcg = get_mem_cgroup_from_objcg(objcg);
  3152		if (!mem_cgroup_is_root(memcg))
  3153			memcg_oom_recover(memcg);
  3154		css_put(&memcg->css);
  3155	}
  3156	#else
  3157	static inline void hisi_oom_recover(struct obj_cgroup *objcg) { }
  3158	#endif
  3159	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
