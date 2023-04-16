Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BCCB2578
	for <oe-kbuild-all@lists.linux.dev>; Sun, 16 Apr 2023 15:45:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681659915; x=1713195915;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=6dy8I9a6ntUdwJMxrUGfQ51fPaweaMDYo1hIWubTuck=;
  b=kQfrDmaDVvGeY3xJtKfsf8EKVtGzgjoFf4ztlpsfAdffz/3lSTRcSxDW
   0bCyJO8F+Y7zWgKE3KkFSeLq7D9AUNbclGaacxofFpXRp/ilt+3N0qrWf
   o5FYR8PeokufOfVPctGk+6dGErdX1Dt93GY/Jv5oAQPiYXbUL+uoJEZWP
   tcqAZivT/rJzLHEO1i9Gpi/gqOfSZ86z4gCM43xsGNvTubqc1KRYvjSIA
   Ntg7YZfMx+ZAJnCaRDjt0VoCo8JbhWJ43+nBx1tjDnLyoxmtguQ05ynT7
   p/jzTrPR/zkgOv7kpK5Zku2nJhoLYvMRVT17QL+JXHTywaAsV/ZGJHXcT
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10682"; a="372619015"
X-IronPort-AV: E=Sophos;i="5.99,202,1677571200"; 
   d="scan'208";a="372619015"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2023 08:45:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10682"; a="801812804"
X-IronPort-AV: E=Sophos;i="5.99,202,1677571200"; 
   d="scan'208";a="801812804"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 16 Apr 2023 08:45:11 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1po4Yw-000bjv-1J;
	Sun, 16 Apr 2023 15:45:10 +0000
Date: Sun, 16 Apr 2023 23:44:37 +0800
From: kernel test robot <lkp@intel.com>
To: Mark Yacoub <markyacoub@chromium.org>, David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>
Cc: oe-kbuild-all@lists.linux.dev, seanpaul@chromium.org,
	suraj.kandpal@intel.com, dianders@chromium.org,
	dmitry.baryshkov@linaro.org, dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
	Jani Nikula <jani.nikula@intel.com>,
	Mark Yacoub <markyacoub@chromium.org>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v9 04/10] drm/hdcp: Expand HDCP helper library for
 enable/disable/check
Message-ID: <202304162307.7PcvuWlB-lkp@intel.com>
References: <20230411192134.508113-5-markyacoub@google.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230411192134.508113-5-markyacoub@google.com>

Hi Mark,

kernel test robot noticed the following build warnings:

[auto build test WARNING on drm-intel/for-linux-next-fixes]
[also build test WARNING on drm/drm-next linus/master v6.3-rc6]
[cannot apply to drm-tip/drm-tip drm-misc/drm-misc-next drm-intel/for-linux-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Mark-Yacoub/drm-hdcp-Add-drm_hdcp_atomic_check/20230412-032412
base:   git://anongit.freedesktop.org/drm-intel for-linux-next-fixes
patch link:    https://lore.kernel.org/r/20230411192134.508113-5-markyacoub%40google.com
patch subject: [PATCH v9 04/10] drm/hdcp: Expand HDCP helper library for enable/disable/check
config: i386-randconfig-s001 (https://download.01.org/0day-ci/archive/20230416/202304162307.7PcvuWlB-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce:
        # apt-get install sparse
        # sparse version: v0.6.4-39-gce1a6720-dirty
        # https://github.com/intel-lab-lkp/linux/commit/972a98f65fb56b3be4370593c2b81f1283750db7
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Mark-Yacoub/drm-hdcp-Add-drm_hdcp_atomic_check/20230412-032412
        git checkout 972a98f65fb56b3be4370593c2b81f1283750db7
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=i386 olddefconfig
        make W=1 C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=i386 SHELL=/bin/bash drivers/gpu/drm/display/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304162307.7PcvuWlB-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/gpu/drm/display/drm_hdcp_helper.c:675:5: sparse: sparse: symbol 'drm_hdcp_helper_hdcp1_capable_dp' was not declared. Should it be static?

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
