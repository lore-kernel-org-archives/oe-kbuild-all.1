Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE47010F4
	for <oe-kbuild-all@lists.linux.dev>; Wed,  6 Sep 2023 08:48:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693990080; x=1725526080;
  h=date:from:to:cc:subject:message-id:mime-version:
   in-reply-to;
  bh=TggOEzEDryBlOwrPosesuTsOkoaDpapkrKi2Dhg7Ems=;
  b=TdOv/1Lfwe6e+qPSfah8z1CNIugYH/EkJ65nirXXkuXe/meM3tib/tpq
   /VDo6Aq0/mtEZ+NXaM0zRfynel6Waog4wkSBxEGqD/Dil+EIyNJAZ+xxJ
   hthoFjp32e4L0WxuqhO6hoNyfGAfbD6K8hE8LTdEz8RXOwlu4zciUX9wl
   NU5k7ELQFgGai71o481pRedql3Jvi6JSSWpCdtyd1c79Pwk+RNLE60igg
   SYIRIzQ2VtpoWlB/E6Yi9kpJObYP9szh26cf7iwcFkpkT5qfaDwYtfhIR
   vK3JeYE7mIRp3ixq+c759hvoTeYbs7qFODW96dpgLUWGwBRkzrr2TFEyz
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10824"; a="463391341"
X-IronPort-AV: E=Sophos;i="6.02,231,1688454000"; 
   d="scan'208";a="463391341"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Sep 2023 01:47:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10824"; a="915186176"
X-IronPort-AV: E=Sophos;i="6.02,231,1688454000"; 
   d="scan'208";a="915186176"
Received: from lkp-server02.sh.intel.com (HELO e0b2ea88afd5) ([10.239.97.151])
  by orsmga005.jf.intel.com with ESMTP; 06 Sep 2023 01:47:58 -0700
Received: from kbuild by e0b2ea88afd5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qdoCS-0002bm-2l;
	Wed, 06 Sep 2023 08:47:50 +0000
Date: Wed, 6 Sep 2023 16:45:43 +0800
From: kernel test robot <lkp@intel.com>
To: Hongchen Zhang <zhanghongchen@loongson.cn>
Cc: stable@vger.kernel.org, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v2] LoongArch: add p?d_leaf() definitions
Message-ID: <ZPg8Nx11gZQrXUKK@e5f9ae3a7ebf>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230906084351.3533-1-zhanghongchen@loongson.cn>

Hi,

Thanks for your patch.

FYI: kernel test robot notices the stable kernel rule is not satisfied.

The check is based on https://www.kernel.org/doc/html/latest/process/stable-kernel-rules.html/#option-1

Rule: add the tag "Cc: stable@vger.kernel.org" in the sign-off area to have the patch automatically included in the stable tree.
Subject: [PATCH v2] LoongArch: add p?d_leaf() definitions
Link: https://lore.kernel.org/stable/20230906084351.3533-1-zhanghongchen%40loongson.cn

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki



