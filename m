Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D38021863F
	for <oe-kbuild-all@lists.linux.dev>; Tue, 29 Oct 2024 02:07:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730167660; cv=none; b=WOnFeibAD2ty+qfYFoaMfAfY0X5kxtefYc5km3A90tgHuqdpA5kK/UKks0lxKGvq74xYjx0VmRWbEo6bfVeQR+My7X+nrpoxGfVAaMgTXrzTdcBL0r8BU6hsjhq3n4htUpUl5HJzukhqqkZk4mNi1pX5dlrhTTiEtLf3qseCqQk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730167660; c=relaxed/simple;
	bh=4edhd8Ri8EAXoR1qpX9c9Z2D/i/DIvxr3vKL30EJQKc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=HmsSUR13jwnPAkK55RmZS1kxJIkm4bRHmlXJVPCW7yLEzlDrfxraO/AYDfWgYWukb36I1q5JiotWzE1tbqPt4jzm9NoLDqHkecQXNyC5M4PhfX0cuu9lJD6pasq0BRcZenmnnyLk5KSq5vF8KsIQeVw6CYqSoaDSYEdMeyjcGw4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fcRzWojK; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fcRzWojK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730167659; x=1761703659;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=4edhd8Ri8EAXoR1qpX9c9Z2D/i/DIvxr3vKL30EJQKc=;
  b=fcRzWojKgIgD6QOVWWHkAA/W7c/iBJb9/J82r2gJaFfJMHCzWZiMqwsh
   hHyJ7TMU78iv+63ee9uS1+aeySSIJTcDSr4cAI4mqcFZtFAS7W/xbEozW
   4K6GHeGYXHSH/bwF545zA5SJl1QeY1hTE/1JT6BwNz8rsdCo26rJKoKYi
   j5VXXrxDHlAjUY75mfmBtmpKQlOiHhn1vh9bIPK9uLLRA1u/KeVWVyDex
   YJUzPRztoJzowqsBf0uXuO6YDdmhACqaVtPcZAUST9dlpsxLDN8Iw7w8C
   a37nCSAT2eWwigruo3UmNvvWh4Vt7hf/HcpQw98V9va8ooMoVY1zTJtjN
   w==;
X-CSE-ConnectionGUID: oWF1AGv8TpmnWr2huoLYxw==
X-CSE-MsgGUID: WuZ7K5aSS6y7glDAoK3Hrw==
X-IronPort-AV: E=McAfee;i="6700,10204,11239"; a="29220404"
X-IronPort-AV: E=Sophos;i="6.11,240,1725346800"; 
   d="scan'208";a="29220404"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Oct 2024 19:07:38 -0700
X-CSE-ConnectionGUID: ZuBF2SUyTsKNVh6RIq8otw==
X-CSE-MsgGUID: /u7UWeqkSayOJP7JV1lFSw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,240,1725346800"; 
   d="scan'208";a="82133688"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 28 Oct 2024 19:07:37 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t5bdv-000d8y-1B;
	Tue, 29 Oct 2024 02:07:35 +0000
Date: Tue, 29 Oct 2024 10:06:49 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android14-kiwi-6.1 1/2] ld.lld: error: undefined
 symbol: timekeeping_inject_sleeptime64
Message-ID: <202410291002.DJsZTzAO-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android14-kiwi-6.1
head:   331c2794594ccea1f59042924a62d67527b2b228
commit: bf3f6f01039f7f03350da296935c1f2e2fca7550 [1/2] ANDROID: virtio: virtio_pvclock: initial driver impl
config: i386-randconfig-053-20241029 (https://download.01.org/0day-ci/archive/20241029/202410291002.DJsZTzAO-lkp@intel.com/config)
compiler: clang version 19.1.2 (https://github.com/llvm/llvm-project 7ba7d8e2f7b6445b60679da826210cdde29eaf8b)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241029/202410291002.DJsZTzAO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410291002.DJsZTzAO-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: timekeeping_inject_sleeptime64
   >>> referenced by virtio_pvclock.c:77 (drivers/virtio/virtio_pvclock.c:77)
   >>>               drivers/virtio/virtio_pvclock.o:(update_suspend_time) in archive vmlinux.a

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for NETFILTER_FAMILY_BRIDGE
   Depends on [n]: NET [=y] && INET [=y] && NETFILTER [=n]
   Selected by [y]:
   - GKI_HIDDEN_NET_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for DRM_MIPI_DSI
   Depends on [n]: HAS_IOMEM [=y] && DRM [=n]
   Selected by [y]:
   - GKI_HIDDEN_DRM_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for CAN_RX_OFFLOAD
   Depends on [n]: NETDEVICES [=y] && CAN_DEV [=n] && CAN_NETLINK [=n]
   Selected by [y]:
   - GKI_HIDDEN_MCP251XFD_CONFIGS [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
