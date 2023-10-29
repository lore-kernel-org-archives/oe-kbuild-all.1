Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 839FF17C7
	for <oe-kbuild-all@lists.linux.dev>; Sun, 29 Oct 2023 22:37:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mRBpJi9w"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698619077; x=1730155077;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=24wIVa6i22ugb0/vm+SLyq3IjvyByE5eOCVdn0dN4G0=;
  b=mRBpJi9w5zRJLjfHmQ73ErL/7kfcPfwXEsYhwAbzLYnTqxgC4k1+grYa
   GxtA/SrIn8LF1jIo1G52zCU6O6ElkQWYZILEdrFFckQBJxX3rtlv4No9P
   OFkhqvb1uSERtkqVYq4GlWEb0ZTw58z8G3jCfLC24wpcInotcjIQy8uwJ
   Dd8NNmmKgwhoOT9DiRWnnOtiU1j+E3C6luvHPGeQN5g0W3InlTUIUUOSk
   D5YN2v9Uwv4TJMDl8yp6m/Rmqcc0Gf6z9v98igS4EnGlPMXX/fOh5zfur
   g+9nw5x1BOuTLXeTbB1WX5bJgNptyXhzecJHihIapU1NRprOZZahVM8Cs
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10878"; a="367328657"
X-IronPort-AV: E=Sophos;i="6.03,261,1694761200"; 
   d="scan'208";a="367328657"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Oct 2023 15:37:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10878"; a="760104538"
X-IronPort-AV: E=Sophos;i="6.03,261,1694761200"; 
   d="scan'208";a="760104538"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 29 Oct 2023 15:37:54 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qxEPn-000CsF-2y;
	Sun, 29 Oct 2023 22:37:51 +0000
Date: Mon, 30 Oct 2023 06:37:05 +0800
From: kernel test robot <lkp@intel.com>
To: Matthew Brost <matthew.brost@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, intel-xe@lists.freedesktop.org,
	Rodrigo Vivi <rodrigo.vivi@intel.com>,
	Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
	linux-doc@vger.kernel.org
Subject: [drm-xe:drm-xe-next 964/1394] htmldocs:
 Documentation/gpu/drm-mm:552: ./drivers/gpu/drm/scheduler/sched_main.c:50:
 WARNING: Enumerated list ends without a blank line; unexpected unindent.
Message-ID: <202310300643.q7ugWxc9-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitlab.freedesktop.org/drm/xe/kernel.git drm-xe-next
head:   f24c46200dc8fad700f51106e678d68d38496860
commit: 0dceb0dede50613712a065d627443f4c182e6e2c [964/1394] drm/sched: Add DRM_SCHED_POLICY_SINGLE_ENTITY scheduling policy
reproduce: (https://download.01.org/0day-ci/archive/20231030/202310300643.q7ugWxc9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310300643.q7ugWxc9-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Documentation/gpu/drm-mm:552: ./drivers/gpu/drm/scheduler/sched_main.c:50: WARNING: Enumerated list ends without a blank line; unexpected unindent.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
