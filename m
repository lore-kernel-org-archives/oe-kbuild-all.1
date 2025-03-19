Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F00E0BE6C
	for <oe-kbuild-all@lists.linux.dev>; Wed, 19 Mar 2025 20:19:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742415551; cv=none; b=lthPkUggaEX2wGrP37hd7vGLsiyg8wCXYj+q2VpUQIkSWQmbWjZaZCDxFWN+1cXOGAPNj2Vh/rC2TsfmUPOwaIgpYzioymYIFX1zKZqWRl6q/JdCV+qRY8hrCxZamawKvZyYJWR2ThWVXYNecmXc5mjha6QV6MCSHC2Yerrs1YE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742415551; c=relaxed/simple;
	bh=NtFZoHvTe3bI2G45foSs5BR/D+0hOylvG5z2xWKZv2g=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=NToifmyZIfdVqSaP/kDmyTt53WPyefocr/p+h4OJd4uGPA4jkku8miUcne+SxZVA4yPeMQiCRPZfwFwGt9inD2I0L5bxgdskbV9LYvdBCqGjDqWnUpki74izaAvW7doHF78Ysht+i1w5XZXUmf1Y/VxnuS8fa7sInPqVoTICNt8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XxEY+VZl; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XxEY+VZl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1742415549; x=1773951549;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=NtFZoHvTe3bI2G45foSs5BR/D+0hOylvG5z2xWKZv2g=;
  b=XxEY+VZlU0xo24WOPelUUrGT/hP8XUX77MYD5xPQo/pDlpkOurYyqgtJ
   NCQFIKrXSSR++InDXNYBA9LkkTjKU66Z7EwDvFipIi9K0PMvQNpnHOyd7
   A4c253uTvE9RJJsWBOE+t51vQ+jZ00IYAm9KWom2154CKXUbuZdOJxKub
   cGUDuJH/y0XUwk44kkrHaqiGpC96Ofn/hfFA05TAhEqPxyrGdGNUwiNgV
   xBw28HgZBmg5gbJ4kAQGBBt7/tJo6N50Nnhhqh/3KuKK0AGVFVje7VhY+
   o9NoVdFGQsW4+cNqb+21ljN7K08M6V2NnmXYL7y4IHB3fmekwVPy/NyTe
   g==;
X-CSE-ConnectionGUID: hRM5010OQkGZ0McQVWtY6g==
X-CSE-MsgGUID: lblF5ShLSNOo9RpkmMP9Ng==
X-IronPort-AV: E=McAfee;i="6700,10204,11378"; a="55006700"
X-IronPort-AV: E=Sophos;i="6.14,259,1736841600"; 
   d="scan'208";a="55006700"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Mar 2025 13:19:08 -0700
X-CSE-ConnectionGUID: GAxwWoKJTW2RWG42Cb18NQ==
X-CSE-MsgGUID: cMjWDS8SRoCBieatTsN7Tw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,259,1736841600"; 
   d="scan'208";a="159979509"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 19 Mar 2025 13:19:07 -0700
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tuzrs-000Fdy-0m;
	Wed, 19 Mar 2025 20:18:34 +0000
Date: Thu, 20 Mar 2025 04:17:38 +0800
From: kernel test robot <lkp@intel.com>
To: Nilay Shroff <nilay@linux.ibm.com>
Cc: oe-kbuild-all@lists.linux.dev, Jens Axboe <axboe@kernel.dk>
Subject: [axboe-block:for-6.15/block 68/68] block/blk-iocost.c:3232:6:
 warning: variable 'ret' is used uninitialized whenever 'if' condition is
 true
Message-ID: <202503200454.QWpwKeJu-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.git for-6.15/block
head:   9730763f4756e32520cb86778331465e8d063a8f
commit: 9730763f4756e32520cb86778331465e8d063a8f [68/68] block: correct locking order for protecting blk-wbt parameters
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20250320/202503200454.QWpwKeJu-lkp@intel.com/config)
compiler: clang version 20.1.0 (https://github.com/llvm/llvm-project 24a30daaa559829ad079f2ff7f73eb4e18095f88)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250320/202503200454.QWpwKeJu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503200454.QWpwKeJu-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> block/blk-iocost.c:3232:6: warning: variable 'ret' is used uninitialized whenever 'if' condition is true [-Wsometimes-uninitialized]
    3232 |         if (IS_ERR_VALUE(memflags))
         |             ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/err.h:28:25: note: expanded from macro 'IS_ERR_VALUE'
      28 | #define IS_ERR_VALUE(x) unlikely((unsigned long)(void *)(x) >= (unsigned long)-MAX_ERRNO)
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:77:22: note: expanded from macro 'unlikely'
      77 | # define unlikely(x)    __builtin_expect(!!(x), 0)
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~
   block/blk-iocost.c:3358:9: note: uninitialized use occurs here
    3358 |         return ret;
         |                ^~~
   block/blk-iocost.c:3232:2: note: remove the 'if' if its condition is always false
    3232 |         if (IS_ERR_VALUE(memflags))
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~
    3233 |                 goto err;
         |                 ~~~~~~~~
   block/blk-iocost.c:3227:9: note: initialize the variable 'ret' to silence this warning
    3227 |         int ret;
         |                ^
         |                 = 0
   1 warning generated.


vim +3232 block/blk-iocost.c

  3216	
  3217	static ssize_t ioc_qos_write(struct kernfs_open_file *of, char *input,
  3218				     size_t nbytes, loff_t off)
  3219	{
  3220		struct blkg_conf_ctx ctx;
  3221		struct gendisk *disk;
  3222		struct ioc *ioc;
  3223		u32 qos[NR_QOS_PARAMS];
  3224		bool enable, user;
  3225		char *body, *p;
  3226		unsigned long memflags;
  3227		int ret;
  3228	
  3229		blkg_conf_init(&ctx, input);
  3230	
  3231		memflags = blkg_conf_open_bdev_frozen(&ctx);
> 3232		if (IS_ERR_VALUE(memflags))
  3233			goto err;
  3234	
  3235		body = ctx.body;
  3236		disk = ctx.bdev->bd_disk;
  3237		if (!queue_is_mq(disk->queue)) {
  3238			ret = -EOPNOTSUPP;
  3239			goto err;
  3240		}
  3241	
  3242		ioc = q_to_ioc(disk->queue);
  3243		if (!ioc) {
  3244			ret = blk_iocost_init(disk);
  3245			if (ret)
  3246				goto err;
  3247			ioc = q_to_ioc(disk->queue);
  3248		}
  3249	
  3250		blk_mq_quiesce_queue(disk->queue);
  3251	
  3252		spin_lock_irq(&ioc->lock);
  3253		memcpy(qos, ioc->params.qos, sizeof(qos));
  3254		enable = ioc->enabled;
  3255		user = ioc->user_qos_params;
  3256	
  3257		while ((p = strsep(&body, " \t\n"))) {
  3258			substring_t args[MAX_OPT_ARGS];
  3259			char buf[32];
  3260			int tok;
  3261			s64 v;
  3262	
  3263			if (!*p)
  3264				continue;
  3265	
  3266			switch (match_token(p, qos_ctrl_tokens, args)) {
  3267			case QOS_ENABLE:
  3268				if (match_u64(&args[0], &v))
  3269					goto einval;
  3270				enable = v;
  3271				continue;
  3272			case QOS_CTRL:
  3273				match_strlcpy(buf, &args[0], sizeof(buf));
  3274				if (!strcmp(buf, "auto"))
  3275					user = false;
  3276				else if (!strcmp(buf, "user"))
  3277					user = true;
  3278				else
  3279					goto einval;
  3280				continue;
  3281			}
  3282	
  3283			tok = match_token(p, qos_tokens, args);
  3284			switch (tok) {
  3285			case QOS_RPPM:
  3286			case QOS_WPPM:
  3287				if (match_strlcpy(buf, &args[0], sizeof(buf)) >=
  3288				    sizeof(buf))
  3289					goto einval;
  3290				if (cgroup_parse_float(buf, 2, &v))
  3291					goto einval;
  3292				if (v < 0 || v > 10000)
  3293					goto einval;
  3294				qos[tok] = v * 100;
  3295				break;
  3296			case QOS_RLAT:
  3297			case QOS_WLAT:
  3298				if (match_u64(&args[0], &v))
  3299					goto einval;
  3300				qos[tok] = v;
  3301				break;
  3302			case QOS_MIN:
  3303			case QOS_MAX:
  3304				if (match_strlcpy(buf, &args[0], sizeof(buf)) >=
  3305				    sizeof(buf))
  3306					goto einval;
  3307				if (cgroup_parse_float(buf, 2, &v))
  3308					goto einval;
  3309				if (v < 0)
  3310					goto einval;
  3311				qos[tok] = clamp_t(s64, v * 100,
  3312						   VRATE_MIN_PPM, VRATE_MAX_PPM);
  3313				break;
  3314			default:
  3315				goto einval;
  3316			}
  3317			user = true;
  3318		}
  3319	
  3320		if (qos[QOS_MIN] > qos[QOS_MAX])
  3321			goto einval;
  3322	
  3323		if (enable && !ioc->enabled) {
  3324			blk_stat_enable_accounting(disk->queue);
  3325			blk_queue_flag_set(QUEUE_FLAG_RQ_ALLOC_TIME, disk->queue);
  3326			ioc->enabled = true;
  3327		} else if (!enable && ioc->enabled) {
  3328			blk_stat_disable_accounting(disk->queue);
  3329			blk_queue_flag_clear(QUEUE_FLAG_RQ_ALLOC_TIME, disk->queue);
  3330			ioc->enabled = false;
  3331		}
  3332	
  3333		if (user) {
  3334			memcpy(ioc->params.qos, qos, sizeof(qos));
  3335			ioc->user_qos_params = true;
  3336		} else {
  3337			ioc->user_qos_params = false;
  3338		}
  3339	
  3340		ioc_refresh_params(ioc, true);
  3341		spin_unlock_irq(&ioc->lock);
  3342	
  3343		if (enable)
  3344			wbt_disable_default(disk);
  3345		else
  3346			wbt_enable_default(disk);
  3347	
  3348		blk_mq_unquiesce_queue(disk->queue);
  3349	
  3350		blkg_conf_exit_frozen(&ctx, memflags);
  3351		return nbytes;
  3352	einval:
  3353		spin_unlock_irq(&ioc->lock);
  3354		blk_mq_unquiesce_queue(disk->queue);
  3355		ret = -EINVAL;
  3356	err:
  3357		blkg_conf_exit_frozen(&ctx, memflags);
  3358		return ret;
  3359	}
  3360	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
