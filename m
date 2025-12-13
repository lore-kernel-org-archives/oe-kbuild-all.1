Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CFE02673AA
	for <oe-kbuild-all@lists.linux.dev>; Sat, 13 Dec 2025 22:27:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765664848; cv=none; b=nZ09HlagIn0A79+DV2/8Z5RAvu/Vby3NZgG2GqqLijpVjKkgjHZXnz/XpQdAt+DG6kLYREwQSMR/NmSr2LHxGvvOqpCwru1MfoCZgX20EzY/97Xaesa0/0kTQEPNu1YlXV74oEgP9pWt80X9CDql6rB6PVa/QqPEL2fplBe6aZI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765664848; c=relaxed/simple;
	bh=8GrEwgFr5D15sUIJrLwFkH6mqqKztZQ+dKcQ5MDljt8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=cMIRCfiEyirJ7N6iFzCvdcSEuV8WWZl8LlAegNbUkJLfj5WJYG7Zv5zFF8xO0wNAn6NeXJhZTAlFKgEb/n76qzrMSGPdRHTyiYg9Yf2Bd3vasl7mBT45WTK95NY4BxDCUx+DYibkAzBjPw3QxfyMuGWMI3FIt6PiwCurDvteYcA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mT1KSxhA; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mT1KSxhA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765664847; x=1797200847;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=8GrEwgFr5D15sUIJrLwFkH6mqqKztZQ+dKcQ5MDljt8=;
  b=mT1KSxhAjRt4Qhld+3PRQnS5D7ETL9Hc4tQOnSo/4ZFBxmhbkFtjTc6d
   nRxTcufsKOM3mtvqPoWctG8qXF9fxvCvsYWa6Wjb6EZIg3J7HeFc1WBe+
   xTz9luZtTIb5MiRzk3z4wA2wvtI3VJYEdVuehx4NuPmWQkxKWzMpe8eM2
   MsLILH0d4k1jhXXj0cV+a74WF+LJhntPBfi3BdruyZ34EreaZVAoUGOZI
   MxHULrx6k9NN3vAFMsdUZjENUnechPZpD4jF1+1AQ5h6QGNRdEmLy+G+B
   1J/F924CrzALgnJrxwfTIMTF1zXBtMsdhJK6RNz2txp2+douwDAYl7gOr
   g==;
X-CSE-ConnectionGUID: fSmpdQnlSsC8S8uDwfGOmg==
X-CSE-MsgGUID: 5EB+3RGwSNyQhoamBgo4Cg==
X-IronPort-AV: E=McAfee;i="6800,10657,11641"; a="78328218"
X-IronPort-AV: E=Sophos;i="6.21,147,1763452800"; 
   d="scan'208";a="78328218"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Dec 2025 14:27:26 -0800
X-CSE-ConnectionGUID: CaNX3IAFRK2Jp338bQWXgg==
X-CSE-MsgGUID: z3b7A0OjSUOxTrBhvBPiQg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,147,1763452800"; 
   d="scan'208";a="197656749"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 13 Dec 2025 14:27:25 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vUY5D-000000008Gj-1cBs;
	Sat, 13 Dec 2025 22:27:23 +0000
Date: Sun, 14 Dec 2025 06:27:10 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, dinglongwei <dinglongwei1@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1942/1942]
 drivers/gpu/drm/nouveau/nvkm/core/object.c:37:19: warning: mixing
 declarations and code is a C99 extension
Message-ID: <202512140652.dui78VGp-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Dave,

First bad commit (maybe != root cause):

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   5a399b91821faeec2466751db2d714b24f8eb17c
commit: 901dbb48d8a4f60af427f1ec67ac1247ff219f39 [1942/1942] nouveau: lock the client object tree.
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20251214/202512140652.dui78VGp-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 1335a05ab8bc8339ce24be3a9da89d8c3f4e0571)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251214/202512140652.dui78VGp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512140652.dui78VGp-lkp@intel.com/

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
