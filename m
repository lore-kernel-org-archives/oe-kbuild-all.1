Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44278F4FA
	for <oe-kbuild-all@lists.linux.dev>; Sat, 23 Nov 2024 05:58:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732341495; cv=none; b=KVnxGF05015XjU8c3FxPMDaop5GqPhthlFO40gfkHfDqockL0qttMJfJV3yywLiwNasBHfMwq27te/C3eAM7Ofhs1Af6OJMRMQcCMGYd2SL+2jnJ+Q915a/0zEyqWOkU7R+LeiCDR3KjCLKaS3EnZIBrJXmKV1efMp6iGIV0qLM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732341495; c=relaxed/simple;
	bh=c+qYM1E3v6l2gY+YGSwd4L2bfCiBmE0Qx2+UsXe+UTE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=DYwp8ArWZYLt/ZAaS/yoI8LYwMcie0wVajqv7msyC0DRo3bk97sHf49ODfqVBQfs5ricE3lewRZTh1JLPpTZkuLdxFJ5YuDuW4R2PDQjq2bL/sKQWBdef4qgQa3Dl14yrFcpHq9COgQ5AQaq5o57mXmT0pjSr2qsRvwS8IMyBH8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iLO9lZqi; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iLO9lZqi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732341494; x=1763877494;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=c+qYM1E3v6l2gY+YGSwd4L2bfCiBmE0Qx2+UsXe+UTE=;
  b=iLO9lZqiUOXYn55hX2x8uh0FtVMnaO1xVZUyj1ddZoBUXZMh8pM2Mc+t
   0lVII2rbb/54xgzj4xwKoWP7bSFt35kI1PDVyLxuLLQyNxIcn5t8Feu7L
   sGQ3XKh2YKvsQUZZcT9qIKhiGbwY2xAsJWJPH0/WeMlCbVd3KcdajNYYy
   shUJPJfEekPvmlk6X0uaRxCqZu3P+uiyCWJf6MY/SiuwCEA/IlvCRFJq8
   6w6jNtD6aAmQXsLQSIX+WvzdEMrDWszw3SsrEfAifAOwW0ESiKqHnV1CK
   DY2yyCCMIm35jDm5qtoKVbOGdA7Sc7GSnCsD9lchAitEEbiNBWRL40qqU
   g==;
X-CSE-ConnectionGUID: IB1tMcyISgu8JS6bm/wNdQ==
X-CSE-MsgGUID: 93ELKt/IRiC7OePQ7boaxQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11264"; a="20092036"
X-IronPort-AV: E=Sophos;i="6.12,177,1728975600"; 
   d="scan'208";a="20092036"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Nov 2024 21:58:14 -0800
X-CSE-ConnectionGUID: sabx1/LHQfihcjWFtYN7og==
X-CSE-MsgGUID: 5jkiKJbrTt2mAcEEUwYdkg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,177,1728975600"; 
   d="scan'208";a="90685239"
Received: from lkp-server01.sh.intel.com (HELO 8122d2fc1967) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 22 Nov 2024 21:58:12 -0800
Received: from kbuild by 8122d2fc1967 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tEj9m-0004SF-16;
	Sat, 23 Nov 2024 05:58:10 +0000
Date: Sat, 23 Nov 2024 13:57:45 +0800
From: kernel test robot <lkp@intel.com>
To: SeongJae Park <sj@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [sj:damon/next 53/59] mm/damon/core.c:1207: warning: bad line:
Message-ID: <202411231318.5NR1XkPk-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/sj/linux.git damon/next
head:   78907e9aaa2afc17557ccada5eeafa2f4423ddcc
commit: d9418cac100e220d93d44553fd8c9bc713dc2eb4 [53/59] mm/damon/core: implement damon_call()
config: x86_64-rhel-9.4 (https://download.01.org/0day-ci/archive/20241123/202411231318.5NR1XkPk-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241123/202411231318.5NR1XkPk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411231318.5NR1XkPk-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> mm/damon/core.c:1207: warning: bad line: 


vim +1207 mm/damon/core.c

  1196	
  1197	/**
  1198	 * damon_call() - Invoke a given function on a DAMON worker thread.
  1199	 * @ctx:	DAMON context to execute the function for.
  1200	 * @control:	Structure saving call request and result.
  1201	 *
  1202	 * Ask DAMON worker thread of @ctx to call a given function as specified in
  1203	 * @control and wait for the result.  The function can hence safely access the
  1204	 * internal data of &struct damon_ctx including &struct damon_region objects
  1205	 * without additional locking.  The return code of the callback function will
  1206	 * be saved in &->return_code of @control.
> 1207	
  1208	 * If DAMON is deactivated by watermarks or terminated before the function is
  1209	 * called back, the request is canceled.
  1210	 *
  1211	 * Return: 0 on success, negative error code otherwise.
  1212	 */
  1213	int damon_call(struct damon_ctx *ctx, struct damon_call_control *control)
  1214	{
  1215		init_completion(&control->completion);
  1216		control->canceled = false;
  1217	
  1218		mutex_lock(&ctx->call_control_lock);
  1219		if (ctx->call_control) {
  1220			mutex_unlock(&ctx->call_control_lock);
  1221			return -EBUSY;
  1222		}
  1223		ctx->call_control = control;
  1224		mutex_unlock(&ctx->call_control_lock);
  1225		if (!damon_is_running(ctx))
  1226			return -EINVAL;
  1227		wait_for_completion(&control->completion);
  1228		if (control->canceled)
  1229			return -ECANCELED;
  1230		return 0;
  1231	}
  1232	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
