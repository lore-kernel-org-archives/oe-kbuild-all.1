Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2E2717BB7
	for <oe-kbuild-all@lists.linux.dev>; Sat, 11 May 2024 20:32:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715459546; cv=none; b=t6uOn/hrRrLM//wFeeKtQUygAL8NzB3X9DtTZwpYCWDY2YmoV6+S+/uhdS20pcwHUXpzrJOnt24LeQTr3zKoP6kBHHTbwkGsXaRUIHYOSZ/sXBA5Rh3pPXKTTTagWvaSuCZucP7yuMb/gyk6BbH9k0mxEjUbiI3oZIhl4nOFlGc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715459546; c=relaxed/simple;
	bh=yFXBjXxUdFWDUGOVfTVeIe0KDacUgS691qYgovYodag=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=EZBoVUWUeVKnvBsBCJWGhbD2A2ocx4saXYF/R/JmmluLoUX9KHG7uzU7CjunNKtsLUW2DsMPd0FNHQvuY0grGJdXk8/nKROB8iRYZ9ckJQT92diYRHeQi2Zz1jsEIGN/kd1U0ZGUzaf3WZqtxAYsiN7kfJKb6DzFv1tHj2yb8Ww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UZbAjoM1; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UZbAjoM1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715459545; x=1746995545;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=yFXBjXxUdFWDUGOVfTVeIe0KDacUgS691qYgovYodag=;
  b=UZbAjoM1Atd0/yOHYqyvlAlYWbUlyqgpYz1r752GZ9aHIs74Diy2oN5e
   I1cAzQwrEwcdJlf0xscUzJ7hb7acBwuVOOr+vRZ+c2fNv3nVb9c18ls4D
   CO/w8a+05JgyT+PeUmjH1A1hNtesUU7lT869cC/KQHhs+2iw4UR3mGLou
   9YSjHFRYUPIsYS2CN5ZhuhAnKCooo5d2sNJ87HkYVbjfi4OyrEwCb/Zfi
   XA+fuxd+DbHi/t7pJuHylh0QgEsxcozS+0+P+uBa8Gfr/pnm0+oG+LBlM
   p1gh+JwJ1cViZPZ1E15+MB//Ca+jQ0k6jnOzQj2SialN6lsmzEpc4VtT4
   w==;
X-CSE-ConnectionGUID: UlkgB5aIRO29PMy8c/yGSA==
X-CSE-MsgGUID: D2RvijGkSsS8BO7UT10AzA==
X-IronPort-AV: E=McAfee;i="6600,9927,11070"; a="15231210"
X-IronPort-AV: E=Sophos;i="6.08,154,1712646000"; 
   d="scan'208";a="15231210"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 May 2024 13:32:24 -0700
X-CSE-ConnectionGUID: ivuxPwzXTa6VMFtvP2+4eA==
X-CSE-MsgGUID: 5v9pItL8RhmmcapibfBlww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,154,1712646000"; 
   d="scan'208";a="34491775"
Received: from lkp-server01.sh.intel.com (HELO f8b243fe6e68) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 11 May 2024 13:32:23 -0700
Received: from kbuild by f8b243fe6e68 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s5tOG-0007ob-2a;
	Sat, 11 May 2024 20:32:20 +0000
Date: Sun, 12 May 2024 04:31:32 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, dinglongwei <dinglongwei1@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 22374/22416]
 drivers/gpu/drm/nouveau/nvkm/core/object.c:37:17: warning: ISO C90 forbids
 mixed declarations and code
Message-ID: <202405120429.wVDB0LUK-lkp@intel.com>
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
config: arm64-defconfig (https://download.01.org/0day-ci/archive/20240512/202405120429.wVDB0LUK-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240512/202405120429.wVDB0LUK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405120429.wVDB0LUK-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/gpu/drm/nouveau/nvkm/core/object.c: In function 'nvkm_object_search':
>> drivers/gpu/drm/nouveau/nvkm/core/object.c:37:17: warning: ISO C90 forbids mixed declarations and code [-Wdeclaration-after-statement]
      37 |                 struct rb_node *node = client->objroot.rb_node;
         |                 ^~~~~~
   In file included from drivers/gpu/drm/nouveau/nvkm/core/object.c:25:
   drivers/gpu/drm/nouveau/nvkm/core/object.c: In function 'nvkm_object_fini':
   drivers/gpu/drm/nouveau/include/nvkm/core/client.h:41:28: warning: comparison of unsigned expression in '>= 0' is always true [-Wtype-limits]
      41 |         if (_client->debug >= NV_DBG_##l)                                      \
         |                            ^~
   drivers/gpu/drm/nouveau/include/nvkm/core/client.h:45:30: note: in expansion of macro 'nvif_printk'
      45 | #define nvif_fatal(o,f,a...) nvif_printk((o), FATAL, CRIT, f, ##a)
         |                              ^~~~~~~~~~~
   drivers/gpu/drm/nouveau/nvkm/core/object.c:226:25: note: in expansion of macro 'nvif_fatal'
     226 |                         nvif_fatal(object, "failed to restart, %d\n", rret);
         |                         ^~~~~~~~~~


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
