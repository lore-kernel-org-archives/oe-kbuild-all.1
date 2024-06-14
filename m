Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B8DF1922D1
	for <oe-kbuild-all@lists.linux.dev>; Fri, 14 Jun 2024 09:26:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718357211; cv=none; b=Dcb9HKR04Xf+F3OfW8jE1vynM2/FNkPr5INLvSaA7PCZsnrUnXcVgO/I2UOJqiYGH49R3rM27PNu7AkrbY3EUyVS5hj7ugVWf8Asyoj5zgYIPlRXF4XMlk2NJHXsUMW50/vZXrA7vONMa5PtEyHhwXxkDvnD/X4q2jMYXy1QD00=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718357211; c=relaxed/simple;
	bh=IMtzBV1pErSFPJgyHeaxzRW0J3D2ZKRFJq3CJTduaws=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sWAKz7OUbpJuMxvr/q963vhfrtyS2EN/MIA/aQldtPjL02MdHwKeHElZvcxryU/U03nr2gVZmttdX4kVqjEOTPkkwjFDC0r80enruk4ypiXXIaDNzaebMo+KTWIxBGq29edDwamcDbTHeSQ844iyYf+F5Uszx3QXQDTKWIMtr0c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dQTNH+qs; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dQTNH+qs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718357209; x=1749893209;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=IMtzBV1pErSFPJgyHeaxzRW0J3D2ZKRFJq3CJTduaws=;
  b=dQTNH+qsFHkRpvz9Y8EG6oE0uTGqJVOY0+55GsnDLJHOG0qAb0oEVmZ5
   VST1clC+k39PeeTof7yL2ewQPjal27djAzqzmYj2R176KUWeJviptzGqa
   qRWOjxxZFPUGbmcoCr7yuRCObGULctx/MwbAYAQVqToMkKtyswZy2IPwQ
   3j/mgaAzmLSSLWCZfAAiXbIfFt8Z7bpF+1WnnKiIqp9RuoQ08GuLVjrRG
   x33hzwwO7ebv5iNRFzC/X/bJgYi6MvJlm3B+LrV8OUTg4bXwTdLGoGIbm
   sw5j0/tCxU7Lof29SJGBYa0qC4fawxsGRoyMwmt6SoNmPLTPIYddKDf8P
   A==;
X-CSE-ConnectionGUID: JWLdMtPkQl+75YjOk3ADqg==
X-CSE-MsgGUID: yQ4smPATSj2Sq+vyBNBC2Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11102"; a="15395623"
X-IronPort-AV: E=Sophos;i="6.08,237,1712646000"; 
   d="scan'208";a="15395623"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jun 2024 02:26:49 -0700
X-CSE-ConnectionGUID: GEVRcPSFQN+cpBO9f1z5Nw==
X-CSE-MsgGUID: u4a3bPOkQWe0ZMyCF1wHWQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,237,1712646000"; 
   d="scan'208";a="40335222"
Received: from lkp-server01.sh.intel.com (HELO 9e3ee4e9e062) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 14 Jun 2024 02:26:48 -0700
Received: from kbuild by 9e3ee4e9e062 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sI3Cn-000156-37;
	Fri, 14 Jun 2024 09:26:45 +0000
Date: Fri, 14 Jun 2024 17:26:27 +0800
From: kernel test robot <lkp@intel.com>
To: Yonghong Song <yonghong.song@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH bpf-next] bpf: Support shadow stack for bpf progs
Message-ID: <202406141719.ilJ36VlE-lkp@intel.com>
References: <20240610051839.1296086-1-yonghong.song@linux.dev>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240610051839.1296086-1-yonghong.song@linux.dev>

Hi Yonghong,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on bpf-next/master]

url:    https://github.com/intel-lab-lkp/linux/commits/Yonghong-Song/bpf-Support-shadow-stack-for-bpf-progs/20240610-132108
base:   https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next.git master
patch link:    https://lore.kernel.org/r/20240610051839.1296086-1-yonghong.song%40linux.dev
patch subject: [RFC PATCH bpf-next] bpf: Support shadow stack for bpf progs
config: x86_64-randconfig-123-20240614 (https://download.01.org/0day-ci/archive/20240614/202406141719.ilJ36VlE-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240614/202406141719.ilJ36VlE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406141719.ilJ36VlE-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> kernel/bpf/syscall.c:2247:30: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void [noderef] __percpu *__pdata @@     got void *percpu_shadow_stack_ptr @@
   kernel/bpf/syscall.c:2247:30: sparse:     expected void [noderef] __percpu *__pdata
   kernel/bpf/syscall.c:2247:30: sparse:     got void *percpu_shadow_stack_ptr

vim +2247 kernel/bpf/syscall.c

  2240	
  2241	static void __bpf_prog_put_rcu(struct rcu_head *rcu)
  2242	{
  2243		struct bpf_prog_aux *aux = container_of(rcu, struct bpf_prog_aux, rcu);
  2244	
  2245		kvfree(aux->func_info);
  2246		kfree(aux->func_info_aux);
> 2247		free_percpu(aux->prog->percpu_shadow_stack_ptr);
  2248		free_uid(aux->user);
  2249		security_bpf_prog_free(aux->prog);
  2250		bpf_prog_free(aux->prog);
  2251	}
  2252	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
