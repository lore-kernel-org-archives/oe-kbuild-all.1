Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.12
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794744687;
	b=VvDfvl+ewwssUiO3cyGmOVU2KpulvQSmm9H/t9y9XBbBHEMu/LRSetAzUipP1yqWdx7H
	 OEyE6n5yQ8L5jcO6ywaZdutM6w4PpTq3BgSRpV0Ju3uzqpzEekw7EYktYiyOOWZ2exVHj
	 KZ2yCJyGpPHIAEfh42PBKk96H9R1CSrNO7DN6X/Q+AtOg39EWvZt05pSGQPBHlIKcuh1+
	 Al2Y8dc1VyK9ImivPGprpa1bV3Hsh8yxv8Zpk6IYtrORMtyFjyuA+Y89nj+YN2NL8bhk2
	 sXIggnvczCRQmoZaqW5sZd8kB6DAxxE2v7pSrDMOq6p8wXoKcORuZICciP8XaubfzUw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794744687;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=evvhVRG23jfktFlMKsuH0VOdWAL55k79EvCHx/nf9Co=;
	b=POHafRexC6a7hswH5kvg4ZFVDtka/VjOku5fK4LubAqaiwI6omHjfXNf7gp7dkFhymP2
	 gx0vp/D/Pr33fGHxp5Sve/4M95vJ5CYf5QPc8TAlXXVncAfqx/YOzolWKmpFKKPcGfCSw
	 iDz6a2z4EywgLvguppYceqyvjSmrqxinDKOI2lhmKOL8lOcV0iXnTIeO4v39jj6dUSF/S
	 T+UNN6J5WrEqtlz9T9XG+UxeWjfjHQG0O9Qh8fV+RyQlwm5FHxbVOQr1xnR9HkPhFP3o2
	 SXNYF54w2I9Oj25bii9+QXnUSbpWUWRWQPV7OAe8rLLXaznCbmqIsIenjG5ncbDXXYg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=MU5rHkPy;
	arc=none smtp.remote-ip=198.175.65.12
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7356606A323
	for <oe-kbuild-all@lists.linux.dev>; Sun, 15 Nov 2026 12:11:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C7356606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=MU5rHkPy
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794744687; x=1826280687;
  h=date:from:to:cc:subject:message-id;
  bh=40W4QgqbdPGvBknrKDAgzBe3zyIgom8xLr1wiDBK9lM=;
  b=MU5rHkPy8+fzrQTuIVlISVz9s3iVuFzJap/Wvcqh7GcgnJX4ZMZ1D69J
   2Ix85yjFpBoLlewBZpIIlkYMkwogtY1LVA9JrwZjKmdjvlLFaXxfGP7vd
   K357eh8UWkVcbJllxSK9DCuaLX12CUDwha82Zyn5OpF7e9DAmB/mH8Tde
   5I8taHqElzNGVqWGbuocvULfZYU8VnbrFz0mseIJM1wdzX09dyYdEHsxR
   jDLjN5JFmU6v+Ww22bqku0G/KSzs5O3S27j6AVQXQGHAxR03j7ep1/WR1
   LExZBOrWA2pqmL8aSeP4BpOFECix/FxvepF4LScH2d1PIaMMMvFcNd2Bj
   A==;
X-CSE-ConnectionGUID: 775e9liuRXCoBkJ7jDa+qw==
X-CSE-MsgGUID: LuZHMR2MSzeW/eyfygTx2g==
X-IronPort-AV: E=McAfee;i="6800,10657,11966"; a="3362550"
X-IronPort-AV: E=Sophos;i="6.27,214,1787036400"; 
   d="scan'208";a="3362550"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Nov 2026 04:11:26 -0800
X-CSE-ConnectionGUID: SlTb1F+rS52sr+XdRSr70w==
X-CSE-MsgGUID: zfX5EbBzTR+055Tqo3YFnQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,214,1787036400"; 
   d="scan'208";a="9480795"
Received: from igk-lkp-server01.igk.intel.com (HELO 1073a420ae3a) ([10.211.93.152])
  by fmviesa002.fm.intel.com with ESMTP; 15 Nov 2026 04:11:25 -0800
Received: from kbuild by 1073a420ae3a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xSZ4s-000000002AY-1eHz;
	Sun, 15 Nov 2026 12:11:22 +0000
Date: Sun, 15 Nov 2026 13:10:57 +0100
From: kernel test robot <lkp@intel.com>
To: Bart Van Assche <bvanassche@acm.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [bvanassche:thread-safety 129/458]
 drivers/block/rbd.c:6915:11: error: expected expression
Message-ID: <202611151332.rUf8OZmx-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

tree:   https://github.com/bvanassche/linux thread-safety
head:   6a8743e9201f9d942f7c93093bf7ce69b48a7eea
commit: f3cd94756e7ca6a33d83ab05e2fe4315f77e4cd4 [129/458] rbd: Add lock context annotations
config: powerpc64-randconfig-2200-20261115 (https://download.01.org/0day-ci/archive/20261115/202611151332.rUf8OZmx-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project cbfac21cd384f6c7c480c2d0026ecedfe2d619e7)
smatch: v0.5.0-9187-g5189e3fb
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261115/202611151332.rUf8OZmx-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611151332.rUf8OZmx-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/block/rbd.c:6915:11: error: expected expression
    6915 |                                __release(&rbd_dev->header_rwsem));
         |                                ^
   include/linux/compiler-context-analysis.h:418:23: note: expanded from macro '__release'
     418 | #define __release(x)            __release_ctx_lock(x)
         |                                 ^
   include/linux/compiler-context-analysis.h:190:36: note: expanded from macro '__release_ctx_lock'
     190 | # define __release_ctx_lock(var)                        do { } while (0)
         |                                                         ^
   1 error generated.


vim +6915 drivers/block/rbd.c

  6875	
  6876	/*
  6877	 * Probe for the existence of the header object for the given rbd
  6878	 * device.  If this image is the one being mapped (i.e., not a
  6879	 * parent), initiate a watch on its header object before using that
  6880	 * object to get detailed information about the rbd image.
  6881	 *
  6882	 * On success, returns with header_rwsem held for write if called
  6883	 * with @depth == 0.
  6884	 */
  6885	static int rbd_dev_image_probe(struct rbd_device *rbd_dev, int depth)
  6886	{
  6887		bool need_watch = !rbd_is_ro(rbd_dev);
  6888		int ret;
  6889	
  6890		/*
  6891		 * Get the id from the image id object.  Unless there's an
  6892		 * error, rbd_dev->spec->image_id will be filled in with
  6893		 * a dynamically-allocated string, and rbd_dev->image_format
  6894		 * will be set to either 1 or 2.
  6895		 */
  6896		ret = rbd_dev_image_id(rbd_dev);
  6897		if (ret)
  6898			return ret;
  6899	
  6900		ret = rbd_dev_header_name(rbd_dev);
  6901		if (ret)
  6902			goto err_out_format;
  6903	
  6904		if (need_watch) {
  6905			ret = rbd_register_watch(rbd_dev);
  6906			if (ret) {
  6907				if (ret == -ENOENT)
  6908					rbd_print_dne(rbd_dev, false);
  6909				goto err_out_format;
  6910			}
  6911		}
  6912	
  6913		if (!depth)
  6914			context_unsafe(down_write(&rbd_dev->header_rwsem),
> 6915				       __release(&rbd_dev->header_rwsem));
  6916	
  6917		ret = rbd_dev_header_info(rbd_dev, &rbd_dev->header, true);
  6918		if (ret) {
  6919			if (ret == -ENOENT && !need_watch)
  6920				rbd_print_dne(rbd_dev, false);
  6921			goto err_out_probe;
  6922		}
  6923	
  6924		rbd_init_layout(rbd_dev);
  6925	
  6926		/*
  6927		 * If this image is the one being mapped, we have pool name and
  6928		 * id, image name and id, and snap name - need to fill snap id.
  6929		 * Otherwise this is a parent image, identified by pool, image
  6930		 * and snap ids - need to fill in names for those ids.
  6931		 */
  6932		if (!depth)
  6933			ret = rbd_spec_fill_snap_id(rbd_dev);
  6934		else
  6935			ret = rbd_spec_fill_names(rbd_dev);
  6936		if (ret) {
  6937			if (ret == -ENOENT)
  6938				rbd_print_dne(rbd_dev, true);
  6939			goto err_out_probe;
  6940		}
  6941	
  6942		ret = rbd_dev_mapping_set(rbd_dev);
  6943		if (ret)
  6944			goto err_out_probe;
  6945	
  6946		if (rbd_is_snap(rbd_dev) &&
  6947		    (rbd_dev->header.features & RBD_FEATURE_OBJECT_MAP)) {
  6948			ret = rbd_object_map_load(rbd_dev);
  6949			if (ret)
  6950				goto err_out_probe;
  6951		}
  6952	
  6953		if (rbd_dev->header.features & RBD_FEATURE_LAYERING) {
  6954			ret = rbd_dev_setup_parent(rbd_dev);
  6955			if (ret)
  6956				goto err_out_probe;
  6957		}
  6958	
  6959		ret = rbd_dev_probe_parent(rbd_dev, depth);
  6960		if (ret)
  6961			goto err_out_probe;
  6962	
  6963		dout("discovered format %u image, header name is %s\n",
  6964			rbd_dev->image_format, rbd_dev->header_oid.name);
  6965		return 0;
  6966	
  6967	err_out_probe:
  6968		if (!depth)
  6969			context_unsafe(up_write(&rbd_dev->header_rwsem));
  6970		if (need_watch)
  6971			rbd_unregister_watch(rbd_dev);
  6972		rbd_dev_unprobe(rbd_dev);
  6973	err_out_format:
  6974		rbd_dev->image_format = 0;
  6975		kfree(rbd_dev->spec->image_id);
  6976		rbd_dev->spec->image_id = NULL;
  6977		return ret;
  6978	}
  6979	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
