Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF633179A3
	for <oe-kbuild-all@lists.linux.dev>; Mon, 22 Sep 2025 09:32:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758533551; cv=none; b=Ts+Sshk7KWTzhJ3WSS/7KZzJ0dsMrry8+3PH4u06ANbtAk7rsJiM1WnckzlTrZuQQoS+BVBksJ9+eRcylYoN0Pgyuctt8TvCk4/+pFzzKlzkFpAR1/bsKLT2QvTHLC1zAm6ISi1CE5i5vR9g98SyzhYVePH2HaZZ6txLF1Kf8os=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758533551; c=relaxed/simple;
	bh=2YDZrSEATZ6kLH6IsI5Xri50mQ5soa/RMue8knhrt/k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hBy++OHqvyzI3Tz0epag84Qj8nYSOYD/w9tgH0RvduufN6k61HWZn/oGZ9eb2avVWiKWkFa2zN+rWm4QgJMtUPYODvGzBNcU8opjqevjBmCXssYZjRqn4d06rCqbOfGaXIzxfMRcKzPjMfBOR2GeTM+7ABZa9LZm0A3VUp4EZ14=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QZvRFXqf; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QZvRFXqf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758533549; x=1790069549;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=2YDZrSEATZ6kLH6IsI5Xri50mQ5soa/RMue8knhrt/k=;
  b=QZvRFXqfiaH9dDV5HvbWeVI3zO26dzmbD1Eo6FCSHxPu1ByJZ93MB+7f
   eUHSfYefCh/1+RR2jDzNEibE9BvtTMf+GbrJ9o5mR/jBIpymqEQ5vRDJi
   VDi/B2EqkXWy8GMysc+xBloNpXDxVcEJMmEJvzxBk+nSbJEU0W7pJRNoK
   TpZyTQf6F2QoD6SgnZWnHwug7t2tm1UjrlXododZrIohVp6yAZ//ntbZS
   3Cl4n42/HgaCxxBCgKMDfq51ttBJR8wFvbyPrbVh5/5vaEQxThjMTqn1H
   r3cBd+vTEia/ZaAZ2fg0XktI3Gz4IwlNPmyT3ryHYlN+AOfCHFa+UHpup
   w==;
X-CSE-ConnectionGUID: JIq2E64qRQal71J2FwXOhQ==
X-CSE-MsgGUID: HNwB2WG8TxOvZvdWLcrwtA==
X-IronPort-AV: E=McAfee;i="6800,10657,11560"; a="60909729"
X-IronPort-AV: E=Sophos;i="6.18,284,1751266800"; 
   d="scan'208";a="60909729"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Sep 2025 02:32:29 -0700
X-CSE-ConnectionGUID: ipzhFrwyQaabiR6N8psGFg==
X-CSE-MsgGUID: hHNjkIuSST6/LqtxF5nVQw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,284,1751266800"; 
   d="scan'208";a="176001970"
Received: from lkp-server02.sh.intel.com (HELO 84c55410ccf6) ([10.239.97.151])
  by orviesa009.jf.intel.com with ESMTP; 22 Sep 2025 02:32:28 -0700
Received: from kbuild by 84c55410ccf6 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v0ctx-0001WD-20;
	Mon, 22 Sep 2025 09:32:19 +0000
Date: Mon, 22 Sep 2025 17:32:03 +0800
From: kernel test robot <lkp@intel.com>
To: Eugenio =?iso-8859-1?Q?P=E9rez?= <eperezma@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v3 4/6] vduse: return internal vq group struct as map
 token
Message-ID: <202509221754.NH0388QX-lkp@intel.com>
References: <20250919093359.961296-5-eperezma@redhat.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250919093359.961296-5-eperezma@redhat.com>

Hi Eugenio,

kernel test robot noticed the following build warnings:

[auto build test WARNING on mst-vhost/linux-next]
[also build test WARNING on next-20250919]
[cannot apply to linus/master v6.17-rc7]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Eugenio-P-rez/vduse-make-domain_lock-an-rwlock/20250919-174108
base:   https://git.kernel.org/pub/scm/linux/kernel/git/mst/vhost.git linux-next
patch link:    https://lore.kernel.org/r/20250919093359.961296-5-eperezma%40redhat.com
patch subject: [PATCH v3 4/6] vduse: return internal vq group struct as map token
config: microblaze-randconfig-r073-20250921 (https://download.01.org/0day-ci/archive/20250922/202509221754.NH0388QX-lkp@intel.com/config)
compiler: microblaze-linux-gcc (GCC) 12.5.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509221754.NH0388QX-lkp@intel.com/

smatch warnings:
drivers/vdpa/vdpa_user/vduse_dev.c:634 vduse_get_vq_map() warn: unsigned 'vq_group' is never less than zero.
drivers/vdpa/vdpa_user/vduse_dev.c:634 vduse_get_vq_map() warn: error code type promoted to positive: 'vq_group'

vim +/vq_group +634 drivers/vdpa/vdpa_user/vduse_dev.c

   627	
   628	static union virtio_map vduse_get_vq_map(struct vdpa_device *vdpa, u16 idx)
   629	{
   630		struct vduse_dev *dev = vdpa_to_vduse(vdpa);
   631		u32 vq_group = vduse_get_vq_group(vdpa, idx);
   632		union virtio_map ret;
   633	
 > 634		if (vq_group < 0)
   635			ret.group = NULL;
   636		else
   637			ret.group = &dev->groups[vq_group];
   638	
   639		return ret;
   640	}
   641	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
