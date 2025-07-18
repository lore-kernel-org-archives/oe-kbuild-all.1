Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 934FD1DF261
	for <oe-kbuild-all@lists.linux.dev>; Fri, 18 Jul 2025 17:19:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752859181; cv=none; b=j/9QoDeB5xVnEIC2LpjB9041AZThmjY4mEnvee8M5K4IY7VKSsaoUu7dAqhEp6pPIN1rGYPYK08nXFKyYdBku8hAYqMdrgyijZeZo0hstRXe2BULVDkCRXG30pZ4TC58duZxs6DKZzLovng2ubCcImomxN4A2mglwBXXGi3ygac=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752859181; c=relaxed/simple;
	bh=8r03fZg+8k+DNGYybwrnzbDbVCxZ8k9lrX0+EkMw0AU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Px475Kae6msqye0raAzS4F0VNgO/AfUSbHFucb5M6SGPxzS7TN51X22Uu81mSsbaI9BTpE37FLR3AM58iW1WYjiNkFts1qAv8D+fVCFGkdgBJLB9QiQbnK6mEcDr2CqqitlRG8BnwlwVrFiFf/5EW8s2lfCxRU7v9cIxdHnp79E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Jownf+r1; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Jownf+r1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752859179; x=1784395179;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=8r03fZg+8k+DNGYybwrnzbDbVCxZ8k9lrX0+EkMw0AU=;
  b=Jownf+r1Es7sXCNYyWkmTr5Y46oL+3mZ0285Ve/NeToRXbvNbVpjEgFL
   m9E87qp3QoA/4bdB/f9qnbteGGMlI/J086A2WTP1jET3CsKv2x6AjYOcb
   6KS4IYPBE66F92rqWn2zM2aEGWwco4niEkW3Bbe3BhL0/CfgDEnGH2/Ph
   fCM2ayteGD9I5LOLOjR7itT7a+aJrW+WeJh6mHHn4nlTWBLvuvCHIEKxx
   38qxXwSnOyAMLyUwldmSQxjDWRcdDzMIO3AJXN/L8cZPeIVF5qcJkXsCo
   wA3xSnLbWR02b9D/ahcTLZIzE+eofxG7UEKUxoRt1XjuazkrkS57ILnhb
   Q==;
X-CSE-ConnectionGUID: xeyc5n17QYK1p6Bgv3WTeA==
X-CSE-MsgGUID: p1FSpWV8QY61ePALJSSqgA==
X-IronPort-AV: E=McAfee;i="6800,10657,11496"; a="58823715"
X-IronPort-AV: E=Sophos;i="6.16,322,1744095600"; 
   d="scan'208";a="58823715"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jul 2025 10:19:39 -0700
X-CSE-ConnectionGUID: r/7iTOvtQV+YZQhg6f3KXA==
X-CSE-MsgGUID: hhxl+qW3Q8KrpnBRAzrNpA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,322,1744095600"; 
   d="scan'208";a="162136978"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 18 Jul 2025 10:19:38 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ucokB-000Euh-2T;
	Fri, 18 Jul 2025 17:19:35 +0000
Date: Sat, 19 Jul 2025 01:18:59 +0800
From: kernel test robot <lkp@intel.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [morimoto:string-helper-2025-07-18 13/157]
 arch/um/drivers/virtio_uml.c:1154:49: error: implicit declaration of
 function 'str_disabled_enabled'
Message-ID: <202507190158.5yDEuDgu-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/morimoto/linux string-helper-2025-07-18
head:   ea52943b017c3b53f3f8c9ff679ccfb8eaae222a
commit: d86137d04f7f273d2e266a7248b3745ebdfa44a3 [13/157] um: drivers: virtio: use string choices helper
config: um-randconfig-001-20250718 (https://download.01.org/0day-ci/archive/20250719/202507190158.5yDEuDgu-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14+deb12u1) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250719/202507190158.5yDEuDgu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507190158.5yDEuDgu-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from include/linux/device.h:15,
                    from include/linux/platform_device.h:13,
                    from arch/um/drivers/virtio_uml.c:25:
   arch/um/drivers/virtio_uml.c: In function 'virtio_uml_set_no_vq_suspend':
>> arch/um/drivers/virtio_uml.c:1154:49: error: implicit declaration of function 'str_disabled_enabled' [-Werror=implicit-function-declaration]
    1154 |         dev_info(&vdev->dev, "%s VQ suspend\n", str_disabled_enabled(no_vq_suspend));
         |                                                 ^~~~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:110:37: note: in definition of macro 'dev_printk_index_wrap'
     110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
         |                                     ^~~~~~~~~~~
   arch/um/drivers/virtio_uml.c:1154:9: note: in expansion of macro 'dev_info'
    1154 |         dev_info(&vdev->dev, "%s VQ suspend\n", str_disabled_enabled(no_vq_suspend));
         |         ^~~~~~~~
>> arch/um/drivers/virtio_uml.c:1154:30: warning: format '%s' expects argument of type 'char *', but argument 3 has type 'int' [-Wformat=]
    1154 |         dev_info(&vdev->dev, "%s VQ suspend\n", str_disabled_enabled(no_vq_suspend));
         |                              ^~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:110:30: note: in definition of macro 'dev_printk_index_wrap'
     110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
         |                              ^~~
   include/linux/dev_printk.h:160:58: note: in expansion of macro 'dev_fmt'
     160 |         dev_printk_index_wrap(_dev_info, KERN_INFO, dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                                                          ^~~~~~~
   arch/um/drivers/virtio_uml.c:1154:9: note: in expansion of macro 'dev_info'
    1154 |         dev_info(&vdev->dev, "%s VQ suspend\n", str_disabled_enabled(no_vq_suspend));
         |         ^~~~~~~~
   arch/um/drivers/virtio_uml.c:1154:32: note: format string is defined here
    1154 |         dev_info(&vdev->dev, "%s VQ suspend\n", str_disabled_enabled(no_vq_suspend));
         |                               ~^
         |                                |
         |                                char *
         |                               %d
   cc1: some warnings being treated as errors


vim +/str_disabled_enabled +1154 arch/um/drivers/virtio_uml.c

  1144	
  1145	void virtio_uml_set_no_vq_suspend(struct virtio_device *vdev,
  1146					  bool no_vq_suspend)
  1147	{
  1148		struct virtio_uml_device *vu_dev = to_virtio_uml_device(vdev);
  1149	
  1150		if (WARN_ON(vdev->config != &virtio_uml_config_ops))
  1151			return;
  1152	
  1153		vu_dev->no_vq_suspend = no_vq_suspend;
> 1154		dev_info(&vdev->dev, "%s VQ suspend\n", str_disabled_enabled(no_vq_suspend));
  1155	}
  1156	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
