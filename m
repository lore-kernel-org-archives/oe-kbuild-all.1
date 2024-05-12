Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE151C8D7
	for <oe-kbuild-all@lists.linux.dev>; Sun, 12 May 2024 02:54:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715482480; cv=none; b=megFxGCzjcH0zpo3tnQaPBZdrPtVYaQc8uRHcMlY55NyLQAtlaOquR1CkEJwOsP3ItwwzH1iapKd0Q1Yxp4/WxKkoMCzA1eKIRMCfBzSC13mfw50kj32ZaBi2K/O3n3cFnxbzIJAvwF0HShBMJSfkxQCYDDiVBjch6XF5WCjnz0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715482480; c=relaxed/simple;
	bh=1N+NcmBUoLQAuvwdf0441TN1ch0bX0FevntS+RlbL9c=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=hO7/Ddj/5b6Az8OBLUC37jRL8qtCaqvuHwTGbOnNMr1TNtWoyngAYsMZeQ819gFVMAuqpZt44/lk/yD08YsT45FkQRzfgPqPSv12F1ZCpRbxo9BIrLuM0j4Jwa+45SXjUrU6ZUu7w9dz8E2Ba0MUcjcMdappTkKcI6gtxbuQzUQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ad+IUpmU; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ad+IUpmU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715482477; x=1747018477;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=1N+NcmBUoLQAuvwdf0441TN1ch0bX0FevntS+RlbL9c=;
  b=ad+IUpmUlq7fc0HRxWg4BQTB0HQeLIp61eD8RUdPknj9EUfmfO4Fq1/a
   lli9ZnDW8gDp7+NhFH9RJFj+gAON2pUBuAfoefsGKmVdGsMHGnx3407vo
   z0uza+2Fl+tijZ3I8IyIAPxir5y2uRqm22eiynP2PiChXL5ZjWjSOFazQ
   JYB40YpywA2pt6sTJq3jx3Bmyd0U/oK/329+E8VScGYC+6ZkUu9eoeQF3
   bZd579WmixL9PEDSomBoDQrqkZCRbmo/GOZDq9tnQ7wboPV6Ia0xXG8pc
   738M0p18cEfaHMO7xN+RuA3wPn4HgFJuNYHohq5fvtsEhS7ddKZ73no62
   g==;
X-CSE-ConnectionGUID: wSJHst1HRmudAyBcKIH1FQ==
X-CSE-MsgGUID: JIOfTXxCQw6ebTSUHbcTkQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11070"; a="11578664"
X-IronPort-AV: E=Sophos;i="6.08,155,1712646000"; 
   d="scan'208";a="11578664"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 May 2024 19:54:36 -0700
X-CSE-ConnectionGUID: q9LZQckSS5SVVQpZktTgng==
X-CSE-MsgGUID: /6X51BgvQD6FSEO85agaXg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,155,1712646000"; 
   d="scan'208";a="34775949"
Received: from lkp-server01.sh.intel.com (HELO f8b243fe6e68) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 11 May 2024 19:54:35 -0700
Received: from kbuild by f8b243fe6e68 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s5zM8-000861-2g;
	Sun, 12 May 2024 02:54:32 +0000
Date: Sun, 12 May 2024 10:54:25 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, dinglongwei <dinglongwei1@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 22374/22416]
 drivers/gpu/drm/nouveau/nvkm/core/object.c:37:19: warning: mixing
 declarations and code is a C99 extension
Message-ID: <202405121008.xQ4qtfYQ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   8d055501b2f0dc4e29197de45eabdd21f73fa507
commit: 901dbb48d8a4f60af427f1ec67ac1247ff219f39 [22374/22416] nouveau: lock the client object tree.
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20240512/202405121008.xQ4qtfYQ-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240512/202405121008.xQ4qtfYQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405121008.xQ4qtfYQ-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/nouveau/nvkm/core/object.c:37:19: warning: mixing declarations and code is a C99 extension [-Wdeclaration-after-statement]
      37 |                 struct rb_node *node = client->objroot.rb_node;
         |                                 ^
   1 warning generated.


vim +37 drivers/gpu/drm/nouveau/nvkm/core/object.c

9274f4a9ba7e70 drivers/gpu/drm/nouveau/core/core/object.c Ben Skeggs  2012-07-06  27  
110cccff955313 drivers/gpu/drm/nouveau/nvkm/core/object.c Ben Skeggs  2016-12-22  28  struct nvkm_object *
110cccff955313 drivers/gpu/drm/nouveau/nvkm/core/object.c Ben Skeggs  2016-12-22  29  nvkm_object_search(struct nvkm_client *client, u64 handle,
110cccff955313 drivers/gpu/drm/nouveau/nvkm/core/object.c Ben Skeggs  2016-12-22  30  		   const struct nvkm_object_func *func)
110cccff955313 drivers/gpu/drm/nouveau/nvkm/core/object.c Ben Skeggs  2016-12-22  31  {
110cccff955313 drivers/gpu/drm/nouveau/nvkm/core/object.c Ben Skeggs  2016-12-22  32  	struct nvkm_object *object;
901dbb48d8a4f6 drivers/gpu/drm/nouveau/nvkm/core/object.c Dave Airlie 2024-05-09  33  	unsigned long flags;
110cccff955313 drivers/gpu/drm/nouveau/nvkm/core/object.c Ben Skeggs  2016-12-22  34  
110cccff955313 drivers/gpu/drm/nouveau/nvkm/core/object.c Ben Skeggs  2016-12-22  35  	if (handle) {
901dbb48d8a4f6 drivers/gpu/drm/nouveau/nvkm/core/object.c Dave Airlie 2024-05-09  36  		spin_lock_irqsave(&client->obj_lock, flags);
110cccff955313 drivers/gpu/drm/nouveau/nvkm/core/object.c Ben Skeggs  2016-12-22 @37  		struct rb_node *node = client->objroot.rb_node;
110cccff955313 drivers/gpu/drm/nouveau/nvkm/core/object.c Ben Skeggs  2016-12-22  38  		while (node) {
110cccff955313 drivers/gpu/drm/nouveau/nvkm/core/object.c Ben Skeggs  2016-12-22  39  			object = rb_entry(node, typeof(*object), node);
110cccff955313 drivers/gpu/drm/nouveau/nvkm/core/object.c Ben Skeggs  2016-12-22  40  			if (handle < object->object)
110cccff955313 drivers/gpu/drm/nouveau/nvkm/core/object.c Ben Skeggs  2016-12-22  41  				node = node->rb_left;
110cccff955313 drivers/gpu/drm/nouveau/nvkm/core/object.c Ben Skeggs  2016-12-22  42  			else
110cccff955313 drivers/gpu/drm/nouveau/nvkm/core/object.c Ben Skeggs  2016-12-22  43  			if (handle > object->object)
110cccff955313 drivers/gpu/drm/nouveau/nvkm/core/object.c Ben Skeggs  2016-12-22  44  				node = node->rb_right;
901dbb48d8a4f6 drivers/gpu/drm/nouveau/nvkm/core/object.c Dave Airlie 2024-05-09  45  			else {
901dbb48d8a4f6 drivers/gpu/drm/nouveau/nvkm/core/object.c Dave Airlie 2024-05-09  46  				spin_unlock_irqrestore(&client->obj_lock, flags);
110cccff955313 drivers/gpu/drm/nouveau/nvkm/core/object.c Ben Skeggs  2016-12-22  47  				goto done;
110cccff955313 drivers/gpu/drm/nouveau/nvkm/core/object.c Ben Skeggs  2016-12-22  48  			}
901dbb48d8a4f6 drivers/gpu/drm/nouveau/nvkm/core/object.c Dave Airlie 2024-05-09  49  		}
901dbb48d8a4f6 drivers/gpu/drm/nouveau/nvkm/core/object.c Dave Airlie 2024-05-09  50  		spin_unlock_irqrestore(&client->obj_lock, flags);
110cccff955313 drivers/gpu/drm/nouveau/nvkm/core/object.c Ben Skeggs  2016-12-22  51  		return ERR_PTR(-ENOENT);
110cccff955313 drivers/gpu/drm/nouveau/nvkm/core/object.c Ben Skeggs  2016-12-22  52  	} else {
110cccff955313 drivers/gpu/drm/nouveau/nvkm/core/object.c Ben Skeggs  2016-12-22  53  		object = &client->object;
110cccff955313 drivers/gpu/drm/nouveau/nvkm/core/object.c Ben Skeggs  2016-12-22  54  	}
110cccff955313 drivers/gpu/drm/nouveau/nvkm/core/object.c Ben Skeggs  2016-12-22  55  
110cccff955313 drivers/gpu/drm/nouveau/nvkm/core/object.c Ben Skeggs  2016-12-22  56  done:
110cccff955313 drivers/gpu/drm/nouveau/nvkm/core/object.c Ben Skeggs  2016-12-22  57  	if (unlikely(func && object->func != func))
110cccff955313 drivers/gpu/drm/nouveau/nvkm/core/object.c Ben Skeggs  2016-12-22  58  		return ERR_PTR(-EINVAL);
110cccff955313 drivers/gpu/drm/nouveau/nvkm/core/object.c Ben Skeggs  2016-12-22  59  	return object;
110cccff955313 drivers/gpu/drm/nouveau/nvkm/core/object.c Ben Skeggs  2016-12-22  60  }
110cccff955313 drivers/gpu/drm/nouveau/nvkm/core/object.c Ben Skeggs  2016-12-22  61  

:::::: The code at line 37 was first introduced by commit
:::::: 110cccff955313c66dccd2817f62368f106d9bf2 drm/nouveau/core/object: support lookup of specific object types

:::::: TO: Ben Skeggs <bskeggs@redhat.com>
:::::: CC: Ben Skeggs <bskeggs@redhat.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
