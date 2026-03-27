Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB9C9340283
	for <oe-kbuild-all@lists.linux.dev>; Fri, 27 Mar 2026 16:11:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774627909; cv=none; b=No4xQKbJtCq1VA1Nf9Kl62k7BVin60c80zhMyIiJSGeADMr8aFVi1Gi/Gnrw0q+YdXs/tuEo4Bgm9Gq+QdckHhJmIaKZoVGALAS+VVHQn+P3iF5MfALaCCz/IKTbXSMxt4P3uOQQgvsYOBv7w9PYlsJuV3zF+zDAwQxPhncuD1k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774627909; c=relaxed/simple;
	bh=X5K9uNlhE3ZtXkmZuVW/61L8FyaECrzlyX4GDFQQV0Y=;
	h=Date:From:To:Cc:Subject:Message-ID; b=KLax6CcA6MajpHtsgamGf4Tl9OPurfY6CmLyPaOrmV9+NSQLlklrMcbLhJgzBG8gY5KN/Ckvvfo3pxvBYT0NRF/J/6z4upb4G0TASAKJKFj11uojOfwsk/dOz5BH4QZttzusSFrZVvCo7jFpmRQbALfeuPgsVwWnCEhSg9AIic8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ds23qI2g; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ds23qI2g"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774627908; x=1806163908;
  h=date:from:to:cc:subject:message-id;
  bh=X5K9uNlhE3ZtXkmZuVW/61L8FyaECrzlyX4GDFQQV0Y=;
  b=ds23qI2gZGVDUwB4/gk/HqsdEACFkNmpBVJoOpGk0dR7GXAk2zMcK+ol
   u2F+ZTt5fcvlYd3auvmzXDwfnGM/QbKsqj3vySwYFb4KSZZPNtRx87qw2
   AHiddvWOH3KTzqRoIXlG/VWcMZIAT1k7XpcgmmP31wGz1zYX7kgnUnelW
   HbrvDIRQ+q0vHJSb1xUWAYBE6+AV/rP7Cc1c6Q0wb1ilVPQxGVmZcVUc4
   dGcMdVARbIF6TTbSt+2Ju1pKXqImrImnzEMAABKlZVuSRLcJnobNno/+r
   hRyesMT/YIhXA3K3IpFjbC58wsNgukkJli/nDVu/toHSiUyzsoHTCghCz
   A==;
X-CSE-ConnectionGUID: os12j2l7RSmg8b8zl51VHA==
X-CSE-MsgGUID: r9i9ZcF4QXCoTMiSmJLZVA==
X-IronPort-AV: E=McAfee;i="6800,10657,11741"; a="75671560"
X-IronPort-AV: E=Sophos;i="6.23,144,1770624000"; 
   d="scan'208";a="75671560"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Mar 2026 09:11:48 -0700
X-CSE-ConnectionGUID: OnU3E9KDQ/G4wSA8VPTnAA==
X-CSE-MsgGUID: 0LG29zy1TOOHbNAqO5fglw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,144,1770624000"; 
   d="scan'208";a="224564612"
Received: from lkp-server01.sh.intel.com (HELO 3905d212be1b) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 27 Mar 2026 09:11:46 -0700
Received: from kbuild by 3905d212be1b with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w69mh-00000000ASX-2Pl5;
	Fri, 27 Mar 2026 16:11:43 +0000
Date: Sat, 28 Mar 2026 00:10:44 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android12-kiwi-5.10 218/218]
 kernel/events/ring_buffer.c:22:9: sparse: sparse: incorrect type in
 assignment (different base types)
Message-ID: <202603280050.bOJUNzJw-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android12-kiwi-5.10
head:   11d64ee60c8304d3468e4ced34971775c95e3429
commit: ef0398cf5cf150364839ffea0b0dd7c71edf2e62 [218/218] perf/ring_buffer: Allow the EPOLLRDNORM flag for poll
config: arm-randconfig-r121-20260325 (https://download.01.org/0day-ci/archive/20260328/202603280050.bOJUNzJw-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 13.4.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260328/202603280050.bOJUNzJw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603280050.bOJUNzJw-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> kernel/events/ring_buffer.c:22:9: sparse: sparse: incorrect type in assignment (different base types) @@     expected int volatile @@     got restricted __poll_t @@
   kernel/events/ring_buffer.c:22:9: sparse:     expected int volatile
   kernel/events/ring_buffer.c:22:9: sparse:     got restricted __poll_t
   kernel/events/ring_buffer.c:170:14: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/ring_buffer.c:170:14: sparse:    struct perf_buffer [noderef] __rcu *
   kernel/events/ring_buffer.c:170:14: sparse:    struct perf_buffer *
   kernel/events/ring_buffer.c:170:14: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/ring_buffer.c:170:14: sparse:    struct perf_buffer [noderef] __rcu *
   kernel/events/ring_buffer.c:170:14: sparse:    struct perf_buffer *
   kernel/events/ring_buffer.c:170:14: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/ring_buffer.c:170:14: sparse:    struct perf_buffer [noderef] __rcu *
   kernel/events/ring_buffer.c:170:14: sparse:    struct perf_buffer *

vim +22 kernel/events/ring_buffer.c

    19	
    20	static void perf_output_wakeup(struct perf_output_handle *handle)
    21	{
  > 22		atomic_set(&handle->rb->poll, EPOLLIN | EPOLLRDNORM);
    23	
    24		handle->event->pending_wakeup = 1;
    25		irq_work_queue(&handle->event->pending);
    26	}
    27	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
