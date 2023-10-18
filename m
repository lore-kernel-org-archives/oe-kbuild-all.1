Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F03535898
	for <oe-kbuild-all@lists.linux.dev>; Wed, 18 Oct 2023 13:27:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ilI0LXj6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697635673; x=1729171673;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=8eHOVMQ26xD5k8y4u1jDSNvLzf5deQiOt2FKz+nrKTI=;
  b=ilI0LXj6eBW8WzRok9kdy2BTtNfTfceA8opbnvUMtRlX1A7e7CQfNvgV
   E9psT+ULXRltoWiv0WFc5Pns3ZrE91kgiQc9h7JzanoMZ3ic1hi140akU
   HPEGogYzTVc7H2Z2fC06IsyPyNsRv0ubr9U4Te/CHefB/ltEjaw7tkkZk
   xRUsV3VL/pvz0S3rkfAFOkgCI19boyWS3FfRoe7wipWQQ03FLLoQ1AFgv
   weCt3QeotZ8Q8ndeR7Z1e2aPTu9vlT6vwmqfhIBqOK9EYexKqzRW16cRa
   z0gXgF0Jvk89qel24biyh9nLB1qURjFqpjx/QAf5AfJmXZ4duW6GIdWpk
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10867"; a="417125400"
X-IronPort-AV: E=Sophos;i="6.03,235,1694761200"; 
   d="scan'208";a="417125400"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Oct 2023 06:27:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10867"; a="1003810879"
X-IronPort-AV: E=Sophos;i="6.03,235,1694761200"; 
   d="scan'208";a="1003810879"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 18 Oct 2023 06:27:51 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qt6aT-0000Py-0f;
	Wed, 18 Oct 2023 13:27:49 +0000
Date: Wed, 18 Oct 2023 21:27:19 +0800
From: kernel test robot <lkp@intel.com>
To: Michael =?iso-8859-1?Q?Wei=DF?= <michael.weiss@aisec.fraunhofer.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH v2 10/14] lsm: Add security_sb_alloc_userns() hook
Message-ID: <202310182138.Y603GU6U-lkp@intel.com>
References: <20231018105033.13669-11-michael.weiss@aisec.fraunhofer.de>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231018105033.13669-11-michael.weiss@aisec.fraunhofer.de>

Hi Michael,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on 58720809f52779dc0f08e53e54b014209d13eebb]

url:    https://github.com/intel-lab-lkp/linux/commits/Michael-Wei/device_cgroup-Implement-devcgroup-hooks-as-lsm-security-hooks/20231018-185850
base:   58720809f52779dc0f08e53e54b014209d13eebb
patch link:    https://lore.kernel.org/r/20231018105033.13669-11-michael.weiss%40aisec.fraunhofer.de
patch subject: [RFC PATCH v2 10/14] lsm: Add security_sb_alloc_userns() hook
config: m68k-allyesconfig (https://download.01.org/0day-ci/archive/20231018/202310182138.Y603GU6U-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231018/202310182138.Y603GU6U-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310182138.Y603GU6U-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> security/security.c:4077: warning: Function parameter or member 'sb' not described in 'security_sb_alloc_userns'
   1 warnings as Errors


vim +4077 security/security.c

  4067	
  4068	/**
  4069	 * security_sb_alloc_userns() - Grand access to device nodes on sb in userns
  4070	 *
  4071	 * If device access is provided elsewere, this hook will grand access to device nodes
  4072	 * on the allocated sb for unprivileged user namespaces.
  4073	 *
  4074	 * Return: Returns 0 on success, error on failure.
  4075	 */
  4076	int security_sb_alloc_userns(struct super_block *sb)
> 4077	{
  4078		int thisrc;
  4079		int rc = LSM_RET_DEFAULT(sb_alloc_userns);
  4080		struct security_hook_list *hp;
  4081	
  4082		hlist_for_each_entry(hp, &security_hook_heads.sb_alloc_userns, list) {
  4083			thisrc = hp->hook.sb_alloc_userns(sb);
  4084			if (thisrc != LSM_RET_DEFAULT(sb_alloc_userns)) {
  4085				rc = thisrc;
  4086				if (thisrc != 0)
  4087					break;
  4088			}
  4089		}
  4090		return rc;
  4091	}
  4092	EXPORT_SYMBOL(security_sb_alloc_userns);
  4093	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
