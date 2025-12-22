Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAE022147F9
	for <oe-kbuild-all@lists.linux.dev>; Mon, 22 Dec 2025 07:19:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766387958; cv=none; b=pz3KIeSsYw37ACrXIbg5Gm2jdr3cwVkRzHhlMxgH3P/5VMMuVtcPjLgGiIhRi5bmZPUzQcYhisISf8cw/20B5bNmduOHfxbCeLxs53trqJOPHENvSGpQHqVKWTajUMyAW4p59HyeYZjx/t9dHqtOvQNpf+4OKEguVlEZ5XEAglg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766387958; c=relaxed/simple;
	bh=nj3GcP7GnMc3RBbg6I7T3+gEfValgDJyw+TtUFVvYfA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=AobdxAcjw7L5lrCJULkNxBNdaL9c1oc4RS33f6WX4aJrkwH5y5XM6rkHMTb746Rzi3INf287O6xsP4ys7f9LGtkd1dXCaLkTylxWSYKpbOy1txLgerp5JJLzjkX5N/2Nj/eMXB21AdnTduFU8wDJUdYulC1yl3PLJ6aYZKJQQK4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bkIGKxT3; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bkIGKxT3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766387957; x=1797923957;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=nj3GcP7GnMc3RBbg6I7T3+gEfValgDJyw+TtUFVvYfA=;
  b=bkIGKxT3g8V8jNp/TY+DEBYZSyoHoFAuEsH1Ie3Ns4bbDiBA/N2FWJsh
   Z8tUdAqEOcDeh6NQQ2/dognPxQU8cHGtU65YHZaoUK5+8rRYMA5ydqBLP
   JF6HLCdfjGuegbaSFOugVvelwH9v5uf7C33M057ORP7+rIkZQci+/pgQt
   oYKU6LFHOiFoF+ZSficyR7sYe1kSyyZdwt7XDP7PnWWid8oUx2r28ojDN
   lkrZd+FPN/4pE1+6yFG+13Z4nBuGXr33X+9hZMAgrGjWI94zgIiTQBaFP
   euM4RWGiENJo8rsD9hI7i5JETM6r0SB2oiNiGHqZFWpEf0KfGIBIfVMYg
   Q==;
X-CSE-ConnectionGUID: W648YpGzRsK8Bl2oOangog==
X-CSE-MsgGUID: zVloJ1PJTlGUr2x/cCiZ6w==
X-IronPort-AV: E=McAfee;i="6800,10657,11649"; a="68394361"
X-IronPort-AV: E=Sophos;i="6.21,167,1763452800"; 
   d="scan'208";a="68394361"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Dec 2025 23:19:16 -0800
X-CSE-ConnectionGUID: qS2B++DlSB6ZiaVHV5oASg==
X-CSE-MsgGUID: Mp6W76oEQnGRZejS0z8ICg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,167,1763452800"; 
   d="scan'208";a="204520366"
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a) ([10.211.93.152])
  by orviesa005.jf.intel.com with ESMTP; 21 Dec 2025 23:19:16 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vXaCH-000000005Oi-0r9a;
	Mon, 22 Dec 2025 07:19:13 +0000
Date: Mon, 22 Dec 2025 08:19:00 +0100
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12-desktop 12/12] kismet: WARNING: unmet
 direct dependencies detected for NET_DEVLINK when selected by
 GKI_HIDDEN_NET_CONFIGS
Message-ID: <202512220826.8ywlnRnU-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android16-6.12-desktop
head:   2141da9e498139ac37a520b62dfdc77db8003146
commit: 9a034cb996202d13ff2bdf6d90539fdf47fe2eb5 [12/12] ANDROID: devlink: Select CONFIG_NET_DEVLINK in Kconfig.gki
config: x86_64-kismet-CONFIG_NET_DEVLINK-CONFIG_GKI_HIDDEN_NET_CONFIGS-0-0 (https://download.01.org/0day-ci/archive/20251222/202512220826.8ywlnRnU-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20251222/202512220826.8ywlnRnU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512220826.8ywlnRnU-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for NET_DEVLINK when selected by GKI_HIDDEN_NET_CONFIGS
   WARNING: unmet direct dependencies detected for NET_PTP_CLASSIFY
     Depends on [n]: NET [=n]
     Selected by [y]:
     - GKI_HIDDEN_NET_CONFIGS [=y]
   
   WARNING: unmet direct dependencies detected for PAGE_POOL
     Depends on [n]: NET [=n]
     Selected by [y]:
     - GKI_HIDDEN_NET_CONFIGS [=y]
   
   WARNING: unmet direct dependencies detected for NET_DEVLINK
     Depends on [n]: NET [=n]
     Selected by [y]:
     - GKI_HIDDEN_NET_CONFIGS [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
