Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 887F121345
	for <oe-kbuild-all@lists.linux.dev>; Tue, 13 Aug 2024 11:04:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723547065; cv=none; b=e1DJjedE9X73II63BqgiEeKHY7yEm7/LMuFlO75KJ7L0Bb9sWyNCcMY2LtCur0aHipih2HGpe/BlER/LkYXg+MR6I5ua7yoWYaT+l1UpYrZDApuoFE9brQYoDWuWcBt0EgTC4Q5hSP8aWlJEEi4s2YQBsX0vH4u/SOPd3AMf1c8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723547065; c=relaxed/simple;
	bh=8TaRiZ2EeMGyY1kCBHmLbin11zdCmEm7XZ+KwckaCF4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aFU1bUVtvfuUi74VLK2bghro+MZspJtiGk8/X9QmvdYHNPWgjjKZowjmyEACpuXa1j07mW4Mv8EKEGaGUxd8FCGzRu8a4eQrmWZeUpUg2VQw0dXwAWs2+7aXqTFM2cqRxd/Fk4CSXnO/ei0cZS9wmSO60Ww2wnd95WHXmFI/I4U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kypDTB4h; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kypDTB4h"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723547063; x=1755083063;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=8TaRiZ2EeMGyY1kCBHmLbin11zdCmEm7XZ+KwckaCF4=;
  b=kypDTB4hbP2AWnV6Zfwr9c6+rkCMKibgcVR/g50cVoFys7ON4Ii10aG+
   C3P8/0deR/NBOcDPz+eZKib48G4KEhLfyCtOtIZlJaCrkxnoZBlu6/KkK
   jjEL26cB81JRiS95rGsaSCLJH0oZdgJuBXjaktLbQ91fSVNqPfd7tLbh5
   YXFFigXa1FcnKtZR+aIQvBDRhnS1gpoe+j1O1ksugcRu0r55Ia4bH+ebv
   Vlvsi1VyiE6cPPy0dLXfTiwFZd0TGD570t1VlpH78TiQ3e4EFQj+NxHgw
   bCug+ZcQWv4FovPHGEelv6m+H55a84pFwzpCm+slOCFh+wzswKQBvmEkg
   A==;
X-CSE-ConnectionGUID: 8TY0ZqhyTheYDvIbCMLIKA==
X-CSE-MsgGUID: 0QuHZMVyRa226dNL6vQ5/Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11162"; a="12982987"
X-IronPort-AV: E=Sophos;i="6.09,285,1716274800"; 
   d="scan'208";a="12982987"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Aug 2024 04:04:22 -0700
X-CSE-ConnectionGUID: CayKrEGCRr6KHCkCcao5RQ==
X-CSE-MsgGUID: N9dxt86OT8CPsiWgPRNpBw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,285,1716274800"; 
   d="scan'208";a="59204435"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 13 Aug 2024 04:04:20 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sdpK5-0000N8-1J;
	Tue, 13 Aug 2024 11:04:17 +0000
Date: Tue, 13 Aug 2024 19:03:47 +0800
From: kernel test robot <lkp@intel.com>
To: Masahiro Yamada <masahiroy@kernel.org>, linux-kbuild@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Masahiro Yamada <masahiroy@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas@fjasle.eu>
Subject: Re: [PATCH] modpost: simplify modpost_log()
Message-ID: <202408131830.qX4gs2P0-lkp@intel.com>
References: <20240812144542.2121342-1-masahiroy@kernel.org>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240812144542.2121342-1-masahiroy@kernel.org>

Hi Masahiro,

kernel test robot noticed the following build warnings:

[auto build test WARNING on masahiroy-kbuild/for-next]
[also build test WARNING on masahiroy-kbuild/fixes linus/master v6.11-rc3 next-20240813]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Masahiro-Yamada/modpost-simplify-modpost_log/20240813-003654
base:   https://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild.git for-next
patch link:    https://lore.kernel.org/r/20240812144542.2121342-1-masahiroy%40kernel.org
patch subject: [PATCH] modpost: simplify modpost_log()
config: loongarch-randconfig-001-20240813 (https://download.01.org/0day-ci/archive/20240813/202408131830.qX4gs2P0-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240813/202408131830.qX4gs2P0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408131830.qX4gs2P0-lkp@intel.com/

All warnings (new ones prefixed by >>, old ones prefixed by <<):

WARNING: modpost: missing MODULE_DESCRIPTION() in mm/kasan/kasan_test.o
WARNING: modpost: missing MODULE_DESCRIPTION() in mm/kasan/kasan_test_module.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/devfreq/governor_powersave.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/fpga/tests/fpga-mgr-test.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/fpga/tests/fpga-bridge-test.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/fpga/tests/fpga-region-test.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/fsi/fsi-core.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/fsi/fsi-master-hub.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/fsi/fsi-master-aspeed.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/fsi/fsi-master-gpio.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/fsi/fsi-scom.o
>> WARNING: modpost: "kvm_restore_lsx" [arch/loongarch/kvm/kvm.ko] undefined!
>> WARNING: modpost: "kvm_restore_lasx" [arch/loongarch/kvm/kvm.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
