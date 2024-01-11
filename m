Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A8724D590
	for <oe-kbuild-all@lists.linux.dev>; Thu, 11 Jan 2024 14:53:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="C9EKoedo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1704984799; x=1736520799;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=F0A6C1Sra3RdOkpc8uVOHPiU7EfESvaPMu017CUpCNg=;
  b=C9EKoedovWINyEyMJFiM1iYvhjPYpQQDQLGhsXyweA2uvRo0pMuu1MTB
   PHC0r+/qNr+GryxpkJ7MDa/3JGPpn4DWlVRjfMMDRBK906KKEBv/lWjyh
   2vvnsfhSB+yFaIC266Yagf0tHxm5BIM5T2XIWDH4MMn+ReQL5co9Ri5kk
   UDXzM3Cl+shClS1Olu6huFz3JOBjwNO+LzQ0ZkDhiIlsGhXnwYZS9IMfw
   uYiM/q9EoCPsCSTMx6+BPyvQuSShCbO3Fzx1E2DhrKjHP9AbqR+GatbSb
   AIX3jZqX9/IsHp++bYxxBwTUXy/wcIp+rTii+IDEAw5GPfxmCWs95qZVh
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10950"; a="5595983"
X-IronPort-AV: E=Sophos;i="6.04,186,1695711600"; 
   d="scan'208";a="5595983"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jan 2024 06:53:19 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10950"; a="732255545"
X-IronPort-AV: E=Sophos;i="6.04,186,1695711600"; 
   d="scan'208";a="732255545"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga003.jf.intel.com with ESMTP; 11 Jan 2024 06:53:17 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rNwQl-0008Nc-17;
	Thu, 11 Jan 2024 14:53:15 +0000
Date: Thu, 11 Jan 2024 22:53:09 +0800
From: kernel test robot <lkp@intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH] drm/doc/rfc: Remove Xe's pre-merge plan
Message-ID: <202401112223.WHZuZo0K-lkp@intel.com>
References: <20240110190427.63095-1-rodrigo.vivi@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240110190427.63095-1-rodrigo.vivi@intel.com>

Hi Rodrigo,

kernel test robot noticed the following build warnings:

[auto build test WARNING on drm-misc/drm-misc-next]
[also build test WARNING on drm/drm-next drm-exynos/exynos-drm-next drm-intel/for-linux-next next-20240111]
[cannot apply to drm-intel/for-linux-next-fixes drm-tip/drm-tip linus/master v6.7]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Rodrigo-Vivi/drm-doc-rfc-Remove-Xe-s-pre-merge-plan/20240111-030712
base:   git://anongit.freedesktop.org/drm/drm-misc drm-misc-next
patch link:    https://lore.kernel.org/r/20240110190427.63095-1-rodrigo.vivi%40intel.com
patch subject: [PATCH] drm/doc/rfc: Remove Xe's pre-merge plan
reproduce: (https://download.01.org/0day-ci/archive/20240111/202401112223.WHZuZo0K-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401112223.WHZuZo0K-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Documentation/gpu/rfc/index.rst:35: WARNING: toctree contains reference to nonexisting document 'gpu/rfc/xe'

vim +35 Documentation/gpu/rfc/index.rst

ece91c882dee5f Niranjana Vishwanathapura 2022-06-30  32  
ece91c882dee5f Niranjana Vishwanathapura 2022-06-30  33      i915_vm_bind.rst
40aeab044a352b Rodrigo Vivi              2023-04-19  34  
40aeab044a352b Rodrigo Vivi              2023-04-19 @35  .. toctree::

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
