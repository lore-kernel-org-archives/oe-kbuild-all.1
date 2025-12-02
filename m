Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9941B23AB95
	for <oe-kbuild-all@lists.linux.dev>; Tue,  2 Dec 2025 12:11:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764677487; cv=none; b=ss7SnCwJoq71wt7WwodH4XLtqN2Ex6HrAxQQM00YeIArdPMIplFf7mrS+9BHXK1AJoRTHN8PsGaufavcPCnyggpa5CJ4/sHxL6kIq2e2SnabqkX+JtdGGTIullYnpN1i/WEGnIK/Lup66mAP+5E1kkedFfMTCB1HiGgYCVTrEmo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764677487; c=relaxed/simple;
	bh=EIok8rhIXhrAROenG9EGV0IzvpUgt2/Onc49sDAQad0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Zijjqa9kXV11+IRwMHh2k1swbiILbyrTNpIpOD/UpOAtmbuwoqc0gKfC2sBuhG5BfnLaEa89chJWAz3+6lqVQAjCZmabGAYX6rBRtjRMu0lPkAyNjywh3ANfJv4zdLYDWOx87zk3cDWRU+I1DF9UJG2XZOPhFnZU7BVXGA1e2Og=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UP23sMnZ; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UP23sMnZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764677486; x=1796213486;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=EIok8rhIXhrAROenG9EGV0IzvpUgt2/Onc49sDAQad0=;
  b=UP23sMnZm5c7I1am0YUaZlYmIw+K5JqPZKKCHU0i5N8gEl7OsEo5bnPv
   ED7gxlYq0q5IkT0/Bx9GmQ2cZShBKv72EOmqKpru/ikE3Gj1MeIYko3ZV
   fP3gK7cm9jFrKQrCuUklLb0VAqpF6TfrjsIsqw4UpPA/6LgVm4+K5kb3y
   HhZhht8VHhTElriOVIgjlXFImWsW4/SEorDy/bL6XZWWRS8+RJrT6Me9B
   2f+9IHhI0VUGM9ocXnL6Fmv/cKk5S3tOTqO7qo8MC3BH/k9tlPLAhs+4t
   5LMR1ajEDWQkA5Fc5M08eEIlHzmDd6GBjWOysZzcUCuYFq89bTjtrw11l
   g==;
X-CSE-ConnectionGUID: ahNJ1o9WTMCzhazAu5ZIog==
X-CSE-MsgGUID: l6aLDJlVQ/GCML7YZDC4qA==
X-IronPort-AV: E=McAfee;i="6800,10657,11630"; a="66596351"
X-IronPort-AV: E=Sophos;i="6.20,242,1758610800"; 
   d="scan'208";a="66596351"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Dec 2025 04:11:25 -0800
X-CSE-ConnectionGUID: o3wHZFCXT8aUc5cxwf48zw==
X-CSE-MsgGUID: ESuxkGQpTs2lGi+va0QyGg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,242,1758610800"; 
   d="scan'208";a="225325727"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 02 Dec 2025 04:11:24 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vQPE2-000000009ny-16Eb;
	Tue, 02 Dec 2025 12:11:22 +0000
Date: Tue, 2 Dec 2025 20:10:23 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android14-6.1 2/2] kernel/fork.c:1291:18-25:
 WARNING: kzalloc should be used for mm -> abi_extend, instead of
 kmalloc/memset
Message-ID: <202512022029.VcUfX2Zs-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android14-6.1
head:   5b6cecf56c7250013e532423509fd9aa77e53456
commit: 5b6cecf56c7250013e532423509fd9aa77e53456 [2/2] ANDROID: ABI: refresh, CRC fixups and allowed breaks
config: i386-randconfig-051-20251202 (https://download.01.org/0day-ci/archive/20251202/202512022029.VcUfX2Zs-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512022029.VcUfX2Zs-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> kernel/fork.c:1291:18-25: WARNING: kzalloc should be used for mm -> abi_extend, instead of kmalloc/memset

vim +1291 kernel/fork.c

  1277	
  1278	/*
  1279	 * Allocate and initialize an mm_struct.
  1280	 */
  1281	struct mm_struct *mm_alloc(void)
  1282	{
  1283		struct mm_struct *mm;
  1284	
  1285		mm = allocate_mm();
  1286		if (!mm)
  1287			return NULL;
  1288	
  1289		memset(mm, 0, sizeof(*mm));
  1290	
> 1291		mm->abi_extend = kmalloc(sizeof(*mm->abi_extend), GFP_KERNEL);
  1292		if (!mm->abi_extend) {
  1293			free_mm(mm);
  1294			return NULL;
  1295		}
  1296		memset(mm->abi_extend, 0, sizeof(*mm->abi_extend));
  1297	
  1298		return mm_init(mm, current, current_user_ns());
  1299	}
  1300	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
