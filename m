Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8ADAA341661
	for <oe-kbuild-all@lists.linux.dev>; Wed, 22 Oct 2025 12:57:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761137828; cv=none; b=M6WCbvO+rB6++slCaWckyWefQ3Qm/lzNThxGlis6RLFZGs4YeD/WUDCji/Z1rfoiwE0vDW6tNIMwIQPSjQsjGVSTBsQiyPrQiBS5ntuutlhrLqRytEgHxnxKJdOiZ9h4A0E0SFtt7aEjAeCYQ8bqMxnGjT565wCKuZ5AsQJrS8g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761137828; c=relaxed/simple;
	bh=AqQlMvI2vSD5riisS5S/+jY3loOsUP7xLWLZ0Cmx7Dg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rSUDZo44zz/qb6aEdMRUYFDGRqolroKr1k8UYmSxKhBAP74QmuNqIWWvlcyAboDCwqVyUJDCxOCGAb2sIWbJ2AjSUfejNSHXkSvlZE/3SOPOp1OM/78CFyEzFRiKfY5TGlVIhaltvJmQNPlWkrKK42kkLuWjtKzNiIw8SnO7W1w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FbwKCRYH; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FbwKCRYH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761137826; x=1792673826;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=AqQlMvI2vSD5riisS5S/+jY3loOsUP7xLWLZ0Cmx7Dg=;
  b=FbwKCRYHEsl9QcvrfaBzN3wwHlvqO1h5R44/MsIV96r8kNpgbtLhh1dW
   4AHk7ZgRTs0a6VvF4eZJ8zwHcHgYI6kpPZI+Ol1RvtOQWgnmwnhwyayXO
   en+78vsyTjR4dE86TShWvvx9k/tXtq8hDRqThYPnubGZMFvBt+mpJSUfB
   96OPuZAdMuyxZC/yenCV7VekdTiNuk9T443VLV27XUEFkYpLVc0CsrnVq
   7LVa5MBBEb009NbvhtzchRHPQX1SmwWNOQYejz8LrTxUcyYpD3GEn3GIc
   4eICp/bSLcvNOGX2/PKpSKH+k3j3F0Iy/7YANKcBBTmkRDD6Ie/Z3PG/h
   w==;
X-CSE-ConnectionGUID: cGi6oldFScSjWhRukUvxlg==
X-CSE-MsgGUID: UUs0wGwXQuitZqt51gRqNw==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="50857957"
X-IronPort-AV: E=Sophos;i="6.19,247,1754982000"; 
   d="scan'208";a="50857957"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Oct 2025 05:57:06 -0700
X-CSE-ConnectionGUID: MLHm8QMpRy+3lOI9ToCtlg==
X-CSE-MsgGUID: vgV2GENUTA6uDZEP8Q8w7w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,247,1754982000"; 
   d="scan'208";a="214809222"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa001.fm.intel.com with ESMTP; 22 Oct 2025 05:57:05 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vBYOl-000CNV-02;
	Wed, 22 Oct 2025 12:57:03 +0000
Date: Wed, 22 Oct 2025 20:56:45 +0800
From: kernel test robot <lkp@intel.com>
To: Bernd Schubert <bschubert@ddn.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH RFC] fuse: check if system-wide io_uring is enabled
Message-ID: <202510222025.DUKxC3Zc-lkp@intel.com>
References: <20251021-io-uring-fix-check-systemwide-io-uring-enable-v1-1-01d4b4a8ef4f@ddn.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251021-io-uring-fix-check-systemwide-io-uring-enable-v1-1-01d4b4a8ef4f@ddn.com>

Hi Bernd,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on 6548d364a3e850326831799d7e3ea2d7bb97ba08]

url:    https://github.com/intel-lab-lkp/linux/commits/Bernd-Schubert/fuse-check-if-system-wide-io_uring-is-enabled/20251022-043238
base:   6548d364a3e850326831799d7e3ea2d7bb97ba08
patch link:    https://lore.kernel.org/r/20251021-io-uring-fix-check-systemwide-io-uring-enable-v1-1-01d4b4a8ef4f%40ddn.com
patch subject: [PATCH RFC] fuse: check if system-wide io_uring is enabled
config: x86_64-buildonly-randconfig-002-20251022 (https://download.01.org/0day-ci/archive/20251022/202510222025.DUKxC3Zc-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251022/202510222025.DUKxC3Zc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510222025.DUKxC3Zc-lkp@intel.com/

All warnings (new ones prefixed by >>):

   fs/fuse/inode.c: In function 'check_system_io_uring':
>> fs/fuse/inode.c:1944:13: warning: variable 'allowed' set but not used [-Wunused-but-set-variable]
    1944 |         int allowed;
         |             ^~~~~~~


vim +/allowed +1944 fs/fuse/inode.c

  1938	
  1939	/* Check if system wide io-uring is enabled */
  1940	static void check_system_io_uring(struct fuse_conn *fc, struct fuse_fs_context *ctx)
  1941	{
  1942		struct cred *new_cred = NULL;
  1943		const struct cred *old_cred = NULL;
> 1944		int allowed;
  1945	
  1946		/*
  1947		 * Mount might be from an unprivileged user using s-bit
  1948		 * fusermount, the check if system wide io-uring is enabled
  1949		 * needs to drop privileges
  1950		 * then.
  1951		 */
  1952		if (ctx->user_id.val != 0 && ctx->group_id.val != 0) {
  1953			new_cred = prepare_creds();
  1954			if (!new_cred)
  1955				return;
  1956	
  1957			cap_clear(new_cred->cap_effective);
  1958			cap_clear(new_cred->cap_permitted);
  1959			cap_clear(new_cred->cap_inheritable);
  1960	
  1961			if (ctx->user_id_present)
  1962				new_cred->uid = new_cred->euid = ctx->user_id;
  1963	
  1964			if (ctx->group_id_present)
  1965				new_cred->gid = new_cred->egid = new_cred->fsgid = ctx->group_id;
  1966	
  1967			old_cred = override_creds(new_cred);
  1968		}
  1969	
  1970		allowed = io_uring_allowed();
  1971		fc->system_io_uring = io_uring_allowed() == 0;
  1972	
  1973		if (old_cred)
  1974			revert_creds(old_cred);
  1975		if (new_cred)
  1976			put_cred(new_cred);
  1977	}
  1978	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
